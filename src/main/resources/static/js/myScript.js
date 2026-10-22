document.addEventListener('DOMContentLoaded', () => {
    const editor = document.getElementById('code_snippet');
    const count = document.getElementById('code-count');
    const form = document.getElementById('snippet-form');

    if (editor && count) {
        const updateCount = () => {
            const lines = editor.value.length ? editor.value.split('\n').length : 0;
            count.textContent = `${editor.value.length.toLocaleString()} characters · ${lines} lines`;
        };
        editor.addEventListener('input', updateCount);
        updateCount();
        document.getElementById('clear-code')?.addEventListener('click', () => {
            editor.value = '';
            updateCount();
            editor.focus();
        });
    }

    const password = document.getElementById('password_field');
    document.getElementById('toggle-password')?.addEventListener('click', event => {
        const visible = password.type === 'password';
        password.type = visible ? 'text' : 'password';
        event.currentTarget.textContent = visible ? 'Hide' : 'Show';
        event.currentTarget.setAttribute('aria-label', visible ? 'Hide password' : 'Show password');
    });
    document.getElementById('generate-password')?.addEventListener('click', () => {
        const bytes = new Uint8Array(12);
        crypto.getRandomValues(bytes);
        password.value = Array.from(bytes, byte => byte.toString(16).padStart(2, '0')).join('');
        password.type = 'text';
    });
    document.getElementById('copy-link')?.addEventListener('click', async event => {
        const link = document.getElementById('uuid-link').href;
        try {
            await navigator.clipboard.writeText(link);
            event.currentTarget.textContent = 'Copied!';
            setTimeout(() => event.currentTarget.textContent = 'Copy link', 1800);
        } catch (_) {
            window.prompt('Copy your snippet link:', link);
        }
    });

    if (form) form.addEventListener('submit', event => event.preventDefault());
});

async function send(event) {
    event?.preventDefault();
    const editor = document.getElementById('code_snippet');
    const button = document.getElementById('send_snippet');
    const success = document.querySelector('.success-message');
    const danger = document.querySelector('.danger-message');
    const errorText = danger?.querySelector('.error-text') || danger?.querySelector('p');
    if (!editor || !editor.value.trim()) {
        editor?.focus();
        return;
    }

    const views = Number(document.getElementById('views_restriction')?.value || 0);
    const time = Number(document.getElementById('time_restriction')?.value || 0);
    if (!Number.isInteger(views) || views < 0 || !Number.isInteger(time) || time < 0) {
        danger.style.display = 'block';
        success.style.display = 'none';
        errorText.textContent = 'View and expiry limits must be whole numbers greater than or equal to zero.';
        return;
    }

    button.disabled = true;
    button.innerHTML = 'Creating…';
    danger.style.display = 'none';
    success.style.display = 'none';
    try {
        const response = await fetch('/api/code/new', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json; charset=utf-8' },
            body: JSON.stringify({
                code: editor.value,
                views,
                time,
                password: document.getElementById('password_field').value
            })
        });
        if (!response.ok) throw new Error(`${response.status} ${response.statusText}`);
        const result = await response.json();
        const snippetUrl = new URL(`/code/${encodeURIComponent(result.id)}`, window.location.origin).href;
        const link = document.getElementById('uuid-link');
        link.href = snippetUrl;
        link.textContent = snippetUrl;
        success.style.display = 'block';
        success.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
        document.getElementById('snippet-form').reset();
        document.getElementById('code-count').textContent = '0 characters · 0 lines';
    } catch (error) {
        danger.style.display = 'block';
        errorText.textContent = error.message || 'Could not create your snippet. Please try again.';
    } finally {
        button.disabled = false;
        button.innerHTML = 'Create snippet <span>→</span>';
    }
}

function check(event) {
    event?.preventDefault();
    const codeId = location.pathname.substring(6);
    const password = document.getElementById('password_field').value;
    const danger = document.querySelector('.danger-message');
    fetch('/api/code/password', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=utf-8' },
        body: JSON.stringify({ password, id: codeId })
    }).then(response => {
        if (response.ok) {
            const url = new URL(location.href);
            url.searchParams.set('password', password);
            location.href = url.href;
        } else {
            danger.style.display = 'block';
        }
    }).catch(() => { danger.style.display = 'block'; });
}

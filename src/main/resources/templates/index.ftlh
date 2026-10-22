<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#0b0d10">
    <title>New snippet · CodeDrop</title>
    <link rel="icon" type="image/png" href="/imgs/code-pngrepo-com.png">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <script src="/js/myScript.js" defer></script>
</head>
<body>
<nav class="site-nav">
    <div class="nav-inner">
        <a class="brand" href="/"><span class="brand-mark">&lt;/&gt;</span><span>code<span class="brand-accent">drop</span></span></a>
        <div class="nav-links"><a class="active" href="/">New snippet</a><a href="/code/latest">Explore</a><a href="/code/about">About</a></div>
        <a class="nav-cta" href="/code/latest">Browse snippets <span>↗</span></a>
    </div>
</nav>

<main class="page-shell editor-page">
    <section class="hero-copy">
        <div class="eyebrow"><span class="live-dot"></span> A little space for your code</div>
        <h1>Share code.<br><span>Keep it simple.</span></h1>
        <p>Drop in a snippet, set its lifetime, and send a link. No account needed.</p>
    </section>

    <section class="editor-card">
        <div class="editor-heading">
            <div><span class="section-kicker">NEW SNIPPET</span><h2>Start writing</h2></div>
            <span class="private-chip"><span></span> Private by default</span>
        </div>
        <form id="snippet-form" onsubmit="send(event)">
            <div class="code-editor">
                <div class="editor-toolbar"><div class="window-dots"><i></i><i></i><i></i></div><span>snippet.code</span><button type="button" class="text-button" id="clear-code">Clear</button></div>
                <textarea id="code_snippet" name="code" placeholder="// Your next great idea starts here…" required spellcheck="false" aria-label="Code snippet"></textarea>
                <div class="editor-footer"><span>Plain text · syntax preserved</span><span id="code-count">0 characters · 0 lines</span></div>
            </div>

            <div class="settings-grid">
                <div class="setting-card"><div class="setting-icon">◷</div><div class="setting-content"><label for="time_restriction">Expire after</label><p>Snippet lifetime in seconds. 0 means forever.</p><div class="input-wrap"><input type="number" min="0" step="1" id="time_restriction" value="0"><span>seconds</span></div></div></div>
                <div class="setting-card"><div class="setting-icon">#</div><div class="setting-content"><label for="views_restriction">View limit</label><p>Delete after this many views. 0 means unlimited.</p><div class="input-wrap"><input type="number" min="0" step="1" id="views_restriction" value="0"><span>views</span></div></div></div>
            </div>

            <div class="password-row">
                <div class="password-title"><span class="lock-icon">⌑</span><div><label for="password_field">Add a password <span class="optional">optional</span></label><p>Only people with the password can open your snippet.</p></div></div>
                <div class="password-controls"><input type="password" id="password_field" placeholder="Create a password" autocomplete="new-password"><button type="button" class="icon-button" id="toggle-password" aria-label="Show password">Show</button><button type="button" class="icon-button" id="generate-password">Generate</button></div>
            </div>

            <div class="alert alert-success success-message" role="status" style="display:none"><div class="success-title">Your snippet is ready</div><p>Save this link to get back to it.</p><div class="share-link"><a id="uuid-link" href="#"></a><button type="button" id="copy-link">Copy link</button></div></div>
            <div class="alert alert-danger danger-message" role="alert" style="display:none"><span class="error-text">Something went wrong. Please try again.</span></div>
            <div class="form-actions"><span class="form-hint"><span class="shield-icon">◆</span> No account. No clutter. Just code.</span><button id="send_snippet" type="submit" class="primary-button">Create snippet <span>→</span></button></div>
        </form>
    </section>
    <footer class="site-footer"><span>© CodeDrop</span><span>Made for the moments you need to share.</span><a href="/code/usage">How it works</a></footer>
</main>
</body>
</html>

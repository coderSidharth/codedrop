<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <script src="https://kit.fontawesome.com/224143ea2d.js" crossorigin="anonymous"></script>
    <script src="/js/myScript.js"></script>
    <title>Explore snippets · CodeDrop</title>
    <link rel="icon" type="image/png" href="/imgs/code-pngrepo-com.png">
</head>

<body>
<nav class="site-nav"><div class="nav-inner"><a class="brand" href="/"><span class="brand-mark">&lt;/&gt;</span><span>code<span class="brand-accent">drop</span></span></a><div class="nav-links"><a href="/">New snippet</a><a href="/code/latest">Explore</a><a href="/code/about">About</a></div><a class="nav-cta" href="/code/usage">How it works <span>↗</span></a></div></nav>

<div class="container p-3">
    <h1>Last 10 snippets</h1>
    <div class="list-group">
        <#list latestCodes as pieceOfCode>
            <a href="/code/${pieceOfCode.getId()}" target="_blank" class="list-group-item list-group-item-action flex-column align-items-start">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">${pieceOfCode.getId()}</h5>
                    <small class="text-muted"><span id="load_date">${pieceOfCode.date}</span></small>
                </div>
                <#if !pieceOfCode.getPassword()?has_content>
                    <p class="mb-1">${pieceOfCode.shortCode()}</p>
                <#else>
                    <p class="mb-1">This is an encrypted code snippet.</p>
                </#if>
            </a>
        </#list>
    </div>
</div>


<script src="/js/jquery.slim.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
</body>

</html>
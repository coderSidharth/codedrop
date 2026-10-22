<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="page-status" content="available"/>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <script src="https://kit.fontawesome.com/224143ea2d.js" crossorigin="anonymous"></script>
    <script src="/js/myScript.js"></script>
    <title>Snippet · CodeDrop</title>
    <link rel="icon" type="image/png" href="/imgs/code-pngrepo-com.png">

<#--    Special for this page-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/styles/default.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/highlight.min.js"></script>
    <script>
        hljs.initHighlightingOnLoad();
    </script>
</head>

<body>
<nav class="site-nav"><div class="nav-inner"><a class="brand" href="/"><span class="brand-mark">&lt;/&gt;</span><span>code<span class="brand-accent">drop</span></span></a><div class="nav-links"><a href="/">New snippet</a><a href="/code/latest">Explore</a><a href="/code/about">About</a></div><a class="nav-cta" href="/code/usage">How it works <span>↗</span></a></div></nav>

<div class="container p-3">
    <h1 class="display-6">${pieceOfCode.getId()}</h1>
    <span id="load_date">Date: ${dateDTO.getDateFormat()}, time: ${dateDTO.getTimeFormat()}</span>
    <#if pieceOfCode.isTimeLimit()>
        <br>
        <small>The code will be available for <u><span id="time_restriction">${pieceOfCode.getTime()}</span></u> seconds</small>
    </#if>
    <#if pieceOfCode.isViewsLimit()>
        <br>
        <#if pieceOfCode.getViews() == 0>
            <small><u><span id="views_restriction">No more views allowed</span></u></small>
        <#else>
            <small><u><span id="views_restriction">${pieceOfCode.getViews()}</span></u> more views allowed</small>
        </#if>
    </#if>
    <pre id="code_snippet" class="border border-dark p-0"><code>${pieceOfCode.getCode()}</code></pre>
</div>


<script src="/js/jquery.slim.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
</body>

</html>

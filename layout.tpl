<!DOCTYPE html>
<html lang="en">
{{ $architect = 'ARCHITEKT' }}
{{ if $gimme->language->code == 'en' }}
    {{ $architect = 'ARCHITECT' }}
    {{ assign "options" "language" }}
{{ else }}
    {{ assign "options" "root_level" }}
{{ /if }}

<head>
    <meta charset="utf-8" />
    <title>{{ block "title" }}ANDREA JAŠKOVÁ {{ $architect }}{{ /block }}</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="{{ uri static_file="static/bootstrap/css/bootstrap.min.css" }}" />
    <link rel="stylesheet" type="text/css" href="{{ uri static_file="static/bootstrap/css/bootstrap-responsive.min.css" }}" />
    <link rel="stylesheet" type="text/css" href="{{ uri static_file="static/style.css" }}" />
</head>

<body class="{{ $gimme->section->url_name|escape }} projects">

<div class="container-fluid">
    <header class="row-fluid">
        
        {{ if $gimme->section->defined }}
        <a href="{{ uri options=$options }}" rel="home" class="logo" title="ANDREA JAŠKOVÁ {{ $architect }}">ANDREA JAŠKOVÁ<br /><strong>{{ $architect }}</strong></a>
        {{ else }}
        <h1 class="logo">ANDREA JAŠKOVÁ<br /><strong>{{ $architect }}</strong></h1>
        {{ /if }}

        <nav>
            <div id="select-lang">
                {{ if $gimme->language->code == 'cz' }}
                <a href="/en/" rel="home" lang="en" class="lang" title="switch to english">english</a>
                {{ else }}
                <a href="/" rel="home" lang="cs" class="lang" title="zobrazit česky">česky</a>
                {{ /if }}
            </div>

            <ul>
                {{ $sectionName = $gimme->section->name }}
                {{ list_sections constraints="number not 4 number not 2" }}{{* ignore frontpage news *}}
                <li>
                    {{ if $gimme->section->name == $sectionName && !$gimme->article->defined && false }}
                    <strong>{{ $gimme->section->name }}</strong>
                    {{ else }}
                    <a href="{{ uri options="section" }}" title="{{ $gimme->section->name }}">{{ $gimme->section->name }}</a>
                    {{ /if }}
                </li>
                {{ /list_sections }}
            </ul>
        </nav>
    </header>
    <div class="row-fluid">
        {{ block "content" }}{{ /block }}
    </div>
    <footer class="row-fluid">
        <div class="logo">ANDREA JAŠKOVÁ<br /><strong>{{ $architect }}</strong></div>

        <div class="pull-right">
            <a rel="license" class="license" href="http://creativecommons.org/licenses/by-sa/3.0/cz/" title="creative commons license">(CC)</a>
            <a href="http://newscoop.sourcefabric.org" title="Powered by Newscoop">Newscoop</a>
        </div>

        <ul class="social">{{ strip }}
            <li><a href="https://www.facebook.com/andreajaskovaarchitekt" title="Andrea Jašková {{ $architect|lower }} @ Facebook" target="_blank" class="icon">{{ include file="./static/facebook.svg" }}</a></li>
            <li><a href="https://plus.google.com/116970202686181911525" title="Andrea Jašková {{ $architect|lower }} @ Google+" target="_blank" class="icon">{{ include file="./static/google.svg" }}</a></li>
        {{ /strip }}</ul>
    </footer>
</div>

{{ if $smarty.server.HTTP_HOST !== 'kubna.local' }}
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-12570962-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
{{ /if }}

</body>
</html>

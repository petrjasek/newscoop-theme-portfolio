<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>{{ block "title" }}ANDREA JAŠKOVÁ ARCHITEKT{{ /block }}</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="{{ uri static_file="static/bootstrap/css/bootstrap.min.css" }}" />
    <link rel="stylesheet" type="text/css" href="{{ uri static_file="static/bootstrap/css/bootstrap-responsive.min.css" }}" />
    <link rel="stylesheet" type="text/css" href="{{ uri static_file="static/style.css" }}" />
</head>
<body class="{{ $gimme->section->url_name|escape }} projects">

<div class="container-fluid">
    <header class="row-fluid">
        <div class="span3">
            {{ $architect = 'ARCHITEKT' }}
            {{ if $gimme->language->code == 'en' }}
                {{ $architect = 'ARCHITECT' }}
                {{ assign "options" "language" }}
            {{ else }}
                {{ assign "options" "root_level" }}
            {{ /if }}

            {{ if $gimme->section->defined }}
            <a href="{{ uri options=$options }}" id="logo" title="ANDREA JAŠKOVÁ ARCHITEKT">ANDREA JAŠKOVÁ<br /><strong>{{ $architect }}</strong></a>
            {{ else }}
            <h1 id="logo">ANDREA JAŠKOVÁ<br /><strong>{{ $architect }}</strong></h1>
            {{ /if }}
        </div>
        <nav class="span9">
            <ul>
                <li>
                    {{ if $gimme->section->defined }}<a href="{{ uri options=$options }}">{{ else }}<strong>{{ /if }}
                        {{ if $gimme->language->code == 'en' }}News{{ else }}Aktuality{{ /if }}
                    {{ if $gimme->section->defined }}</a>{{ else }}</strong>{{ /if }}
                </li>
                {{ $sectionName = $gimme->section->name }}
                {{ list_sections constraints="number not 3 number not 4" }}{{* ignore frontpage news *}}
                <li>
                    {{ if $gimme->section->name == $sectionName && !$gimme->article->defined }}
                    <strong>{{ $gimme->section->name }}</strong>
                    {{ else }}
                    <a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a>
                    {{ /if }}
                </li>
                {{ /list_sections }}
            </ul>

            <div id="select-lang">
                {{ if $gimme->language->code == 'cz' }}
                <a href="/en/" class="lang">ENGLISH</a>
                {{ else }}
                <a href="/" class="lang">ČESKY</a>
                {{ /if }}
            </div>

            <ul class="social pull-right">
                <li><a href="https://www.facebook.com/andreajaskovaarchitekt" title="Facebook Andrea Jašková Architekt" target="_blank" class="icon">{{ include file="./static/facebook.svg" }}</a></li>
                <li><a href="https://plus.google.com/116970202686181911525" title="Google+ Andrea Jašková" target="_blank" class="icon">{{ include file="./static/google.svg" }}</a></li>
            </ul>
        </nav>
    </header>
    <div class="row-fluid">
        {{ block "content" }}{{ /block }}
    </div>
    <footer class="row-fluid">
        <div class="pull-right">
            <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/cz/"><img alt="Licence Creative Commons" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/cz/80x15.png" /></a> <span class="newscoop">| Powered by <a href="http://newscoop.sourcefabric.org" title="Powered by Newscoop">Newscoop</a></span>
        </div>
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

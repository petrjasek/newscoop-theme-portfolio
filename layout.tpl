<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>{{ block title }}ANDREA KUBNA ARCHITEKT{{ /block }} @ kubna.cz</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="{{ uri static_file="static/bootstrap/css/bootstrap.min.css" }}" />
    <link rel="stylesheet" type="text/css" href="{{ uri static_file="static/bootstrap/css/bootstrap-responsive.min.css" }}" />
    <link rel="stylesheet" type="text/css" href="{{ uri static_file="static/fonts/stylesheet.css" }}" />
    <link rel="stylesheet" type="text/css" href="{{ uri static_file="static/style.css" }}" />
</head>
<body class="{{ $gimme->section->url_name|escape }}">
    <div class="container-fluid">
        <header class="row-fluid">
            <div class="span3">
                {{ capture name="logo" }}
                <img src="{{ uri static_file="static/logo.png" }}" width="126" height="43" alt="ANDREA KUBNA ARCHITEKT" />
                {{ /capture }}
                {{ if $gimme->section->defined }}
                <a href="{{ uri options="root_level" }}" id="logo" title="ANDREA KUBNA ARCHITEKT">{{ $smarty.capture.logo }}</a>
                {{ else }}
                <h1 id="logo">{{ $smarty.capture.logo }}</h1>
                {{ /if }}
            </div>
            <nav class="span8">
                <ul>
                    {{ $sectionName = $gimme->section->name }}
                    {{ list_sections constraints="number not 2 number not 3 number not 4" }}{{* ignore frontpage news *}}
                    <li>
                        {{ if $gimme->section->name == $sectionName && !$gimme->article->defined }}
                        <strong>{{ $gimme->section->name }}</strong>
                        {{ else }}
                        <a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a>
                        {{ /if }}
                    </li>
                    {{ /list_sections }}
                </ul>
            </nav>
        </header>
        <div class="row-fluid">
            {{ block content }}{{ /block }}
        </div>
    </div>

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

</body>
</html>

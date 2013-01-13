<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>{{ block title }}Andrea Kubná{{ /block }} | kubna.cz</title>

    <link rel="stylesheet" type="text/css" href="{{ uri static_file="static/bootstrap/css/bootstrap.min.css" }}" />
    <link rel="stylesheet" type="text/css" href="{{ uri static_file="static/fonts/stylesheet.css" }}" />
    <link rel="stylesheet" type="text/css" href="{{ uri static_file="static/style.css" }}" />
</head>
<body>
    <div class="container-fluid">
        <header class="row-fluid">
            <div class="span3">
                <a href="/" id="logo">ANDREA KUBNA<br /><span>ARCHITEKT</span></a>
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
</body>
</html>

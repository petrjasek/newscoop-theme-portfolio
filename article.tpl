{{ extends file="./layout.tpl" }}

{{ block title }}{{ $gimme->article->title|escape }}{{ /block }}

{{ block content }}
<article class="span3">
    <h1>{{ $gimme->article->title|escape }}</h1>

    <dl class="meta">
        <dt>{{ $gimme->article->typ|escape }}</dt><dd>{{ $gimme->article->rok|escape }}</dd>

        {{ if $gimme->article->lokalita }}
        <dt>LOKALITA</dt><dd>{{ $gimme->article->lokalita|escape }}</dd>
        {{ /if }}

        {{ if $gimme->article->klient }}
        <dt>KLIENT</dt><dd>{{ $gimme->article->klient|escape }}</dd>
        {{ /if }}

        {{ if $gimme->article->autori }}
        <dt>AUTOŘI</dt><dd>{{ $gimme->article->autori }}</dd>
        {{ /if }}

        {{ if $gimme->article->spoluprace }}
        <dt>SPOLUPRÁCE</dt><dd>{{ $gimme->article->spoluprace|escape }}</dd>
        {{ /if }}
    </dl>

    <div class="lead">
        {{ $gimme->article->lead }}
    </div>

    <div class="body">
        {{ $gimme->article->body }}
    </div>
</article>
<aside class="images span8">
    {{ list_article_images }}
    <img src="{{ $gimme->image->imageurl }}" alt="{{ $gimme->image->caption }}" />
    {{ /list_article_images }}
</aside>
{{ /block }}

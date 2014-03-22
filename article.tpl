{{ extends file="./layout.tpl" }}

{{ block title }}{{ $gimme->article->title|escape }}{{ /block }}

{{ block content }}
<article class="span3" itemscope itemtype="http://schema.org/CreativeWork">
    <h1 itemprop="name">{{ $gimme->article->title|escape }}</h1>

    <dl class="meta">
        <dt>{{ $gimme->article->typ|escape }}</dt><dd>{{ $gimme->article->rok|escape }}</dd>

        {{ if $gimme->article->lokalita }}
        <dt>LOKALITA</dt><dd>{{ $gimme->article->lokalita|escape }}</dd>
        {{ /if }}

        {{ if $gimme->article->klient }}
        <dt>KLIENT</dt><dd>{{ $gimme->article->klient|escape }}</dd>
        {{ /if }}

        {{ if $gimme->article->autori }}
        <dt>AUTOŘI</dt><dd itemprop="author">{{ $gimme->article->autori }}</dd>
        {{ /if }}

        {{ if $gimme->article->spoluprace }}
        <dt>SPOLUPRÁCE</dt><dd itemprop="contributor">{{ $gimme->article->spoluprace|escape }}</dd>
        {{ /if }}
    </dl>

    <div class="lead" itemprop="description">
        {{ $gimme->article->lead }}
    </div>

    {{ list_related_articles }}
        {{ if $gimme->current_list->at_beginning }}
        <ul class="references">
        {{ /if }}

        <li class="{{ $gimme->article->type_name|escape }}">{{ strip }}
            {{ if $gimme->article->type_name == 'publikace' }}
            {{ list_article_attachments }}
            <a href="{{ uri options="articleattachment" }}" type="{{ $gimme->attachment->mime_type }}" title="{{ if $gimme->language->code == 'en' }}Download{{ else }}Stáhnout{{ /if }} {{ $gimme->article->title|escape }}">
            {{ /list_article_attachments }}
            {{ image rendition="publication" }}<img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" alt="{{ $gimme->article->title|escape }}"{{ if !$gimme->article->has_attachments }} title="{{ $gimme->article->title|escape }}"{{ /if }} />
            {{ /image }}
            {{ if $gimme->article->has_attachments }}</a>{{ /if }}

            {{ else }}
            {{ if $gimme->article->odkaz }}<a href="{{ $gimme->article->odkaz }}">{{ /if }}
            {{ list_article_images }}
            <img src="{{ $gimme->article->image->imageurl }}" alt="" />
            {{ /list_article_images }}
            {{ $gimme->article->title|escape }}
            {{ /if }}
            {{ if $gimme->article->odkaz }}</a>{{ /if }}
        {{ /strip }}</li>

        {{ if $gimme->current_list->at_end }}
        </ul>
        {{ /if }}
    {{ /list_related_articles }}

    <div class="body" itemprop="text">
        {{ $gimme->article->body }}
    </div>
</article>
<aside class="images span8">
    {{ list_article_images }}
    <img src="{{ $gimme->image->imageurl }}" alt="{{ $gimme->image->caption }}" />
    {{ /list_article_images }}
</aside>
{{ /block }}

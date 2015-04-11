{{ extends file="./layout.tpl" }}

{{ block title }}{{ $gimme->article->title|escape }}{{ /block }}

{{ block content }}

{{ if $gimme->article->type_name === 'project' }}
    {{ include file="./project.tpl" }}

{{ else }}
<article itemscope itemtype="http://schema.org/Blog">

<div class="panel">
    {{ list_article_images length="1" }}
    <figure class="top">
        <img src="{{ $gimme->image->imageurl }}" alt="{{ $gimme->image->caption }}" />
    </figure>
    {{ /list_article_images }}

    <div class="content">
        <h1 itemprop="name">{{ $gimme->article->title|escape }}</h1>

        {{ include file="./share_article.tpl" }}

        <div class="abs" itemprop="description">
            {{ $gimme->article->abs }}
        </div>
    </div>
</div>

<div class="body" itemprop="text">
    {{ $gimme->article->body }}
</div>

{{ list_article_images }}{{* list all but 1st image *}}
{{ if !$gimme->current_list->at_beginning }}
<figure>
    <img src="{{ url options="image width 1200" }}" alt="{{ $gimme->image->caption }}" />
    <a href="https://pinterest.com/pin/create/button/?url={{ include file="self_url.tpl" }}&media={{ urlencode($gimme->image->imageurl) }}" target="_blank" class="icon">{{ include file="./static/pinterest.svg" }}</a>
</figure>
{{ /if }}
{{ /list_article_images }}

</article>
{{ /if }}
{{ /block }}

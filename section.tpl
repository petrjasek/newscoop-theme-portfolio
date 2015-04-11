{{ extends file="./layout.tpl" }}

{{ block "title" }}{{ $gimme->section->name }}{{ /block }}

{{ block "content" }}

{{ if in_array($gimme->section->url_name, array('kontakt', 'contact')) }}
{{ list_articles }}
<aside class="span3">
    {{ $gimme->article->adresa }}
</aside>
<article class="span8">
    {{ $gimme->article->cv }}
</article>
{{ /list_articles }}

{{ else if in_array($gimme->section->url_name, array('reference')) }}{{* Reference *}}
<div class="row-fluid">
    <section class="span5 offset3 pubs">
    {{ list_articles order="bySectionOrder asc" constraints="type is publikace" }}
    <article class="{{ $gimme->article->type_name|escape }}">
        {{ include file="refs.tpl" }}
    </article>
    {{ /list_articles }}
    </section>
</div>

<div class="row-fluid">
    <section class="span5 offset3 refs">
    {{ list_articles order="bySectionOrder asc" constraints="type is reference" }}
    <article class="{{ $gimme->article->type_name|escape }}">
        {{ include file="refs.tpl" }}
    </article>
    {{ /list_articles }}
    </section>
</div>

{{ elseif in_array($gimme->section->url_name, array('projekty', 'projects')) }}

{{ include file="./projects_list.tpl" len=1000 }}

{{ elseif in_array($gimme->section->url_name, array('projekty', 'projects')) }}
<div class="row-fluid info">
    {{ list_articles order="bySectionOrder asc" }}
    <aside class="span3">
        {{ $gimme->article->adresa }}
    </aside>
    <article class="span8">
        {{ $gimme->article->cv }}
    </article>
    {{ /list_articles }}
</div>

{{ elseif $gimme->section->url_name === 'blog' }}
<div class="row-fluid blog">
    {{ list_articles order="bySectionOrder asc" }}
    <article itemscope itemtype="http://schema.org/Blog">
        <a href="{{ uri options="article" }}" title="{{ $gimme->article->title|escape }}" itemprop="url">
            <div class="panel">
                {{ list_article_images length=1 }}
                <figure>
                    <img src="{{ $gimme->image->imageurl }}" alt="" />
                </figure>
                {{ /list_article_images }}
                
                <div class="content">
                    <h2 itemprop="name">{{ $gimme->article->title|escape }}</h2>
                    <div class="abs">{{ $gimme->article->abs }}</div>
                </div>
            </div>
        </a>
    </article>
    {{ /list_articles }}
</div>

{{ else }}
    {{ list_articles order="bySecionOrder asc" }}
    <section class="info">
        {{ list_article_images length=1 }}
        <figure>
            <img src="{{ $gimme->image->imageurl }}" alt="" />
            <div class="lightbox"></div>
        </figure>
        {{ /list_article_images }}
        <div class="content">
            <h2>{{ $gimme->article->title|escape }}</h2>
            <div class="body">{{ $gimme->article->body }}</div>
        </div>
    </section>
    {{ /list_articles }}

{{ /if }}

{{ /block }}

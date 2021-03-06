<article itemscope itemtype="http://schema.org/CreativeWork" class="project">
    <div class="panel">
        {{ image rendition="project" }}
        <figure>
            <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" alt="{{ $gimme->article->title|escape }}" />
        </figure>
        {{ /image }}
        <div class="content">
            <h1 itemprop="name">{{ $gimme->article->title|escape }}</h1>
            <ul class="share">
                <li><a href="https://www.facebook.com/sharer/sharer.php?u={{ include file="self_url.tpl" }}" target="_blank" class="icon">{{ include file="./static/facebook.svg" }}</a></li>
                <li><a href="https://plus.google.com/share?url={{ include file="self_url.tpl" }}" target="_blank" class="icon">{{ include file="./static/google.svg" }}</a></li>
                {{ list_article_images length=1 }}
                <li><a href="https://pinterest.com/pin/create/button/?url={{ include file="self_url.tpl" }}&media={{ urlencode($gimme->image->imageurl) }}" target="_blank" class="icon">{{ include file="./static/pinterest.svg" }}</a></li>
                {{ /list_article_images }}
            </ul>
        </div>
    </div>

    <div class="content">
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
                {{ include file='refs.tpl' }}
            {{ /strip }}</li>

            {{ if $gimme->current_list->at_end }}
            </ul>
            {{ /if }}
        {{ /list_related_articles }}

        <div class="body" itemprop="text">
            {{ $gimme->article->body }}
        </div>
    </div>

    <div class="images">
        {{ list_article_images }}
        <figure>
            <img src="{{ url options="image width 1200" }}" alt="{{ $gimme->image->caption }}" />
            <a href="https://pinterest.com/pin/create/button/?url={{ include file="self_url.tpl" }}&media={{ urlencode($gimme->image->imageurl) }}" target="_blank" class="icon">{{ include file="./static/pinterest.svg" }}</a>
        </figure>
        {{ /list_article_images }}
    </div>
</article>

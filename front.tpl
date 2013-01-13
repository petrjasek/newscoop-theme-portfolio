{{ extends file="./layout.tpl" }}

{{ block content }}
<section class="span11">
    <ul class="featured">
        {{ list_playlist_articles name="featured" }}
        <li><a href="{{ uri options="article" }}" title="{{ $gimme->article->title|escape }}">
            {{ image rendition="front" }}
            <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" alt="" />
            {{ /image }}
        </a></li>
        {{ /list_playlist_articles }}
    </ul>
</section>
{{ /block }}

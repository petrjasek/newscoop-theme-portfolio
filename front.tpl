{{ extends file="./layout.tpl" }}

{{ block content }}
<section>
    {{ set_section number=4 }}
    {{ list_articles order="bySectionOrder asc" }}
    {{ if $gimme->current_list->at_beginning }}
    <ul>
    {{ /if }}
        <li><article class="featured" itemscope itemtype="http://schem.org/CreativeWork">
            {{ image rendition="front" }}
            <figure>
                <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" alt="" itemprop="image" />
            </figure>
            {{ /image }}
            <h2 itemprop="name">{{ $gimme->article->title|escape }}</h2>
            <div class="info" itemprop="description">{{ $gimme->article->lead }}</div>
        </article></li>
    {{ if $gimme->current_list->at_end }}
    </ul>
    {{ /if }}
    {{ /list_articles }}
</section>
{{ /block }}

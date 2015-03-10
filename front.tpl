{{ extends file="./layout.tpl" }}

{{ block content }}

<section class="featured">{{ strip }}
    {{ set_section number=1 }}
    {{ list_articles order="bySectionOrder asc" length=18 columns=3 }}
    <article class="featured col-{{ $gimme->current_list->column }}" itemscope itemtype="http://schema.org/CreativeWork">
        <a href="{{ uri options="article" }}" itemprop="url">
            {{ image rendition="front" }}
            <figure>
                <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" alt="" itemprop="image" />
            </figure>
            {{ /image }}
            <div class="lightbox"></div>
            <h2 itemprop="name">{{ $gimme->article->title|escape }}</h2>
        </a>
    </article>
    {{ /list_articles }}
{{ /strip }}</section>
{{ /block }}

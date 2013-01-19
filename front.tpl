{{ extends file="./layout.tpl" }}

{{ block content }}
{{ set_section number=4 }}
{{ list_articles order="bySectionOrder asc" }}
{{ if $gimme->current_list->at_beginning }}
<section>
    <ul class="featured">
{{ /if }}
        <li>
            {{ image rendition="front" }}
            <figure>
                <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" alt="" />
            </figure>
            {{ /image }}
            <h2>{{ $gimme->article->title|escape }}</h2>
            <div class="lead">{{ $gimme->article->lead }}</div>
        </li>
    {{ if $gimme->current_list->at_end }}
    </ul>
</section>
{{ /if }}
{{ /list_articles }}
{{ /block }}

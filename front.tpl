{{ extends file="./layout.tpl" }}

{{ block content }}
<section class="featured">
    {{ set_section number=4 }}
    {{ list_articles order="bySectionOrder asc" }}
    {{ if $gimme->current_list->at_beginning }}
    <ul>
    {{ /if }}
        <li><article class="featured" itemscope itemtype="http://schem.org/CreativeWork">
            <span class="date" title="{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}">{{ $gimme->article->publish_date|camp_date_format:"%m" }}<span>{{ $gimme->article->publish_date|camp_date_format:"%y" }}</span></span>
            {{ image rendition="front" }}
            <figure>{{ strip }}
                {{ $closeLink = false }}
                {{ list_related_articles length=1 }}
                    {{ $closeLink = true }}
                <a href="{{ uri options="article" }}" title="{{ $gimme->article->title|escape }}">
                {{ /list_related_articles }}
                <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" alt="" itemprop="image" />
                {{ if $closeLink }}</a>{{ /if }}
            {{ /strip }}</figure>
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

{{ extends file="./layout.tpl" }}

{{ block "title" }}{{ $gimme->section->name }}{{ /block }}

{{ block "content" }}

{{ if $gimme->section->url_name == "kontakt" }}
{{ list_articles }}
<aside class="span3">
    {{ $gimme->article->adresa }}
</aside>
<article class="span8">
    {{ $gimme->article->cv }}
</article>
{{ /list_articles }}

{{ else }}
<aside>
    {{ $filters = ['t' => ['projekt', 'realizace', 'soutěž'], 'y' => range(date('Y'), 2009)] }}
    {{ foreach $filters as $param => $options }}
        {{ $query = $smarty.get }}
        {{ $query.$param = null }}
        {{ $query = array_filter($query) }}
    <ul class="filter">
        <li>
            {{ if !empty($smarty.get.$param) }}
            <a href="?{{ http_build_query($query) }}">*</a>
            {{ else }}
            <strong>*</strong>
            {{ /if }}
        </li>
        {{ foreach $options as $option }}
            {{ $query.$param = $option }}
        <li>
            {{ if !empty($smarty.get.$param) && $smarty.get.$param == $option }}
            <strong>{{ $option }}</strong>
            {{ else }}
            <a href="?{{ http_build_query($query) }}">{{ $option }}</a>
            {{ /if }}
        </li>
        {{ /foreach }}
    </ul>
    {{ /foreach }}
</aside>
<section>
    <ul>
        {{ $where = array() }}

        {{ if !empty($smarty.get.y) && in_array($smarty.get.y, $filters.y) }}
            {{ $where[] = sprintf("project rok is %s", $smarty.get.y) }}
        {{ /if }}

        {{ if !empty($smarty.get.t) && in_array($smarty.get.t, $filters.t ) }}
            {{ $where[] = sprintf("project typ is %s", $smarty.get.t) }}
        {{ /if }}

        {{ list_articles order="bySectionOrder asc" constraints=implode(' ', $where) }}
        <li>
            <article class="project" itemscope itemtype="http://schema.org/CreativeWork">
                <a href="{{ uri options="article" }}" title="{{ $gimme->article->title|escape }}" itemprop="url">
                    {{ image rendition="section" }}
                    <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" alt="" itemprop="image" />
                    {{ /image }}
                    <h2 itemprop="name">{{ $gimme->article->title|escape }}</h3>
                    <div class="info"><p itemprop="description">{{ $gimme->article->typ|escape }} {{ $gimme->article->rok|escape }}</p></div>
                </a>
            </article>
        </li>
        {{ /list_articles }}
    </ul>
</section>
{{ /if }}

{{ /block }}

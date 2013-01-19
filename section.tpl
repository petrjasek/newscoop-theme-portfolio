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
<aside class="pull-right">
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
    <ul class="projects">
        {{ $where = array() }}

        {{ if !empty($smarty.get.y) && in_array($smarty.get.y, $filters.y) }}
            {{ $where[] = sprintf("project rok is %s", $smarty.get.y) }}
        {{ /if }}

        {{ if !empty($smarty.get.t) && in_array($smarty.get.t, $filters.t ) }}
            {{ $where[] = sprintf("project typ is %s", $smarty.get.t) }}
        {{ /if }}

        {{ list_articles order="bySectionOrder asc" constraints=implode(' ', $where) }}
        <li><a href="{{ uri options="article" }}" title="{{ $gimme->article->title|escape }}">
            {{ image rendition="section" }}
            <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" alt="" />
            {{ /image }}
            <h3>{{ $gimme->article->title }}</h3>
            <p>{{ $gimme->article->typ }} {{ $gimme->article->rok }}</p>
        </a></li>
        {{ /list_articles }}
    </ul>
</section>
{{ /if }}
{{ /block }}


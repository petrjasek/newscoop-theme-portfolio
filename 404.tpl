{{ extends file="./layout.tpl" }}

{{ block title }}404{{ /block }}

{{ block content }}
<article class="span11">
<h1>Stránka nenalezena</h1>
</article>

{{ set_http_response_code code=404 }}

{{ /block }}

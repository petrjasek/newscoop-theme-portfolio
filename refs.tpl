{{ if $gimme->article->type_name == 'publikace' }}

{{ list_article_attachments }}
<a href="{{ uri options="articleattachment" }}" type="{{ $gimme->attachment->mime_type }}" title="{{ if $gimme->language->code == 'en' }}Download{{ else }}Stáhnout{{ /if }} {{ $gimme->article->title|escape }}">
{{ /list_article_attachments }}
{{ image rendition="publication" }}<img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" alt="{{ $gimme->article->title|escape }}"{{ if !$gimme->article->has_attachments }} title="{{ $gimme->article->title|escape }}"{{ /if }} />
{{ /image }}
{{ if $gimme->article->has_attachments }}</a>{{ /if }}

{{ else }}
{{ if $gimme->article->odkaz }}<a href="{{ $gimme->article->odkaz }}">{{ /if }}
{{ list_article_images }}
<img src="{{ $gimme->article->image->imageurl }}" alt="" />
{{ /list_article_images }}
{{ $gimme->article->title|escape }}
{{ /if }}

{{ if $gimme->article->odkaz }}</a>{{ /if }}

<ul class="share">
    <li><a href="https://www.facebook.com/sharer/sharer.php?u={{ include file="self_url.tpl" }}" target="_blank" class="icon">{{ include file="./static/facebook.svg" }}</a></li>
    <li><a href="https://plus.google.com/share?url={{ include file="self_url.tpl" }}" target="_blank" class="icon">{{ include file="./static/google.svg" }}</a></li>
    {{ list_article_images length=1 }}
    <li><a href="https://pinterest.com/pin/create/button/?url={{ include file="self_url.tpl" }}&media={{ urlencode($gimme->image->imageurl) }}" target="_blank" class="icon">{{ include file="./static/pinterest.svg" }}</a></li>
    {{ /list_article_images }}
</ul>

---
title: 音乐列表
comment: true
date: 2024-06-12 16:17:14
css: /css/aplayer.min.css
js: /js/aplayer.min.js
---

# 音乐列表

---

{% notel blue 'fa-solid fa-circle-info' '提示' %}
此页面为静态页面，并非实时更新。若访问此页面时显示的内容空白，请<a href="javascript:location.reload()">点击此处刷新页面</a>。
{% endnotel %}

---


<link rel="stylesheet" type="text/css" href="/css/APlayer.min.css">
<div id="aplayer"></div>
<script type="text/javascript" src="/js/APlayer.min.js"></script>
<script>
const ap = new APlayer({
    container: document.getElementById('aplayer'),
    audio: [{
        name: 'name',
        artist: 'artist',
        url: 'url.mp3',
        cover: 'cover.jpg'
    }]
});
</script>
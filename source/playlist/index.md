---
title: 音乐列表
comment: true
date: 2024-06-12 16:17:14
---

# 音乐列表

---

{% notel blue 'fa-solid fa-circle-info' '提示' %}
此页面为静态页面，并非实时更新。若访问此页面时显示的内容空白，请<a href="javascript:location.reload()">点击此处刷新页面</a>。
{% endnotel %}

---


<link rel="stylesheet" href="https://unpkg.com/browse/aplayer@1.10.1/dist/APlayer.min.css">
<div id="aplayer"></div>
<script src="https://unpkg.com/browse/aplayer@1.10.1/dist/APlayer.min.js"></script>

<script>
const ap = new APlayer({
    container: document.getElementById('aplayer'),
    audio: [{
        name: The Last Radiance # audio name
        artist: LuckyKPoo # audio artist
        url: /bgmusic/obj_w5rDlsOJwrLDjj7CmsOj_31796913561_b911_9785_a5bb_d0e3fb56b41749ad60c1e27f3f10144e.m4a
        cover: https://p1.music.126.net/FRFqL7guJ-sGi97zSAbJNg==/109951169105811661.jpg?param=130y130
        lrc: # audio cover lrc
    }]
});
</script>
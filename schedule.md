---
layout: page
title: Schedule
permalink: /schedule/
---

{% assign schedule = site.data.schedule | group_by:"Week" -%}
{% assign start_date = '2024-04-04' | date: "%s" %}

{% for week in schedule -%}
{% assign week_date = start_date | plus: forloop.index0 | date: "%B %-d" -%}
#### Week {{ week.name }} (Thu, {{ week_date }} @ 7:30pm)

<table>
    <tr>
        <th>Home</th>
        <th>Away</th>
        <th>Location</th>
    </tr>
{% for match in week.items -%}
    <tr>
        <td>{{ match.Home }}</td>
        <td>{{ match.Away }}</td>
        <td>{{ match.Location }}</td>
    </tr>
{% endfor -%}
</table>
{% assign start_date = start_date | plus: 604800 %}

{% endfor -%}

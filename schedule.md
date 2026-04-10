---
layout: page
title: Schedule
permalink: /schedule/
---

{% assign schedule = site.data.schedule-2026 | group_by:"Week" -%}
{% assign start_date = '2026-04-09' | date: "%s" %}

{% for week in schedule -%}
{% assign week_offset = forloop.index0 | times: 604800 %}
{% assign base_date = start_date | plus: week_offset %}
{% assign week_date = base_date | date: "%B %-d" %}
#### Week {{ week.name }} (Thu, {{ week_date }} @ 7:30pm)

<table class="schedule">
    <tr>
        <th>Matchup</th>
        <th class="location">
            <div class="desktop">Location</div>
            <div class="mobile">@</div>
        </th>
    </tr>
{% for match in week.items -%}
    <tr>
        <td>
            {{ match.Away }}{% if match["Away Sets"] %} <strong>({{ match["Away Sets"] }})</strong>{% endif %} @
            {{ match.Home }}{% if match["Home Sets"] %} <strong>({{ match["Home Sets"] }})</strong>{% endif %}
        </td>
        <td class="location">
            <div class="desktop">{{ match.Location }}</div>
            <div class="mobile">{{ match.Location | replace: 'Allegheny Country Club', 'ACC' | replace: 'Edgeworth Club', 'EC' | replace: 'Sewickley YMCA', 'YMCA' }}</div>
        </td>
    </tr>
{% endfor -%}
</table>

{% endfor -%}

---
layout: page
title: Schedule
permalink: /schedule/
---

{% assign schedule = site.data.schedule-2025 | group_by:"Week" -%}
{% assign start_date = '2025-03-27' | date: "%s" %}

{% for week in schedule -%}
{% assign week_offset = forloop.index0 | times: 604800 %}
{% assign base_date = start_date | plus: week_offset %}
{% if week.name == "5" %}
{% assign week_date = base_date | minus: 172800 | date: "%B %-d" %}
#### Week {{ week.name }} (Tue, {{ week_date }} @ 7:30pm)
{% else %}
{% assign week_date = base_date | date: "%B %-d" %}
#### Week {{ week.name }} (Thu, {{ week_date }} @ 7:30pm)
{% endif %}

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

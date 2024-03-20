---
layout: page
title: Teams
permalink: /teams/
---

{% assign teams = "Stallard,Coates,Cox,Dave,Duncan,Hay" | split: "," %}

{% for team in teams %}
  <h2>Team {{ team }}</h2>
  <table>
    <thead>
      <tr>
        <th>Name</th>
        <th>Home Club</th>
      </tr>
    </thead>
    <tbody>
      {% assign players = site.data.sewickley-spring-league | where: "Spring Team", team | sort: "Name" %}
      {% for player in players %}
        <tr>
          <td>{{ player.Name }}</td>
          <td>
            {% case player["Home Club"] %}
              {% when 'Y' %}
                Sewickley YMCA
              {% when 'ACC' %}
                Allegheny Country Club
              {% when 'EC' %}
                Edgeworth Club
              {% else %}
                {{ player["Home Club"] }}
            {% endcase %}
          </td>
        </tr>
      {% endfor %}
    </tbody>
  </table>
{% endfor %}

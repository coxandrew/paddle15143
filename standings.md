---
layout: page
title: Standings
permalink: /standings/
---

<table>
  <thead>
    <tr>
      <th>Team</th>
      <th>Wins</th>
      <th>Losses</th>
      <th>Percentage</th>
    </tr>
  </thead>
  <tbody>
    {% for team in site.data.standings %}
      <tr>
        <td>{{ team.Team }}</td>
        <td>{{ team.Wins }}</td>
        <td>{{ team.Losses }}</td>
        <td>{{ team.Percentage }}</td>
      </tr>
    {% endfor %}
  </tbody>
</table>

---
layout: page
title: Standings
permalink: /standings/
body_class: standings-page
---

<table>
  <thead>
    <tr>
      <th>Team</th>
      <th>
        <div class="desktop">Wins</div>
        <div class="mobile">Ws</div>
      </th>
      <th>
        <div class="desktop">Losses</div>
        <div class="mobile">Ls</div>
      </th>
      <th>
        <div class="desktop">%&nbsp;Wins</div>
        <div class="mobile">%</div>
      </th>
    </tr>
  </thead>

  <tbody>
    {% for team in site.data.standings-2025 %}
      <tr>
        <td class="team">{{ team.Team }}</td>
        <td class="wins-losses">{{ team.Wins }}</td>
        <td class="wins-losses">{{ team.Losses }}</td>
        <td class="percentage">{{ team.Percentage }}</td>
      </tr>
    {% endfor %}
  </tbody>
</table>

<h2>Matches</h2>

<div class="weekly-tabs">
  <div class="tab-navigation">
    <button class="tab-button active" onclick="showWeek(1)">Week 1</button>
    <button class="tab-button" onclick="showWeek(2)">Week 2</button>
    <button class="tab-button" onclick="showWeek(3)">Week 3</button>
    <button class="tab-button" onclick="showWeek(4)">Week 4</button>
    <button class="tab-button" onclick="showWeek(5)">Week 5</button>
    <button class="tab-button" onclick="showWeek(6)">Week 6</button>
    <button class="tab-button" onclick="showWeek(7)">Week 7</button>
    <button class="tab-button" onclick="showWeek(8)">Week 8</button>
  </div>

  <div id="week-1-content" class="week-content active">
    {% include week_results.html week="1" %}
  </div>

  <div id="week-2-content" class="week-content">
    {% include week_results.html week="2" %}
  </div>

  <div id="week-3-content" class="week-content">
    {% include week_results.html week="3" %}
  </div>

  <div id="week-4-content" class="week-content">
    {% include week_results.html week="4" %}
  </div>

  <div id="week-5-content" class="week-content">
    {% include week_results.html week="5" %}
  </div>

  <div id="week-6-content" class="week-content">
    {% include week_results.html week="6" %}
  </div>

  <div id="week-7-content" class="week-content">
    {% include week_results.html week="7" %}
  </div>

  <div id="week-8-content" class="week-content">
    {% include week_results.html week="8" %}
  </div>
</div>

<script>
  function showWeek(weekNum) {
    // Hide all week content
    const weekContents = document.querySelectorAll('.week-content');
    weekContents.forEach(content => {
      content.classList.remove('active');
    });

    // Show the selected week content
    document.getElementById(`week-${weekNum}-content`).classList.add('active');

    // Update active tab button
    const tabButtons = document.querySelectorAll('.tab-button');
    tabButtons.forEach((button, index) => {
      if (index === weekNum - 1) {
        button.classList.add('active');
      } else {
        button.classList.remove('active');
      }
    });
  }

  // Find the latest week that has data (not showing "No results available yet")
  function findLatestWeekWithData() {
    // Start from the highest week (8) and go backwards
    for (let week = 8; week >= 1; week--) {
      const weekContent = document.getElementById(`week-${week}-content`);
      if (weekContent &&
          !weekContent.textContent.includes('No results available yet')) {
        return week;
      }
    }
    // Default to week 1 if no data is found
    return 1;
  }

  // Initialize tab when page loads
  document.addEventListener('DOMContentLoaded', function() {
    // Give the DOM a moment to fully render the content from includes
    setTimeout(function() {
      const latestWeek = findLatestWeekWithData();
      showWeek(latestWeek);
    }, 100);
  });
</script>

<style>
  .weekly-tabs {
    margin: 20px 0;
  }

  .tab-navigation {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 30px;
    border-bottom: 1px solid #ddd;
  }

  .tab-button {
    padding: 8px 16px;
    background: none;
    border: none;
    cursor: pointer;
    border-radius: 4px 4px 0 0;
    margin-right: 2px;
  }

  .tab-button:hover {
    background-color: #f0f0f0;
  }

  .tab-button.active {
    background: #fff;
    border: 1px solid #ddd;
    border-bottom: 1px solid white;
    margin-bottom: -1px;
  }

  .week-content {
    display: none;
  }

  .week-content.active {
    display: block;
  }
</style>

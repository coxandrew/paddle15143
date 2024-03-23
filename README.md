## Quickstart

### Start server

```
bundle exec jekyll serve
```

### Create a new page

Just create a new *.md file in the root directory, like:

```
---
layout: page
title: Teams
permalink: /teams/
---

Teams go here.
```

## Customization

To override the template pages, find the template from the theme's gem and copy + paste into the `_layouts` directory:
```
code $(bundle info --path minima)
```

## Deployments

* To deploy a new version, just push the `master` branch.
* Check results of the build on the Actions tab: https://github.com/coxandrew/paddle15143/actions

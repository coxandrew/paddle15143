## Quickstart

### Pre-requisites

* A GitHub account
* The git command line utility

### Install homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After installation completes, Homebrew will show next steps. Run these two commands (copy+paste each one):

```
echo '# Add Homebrew to PATH' >> ~/.bashrc
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/opt/homebrew/bin/brew shellenv)"
```
This ensures brew is available in your current and future terminal sessions.

```
brew --version
```
You should see something like: Homebrew 4.x.x

Homebrew is now ready! You can proceed with installing ruby-install, chruby, etc.

### Install ruby

```
brew install ruby-install chruby openssl@3 readline libyaml sqlite3 zlib
ruby-install ruby
```

### Configure chruby

Copy and paste this entire block into Terminal and hit "enter":
```
cat << 'EOF' >> ~/.bashrc

# chruby - Ruby version manager
source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh
source $(brew --prefix)/opt/chruby/share/chruby/auto.sh

# Default to the Ruby we just installed
chruby ruby

# Fix OpenSSL linking for gems (if needed)
export LDFLAGS="-L$(brew --prefix openssl@3)/lib"
export CPPFLAGS="-I$(brew --prefix openssl@3)/include"
export PKG_CONFIG_PATH="$(brew --prefix openssl@3)/lib/pkgconfig"
EOF
```

### Verify ruby is installed correctly

```
source ~/.bashrc
ruby -v
# this should show ruby 3.3.x or similar if it worked
```

### Install bundler

```
gem install bundler
bundle
```

### Start server

```
bundle exec jekyll serve
```

The site should be available at: http://127.0.0.1:4000/

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

### Create a new blog post

```
bundle exec jekyll post "Oh, did I forget to tell you?"
```

## Customization

To override the template pages, find the template from the theme's gem and copy + paste into the `_layouts` directory:
```
code $(bundle info --path minima)
```

## Deployments

### Deploying any change to the site

To deploy a new version (adding a new blog post, or any other kind of visual update), just push the `master` branch:

```
git add -u
git commit -m "Short message describing your change"
git push
```

Check results of the build on the Actions tab: https://github.com/coxandrew/paddle15143/actions

### Updating scores / standings

The rosters, schedule, standings, and scores are updated via CSV files. You need to:

* Update the scores manually in the appropriate Google Sheets spreadsheet
* Download each file as CSV to the `_data` directory and rename it accordingly (you'll need a new score file for each week):
  * schedule-[year].csv
  * team-rosters-[2025].csv
  * scores-[year]-week-[week-num].csv
  * standings-[year].csv

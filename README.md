# Vox Pupuli RuboCop Gem

[![License](https://img.shields.io/github/license/voxpupuli/voxpupuli-rubocop.svg)](https://github.com/voxpupuli/voxpupuli-rubocop/blob/master/LICENSE)
[![Test](https://github.com/voxpupuli/voxpupuli-rubocop/actions/workflows/ci.yml/badge.svg)](https://github.com/voxpupuli/voxpupuli-rubocop/actions/workflows/ci.yml)
[![Release](https://github.com/voxpupuli/voxpupuli-rubocop/actions/workflows/release.yml/badge.svg)](https://github.com/voxpupuli/voxpupuli-rubocop/actions/workflows/release.yml)
[![RubyGem Version](https://img.shields.io/gem/v/voxpupuli-rubocop.svg)](https://rubygems.org/gems/voxpupuli-rubocop)
[![RubyGem Downloads](https://img.shields.io/gem/dt/voxpupuli-rubocop.svg)](https://rubygems.org/gems/voxpupuli-rubocop)

This is one of the Vox Pupuli meta gems. It provides a convenient way to
configure [RuboCop](https://rubocop.org/). RuboCop is the de facto standard Ruby
Linter and Formatter. `voxpupuli-rubocop` depends on the correct RuboCop version
+ dependencies that we want to use in our CI pipelines. There is also a
[rubocop.yml](rubocop.yml) that configures RuboCop. and preconfigured rake
tasks.

The goal of this gem is to provide a central configuration for RuboCop that's
used in all Vox Pupuli gems.

## Usage

In your Gemfile, add the following:

```
gem 'voxpupuli-rubocop', '~> 1.0'
```

In your Rakefile, include our Rake task:

```
require 'voxpupuli/rubocop/rake'
```

Now you can list your rake tasks and should see three new ones:

```terminal
bundle exec rake -T
rake rubocop                  # Run RuboCop
rake rubocop:autocorrect      # Autocorrect RuboCop offenses (only when it's safe)
rake rubocop:autocorrect_all  # Autocorrect RuboCop offenses (safe and unsafe)
```

To use our default config, create a `.rubocop.yml`:

```
---
inherit_gem:
  beaker: rubocop.yml
```

You maybe see a bunch of violations with the new configuration. A common path
forward is to accept them but prevent future/more violations. You can generate
a "RuboCop ToDo file", which is basically an allow-list of all current
violations:

```
bundle exec rubocop --regenerate-todo
```

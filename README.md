# Vox Pupuli RuboCop Gem

[![License](https://img.shields.io/github/license/voxpupuli/voxpupuli-rubocop.svg)](https://github.com/voxpupuli/voxpupuli-rubocop/blob/master/LICENSE)
[![Test](https://github.com/voxpupuli/voxpupuli-rubocop/actions/workflows/ci.yml/badge.svg)](https://github.com/voxpupuli/voxpupuli-rubocop/actions/workflows/ci.yml)
[![Release](https://github.com/voxpupuli/voxpupuli-rubocop/actions/workflows/release.yml/badge.svg)](https://github.com/voxpupuli/voxpupuli-rubocop/actions/workflows/release.yml)
[![RubyGem Version](https://img.shields.io/gem/v/voxpupuli-rubocop.svg)](https://rubygems.org/gems/voxpupuli-rubocop)
[![RubyGem Downloads](https://img.shields.io/gem/dt/voxpupuli-rubocop.svg)](https://rubygems.org/gems/voxpupuli-rubocop)

* [Usage](#usage)
* [New major releases](#new-major-releases)

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
gem 'voxpupuli-rubocop', '~> 4.0.0'
```

**We suggest to pin the minor version like above, because new minor versions will pull in newer rubocop versions**

(A best practice, that we also follow in our Vox Pupuli Ruby Gems, is to pin
like above and use dependabot. It will provide pull requests that allow
newer minor versions. And in a CI pipeline you will see if the newer rubocop
works without issues. That prevents your HEAD branch from breaking. If you've
multiple repositories in your GitHub Org, you can filter for all dependabot PRs
by checking for `label:ruby label:dependencies` [Vox Pupuli example](https://github.com/pulls?q=is%3Aopen+is%3Apr+archived%3Afalse+label%3Aruby+label%3Adependencies+user%3Avoxpupuli+)).

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
  voxpupuli-rubocop: rubocop.yml
```

You maybe see a bunch of violations with the new configuration. A common path
forward is to accept them but prevent future/more violations. You can generate
a "RuboCop ToDo file", which is basically an allow-list of all current
violations:

```
bundle exec rubocop --regenerate-todo --no-auto-gen-timestamp
```

## New major releases

As described above, we will do new minor releases of voxpupuli-rubocop with newer RuboCop dependencies.
We also ship a rubocop.yml that people can use.
This file currently configures Ruby 3.2 as a target version.
This will be adjusted in major releases.

The 4.x releases configured Ruby 3.1.
The 3.x releases configured Ruby 2.7.

User of voxpupuli-rubocop don't have to use our rubocop.yml, they can just rely
on our curated list of rubocop dependencies. Or overwrite the target version in
their own rubocop.yaml:

```
inherit_gem:
  voxpupuli-rubocop: rubocop.yml

AllCops:
  TargetRubyVersion: '3.4'
```

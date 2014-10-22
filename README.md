## Expire passwords plugin for Devise

This plugin expires user passwords after a set time period. The plugin assumes you have a column called "last_password_reset" in your table.

## Features

* set the length of time after which passwords expire

## Configuration

### Initial Setup

In a Rails environment, add the following line to your Gemfile:

    gem 'devise_password_expirable'

From the command line, run:

    bundle install

### Installation

To add the correct settings to your already-existing devise initializer, run this command in the command line:

    rails generate devise_password_expirable:install

To enable the plugin, add 

    :password_expirable

to your model's devise parameters.
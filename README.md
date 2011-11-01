# Cucumber testing framework for Drupal

This is a little framework I wrote to write front-end tests using Cucumber.  There are some basic functions you can 
use to test Drupal on.  I'll polish documentation later on.

## Prerequisites

You must have Ruby and Rubygems installed.  Use "RVM":http://beginrescueend.com/rvm/install to install it.  You'll need 
FireFox and also the following gems:

* selenium-webdriver
* rspec
* cucumber
* capybara
* gherkin

Drop me a message if you encounter errors.

You need to install the module to create bulk users, generated per existing role within Drupal.  *TODO* Insert link 
to github module.

## Setup

You can change the basic settings in the file `tasks/setup.rb`

* `DRUPAL_BASE_PATH`: the URL to your drupal installation (e.g localhost/yourapp or yourapp.com)
* `DRUPAL_DRIVER`: the driver used to test the app.  Only supported driver for now is Selenium (and is most tested solution)

You must enable the cucumber helper module.  [You can clone it here](https://github.com/Agiboo/Cucumber-helper "Cucumber_helper project").  This creates one user per role.  The credentials (for debugging) are 
"cucumber_[rolename]" for username and password.  A user based on the role editor will have the credentials cucumber_editor/cucumber_editor.

## Execute tests

Go to the root of this repo and type "rake test:run".  This will automatically trigger the tests to run.

Good luck

info at heartdriven dotcom

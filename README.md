Scrapod
=======

A driver of remote headless scraping cluster for
[Capybara](https://github.com/teamcapybara/capybara)
(aka remote [Capybara Webkit](https://github.com/thoughtbot/capybara-webkit)).

Introduction
------------

There are many browser automation tools, mostly built on top of
[PhantomJS](http://phantomjs.org).
In my opinion, Capybara is still the best. Unfortunately most of Capybara
drivers are not enough suitable for web scraping purposes.
There are the reasons:

* They run on the same server as your worker what can be ineffective
* They do not care about headless browser process termination what can cause memory leaks
* They open headless browser process on-demand what can be slow
* They can take the total amount of available RAM and freeze the server

This happens because Capybara is intended firstly for testing purposes
but not for web scraping. Authors
[do not want](https://github.com/thoughtbot/capybara-webkit/issues/147#issuecomment-137848937)
to support such use cases. So you as a final product developer have to solve
these problems by yourself. This spawns
[primitive and makeshift solutions](https://github.com/thoughtbot/capybara-webkit/issues/802#issuecomment-116195006)
which are good until you have to run more than a few tens of tasks per hour.

[The Scrapod](https://github.com/krowpu/scrapod)
tries to solve all or most of the problems listed above.

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

Architecture
------------

The Scrapod consists of two parts: client and server.

### Client

Client is a driver for Capybara. It connects to server when you create session,
sends calls to Capybara API over the connection and converts responses to Ruby
data structures. This is what you want to use in a final product application.
This document describes the client completely.

### Server

Server is a process which can run on the same or on another machine
than the client. Server configuration can be complex but still not difficult.
It is described in [the server repository](https://github.com/krowpu/scrapod-server).
For testing purposes it is enough to install the gem and run
`scrapod-server --debug`. It will start listening on local port `20885`.

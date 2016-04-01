Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-clk@vger.kernel.org,
	mturquette@baylibre.com,
	sjan@baylibre.com,
	ahaslam@baylibre.com,
	abailon@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/5] Introduce Quantum Clock handling
Date: Fri,  1 Apr 2016 13:37:10 +0200
Message-Id: <1459510635-8204-1-git-send-email-narmstrong@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

As today, handling of future but close Quantum physics as
part of our modern computing model is clearly and really not
ready. Introduce a simple, clear and clean but straightforward
implementation of a Quantum concept in the clk framework
looking for a great future for experimental physics handling.

For handling the new quantum physics, add a Quantum clock
or Schrodingers clock in reference of the great experiment,
organize a new implementation that describes a simple but
Logical quantum clock.

Researched-by: Just Another Kernel Experiment Research <joker@baylibre.com>
Tested-by: Brotherhood After The Most Andvanced Number <batman@baylibre.com>

Neil Armstrong (5):
  clk: Switch clk handling to signed long and introduce Quantum State
  clk: Introduce clk-schrodinger as Quantum clock implementation
  clk: Add build support for schrodinger clock
  dt-bindings: clock: add schrodinger clock bindings
  MAINTAINERS: Add Neil Armstrong as maintainers of schrodinger clock

 .../devicetree/bindings/clock/schrodinger.txt      |  18 ++++
 MAINTAINERS                                        |   6 ++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-schrodinger.c                      | 110 +++++++++++++++++++++
 drivers/clk/clk.c                                  | 104 ++++++++++---------
 include/linux/clk-provider.h                       |  29 +++++-
 include/linux/clk.h                                |  22 ++---
 7 files changed, 226 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/schrodinger.txt
 create mode 100644 drivers/clk/clk-schrodinger.c

-- 
1.9.1

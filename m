Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: meson: probe clean-ups
Date: Thu, 18 Jan 2018 13:08:29 +0100
Message-Id: <20180118120831.8349-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This changeset feature a couple of clean-ups in the probe
function of meson's clock controllers. It is the beginning
of a refactoring of meson's clock controllers

Jerome Brunet (2):
  clk: meson: use dev pointer where possible
  clk: meson: use devm_of_clk_add_hw_provider

 drivers/clk/meson/axg.c     | 12 ++++++------
 drivers/clk/meson/gxbb.c    |  7 ++++---
 drivers/clk/meson/meson8b.c |  4 ++--
 3 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.14.3

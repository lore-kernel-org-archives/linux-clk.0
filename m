Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] clk: helpers and fixes
Date: Wed, 14 Feb 2018 14:43:32 +0100
Message-Id: <20180214134340.17242-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This changset is consist of various patches I have recently sent
for the clock framework. They are gathered here for your convinience.

The first two changes exports helpers of the generic clocks (divider and
mux). The goal is to avoid code duplication when writing clock driver
derived from these generic clock drivers.

The rest fixes various issues found in the clock framework while working on
a rework of meson's clock controllers [0]

Changes since the v1s:
 * dropped lpc32xx divider read-only patches as requested by
   Vladimir Zapolskiy [2]
 * Squashed generic divider read-only patches
 * Squashed mux documentations patches

[0]: https://lkml.kernel.org/r/20180212145846.19380-1-jbrunet@baylibre.com
[2]: https://lkml.kernel.org/r/54782a8f-9735-a574-d8e1-7ff3e9173229@mleia.com

Jerome Brunet (8):
  clk: divider: export clk_div_mask() helper
  clk: mux: add helper function for index/value translation
  clk: fix determine rate error with pass-through clock
  clk: migrate the count of orphaned clocks at init
  clk: call the clock init() callback before any other ops callback
  clk: fix mux clock documentation
  clk: divider: read-only divider can propagate rate change
  clk: qcom: use divider_ro_round_rate helper

 drivers/clk/clk-divider.c             | 58 ++++++++++++++++++---------
 drivers/clk/clk-mux.c                 | 75 ++++++++++++++++++++---------------
 drivers/clk/clk.c                     | 63 ++++++++++++++++-------------
 drivers/clk/qcom/clk-regmap-divider.c | 20 +++-------
 include/linux/clk-provider.h          | 23 ++++++++++-
 5 files changed, 146 insertions(+), 93 deletions(-)

-- 
2.14.3

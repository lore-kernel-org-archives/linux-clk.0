Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: add helpers for generic clocks
Date: Thu, 18 Jan 2018 12:01:42 +0100
Message-Id: <20180118110144.30619-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This series exports an helper providing the divider mask in the generic
divider and helpers to translate the between the index and the register
value in the generic mux.

The goal is to avoid duplicating this code in clock providers deriving
from these generic clocks, something I plan do doing in upcoming
changeset for meson clocks [0]

In patch 1, I have 's/div_mask/clk_div_mask' to avoid the conflict with
tegra's divider, which also defines the macro div_mask() but does not
actually derives from the generic divider.

[0]: https://github.com/jeromebrunet/linux/commit/b1bfb0fc79d1b14cd4b74ec8d1d9167171973af0

Jerome Brunet (2):
  clk: divider: export clk_div_mask() helper
  clk: mux: add helper function for index/value translation

 drivers/clk/clk-divider.c    | 24 +++++++-------
 drivers/clk/clk-mux.c        | 75 +++++++++++++++++++++++++-------------------
 include/linux/clk-provider.h |  5 +++
 3 files changed, 59 insertions(+), 45 deletions(-)

-- 
2.14.3

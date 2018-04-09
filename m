Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/2] clk: honor CLK_MUX_ROUND_CLOSEST in mux
Date: Mon,  9 Apr 2018 15:59:19 +0200
Message-Id: <20180409135921.5617-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

CLK_MUX_ROUND_CLOSEST is part of clk_mux and meson's clk_regmap
documentation, so it should be honored by the determine_rate() callback.

It is note the case ATM. The series fixes this problem.

Jerome Brunet (2):
  clk: honor CLK_MUX_ROUND_CLOSEST in generic clk mux
  clk: meson: honor CLK_MUX_ROUND_CLOSEST in clk_regmap

 drivers/clk/clk-mux.c          | 10 +++++++++-
 drivers/clk/clk.c              |  7 ++++---
 drivers/clk/meson/clk-regmap.c | 11 ++++++++++-
 include/linux/clk-provider.h   |  3 +++
 4 files changed, 26 insertions(+), 5 deletions(-)

-- 
2.14.3

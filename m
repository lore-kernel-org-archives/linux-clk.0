Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Vladimir Zapolskiy <vz@mleia.com>,
	Sylvain Lemieux <slemieux.tyco@gmail.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>
Subject: [PATCH 0/5] clk: read-only dividers and rate propagation fixup
Date: Fri,  5 Jan 2018 18:09:54 +0100
Message-Id: <20180105170959.17266-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

A read-only divider may also have CLK_SET_RATE_PARENT flag set, in which
case it should propagate the requested rate to its parent, taking the
read-only divider value into account.

While this is done correctly in qcom's clk-regmap-divider, it is not in
the generic divider and lpc32xx.

Other drivers using divider_round_rate are not impacted because they are
using hard-coded flags without CLK_DIVIDER_READ_ONLY, so read-only
dividers does seems to be concern for them and rate propagation should
work as expected

Jerome Brunet (5):
  clk: divider: read-only divider can propagate rate change
  clk: lpc32xx: read-only divider can propagate rate change
  clk: divider: add divider_ro_round_rate helper
  clk: lpc32xx: use divider_ro_round_rate helper
  clk: qcom: use divider_ro_round_rate helper

 drivers/clk/clk-divider.c             | 35 +++++++++++++++++++++++++++++------
 drivers/clk/nxp/clk-lpc32xx.c         | 15 ++++++++-------
 drivers/clk/qcom/clk-regmap-divider.c | 19 ++++++-------------
 include/linux/clk-provider.h          | 15 +++++++++++++++
 4 files changed, 58 insertions(+), 26 deletions(-)

-- 
2.14.3

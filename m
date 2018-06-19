Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-soc@vger.kernel.org,
	David Brown <david.brown@linaro.org>,
	Andy Gross <andy.gross@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 0/2] clk: enforce CLK_SET_RATE_GATE along the tree
Date: Tue, 19 Jun 2018 15:40:49 +0200
Message-Id: <20180619134051.16726-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

This is a resend of the last unmerged patch of the clock protect v5 [0]
patchset. It makes use of the clock protection mechanism to fix and
enforce CLK_SET_RATE_GATE flag.

With this flag set, any operation resulting in a rate change or glitch
should be prevented. This might be useful when, for example, a PLL can't
safely relock while in use.

ATM, this is enforced only on the leaf clock of the operation (the clock
on which clk_set_rate() is called). It is ignored otherwise. It means
that, if:
 * clock A has CLK_SET_RATE_PARENT and is a child on clock B
 * clock B has CLK_SET_RATE_GATE set
it is possible to:
 * call clk_prepare_enable on clock A (clock B also gets enabled)
 * call clk_set_rate() on clock A,
  => with rate propagation clock B (or its parents) might change while
     enabled

Patch 2 of this series fixes this problem.

Some platform may have been relying on the broken implementation of
CLK_SET_RATE_GATE but, since the platform actually bypassed
CLK_SET_RATE_GATE, we can drop the flag without changing anything.

This is the case for qcom SDC clock and mmci driver, which does the
following sequence:
 * clk_get()
 * clk_prepare_enable()
 * clk_get_rate()
 * clk_set_rate()
This is obviously not possible when CLK_SET_RATE_GATE is set.
Patch 1 drops the CLK_SET_RATE_GATE from qcom sdc clocks. Other qcom's
clocks are using the same scheme, so maybe there something worth
checking here.

This case was detected using kernelCI but some other platforms might be
doing the same. Maintainers of the platforms using this flag have been
warned ... but please test!

[0]: https://lkml.kernel.org/r/20171201215200.23523-1-jbrunet@baylibre.com

Jerome Brunet (2):
  clk: qcom: drop CLK_SET_RATE_GATE from sdc clocks
  clk: fix CLK_SET_RATE_GATE with clock rate protection

 drivers/clk/clk.c              | 16 +++++++++++++---
 drivers/clk/qcom/gcc-ipq806x.c |  3 ---
 drivers/clk/qcom/gcc-mdm9615.c |  2 --
 drivers/clk/qcom/gcc-msm8660.c |  5 -----
 drivers/clk/qcom/gcc-msm8960.c |  5 -----
 5 files changed, 13 insertions(+), 18 deletions(-)

-- 
2.14.3

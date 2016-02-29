Return-Path: <kernel@martin.sperl.org>
From: kernel@martin.sperl.org
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: [PATCH 0/6] clk: bcm2835: fixes clk-bcm2835 driver issues
Date: Mon, 29 Feb 2016 11:39:16 +0000
Message-Id: <1456745963-2403-1-git-send-email-kernel@martin.sperl.org>
List-ID: <linux-clk.vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

This patchset - as recommended by Stefan Wahren - is a split
of the original V5 patchset that now only includes bugfixes
to the clock driver not adding new clocks or functionality.

There will be another patchset that implements the
changes required to add all missing clocks of the SOC.

Martin Sperl (6):
  clk: bcm2835: pll_off should only set CM_PLL_ANARST
  clk: bcm2835: add locking to pll*_on/off methods
  clk: bcm2835: enable clocks that have been enabled by firmware
  clk: bcm2835: divider value has to be 1 or more
  clk: bcm2835: correctly enable fractional clock support
  clk: bcm2835: clean up coding style issues

 drivers/clk/bcm/clk-bcm2835.c |   87 +++++++++++++++++++++++++++++++++--------
 1 file changed, 70 insertions(+), 17 deletions(-)

--
1.7.10.4

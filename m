Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: pure.logic@nexus-software.ie,
	Vladimir Zapolskiy <vz@mleia.com>,
	Sylvain Lemieux <slemieux.tyco@gmail.com>,
	Gabriel Fernandez <gabriel.fernandez@st.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 32/33] clk: lpc32xx: change round_rate() return logic
Date: Sat, 30 Dec 2017 01:13:11 +0000
Message-Id: <1514596392-22270-33-git-send-email-pure.logic@nexus-software.ie>
In-Reply-To: <1514596392-22270-1-git-send-email-pure.logic@nexus-software.ie>
References: <1514596392-22270-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

This patch updates the round_rate() logic here to return zero instead of a
negative number on error.

In conjunction with higher-level changes associated with acting on the
return value of clk_ops->round_rate() it is then possible to have
clk_ops->round_rate() return values from 1 Hz to ULONG_MAX Hz instead of
the current limitation of 1 Hz to LONG_MAX Hz.

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Gabriel Fernandez <gabriel.fernandez@st.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/nxp/clk-lpc32xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index 76c17f4..0e0d258 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -664,17 +664,17 @@ static unsigned long clk_usb_pll_round_rate(struct clk_hw *hw,
 	 * USB divider, USB PLL N and M parameters.
 	 */
 	if (rate != 48000000)
-		return -EINVAL;
+		return 0;
 
 	/* USB divider clock */
 	usb_div_hw = clk_hw_get_parent_by_index(hw, 0);
 	if (!usb_div_hw)
-		return -EINVAL;
+		return 0;
 
 	/* Main oscillator clock */
 	osc_hw = clk_hw_get_parent_by_index(usb_div_hw, 0);
 	if (!osc_hw)
-		return -EINVAL;
+		return 0;
 	o = clk_hw_get_rate(osc_hw);	/* must be in range 1..20 MHz */
 
 	/* Check if valid USB divider and USB PLL parameters exists */
@@ -697,7 +697,7 @@ static unsigned long clk_usb_pll_round_rate(struct clk_hw *hw,
 		}
 	}
 
-	return -EINVAL;
+	return 0;
 }
 
 #define LPC32XX_DEFINE_PLL_OPS(_name, _rc, _sr, _rr)			\
-- 
2.7.4

Return-Path: <robert.jarzmik@free.fr>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v2 2/5] clk: pxa: core pll is not affected by t bit
Date: Sun, 23 Oct 2016 14:19:27 +0200
Message-Id: <1477225170-19019-3-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1477225170-19019-1-git-send-email-robert.jarzmik@free.fr>
References: <1477225170-19019-1-git-send-email-robert.jarzmik@free.fr>
List-ID: <linux-clk.vger.kernel.org>

The t bit of clkfcfg doesn't affect the core pll clock, but it makes core
clock select between core pll clock and core run clock.

As such remove it from the core pll rate reporting function, while it
remains in clk_pxa27x_core_get_parent().

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/clk/pxa/clk-pxa25x.c | 4 +---
 drivers/clk/pxa/clk-pxa27x.c | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/pxa/clk-pxa25x.c b/drivers/clk/pxa/clk-pxa25x.c
index a98b98e2a9e4..3bb603a27f2b 100644
--- a/drivers/clk/pxa/clk-pxa25x.c
+++ b/drivers/clk/pxa/clk-pxa25x.c
@@ -182,9 +182,7 @@ static unsigned long clk_pxa25x_cpll_get_rate(struct clk_hw *hw,
 	m = M_clk_mult[(cccr >> 5) & 0x03];
 	n2 = N2_clk_mult[(cccr >> 7) & 0x07];
 
-	if (t)
-		return m * l * n2 * parent_rate / 2;
-	return m * l * parent_rate;
+	return m * l * n2 * parent_rate / 2;
 }
 PARENTS(clk_pxa25x_cpll) = { "osc_3_6864mhz" };
 RATE_RO_OPS(clk_pxa25x_cpll, "cpll");
diff --git a/drivers/clk/pxa/clk-pxa27x.c b/drivers/clk/pxa/clk-pxa27x.c
index afc395b4148e..3930053543a3 100644
--- a/drivers/clk/pxa/clk-pxa27x.c
+++ b/drivers/clk/pxa/clk-pxa27x.c
@@ -162,7 +162,7 @@ static unsigned long clk_pxa27x_cpll_get_rate(struct clk_hw *hw,
 	L  = l * parent_rate;
 	N  = (L * n2) / 2;
 
-	return t ? N : L;
+	return N;
 }
 PARENTS(clk_pxa27x_cpll) = { "osc_13mhz" };
 RATE_RO_OPS(clk_pxa27x_cpll, "cpll");
-- 
2.1.4

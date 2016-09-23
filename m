Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] clk: renesas: cpg-mssr: Always use readl()/writel()
Date: Fri, 23 Sep 2016 10:32:31 +0200
Message-Id: <1474619552-29703-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1474619552-29703-1-git-send-email-geert+renesas@glider.be>
References: <1474619552-29703-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

The Renesas CPG/MSSR driver core uses a mix of clk_readl()/clk_writel()
and readl()/writel() to access the clock registers. Settle on the
generic readl()/writel().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index e1365e7491ae02a0..a1d5b7431ec479b5 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -146,12 +146,12 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		enable ? "ON" : "OFF");
 	spin_lock_irqsave(&priv->mstp_lock, flags);
 
-	value = clk_readl(priv->base + SMSTPCR(reg));
+	value = readl(priv->base + SMSTPCR(reg));
 	if (enable)
 		value &= ~bitmask;
 	else
 		value |= bitmask;
-	clk_writel(value, priv->base + SMSTPCR(reg));
+	writel(value, priv->base + SMSTPCR(reg));
 
 	spin_unlock_irqrestore(&priv->mstp_lock, flags);
 
@@ -159,8 +159,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		return 0;
 
 	for (i = 1000; i > 0; --i) {
-		if (!(clk_readl(priv->base + MSTPSR(reg)) &
-		      bitmask))
+		if (!(readl(priv->base + MSTPSR(reg)) & bitmask))
 			break;
 		cpu_relax();
 	}
@@ -190,7 +189,7 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
 	struct cpg_mssr_priv *priv = clock->priv;
 	u32 value;
 
-	value = clk_readl(priv->base + MSTPSR(clock->index / 32));
+	value = readl(priv->base + MSTPSR(clock->index / 32));
 
 	return !(value & BIT(clock->index % 32));
 }
-- 
1.9.1

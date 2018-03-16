Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/8] clk: renesas: mstp: Always use readl()/writel()
Date: Fri, 16 Mar 2018 14:40:16 +0100
Message-Id: <1521207622-3311-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
References: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On arm32, there is no reason to use the (soon deprecated)
clk_readl()/clk_writel().  Hence use the generic readl()/writel()
instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-mstp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index d6a57dc23679711b..2b7e3eb651e3d375 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -64,13 +64,13 @@ struct mstp_clock {
 static inline u32 cpg_mstp_read(struct mstp_clock_group *group,
 				u32 __iomem *reg)
 {
-	return group->width_8bit ? readb(reg) : clk_readl(reg);
+	return group->width_8bit ? readb(reg) : readl(reg);
 }
 
 static inline void cpg_mstp_write(struct mstp_clock_group *group, u32 val,
 				  u32 __iomem *reg)
 {
-	group->width_8bit ? writeb(val, reg) : clk_writel(val, reg);
+	group->width_8bit ? writeb(val, reg) : writel(val, reg);
 }
 
 static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
-- 
2.7.4

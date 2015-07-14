Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 3/6] clk: fractional-divider: keep mwidth and nwidth internally
Date: Tue, 14 Jul 2015 18:12:00 +0300
Message-Id: <1436886723-111895-4-git-send-email-andriy.shevchenko@linux.intel.com>
In-Reply-To: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The patch adds mwidth and nwidth fields to the struct clk_fractional_divider
for further usage. While here, use GENMASK() instead of open coding this
functionality.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/clk-fractional-divider.c | 6 ++++--
 include/linux/clk-provider.h         | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index 7cfcc56..16f42ae 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -128,9 +128,11 @@ struct clk *clk_register_fractional_divider(struct device *dev,
 
 	fd->reg = reg;
 	fd->mshift = mshift;
-	fd->mmask = (BIT(mwidth) - 1) << mshift;
+	fd->mwidth = mwidth;
+	fd->mmask = GENMASK(mwidth - 1, 0) << mshift;
 	fd->nshift = nshift;
-	fd->nmask = (BIT(nwidth) - 1) << nshift;
+	fd->nwidth = nwidth;
+	fd->nmask = GENMASK(nwidth - 1, 0) << nshift;
 	fd->flags = clk_divider_flags;
 	fd->lock = lock;
 	fd->hw.init = &init;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2116e2b..bb3c626 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -496,13 +496,14 @@ struct clk *clk_register_fixed_factor(struct device *dev, const char *name,
  *
  * Clock with adjustable fractional divider affecting its output frequency.
  */
-
 struct clk_fractional_divider {
 	struct clk_hw	hw;
 	void __iomem	*reg;
 	u8		mshift;
+	u8		mwidth;
 	u32		mmask;
 	u8		nshift;
+	u8		nwidth;
 	u32		nmask;
 	u8		flags;
 	spinlock_t	*lock;
-- 
2.1.4


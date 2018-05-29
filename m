Return-Path: <SRS0=7qdu=IQ=linuxfoundation.org=gregkh@kernel.org>
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Lechner <david@lechnology.com>,
	Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH 3/5] clk: davinci: no need to check return value of debugfs_create functions
Date: Tue, 29 May 2018 18:08:02 +0200
Message-Id: <20180529160804.1982-3-gregkh@linuxfoundation.org>
In-Reply-To: <20180529160804.1982-1-gregkh@linuxfoundation.org>
References: <20180529160804.1982-1-gregkh@linuxfoundation.org>
List-ID: <linux-clk.vger.kernel.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: David Lechner <david@lechnology.com>
Cc: Sekhar Nori <nsekhar@ti.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/clk/davinci/pll.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
index 23a24c944f1d..bb9594703d4a 100644
--- a/drivers/clk/davinci/pll.c
+++ b/drivers/clk/davinci/pll.c
@@ -878,7 +878,6 @@ static int davinci_pll_debug_init(struct clk_hw *hw, struct dentry *dentry)
 {
 	struct davinci_pll_clk *pll = to_davinci_pll_clk(hw);
 	struct debugfs_regset32 *regset;
-	struct dentry *d;
 
 	regset = kzalloc(sizeof(*regset), GFP_KERNEL);
 	if (!regset)
@@ -888,11 +887,7 @@ static int davinci_pll_debug_init(struct clk_hw *hw, struct dentry *dentry)
 	regset->nregs = ARRAY_SIZE(davinci_pll_regs);
 	regset->base = pll->base;
 
-	d = debugfs_create_regset32("registers", 0400, dentry, regset);
-	if (IS_ERR(d)) {
-		kfree(regset);
-		return PTR_ERR(d);
-	}
+	debugfs_create_regset32("registers", 0400, dentry, regset);
 
 	return 0;
 }
-- 
2.17.0

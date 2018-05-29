Return-Path: <SRS0=7qdu=IQ=linuxfoundation.org=gregkh@kernel.org>
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.org>,
	Boris Brezillon <boris.brezillon@bootlin.com>,
	Danilo Krummrich <danilokrummrich@dk-develop.de>
Subject: [PATCH 2/5] clk: bcm2835: no need to check return value of debugfs_create functions
Date: Tue, 29 May 2018 18:08:01 +0200
Message-Id: <20180529160804.1982-2-gregkh@linuxfoundation.org>
In-Reply-To: <20180529160804.1982-1-gregkh@linuxfoundation.org>
References: <20180529160804.1982-1-gregkh@linuxfoundation.org>
List-ID: <linux-clk.vger.kernel.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Eric Anholt <eric@anholt.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: Phil Elwell <phil@raspberrypi.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <danilokrummrich@dk-develop.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/clk/bcm/clk-bcm2835.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index fa0d5c8611a0..1329440af59f 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -398,7 +398,6 @@ static int bcm2835_debugfs_regset(struct bcm2835_cprman *cprman, u32 base,
 				  struct debugfs_reg32 *regs, size_t nregs,
 				  struct dentry *dentry)
 {
-	struct dentry *regdump;
 	struct debugfs_regset32 *regset;
 
 	regset = devm_kzalloc(cprman->dev, sizeof(*regset), GFP_KERNEL);
@@ -409,10 +408,9 @@ static int bcm2835_debugfs_regset(struct bcm2835_cprman *cprman, u32 base,
 	regset->nregs = nregs;
 	regset->base = cprman->regs + base;
 
-	regdump = debugfs_create_regset32("regdump", S_IRUGO, dentry,
-					  regset);
+	debugfs_create_regset32("regdump", S_IRUGO, dentry, regset);
 
-	return regdump ? 0 : -ENOMEM;
+	return 0;
 }
 
 struct bcm2835_pll_data {
-- 
2.17.0

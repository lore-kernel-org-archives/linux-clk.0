Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38039 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbeG3NY6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Jul 2018 09:24:58 -0400
Received: by mail-lf1-f67.google.com with SMTP id a4-v6so7930602lff.5
        for <linux-clk@vger.kernel.org>; Mon, 30 Jul 2018 04:50:21 -0700 (PDT)
Date: Mon, 30 Jul 2018 14:50:08 +0300
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: lgirdwood@gmail.com, broonie@kernel.org, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc: linux-clk@vger.kernel.org
Subject: [PATCH] regulator: bd71837: adobt MFD changes to regulator driver
Message-ID: <20180730115008.GA30634@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

MFD part for bd71837 was changed during the review. Clean regulator part to
match changed MFD:
- renamed header file => fix include
- remove unused platdata as also type definition was removed
- Kconfig option for MFD part was changed => fix depends on clause
- Rename Kconfig option for regulators
  As Kconfig option for regulators gets now used (when dependency to MFD is
  satisfied) change it so that it won't require new change when support for
  bd71847 is added.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

---

Please note that the MFD part is still not accepted/applied but I don't
expect big (any?) new changes to it. v11 of MFD part was sent for review
here:
https://lore.kernel.org/lkml/cover.1532946848.git.matti.vaittinen@fi.rohmeurope.com/

 drivers/regulator/Kconfig             | 4 ++--
 drivers/regulator/Makefile            | 2 +-
 drivers/regulator/bd71837-regulator.c | 7 +------
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 2964eaea94c0..ff33b4c34d41 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -180,9 +180,9 @@ config REGULATOR_BCM590XX
 	  BCM590xx PMUs. This will enable support for the software
 	  controllable LDO/Switching regulators.
 
-config REGULATOR_BD71837
+config REGULATOR_BD718XX
 	tristate "ROHM BD71837 Power Regulator"
-	depends on MFD_BD71837
+	depends on MFD_ROHM_BD718XX
 	help
 	  This driver supports voltage regulators on ROHM BD71837 PMIC.
 	  This will enable support for the software controllable buck
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index bd818ceb7c72..b03a7e71d30b 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -27,7 +27,7 @@ obj-$(CONFIG_REGULATOR_AS3711) += as3711-regulator.o
 obj-$(CONFIG_REGULATOR_AS3722) += as3722-regulator.o
 obj-$(CONFIG_REGULATOR_AXP20X) += axp20x-regulator.o
 obj-$(CONFIG_REGULATOR_BCM590XX) += bcm590xx-regulator.o
-obj-$(CONFIG_REGULATOR_BD71837) += bd71837-regulator.o
+obj-$(CONFIG_REGULATOR_BD718XX) += bd71837-regulator.o
 obj-$(CONFIG_REGULATOR_BD9571MWV) += bd9571mwv-regulator.o
 obj-$(CONFIG_REGULATOR_DA903X)	+= da903x.o
 obj-$(CONFIG_REGULATOR_DA9052)	+= da9052-regulator.o
diff --git a/drivers/regulator/bd71837-regulator.c b/drivers/regulator/bd71837-regulator.c
index 3a487255482c..0f8ac8dec3e1 100644
--- a/drivers/regulator/bd71837-regulator.c
+++ b/drivers/regulator/bd71837-regulator.c
@@ -7,7 +7,7 @@
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
-#include <linux/mfd/bd71837.h>
+#include <linux/mfd/rohm-bd718x7.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
@@ -490,7 +490,6 @@ struct reg_init {
 static int bd71837_probe(struct platform_device *pdev)
 {
 	struct bd71837_pmic *pmic;
-	struct bd71837_board *pdata;
 	struct regulator_config config = { 0 };
 	struct reg_init pmic_regulator_inits[] = {
 		{
@@ -558,7 +557,6 @@ static int bd71837_probe(struct platform_device *pdev)
 		goto err;
 	}
 	platform_set_drvdata(pdev, pmic);
-	pdata = dev_get_platdata(pmic->mfd->dev);
 
 	/* Register LOCK release */
 	err = regmap_update_bits(pmic->mfd->regmap, BD71837_REG_REGLOCK,
@@ -578,9 +576,6 @@ static int bd71837_probe(struct platform_device *pdev)
 
 		desc = &pmic->descs[i];
 
-		if (pdata)
-			config.init_data = pdata->init_data[i];
-
 		config.dev = pdev->dev.parent;
 		config.driver_data = pmic;
 		config.regmap = pmic->mfd->regmap;
-- 
2.14.3


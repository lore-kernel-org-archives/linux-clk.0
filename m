Return-Path: <dan.carpenter@oracle.com>
Date: Sat, 2 Jun 2018 10:52:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Lechner <david@lechnology.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: davinci: cfgchip: testing the wrong variable
Message-ID: <20180602075256.hrvidsfsmr33mv2f@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

There is a copy and paste bug here.  We should be testing "usb1" instead
of "usb0".

Fixes: 58e1e2d2cd89 ("clk: davinci: cfgchip: Add TI DA8XX USB PHY clocks")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
index c971111d2601..20a120aa147e 100644
--- a/drivers/clk/davinci/da8xx-cfgchip.c
+++ b/drivers/clk/davinci/da8xx-cfgchip.c
@@ -672,7 +672,7 @@ static int of_da8xx_usb_phy_clk_init(struct device *dev, struct regmap *regmap)
 
 	usb1 = da8xx_cfgchip_register_usb1_clk48(dev, regmap);
 	if (IS_ERR(usb1)) {
-		if (PTR_ERR(usb0) == -EPROBE_DEFER)
+		if (PTR_ERR(usb1) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
 
 		dev_warn(dev, "Failed to register usb1_clk48 (%ld)\n",

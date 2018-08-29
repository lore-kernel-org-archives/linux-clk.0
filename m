Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: "A.s. Dong" <aisheng.dong@nxp.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <AM0PR04MB4211368561A415B255782CBE803D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "thor.thayer@linux.intel.com" <thor.thayer@linux.intel.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <1527244643-10736-1-git-send-email-aisheng.dong@nxp.com>
 <AM0PR04MB421114F8AFAE56B6D7C2D1E480770@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <AM0PR04MB4211368561A415B255782CBE803D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <153551211897.129321.14630649454821319736@swboyd.mtv.corp.google.com>
Subject: RE: [PATCH V3 0/4] clk: new APIs to handle all available clocks
Date: Tue, 28 Aug 2018 20:08:38 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting A.s. Dong (2018-08-16 19:33:52)
> Hi Stephen,
> =

> Do you want me to resend this series for review?
> It seems have been pending for quite a long time.
> =

> Thor just pinged me for its status as he wants to use it.
> =


I was waiting for someone to try them out or review them. Good that it
happened!

I've taken a look at the patches and I'm slightly annoyed with the API
that passes in a double pointer to clk_bulk_data and returns a count of
the number of clks found. I guess it's ok though. It's really just this
line:

	devres->clks =3D *clks;

which makes my brain all confused and go think about what's being
assigned and if it's a struct copy or not.

Maybe this on top would make it easier to take? I'll think about it
tonight.

---8<---
diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 6d3ca5ec5de8..12c87457eca1 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -81,9 +81,9 @@ int __must_check devm_clk_bulk_get_all(struct device *dev,
 	if (!devres)
 		return -ENOMEM;
 =

-	ret =3D clk_bulk_get_all(dev, clks);
+	ret =3D clk_bulk_get_all(dev, &devres->clks);
 	if (ret > 0) {
-		devres->clks =3D *clks;
+		*clks =3D devres->clks;
 		devres->num_clks =3D ret;
 		devres_add(dev, devres);
 	} else {

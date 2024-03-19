Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1013BBCA
	for <linux-clk@vger.kernel.org>; Tue, 19 Mar 2024 07:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710833755; cv=none; b=CwYx//tpg++oTn5VWl1y0Dk0AJPYMSP8Jox01ljoyRkHO2K4fsNtoBeM8d4eD7E9y613L5xP/zuX9qp4wtA/PjpznRZRMtigp+Aakan17/grDci0gCHqfHiGEA9L5FbVdIa/jH5gu7tAcdxXFEoF7R5FuDNNRaPY4/5mK8sKA+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710833755; c=relaxed/simple;
	bh=vm5nYin+aHdpGbz/mHFO3XKOCe/Z41lh/7ifOtVhpOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPNAP0fDO6z59uCOxG+Io0ForrZ3yxHktecRCeOO1QklcdrfywDpmIqDFkjOzHbguLabcMqroHvUoOECRu5GUm5nZ1CHqhtROUd3mS5ykXa9z+MDNkBQZ+ZLKP2P9qevlCbAAsUrypVuWlLyPNVubeGEfX9t6i3HVM6iDmcNTkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1rmU0b-0000V1-2T; Tue, 19 Mar 2024 08:35:41 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1rmU0a-007EFT-8X; Tue, 19 Mar 2024 08:35:40 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1rmU0a-006xyd-0T;
	Tue, 19 Mar 2024 08:35:40 +0100
Date: Tue, 19 Mar 2024 08:35:40 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Peng Fan <peng.fan@nxp.com>
Cc: "S.J. Wang" <shengjiu.wang@nxp.com>,
	"abelvesa@kernel.org" <abelvesa@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	dl-linux-imx <linux-imx@nxp.com>,
	"shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: imx: imx8mp: Add pm_runtime support for power saving
Message-ID: <20240319073540.2zvwq7fvft3h6mbr@pengutronix.de>
References: <1710743811-1698-1-git-send-email-shengjiu.wang@nxp.com>
 <DU0PR04MB941745611C0FE10E847C4B25882D2@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB941745611C0FE10E847C4B25882D2@DU0PR04MB9417.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On 24-03-18, Peng Fan wrote:
> > Subject: [PATCH] clk: imx: imx8mp: Add pm_runtime support for power
> > saving
> > 
> > Add pm_runtime support for power saving. In pm runtime suspend state the
> > registers will be reseted, so add registers save in pm runtime suspend and
> > restore them in pm runtime resume.

We had similar patches in our downstream repo but didn't upstream yet
since there was an clk-handing issue. IIRC the issue was regarding the
global clock-prepare lock and a circular dependency on it. Is this
resolved now?

Regards,
  Marco

> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/clk/imx/clk-imx8mp-audiomix.c | 99 ++++++++++++++++++++++++++-
> >  1 file changed, 96 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-
> > imx8mp-audiomix.c
> > index 55ed211a5e0b..d2bf53e2aacf 100644
> > --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> > +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> > @@ -7,10 +7,12 @@
> > 
> >  #include <linux/clk-provider.h>
> >  #include <linux/device.h>
> > +#include <linux/io.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > 
> >  #include <dt-bindings/clock/imx8mp-clock.h>
> > 
> > @@ -18,6 +20,7 @@
> > 
> >  #define CLKEN0			0x000
> >  #define CLKEN1			0x004
> > +#define EARC			0x200
> >  #define SAI1_MCLK_SEL		0x300
> >  #define SAI2_MCLK_SEL		0x304
> >  #define SAI3_MCLK_SEL		0x308
> > @@ -26,6 +29,12 @@
> >  #define SAI7_MCLK_SEL		0x314
> >  #define PDM_SEL			0x318
> >  #define SAI_PLL_GNRL_CTL	0x400
> > +#define SAI_PLL_FDIVL_CTL0	0x404
> > +#define SAI_PLL_FDIVL_CTL1	0x408
> > +#define SAI_PLL_SSCG_CTL	0x40C
> > +#define SAI_PLL_MNIT_CTL	0x410
> > +#define IPG_LP_CTRL		0x504
> > +#define REGS_NUM		16
> > 
> >  #define SAIn_MCLK1_PARENT(n)						\
> >  static const struct clk_parent_data					\
> > @@ -182,13 +191,65 @@ static struct clk_imx8mp_audiomix_sel sels[] = {
> >  	CLK_SAIn(7)
> >  };
> > 
> > +struct clk_imx8mp_audiomix_regs {
> > +	u32 regs_num;
> > +	u32 regs_off[];
> > +};
> > +
> > +static const struct clk_imx8mp_audiomix_regs audiomix_regs = {
> > +	.regs_num = REGS_NUM,
> > +	.regs_off = {
> > +		CLKEN0,
> > +		CLKEN1,
> > +		EARC,
> > +		SAI1_MCLK_SEL,
> > +		SAI2_MCLK_SEL,
> > +		SAI3_MCLK_SEL,
> > +		SAI5_MCLK_SEL,
> > +		SAI6_MCLK_SEL,
> > +		SAI7_MCLK_SEL,
> > +		PDM_SEL,
> > +		SAI_PLL_GNRL_CTL,
> > +		SAI_PLL_FDIVL_CTL0,
> > +		SAI_PLL_FDIVL_CTL1,
> > +		SAI_PLL_SSCG_CTL,
> > +		SAI_PLL_MNIT_CTL,
> > +		IPG_LP_CTRL
> > +	},
> > +};
> > +
> > +struct clk_imx8mp_audiomix_drvdata {
> > +	void __iomem *base;
> > +	u32 regs_save[REGS_NUM];
> > +};
> > +
> > +static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool
> > +save) {
> > +	struct clk_imx8mp_audiomix_drvdata *drvdata =
> > dev_get_drvdata(dev);
> > +	void __iomem *base = drvdata->base;
> > +	int i;
> > +
> > +	if (save) {
> > +		for (i = 0; i < audiomix_regs.regs_num; i++)
> > +			drvdata->regs_save[i] = readl(base +
> > audiomix_regs.regs_off[i]);
> > +	} else {
> > +		for (i = 0; i < audiomix_regs.regs_num; i++)
> > +			writel(drvdata->regs_save[i], base +
> > audiomix_regs.regs_off[i]);
> > +	}
> > +}
> > +
> >  static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)  {
> > +	struct clk_imx8mp_audiomix_drvdata *drvdata;
> >  	struct clk_hw_onecell_data *priv;
> >  	struct device *dev = &pdev->dev;
> >  	void __iomem *base;
> >  	struct clk_hw *hw;
> > -	int i;
> > +	int i, ret;
> > +
> > +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> > +	if (!drvdata)
> > +		return -ENOMEM;
> > 
> >  	priv = devm_kzalloc(dev,
> >  			    struct_size(priv, hws,
> > IMX8MP_CLK_AUDIOMIX_END), @@ -202,6 +263,9 @@ static int
> > clk_imx8mp_audiomix_probe(struct platform_device *pdev)
> >  	if (IS_ERR(base))
> >  		return PTR_ERR(base);
> > 
> > +	drvdata->base = base;
> > +	dev_set_drvdata(dev, drvdata);
> > +
> >  	for (i = 0; i < ARRAY_SIZE(sels); i++) {
> >  		if (sels[i].num_parents == 1) {
> >  			hw = devm_clk_hw_register_gate_parent_data(dev,
> > @@ -257,10 +321,38 @@ static int clk_imx8mp_audiomix_probe(struct
> > platform_device *pdev)
> >  	if (IS_ERR(hw))
> >  		return PTR_ERR(hw);
> > 
> > -	return devm_of_clk_add_hw_provider(&pdev->dev,
> > of_clk_hw_onecell_get,
> > -					   priv);
> > +	ret = devm_of_clk_add_hw_provider(&pdev->dev,
> > of_clk_hw_onecell_get,
> > +					  priv);
> > +	if (ret)
> > +		return ret;
> > +
> > +	pm_runtime_enable(&pdev->dev);
> > +	clk_imx8mp_audiomix_save_restore(&pdev->dev, true);
> > +
> > +	return 0;
> >  }
> > 
> > +static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev) {
> > +	clk_imx8mp_audiomix_save_restore(dev, true);
> > +
> > +	return 0;
> > +}
> > +
> > +static int clk_imx8mp_audiomix_runtime_resume(struct device *dev) {
> > +	clk_imx8mp_audiomix_save_restore(dev, false);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct dev_pm_ops clk_imx8mp_audiomix_pm_ops = {
> > +	SET_RUNTIME_PM_OPS(clk_imx8mp_audiomix_runtime_suspend,
> > +			   clk_imx8mp_audiomix_runtime_resume, NULL)
> > +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > +				      pm_runtime_force_resume)
> > +};
> > +
> >  static const struct of_device_id clk_imx8mp_audiomix_of_match[] = {
> >  	{ .compatible = "fsl,imx8mp-audio-blk-ctrl" },
> >  	{ /* sentinel */ }
> > @@ -272,6 +364,7 @@ static struct platform_driver
> > clk_imx8mp_audiomix_driver = {
> >  	.driver = {
> >  		.name = "imx8mp-audio-blk-ctrl",
> >  		.of_match_table = clk_imx8mp_audiomix_of_match,
> > +		.pm = &clk_imx8mp_audiomix_pm_ops,
> >  	},
> >  };
> > 
> > --
> > 2.34.1
> 
> 
> 

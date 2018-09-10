Return-Path: <mazziesaccount@gmail.com>
Return-Path: <mazziesaccount@gmail.com>
Date: Mon, 10 Sep 2018 10:28:18 +0300
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: zyw@rock-chips.com, mturquette@baylibre.com, sboyd@kernel.org,
	w.egorov@phytec.de
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Does Rockchip RK808 driver unload work as intended?
Message-ID: <20180910072818.GA2454@localhost.localdomain>
References: <20180907101940.GE2472@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180907101940.GE2472@localhost.localdomain>
List-ID: <linux-clk.vger.kernel.org>

Hello,

On Fri, Sep 07, 2018 at 01:19:40PM +0300, Matti Vaittinen wrote:
> While doing this I hit to Rockchip RK808 driver which seems to utilize
> oarent device (MFD dev) for pretty much all devm releasing. I wonder if
> this is safe? What happens if one tries to remove the RK808 clk module?
> 
> I guess the clk deregistration and cleanups are not ran as parent device
> stays there, right? But is the clk module and clk module code still
> unload? So won't clk operation pointers registered to clk core become
> invalid?
 
Maybe it is a good idea to paste some code and add my thoughts as
comments here.

static int rk808_clkout_probe(struct platform_device *pdev)
{
	/* Get the i2c device "driven by" the parent MFD driver */
        struct rk808 *rk808 = dev_get_drvdata(pdev->dev.parent);
        struct i2c_client *client = rk808->i2c;

	[snip]

	/* Allocate driver provate data using devm - but bind it to MFD
	   device */
	rk808_clkout = devm_kzalloc(&client->dev,
                                    sizeof(*rk808_clkout), GFP_KERNEL);

	[snip]

	/* init clk ops to point operations brought in kernel in this
	   module */
	init.ops = &rk808_clkout1_ops;
        rk808_clkout->clkout1_hw.init = &init;

	[snip]

	/* register clock using devm - bound to parent device again */
        ret = devm_clk_hw_register(&client->dev, &rk808_clkout->clkout1_hw);

	[snip]

/* Omit remove callback => no clk deregistration at module removal */
static struct platform_driver rk808_clkout_driver = {
        .probe = rk808_clkout_probe,
        .driver         = {
                .name   = "rk808-clkout",
        },
};

module_platform_driver(rk808_clkout_driver);


> So can someone please shed some light on this? Is this a bug or am I
> just plain wrong?
> 

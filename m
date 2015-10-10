Return-Path: <sboyd@codeaurora.org>
Date: Fri, 9 Oct 2015 17:09:48 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: York Sun <yorksun@freescale.com>
Cc: linux-clk@vger.kernel.org, pmarrecas@outlook.com,
	Mike Turquette <mturquette@baylibre.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Andrey Filippov <andrey@elphel.com>,
	Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [Resend Patch v6] driver/clk/clk-si5338: Add common clock
 framework driver for si5338
Message-ID: <20151010000948.GW26883@codeaurora.org>
References: <1444410574-28677-1-git-send-email-yorksun@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1444410574-28677-1-git-send-email-yorksun@freescale.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/09, York Sun wrote:
> SI5338 is a programmable clock generator. It has 4 sets of inputs,
> PLL, multisynth and dividers to make 4 outputs. This driver splits
> them into multiple clocks to comply with common clock framework.
> 
> See Documentation/devicetree/bindings/clock/silabs,si5338.txt for
> details.
> 
> Signed-off-by: York Sun <yorksun@freescale.com>
> CC: Mike Turquette <mturquette@baylibre.com>
> CC: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> CC: Guenter Roeck <linux@roeck-us.net>
> CC: Andrey Filippov <andrey@elphel.com>
> CC: Paul Bolle <pebolle@tiscali.nl>
> 
> ---
> This is a resend. I didn't see the v6 patch in mailing list archive.

Can you please refresh this on clk-next? It doesn't compile
there. I've added some more nitpicks. I'll look in more detail
next week.

> +
> +#include <dt-bindings/clock/clk-si5338.h>
> +#include <linux/bsearch.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/freezer.h>

This is used?

> +#include <linux/kernel.h>
> +#include <linux/i2c.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>

Is this used?

> +#include <linux/platform_data/si5338.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +
[...]
> +
> +static u32 awe_fcal[] = {

const?

> +	AWE_FCAL_07_00,
> +	AWE_FCAL_15_08,
> +	AWE_FCAL_17_16,
> +	0
> +};
> +
> +static u32 awe_fcal_ovrd[] = {

const?

> +	AWE_FCAL_OVRD_07_00,
> +	AWE_FCAL_OVRD_15_08,
> +	AWE_FCAL_OVRD_17_15,
> +	0
> +};
> +
[..]
> +
> +static const struct clk_ops si5338_clkout_ops = {
> +	.prepare = si5338_clkout_prepare,
> +	.unprepare = si5338_clkout_unprepare,
> +	.enable = si5338_clkout_enable,
> +	.disable = si5338_clkout_disable,
> +	.set_parent = si5338_clkout_set_parent,
> +	.get_parent = si5338_clkout_get_parent,
> +	.recalc_rate = si5338_clkout_recalc_rate,
> +	.round_rate = si5338_clkout_round_rate,
> +	.set_rate = si5338_clkout_set_rate,
> +};
> +
> +#ifdef CONFIG_DEBUG_FS
> +#include <linux/debugfs.h>

Just include this at the top unconditionally please.

> +
> +/*
> + * Create debugfs files for status for each si5338 clkout
> + */
> +
> +static int clkout_status_show(struct seq_file *s, void *data)
> +{
> +	struct si5338_hw_data *clkout = (struct si5338_hw_data *)s->private;

Useless cast, please remove.

> +	struct si5338_driver_data *drvdata = clkout->drvdata;
> +	int i, j, match = 0;
> +	int drv_type, drv_vdd, drv_trim, drv_invert;
> +	int out_src, src_group = 0, src = 0;
> +	const int in_numbers[] = {
> +		12, 3, 4, 56
[...]
> +/*
> + * To support multiple si5338 chips, we cannot use devm_clk_get because
> + * each chip has its own clock sources. If device tree is not used,
> + * platform driver should provide these clocks. Let the clocks be freed
> + * automatically when device is unbound. We implement our own devm_of_clk_get.
> + */
> +static void devm_of_clk_release(struct device *dev, void *res)
> +{
> +	clk_put(*(struct clk **)res);
> +}
> +
> +static struct clk *devm_of_clk_get(struct device *dev, struct device_node *np,

What is this? I don't get it at all.

> +			    int index)
> +{
> +	struct clk **ptr, *clk;
> +
> +	ptr = devres_alloc(devm_of_clk_release, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	clk = of_clk_get(np, index);
> +
[...]
> +	/*
> +	 * Important: Go through the procedure to check PLL locking
> +	 * and other steps required by si5338 reference manual.
> +	 */
> +	ret = post_init(drvdata);
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(&client->dev, "%s clocks are registered\n", id->name);
> +
> +#ifdef CONFIG_OF

Remove this ifdef

> +	ret = of_clk_add_provider(client->dev.of_node,
> +				  of_clk_src_onecell_get,
> +				  &drvdata->onecell);
> +	if (ret) {
> +		dev_err(&client->dev, "unable to add clk provider\n");
> +		return ret;
[..]
> +
> +static int si5338_i2c_remove(struct i2c_client *client)
> +{
> +	struct si5338_driver_data *drvdata = i2c_get_clientdata(client);
> +	int n;
> +
> +#ifdef CONFIG_OF

And this one.

> +	of_clk_del_provider(client->dev.of_node);
> +#endif
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

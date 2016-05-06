Return-Path: <sboyd@codeaurora.org>
Date: Fri, 6 May 2016 11:19:53 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: mturquette@baylibre.com, p.zabel@pengutronix.de,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, yanhaifeng@hisilicon.com,
	yanghongwei@hisilicon.com, suwenping@hisilicon.com,
	raojun@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com,
	zhangzhenxing@hisilicon.com, hermit.wangheming@hisilicon.com,
	jiangheng@hisilicon.com
Subject: Re: [PATCH 3/3] clk: hisilicon: add CRG driver for hi3519 soc
Message-ID: <20160506181953.GA3492@codeaurora.org>
References: <1461397230-1757-1-git-send-email-xuejiancheng@hisilicon.com>
 <1461397230-1757-4-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1461397230-1757-4-git-send-email-xuejiancheng@hisilicon.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/23, Jiancheng Xue wrote:
> +
> +static int hi3519_clk_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct hisi_clock_data *clk_data;
> +	struct hisi_reset_controller *rstc;
> +
> +	rstc = hisi_reset_init(np);
> +	if (!rstc)
> +		return -ENOMEM;
> +
> +	clk_data = hisi_clk_init(np, HI3519_NR_CLKS);

This creates and registers a clk provider...

> +	if (!clk_data) {
> +		hisi_reset_exit(rstc);
> +		return -ENODEV;
> +	}
> +
> +	hisi_clk_register_fixed_rate(hi3519_fixed_rate_clks,
> +				     ARRAY_SIZE(hi3519_fixed_rate_clks),
> +				     clk_data);
> +	hisi_clk_register_mux(hi3519_mux_clks, ARRAY_SIZE(hi3519_mux_clks),
> +					clk_data);
> +	hisi_clk_register_gate(hi3519_gate_clks,
> +			ARRAY_SIZE(hi3519_gate_clks), clk_data);
> +

And then this actually populates those clks into the provider's
array of clks..

That isn't good because now we have an ordering problem where the
provider has published itself before it can provide clks to
consumers. Hopefully no race condition arises!

Also, we don't check errors here upon registering clks. Not good
in the case of probe defer or something.

Finally, we should still have a driver remove path even if it's
builtin because userspace can unbind drivers, unless we configure
the struct driver to prevent that. Please do one or the other
here (I would guess you're leaning toward the driver attribute to
prevent unbinding).

> +	return 0;
> +}
> +
> +static const struct of_device_id hi3519_clk_match_table[] = {
> +	{ .compatible = "hisilicon,hi3519-crg" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, hi3519_clk_match_table);
> +
> +static struct platform_driver hi3519_clk_driver = {
> +	.probe          = hi3519_clk_probe,
> +	.driver         = {
> +		.name   = "hi3519-clk",
> +		.of_match_table = hi3519_clk_match_table,
> +	},
> +};
> +

Anyway, I applied this to a new immutable branch clk-hi3519 in
the clk tree and merged it into clk-next. Please send follow up
patches to fix these theoretical problems.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

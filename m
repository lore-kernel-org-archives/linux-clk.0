Return-Path: <sboyd@codeaurora.org>
Date: Wed, 20 May 2015 16:07:51 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Lars-Peter Clausen <lars@metafoo.de>,
	Mike Turquette <mturquette@linaro.org>,
	Ralf Baechle <ralf@linux-mips.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 30/37] clk: ingenic: add JZ4780 CGU support
Message-ID: <20150520230751.GY31753@codeaurora.org>
References: <1429881457-16016-1-git-send-email-paul.burton@imgtec.com>
 <1429881457-16016-31-git-send-email-paul.burton@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1429881457-16016-31-git-send-email-paul.burton@imgtec.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/24, Paul Burton wrote:
> diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
> new file mode 100644
> index 0000000..950616a
> --- /dev/null
> +++ b/drivers/clk/ingenic/jz4780-cgu.c
> @@ -0,0 +1,736 @@
> +
> +struct clk_ops jz4780_otg_phy_ops = {

static?

> +	.get_parent = jz4780_otg_phy_get_parent,
> +	.set_parent = jz4780_otg_phy_set_parent,
> +
> +	.recalc_rate = jz4780_otg_phy_recalc_rate,
> +	.round_rate = jz4780_otg_phy_round_rate,
> +	.set_rate = jz4780_otg_phy_set_rate,
> +};
[...]
> +
> +static void __init jz4780_cgu_init(struct device_node *np)
> +{
> +	int retval;
> +
> +	cgu = ingenic_cgu_new(jz4780_cgu_clocks,
> +			      ARRAY_SIZE(jz4780_cgu_clocks), np);
> +	if (!cgu) {
> +		pr_err("%s: failed to initialise CGU\n", __func__);
> +		return;
> +	}
> +
> +	retval = ingenic_cgu_register_clocks(cgu);
> +	if (retval) {
> +		pr_err("%s: failed to register CGU Clocks\n", __func__);
> +		return;
> +	}
> +
> +	clk_set_parent(cgu->clocks.clks[JZ4780_CLK_UHC],
> +		       cgu->clocks.clks[JZ4780_CLK_MPLL]);

Can you do this via assigned- parents?

> +}
> +CLK_OF_DECLARE(jz4780_cgu, "ingenic,jz4780-cgu", jz4780_cgu_init);

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

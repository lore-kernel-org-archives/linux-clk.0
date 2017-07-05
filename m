Return-Path: <sboyd@codeaurora.org>
Date: Wed, 5 Jul 2017 14:17:53 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
	geert+renesas@glider.be, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0
 clock selector PHY
Message-ID: <20170705211753.GV22780@codeaurora.org>
References: <1498631315-15730-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1498631315-15730-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/28, Yoshihiro Shimoda wrote:
> +
> +
> +	platform_set_drvdata(pdev, priv);
> +	dev_set_drvdata(dev, priv);
> +
> +	init.name = "rcar_usb2_clock_sel";
> +	init.ops = &usb2_clock_sel_clock_ops;
> +	init.flags = CLK_IS_BASIC;

Please drop CLK_IS_BASIC unless you need it.

> +	init.parent_names = NULL;
> +	init.num_parents = 0;
> +	priv->hw.init = &init;
> +
> +	clk = clk_register(NULL, &priv->hw);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	error = of_clk_add_provider(np, of_clk_src_simple_get, clk);

Can you use clk_hw_register() and of_clk_add_hw_provider()
please?

> +	if (error)
> +		return error;
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops rcar_usb2_clock_sel_pm_ops = {
> +	.suspend	= rcar_usb2_clock_sel_suspend,
> +	.resume		= rcar_usb2_clock_sel_resume,
> +};
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <sboyd@codeaurora.org>
Date: Fri, 15 Apr 2016 16:46:31 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, CARLOS.PALMINHA@synopsys.com,
	Alexey.Brodkin@synopsys.com, Vineet.Gupta1@synopsys.com,
	mturquette@baylibre.com
Subject: Re: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
Message-ID: <20160415234631.GB4690@codeaurora.org>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/11, Jose Abreu wrote:
> new file mode 100644
> index 0000000..3ba4e2f
> --- /dev/null
> +++ b/drivers/clk/axs10x/i2s_pll_clock.c
> @@ -0,0 +1,217 @@
> +
> +static int i2s_pll_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
> +	const char *clk_name;
> +	struct clk *clk;
> +	struct i2s_pll_clk *pll_clk;
> +	struct clk_init_data init;
> +	struct resource *mem;
> +
> +	if (!node)
> +		return -ENODEV;

Does this ever happen? Looks like dead code.

> +
> +	pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
> +	if (!pll_clk)
> +		return -ENOMEM;
> +
> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	pll_clk->base = devm_ioremap_resource(dev, mem);
> +	if (IS_ERR(pll_clk->base))
> +		return PTR_ERR(pll_clk->base);
> +
> +	clk_name = node->name;
> +	init.name = clk_name;
> +	init.ops = &i2s_pll_ops;
> +	init.num_parents = 0;
> +	pll_clk->hw.init = &init;
> +
> +	clk = clk_register(NULL, &pll_clk->hw);

Pass dev as first argument. Also use devm_clk_register() instead.

> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "failed to register %s div clock (%ld)\n",
> +				clk_name, PTR_ERR(clk));
> +		return PTR_ERR(clk);
> +	}
> +
> +	if (readl((void *)FPGA_VER_INFO) <= FPGA_VER_27M) {

Please don't readl directly from addresses. I think I mentioned
that before and didn't get back to you when you replied asking
for other solutions. I still think a proper DT is in order
instead of doing this check for ref_clk.

> +		pll_clk->ref_clk = 27000000;
> +		pll_clk->pll_cfg = i2s_pll_cfg_27m;
> +	} else {
> +		pll_clk->ref_clk = 28224000;
> +		pll_clk->pll_cfg = i2s_pll_cfg_28m;
> +	}

We should do this before registering the clk with the framework.

> +
> +	return of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +}
> +
> +static int i2s_pll_clk_remove(struct platform_device *pdev)
> +{
> +	of_clk_del_provider(pdev->dev.of_node);
> +	return 0;
> +}
> +
> +static const struct of_device_id i2s_pll_clk_id[] = {
> +	{ .compatible = "snps,i2s-pll-clock", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, i2s_pll_clk_id);
> +
> +static struct platform_driver i2s_pll_clk_driver = {
> +	.driver = {
> +		.name = "i2s-pll-clock",
> +		.of_match_table = of_match_ptr(i2s_pll_clk_id),

You can drop of_match_ptr(), it doesn't have much use besides
introducing compilation warnings.

> +	},
> +	.probe = i2s_pll_clk_probe,
> +	.remove = i2s_pll_clk_remove,
> +};
> +module_platform_driver(i2s_pll_clk_driver);
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

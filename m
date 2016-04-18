Return-Path: <Jose.Abreu@synopsys.com>
Subject: Re: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
To: Stephen Boyd <sboyd@codeaurora.org>, Jose Abreu <Jose.Abreu@synopsys.com>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
 <20160415234631.GB4690@codeaurora.org>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-snps-arc@lists.infradead.org>, <CARLOS.PALMINHA@synopsys.com>,
	<Alexey.Brodkin@synopsys.com>, <Vineet.Gupta1@synopsys.com>,
	<mturquette@baylibre.com>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <5714B763.8010109@synopsys.com>
Date: Mon, 18 Apr 2016 11:30:59 +0100
MIME-Version: 1.0
In-Reply-To: <20160415234631.GB4690@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,


On 16-04-2016 00:46, Stephen Boyd wrote:
> On 04/11, Jose Abreu wrote:
>> new file mode 100644
>> index 0000000..3ba4e2f
>> --- /dev/null
>> +++ b/drivers/clk/axs10x/i2s_pll_clock.c
>> @@ -0,0 +1,217 @@
>> +
>> +static int i2s_pll_clk_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *node = dev->of_node;
>> +	const char *clk_name;
>> +	struct clk *clk;
>> +	struct i2s_pll_clk *pll_clk;
>> +	struct clk_init_data init;
>> +	struct resource *mem;
>> +
>> +	if (!node)
>> +		return -ENODEV;
> Does this ever happen? Looks like dead code.

Will remove.

>> +
>> +	pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
>> +	if (!pll_clk)
>> +		return -ENOMEM;
>> +
>> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	pll_clk->base = devm_ioremap_resource(dev, mem);
>> +	if (IS_ERR(pll_clk->base))
>> +		return PTR_ERR(pll_clk->base);
>> +
>> +	clk_name = node->name;
>> +	init.name = clk_name;
>> +	init.ops = &i2s_pll_ops;
>> +	init.num_parents = 0;
>> +	pll_clk->hw.init = &init;
>> +
>> +	clk = clk_register(NULL, &pll_clk->hw);
> Pass dev as first argument. Also use devm_clk_register() instead.

Ok.

>> +	if (IS_ERR(clk)) {
>> +		dev_err(dev, "failed to register %s div clock (%ld)\n",
>> +				clk_name, PTR_ERR(clk));
>> +		return PTR_ERR(clk);
>> +	}
>> +
>> +	if (readl((void *)FPGA_VER_INFO) <= FPGA_VER_27M) {
> Please don't readl directly from addresses. I think I mentioned
> that before and didn't get back to you when you replied asking
> for other solutions. I still think a proper DT is in order
> instead of doing this check for ref_clk.

I think that the DT approach would be better but I also think that using two DT
files with only one change between them is not viable. I can see some alternatives:
    1) Pass the region of FPGA version in reg field of DT so that writel is not
directly used;
    2) Create a dummy parent clock driver that reads from FPGA version register
and returns the rate;
    3) Last resort: Use two DT files for each FPGA version.

@Vineet, @Alexey: Can you give some suggestions?

Some background:
We are expecting a new firmware release for the AXS board that will change the
reference clock value of the I2S PLL from 27MHz to 28.224MHz. Due to this change
the dividers of this PLL will change. Right now I am directly reading from the
FPGA version register but Stephen suggested to use a DT approach so that this
rate is declared as parent clock. This would be a good solution but would
require the usage of two different DT files (one for the current firmware and
another for the new firmware), which I think is not ideal. What is your opinion?
Some other solutions are listed above.

>> +		pll_clk->ref_clk = 27000000;
>> +		pll_clk->pll_cfg = i2s_pll_cfg_27m;
>> +	} else {
>> +		pll_clk->ref_clk = 28224000;
>> +		pll_clk->pll_cfg = i2s_pll_cfg_28m;
>> +	}
> We should do this before registering the clk with the framework.

Ok.

>> +
>> +	return of_clk_add_provider(node, of_clk_src_simple_get, clk);
>> +}
>> +
>> +static int i2s_pll_clk_remove(struct platform_device *pdev)
>> +{
>> +	of_clk_del_provider(pdev->dev.of_node);
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id i2s_pll_clk_id[] = {
>> +	{ .compatible = "snps,i2s-pll-clock", },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, i2s_pll_clk_id);
>> +
>> +static struct platform_driver i2s_pll_clk_driver = {
>> +	.driver = {
>> +		.name = "i2s-pll-clock",
>> +		.of_match_table = of_match_ptr(i2s_pll_clk_id),
> You can drop of_match_ptr(), it doesn't have much use besides
> introducing compilation warnings.

Ok.

>> +	},
>> +	.probe = i2s_pll_clk_probe,
>> +	.remove = i2s_pll_clk_remove,
>> +};
>> +module_platform_driver(i2s_pll_clk_driver);
>>

Best regards,
Jose Miguel Abreu

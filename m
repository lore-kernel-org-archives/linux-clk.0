Return-Path: <Jose.Abreu@synopsys.com>
Subject: Re: [PATCH v3] clk/axs10x: Add I2S PLL clock driver
To: Stephen Boyd <sboyd@codeaurora.org>, Jose Abreu <Jose.Abreu@synopsys.com>
References: <4018d5e586f6a5b37c665000fbec8f6aad9388f3.1459443839.git.joabreu@synopsys.com>
 <20160402010237.GY18567@codeaurora.org>
CC: <mturquette@baylibre.com>, <Vineet.Gupta1@synopsys.com>,
	<linux-snps-arc@lists.infradead.org>, <Alexey.Brodkin@synopsys.com>,
	<linux-clk@vger.kernel.org>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <57027A79.8060708@synopsys.com>
Date: Mon, 4 Apr 2016 15:30:17 +0100
MIME-Version: 1.0
In-Reply-To: <20160402010237.GY18567@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,


On 02-04-2016 02:02, Stephen Boyd wrote:
> On 03/31, Jose Abreu wrote:
>>  arch/arc/boot/dts/axs10x_mb.dtsi   |   5 ++
> Please remove this diff from this patch. dts changes go through
> non-clk trees.

Ok.

>
>>  drivers/clk/Makefile               |   1 +
>>  drivers/clk/axs10x/Makefile        |   1 +
>>  drivers/clk/axs10x/i2s_pll_clock.c | 163 +++++++++++++++++++++++++++++++++++++
> Where is the binding document?

Will send in next version.

>> diff --git a/drivers/clk/axs10x/i2s_pll_clock.c b/drivers/clk/axs10x/i2s_pll_clock.c
>> new file mode 100644
>> index 0000000..f050e70
>> --- /dev/null
>> +++ b/drivers/clk/axs10x/i2s_pll_clock.c
>> @@ -0,0 +1,163 @@
>> +/* FPGA Version Info */
>> +#define FPGA_VER_INFO	0xE0011230
>> +#define FPGA_VER_27M	0x000FBED9
>> +
>> +/* PLL registers addresses */
>> +#define PLL_IDIV_ADDR	0xE00100A0
>> +#define PLL_FBDIV_ADDR	0xE00100A4
>> +#define PLL_ODIV0_ADDR	0xE00100A8
>> +#define PLL_ODIV1_ADDR	0xE00100AC
>> +
>> +struct i2s_pll_cfg {
>> +	unsigned int rate;
>> +	unsigned int idiv;
>> +	unsigned int fbdiv;
>> +	unsigned int odiv0;
>> +	unsigned int odiv1;
>> +};
>> +
>> +static struct i2s_pll_cfg i2s_pll_cfg_27m[] = {
> const?

Will change.

>
>> +	/* 27 Mhz */
>> +	{ 1024000, 0x104, 0x451, 0x10E38, 0x2000 },
>> +	{ 1411200, 0x104, 0x596, 0x10D35, 0x2000 },
>> +	{ 1536000, 0x208, 0xA28, 0x10B2C, 0x2000 },
>> +	{ 2048000, 0x82, 0x451, 0x10E38, 0x2000 },
>> +	{ 2822400, 0x82, 0x596, 0x10D35, 0x2000 },
>> +	{ 3072000, 0x104, 0xA28, 0x10B2C, 0x2000 },
>> +	{ 2116800, 0x82, 0x3CF, 0x10C30, 0x2000 },
>> +	{ 2304000, 0x104, 0x79E, 0x10B2C, 0x2000 },
>> +	{ 0, 0, 0, 0, 0 },
>> +};
>> +
>> +static struct i2s_pll_cfg i2s_pll_cfg_28m[] = {
> const?

Will change.

>
>> +	/* 28.224 Mhz */
>> +	{ 1024000, 0x82, 0x105, 0x107DF, 0x2000 },
>> +	{ 1411200, 0x28A, 0x1, 0x10001, 0x2000 },
>> +	{ 1536000, 0xA28, 0x187, 0x10042, 0x2000 },
>> +	{ 2048000, 0x41, 0x105, 0x107DF, 0x2000 },
>> +	{ 2822400, 0x145, 0x1, 0x10001, 0x2000 },
>> +	{ 3072000, 0x514, 0x187, 0x10042, 0x2000 },
>> +	{ 2116800, 0x514, 0x42, 0x10001, 0x2000 },
>> +	{ 2304000, 0x619, 0x82, 0x10001, 0x2000 },
>> +	{ 0, 0, 0, 0, 0 },
>> +};
>> +
>> +struct i2s_pll_clk {
>> +	struct clk_hw hw;
>> +	unsigned long ref_clk;
>> +	struct i2s_pll_cfg *pll_cfg;
>> +};
>> +
>> +static inline struct i2s_pll_clk *to_i2s_pll_clk(struct clk_hw *hw)
>> +{
>> +	return container_of(hw, struct i2s_pll_clk, hw);
>> +}
>> +
>> +static unsigned int i2s_pll_get_value(unsigned int val)
>> +{
>> +	return ((val & 0x3F) + ((val >> 6) & 0x3F));
> Please drop extraneous parentheses.

Ok.

>> +}
>> +
>> +static unsigned long i2s_pll_recalc_rate(struct clk_hw *hw,
>> +			unsigned long parent_rate)
>> +{
>> +	struct i2s_pll_clk *clk = to_i2s_pll_clk(hw);
>> +	unsigned int idiv, fbdiv, odiv;
>> +
>> +	idiv = i2s_pll_get_value(readl((void *)PLL_IDIV_ADDR));
> We need a real ioremap in this driver instead of casting physical
> addresses to pointers and calling readl on them.

Will implement in next version.

>
>> +	fbdiv = i2s_pll_get_value(readl((void *)PLL_FBDIV_ADDR));
>> +	odiv = i2s_pll_get_value(readl((void *)PLL_ODIV0_ADDR));
>> +
>> +	return (((clk->ref_clk / idiv ) * fbdiv) / odiv);
> Again, too many parentheses. Also, any concerns of 32-bit
> truncation here (i.e. is 64-bit math needed)?

You are right there is no need to use 64-bit math, will change in next version.
>
>> +}
>> +
>> +static long i2s_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>> +			unsigned long *prate)
>> +{
>> +	/* TODO: Round rate to nearest valid rate */
> At the least this should return the rate from the table if it's
> there or failure if it isn't an exact match. Basically do exactly
> what i2s_pll_set_rate() is doing without changing the rate.

Ok, will implement.

>
>> +	return rate;
>> +}
>> +
>> +static int i2s_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>> +			unsigned long parent_rate)
>> +{
>> +	struct i2s_pll_cfg *pll_cfg = to_i2s_pll_clk(hw)->pll_cfg;
>> +	int i;
>> +
>> +	for (i = 0; pll_cfg[i].rate != 0; i++) {
>> +		if (pll_cfg[i].rate == rate) {
>> +			writel(pll_cfg[i].idiv, (void *)PLL_IDIV_ADDR);
>> +			writel(pll_cfg[i].fbdiv, (void *)PLL_FBDIV_ADDR);
>> +			writel(pll_cfg[i].odiv0, (void *)PLL_ODIV0_ADDR);
>> +			writel(pll_cfg[i].odiv1, (void *)PLL_ODIV1_ADDR);
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	pr_err("%s: invalid rate=%ld, parent_rate=%ld\n", __func__,
>> +			rate, parent_rate);
>> +	return -EINVAL;
>> +}
>> +
>> +static const struct clk_ops i2s_pll_ops = {
>> +	.recalc_rate = i2s_pll_recalc_rate,
>> +	.round_rate = i2s_pll_round_rate,
>> +	.set_rate = i2s_pll_set_rate,
>> +};
>> +
>> +static void __init i2s_pll_clk_setup(struct device_node *node)
>> +{
>> +	const char *clk_name = node->name;
>> +	struct clk *clk;
>> +	struct i2s_pll_clk *pll_clk;
>> +	struct clk_init_data init;
>> +
>> +	pll_clk = kzalloc(sizeof(*pll_clk), GFP_KERNEL);
>> +	if (!pll_clk)
>> +		return;
>> +
>> +	init.name = clk_name;
>> +	init.ops = &i2s_pll_ops;
>> +	init.flags = CLK_IS_BASIC;
> Drop CLK_IS_BASIC unless you actually need it.

Ok.

>
>> +	init.num_parents = 0;
>> +	pll_clk->hw.init = &init;
>> +
>> +	clk = clk_register(NULL, &pll_clk->hw);
>> +	if (IS_ERR(clk)) {
>> +		pr_err("%s: failed to register %s div clock (%ld)\n",
>> +				__func__, clk_name, PTR_ERR(clk));
>> +		goto free_clock;
>> +	}
>> +
>> +	if (readl((void *)FPGA_VER_INFO) <= FPGA_VER_27M) {
>> +		pll_clk->ref_clk = 27000000;
> Refclk sounds like parent clk. Perhaps the DTS file should have a
> fixes rate reference clk for this clk and then we could use
> parent/child relationships in the clk framework to pass the
> parent rate to the recalc/round_rate ops? I presume that the FPGA
> info isn't in the same device/region as this clk is.

The FPGA info is in a separate version. But if I implemented this in DTS file we
would need two files, one for older version of FPGA and another one for the new
version, right? The differences between the versions are only the reference
clock value, I think it is not really worth to have a new file to change only
one clock value, is there any other solution?

>
>> +		pll_clk->pll_cfg = i2s_pll_cfg_27m;
>> +	} else {
>> +		pll_clk->ref_clk = 28224000;
>> +		pll_clk->pll_cfg = i2s_pll_cfg_28m;
>> +	}
>> +
>> +	of_clk_add_provider(node, of_clk_src_simple_get, clk);
>> +	return;
>> +
>> +free_clock:
>> +	kfree(pll_clk);
>> +}
>> +
>> +CLK_OF_DECLARE(i2s_pll_clk, "snps,i2s-pll-clock", i2s_pll_clk_setup);
>> +
> Can this be a platform driver instead of using CLK_OF_DECLARE?

Something like this [1] ?

[1] http://lxr.free-electrons.com/source/drivers/clk/clk-scpi.c

Best regards,
Jose Miguel Abreu

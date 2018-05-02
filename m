Return-Path: <gregory.clement@bootlin.com>
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Antoine Tenart <antoine.tenart@bootlin.com>,  Maxime Chevallier <maxime.chevallier@bootlin.com>,  Nadav Haklai <nadavh@marvell.com>,  linux-clk@vger.kernel.org,  linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: mvebu: armada-37xx-periph: add suspend/resume support
References: <20180421142344.25944-1-miquel.raynal@bootlin.com>
	<20180421142344.25944-2-miquel.raynal@bootlin.com>
Date: Wed, 02 May 2018 18:18:37 +0200
In-Reply-To: <20180421142344.25944-2-miquel.raynal@bootlin.com> (Miquel
	Raynal's message of "Sat, 21 Apr 2018 16:23:44 +0200")
Message-ID: <87in868202.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Hi Miquel,
 
 On sam., avril 21 2018, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Add suspend/resume hooks in Armada 37xx peripheral clocks driver to
> handle S2RAM operations.
>
> One can think that these hooks are useless by comparing the register
> values before and after a suspend/resume cycle: they will look the same
> anyway. This is because of some scripts executed by the Cortex-M3 core
> during ATF operations to init both the clocks and the DDR. These values
> could be modified by the BL33 stage or by Linux itself and should be
> preserved.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/mvebu/armada-37xx-periph.c | 48 ++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
> index 723bb7f6cea1..cd560bdcb8a9 100644
> --- a/drivers/clk/mvebu/armada-37xx-periph.c
> +++ b/drivers/clk/mvebu/armada-37xx-periph.c
> @@ -59,6 +59,15 @@ struct clk_periph_driver_data {
>  	struct clk_hw_onecell_data *hw_data;
>  	spinlock_t lock;
>  	void __iomem *reg;
> +#if defined(CONFIG_PM)
> +	/* Storage registers for suspend/resume operations */
> +	u32 tbg_sel;
> +	u32 div_sel0;
> +	u32 div_sel1;
> +	u32 div_sel2;
> +	u32 clk_sel;
> +	u32 clk_dis;
> +#endif /* CONFIG_PM */
>  };
>  
>  struct clk_double_div {
> @@ -642,6 +651,42 @@ static int armada_3700_add_composite_clk(const struct clk_periph_data *data,
>  	return PTR_ERR_OR_ZERO(*hw);
>  }
>  
> +#if defined(CONFIG_PM)

I think you could get rid of this conditional code. Have a look on what
is done in others drivers around DEV_PM_OPS and __maybe_unused.

Gregory


> +static int armada_3700_periph_clock_suspend(struct device *dev)
> +{
> +	struct clk_periph_driver_data *data = dev_get_drvdata(dev);
> +
> +	data->tbg_sel = readl(data->reg + TBG_SEL);
> +	data->div_sel0 = readl(data->reg + DIV_SEL0);
> +	data->div_sel1 = readl(data->reg + DIV_SEL1);
> +	data->div_sel2 = readl(data->reg + DIV_SEL2);
> +	data->clk_sel = readl(data->reg + CLK_SEL);
> +	data->clk_dis = readl(data->reg + CLK_DIS);
> +
> +	return 0;
> +}
> +
> +static int armada_3700_periph_clock_resume(struct device *dev)
> +{
> +	struct clk_periph_driver_data *data = dev_get_drvdata(dev);
> +
> +	/* Follow the same order than what the Cortex-M3 does (ATF code) */
> +	writel(data->clk_dis, data->reg + CLK_DIS);
> +	writel(data->div_sel0, data->reg + DIV_SEL0);
> +	writel(data->div_sel1, data->reg + DIV_SEL1);
> +	writel(data->div_sel2, data->reg + DIV_SEL2);
> +	writel(data->tbg_sel, data->reg + TBG_SEL);
> +	writel(data->clk_sel, data->reg + CLK_SEL);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops armada_3700_periph_clock_pm_ops = {
> +	.suspend        = armada_3700_periph_clock_suspend,
> +	.resume         = armada_3700_periph_clock_resume,
> +};
> +#endif /* CONFIG_PM */
> +
>  static int armada_3700_periph_clock_probe(struct platform_device *pdev)
>  {
>  	struct clk_periph_driver_data *driver_data;
> @@ -716,6 +761,9 @@ static struct platform_driver armada_3700_periph_clock_driver = {
>  	.driver		= {
>  		.name	= "marvell-armada-3700-periph-clock",
>  		.of_match_table = armada_3700_periph_clock_of_match,
> +#if defined(CONFIG_PM)
> +		.pm	= &armada_3700_periph_clock_pm_ops,
> +#endif /* CONFIG_PM */
>  	},
>  };
>  
> -- 
> 2.14.1
>

-- 
Gregory Clement, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

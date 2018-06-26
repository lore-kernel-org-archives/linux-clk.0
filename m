Return-Path: <gregory.clement@bootlin.com>
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Nadav Haklai <nadavh@marvell.com>,  Antoine Tenart <antoine.tenart@bootlin.com>,  Maxime Chevallier <maxime.chevallier@bootlin.com>,  linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: mvebu: armada-37xx-periph: add suspend/resume support
References: <20180626092926.26361-1-miquel.raynal@bootlin.com>
	<20180626092926.26361-2-miquel.raynal@bootlin.com>
Date: Tue, 26 Jun 2018 16:41:07 +0200
In-Reply-To: <20180626092926.26361-2-miquel.raynal@bootlin.com> (Miquel
	Raynal's message of "Tue, 26 Jun 2018 11:29:26 +0200")
Message-ID: <87bmbxa9vg.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Hi Miquel,
 
 On mar., juin 26 2018, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

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

Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory

> ---
>
> Changes since v1:
> =================
> * Defined an ARMADA_3700_DEV_PM_OPS value for when CONFIG_PM is present
>   or not and used it in the platform device structure to define '.pm'.
>
>  drivers/clk/mvebu/armada-37xx-periph.c | 50 ++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
> index a9e3dcc50a7b..99b00f578ae2 100644
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
> @@ -642,6 +651,46 @@ static int armada_3700_add_composite_clk(const struct clk_periph_data *data,
>  	return PTR_ERR_OR_ZERO(*hw);
>  }
>  
> +#if defined(CONFIG_PM)
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
> +
> +#define ARMADA_3700_DEV_PM_OPS (&armada_3700_periph_clock_pm_ops)
> +#else
> +#define ARMADA_3700_DEV_PM_OPS NULL
> +#endif /* CONFIG_PM */
> +
>  static int armada_3700_periph_clock_probe(struct platform_device *pdev)
>  {
>  	struct clk_periph_driver_data *driver_data;
> @@ -717,6 +766,7 @@ static struct platform_driver armada_3700_periph_clock_driver = {
>  	.driver		= {
>  		.name	= "marvell-armada-3700-periph-clock",
>  		.of_match_table = armada_3700_periph_clock_of_match,
> +		.pm	= ARMADA_3700_DEV_PM_OPS,
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

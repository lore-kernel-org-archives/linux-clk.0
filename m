Return-Path: <sboyd@codeaurora.org>
Date: Fri, 22 Apr 2016 16:14:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Binbin Zhou <zhoubb@lemote.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, John Crispin <john@phrozen.org>,
	"Steven J . Hill" <Steven.Hill@imgtec.com>,
	linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>,
	Zhangjin Wu <wuzhangjin@gmail.com>,
	Kelvin Cheung <keguang.zhang@gmail.com>,
	Chunbo Cui <cuicb@lemote.com>, Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH v3 5/8] MIPS: Loongson-1A: Workaround for pll register
 can't be read
Message-ID: <20160422231432.GE13149@codeaurora.org>
References: <1456793296-17120-1-git-send-email-zhoubb@lemote.com>
 <1456793296-17120-6-git-send-email-zhoubb@lemote.com>
 <20160404072925.GD13706@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160404072925.GD13706@linux-mips.org>
List-ID: <linux-clk.vger.kernel.org>

On 04/04, Ralf Baechle wrote:
> On Tue, Mar 01, 2016 at 08:48:13AM +0800, Binbin Zhou wrote:
> > diff --git a/arch/mips/loongson32/common/platform.c b/arch/mips/loongson32/common/platform.c
> > index 97d8c01..a5bb1eb 100644
> > --- a/arch/mips/loongson32/common/platform.c
> > +++ b/arch/mips/loongson32/common/platform.c
> > @@ -63,9 +63,14 @@ struct platform_device ls1x_uart_pdev = {
> >  
> >  void __init ls1x_serial_setup(struct platform_device *pdev)
> >  {
> > -	struct clk *clk;
> >  	struct plat_serial8250_port *p;
> >  
> > +#ifdef CONFIG_CPU_LOONGSON1A
> > +	for (p = pdev->dev.platform_data; p->flags != 0; ++p)
> > +		p->uartclk = ls1a_osc_clk * 2;
> > +#else
> > +	struct clk *clk;
> > +
> >  	clk = clk_get(&pdev->dev, pdev->name);
> >  	if (IS_ERR(clk)) {
> >  		pr_err("unable to get %s clock, err=%ld",
> > @@ -76,6 +81,7 @@ void __init ls1x_serial_setup(struct platform_device *pdev)
> >  
> >  	for (p = pdev->dev.platform_data; p->flags != 0; ++p)
> >  		p->uartclk = clk_get_rate(clk);
> > +#endif

I don't understand this change. Does the framework not work well
enough to tell us the uart clk rate?

> >  }
> >  
> >  /* CPUFreq */
> > diff --git a/arch/mips/loongson32/common/time.c b/arch/mips/loongson32/common/time.c
> > index 0996b02..bba1c84 100644
> > --- a/arch/mips/loongson32/common/time.c
> > +++ b/arch/mips/loongson32/common/time.c
> > @@ -235,3 +235,19 @@ void __init plat_time_init(void)
> >  	mips_hpt_frequency = clk_get_rate(clk) / 2;
> >  #endif /* CONFIG_CEVT_CSRC_LS1X */
> >  }
> > +
> > +#ifdef CONFIG_CPU_LOONGSON1A
> > +unsigned int ls1a_osc_clk = 0, ls1a_cpu_mul = 0;
> > +
> > +static int __init get_cpu_clk(char *string)

Maybe name this function loongson_get_cpu_clk()?

> > diff --git a/drivers/clk/clk-ls1x.c b/drivers/clk/clk-ls1x.c
> > index d4c6198..18326fb 100644
> > --- a/drivers/clk/clk-ls1x.c
> > +++ b/drivers/clk/clk-ls1x.c
> > @@ -32,6 +32,14 @@ static void ls1x_pll_clk_disable(struct clk_hw *hw)
> >  static unsigned long ls1x_pll_recalc_rate(struct clk_hw *hw,
> >  					  unsigned long parent_rate)
> >  {
> > +#ifdef CONFIG_CPU_LOONGSON1A
> > +	/* workaround, loongson 1A pll register can't be read,
> > +	 * on gateway board, multi is set to 11 */
> > +	if (ls1a_osc_clk != 0 && ls1a_cpu_mul != 0)
> > +		return ls1a_osc_clk * ls1a_cpu_mul;
> > +	else
> > +		return 33333333 * 8;
> > +#else
> >  	u32 pll, rate;
> >  
> >  	pll = __raw_readl(LS1X_CLK_PLL_FREQ);
> > @@ -40,6 +48,7 @@ static unsigned long ls1x_pll_recalc_rate(struct clk_hw *hw,
> >  	rate >>= 1;
> >  
> >  	return rate;
> > +#endif
> >  }
> >  
> >  static const struct clk_ops ls1x_pll_clk_ops = {
> > @@ -107,7 +116,8 @@ void __init ls1x_clk_init(void)

Any reason we can't pass the rates to this function?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

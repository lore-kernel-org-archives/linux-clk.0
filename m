Return-Path: <sboyd@codeaurora.org>
Date: Wed, 9 Aug 2017 10:22:13 -0700
From: "sboyd@codeaurora.org" <sboyd@codeaurora.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] ARC: clk: introduce HSDKv1 pll driver
Message-ID: <20170809172213.GB2146@codeaurora.org>
References: <20170714153128.8945-1-Eugeniy.Paltsev@synopsys.com>
 <20170804015351.GW2146@codeaurora.org>
 <1502297028.2586.4.camel@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1502297028.2586.4.camel@synopsys.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/09, Eugeniy Paltsev wrote:
> On Thu, 2017-08-03 at 18:53 -0700, Stephen Boyd wrote:
> > On 07/14, Eugeniy Paltsev wrote:
> > > +	/* input divider = reg.idiv + 1 */
> > > +	idiv = 1 + ((val & CGU_PLL_CTRL_IDIV_MASK) >>
> > > CGU_PLL_CTRL_IDIV_SHIFT);
> > > +	/* fb divider = 2*(reg.fbdiv + 1) */
> > > +	fbdiv = 2 * (1 + ((val & CGU_PLL_CTRL_FBDIV_MASK) >>
> > > CGU_PLL_CTRL_FBDIV_SHIFT));
> > > +	/* output divider = 2^(reg.odiv) */
> > > +	odiv = 1 << ((val & CGU_PLL_CTRL_ODIV_MASK) >>
> > > CGU_PLL_CTRL_ODIV_SHIFT);
> >
> > Maybe just drop these comments. They're just repeating the code.
> 
> Actually I would prefer to keep them, as "2^(reg.odiv)" is more 
> human-readable then
> "1 << ((val & CGU_PLL_CTRL_ODIV_MASK) >> CGU_PLL_CTRL_ODIV_SHIFT)"

Alright.

> 
> > > +
> > > +	rate = (u64)parent_rate * fbdiv;
> > > +	do_div(rate, idiv * odiv);
> > > +
> > > +	return rate;
> > > +}
> > > +
> > > +static long hsdk_pll_round_rate(struct clk_hw *hw, unsigned long
> > > rate,
> > > +				unsigned long *prate)
> > > +{
> > > +	int i;
> > > +	long best_rate;
> > > +	struct hsdk_pll_clk *clk = to_hsdk_pll_clk(hw);
> > > +	const struct hsdk_pll_cfg *pll_cfg = clk->pll_cfg;
> > > +
> > > +	if (pll_cfg[0].rate == 0)
> > > +		return -EINVAL;
> > 
> > This happens?
> 
> Only if we add bad hsdk_pll_cfg table. But it is quite cold code - we
> change pll configuration quite rare, so maybe it's better to keep this
> assert?

Can it be a BUILD_BUG_ON() somehow?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <sboyd@codeaurora.org>
Date: Wed, 12 Jul 2017 16:05:36 -0700
From: "sboyd@codeaurora.org" <sboyd@codeaurora.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH v4] clk: axs10x: introduce AXS10X pll driver
Message-ID: <20170712230536.GE22780@codeaurora.org>
References: <20170621191626.32248-1-Eugeniy.Paltsev@synopsys.com>
 <20170712052535.GY22780@codeaurora.org>
 <1499846503.9320.1.camel@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1499846503.9320.1.camel@synopsys.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/12, Eugeniy Paltsev wrote:
> On Tue, 2017-07-11 at 22:25 -0700, Stephen Boyd wrote:
> > On 06/21, Eugeniy Paltsev wrote:
> > > AXS10X boards manages it's clocks using various PLLs. These PLL has
> > > same
> > > dividers and corresponding control registers mapped to different
> > > addresses.
> > > So we add one common driver for such PLLs.
> > > 
> > > Each PLL on AXS10X board consist of three dividers: IDIV, FBDIV and
> > > ODIV. Output clock value is managed using these dividers.
> > > 
> > > We add pre-defined tables with supported rate values and
> > > appropriate
> > > configurations of IDIV, FBDIV and ODIV for each value.
> > > 
> > > As of today we add support for PLLs that generate clock for the
> > > following devices:
> > >  * ARC core on AXC CPU tiles.
> > >  * ARC PGU on ARC SDP Mainboard.
> > > and more to come later.
> > > 
> > > By this patch we add support for two plls (arc core pll and pgu
> > > pll),
> > > so we had to use two different init types: CLK_OF_DECLARE for arc
> > > core pll and
> > > regular probing for pgu pll.
> > > 
> > > Acked-by: Rob Herring <robh@kernel.org>
> > > Acked-by: Jose Abreu <joabreu@synopsys.com>
> > > 
> > > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> > > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> > > Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> > 
> > Sorry this missed the cutoff for new code for v4.13. Should be in
> > clk-next next week though.
> > 
> > > +}
> > > +
> > > +static inline struct axs10x_pll_clk *to_axs10x_pll_clk(struct
> > > clk_hw *hw)
> > > +{
> > > +	return container_of(hw, struct axs10x_pll_clk, hw);
> > > +}
> > > +
> > > +static inline u32 axs10x_div_get_value(u32 reg)
> > > +{
> > > +	if (PLL_REG_GET_BYPASS(reg))
> > > +		return 1;
> > > +
> > > +	return PLL_REG_GET_HIGH(reg) + PLL_REG_GET_LOW(reg);
> > > +}
> > > +
> > > +static inline u32 axs10x_encode_div(unsigned int id, int upd)
> > > +{
> > > +	u32 div = 0;
> > > +
> > > +	PLL_REG_SET_LOW(div, (id % 2 == 0) ? id >> 1 : (id >> 1) +
> > > 1);
> > > +	PLL_REG_SET_HIGH(div, id >> 1);
> > > +	PLL_REG_SET_EDGE(div, id % 2);
> > > +	PLL_REG_SET_BYPASS(div, id == 1 ? 1 : 0);
> > > +	PLL_REG_SET_NOUPD(div, !upd);
> > 
> > So sparse complains here about a "dubious !x & y". Perhaps this
> > can be changed to
> > 
> > 	PLL_REG_SET_NOUPD(div, upd == 0 ? 1 : 0);
> > 
> > That way sparse doesn't complain. I can make the change when
> > applying if you agree.
> 
> Sure, thanks a lot.
> 

Ok. Applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

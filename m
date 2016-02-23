Return-Path: <slemieux.tyco@gmail.com>
Return-Path: <slemieux.tyco@gmail.com>
Subject: Re: [PATCH] clk: lpc32xx: fix compilation warning
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>, mturquette@baylibre.com,
 stigge@antcom.de, linux-clk@vger.kernel.org
In-Reply-To: <20160222215812.GY4847@codeaurora.org>
References: <1456166940-30268-1-git-send-email-slemieux.tyco@gmail.com>
	 <56CB7594.2040605@mleia.com>  <20160222215812.GY4847@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 23 Feb 2016 13:11:53 -0500
Message-ID: <1456251113.14498.1.camel@localhost>
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2016-02-22 at 13:58 -0800, Stephen Boyd wrote:
> On 02/22, Vladimir Zapolskiy wrote:
> > Hi Sylvain,
> > 
> > On 22.02.2016 20:49, slemieux.tyco@gmail.com wrote:
> > > From: Sylvain Lemieux <slemieux@tycoint.com>
> > > 
> > > This patch remove the following compilation warning:
> > > - drivers/clk/nxp/clk-lpc32xx.c: In function 'lpc32xx_clk_register':
> > >   warning: 'hw' may be used uninitialized in this function [-Wmaybe-uninitialized]
> > > - drivers/clk/nxp/clk-lpc32xx.c: In function 'clk_hclk_pll_round_rate':
> > >   warning: 'p' may be used uninitialized in this function [-Wmaybe-uninitialized]
> > >   warning: 'n' may be used uninitialized in this function [-Wmaybe-uninitialized]
> > >   warning: 'm' may be used uninitialized in this function [-Wmaybe-uninitialized]
> > 
> > All warnings are false positives, please explicitly mention this in the commit message.
OK
> > 
> > > Tested using gcc version 4.7.3.
> > > 
> > > Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> > > ---
> > >  drivers/clk/nxp/clk-lpc32xx.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
> > > index 48b3a11..331f91b 100644
> > > --- a/drivers/clk/nxp/clk-lpc32xx.c
> > > +++ b/drivers/clk/nxp/clk-lpc32xx.c
> > > @@ -13,6 +13,7 @@
> > >  #include <linux/clk-provider.h>
> > >  #include <linux/of_address.h>
> > >  #include <linux/regmap.h>
> > > +#include <linux/compiler-gcc.h>
> > >  
> > >  #include <dt-bindings/clock/lpc32xx-clock.h>
> > >  
> > > @@ -588,7 +589,8 @@ static long clk_hclk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > >  				    unsigned long *parent_rate)
> > >  {
> > >  	struct lpc32xx_pll_clk *clk = to_lpc32xx_pll_clk(hw);
> > > -	u64 m_i, m, n, p, o = rate, i = *parent_rate, d = (u64)rate << 6;
> > > +	u64 m_i, o = rate, i = *parent_rate, d = (u64)rate << 6;
> > > +	u64 uninitialized_var(m), uninitialized_var(n), uninitialized_var(p);
> > 
> > I think that dummy initialization is good enough here, i.e. assigning
> > the variables to 0, AFAIU that's a common way to deal with compiler's false
> > positives, usage of uninitialized_var() looks exotic.
OK
> > 
> > >  	int p_i, n_i;
> > >  
> > >  	pr_debug("%s: %lu/%lu\n", clk_hw_get_name(hw), *parent_rate, rate);
> > > @@ -1414,7 +1416,7 @@ static struct clk * __init lpc32xx_clk_register(u32 id)
> > >  			.flags = lpc32xx_clk->flags,
> > >  			.ops = clk_hw->hw0.ops,
> > >  		};
> > > -		struct clk_hw *hw;
> > > +		struct clk_hw *uninitialized_var(hw);
> > 
> > Same as above, struct clk_hw *hw = NULL would be good enough here.
> > 
> 
> Or return an error pointer in the if/else after this if the type
> doesn't match. We'd like to avoid real uninitialized usage from
> creeping in due to the use of uninitialized_var.
> 
OK

I will send a new revision of the patch later today.

Sylvain

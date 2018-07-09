Return-Path: <alberto@amarulasolutions.com>
Return-Path: <alberto@amarulasolutions.com>
Date: Mon, 9 Jul 2018 18:16:21 +0200
From: Alberto Panizzo <alberto@amarulasolutions.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Anthony Brandon <anthony@amarulasolutions.com>,
	linux-rockchip@lists.infradead.org, mturquette@baylibre.com,
	sboyd@kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: rockchip: rk3399: fix returning correct value
 on clk_i2sout get_rate [with GET_RATE_NOCACHE]
Message-ID: <20180709161620.GA12454@change>
References: <1530883132-17678-1-git-send-email-anthony@amarulasolutions.com>
 <1530883132-17678-2-git-send-email-anthony@amarulasolutions.com>
 <4069085.blmd9nAIm0@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <4069085.blmd9nAIm0@phil>
List-ID: <linux-clk.vger.kernel.org>

Hi Heiko,
On Sun, Jul 08, 2018 at 11:32:19AM +0200, Heiko Stuebner wrote:
> Hi,
> 
> Am Freitag, 6. Juli 2018, 15:18:52 CEST schrieb Anthony Brandon:
> > From: Alberto Panizzo <alberto@amarulasolutions.com>
> > 
> > clk_i2sout can be used as codec mclk.
> > On simple audio card clk_i2sout is just enabled/disabled while the rate
> > is decided on parent clock by i2s driver.
> > Without setting CLK_GET_RATE_NOCACHE flag, the get_rate function on
> > clk_i2sout would return incorrect values after clk_i2sout's parents
> > update.
> 
> Can you elaborate a bit more on the issue you see please?
> Because as far as I remember the clock-framework should already
> update child-clocks when the rate of their parent changed.
> 
> So even the cached rate should be correct after the parent changes,
> so I don't really understand in what case you would get a wrong rate.
> 

You are right, I'm sorry this patch were coming from days of long test and
checks to understand why clk_get_rate were returning 0 while parents clocks
were set.
(And working with a codec which does not offer deterministic results)

Especially, after having found and fixed the bits misconfigurations, a
clk_get_rate on clk_i2sout before the first clk_i2s0 set_rate is
returning 0.

But clk_i2s0_mux results unparented before first clk_i2s0 set_rate and with
or without NOCACHE, until a set_rate is called on clk_i2s0, a get_rate on
clk_i2sout will return 0.

This does not prevent good behavior after first _hw_params()
so please, drop this patch.

But patch 1/2 is necessary, please apply.

Thanks,

Alberto Panizzo
--
Amarula Solutions SRL                     Via le Canevare 30 31100 Treviso Italy
Amarula Solutions BV           Cruquiuskade 47 Amsterdam 1018 AM The Netherlands
Phone. +31(0)851119171 Fax. +31(0)204106211             www.amarulasolutions.com
 
> 
> 
> > Signed-off-by: Alberto Panizzo <alberto@amarulasolutions.com>
> > Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
> > ---
> >  drivers/clk/rockchip/clk-rk3399.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
> > index 2a8634a..6073479 100644
> > --- a/drivers/clk/rockchip/clk-rk3399.c
> > +++ b/drivers/clk/rockchip/clk-rk3399.c
> > @@ -630,7 +630,8 @@ static struct rockchip_clk_branch rk3399_clk_branches[] __initdata = {
> >  
> >  	MUX(0, "clk_i2sout_src", mux_i2sch_p, CLK_SET_RATE_PARENT,
> >  			RK3399_CLKSEL_CON(31), 0, 2, MFLAGS),
> > -	COMPOSITE_NODIV(SCLK_I2S_8CH_OUT, "clk_i2sout", mux_i2sout_p, CLK_SET_RATE_PARENT,
> > +	COMPOSITE_NODIV(SCLK_I2S_8CH_OUT, "clk_i2sout", mux_i2sout_p,
> > +			CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> >  			RK3399_CLKSEL_CON(31), 2, 1, MFLAGS,
> >  			RK3399_CLKGATE_CON(8), 12, GFLAGS),
> >  
> > 
> 
> 
> 
> 

-- 
Amarula Solutions SRL                     Via le Canevare 30 31100 Treviso Italy
Amarula Solutions BV           Cruquiuskade 47 Amsterdam 1018 AM The Netherlands
Phone. +31(0)851119171 Fax. +31(0)204106211             www.amarulasolutions.com

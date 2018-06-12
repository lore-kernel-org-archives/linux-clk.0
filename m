Return-Path: <pdeschrijver@nvidia.com>
Date: Tue, 12 Jun 2018 18:43:35 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: Dmitry Osipenko <digetx@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] clk: tegra: Make vde a child of pll_c3
Message-ID: <20180612154335.GX27696@tbergstrom-lnx.Nvidia.com>
References: <20180611082037.31796-1-thierry.reding@gmail.com>
 <5479310.ZEnOGiWBp7@dimapc>
 <20180611160519.GF31977@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20180611160519.GF31977@ulmo>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 11, 2018 at 06:05:19PM +0200, Thierry Reding wrote:
> On Mon, Jun 11, 2018 at 05:17:31PM +0300, Dmitry Osipenko wrote:
> > On Monday, 11 June 2018 11:20:37 MSK Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > The current default is to leave the VDE clock's parent at the default,
> > > which is clk_m. However, that is not a configuration that will allow the
> > > VDE to function. Reparent it to pll_c3 instead to make sure the hardware
> > > can actually decode video content.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  drivers/clk/tegra/clk-tegra124.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/tegra/clk-tegra124.c
> > > b/drivers/clk/tegra/clk-tegra124.c index f5048f82c0b9..b6cf28ca2ed2 100644
> > > --- a/drivers/clk/tegra/clk-tegra124.c
> > > +++ b/drivers/clk/tegra/clk-tegra124.c
> > > @@ -1267,7 +1267,7 @@ static struct tegra_clk_init_table common_init_table[]
> > > __initdata = { { TEGRA124_CLK_I2S2, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
> > >  	{ TEGRA124_CLK_I2S3, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
> > >  	{ TEGRA124_CLK_I2S4, TEGRA124_CLK_PLL_A_OUT0, 11289600, 0 },
> > > -	{ TEGRA124_CLK_VDE, TEGRA124_CLK_CLK_MAX, 600000000, 0 },
> > > +	{ TEGRA124_CLK_VDE, TEGRA124_CLK_PLL_C3, 600000000, 0 },
> > >  	{ TEGRA124_CLK_HOST1X, TEGRA124_CLK_PLL_P, 136000000, 1 },
> > >  	{ TEGRA124_CLK_DSIALP, TEGRA124_CLK_PLL_P, 68000000, 0 },
> > >  	{ TEGRA124_CLK_DSIBLP, TEGRA124_CLK_PLL_P, 68000000, 0 },
> > 
> > If clk_m isn't a valid configuration, why VDE could select it? At least TRM 
> > lists clk_m as a valid source and clk_m is running on a safe 120 MHz, VDE HW 
> > should work fine. Sounds like a clock driver bug to me.
> 
> I didn't say the configuration was invalid, I just said that it didn't
> work. clk_m runs at 12 MHz on the system that I was testing this on (and
> I think 12 MHz is the standard clk_m frequency for anything up to but
> not including Tegra210), and that is either much too slow or for some
> other reason causes VDE to malfunction. Also, I don't think "safe" in
> this case means that VDE should always work properly with it. The only
> things "safe" means is that the VDE can be accessed with that clock and
> frequency.
> 
> The bottom line is that with the VDE parent set to clk_m I keep getting
> BSEV timeouts with no bytes from the bitstream getting consumed. Setting
> the parent to pll_c3 makes everything work just fine.
> 
> > Seems VDE clock on should be ~366 MHz according to the T40/T124 TRM. See 
> > "5.3.8 PLLC, PLLC2, PLLC3, and PLLC4" of the T124 TRM.
> 
> pll_c3 is automatically set to 300 MHz on boot. I haven't found any
> place where we hard-code it, so I'm not exactly sure why it's being set
> to that value.
> 
> Peter, any ideas on where this default frequency of 300 MHz for pll_c3
> comes from?
> 

Yes, this comes from the fact we initialize these PLLs to half of the VCOmin
rate which is 300MHz.

> > Would be nice if you could adjust the VDE clock rate / parent-clock on all 
> > Tegra's, i.e. explicitly set the parent clock and the rate to 300-400 MHz.
> 
> From what I can tell they should all be running at valid frequencies by
> default, except that on Tegra124 the parent is wrong.
> 

Same remark here as with vic03. Consider doing this in DT.

Peter.

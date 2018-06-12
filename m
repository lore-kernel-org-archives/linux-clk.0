Return-Path: <pdeschrijver@nvidia.com>
Date: Tue, 12 Jun 2018 18:40:25 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko
	<digetx@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] clk: tegra: Make vic03 a child of pll_c3
Message-ID: <20180612154025.GW27696@tbergstrom-lnx.Nvidia.com>
References: <20180611081853.31474-1-thierry.reding@gmail.com>
 <20180611082244.GA31882@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20180611082244.GA31882@ulmo>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 11, 2018 at 10:22:44AM +0200, Thierry Reding wrote:
> On Mon, Jun 11, 2018 at 10:18:53AM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > By default, the vic03 clock is a child of pll_m but that runs at 924 MHz
> > which is too fast for VIC. Make vic03 a child of pll_c3 by default so it
> > will run at a supported frequency.
> > 
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/clk/tegra/clk-tegra124.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
> > index 0c69c7970950..f5048f82c0b9 100644
> > --- a/drivers/clk/tegra/clk-tegra124.c
> > +++ b/drivers/clk/tegra/clk-tegra124.c
> > @@ -1290,6 +1290,7 @@ static struct tegra_clk_init_table common_init_table[] __initdata = {
> >  	{ TEGRA124_CLK_MSELECT, TEGRA124_CLK_CLK_MAX, 0, 1 },
> >  	{ TEGRA124_CLK_CSITE, TEGRA124_CLK_CLK_MAX, 0, 1 },
> >  	{ TEGRA124_CLK_TSENSOR, TEGRA124_CLK_CLK_M, 400000, 0 },
> > +	{ TEGRA124_CLK_VIC03, TEGRA124_CLK_PLL_C3, 0, 0 },
> >  	/* must be the last entry */
> >  	{ TEGRA124_CLK_CLK_MAX, TEGRA124_CLK_CLK_MAX, 0, 0 },
> >  };
> 
> Adding Peter for visibility.

I think we should consider using the Assigned clock parents and rate feature
of the DT clock binding.

Peter.

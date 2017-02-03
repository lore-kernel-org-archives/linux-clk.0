Return-Path: <sboyd@codeaurora.org>
Date: Fri, 3 Feb 2017 12:43:02 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Alexandre Courbot <gnurou@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] clk: tegra: Add BPMP clock driver
Message-ID: <20170203204302.GF25384@codeaurora.org>
References: <20161115161129.29722-1-thierry.reding@gmail.com>
 <20161117154731.29528-1-thierry.reding@gmail.com>
 <20170125074112.GC13025@ulmo.ba.sec>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170125074112.GC13025@ulmo.ba.sec>
List-ID: <linux-clk.vger.kernel.org>

On 01/25, Thierry Reding wrote:
> On Thu, Nov 17, 2016 at 04:47:31PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > This driver uses the services provided by the BPMP firmware driver to
> > implement a clock driver based on the MRQ_CLK request. This part of the
> > BPMP ABI provides a means to enumerate and control clocks and should
> > allow the driver to work on any chip that supports this ABI.
> > 
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v2:
> > - rename ->prepare() and ->unprepare() implementations for consistency
> > - implement ->is_prepared() instead of ->is_enabled() to avoid the need
> >   for atomic operations
> > - rename tegra_bpmp_clk_message.clk member to id
> > - remove a double semi-colon and a stray ampersand
> > - drop extra check for validity of parent index, the core does it
> >   already
> > - make struct tegra_bpmp carry an array of struct tegra_bpmp_clk instead
> >   of struct clk_hw to simplify some driver code
> > - zero out struct clk_init_data to avoid potentially uninitialized data
> > - use devm_clk_hw_register() instead of clk_register() because we never
> >   need the opaque struct clk cookie
> > - rearrange functions so that they appear in the order specified by
> >   struct clk_ops
> > 
> >  drivers/clk/tegra/Kconfig    |   4 +
> >  drivers/clk/tegra/Makefile   |   1 +
> >  drivers/clk/tegra/clk-bpmp.c | 620 +++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 625 insertions(+)
> >  create mode 100644 drivers/clk/tegra/clk-bpmp.c
> 
> Stephen, Mike,
> 
> we missed the last merge window with this, but it would be nice to get
> it in this time. Any more comments?
> 

Don't think so. Shall I merge it into clk-next?

Sadly it's not easy to test compile this single driver on the
commandline. Grumble.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

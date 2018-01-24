Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:7789 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933166AbeAXLX4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Jan 2018 06:23:56 -0500
Date: Wed, 24 Jan 2018 13:23:50 +0200
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] clk: tegra: Add la clock for Tegra210
Message-ID: <20180124112350.GG7031@tbergstrom-lnx.Nvidia.com>
References: <1516699369-3513-1-git-send-email-pdeschrijver@nvidia.com>
 <1516699369-3513-2-git-send-email-pdeschrijver@nvidia.com>
 <31118e4b-80bd-1db2-0a82-9359b99deccf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <31118e4b-80bd-1db2-0a82-9359b99deccf@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jan 24, 2018 at 10:03:31AM +0000, Jon Hunter wrote:
> 
> On 23/01/18 09:22, Peter De Schrijver wrote:
> > This clock is needed by the memory built-in self test work around.
> > 
> > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > ---
> >  drivers/clk/tegra/clk-tegra210.c         | 14 ++++++++++++++
> >  include/dt-bindings/clock/tegra210-car.h |  2 +-
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> > index 9e62608..f790c2d 100644
> > --- a/drivers/clk/tegra/clk-tegra210.c
> > +++ b/drivers/clk/tegra/clk-tegra210.c
> > @@ -41,6 +41,7 @@
> >  #define CLK_SOURCE_CSITE 0x1d4
> >  #define CLK_SOURCE_EMC 0x19c
> >  #define CLK_SOURCE_SOR1 0x410
> > +#define CLK_SOURCE_LA 0x1f8
> >  
> >  #define PLLC_BASE 0x80
> >  #define PLLC_OUT 0x84
> > @@ -2654,6 +2655,13 @@ static int tegra210_init_pllu(void)
> >  			      sor1_parents_idx, 0, &sor1_lock),
> >  };
> >  
> > +static const char * const la_parents[] = {
> > +	"pll_p", "pll_c2", "pll_c", "pll_c3", "pll_re_out1", "pll_a1", "clk_m", "pll_c4_out0"
> > +};
> > +
> 
> I was comparing this with downstream and it appears that the parents are
> listed as "pll_p", "pll_c", "pll_m", "clk_m". Can you double check the
> above is correct?
> 

For all I can see the parents as listed in dowstream are incorrect. Likely
only pll_p is used in practice, so noone has noticed this. pll_m for example
can only be used by emc since T210, so it cannot be part of the parent list
of la.

Peter.

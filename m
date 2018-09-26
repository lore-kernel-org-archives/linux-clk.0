Return-Path: <tony@atomide.com>
Date: Wed, 26 Sep 2018 12:13:01 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 00/11] clk: ti: clkctrl data split based on clkdm
 boundaries
Message-ID: <20180926191301.GX5662@atomide.com>
References: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
 <20180904153657.GB5662@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180904153657.GB5662@atomide.com>
List-ID: <linux-clk.vger.kernel.org>

Hi,

* Tony Lindgren <tony@atomide.com> [180904 15:41]:
> * Tero Kristo <t-kristo@ti.com> [180831 15:11]:
> > Hi,
> > 
> > This series splits up the clkctrl data for TI SoCs based on clockdomain
> > boundaries, instead of the current CM boundaries. For rest of the SoCs,
> > the CM boundaries are actually the same as clockdomains, only am3/am4/dra7
> > are mutants.
> > 
> > This is done in preparation for better supporting Tony's upcoming
> > interconnect driver data introduction for these SoCs.
> > 
> > One thing to note is that we maintain backwards compatibility with this
> > series, the compat data is introduced temporarily for this purpose. The
> > compat data can be ditched after couple of release cycles when nobody
> > needs it anymore.
> > 
> > The series can be applied independently, as the compat data support
> > makes care that the switch is only done once DT changes are in place.
> 
> When this is ready for merging, can you guys please set up an
> immutable branch against v4.19-rc1 with the drivers/clk changes
> for me to merge in too?
> 
> I've tested this on am335x and am437x so far and it works fine
> for me, so for the whole series:
> 
> Tested-by: Tony Lindgren <tony@atomide.com>

Any news on getting this into Linux next and merged? The
immutable is still needed too for the dts changes.

Regards,

Tony

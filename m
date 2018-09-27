Return-Path: <tony@atomide.com>
Date: Thu, 27 Sep 2018 07:49:49 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 00/11] clk: ti: clkctrl data split based on clkdm
 boundaries
Message-ID: <20180927144949.GZ5662@atomide.com>
References: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
 <20180904153657.GB5662@atomide.com>
 <20180926191301.GX5662@atomide.com>
 <e4e90740-393f-edaf-947c-aa1010ab79a3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <e4e90740-393f-edaf-947c-aa1010ab79a3@ti.com>
List-ID: <linux-clk.vger.kernel.org>

* Tero Kristo <t-kristo@ti.com> [180927 06:35]:
> On 26/09/18 22:13, Tony Lindgren wrote:
> > Hi,
> > 
> > * Tony Lindgren <tony@atomide.com> [180904 15:41]:
> > > * Tero Kristo <t-kristo@ti.com> [180831 15:11]:
> > > > Hi,
> > > > 
> > > > This series splits up the clkctrl data for TI SoCs based on clockdomain
> > > > boundaries, instead of the current CM boundaries. For rest of the SoCs,
> > > > the CM boundaries are actually the same as clockdomains, only am3/am4/dra7
> > > > are mutants.
> > > > 
> > > > This is done in preparation for better supporting Tony's upcoming
> > > > interconnect driver data introduction for these SoCs.
> > > > 
> > > > One thing to note is that we maintain backwards compatibility with this
> > > > series, the compat data is introduced temporarily for this purpose. The
> > > > compat data can be ditched after couple of release cycles when nobody
> > > > needs it anymore.
> > > > 
> > > > The series can be applied independently, as the compat data support
> > > > makes care that the switch is only done once DT changes are in place.
> > > 
> > > When this is ready for merging, can you guys please set up an
> > > immutable branch against v4.19-rc1 with the drivers/clk changes
> > > for me to merge in too?
> > > 
> > > I've tested this on am335x and am437x so far and it works fine
> > > for me, so for the whole series:
> > > 
> > > Tested-by: Tony Lindgren <tony@atomide.com>
> > 
> > Any news on getting this into Linux next and merged? The
> > immutable is still needed too for the dts changes.
> > 
> 
> This is currently blocked from my side, as the patch [1] from Johan got in
> clk-next is conflicting with my series. Asked Stephen for either dropping
> that patch and letting me pick it up but no response so far.
> 
> [1] https://lkml.org/lkml/2018/8/22/160

Hmm well the idea is to not redo branches. So how about
send Stephen a pull request against Johan's patch commit
00a461cc32ec ("clk: ti: fix OF child-node lookup")?

That is assuming 00a461cc32ec is considered immutable and
OK to use as a base by Stephen? :)

And assuming that your pull request gets merged, and we
all consider that branch immutable too, then I can merge it
in too for the dts changes. It will bring also Rob's
clean-up patch 00a461cc32ec ("clk: ti: fix OF child-node
lookup") too but that's just fine.

Regards,

Tony

Return-Path: <paul@pwsan.com>
Date: Thu, 16 Jul 2015 01:51:12 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Tony Lindgren <tony@atomide.com>
cc: Tero Kristo <t-kristo@ti.com>, Mike Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@codeaurora.org>,
  "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
  linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] clk: ti: clock driver code migration to drivers
In-Reply-To: <20150714104006.GO17550@atomide.com>
Message-ID: <alpine.DEB.2.02.1507160148340.32764@utopia.booyaka.com>
References: <55A4CE41.9070909@ti.com> <20150714095431.GJ17550@atomide.com> <55A4E520.8050804@ti.com> <20150714104006.GO17550@atomide.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Tue, 14 Jul 2015, Tony Lindgren wrote:

> * Tero Kristo <t-kristo@ti.com> [150714 03:34]:
> > On 07/14/2015 12:54 PM, Tony Lindgren wrote:
> > >* Tero Kristo <t-kristo@ti.com> [150714 01:56]:
> > >>
> > >>This pull request contains the TI clock driver set to move the clock
> > >>implementations under clock driver. Some small portions of the clock driver
> > >>code still remain under mach-omap2 after this, it should be decided whether
> > >>this code is now obsolete and should be deleted or should someone try to fix
> > >>it.
> > >
> > >Hmm care to clarify what is obsolete or broken after this series?
> > 
> > Not after this series, was broken/obsolete already before.
> > 
> > A couple of omap2/omap3 specific clock files still remain under mach-omap2,
> > they are DVFS related. OMAP3 core dvfs support is currently completely
> > unused (this could probably be removed, or shall we re-introduce the painful
> > core dvfs at some point again?), and parts of the omap2 core dpll handling
> > code should probably be re-written; or at least verified that it actually
> > works properly. I can't test OMAP2 DVFS myself so don't dare to fiddle with
> > it.... I could probably try to get some sort of DVFS test case to work on
> > the board farm OMAP2 board I have access to though, I can investigate this.
> 
> People seem to still want the 1 GiHz support, but I think that only
> depends on the SmartReflex and some kind of replacement for
> voltagedomains. So if the core DVFS support is unused, I doubt it's
> very high on anybody's list right now.

At least several years ago, basic CORE DVFS support was working on OMAP3.  
The clock source changed rate, DRAM parameters were 
changed on the SDRC, etc.  What was not implemented was pre-rate-change 
and post-rate-change notifiers in many of the device drivers, because the 
infrastructure didn't exist at the time in the clock code.

- Paul

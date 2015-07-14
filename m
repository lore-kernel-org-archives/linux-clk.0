Return-Path: <tony@atomide.com>
Date: Tue, 14 Jul 2015 03:40:06 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Paul Walmsley <paul@pwsan.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] clk: ti: clock driver code migration to drivers
Message-ID: <20150714104006.GO17550@atomide.com>
References: <55A4CE41.9070909@ti.com>
 <20150714095431.GJ17550@atomide.com>
 <55A4E520.8050804@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <55A4E520.8050804@ti.com>
List-ID: <linux-clk.vger.kernel.org>

* Tero Kristo <t-kristo@ti.com> [150714 03:34]:
> On 07/14/2015 12:54 PM, Tony Lindgren wrote:
> >* Tero Kristo <t-kristo@ti.com> [150714 01:56]:
> >>
> >>This pull request contains the TI clock driver set to move the clock
> >>implementations under clock driver. Some small portions of the clock driver
> >>code still remain under mach-omap2 after this, it should be decided whether
> >>this code is now obsolete and should be deleted or should someone try to fix
> >>it.
> >
> >Hmm care to clarify what is obsolete or broken after this series?
> 
> Not after this series, was broken/obsolete already before.
> 
> A couple of omap2/omap3 specific clock files still remain under mach-omap2,
> they are DVFS related. OMAP3 core dvfs support is currently completely
> unused (this could probably be removed, or shall we re-introduce the painful
> core dvfs at some point again?), and parts of the omap2 core dpll handling
> code should probably be re-written; or at least verified that it actually
> works properly. I can't test OMAP2 DVFS myself so don't dare to fiddle with
> it.... I could probably try to get some sort of DVFS test case to work on
> the board farm OMAP2 board I have access to though, I can investigate this.

People seem to still want the 1 GiHz support, but I think that only
depends on the SmartReflex and some kind of replacement for
voltagedomains. So if the core DVFS support is unused, I doubt it's
very high on anybody's list right now.
 
> >And I take it's not obsolete or broken because of this series? :)
> 
> No, this series does not touch the above mentioned pieces of code, so this
> definitely should not break anything. :)

OK thanks for confirming that.

Regards,

Tony

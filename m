Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Tony Lindgren <tony@atomide.com>, "Tero Kristo" <t-kristo@ti.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20150714104006.GO17550@atomide.com>
Cc: "Stephen Boyd" <sboyd@codeaurora.org>, "Paul Walmsley" <paul@pwsan.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 linux-clk@vger.kernel.org
References: <55A4CE41.9070909@ti.com> <20150714095431.GJ17550@atomide.com>
 <55A4E520.8050804@ti.com> <20150714104006.GO17550@atomide.com>
Message-ID: <20150724003703.642.34807@quantum>
Subject: Re: [GIT PULL] clk: ti: clock driver code migration to drivers
Date: Thu, 23 Jul 2015 17:37:03 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Tony Lindgren (2015-07-14 03:40:06)
> * Tero Kristo <t-kristo@ti.com> [150714 03:34]:
> > On 07/14/2015 12:54 PM, Tony Lindgren wrote:
> > >* Tero Kristo <t-kristo@ti.com> [150714 01:56]:
> > >>
> > >>This pull request contains the TI clock driver set to move the clock
> > >>implementations under clock driver. Some small portions of the clock =
driver
> > >>code still remain under mach-omap2 after this, it should be decided w=
hether
> > >>this code is now obsolete and should be deleted or should someone try=
 to fix
> > >>it.
> > >
> > >Hmm care to clarify what is obsolete or broken after this series?
> > =

> > Not after this series, was broken/obsolete already before.
> > =

> > A couple of omap2/omap3 specific clock files still remain under mach-om=
ap2,
> > they are DVFS related. OMAP3 core dvfs support is currently completely
> > unused (this could probably be removed, or shall we re-introduce the pa=
inful
> > core dvfs at some point again?), and parts of the omap2 core dpll handl=
ing
> > code should probably be re-written; or at least verified that it actual=
ly
> > works properly. I can't test OMAP2 DVFS myself so don't dare to fiddle =
with
> > it.... I could probably try to get some sort of DVFS test case to work =
on
> > the board farm OMAP2 board I have access to though, I can investigate t=
his.
> =

> People seem to still want the 1 GiHz support, but I think that only
> depends on the SmartReflex and some kind of replacement for
> voltagedomains. So if the core DVFS support is unused, I doubt it's
> very high on anybody's list right now.

As long as the default is to have core running at the fast OPP then 1GHz
should be fine. There is a voltage domain dependency from ARM->CORE when
the ARM runs fast at 1GHZ: it requires core to run at the highest OPP as
well.

Regards,
Mike

>  =

> > >And I take it's not obsolete or broken because of this series? :)
> > =

> > No, this series does not touch the above mentioned pieces of code, so t=
his
> > definitely should not break anything. :)
> =

> OK thanks for confirming that.
> =

> Regards,
> =

> Tony
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

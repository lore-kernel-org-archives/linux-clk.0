Return-Path: <t-kristo@ti.com>
Message-ID: <55A4E520.8050804@ti.com>
Date: Tue, 14 Jul 2015 13:32:00 +0300
From: Tero Kristo <t-kristo@ti.com>
MIME-Version: 1.0
To: Tony Lindgren <tony@atomide.com>
CC: Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, Paul Walmsley <paul@pwsan.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [GIT PULL] clk: ti: clock driver code migration to drivers
References: <55A4CE41.9070909@ti.com> <20150714095431.GJ17550@atomide.com>
In-Reply-To: <20150714095431.GJ17550@atomide.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 07/14/2015 12:54 PM, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [150714 01:56]:
>>
>> This pull request contains the TI clock driver set to move the clock
>> implementations under clock driver. Some small portions of the clock driver
>> code still remain under mach-omap2 after this, it should be decided whether
>> this code is now obsolete and should be deleted or should someone try to fix
>> it.
>
> Hmm care to clarify what is obsolete or broken after this series?

Not after this series, was broken/obsolete already before.

A couple of omap2/omap3 specific clock files still remain under 
mach-omap2, they are DVFS related. OMAP3 core dvfs support is currently 
completely unused (this could probably be removed, or shall we 
re-introduce the painful core dvfs at some point again?), and parts of 
the omap2 core dpll handling code should probably be re-written; or at 
least verified that it actually works properly. I can't test OMAP2 DVFS 
myself so don't dare to fiddle with it.... I could probably try to get 
some sort of DVFS test case to work on the board farm OMAP2 board I have 
access to though, I can investigate this.

> And I take it's not obsolete or broken because of this series? :)

No, this series does not touch the above mentioned pieces of code, so 
this definitely should not break anything. :)

-Tero

>
> Also, I just gave this branch a quick boot test and it seems to
> behave for me.
>
> Regards,
>
> Tony
>

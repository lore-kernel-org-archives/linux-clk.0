Return-Path: <scottwood@freescale.com>
Message-ID: <1442714616.19102.160.camel@freescale.com>
Subject: Re: [PATCH 02/26] clk: Replace __clk_get_num_parents with
 clk_hw_get_num_parents()
From: Scott Wood <scottwood@freescale.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Mike Turquette <mturquette@baylibre.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Boris Brezillon
	<boris.brezillon@free-electrons.com>, Chao Xie <chao.xie@marvell.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas
	<javier.martinez@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, Emilio
 =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Tero Kristo
	<t-kristo@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Date: Sat, 19 Sep 2015 21:03:36 -0500
In-Reply-To: <20150918231817.GA23081@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
	 <1438362246-6664-3-git-send-email-sboyd@codeaurora.org>
	 <1442535513.19102.83.camel@freescale.com>
	 <20150918155612.GY23081@codeaurora.org>
	 <1442600846.19102.132.camel@freescale.com>
	 <20150918231817.GA23081@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: scottwood@freescale.com
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2015-09-18 at 16:18 -0700, Stephen Boyd wrote:
> On 09/18, Scott Wood wrote:
> > On Fri, 2015-09-18 at 08:56 -0700, Stephen Boyd wrote:
> > > Is there any reason why we can't use DT OPPs for the code that
> > > you're patching here? At a quick glance it looks like we could
> > > leave this driver behind and move to cpufreq-dt.c and then use
> > > OPPs to populate the possible frequencies and affinity.
> > 
> > One reason is that I want to maintain compatibility with existing device 
> > trees.
> > 
> > However, even ignoring that, cpufreq-dt doesn't seem like a good fit.  It 
> > requires specifying voltage, which is beyond the scope of the DFS 
> > mechanism 
> > on these chips. 
> 
> Hm.. cpufreq-dt doesn't mandate voltage setting. Maybe I'm
> reading the code wrong though.

I was referring to the device tree binding, but didn't look far enough to see 
the v2 binding.

> > It also requires assembling a list of valid frequencies in the device 
> > tree, 
> > which is not knowable at compile-time as it depends on how PLLs were 
> > configured in the reset control words, and in some cases the revision of 
> > the 
> > SoC due to errata -- and even if that information were constant, it would 
> > be 
> > extra maintenance work to keep the redundant information accurate, and if 
> > errors were introduced into the device tree we'd have the same sort of 
> > compatibility problems I'm trying to fix with
> > http://patchwork.ozlabs.org/patch/507621/
> > 
> 
> Ok, fair enough. The v2 bindings for OPPs are still progressing
> and they're moving towards a way to consolidate data that might
> work here. I'm not sure though, Viresh is probably better to ask.

If you mean operating-points-v2, based on the current binding document, I'm 
not sure how that addresses the above issues.

> Just one more final thought, but what if the clock provider
> populated the OPPs for the CPU devices and the cpufreq-dt was
> used? I don't know how the code is structured or if this QorIQ
> clock controller is used for more than just CPU clocks, but that
> may be another option where provider APIs are available.

I'm not sure how to do that, and it's not clear what the benefit would be on 
this hardware.  Pretty much all we need the cpufreq driver to do is to look 
at a clock with multiple parents, and select from the options that are 
available.

-Scott

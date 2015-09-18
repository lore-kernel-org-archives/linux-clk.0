Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 18 Sep 2015 16:18:17 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Scott Wood <scottwood@freescale.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Chao Xie <chao.xie@marvell.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Tero Kristo <t-kristo@ti.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 02/26] clk: Replace __clk_get_num_parents with
 clk_hw_get_num_parents()
Message-ID: <20150918231817.GA23081@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
 <1438362246-6664-3-git-send-email-sboyd@codeaurora.org>
 <1442535513.19102.83.camel@freescale.com>
 <20150918155612.GY23081@codeaurora.org>
 <1442600846.19102.132.camel@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1442600846.19102.132.camel@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/18, Scott Wood wrote:
> On Fri, 2015-09-18 at 08:56 -0700, Stephen Boyd wrote:
> > On 09/17, Scott Wood wrote:
> > > On Fri, 2015-07-31 at 10:03 -0700, Stephen Boyd wrote:
> > > > Mostly converted with the following semantic patch:
> > > > 
> > > > @@
> > > > struct clk_hw *E;
> > > > @@
> > > > 
> > > > -__clk_get_num_parents(E->clk)
> > > > +clk_hw_get_num_parents(E)
> > > 
> > > I don't understand why this is considered a clock provider API.  How is a 
> > > clock consumer, such as cpufreq, supposed to find out the number of 
> > > parents 
> > > or similar information, so that it knows what its options are for calling 
> > > clk_set_parent()?
> > > 
> > > This is the caller I had in mind:
> > > http://patchwork.ozlabs.org/patch/507619/
> > > 
> > > Surely asking the clock to describe itself is better than what that 
> > > cpufreq 
> > > driver currently does, which is to look in the device tree and make 
> > > assumptions about how that maps to what the clock provider driver does...
> > > 
> > 
> > All the APIs that were converted were private to the common clock
> > framework and in clk-provider.h, not clk.h. clk.h is the consumer
> > API that's supported by more than just the common clock
> > framework, so whatever we do for the consumer API needs to be put
> > there.
> 
> I realize that's the theory, though it didn't seem to be adhered to 
> particularly closely (e.g. even lib/vsprintf.c includes clk-provider.h, for 
> access to __clk_get_name), and indeed the entire way the API and struct are 
> split seemed quite odd to me (and the out-of-date Documentation/clk.txt 
> didn't help).

Yeah I think we need a clk_get_name() API in clk.h instead of
__clk_get_name() in clk-provider.h. The consumer/provider split
is still a work in progress.

> 
> > For example, we recently added a clk_has_parent() API that can be
> > used to probe for possible parents of a clock. Perhaps we need
> > something else in this case so that consumers can iterate over
> > each parent of a clock? Feel free to suggest a consumer API.
> 
> OK.  The suggestion is that functions which are potentially useful to 
> something other than the clock provider itself be moved to clk.h and operate 
> on struct clk *.  At a minimum, I need "get_name" and "get_num_parents" (I'll 
> add a patch to do so on respin, if there's no objection to the concept), but 
> some of the others are probably reasonable to expose as well.

Sure, let's take up the review on the next spin of patches.
Please include Russell on clk API patches too please, as he's the
maintainer there.

> 
> > Is there any reason why we can't use DT OPPs for the code that
> > you're patching here? At a quick glance it looks like we could
> > leave this driver behind and move to cpufreq-dt.c and then use
> > OPPs to populate the possible frequencies and affinity.
> 
> One reason is that I want to maintain compatibility with existing device 
> trees.
> 
> However, even ignoring that, cpufreq-dt doesn't seem like a good fit.  It 
> requires specifying voltage, which is beyond the scope of the DFS mechanism 
> on these chips. 

Hm.. cpufreq-dt doesn't mandate voltage setting. Maybe I'm
reading the code wrong though.

> 
> It also requires assembling a list of valid frequencies in the device tree, 
> which is not knowable at compile-time as it depends on how PLLs were 
> configured in the reset control words, and in some cases the revision of the 
> SoC due to errata -- and even if that information were constant, it would be 
> extra maintenance work to keep the redundant information accurate, and if 
> errors were introduced into the device tree we'd have the same sort of 
> compatibility problems I'm trying to fix with
> http://patchwork.ozlabs.org/patch/507621/
> 

Ok, fair enough. The v2 bindings for OPPs are still progressing
and they're moving towards a way to consolidate data that might
work here. I'm not sure though, Viresh is probably better to ask.

Just one more final thought, but what if the clock provider
populated the OPPs for the CPU devices and the cpufreq-dt was
used? I don't know how the code is structured or if this QorIQ
clock controller is used for more than just CPU clocks, but that
may be another option where provider APIs are available.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

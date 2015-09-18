Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 18 Sep 2015 08:56:12 -0700
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
Message-ID: <20150918155612.GY23081@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
 <1438362246-6664-3-git-send-email-sboyd@codeaurora.org>
 <1442535513.19102.83.camel@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1442535513.19102.83.camel@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/17, Scott Wood wrote:
> On Fri, 2015-07-31 at 10:03 -0700, Stephen Boyd wrote:
> > Mostly converted with the following semantic patch:
> > 
> > @@
> > struct clk_hw *E;
> > @@
> > 
> > -__clk_get_num_parents(E->clk)
> > +clk_hw_get_num_parents(E)
> 
> I don't understand why this is considered a clock provider API.  How is a 
> clock consumer, such as cpufreq, supposed to find out the number of parents 
> or similar information, so that it knows what its options are for calling 
> clk_set_parent()?
> 
> This is the caller I had in mind:
> http://patchwork.ozlabs.org/patch/507619/
> 
> Surely asking the clock to describe itself is better than what that cpufreq 
> driver currently does, which is to look in the device tree and make 
> assumptions about how that maps to what the clock provider driver does...
> 

All the APIs that were converted were private to the common clock
framework and in clk-provider.h, not clk.h. clk.h is the consumer
API that's supported by more than just the common clock
framework, so whatever we do for the consumer API needs to be put
there.

For example, we recently added a clk_has_parent() API that can be
used to probe for possible parents of a clock. Perhaps we need
something else in this case so that consumers can iterate over
each parent of a clock? Feel free to suggest a consumer API.

Is there any reason why we can't use DT OPPs for the code that
you're patching here? At a quick glance it looks like we could
leave this driver behind and move to cpufreq-dt.c and then use
OPPs to populate the possible frequencies and affinity.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

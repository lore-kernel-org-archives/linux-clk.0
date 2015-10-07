Return-Path: <sboyd@codeaurora.org>
Date: Wed, 7 Oct 2015 12:17:05 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Emilio Lopez <emilio@elopez.com.ar>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 1/5] clk: Add a basic multiplier clock
Message-ID: <20151007191705.GA26883@codeaurora.org>
References: <1443512353-28073-1-git-send-email-maxime.ripard@free-electrons.com>
 <1443512353-28073-2-git-send-email-maxime.ripard@free-electrons.com>
 <20151002204308.GY12338@codeaurora.org>
 <20151005101932.GH2696@lukather>
 <20151005180929.GB12338@codeaurora.org>
 <20151007110457.GF2278@lukather>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20151007110457.GF2278@lukather>
List-ID: <linux-clk.vger.kernel.org>

On 10/07, Maxime Ripard wrote:
> On Mon, Oct 05, 2015 at 11:09:29AM -0700, Stephen Boyd wrote:
> > On 10/05, Maxime Ripard wrote:
> > > 
> > > Actually, the logic is also reversed.
> > > 
> > > The divider driver will always try to find some rate that is higher
> > > than the one we already have, without going above than the one
> > > requested.
> > > 
> > > Here, we're tring to be lower than the best rate, without going below
> > > the requested rate.
> > 
> > So then a tri-state flag that indicates, closest, less than,
> > greater than?
> 
> Still, the computation itself is different, and the only consolidation
> we could possibly do is by not duplicating the ROUND_CLOSEST. We would
> end up with two different code pathes in the same function, which I
> feel would make it unnecessarily complex.

Ok. No worries.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

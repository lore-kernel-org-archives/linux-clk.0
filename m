Return-Path: <sboyd@codeaurora.org>
Date: Thu, 3 Mar 2016 11:30:50 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	Mike Turquette <mturquette@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: move drivers to renesas directory
Message-ID: <20160303193050.GA24999@codeaurora.org>
References: <1456971486-13761-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdXfkV05AwaRtLqwA8Ko=BQaQ5y87AYgsU7O-Rd45JiNKA@mail.gmail.com>
 <20160303192617.GY24999@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160303192617.GY24999@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 03/03, Stephen Boyd wrote:
> On 03/03, Geert Uytterhoeven wrote:
> > On Thu, Mar 3, 2016 at 3:18 AM, Simon Horman <horms+renesas@verge.net.au> wrote:
> > > This is part of an ongoing process to migrate from ARCH_SHMOBILE to
> > > ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
> > > appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
> > >
> > > Along with the above mentioned Kconfig changes it seems appropriate
> > > to also rename directories that only hold drivers for such SoCs.
> > >
> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > 
> > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> 
> Applied to clk-next.

Also, did you want to rename the clk/shmobile.h header file?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

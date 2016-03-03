Return-Path: <sboyd@codeaurora.org>
Date: Thu, 3 Mar 2016 11:26:17 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	Mike Turquette <mturquette@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: move drivers to renesas directory
Message-ID: <20160303192617.GY24999@codeaurora.org>
References: <1456971486-13761-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdXfkV05AwaRtLqwA8Ko=BQaQ5y87AYgsU7O-Rd45JiNKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAMuHMdXfkV05AwaRtLqwA8Ko=BQaQ5y87AYgsU7O-Rd45JiNKA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/03, Geert Uytterhoeven wrote:
> On Thu, Mar 3, 2016 at 3:18 AM, Simon Horman <horms+renesas@verge.net.au> wrote:
> > This is part of an ongoing process to migrate from ARCH_SHMOBILE to
> > ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
> > appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
> >
> > Along with the above mentioned Kconfig changes it seems appropriate
> > to also rename directories that only hold drivers for such SoCs.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 

Applied to clk-next.

> > Patch pruduced using git format-patch -M
> > This produces a patch without the diff of each renamed file
> > which results in a ~204K patch. Let me know if you would prefer that
> > or a pull-request.
> 
> How will we proceed?
> Note that I have an outstanding pull request for drivers/clk/shmobile.
> 

Git took care of it.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

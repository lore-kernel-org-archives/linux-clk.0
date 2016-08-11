Return-Path: <horms@verge.net.au>
Date: Thu, 11 Aug 2016 11:21:56 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a7795: Fix SD clocks
Message-ID: <20160811092156.GA25489@verge.net.au>
References: <1470814183-17834-1-git-send-email-geert+renesas@glider.be>
 <20160811085720.GG30475@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160811085720.GG30475@verge.net.au>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Aug 11, 2016 at 10:57:20AM +0200, Simon Horman wrote:
> On Wed, Aug 10, 2016 at 09:29:43AM +0200, Geert Uytterhoeven wrote:
> > From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > 
> > According to the datasheet, SDn clocks are from the SDSRC clock. And
> > the SDSRC has a 1/2 divider. So, we should have ".sdsrc" as an internal
> > core clock. Otherwise, since the sdhi driver will calculate clock for
> > a sd card using the wrong parent clock rate, and then performance will
> > be not good.
> > 
> > Fixes: 90c073e53909da85 ("clk: shmobile: r8a7795: Add SD divider support")
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Acked-by: Dirk Behme <dirk.behme@de.bosch.com>
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: stable@vger.kernel.org
> > ---
> > SDHI was enabled on r8a7795/salvator-x in v4.6.
> > Please apply as a fix for v4.8.
> 
> Thanks, done.

My bad, please ignore the above, this patch is not for my tree.

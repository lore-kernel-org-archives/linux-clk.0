Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Stephen Warren <swarren@wwwdotorg.org>, Ray Jui <rjui@broadcom.com>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: bcm: Fix 'maybe-uninitialized' warning in bcm2835_clock_choose_div_and_prate()
Date: Mon, 12 Dec 2016 09:34:28 +0100
Message-ID: <2237053.NkkLiYIyzc@wuerfel>
In-Reply-To: <20161212093130.6e348a61@bbrezillon>
References: <1481529653-28133-1-git-send-email-boris.brezillon@free-electrons.com> <3107859.uaKLk6DMRd@wuerfel> <20161212093130.6e348a61@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Monday, December 12, 2016 9:31:30 AM CET Boris Brezillon wrote:
> On Mon, 12 Dec 2016 09:12:36 +0100
> Arnd Bergmann <arnd@arndb.de> wrote:
> 
> > On Monday, December 12, 2016 9:00:53 AM CET Boris Brezillon wrote:
> > > best_rate is reported as potentially uninitialized by gcc.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > > Fixes: 155e8b3b0ee3 ("clk: bcm: Support rate change propagation on bcm2835 clocks")
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>  
> > 
> > I wonder why I didn't get that. Which compiler version did you use?
> > 
> 
> In case you're interested, my gcc [1] failed to detect it as well, and
> this is not the first time it happens :-/.
> 
> [1]gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609

No, I see it now with gcc-7, it only just turned up in linux-next.

I ran into it right away with an allmodconfig build. You were
probably testing based on an earlier v4.9-rc release that had
the warning globally disabled.

	Arnd

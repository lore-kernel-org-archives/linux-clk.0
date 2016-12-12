Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Stephen Warren <swarren@wwwdotorg.org>, Ray Jui <rjui@broadcom.com>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: bcm: Fix 'maybe-uninitialized' warning in bcm2835_clock_choose_div_and_prate()
Date: Mon, 12 Dec 2016 09:12:36 +0100
Message-ID: <3107859.uaKLk6DMRd@wuerfel>
In-Reply-To: <1481529653-28133-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1481529653-28133-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Monday, December 12, 2016 9:00:53 AM CET Boris Brezillon wrote:
> best_rate is reported as potentially uninitialized by gcc.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: 155e8b3b0ee3 ("clk: bcm: Support rate change propagation on bcm2835 clocks")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

I wonder why I didn't get that. Which compiler version did you use?

	Arnd

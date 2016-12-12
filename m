Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38741 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751983AbcLLIW4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 12 Dec 2016 03:22:56 -0500
Date: Mon, 12 Dec 2016 19:22:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
        Boris Brezillon <boris.brezillon@free-electrons.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Ray Jui <rjui@broadcom.com>, Lee Jones <lee@kernel.org>,
        Eric Anholt <eric@anholt.net>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: bcm: Fix 'maybe-uninitialized' warning in
 bcm2835_clock_choose_div_and_prate()
Message-ID: <20161212192252.56e6ac99@canb.auug.org.au>
In-Reply-To: <3107859.uaKLk6DMRd@wuerfel>
References: <1481529653-28133-1-git-send-email-boris.brezillon@free-electrons.com>
        <3107859.uaKLk6DMRd@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Arnd,

On Mon, 12 Dec 2016 09:12:36 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Monday, December 12, 2016 9:00:53 AM CET Boris Brezillon wrote:
> > best_rate is reported as potentially uninitialized by gcc.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Fixes: 155e8b3b0ee3 ("clk: bcm: Support rate change propagation on bcm2835 clocks")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>  
> 
> I wonder why I didn't get that. Which compiler version did you use?

Gcc-5.2.0 powerpc-le hosted cross compiler.

-- 
Cheers,
Stephen Rothwell

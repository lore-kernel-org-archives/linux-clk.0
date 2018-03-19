Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@bootlin.com>, Eric Anholt <eric@anholt.net>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <87vadz9ana.fsf@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Stefan Wahren <stefan.wahren@i2se.com>, Lee Jones <lee@kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 stable@vger.kernel.org
References: <20180208134338.24590-1-boris.brezillon@bootlin.com>
 <20180208134338.24590-4-boris.brezillon@bootlin.com>
 <87mv0j5wzz.fsf@anholt.net> <20180208185619.667a4daf@bbrezillon>
 <87vaf6v77r.fsf@anholt.net> <20180212102752.21e22328@bbrezillon>
 <152088968272.205167.14856461616755294568@swboyd.mtv.corp.google.com>
 <87vadz9ana.fsf@anholt.net>
Message-ID: <152147681675.242365.12138371754723836816@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 4/4] clk: bcm2835: Make sure the PLL is gated before changing its
 rate
Date: Mon, 19 Mar 2018 09:26:56 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Eric Anholt (2018-03-13 09:56:57)
> Stephen Boyd <sboyd@kernel.org> writes:
> >
> > What exactly is going on here? It sounds like the framework isn't aware
> > of the 'on/off' boot state of certain clks (a known problem) and that's
> > causing some sort of problem when changing rates? This usually happens
> > with PLLs that are enabled at boot time and can't support their rate
> > changing when they're enabled. We really should start reading on/off
> > state and "hand off" that enabled state to something in the framework so
> > we at least know if a clk is enabled or not out of boot. There was some
> > work on clk handoff done a while ago by Mike that never landed which may
> > be useful to finish this off. Maybe we can pass that enabled state off
> > to the clk we always create for a clk_hw structure at registration time
> > and then have clk_disable_unused operate on that clk pointer at late
> > init.
> =

> Yes, the usual problem of clk not handling boot-time clock state well.
> =

> That said, it's patch 1 that's critical for fixing many of our users,
> and we need that in as soon as possible.  #2 is also reviewed and ready.

Got it. I'll pick up the first two then.

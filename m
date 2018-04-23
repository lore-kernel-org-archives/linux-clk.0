Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1517575828.3153.23.camel@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
References: <20171201215200.23523-1-jbrunet@baylibre.com>
 <151373031022.33554.13905466641279532222@resonance>
 <20171222021520.GO7997@codeaurora.org> <1517217778.3153.1.camel@baylibre.com>
 <20180201174307.GC23162@codeaurora.org>
 <1517575828.3153.23.camel@baylibre.com>
Message-ID: <20180423182136.43156.94025@harbor.lan>
Subject: Re: [PATCH v5 00/10] clk: implement clock rate protection mechanism
Date: Mon, 23 Apr 2018 11:21:36 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2018-02-02 04:50:28)
> On Thu, 2018-02-01 at 09:43 -0800, Stephen Boyd wrote:
> > > > > Applied to clk-protect-rate, with the exception that I did not ap=
ply
> > > > > "clk: fix CLK_SET_RATE_GATE with clock rate protection" as it bre=
aks
> > > > > qcom clk code.
> > > > > =

> > > > > Stephen, do you plan to fix up the qcom clock code so that the
> > > > > SET_RATE_GATE improvement can go in?
> > > > > =

> > > > =

> > > > I started working on it a while back. Let's see if I can finish
> > > > it off this weekend.
> > > > =

> > > =

> > > Hi Stephen,
> > > =

> > > Have you been able find something to fix the qcom code regarding this=
 issue ?
> > > =

> > =

> > This is what I have. I'm unhappy with a few things. First, I made
> > a spinlock for each clk, which is overkill. Most likely, just a
> > single spinlock is needed per clk-controller device. Second, I
> > haven't finished off the branch/gate part, so gating/ungating of
> > branches needs to be locked as well to prevent branches from
> > turning on while rates change. And finally, the 'branches' list is
> > duplicating a bunch of information about the child clks of an
> > RCG, so it feels like we need a core framework API to enable and
> > disable clks forcibly while remembering what is enabled/disabled
> > or at least to walk the clk tree and call some function.
> =

> Looks similar to Mike's CCR idea ;)

Giving clk provider drivers more control over the clocks that they
provide is a similar concept, but the ancient ccr series dealt almost
exclusively with set_rate and set_parent ops.

> =

> > =

> > The spinlock per clk-controller is duplicating the regmap lock we
> > already have, so we may want a regmap API to grab the lock, and
> > then another regmap API to do reads/writes without grabbing the
> > lock, and then finally release the lock with a regmap unlock API.
> =

> There is 'regsequence' for multiple write in a burst, but that's only if =
you do
> write only ... I suppose you are more in read/update/writeback mode, so it
> probably does not help much.
> =

> Maybe we could extend regmap's regsequence, to do a sequence of
> regmap_update_bits() ?
> =

> Another possibility could be to provide your own lock/unlock ops when
> registering the regmap. With this, you might be able to supply your own s=
pinlock
> to regmap. This is already supported by regmap, would it help ?

Stephen, was there ever an update on your end? This patch has been
dangling for a while and I thought it was time to ping on it.

Regards,
Mike

> =

> > This part is mostly an optimization, but it would be nice to have
> > so that multiple writes could be done in sequence. This way, the
> > RCG code could do the special locking sequence and the branch
> > code could do the fire and forget single bit update.
>
=20

Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1520509048.4264.26.camel@baylibre.com>
Subject: Re: [PATCH] clk: Don't show the incorrect clock phase
From: Jerome Brunet <jbrunet@baylibre.com>
To: Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 08 Mar 2018 12:37:28 +0100
In-Reply-To: <290e041d-7b53-9e62-92ce-33651ecb8a2f@rock-chips.com>
References: <1520495643-164458-1-git-send-email-shawn.lin@rock-chips.com>
	 <1520503497.4264.12.camel@baylibre.com>
	 <290e041d-7b53-9e62-92ce-33651ecb8a2f@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2018-03-08 at 19:28 +0800, Shawn Lin wrote:
> > > +    if (core->phase < 0 && core->ops->get_phase)
> > 
> > Why bother with core->phase < 0 ?
> > if core->ops->get_phase is available, why not call it anyway ?
> > 
> > The phase may have changed since it was cached.
> > 
> > A typical example would be phases based on adding fixed delays:
> > 
> > * Take a 200MHz clock and set phase to 180 => a 2.5ns delay is set
> > * Clock rate change to 100MHz but delay is still 2.5ns
> >     -> cached phase = 180
> >     -> actual phase = 90
> 
> Good point!
> 
> (1)So either we should update phase once its rate is updated, for
> instance, doing it in clk_change_rate, or

I don't think this would be a good option. The phase depending on the rate is
just one example. I'm pretty sure one could come up with another example 

> 
> (2)we should always try to get the actual phase here.

If the callback is available, lets use it. I prefer this second option

> 
> If we do anyway call ->get_phase, we should never need core->phase since
> it doesn't reflect the actual phase maybe.

The cached value is used by debugfs so it is still a valuable information. I
would keep it around for now.

> 
> Am I right? If yes, which option is more reasonable?

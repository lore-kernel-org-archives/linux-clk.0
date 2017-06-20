Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1497955822.7387.3.camel@baylibre.com>
Subject: Re: [PATCH v3 00/10] clk: implement clock rate protection mechanism
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, Russell King <linux@armlinux.org.uk>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Adriana Reus
 <adi.reus@gmail.com>
Date: Tue, 20 Jun 2017 12:50:22 +0200
In-Reply-To: <CACRpkdaXFS-pW7qhbVLexzefaZwZ50ww3+KTeY4cuHRQUSCWKQ@mail.gmail.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
	 <CACRpkdaXFS-pW7qhbVLexzefaZwZ50ww3+KTeY4cuHRQUSCWKQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-06-20 at 11:07 +0200, Linus Walleij wrote:
> On Mon, Jun 12, 2017 at 9:44 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> 
> > The goal of this patchset is to provide a way for consumers to inform the
> > system that they depend on the rate of the clock source and can't tolerate
> > other consumers changing the rate or causing glitches.
> 
> Just for context: chat kind of consumers are these?

When the rate is critical to perform a particular task. My example is the audio
and i2s output. You can't tolerate glitches during the playback, the end user
would complain (longer description in the original RFC)

> 
> i.e. the consumers that can't tolerate a clock rate change?
> 
> I understand it if it is a hardware limitation (like the block would
> crash if it glitches or changes rate).
> 
> On the other hand, in the kernel we have things like in
> arch/arm/kernel/smp_twd.c we use a notifier to deal
> with a changing clock rate.
> 
> Just want to be sure that you're not working around something that
> can be dealt with using rate change notifiers.

As far as I can tell, there was no way to enforce this along the tree.
You could "block" a clock, but one could simply change the rate of the parent
which change the rate of your blocked clock ... game over.

With notifiers you can block a rate change. but this is happening too late. 

Here, it is expressed as constraint along the clock tree which is used in the
determine_rate callback. If you have a ip block which can be fed by multiple
parent clock, this will allow the determine_rate to favor another parent
depending on the rate requested

It also fixes the behavior of CLK_SET_RATE_GATE flag, which is why I put you in
CC.

ux500 uses this flag several time, I'd like make sure people are not relying on
its broken implementation.

> 
> (OK maybe a stupid question, I assume this is not the case, but anyways,
> had to ask.)

Not at all :)
Happy to answer your question. Not sure this was clear though. Feel free to tell
me if it is not.

> 
> Yours,
> Linus Walleij

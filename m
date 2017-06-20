Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1497961950.7387.7.camel@baylibre.com>
Subject: Re: [PATCH v3 00/10] clk: implement clock rate protection mechanism
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, Russell King <linux@armlinux.org.uk>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Adriana Reus
 <adi.reus@gmail.com>
Date: Tue, 20 Jun 2017 14:32:30 +0200
In-Reply-To: <CACRpkdacB3HKgewSciQWB0c8v2KCF7u+eT0A_RSC0+z_KrQzhA@mail.gmail.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
	 <CACRpkdaXFS-pW7qhbVLexzefaZwZ50ww3+KTeY4cuHRQUSCWKQ@mail.gmail.com>
	 <1497955822.7387.3.camel@baylibre.com>
	 <CACRpkdacB3HKgewSciQWB0c8v2KCF7u+eT0A_RSC0+z_KrQzhA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-06-20 at 13:54 +0200, Linus Walleij wrote:
> On Tue, Jun 20, 2017 at 12:50 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > On Tue, 2017-06-20 at 11:07 +0200, Linus Walleij wrote:
> > When the rate is critical to perform a particular task. My example is the
> > audio
> > and i2s output. You can't tolerate glitches during the playback, the end
> > user
> > would complain (longer description in the original RFC)
> 
> I see. Thanks for your detailed explanation!
> 
> > It also fixes the behavior of CLK_SET_RATE_GATE flag, which is why I put you
> > in
> > CC.
> > 
> > ux500 uses this flag several time, I'd like make sure people are not relying
> > on
> > its broken implementation.
> 
> Ux500 audio is broken, but I'm fixing it a little at a time...

No problem with Ux500 audio, don't worry :)
Audio is just one application among others.

The concern regarding ux500 is that the clock controller declares clocks using
the CLK_SET_RATE_GATE flag (like qcom, at91 and several other)

here is the definition:
#define CLK_SET_RATE_GATE	BIT(0) /* must be gated across rate change */

My interpretation it that, as long as clock is enabled, rate can't change.

The implementation of this flag is currently broken:
* If you call set_rate on directly on the clock while it is enabled, you will
get -EBUSY, as expected
* If you call set_rate on its parent, rate will change, changing the rate of the
child clock as well ...

With this patchset applied, calling set_rate on the parent would also return
-EBUSY, enforcing the "rate can't change while enabled" property.

To build confidence that this won't be causing regression, I'd like to check
that platform using this flag are no relying on the broken behavior.

I've included the clock maintainers of at91, qcom, and ux500 (you) in this
thread because they are the heaviest users of this flag, so the more likely to
report a problem.

If you could apply this series and just do things as usual, It'd be awesome !

I'll also seek the help of the kci guys, see if it is possible to give the
series spin on it.

> 
> Yours,
> Linus Walleij

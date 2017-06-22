Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1498126148.7387.14.camel@baylibre.com>
Subject: Re: [PATCH v3 00/10] clk: implement clock rate protection mechanism
From: Jerome Brunet <jbrunet@baylibre.com>
To: Quentin Schulz <quentin.schulz@free-electrons.com>, Boris Brezillon
	 <boris.brezillon@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk
 <linux-clk@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, "open
 list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Russell
 King <linux@armlinux.org.uk>, Adriana Reus <adi.reus@gmail.com>
Date: Thu, 22 Jun 2017 12:09:08 +0200
In-Reply-To: <8249fd2e-a0c0-6519-87f5-d93e5114faa0@free-electrons.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
	 <CACRpkdaXFS-pW7qhbVLexzefaZwZ50ww3+KTeY4cuHRQUSCWKQ@mail.gmail.com>
	 <1497955822.7387.3.camel@baylibre.com>
	 <CACRpkdacB3HKgewSciQWB0c8v2KCF7u+eT0A_RSC0+z_KrQzhA@mail.gmail.com>
	 <1497961950.7387.7.camel@baylibre.com> <20170620144726.5c2f3213@bbrezillon>
	 <8249fd2e-a0c0-6519-87f5-d93e5114faa0@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2017-06-22 at 09:07 +0200, Quentin Schulz wrote:
> Hi Jerome,
> 
> On 20/06/2017 14:47, Boris Brezillon wrote:
> > +Quentin
> > 
> > On Tue, 20 Jun 2017 14:32:30 +0200
> > Jerome Brunet <jbrunet@baylibre.com> wrote:
> > 
> > > On Tue, 2017-06-20 at 13:54 +0200, Linus Walleij wrote:
> > > > On Tue, Jun 20, 2017 at 12:50 PM, Jerome Brunet <jbrunet@baylibre.com>
> > > > wrote:  
> > > > > On Tue, 2017-06-20 at 11:07 +0200, Linus Walleij wrote:
> > > > > When the rate is critical to perform a particular task. My example is
> > > > > the
> > > > > audio
> > > > > and i2s output. You can't tolerate glitches during the playback, the
> > > > > end
> > > > > user
> > > > > would complain (longer description in the original RFC)  
> > > > 
> > > > I see. Thanks for your detailed explanation!
> > > >   
> > > > > It also fixes the behavior of CLK_SET_RATE_GATE flag, which is why I
> > > > > put you
> > > > > in
> > > > > CC.
> > > > > 
> > > > > ux500 uses this flag several time, I'd like make sure people are not
> > > > > relying
> > > > > on
> > > > > its broken implementation.  
> > > > 
> > > > Ux500 audio is broken, but I'm fixing it a little at a time...  
> > > 
> > > No problem with Ux500 audio, don't worry :)
> > > Audio is just one application among others.
> > > 
> > > The concern regarding ux500 is that the clock controller declares clocks
> > > using
> > > the CLK_SET_RATE_GATE flag (like qcom, at91 and several other)
> > > 
> > > here is the definition:
> > > #define CLK_SET_RATE_GATE	BIT(0) /* must be gated across rate
> > > change */
> > > 
> > > My interpretation it that, as long as clock is enabled, rate can't change.
> > > 
> > > The implementation of this flag is currently broken:
> > > * If you call set_rate on directly on the clock while it is enabled, you
> > > will
> > > get -EBUSY, as expected
> > > * If you call set_rate on its parent, rate will change, changing the rate
> > > of the
> > > child clock as well ...
> > > 
> > > With this patchset applied, calling set_rate on the parent would also
> > > return
> > > -EBUSY, enforcing the "rate can't change while enabled" property.
> > > 
> > > To build confidence that this won't be causing regression, I'd like to
> > > check
> > > that platform using this flag are no relying on the broken behavior.
> > > 
> > > I've included the clock maintainers of at91, qcom, and ux500 (you) in this
> > > thread because they are the heaviest users of this flag, so the more
> > > likely to
> > > report a problem.
> > 
> > This flag in at91 clk drivers really means that rate cannot be changed
> > while the clk is enabled. We have other clock where this is not a
> > problem (at least, nothing in mentioned in the datasheet).
> > 
> > > 
> > > If you could apply this series and just do things as usual, It'd be
> > > awesome !
> > 
> > Actually, this is a feature I was pushing for a while back [1],
> > because I had the same problem (one user messing up with a PLL while
> > others were relying on its rate). I'm glad someone finally had time to
> > provide a solution for this problem.
> > 
> > Quentin tested the series, and I guess he'll soon add his Tested-by.
> > Note that this series does not address all problems. For example, when
> > several drivers are setting a rate on different clks that take the
> > same parent, the first one to set the rate and enable the clk wins.
> > 
> > He has an hack-ish solution for our audio-pll case preventing non audio
> > users to mess up with the audio PLL. It'd be great to have a generic
> > solution, though I don't know how this can be solved without advanced
> > description of the clk-rate setting policy.
> > 
> > [1]https://patchwork.kernel.org/patch/6204221/
> > 
> 
> I've tested the patch series and it seems good to me.
> 
> Tested-by: Quentin Schulz <quentin.schulz@free-electrons.com>

Thx a lot for taking the time to test this.

> 
> Our hackish solution for the moment is to deny clock children to take
> the audio-pll clock as parent except if it's classd (the audio IP). That
> way, we take care of the driver probing "order" (i.e., the first driver
> to enable the clock will lock the rate, but maybe that rate isn't the
> one we want for a more critical driver) but it is definitely not a neat
> solution.
> 

For sure, there is still a lot of thing to be done :) 
Ressource allocation and management is a never ending story I suppose.
If you have an idea to improve things, maybe you should post an RFC to kick offthe discussion. 

> Thanks,
> Quentin
> 

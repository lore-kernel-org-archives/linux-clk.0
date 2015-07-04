Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Osmialowski <pawelo@king.net.pl>, Mark Rutland <mark.rutland@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <r.herring@freescale.com>, Alexander Potashev <aspotashev@emcraft.com>, Jiri Slaby <jslaby@suse.cz>, linux-clk@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org, Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>, Anson Huang <b20788@freescale.com>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, Frank Li <Frank.Li@freescale.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jingchang Lu <jingchang.lu@freescale.com>, Yuri Tikhonov <yur@emcraft.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sergei Poselenov <sposelenov@emcraft.com>, Paul Bolle <pebolle@tiscali.nl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 3/9] arm: twr-k70f120m: clock driver for Kinetis SoC
Date: Sat, 04 Jul 2015 21:54:12 +0200
Message-ID: <2009463.YLtdMegFel@wuerfel>
In-Reply-To: <alpine.DEB.2.11.1507030006280.3916@nanos>
References: <1435667250-28299-1-git-send-email-pawelo@king.net.pl> <alpine.LNX.2.00.1507022338070.28322@localhost.localdomain> <alpine.DEB.2.11.1507030006280.3916@nanos>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Friday 03 July 2015 00:08:27 Thomas Gleixner wrote:
> On Thu, 2 Jul 2015, Paul Osmialowski wrote:
> > On Thu, 2 Jul 2015, Arnd Bergmann wrote:
> > 
> > > I wonder if you could move out the fixed rate clocks into their own
> > > nodes. Are they actually controlled by the same block? If they are
> > > just fixed, you can use the normal binding for fixed rate clocks
> > > and only describe the clocks that are related to the driver.
> > 
> > In my view having these clocks grouped together looks more convincing. After
> > all, they all share the same I/O regs in order to read configuration.
> 
> The fact that they share a register is not making them a group. That's
> just a HW design decision and you need to deal with that by protecting
> the register access, but not by trying to group them artificially at
> the functional level.

I'd disagree with that: The clock controller is the device that owns the
registers and that should be one node in DT, as Paul's first version does.

The part I'm still struggling with is understanding how the fixed-rate
clocks are controlled through those registers. If they are indeed configured
through the registers, the name is probably wrong and should be changed
to whatever kind of non-fixed clock this is.

	Arnd

Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 3 Jul 2015 00:08:27 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Paul Osmialowski <pawelo@king.net.pl>
cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Jiri Slaby <jslaby@suse.cz>, Kumar Gala <galak@codeaurora.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pawel Moll <pawel.moll@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@arm.linux.org.uk>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Vinod Koul <vinod.koul@intel.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	Nicolas Pitre <nicolas.pitre@linaro.org>,
	Sergei Poselenov <sposelenov@emcraft.com>,
	Paul Bolle <pebolle@tiscali.nl>,
	Jingchang Lu <jingchang.lu@freescale.com>,
	Yuri Tikhonov <yur@emcraft.com>,
	Rob Herring <r.herring@freescale.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
	Alexander Potashev <aspotashev@emcraft.com>,
	Frank Li <Frank.Li@freescale.com>,
	Anson Huang <b20788@freescale.com>
Subject: Re: [PATCH v2 3/9] arm: twr-k70f120m: clock driver for Kinetis SoC
In-Reply-To: <alpine.LNX.2.00.1507022338070.28322@localhost.localdomain>
Message-ID: <alpine.DEB.2.11.1507030006280.3916@nanos>
References: <1435667250-28299-1-git-send-email-pawelo@king.net.pl> <alpine.LNX.2.00.1507011756140.14440@localhost.localdomain> <alpine.LNX.2.00.1507021206410.13210@localhost.localdomain> <1861313.aMcV1xHCIq@wuerfel>
 <alpine.LNX.2.00.1507022338070.28322@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2 Jul 2015, Paul Osmialowski wrote:
> On Thu, 2 Jul 2015, Arnd Bergmann wrote:
> 
> > I wonder if you could move out the fixed rate clocks into their own
> > nodes. Are they actually controlled by the same block? If they are
> > just fixed, you can use the normal binding for fixed rate clocks
> > and only describe the clocks that are related to the driver.
> 
> In my view having these clocks grouped together looks more convincing. After
> all, they all share the same I/O regs in order to read configuration.

The fact that they share a register is not making them a group. That's
just a HW design decision and you need to deal with that by protecting
the register access, but not by trying to group them artificially at
the functional level.

Thanks,

	tglx

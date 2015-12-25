Return-Path: <mturquette@baylibre.com>
Date: Thu, 24 Dec 2015 21:06:08 -0800
From: Michael Turquette <mturquette@baylibre.com>
To: Remi Pommarel <repk@triplefau.lt>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Eric Anholt <eric@anholt.net>,
	Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add PWM clock support for bcm2835
Message-ID: <20151225050608.GB29521@quark.deferred.io>
References: <1449418969-5565-1-git-send-email-repk@triplefau.lt>
 <20151223185704.GJ453@cruxbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20151223185704.GJ453@cruxbox>
List-ID: <linux-clk.vger.kernel.org>

On 12/23, Remi Pommarel wrote:
> On Sun, Dec 06, 2015 at 05:22:45PM +0100, Remi Pommarel wrote:
> > Hi,
> > 
> > This patchset adds support for pwm clock. At boot, this clock does not have a
> > default parent nor a default rate set. Thus we should be able to change its
> > parent to get this clock working. The current clock implementation is using a
> > mux to select the parent, but these clocks need to add a password (0x5a) in
> > higher register bits when changing parent. So a generic mux cannot be used
> > here.
> > 
> > The two first patches fix the clock parent selection, while the last ones are
> > actually adding the pwm clock registration.
> > 
> > Changes since v1:
> > 	- determine_rate now based its parent selection upon divided rate
> > 	  instead of the parent one
> > 	- bcm2835_clock_choose_div has been modified to produce an avarage rate
> > 	  lower or equal to the requested one
> > 	- devicetree modifications have removed to be send in another patch
> > 
> > Changes since v2:
> > 	- Remove useless variable and include
> > 	- Make bcm2835_clock_choose_div() divisor round up ability optional
> > 	- Set rate in bcm2835_determine_rate()
> > 	- Add device tree modification in a separate patch
> > 
> > 
> > Remi Pommarel (4):
> >   clk: bcm2835: add a round up ability to the clock divisor
> >   clk: bcm2835: Support for clock parent selection
> >   clk: bcm2835: Add PWM clock support
> >   clk: bcm2835: Add PWM clock support to the device tree
> > 
> >  arch/arm/boot/dts/bcm2835-rpi.dtsi  |   4 +
> >  arch/arm/boot/dts/bcm2835.dtsi      |   9 +++
> >  drivers/clk/bcm/clk-bcm2835.c       | 155 +++++++++++++++++++++++-------------
> >  include/dt-bindings/clock/bcm2835.h |   3 +-
> >  4 files changed, 116 insertions(+), 55 deletions(-)
> > 
> 
> Gently ping.
> 
> Patches 0 to 3 are reviewed by Eric, and can eventually be pushed on clk
> tree.

Patches 1-3 applied to clk-next towards 4.5.

> 
> Patch 4 has been sent on devicetree mailinglist for review
> (http://www.spinics.net/lists/devicetree/msg108070.html), waiting for
> previous patches to be pushed.

Sounds good.

Regards,
Mike

> 
> Thanks
> 
> -- 
> Remi

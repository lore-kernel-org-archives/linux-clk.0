Return-Path: <repk@triplefau.lt>
Date: Thu, 5 Nov 2015 19:59:07 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Eric Anholt <eric@anholt.net>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: bcm2835: Add PWM clock support
Message-ID: <20151105185907.GK13534@cruxbox>
References: <1446678502-16243-1-git-send-email-repk@triplefau.lt>
 <1446678502-16243-3-git-send-email-repk@triplefau.lt>
 <87pozp2nr1.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87pozp2nr1.fsf@eliezer.anholt.net>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Nov 04, 2015 at 06:17:38PM -0800, Eric Anholt wrote:
> Remi Pommarel <repk@triplefau.lt> writes:
> 
> > Register the pwm clock for bcm2835.
> > This patch also adds the ability to set a clock default rate.
> 
> I don't think we should be setting a default clock rate.  That should be
> up to the thing that uses the clock.  If we need a standard rate set on
> all Raspberry Pis, other than what is set at boot, then we could put it
> in the bcm2835-pwm dt block (I think the "Assigned clock parents and
> rates" part of clock-bindings.txt gives a way to do so).
> 

Oh I didn't know about assigned-clocks-{rates,parent}, it sure is a
better solution, thanks.

> > Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> > ---
> >  arch/arm/boot/dts/bcm2835.dtsi      |  8 ++++++++
> >  drivers/clk/bcm/clk-bcm2835.c       | 28 +++++++++++++++++++++++++++-
> >  include/dt-bindings/clock/bcm2835.h |  3 ++-
> >  3 files changed, 37 insertions(+), 2 deletions(-)
> 
> Submitting DT changes is super awkward.  You'd need to put the bcm2835.h
> and driver change in one patch with this subject.  The clk maintainers
> would pull that patch.  You'd then have a second patch that covers just
> the .dtsi change, which I would pull once I had a stable branch to put
> it onto that had the bcm2835.h change.
> 

Ok will do, sorry about this.

[...]

Thanks.

-- 
Remi

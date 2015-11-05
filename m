Return-Path: <repk@triplefau.lt>
Date: Thu, 5 Nov 2015 19:53:36 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Eric Anholt <eric@anholt.net>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: bcm2835: Support for clock parent selection
Message-ID: <20151105185336.GJ13534@cruxbox>
References: <1446678502-16243-1-git-send-email-repk@triplefau.lt>
 <1446678502-16243-2-git-send-email-repk@triplefau.lt>
 <87si4l2oek.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87si4l2oek.fsf@eliezer.anholt.net>
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Wed, Nov 04, 2015 at 06:03:31PM -0800, Eric Anholt wrote:

[...]

> 
> It looks like you've dropped the use of the divisor off of the PLL
> channel when setting a rate.  That seems bad for all the other clocks in
> the system, and a feature we couldn't lose.

Sorry, but I'm not sure to understand your point here. Are you afraid
that clocks such as PWM, H264, etc, have lost the ability to divide the
rate from the PLL or oscillator clock they cosume as source ?

If so, I think it's ok. If I'm not wrong here, clk_set_rate() first
calls clk->determinate_rate() then calls clk->set_rate(). This patch
makes bcm2835_clock_determine_source() to only select the parent to use
and does not set the clock's rate itself. The clock's rate is set later
on when bcm2835_clock_set_parent() is called.

bcm2835_clock_set_parent() still divides the parent rate so we are not
loosing this feature here.

> 
> Also, you're choosing the lowest but higher rate, while
> mux_is_better_rate() chooses the highest but lower rate (which seems
> much safer).  What led to that choice?

bcm2835_clock_determine_source() does not choose the rate for the clock
itself but only selects the parent to use as source that will be divided
later on. So I'm choosing a parent that has higher rate because I want
to divide this rate in bcm2835_clock_set_parent().

> 
> Also, if we're going to have this function, I think it should be called
> "bcm2835_clock_determine_rate" to match the method name.
> 

I have called it this way because this function only select the
parent/source to use for the PWM clock and is not really determinating
the clock's rate.


On second thought, I see that doing things this way can be confusing,
and is not a really safe way to choose a clock's rate.

It would probably be better to have bcm2835_clock_determine_source()
selects the parent by choosing the one that provides the rate which,
after being divided, generates the highest but lower rate out of the
PWM clock itself.

Moreover, if you agree with the above modification I see no reason to
not call it "bcm2835_clock_determine_rate"


Thanks

-- 
Remi

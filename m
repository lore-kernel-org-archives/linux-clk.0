Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20150818155854.GK2547@lukather>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org,
 lee.jones@linaro.org, s.hauer@pengutronix.de, geert@linux-m68k.org
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <1438974570-20812-4-git-send-email-mturquette@baylibre.com>
 <20150818155854.GK2547@lukather>
Message-ID: <20150818163931.31346.78267@quantum>
Subject: Re: [PATCH RFC RFT 3/3] clk: introduce CLK_ENABLE_HAND_OFF flag
Date: Tue, 18 Aug 2015 09:39:31 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Maxime Ripard (2015-08-18 08:58:54)
> Hi Mike,
> =

> On Fri, Aug 07, 2015 at 12:09:30PM -0700, Michael Turquette wrote:
> > Some clocks are critical to system operation (e.g. cpu, memory, etc) and
> > should not be gated until a driver that knows best claims such a clock
> > and expressly gates that clock through the normal clk.h api.
> > =

> > The typical way to handle this is for the clk driver or some other early
> > code to call clk_prepare_enable on this important clock as soon as it is
> > registered and before the clk_disable_unused garbage collector kicks in.
> > =

> > This patch introduces a formal way to handle this scenario that is
> > provided by the clk framework. Clk driver authors can set the
> > CLK_ENABLE_HAND_OFF flag in their clk data, which will cause the clk to
> > be enabled in clk_register(). Then when the first clk consumer driver
> > comes along and calls clk_get() & clk_prepare_enable(), the reference
> > counts taken during clk registration are transfered (or handed off) to
> > the clk consumer.
> > =

> > At this point handling the clk is the same as any other clock which as
> > not set the new CLK_ENABLE_HAND_OFF flag. In fact no changes to any
> > clock consumer driver are needed for this to work.
> =

> This looks fine, the only thing I'm not really fond of is the name of
> the flag itself (and it's usually a good thing when we come to that
> kind of bikeshedding).

Agreed on the Bikeshedding Milestone!

I also do not like the name, but I'm struggling to find the right one
(as usual).

> =

> In my mind, the fact that we hand off the clock reference is a direct
> result to the clock being critical (or whatever name we want to call
> it). The hand off is a side effect, but the real information we want
> to carry is that it should not be gated.

I chose the "hand-off" name because I want to set an expectation to
users of this feature. That expectation is that some day they will have
a Linux device driver that claims and manages this "critical clock".
Clearly this is not always the case. Many clocks using this feature will
never have a driver that "owns" them.

But I wanted to avoid any kind of "always on" or "easy hack to avoid
writing proper driver code" naming convention that encourages bad
behavior down the line.

Also, the hand-off thing is sort of a big deal. If driver writers only
thought of this as an "alway on" mechanism then subtle bugs might creep
in where drivers are getting and disabling a clock that the author
incorrectly thought would always be enabled. So I'd like the name to
reflect that somehow.

As always I am open to suggestions.

Regards,
Mike

> =

> And then the framework will know what behaviour it want to have based
> on that information.
> =

> Maxime
> =

> -- =

> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

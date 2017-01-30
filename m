Return-Path: <linux@roeck-us.net>
Date: Mon, 30 Jan 2017 14:51:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: add more managed APIs
Message-ID: <20170130225138.GA14987@roeck-us.net>
References: <20170128184047.GA24957@dtor-ws>
 <20170128190309.GN27312@n2100.armlinux.org.uk>
 <20170128192207.GA38136@dtor-ws>
 <64ed0890-14f6-42ff-66b1-60f7b3d7d02f@roeck-us.net>
 <20170128233911.GO27312@n2100.armlinux.org.uk>
 <20170129180743.GA10917@dtor-ws>
 <20170130185551.GM8801@codeaurora.org>
 <20170130192214.GC11199@roeck-us.net>
 <20170130214227.GI27312@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170130214227.GI27312@n2100.armlinux.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jan 30, 2017 at 09:42:28PM +0000, Russell King - ARM Linux wrote:
> On Mon, Jan 30, 2017 at 11:22:14AM -0800, Guenter Roeck wrote:
> > Maybe the additional calls make sense; I can imagine they would.
> > However, I personally would be a bit wary of changing the initialization
> > order of multi-clock initializations, and I am not sure how a single call
> > could address setting the rate ([devm_]clk_get_setrate_prepare_enable()
> > seems like a bit too much).
> > 
> > [ On a side note, why is there no clk_get_prepare_enable() and
> >   clk_get_prepare() ? Maybe it would be better to introduce those
> >   together with the matching devm_ functions in a separate patch
> >   if they are useful. ]
> 
> If you take the view that trying to keep clocks disabled is a good way
> to save power, then you'd have the clk_prepare() or maybe
> clk_prepare_enable() in your runtime PM resume handler, or maybe even
> deeper in the driver... the original design goal of the clk API was to
> allow power saving and clock control.
> 
> With that in mind, getting and enabling the clock together in the
> probe function didn't make sense.
> 
> I feel that aspect has been somewhat lost, and people now regard much
> of the clk API as a bit of a probe-time nusience.
> 

While I understand what you are saying, I think just focusing on power
savings paints a bit of a simplistic view of the clock API and its use.
Power saving is not its only use case. In a system where power saving isn't
the highest priority (say, in a high end switch), it is still extremely
valuable, providing a unified API to the clocks in the system (and there
are lots of clocks in a high end switch). Having seen what happens if there
is _no_ unified API (ie a complete mess of per-clock-driver calls all over
the place), I consider this as at least as or even more important than its
power savings potential. In this use case, one would normally both get and
enable the clock (or, much more likely, clocks) in the probe function.
One would also need remove functions, since interfaces in a high end switch
are typically OIR capable.

For my part, I stumbled over the lack of devm functions for clock APIs recently
when trying to convert watchdog drivers to use devm functions where possible.
Many watchdog drivers do use the clock API to only enable the clock when the
watchdog is actually running. However, there are several which prepare and
enable the clock at probe time, and disable/unprepare on remove. Would it be
possible to convert those to only prepare/enable the clocks if the watchdog
is actually enabled ? Possibly, but I am sure that there are cases where that
is not possible, or feasible. Either way, watchdog drivers are usually only
loaded when actually used, so trying to optimize clock usage would often be
more pain than it is worth.

When I did that conversion, I started out using devm_add_action_or_reset().
While that does work, it was pointed out that using devm functions for the
clock APIs would be a much better solution. As it turns out, devm_add_action()
and devm_add_action_or_reset() is already being used by various drivers to
work around the lack of devm functions for the clock API. With that in mind,
have a choice to make - we can continue forcing people to do that, or we can
introduce devm functions. My vote is for the latter.

Thanks,
Guenter

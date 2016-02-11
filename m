Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Rhyland Klein <rklein@nvidia.com>,
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
 "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <56BB82A8.8010701@nvidia.com>
Cc: linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org
References: <1455058120-7398-1-git-send-email-rklein@nvidia.com>
 <56BAA6D9.9090009@elopez.com.ar> <56BB82A8.8010701@nvidia.com>
Message-ID: <20160211213247.26445.28956@quark.deferred.io>
Subject: Re: [PATCH] clk: clk_register: Correctly initialize enable_count
Date: Thu, 11 Feb 2016 13:32:47 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Rhyland Klein (2016-02-10 10:34:16)
> On 2/9/2016 9:56 PM, Emilio L=C3=B3pez wrote:
> > Hi,
> > =

> > El 09/02/16 a las 19:48, Rhyland Klein escribi=C3=B3:
> >> When clocks are registered, they could be enabled already in
> >> hardware. As of now, the enable count will start at 0. When this
> >> happens, it means a clock is enabled and the framework doesn't know
> >> that, so it will always report it as disabled.

Nak.

> > =

> > Keep in mind that during the boot process, towards the end, unused
> > clocks get disabled, so the state remains in sync. If suddenly the
> > enable_count on unused clocks is not 0, this will break and unused
> > clocks will remain on, wasting power.
> =

> Hmm, I had misread the logic in clk_disable_unused_subtree(), namely I
> inverted the check on enable_count when I was looking at it. It does
> seem like it would take care of the clocks I was referring to.

clk_disable_unused() will gate clocks left on by the bootloader AND not
yet claimed and enabled by a clock consumer.

> =

> > =

> > http://lxr.free-electrons.com/source/drivers/clk/clk.c#L244
> > =

> > What issue were you having that prompted you to write this patch?
> =

> I ran into the situation where a peripheral clock was enabled before the
> kernel loaded, and I was trying to disable it in the clk-tegra210
> driver. Calling clk_disable() won't work, as the clock doesn't have an
> enable_count.

Please check out include/linux/clk.h one more time. Calling
clk_disable() before ever calling clk_enable() is a violation of the
api. We try our best to avoid playing refcount games by enforcing that
rule.

> =

> I do think that the clk_disable_unused_subtree() should pick up the
> slack, but I was trying to disable it before the cleanup code to remove
> unused clocks ran.

clk_disable_unused() handles the case where spurious clocks were left
enabled by the bootloader and need to be gated. This sounds like the
only thing you were after.

We also have a case where clocks are gated by clk_disable_unused()
because no driver has claimed them yet, but we really want those clocks
to be left enabled. For example, clocks supplying DDR & CPU shouldn't be
cut, ever. Alternatively, your bootloader put something on the display
but your display controller module hasn't loaded yet. Cutting the clock
isn't fatal but causes unnecessary screen flicker because the module has
not loaded up.

To solve those sets of problems there is the critical clocks and handoff
clocks thread[0].

[0] http://lkml.kernel.org/r/<1455225554-13267-1-git-send-email-mturquette@=
baylibre.com>

Best regards,
Mike

> =

> I think you are right and the clean up code should cover the situation I
> was looking at.
> =

> Thanks.
> -rhyland
> =

> =

> -- =

> nvpublic

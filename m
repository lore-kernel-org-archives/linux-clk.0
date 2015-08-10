Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Lee Jones <lee.jones@linaro.org>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20150810153638.GO3249@x1>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org,
 maxime.ripard@free-electrons.com, s.hauer@pengutronix.de,
 geert@linux-m68k.org
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <20150810153638.GO3249@x1>
Message-ID: <20150810192810.2416.25672@quantum>
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and implement
 hand-off
Date: Mon, 10 Aug 2015 12:28:10 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Lee,

Quoting Lee Jones (2015-08-10 08:36:38)
> On Fri, 07 Aug 2015, Michael Turquette wrote:
> > This is an alternative solution to Lee's "clk: Provide support for
> > always-on clocks" series[0].
>  =

> So after all the hours of work that's been put in and all of the
> versions that have been authored, you're just going to write your own
> solution anyway, without any further discussion?

This certainly seems like "further discussion" to me. In fact the
capital C in RFC pretty much announces that this is a big, wide open
discussion.

If I had ninja-merged the patches then I would understand your
frustration, but that clearly is not the case.

> =

> That's one way to make your contributors feel valued.

Lee, your contributions are very much valued. You and I both know that
there are times when a concept is far better communicated with code than
with prose. This is one of those times. The DT-centric solution that
requires a clock consumer driver to call clk_disable() before calling
clk_enable() (an obvious violation of the clk.h api) is just plain wrong
and this implementation hopes to get it back on the right course.

> =

> > The first two patches introduce run-time checks to ensure that clock
> > consumer drivers are respecting the clk.h api. The former patch checks
> > for prepare and enable imbalances. The latter checks for calls to
> > clk_put without first disabling and unpreparing the clk.
> =

> Are these real issues that people are having trouble with, or just
> hypothetical ones?  I can understand the need for them if they're
> causing people some pain, but if they are unnecessarily hardening the
> API, then it makes it difficult for proper issues (such as critical
> clocks) to be solved easily.

They are deeply related. Per-user accounting gives us a graceful method
to implement hand-off, which is the real feature that is needed here.

> =

> > The third patch introduces a new flag, CLK_ENABLE_HAND_OFF, which
> > prepares and enables a clk at registration-time. The reference counts
> > (prepare & enable) are transferred to the first clock consumer driver
> > that clk_get's the clk with this flag set AND calls clk_prepare or
> > clk_enable.
> > =

> > The net result is that a clock with this flag set will be enabled at
> > boot and neither the clk_disable_unused garbage collector or the
> > "sibling clock disables a shared parent" scenario will cause the flagged
> > clock to be disabled.
> =

> I'm not sure if the third patch actually solves the _real_ issue you
> allude to here.  The original critical (then called always-on) clock
> patch-set solved it just fine.  However others were concerned about
> how you would then turn the clock off if some knowledgeable consumer
> (who knew the full consequences of their actions) came along and had a
> good reason to gate it.  That, the turning off the clock if still
> desired is what the third patch _actually_ solves.
> =

> Now we are back where we started however, and still need to figure out
> a generic method to mark the clocks (either by setting a FLAG or
> actually calling enable()) as critical.

The third patch:

1) implements an always-on behavior
2) allows knowledgeable drivers to gate the clock
3) marks such clocks with a flag

What is missing?

> =

> > The first driver to come along and explicitly
> > claim, prepare and enable this clock will inherit those reference
> > counts. No change to clock consumer drivers is required for this to
> > work.
> =

> Do you mean it won't break anything?  I think to make use of the
> functionality each of the providers still have to figure out which of
> their clocks are critical (which may change from platform to platform)
> then mark them as such before registration.

What I meant was: "does not require any new api such as
clk_critical_enable() or clk_critical_disable()". There is zero change
to clk.h as a part of this series, which is a good thing.

> =

> > Please continue to use the clk.h api properly.
> > =

> > In time this approach can probably replace the CLK_IGNORE_UNUSED flag
> > and hopefully reduce the number of users of the clk_ignore_unused boot
> > parameter.
> > =

> > Finally, a quick note on comparing this series to Lee's. I went with the
> > simplest approach to solve a real problem: preventing critical clocks
> > from being spuriously disabled at boot, or before a their parent clock
> > becomes accidentally disabled by a sibling.
> =

> This wasn't the problem.  Platforms are already doing this.  The _real_

Yes, this is a very real problem. In fact it is two very real problems:

1) Platforms are open-coding this "always-on" behavior by calling
clk_prepare_enable a bunch in their clock provider driver. I'm still OK
with that, but this flag provides a coherent way to do it. And,

2) Drivers that open-code calls to clk_prepare_enable in their clock
provider driver have no way to allow clock knowledgeable consumer
drivers to gate those clocks later on.

> problem was doing it in a generic way, so vendors didn't have to roll
> their own 'gather' and 'mark' code, which unfortunately they still have
> to do with this solution.

There is no gather. The data for clocks belongs in most drivers, just
not yours. Marking is as simple as setting a flag (which many drives
already do). Please see my response to you in patch #3 for an example.

> =

> > All of the other kitchen sink stuff (DT binding, =

> =

> The DT binding will still be required, at least for ST, as they have
> gone for the more Linuxy approach of having a generic set of clock
> drivers and provide all of the platform specific information in
> platform code (i.e. DT).  So to identify which clocks are critical on
> each platform the DT will need to be interrogated in some way.

At the risk of instigating a serious religious conflict, I humbly
disagree that using Devicetree as a data-driven interface for device
drivers is the "more Linuxy approach". I think that the Devicetree
people would disagree with you too.

The more Linuxy approach is for device drivers to contain all of the
information they need to function.  Devicetree does a stellar job of
linking up providers and consumers of these resources, which is outside
the purview of individual drivers.

Regards,
Mike

> =

> > passing the flag back to the framework when the clock consumer
> > driver calls clk_put) was left
> =

> I'm not sure what this is.
> =

> > out because I do not see a real use case for it. If one can demonstrate
> > a real use case (and not a hypothetical one) then this patch series can
> > be expanded further.
> > =

> > [0] http://lkml.kernel.org/r/<1437570255-21049-1-git-send-email-lee.jon=
es@linaro.org>
> > =

> > Michael Turquette (3):
> >   clk: per-user clk prepare & enable ref counts
> >   clk: clk_put WARNs if user has not disabled clk
> >   clk: introduce CLK_ENABLE_HAND_OFF flag
> > =

> >  drivers/clk/clk.c            | 79 ++++++++++++++++++++++++++++++++++++=
+++++---
> >  include/linux/clk-provider.h |  3 ++
> >  2 files changed, 78 insertions(+), 4 deletions(-)
> > =

> =

> -- =

> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog

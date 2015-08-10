Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Mon, 10 Aug 2015 16:36:38 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, maxime.ripard@free-electrons.com,
	s.hauer@pengutronix.de, geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and
 implement hand-off
Message-ID: <20150810153638.GO3249@x1>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, 07 Aug 2015, Michael Turquette wrote:
> This is an alternative solution to Lee's "clk: Provide support for
> always-on clocks" series[0].
 
So after all the hours of work that's been put in and all of the
versions that have been authored, you're just going to write your own
solution anyway, without any further discussion?

That's one way to make your contributors feel valued.

> The first two patches introduce run-time checks to ensure that clock
> consumer drivers are respecting the clk.h api. The former patch checks
> for prepare and enable imbalances. The latter checks for calls to
> clk_put without first disabling and unpreparing the clk.

Are these real issues that people are having trouble with, or just
hypothetical ones?  I can understand the need for them if they're
causing people some pain, but if they are unnecessarily hardening the
API, then it makes it difficult for proper issues (such as critical
clocks) to be solved easily.

> The third patch introduces a new flag, CLK_ENABLE_HAND_OFF, which
> prepares and enables a clk at registration-time. The reference counts
> (prepare & enable) are transferred to the first clock consumer driver
> that clk_get's the clk with this flag set AND calls clk_prepare or
> clk_enable.
> 
> The net result is that a clock with this flag set will be enabled at
> boot and neither the clk_disable_unused garbage collector or the
> "sibling clock disables a shared parent" scenario will cause the flagged
> clock to be disabled.

I'm not sure if the third patch actually solves the _real_ issue you
allude to here.  The original critical (then called always-on) clock
patch-set solved it just fine.  However others were concerned about
how you would then turn the clock off if some knowledgeable consumer
(who knew the full consequences of their actions) came along and had a
good reason to gate it.  That, the turning off the clock if still
desired is what the third patch _actually_ solves.

Now we are back where we started however, and still need to figure out
a generic method to mark the clocks (either by setting a FLAG or
actually calling enable()) as critical.

> The first driver to come along and explicitly
> claim, prepare and enable this clock will inherit those reference
> counts. No change to clock consumer drivers is required for this to
> work.

Do you mean it won't break anything?  I think to make use of the
functionality each of the providers still have to figure out which of
their clocks are critical (which may change from platform to platform)
then mark them as such before registration.

> Please continue to use the clk.h api properly.
> 
> In time this approach can probably replace the CLK_IGNORE_UNUSED flag
> and hopefully reduce the number of users of the clk_ignore_unused boot
> parameter.
> 
> Finally, a quick note on comparing this series to Lee's. I went with the
> simplest approach to solve a real problem: preventing critical clocks
> from being spuriously disabled at boot, or before a their parent clock
> becomes accidentally disabled by a sibling.

This wasn't the problem.  Platforms are already doing this.  The _real_
problem was doing it in a generic way, so vendors didn't have to roll
their own 'gather' and 'mark' code, which unfortunately they still have
to do with this solution.

> All of the other kitchen sink stuff (DT binding, 

The DT binding will still be required, at least for ST, as they have
gone for the more Linuxy approach of having a generic set of clock
drivers and provide all of the platform specific information in
platform code (i.e. DT).  So to identify which clocks are critical on
each platform the DT will need to be interrogated in some way.

> passing the flag back to the framework when the clock consumer
> driver calls clk_put) was left

I'm not sure what this is.

> out because I do not see a real use case for it. If one can demonstrate
> a real use case (and not a hypothetical one) then this patch series can
> be expanded further.
> 
> [0] http://lkml.kernel.org/r/<1437570255-21049-1-git-send-email-lee.jones@linaro.org>
> 
> Michael Turquette (3):
>   clk: per-user clk prepare & enable ref counts
>   clk: clk_put WARNs if user has not disabled clk
>   clk: introduce CLK_ENABLE_HAND_OFF flag
> 
>  drivers/clk/clk.c            | 79 +++++++++++++++++++++++++++++++++++++++++---
>  include/linux/clk-provider.h |  3 ++
>  2 files changed, 78 insertions(+), 4 deletions(-)
> 

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

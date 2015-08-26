Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 26 Aug 2015 21:41:52 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Maxime Coquelin <maxime.coquelin@st.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, s.hauer@pengutronix.de, geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and
 implement hand-off
Message-ID: <20150826204151.GB19409@x1>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <20150818154552.GI2547@lukather>
 <20150818164356.31346.80341@quantum>
 <20150820151510.GD30520@lukather>
 <20150825215051.31346.56261@quantum>
 <20150826065423.GR19409@x1>
 <55DD7C05.6030207@st.com>
 <20150826090956.GW19409@x1>
 <55DD88CD.6010608@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <55DD88CD.6010608@st.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Mike, Maxime, Maxime,

On Wed, 26 Aug 2015, Maxime Coquelin wrote:
> On 08/26/2015 11:09 AM, Lee Jones wrote:
> >On Wed, 26 Aug 2015, Maxime Coquelin wrote:
> >>On 08/26/2015 08:54 AM, Lee Jones wrote:
> >>>On Tue, 25 Aug 2015, Michael Turquette wrote:
> >>>
> >>>>Maybe I am the one missing something? My goal was to allow the consumer
> >>>>driver to gate the critical clock. So we need clk_disable_unused to
> >>>>actually disable the clock for that to work.
> >>>>
> >>>>I think you are suggesting that clk_disable_unused should *not* disable
> >>>>the clock if it is critical. Can you confirm that?
> >>>My take is that a critical clock should only be disabled when a
> >>>knowledgeable driver wants to gate it for a specific purpose [probably
> >>>using clk_disable()].  Once the aforementioned driver no longer has a
> >>>use for the clock [whether that happens with clk_unprepare_disable()
> >>>or clk_put() ...] the clock should be ungated and be provided with
> >>>critical status once more.
> >>>
> >>How do you differentiate between a knowledgeable and
> >>non-knowledgeable driver?
> >>Let's take the example of the clock used by the i2c on STi SoCs.
> >>This clock is used by i2c, and is also critical to the system, but
> >>only i2c takes it.
> >>
> >>At first transfer, the i2c will enable the clock and then disables it.
> >>
> >>What we would expect here is that the clk_disable does not gate the
> >>clock, even if only user since the hand-off flag has been set.
> >>Else, system will freeze.
> >The I2C driver in this instance is not a knowledgeable driver and
> >should not be taking a reference to a critical clock.
> This is the case:
>         i2c@9840000 {
>             ...
>             clocks = <&clk_s_c0_flexgen CLK_EXT2F_A9>;
>             clock-names = "ssc";
>             ...
>         }
> 
> CLK_EXT2F_A9 is a critical clock I think.
> Indeed, this clock corresponds to output 13 of clockgen c0.
> This ouput has several clock names in the datasheet, but is in
> reality the same clock from HW point of view (i.e. "same wire"):
> 
> - CLK_ICN_REG
> - CLK_TRACE_A9
> - CLK_PTI_STM
> - CLK_EXT2F_A9
> 
> I'm pretty sure CLK_ICN_REG is a critical clock.
> 
> Try to gate it without gating its parent, and see if system is still alive.
> 
> >In the example you provide, the real issue is that the I2C driver uses
> >one of the critical clock's siblings.  Without this framework, if it
> >gives up the reference to its own clock and there are no users of any
> >sibling clocks, the parent is gated.  This has the unfortunate effect
> >of gating the entire family, critical clock included.
> 
> I don't see why a clock used by i2c could not be a critical clock,
> if it is used by other parts of the system that cannot be
> represented as drivers, and rely on the clock to be always on.

This is actually a great point and one that slipped my mind recently.
Handing-off a critical clock to the first requester will break our
platform.  It's part of the reason I set-up a special API.

To summarise:

In the beginning we were faced with an issue where unclaimed, but
still required clocks were being gated on start-up.  This was due to
the 'disable-unused' functionality used for power saving.  This was
tackled in one of two ways; either turn it off completely using the
'clk_ignore_unused' kernel command line parameter or on a per-clock
bases using a flag in C code.

Even with 'clk_ignore_unused' provided, drivers were able to gate
clocks critical to the running of the system by either gating their
siblings or the critical clock itself if it was shared with other
users.  It was this issue that prompted the creation of this set's
predecessor.

Although the original set worked, there were two shortcomings.
Firstly, it created a imbalance in the internal framework reference
counting.  Something that wasn't an issue at the time, but would
become an issue once Mike had authored and submitted his per-clock
reference counting patch set.  It also didn't allow "knowledgeable"
drivers (ones which knew the risks of gating a critical clock, but
knew better, and that it was okay to do so) to adopt the clock in
order to disable it.

So now we have this new set, where the priorities seem to have been
reversed.  It solves the issue of clock adoption by knowledgeable
drivers, but it suffers from the same symptoms as the ones which
prompted this functionality in the first place.  If, let's call it
an "uninformed" driver requests a critical clock using the current
API, the critical clock will be handed over, then the uninformed
driver is free to gate and ungate it as it sees fit.  The issue is
that the first call to clk_disable() will bork the running platform
irrecoverably.

We've already made it quite clear that we shouldn't be coding for
hypothetical situations.  So why do we even have this hand-off
feature?  I'm not aware of any knowledgeable drivers which do think
it's a good idea to gate a critical clock.  Are there any?

The hand-off feature was only mentioned because we were marking clocks
as critical in DT.  And due to the fact that DTBs sometimes get
separated (out dated) from the kernel, we needed this as a fall-back
plan to gate clocks previously thought to be critical at a later date.
However, this implementation doesn't even have DT support.  So to fix
this problem you could just un-flag the clock as critical, no?

>From a personal PoV, this set has all the features we don't need and
none of the ones we do.

I would like to suggest once more that if you wanted to keep this
adoption/hand-off feature that we do so in a cleaner (i.e. have proper
functions that deal with this stuff as opposed to shoehorning extra
code into existing functions) and more deliberate (i.e. insist that a
driver identify itself as 'knowledgeable', rather than 'uninformed' by
way of a specific call, clk_get_critical() for instance) way.

How do you propose we move forward?  Would be be okay with me having
another stab at this?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

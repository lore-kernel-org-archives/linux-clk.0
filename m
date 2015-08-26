Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Wed, 26 Aug 2015 10:09:56 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Maxime Coquelin <maxime.coquelin@st.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, s.hauer@pengutronix.de, geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and
 implement hand-off
Message-ID: <20150826090956.GW19409@x1>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <20150818154552.GI2547@lukather>
 <20150818164356.31346.80341@quantum>
 <20150820151510.GD30520@lukather>
 <20150825215051.31346.56261@quantum>
 <20150826065423.GR19409@x1>
 <55DD7C05.6030207@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <55DD7C05.6030207@st.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, 26 Aug 2015, Maxime Coquelin wrote:

> Hi Lee,
> 
> On 08/26/2015 08:54 AM, Lee Jones wrote:
> >On Tue, 25 Aug 2015, Michael Turquette wrote:
> >
> >
> >>Maybe I am the one missing something? My goal was to allow the consumer
> >>driver to gate the critical clock. So we need clk_disable_unused to
> >>actually disable the clock for that to work.
> >>
> >>I think you are suggesting that clk_disable_unused should *not* disable
> >>the clock if it is critical. Can you confirm that?
> >My take is that a critical clock should only be disabled when a
> >knowledgeable driver wants to gate it for a specific purpose [probably
> >using clk_disable()].  Once the aforementioned driver no longer has a
> >use for the clock [whether that happens with clk_unprepare_disable()
> >or clk_put() ...] the clock should be ungated and be provided with
> >critical status once more.
> >
> How do you differentiate between a knowledgeable and
> non-knowledgeable driver?
> Let's take the example of the clock used by the i2c on STi SoCs.
> This clock is used by i2c, and is also critical to the system, but
> only i2c takes it.
> 
> At first transfer, the i2c will enable the clock and then disables it.
> 
> What we would expect here is that the clk_disable does not gate the
> clock, even if only user since the hand-off flag has been set.
> Else, system will freeze.

The I2C driver in this instance is not a knowledgeable driver and
should not be taking a reference to a critical clock.

In the example you provide, the real issue is that the I2C driver uses
one of the critical clock's siblings.  Without this framework, if it
gives up the reference to its own clock and there are no users of any
sibling clocks, the parent is gated.  This has the unfortunate effect
of gating the entire family, critical clock included.

These sorts of issues are precisely what we're trying to fix here.

For clarification, a knowledgeable driver is one that requests an
actual (not a sibling of) critical clock.  It's knowledgeable in the
fact that it knows what gating the clock will do to the system, but it
"knows best" that this is actually fine.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

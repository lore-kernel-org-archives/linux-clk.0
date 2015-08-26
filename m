Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Wed, 26 Aug 2015 07:54:23 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, s.hauer@pengutronix.de, geert@linux-m68k.org
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and
 implement hand-off
Message-ID: <20150826065423.GR19409@x1>
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <20150818154552.GI2547@lukather>
 <20150818164356.31346.80341@quantum>
 <20150820151510.GD30520@lukather>
 <20150825215051.31346.56261@quantum>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20150825215051.31346.56261@quantum>
List-ID: <linux-clk.vger.kernel.org>

On Tue, 25 Aug 2015, Michael Turquette wrote:

> Quoting Maxime Ripard (2015-08-20 08:15:10)
> > On Tue, Aug 18, 2015 at 09:43:56AM -0700, Michael Turquette wrote:
> > > Quoting Maxime Ripard (2015-08-18 08:45:52)
> > > > Hi Mike,
> > > > 
> > > > On Fri, Aug 07, 2015 at 12:09:27PM -0700, Michael Turquette wrote:
> > > > > All of the other kitchen sink stuff (DT binding, passing the flag back
> > > > > to the framework when the clock consumer driver calls clk_put) was left
> > > > > out because I do not see a real use case for it. If one can demonstrate
> > > > > a real use case (and not a hypothetical one) then this patch series can
> > > > > be expanded further.
> > > > 
> > > > I think there is a very trivial use case for passing back the
> > > > reference to the framework, if during the probed, we have something
> > > > like:
> > > > 
> > > > clk = clk_get()
> > > > clk_prepare_enable(clk)
> > > > foo_framework_register()
> > > > 
> > > > if foo_framework_register fails, the sensible thing to do would be to
> > > > call clk_disable_unprepare. If the clock was a critical clock, you
> > > > just gated it.
> > > 
> > > Hmm, a good point. Creating the "pass the reference back" call is not
> > > hard technically. But how to keep from abusing it? E.g. I do not want
> > > that call to become an alternative to correct use of clk_enable.
> > > 
> > > Maybe I'll need a Coccinelle script or just some regular sed to
> > > occasionally search for new users of this api and audit them?
> > > 
> > > I was hoping to not add any new consumer api at all :-/
> > 
> > I don't think there's any abuse that can be done with the current API,
> > nor do I think you need to have new functions either.
> > 
> > If the clock is critical, when the customer calls
> > clk_unprepare_disable on it, simply take back the reference you gave
> > in the framework, and you're done. Or am I missing something?
> 
> Maybe I am the one missing something? My goal was to allow the consumer
> driver to gate the critical clock. So we need clk_disable_unused to
> actually disable the clock for that to work.
> 
> I think you are suggesting that clk_disable_unused should *not* disable
> the clock if it is critical. Can you confirm that?

My take is that a critical clock should only be disabled when a
knowledgeable driver wants to gate it for a specific purpose [probably
using clk_disable()].  Once the aforementioned driver no longer has a
use for the clock [whether that happens with clk_unprepare_disable()
or clk_put() ...] the clock should be ungated and be provided with
critical status once more.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

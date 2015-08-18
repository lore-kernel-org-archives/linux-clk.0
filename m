Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20150818154552.GI2547@lukather>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org,
 lee.jones@linaro.org, s.hauer@pengutronix.de, geert@linux-m68k.org
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <20150818154552.GI2547@lukather>
Message-ID: <20150818164356.31346.80341@quantum>
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and implement
 hand-off
Date: Tue, 18 Aug 2015 09:43:56 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Maxime Ripard (2015-08-18 08:45:52)
> Hi Mike,
> =

> On Fri, Aug 07, 2015 at 12:09:27PM -0700, Michael Turquette wrote:
> > All of the other kitchen sink stuff (DT binding, passing the flag back
> > to the framework when the clock consumer driver calls clk_put) was left
> > out because I do not see a real use case for it. If one can demonstrate
> > a real use case (and not a hypothetical one) then this patch series can
> > be expanded further.
> =

> I think there is a very trivial use case for passing back the
> reference to the framework, if during the probed, we have something
> like:
> =

> clk =3D clk_get()
> clk_prepare_enable(clk)
> foo_framework_register()
> =

> if foo_framework_register fails, the sensible thing to do would be to
> call clk_disable_unprepare. If the clock was a critical clock, you
> just gated it.

Hmm, a good point. Creating the "pass the reference back" call is not
hard technically. But how to keep from abusing it? E.g. I do not want
that call to become an alternative to correct use of clk_enable.

Maybe I'll need a Coccinelle script or just some regular sed to
occasionally search for new users of this api and audit them?

I was hoping to not add any new consumer api at all :-/

Regards,
Mike

> =

> Maxime
> =

> -- =

> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

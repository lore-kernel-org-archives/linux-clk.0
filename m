Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20150829035557.GX29389@lukather>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org,
 lee.jones@linaro.org, s.hauer@pengutronix.de, geert@linux-m68k.org
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <20150818154552.GI2547@lukather> <20150818164356.31346.80341@quantum>
 <20150820151510.GD30520@lukather> <20150825215051.31346.56261@quantum>
 <20150829035557.GX29389@lukather>
Message-ID: <20150930123649.3201.75689@quantum>
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and implement
 hand-off
Date: Wed, 30 Sep 2015 05:36:49 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Maxime Ripard (2015-08-28 20:55:57)
> Hi Mike,
> =

> On Tue, Aug 25, 2015 at 02:50:51PM -0700, Michael Turquette wrote:
> > Quoting Maxime Ripard (2015-08-20 08:15:10)
> > > On Tue, Aug 18, 2015 at 09:43:56AM -0700, Michael Turquette wrote:
> > > > Quoting Maxime Ripard (2015-08-18 08:45:52)
> > > > > Hi Mike,
> > > > > =

> > > > > On Fri, Aug 07, 2015 at 12:09:27PM -0700, Michael Turquette wrote:
> > > > > > All of the other kitchen sink stuff (DT binding, passing the fl=
ag back
> > > > > > to the framework when the clock consumer driver calls clk_put) =
was left
> > > > > > out because I do not see a real use case for it. If one can dem=
onstrate
> > > > > > a real use case (and not a hypothetical one) then this patch se=
ries can
> > > > > > be expanded further.
> > > > > =

> > > > > I think there is a very trivial use case for passing back the
> > > > > reference to the framework, if during the probed, we have somethi=
ng
> > > > > like:
> > > > > =

> > > > > clk =3D clk_get()
> > > > > clk_prepare_enable(clk)
> > > > > foo_framework_register()
> > > > > =

> > > > > if foo_framework_register fails, the sensible thing to do would b=
e to
> > > > > call clk_disable_unprepare. If the clock was a critical clock, you
> > > > > just gated it.
> > > > =

> > > > Hmm, a good point. Creating the "pass the reference back" call is n=
ot
> > > > hard technically. But how to keep from abusing it? E.g. I do not wa=
nt
> > > > that call to become an alternative to correct use of clk_enable.
> > > > =

> > > > Maybe I'll need a Coccinelle script or just some regular sed to
> > > > occasionally search for new users of this api and audit them?
> > > > =

> > > > I was hoping to not add any new consumer api at all :-/
> > > =

> > > I don't think there's any abuse that can be done with the current API,
> > > nor do I think you need to have new functions either.
> > > =

> > > If the clock is critical, when the customer calls
> > > clk_unprepare_disable on it, simply take back the reference you gave
> > > in the framework, and you're done. Or am I missing something?
> > =

> > Maybe I am the one missing something? My goal was to allow the consumer
> > driver to gate the critical clock. So we need clk_disable_unused to
> > actually disable the clock for that to work.
> =

> Yeah, but I guess the consumer driver clock gating is not the default
> mode of operations.
> =

> Under normal circumstances, it should just always leave the clock
> enabled, all the time.
> =

> > I think you are suggesting that clk_disable_unused should *not* disable
> > the clock if it is critical. Can you confirm that?
> =

> By default, yes.
> =

> Now, we also have the knowledgeable driver case wanting to force the
> clock gating. I think it's an orthogonal issue, we might have the same
> use case for non-critical clocks, and since it's hard to get that done
> with the current API, and that we don't really know what a
> knowledgeable driver will look like at this point, maybe we can just
> delay this entirely until we actually have one in front of us?

Yes. I discussed this face to face with Lee last week at Linaro Connect.
I proposed the following:

1) support an always-on clk, which is enabled by the framework at
registration-time and can never be claimed and gated

2) support a hand-off clk, which is enabled by the framework at
registration-time and whose reference counts are handed off to the first
driver to get, prepare and enable this clk

3) forget about knowledgeable drivers because nobody needs this (yet)

Lee was happy with this. Does it sound OK to you?

Regards,
Mike

> =

> Maxime
> =

> -- =

> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

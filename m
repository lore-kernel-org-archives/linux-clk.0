Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <566233e4cd23_40ed3ff1bbbdd3044@quark.notmuch>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org,
 lee.jones@linaro.org, maxime.ripard@free-electrons.com,
 s.hauer@pengutronix.de, geert@linux-m68k.org
References: <1438974570-20812-1-git-send-email-mturquette@baylibre.com>
 <2729647.3T7P7ViWpB@diego> <566233e4cd23_40ed3ff1bbbdd3044@quark.notmuch>
Message-ID: <20160211213356.26445.26458@quark.deferred.io>
Subject: Re: [PATCH RFC RFT 0/3] clk: detect per-user enable imbalances and implement
 hand-off
Date: Thu, 11 Feb 2016 13:33:56 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Michael Turquette (2015-12-04 16:46:28)
> Heiko St=C3=BCbner wrote:
> > Hi Mike,
> > =

> > Am Freitag, 7. August 2015, 12:09:27 schrieb Michael Turquette:
> > > This is an alternative solution to Lee's "clk: Provide support for
> > > always-on clocks" series[0].
> > > =

> > > The first two patches introduce run-time checks to ensure that clock
> > > consumer drivers are respecting the clk.h api. The former patch checks
> > > for prepare and enable imbalances. The latter checks for calls to
> > > clk_put without first disabling and unpreparing the clk.
> > > =

> > > The third patch introduces a new flag, CLK_ENABLE_HAND_OFF, which
> > > prepares and enables a clk at registration-time. The reference counts
> > > (prepare & enable) are transferred to the first clock consumer driver
> > > that clk_get's the clk with this flag set AND calls clk_prepare or
> > > clk_enable.
> > > =

> > > The net result is that a clock with this flag set will be enabled at
> > > boot and neither the clk_disable_unused garbage collector or the
> > > "sibling clock disables a shared parent" scenario will cause the flag=
ged
> > > clock to be disabled. The first driver to come along and explicitly
> > > claim, prepare and enable this clock will inherit those reference
> > > counts. No change to clock consumer drivers is required for this to
> > > work. Please continue to use the clk.h api properly.
> > =

> > just out of curiosity, did this move anywhere yet? (Last message from o=
ctober =

> > 1st it seems)
> > =

> > It looks like it is needed to fix the orphan-deferral I need on Rockchi=
p that =

> > breaks sunxi in its current state.
> =

> Yes, I'm preparing another version. Sorry for high latency, but I've been
> traveling for more than 2 months non-stop.

Done. See:

http://lkml.kernel.org/r/<1455225554-13267-1-git-send-email-mturquette@bayl=
ibre.com>

Regards,
Mike

> =

> Regards,
> Mike
> =

> > =

> > =

> > Thanks
> > Heiko
> =

>=20

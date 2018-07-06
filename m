Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180626110918.35c13653@xps13>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Antoine Tenart <antoine.tenart@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20180421142344.25944-1-miquel.raynal@bootlin.com>
 <20180421142344.25944-2-miquel.raynal@bootlin.com>
 <87in868202.fsf@bootlin.com> <20180626110918.35c13653@xps13>
Message-ID: <153089271821.143105.13475046419256564594@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/2] clk: mvebu: armada-37xx-periph: add suspend/resume support
Date: Fri, 06 Jul 2018 08:58:38 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Miquel Raynal (2018-06-26 02:09:18)
> Hi Gregory,
> =

> On Wed, 02 May 2018 18:18:37 +0200, Gregory CLEMENT
> <gregory.clement@bootlin.com> wrote:
> >  On sam., avril 21 2018, Miquel Raynal <miquel.raynal@bootlin.com> wrot=
e:
> > >  =

> > > +#if defined(CONFIG_PM)  =

> > =

> > I think you could get rid of this conditional code. Have a look on what
> > is done in others drivers around DEV_PM_OPS and __maybe_unused.
> =

> Thanks for pointing it.
> =

> Actually most implementations do not use __maybe_unused but do
> something like:
> =

> #if defined(CONFIG_PM)
> =

> static int xxx_pm_suspend() { ... }
> =

> static void xxx_pm_resume() { ... }
> =

> static struct pm_ops ops;
> #define XXX_DEV_PM_OPS &ops
> #else
> #define XXX_DEV_PM_OPS NULL
> #endif /* CONFIG_PM */ =

> =

> And then in the platform_driver structure:
> =

>         .pm =3D XXX_DEV_PM_OPS,
> =

> This way, the only #if/#endif is "out" of the current code and the
> ".pm =3D" line is free of preprocessor macros.
> =


Yes, less preprocessor conditionals throughout the code is better for
code readability and maintainability. Please remove the conditionals and
use __maybe_unused instead. Sadly, we'll waste 48 bytes on the
save/restore registers, but that's OK.

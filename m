Return-Path: <miquel.raynal@bootlin.com>
Date: Fri, 6 Jul 2018 18:03:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Michael Turquette
 <mturquette@baylibre.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: mvebu: armada-37xx-periph: add suspend/resume
 support
Message-ID: <20180706180341.02c5c203@xps13>
In-Reply-To: <153089271821.143105.13475046419256564594@swboyd.mtv.corp.google.com>
References: <20180421142344.25944-1-miquel.raynal@bootlin.com>
	<20180421142344.25944-2-miquel.raynal@bootlin.com>
	<87in868202.fsf@bootlin.com>
	<20180626110918.35c13653@xps13>
	<153089271821.143105.13475046419256564594@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

Stephen Boyd <sboyd@kernel.org> wrote on Fri, 06 Jul 2018 08:58:38
-0700:

> Quoting Miquel Raynal (2018-06-26 02:09:18)
> > Hi Gregory,
> >=20
> > On Wed, 02 May 2018 18:18:37 +0200, Gregory CLEMENT
> > <gregory.clement@bootlin.com> wrote: =20
> > >  On sam., avril 21 2018, Miquel Raynal <miquel.raynal@bootlin.com> wr=
ote: =20
> > > > =20
> > > > +#if defined(CONFIG_PM)   =20
> > >=20
> > > I think you could get rid of this conditional code. Have a look on wh=
at
> > > is done in others drivers around DEV_PM_OPS and __maybe_unused. =20
> >=20
> > Thanks for pointing it.
> >=20
> > Actually most implementations do not use __maybe_unused but do
> > something like:
> >=20
> > #if defined(CONFIG_PM)
> >=20
> > static int xxx_pm_suspend() { ... }
> >=20
> > static void xxx_pm_resume() { ... }
> >=20
> > static struct pm_ops ops;
> > #define XXX_DEV_PM_OPS &ops
> > #else
> > #define XXX_DEV_PM_OPS NULL
> > #endif /* CONFIG_PM */=20
> >=20
> > And then in the platform_driver structure:
> >=20
> >         .pm =3D XXX_DEV_PM_OPS,
> >=20
> > This way, the only #if/#endif is "out" of the current code and the
> > ".pm =3D" line is free of preprocessor macros.
> >  =20
>=20
> Yes, less preprocessor conditionals throughout the code is better for
> code readability and maintainability. Please remove the conditionals and
> use __maybe_unused instead. Sadly, we'll waste 48 bytes on the
> save/restore registers, but that's OK.
>=20

Mmmh. Looking at current code I thought the above was the preferred
way. Ok then, I'll repost with the conditionals removed and
__maybe_unused on the suspend/resume functions as initially suggested
by Gregory.

Thanks,
Miqu=C3=A8l

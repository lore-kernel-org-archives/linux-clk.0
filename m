Return-Path: <stefan.wahren@i2se.com>
Date: Mon, 29 May 2017 23:06:42 +0200 (CEST)
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-clk@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>
Message-ID: <1092654219.601654.1496092002868@email.1und1.de>
In-Reply-To: <20170526120638.2dfvy4nbzjzbampc@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5CULvGubRcBTLiNn--6FLfTYs+5seRC2phUccB-1PXDxw@mail.gmail.com>
 <20170526120638.2dfvy4nbzjzbampc@pengutronix.de>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Uwe,

> Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> hat am 26. Mai 201=
7 um 14:06 geschrieben:
>=20
>=20
> Hello,
>=20
> On Wed, May 03, 2017 at 04:53:09PM -0300, Fabio Estevam wrote:
> > On Wed, May 3, 2017 at 3:56 PM, Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > Since commits 7d81397cd93d ("clk: mxs: add clock support for imx28") =
and
> > > 64e2bc413047 ("clk: mxs: imx28: decrease the frequency of ref_io1 for
> > > SSP2 and SSP3") the frequencies for ref_io0 and ref_io1 are initializ=
ed
> > > to 288 MHz because the initial frequency "seems too high to be ssp cl=
ock
> > > source directly". However this isn't enough to ensure that the freque=
ncy
> > > isn't increased later again. In fact this happens on my machine as th=
e
> > > mxs-spi driver calls clk_set_rate(ssp->clk, 160000000) with ssp being
> > > ssp2 which is resolved to
> > >
> > >         ref_io1.rate =3D 320 MHz
> > >         ssp2_sel.parent =3D ref_io1
> > >         ssp2_div.divider =3D 2
> > >
> > > . The observed effect is that reading MISO reliably fails: Instead of
> > > the least significant bit the second least significant bit is reporte=
d
> > > twice. This is probably related to the reports
> > >
> > >         https://community.nxp.com/thread/290209
> > >         https://community.nxp.com/thread/310434
> >=20
> > Adding Stefan on Cc in he could help testing this patch, as he was the
> > one that created this thread.
>=20
> Even though my patch doesn't help Stefan, I think it should be applied
> nevertheless as it makes my machine work, just completes the
> workaround/fix that is already in mainline and nobody who still has the
> issue has the time to debug this further.

i like to see at least a comment within the code that the change is a worka=
round.

Thanks
Stefan

>=20
> Best regards
> Uwe
>=20
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|

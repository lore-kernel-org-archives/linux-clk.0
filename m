Return-Path: <stefan.wahren@i2se.com>
Date: Wed, 8 Aug 2018 10:23:37 +0200 (CEST)
From: Stefan Wahren <stefan.wahren@i2se.com>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Krummsdorf Michael <Michael.Krummsdorf@tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>
Message-ID: <758892002.155298.1533716617448@email.1und1.de>
In-Reply-To: <20180801093113.wnjeg5a3rjbh7yc4@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <20180726143232.ds22exgxiv6zlsn5@pengutronix.de>
 <10f5e651-caf4-3fe0-87c0-fe42ccdc6349@i2se.com>
 <CAOMZO5Cgf6aeNKWn5CnV8X-+bo20M00efoAxv51GPDE45Pg4yg@mail.gmail.com>
 <20180801093113.wnjeg5a3rjbh7yc4@pengutronix.de>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

> > On Thu, Jul 26, 2018 at 11:50 AM, Stefan Wahren <stefan.wahren@i2se.com=
> wrote:
> >=20
> > > I only want to note that we are using this ugly hack for Duckbill to =
avoid
> > > this issue:
> > >
> > > https://github.com/I2SE/linux/commit/e457d5e0309c07e30e8dd8b17c32f7b3=
cbdd9547
> >=20
> > Do you see the problem on TQMa28L with Stefan's hack applied?
>=20
> With this change by Stefan the bug is not reproducible. Your change to
> set the bypass bits only later doesn't help though.

i can confirm that Fabio's patch doesn't fix the clock issue on Duckbill. B=
ut the idea seems to be right. If i remove all write access to CLKSEQ and F=
RAC0 in clk_misc_init() instead of swap them, i don't need the ref_xtal hac=
k anymore. I think Fabio's patch doesn't work because the bootloader (U-Boo=
t in my case) is already feeding SSP from ref_io.

Regards
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

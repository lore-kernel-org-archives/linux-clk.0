Return-Path: <abel.vesa@nxp.com>
From: Abel Vesa <abel.vesa@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
CC: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Chen
	<peter.chen@freescale.com>, Irina Tirdea <irina.tirdea@nxp.com>, Anson Huang
	<anson.huang@nxp.com>, linux-kernel <linux-kernel@vger.kernel.org>, Ranjani
 Vaidyanathan <ranjani.vaidyanathan@nxp.com>, dl-linux-imx
	<linux-imx@nxp.com>, "b29396@freescale.com" <b29396@freescale.com>, linux-clk
	<linux-clk@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: imx7d: Move clks_init_on before any clock operations
Date: Wed, 28 Mar 2018 06:32:18 +0000
Message-ID: <20180328063217.nztxaphgo3uojop5@fsr-ub1664-175>
References: <1522160607-7104-1-git-send-email-abel.vesa@nxp.com>
 <CAOMZO5C23Va4Frrpqgw8LxEJbfj+cE6xeS3362QzyRn=_wi7JQ@mail.gmail.com>
In-Reply-To: <CAOMZO5C23Va4Frrpqgw8LxEJbfj+cE6xeS3362QzyRn=_wi7JQ@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Fabio,

On Tue, Mar 27, 2018 at 12:08:39PM -0300, Fabio Estevam wrote:
> Hi Abel,
>=20
> On Tue, Mar 27, 2018 at 11:23 AM, Abel Vesa <abel.vesa@nxp.com> wrote:
> > From: Dong Aisheng <b29396@freescale.com>
> >
> > For init on clocks we should move it at the first place in imx7d_clocks=
_init()
> > before any clock operations, else the clock operation may fail in case =
the clock
> > is still not on.
> >
> > Acked-by: Ranjani Vaidyanathan <Ranjani.Vaidyanathan@freescale.com>
> > Signed-off-by: Dong Aisheng <b29396@freescale.com>
> > Signed-off-by: Irina Tirdea <irina.tirdea@nxp.com>
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
>=20
> Thanks for your patches.
>=20
> You sent 4 patches today touching the same file.
>=20
> Please annotate the sequence of the patches (1/4, 2/4, etc) so that
> the maintainer can clearly know the order the patches should be
> applied.

Yep, my bad. I'll resend as a patchset now.
-- =

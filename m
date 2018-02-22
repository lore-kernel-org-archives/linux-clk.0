Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-db5eur01on0050.outbound.protection.outlook.com ([104.47.2.50]:9131
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753190AbeBVJwO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 22 Feb 2018 04:52:14 -0500
From: Jacky Bai <ping.bai@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
CC: "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "jacky.baip@gmail.com" <jacky.baip@gmail.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 1/4] driver: clk: imx: Add CLK_IS_CRITICAL flag for
 busy diviver and busy mux
Date: Thu, 22 Feb 2018 09:52:06 +0000
Message-ID: <HE1PR04MB31137D8726109678F9B98A9F87CD0@HE1PR04MB3113.eurprd04.prod.outlook.com>
References: <1517968819-12869-1-git-send-email-ping.bai@nxp.com>
 <20180222094228.GK3217@dragon>
In-Reply-To: <20180222094228.GK3217@dragon>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


> Subject: Re: [PATCH v3 1/4] driver: clk: imx: Add CLK_IS_CRITICAL flag fo=
r busy
> diviver and busy mux
>=20
> On Wed, Feb 07, 2018 at 10:00:16AM +0800, Bai Ping wrote:
> > The busy divider and busy mux is actually used by the system critical
> > clocks, so add 'CLK_IS_CRITICAL' to clocks registered with these two ty=
pe.
>=20
> Are there any real world issues you have seen with this CLK_IS_CRITICAL m=
issing
> from these busy clocks?
>=20

Previously in our clk driver, the always clocks is enabled by put them in c=
lk_init_on array. So community suggest me to
Add 'CLK_IS_CRITICAL' flags to these clocks and remove the clk_init_on arra=
y. As the busy clock don't have CLK_IS_CRITICAL flag and
It seems all the busy clock are system critical, need to be enabled always,=
 so we need to add this flag to the bus clocks if the clk_init_on array is
removed, otherwise, the bus clock will be disable in 'disable unused clk' s=
tage if we don't enable it explicitly.

BR
Jacky Bai
> >
> > Signed-off-by: Bai Ping <ping.bai@nxp.com>
>=20
> s/diviver/divider in the patch subject.
>=20
> Shawn
>=20
> > ---
> >  drivers/clk/imx/clk-busy.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/imx/clk-busy.c b/drivers/clk/imx/clk-busy.c
> > index 6df3389..9903652 100644
> > --- a/drivers/clk/imx/clk-busy.c
> > +++ b/drivers/clk/imx/clk-busy.c
> > @@ -101,7 +101,7 @@ struct clk *imx_clk_busy_divider(const char *name,
> > const char *parent_name,
> >
> >  	init.name =3D name;
> >  	init.ops =3D &clk_busy_divider_ops;
> > -	init.flags =3D CLK_SET_RATE_PARENT;
> > +	init.flags =3D CLK_SET_RATE_PARENT | CLK_IS_CRITICAL;
> >  	init.parent_names =3D &parent_name;
> >  	init.num_parents =3D 1;
> >
> > @@ -175,7 +175,7 @@ struct clk *imx_clk_busy_mux(const char *name,
> > void __iomem *reg, u8 shift,
> >
> >  	init.name =3D name;
> >  	init.ops =3D &clk_busy_mux_ops;
> > -	init.flags =3D 0;
> > +	init.flags =3D CLK_IS_CRITICAL;
> >  	init.parent_names =3D parent_names;
> >  	init.num_parents =3D num_parents;
> >
> > --
> > 1.9.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flis=
t
> >
> s.infradead.org%2Fmailman%2Flistinfo%2Flinux-arm-kernel&data=3D02%7C01%7
> >
> Cping.bai%40nxp.com%7C6183140614624dfd492f08d579d89d58%7C686ea1d3
> bc2b4
> >
> c6fa92cd99c5c301635%7C0%7C0%7C636548893622897723&sdata=3DamVo6uZ6
> ra1o9XA
> > xHSRi9cOd%2BuRUV%2BIkrXSbBncE0lA%3D&reserved=3D0

Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-eopbgr30062.outbound.protection.outlook.com ([40.107.3.62]:34176
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751824AbeCPG0p (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Mar 2018 02:26:45 -0400
From: "A.s. Dong" <aisheng.dong@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
CC: Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "jacky.baip@gmail.com" <jacky.baip@gmail.com>
Subject: RE: [PATCH v5 1/4] clk: imx: Add CLK_IS_CRITICAL flag for busy
 divider and busy mux
Date: Fri, 16 Mar 2018 06:26:41 +0000
Message-ID: <AM3PR04MB3060671D694BAE450C5FC4A80D70@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1520846957-22348-1-git-send-email-ping.bai@nxp.com>
In-Reply-To: <1520846957-22348-1-git-send-email-ping.bai@nxp.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

> -----Original Message-----
> From: Jacky Bai
> Sent: Monday, March 12, 2018 5:29 PM
> To: sboyd@kernel.org; robh+dt@kernel.org; shawnguo@kernel.org;
> kernel@pengutronix.de
> Cc: Fabio Estevam <fabio.estevam@nxp.com>; linux-clk@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>;
> A.s. Dong <aisheng.dong@nxp.com>; jacky.baip@gmail.com
> Subject: [PATCH v5 1/4] clk: imx: Add CLK_IS_CRITICAL flag for busy divid=
er
> and busy mux
>=20
> The busy divider and busy mux is actually used by the system critical clo=
cks,
> so add 'CLK_IS_CRITICAL' to clocks registered with these two type.
>=20

We probably could fine tune clk_init_on for other platforms later.
So:
Acked-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng

> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---
>  change from V3->v4:
>  - fix a typo in commit log
>  change from v4->v5:
>  - optimize the commit subject
> ---
>  drivers/clk/imx/clk-busy.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/imx/clk-busy.c b/drivers/clk/imx/clk-busy.c inde=
x
> 6df3389..9903652 100644
> --- a/drivers/clk/imx/clk-busy.c
> +++ b/drivers/clk/imx/clk-busy.c
> @@ -101,7 +101,7 @@ struct clk *imx_clk_busy_divider(const char *name,
> const char *parent_name,
>=20
>  	init.name =3D name;
>  	init.ops =3D &clk_busy_divider_ops;
> -	init.flags =3D CLK_SET_RATE_PARENT;
> +	init.flags =3D CLK_SET_RATE_PARENT | CLK_IS_CRITICAL;
>  	init.parent_names =3D &parent_name;
>  	init.num_parents =3D 1;
>=20
> @@ -175,7 +175,7 @@ struct clk *imx_clk_busy_mux(const char *name, void
> __iomem *reg, u8 shift,
>=20
>  	init.name =3D name;
>  	init.ops =3D &clk_busy_mux_ops;
> -	init.flags =3D 0;
> +	init.flags =3D CLK_IS_CRITICAL;
>  	init.parent_names =3D parent_names;
>  	init.num_parents =3D num_parents;
>=20
> --
> 1.9.1


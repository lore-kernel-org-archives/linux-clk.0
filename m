Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7F12F2A
	for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 00:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753922365; cv=fail; b=XuyirtRG0GlpWK7b7sHq7X0r1NoI2Yd0gkyGahuo5iX/elmBeMZZMTZULKtZxxJnYJDr35rppgJGiX8KL9h/uz0yUy085hAkzfSuRGhRrGt1dD5ybDa+hBmM0xJoG+Uks4JXMxx5nJ3922nz/pKGpQHGB9ZtchCYosLfajKqtms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753922365; c=relaxed/simple;
	bh=vE15pY3gdPFgVzh5m0F27MvrKTX6g+92zZEO/VZhKuY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kh3BN1DMtyKNYXzxVccpZxgJJRCCeU0GUwRqe2MGBdibJPgEKXsNHfnIHMvf9ahV6ViHp15kdovyPiXCiMdVZOFQd174/izn9D9alNmK4Sxb8Xdy2sK/LDQI63NgW0jsf9ypXbgrfhvWNkvu2MrHvCBbXHH4Tf5rV7oy3bhwnaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dlTkBiUh; arc=fail smtp.client-ip=52.101.72.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dlTkBiUh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQqc6/kYwW+sWLFlC4hz0nGgfF0swwyM3M7YNivBtol7eNP6n+s7bp36R3Wzq6fycs9x1hQ+XlpF/udHtYYsvj7OXLrcT4wk28H83CGMY1AAH9VqCGPsv51DlBp2WHdHMUZQf1NWLb8vLG7xzeuJyz36uLkVeFrsy4ENTX4SeYqlVZ5yDVtof0b/u/pkBGY/Fp1V5y+eakCpoSf60kyo96UzfOxugp+64P78S/JY+kAA6APAbB7GckL+ODqos8sSJZQgKp43xDdHMDcKyDRe2+TDJj/rgMZcZGPtbgJJY4S5WJnTdZEjpWoGYzoLZir2VKVAqTezcqCfgJ6g9W632A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7FPM/jeTUSHvnW9g7y8FpYFgTnZ3z6E1PwhxW4b1aI=;
 b=W/zKJbSCrofRjs291qcoqoXFoTkHIJzuy7hsZ97LjD4erZpO/a02D72bFSwOOpo7Vmjtj/TzDAgmDKLTHJnS0o1DpJFnASydkt/zcy4YaQq0WYzVLld6/3j8Cb/KQkhMTU7lHGP3b7Fis654EhUmkvyIYKEPG7VQP89Q6qjprbP42c7A/YAY7yl8qb6IJNv2CgFc0KtxaceW2kURo97LNCSkAuMtSwMHrIgL23IP4COo0XPn3obHuxBiH0ZtyxBg2d5SCK4Ggk/ID0xhS7sJcc4l43JGlkYE2mvpsmw3fmI4SOoYObn2zj2mWoyJwFgeWeBryUgcvND/Lsn4OAn6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7FPM/jeTUSHvnW9g7y8FpYFgTnZ3z6E1PwhxW4b1aI=;
 b=dlTkBiUhibgnntcLbS60xEEfNftlTAiQeNHujcLhYY5zbUCkrWtDbOAZnbA/Xmz4j122aOq5IsGfXmkclQlyxWSUF6nIcZW+fMD4WFFZhcaG+k/Y2dtAVjziS1N+eMSF/jYlPSvcM6JqRu8qrcBHsyBDgQVFRiWLi9ZFi6cjNgzf2yktDxqn+P2KblnxHUcGM0sfjbkEio0l/3GPrJb4BunmsaawyaPXhT35lXBC0840I+yDgUNA50Ut7HFaLP+X7DdK0LndEVITPDo+AjoCMHXYbUjKDGPTcDT/1YE1scPLFqp2VpDXLBr14RVrgoxzBiNT9ijPYcsKYf6h0HKmQQ==
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PA4PR04MB7535.eurprd04.prod.outlook.com (2603:10a6:102:e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Thu, 31 Jul
 2025 00:39:18 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%5]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 00:39:17 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "abelvesa@kernel.org" <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH] clk: imx: Add some delay before deassert the reset
Thread-Topic: [PATCH] clk: imx: Add some delay before deassert the reset
Thread-Index: AQHcADnUHQkTf3lg20mKQ4z3QHRN/7RLIxCAgAA6NJA=
Date: Thu, 31 Jul 2025 00:39:17 +0000
Message-ID:
 <AS8PR04MB8642778C7A89226E7CA31DBF8727A@AS8PR04MB8642.eurprd04.prod.outlook.com>
References: <20250729033817.1239646-1-ping.bai@nxp.com>
 <aIqChYG0c2d9yCEL@lizhi-Precision-Tower-5810>
In-Reply-To: <aIqChYG0c2d9yCEL@lizhi-Precision-Tower-5810>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8642:EE_|PA4PR04MB7535:EE_
x-ms-office365-filtering-correlation-id: 0de64fd9-0ee3-4fee-bc74-08ddcfcaaeae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?WIsU6qU4aRFLXGkf8m0tp4biTm9jQfa8czMaRUPCW1qMizBobZ1zZQ3iMBEh?=
 =?us-ascii?Q?6hyey4Zh1nxtOLsNZ5pcMOllRYLBietFbpES2CvpI9Hn2/p0+7Vb/lxNcY6f?=
 =?us-ascii?Q?HilYyI5Q75qJE/RqQenxQTKJyZil+Ex73s3Gh4sv5s7o7Azp13CXLxnAYsOp?=
 =?us-ascii?Q?uPmF/I52ZScjE7JRy28saDj1CYVGriXEpHlFmtbTudlAbolMZ22fyPU/Sw4I?=
 =?us-ascii?Q?R1awqehRJI6r4QoS/CfVw7FIlLZqHnuSD+O8QDb3WWbhC1idRhPeZOYQC4iA?=
 =?us-ascii?Q?4Id7SRyHLtK+Yka/4qzB+Qkj24ueGXD8SdnWIG0sQgUPpsJqLc8cE8Ocvz5m?=
 =?us-ascii?Q?IoLJTllgCG40HWH1NgHVCs5VeMXT+bjhkj/mz2BIsLP5UyIUESeBvJfgRWSd?=
 =?us-ascii?Q?4rYUnbTt0GWvvbHSoZOgZk9UdC+XaM9wfHChtOt2JltcYi8hW1e3insAbAW9?=
 =?us-ascii?Q?OfNz5uqxSttbFLDyvYKzO5NCMB2U9SB7UDS2DLcYslznsUs/gpTaIil1vgqm?=
 =?us-ascii?Q?sUd0Es5p2ZDdT4z/2/O+9CuopQuVCK4sc1YY1nJtiC3cs1ZL9giPKWP/pOeq?=
 =?us-ascii?Q?8J6todIUGNEIBjI6bVLwtcdougqKp7JQPUv5ZMxYzcSCETJy6l6D1Oo2y8hJ?=
 =?us-ascii?Q?y8UdJJtujTWtM63JCdJ/VhN+/P/GXy0a3U2jXvYq5aBMdgwtekHz0ijb3TcQ?=
 =?us-ascii?Q?JDu036UZCrEA3gIgA/DFKI87n4BSb/dX5BZBFAvbX8aqQVws0R8jZc9y5nNQ?=
 =?us-ascii?Q?0bWRcNxAD92l+FJEJAMERkJcpOMi/zToZOnQWsmPs/DVuEW8rA61179wd6Yb?=
 =?us-ascii?Q?w9M+OgfDyaxUCHkZ3dlrAc8chvt+1BCkuB5MH1zOTHZaObceLzTW1wUtHU8Y?=
 =?us-ascii?Q?VRstbUxgFk/HGYi/mkFe5qtEReX5fSUFF7E3j4vdBd7//3+Ewv++Zbz0G5tg?=
 =?us-ascii?Q?JXPvlzOIUsa/rydbbdHcNt8ELQlyYhINcE7VtHlQR+FltwUMjvFMUuKhxVLU?=
 =?us-ascii?Q?/D3PMib9iBTCGtmiLlUlyVxIFLxaBFnXxIa30+VSCpM+os8519hIKz0k7IsA?=
 =?us-ascii?Q?e7/xrwBkQHvC3e5Un/qCqwyqFlN//BuMtcS/W82gQ44nOijxtHTkDkiCBW85?=
 =?us-ascii?Q?1ka6D8ke/dHO5FqaiNKeLkwsGtlLQFVH5f61c/ChnO7n6uNNbbNQUh55KU4s?=
 =?us-ascii?Q?49kPxQhRNCGRk/hQTHgpC2KfZoJxopeIRzKrzw7GJ4DMZrs4QixxHgboZfYe?=
 =?us-ascii?Q?qjgXZ9PmPWQMjrBQZCLVQvlEFWwzkLVpZH10sNKH9ZrGS7qopmR0sVHSubbj?=
 =?us-ascii?Q?FCvW1rD3D+g6h0bn3LDIszb3cQYsdeiCn731hXVbQwG3fPHCni9uozqITJBJ?=
 =?us-ascii?Q?pRMfvsQ2RFxCuBg7mv4OZP6d6lh+rLumHNyyqwnedWmSyCj8Nd1ai8xnGakq?=
 =?us-ascii?Q?HHoZSsUljrSQuwUSoYMoMYo73Qf0JniNdgZytRqOks4eqyWcLq5Jhg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uy/8IZaEUwQPJ88No3ityirEGGUiSvIIkZIz29PXxRnj7rkqdx8cO9lrmfgW?=
 =?us-ascii?Q?U1rOBVUjVaAQ+fr5mrErw86aYRkqgmpZaNcFo6W1awCMWeeVKNezmP3QFwW2?=
 =?us-ascii?Q?lDr4grTbRTxJ+2ccVXyXofHV/8zdGQm5QEGo16zmSaV3maWdPlAad5kxfLFg?=
 =?us-ascii?Q?4lePLntzKgIIZeYBw6ympkl0n1IGMpQgh4BV0huARWY/FbEPL5pC0mP7lck7?=
 =?us-ascii?Q?XhDJGt24YYvPWUe18De0DnGAyycLwZLTahWpN90vyiU2AkgMeu7+7n7mHayC?=
 =?us-ascii?Q?tmGTY5vncEqvMBOzn6n0t44FXx7rxlTBhO7WM5hG+jBcnVxo5YpalCKNclti?=
 =?us-ascii?Q?K1pdK1qQ4n7rm3p0VoecdofX4zSfHi38+eurdo5LnEnKs4A9ClOTH8Zpc6E6?=
 =?us-ascii?Q?nehN5Lfs39YwG2gaREori2h0W523fHqrr6dD1sCnAkv5RnNArU72cy97b8K7?=
 =?us-ascii?Q?PpA0X/SmCdl5oXuxdD3QV04XfLzhQEfWJUO733wOLKpo+tB2AqB8BZ8bk601?=
 =?us-ascii?Q?WFAHqYA7xskz7q46rMGGWJW1RaD73c1ni3cNYLAZJJCA28LOHnIJB7V+ziNN?=
 =?us-ascii?Q?n0yTqfSBYn17UFH1U8ww0PPyRdyg8PKYc8IB+nxCuQpcviOfj9i4S4uUlxT0?=
 =?us-ascii?Q?Qs3ixGyLaKWhK8O1g9yE2JXAHV5HWKO0lQY0LLQs3qbCHkqFnkKOy8wkKTgx?=
 =?us-ascii?Q?3KJ3up52XOmiaKLfAWNSubzy6wnMXJr366IMTnjrR9QgqUGtHRMMqMYrEFO1?=
 =?us-ascii?Q?6l7ePaiZb/oi0FFdad7gyFrzQH/6XLubaRk4orVob9uiHuNW3dbvP1OgjIcG?=
 =?us-ascii?Q?duX2qzDK8/2G93VgVM+g2oq2q6n6RZpVcYpw6q9EK5sBgnrb8hsoU8uS1ERY?=
 =?us-ascii?Q?C5SFC3gK7VyjmLxFEVBhfz8pcpl/YK0GGKkMaWz2IhAT5k9F6P8U91yclqzC?=
 =?us-ascii?Q?EG3cOfkjabat/N3rAkQGGEHNHCv5bHypdpJH6CxElHBKNTpSOcksvruziFL+?=
 =?us-ascii?Q?77E0A7x9EnhcKOlkYI3wrriQy3pzup/D9OepmeJHzInfSn1oTNrupt8bSbBh?=
 =?us-ascii?Q?QT7e+3k/K2NELjKpsZWQrVxxiaZiyOU0Q/iTAD9dHCj8eYP3Vklq52dYRtc5?=
 =?us-ascii?Q?CEMN/7wdXRg9owizYpzSMGO7Oh+cju1DTYl69pvmaRAa8G5bRiPQQEdWMsRP?=
 =?us-ascii?Q?NTPFhsN42AYAb//LZOQKiWM0Bfrk/uaoWqrTAgeo6NHzpEZTJJ6FsFLMHE3r?=
 =?us-ascii?Q?mGDi8Dqag+nLeSpoRHLQQCcEHbSunl1AH2kXbCl1StCBv6VWnLnOCaVSnWpq?=
 =?us-ascii?Q?qV6eUYriSI2U1DPUHvDulTwKbGibvv2O04UHiAvRMBcA8lGzeW/s0cueKSum?=
 =?us-ascii?Q?N8BoCq11Ic+L468WS3RVjqC95XK5xibjbuJ8I+4ux2vs5eorSpOFwdI8w9xr?=
 =?us-ascii?Q?rEkTivQaHNvVC/157/3DOY5w51yOSZXEqTqRP5y8rl/Nw8nceccavDW5GePj?=
 =?us-ascii?Q?NH7AfzYk5vOxNVYN9mwoFKeNPlrltJvjspmIJgek2ouBEl8uiJWDqSQqmj0l?=
 =?us-ascii?Q?+OErseb0Smy5y/uhBWY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de64fd9-0ee3-4fee-bc74-08ddcfcaaeae
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 00:39:17.7422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cWmNhzASXcB3C5SP1uazrqfwEc5JKfNi4W+AGrp0f+5jAdmVuHdEntBcEkNmtUTZOEvUq1k/Kup+cVQVEG4xOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7535

> Subject: Re: [PATCH] clk: imx: Add some delay before deassert the reset
>=20
> On Tue, Jul 29, 2025 at 11:38:17AM +0800, Jacky Bai wrote:
> > Some of the PCCs on i.MX8ULP have a sw_rst bit to control the
> > peripheral reset through SW method. For peripherals like GPU that need
> > sync reset, some delay is necessary befere & after release the reset
> > to make sure the HW is reset into a known status. So add some delay
> > before & after release reset.
>=20
> Nit: wrap at 75 char.

Thx.

>=20
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/clk/imx/clk-composite-7ulp.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/clk/imx/clk-composite-7ulp.c
> > b/drivers/clk/imx/clk-composite-7ulp.c
> > index 8ed2e0ad2769..710fe4f84465 100644
> > --- a/drivers/clk/imx/clk-composite-7ulp.c
> > +++ b/drivers/clk/imx/clk-composite-7ulp.c
> > @@ -7,6 +7,7 @@
> >
> >  #include <linux/bits.h>
> >  #include <linux/clk-provider.h>
> > +#include <linux/delay.h>
> >  #include <linux/err.h>
> >  #include <linux/io.h>
> >  #include <linux/slab.h>
> > @@ -36,6 +37,9 @@ static int pcc_gate_enable(struct clk_hw *hw)
> >  	if (ret)
> >  		return ret;
> >
> > +	/* wait before release reset */
> > +	udelay(1);
> > +
>=20
> It is quite small value. udelay()'s implement is not necessary to access =
MMIO
> register space. (arm64 use cp15)
>=20

1us should be enough as the GPU IP reset propagation only need 128 cycle
of its own clock(> 200MHz). the first udelay is to add some margin to make
sure the GPU clock is stable.

> writel(val, gate->reg);
> udelay(1); // it may less than 1us as what you expect, because previous w=
rite
> have not reach target place yet.
>=20
> It needs a readl() before udelay(1) to make sure value actually reach to =
target
> place.
>=20

Sure, will add this.

BR
Jacky Bai

> Frank
>=20
> >  	spin_lock_irqsave(gate->lock, flags);
> >  	/*
> >  	 * release the sw reset for peripherals associated with @@ -47,6
> > +51,9 @@ static int pcc_gate_enable(struct clk_hw *hw)
> >
> >  	spin_unlock_irqrestore(gate->lock, flags);
> >
> > +	/* wait sync reset done */
> > +	udelay(1);
> > +
> >  	return 0;
> >  }
> >
> > --
> > 2.34.1
> >

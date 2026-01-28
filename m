Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011068.outbound.protection.outlook.com [40.107.130.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31427219E8D;
	Wed, 28 Jan 2026 03:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769571604; cv=fail; b=LdO40KAYairxyfoGacdoqMKgan6D4UuYlNqDMiNaG75JWk9PuK1wNhTV/x+JwyRnStQuW06mhzJegxF+DWT9RCXbhw3p8BmDJObHUuM6C38yxnaptqAlXYpENTnSNdOoyZ7nnSR0zfwfDTGlbakMfEACvtk6s5bD7sLILBp+rcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769571604; c=relaxed/simple;
	bh=1rCowJUTuHi59xE3OJlamJI48B3b0VHyLchHpqrrGPk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WiammRhaBmsC1y2wEGyGBgAMrGizIlCHEX8OcxHtQXLqLboqFMxGURobQnjUPwM5L4Ez3nWfC4sycy5ptUgptWm1PXydMf+XA2UfHUVgjQ3dPUvhGu5ZEWU1ar2hM397Hq1KlfVrq2t8ExwwxD0xDQz6oe4KA2TInnpS+gUdMEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hXkWFSDg; arc=fail smtp.client-ip=40.107.130.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hXkWFSDg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pl5yliTq02SeNQMLoDy7YVhAk+gKOeeb8EEdg5ICA+rL0qmhTjqsc6L6dTmPTtq4BX3sEJ5vEENhzBf5qGItZtfCBNWecGKH1Km7xtXJgH3duRRu8ICLvLHPfM3aucAWklAZEMftA/y9luifNDOGmEHDHrZ4OS0ZNPcN87XP1yefUSQUivNLhq6L0QyyrUyncpF9vnqdiFUSuEPJu5pgtjTDP3xtAk84aOwaGqpp3gdFHDI+5ADc9befLjTT9ng+5mOn+h8CwgHT//J3tTlFChbZUad/ewz6bAOwo/lbyW8TTgSP6FU/nCxiyt4ELgPA+oRg48PChrdDN0ntE2CSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COMJArAeh9sPTdf4tO4259u8tkKlHD8oD07NU0iLxhU=;
 b=iaDS56ZtdCNqpAP1dijStpKnxTV7EufQayP90T+wSTKGAP0rhHfjgAN03FlX4ghmCGA9uslIhdTiift/n7gf2nx+1kRRPtNNtuZqZ4mgddW3vkALOwPDYx9DG1/53nRQECYIGtaaSacO3oavhE6QpyNH4tqyE6xAqds6M2LqbSg2aAB511witrTUsdbxh4yBdeg1Ja9vhIHvdXDv7yqxpDJVILLGioCsGGzTACxOCdNifVQkMP0F0Eq5TVad78MeSjJzivQCMuyZlJ1gijQNPnR7b8YS9jEFSQGz3a8BR4eHC3cKkfhDRluPbg7nuj/fUWIda8rbx22ZgfrWRZgQ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COMJArAeh9sPTdf4tO4259u8tkKlHD8oD07NU0iLxhU=;
 b=hXkWFSDgzLI7H7/j+tSfISYFOzgW6yBNum1O828l+xHMfXQfxf6tbdRLnQMeys4BRqsKV8a4ca6Sn4M8JTQJeKTC+cR8FyqIrAqTudG6Ilw2zIP73sfeE6UV4cVvJbtY9prIWmEbfUqxHFKmIWNhfVWUgwHLVOBhklUGEC+LXVV9E8R0WDeiiOgFyAbskwBIoBSB9F0V6Bib3WxITjfSl41RC9AkT8eg73b9u5s7QXXVJfj4QyT+eAnyHNBQXuc47Awvuzl3qMl06JNzya6UY7oALxy9m2UzJ5ZebZ+y7U3+KOeIVWjdc9bhnx+8NmTPz/Ee+3IYIucljTDZndkvQQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10906.eurprd04.prod.outlook.com (2603:10a6:800:277::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 03:39:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 03:39:59 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Abel Vesa
	<abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
	Anson Huang <anson.huang@nxp.com>
CC: Jacky Bai <ping.bai@nxp.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel@puri.sm" <kernel@puri.sm>
Subject: RE: [PATCH] clk: imx8mq: Correct the CSI PHY sels
Thread-Topic: [PATCH] clk: imx8mq: Correct the CSI PHY sels
Thread-Index: AQHcj+dTfnf35Qi2S0q9eSjpmnexI7Vm7xug
Date: Wed, 28 Jan 2026 03:39:59 +0000
Message-ID:
 <PAXPR04MB84592A78A90581A65CFD0F808891A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260128-imx8mq-csi-clk-v1-1-ac028ed26e8c@puri.sm>
In-Reply-To: <20260128-imx8mq-csi-clk-v1-1-ac028ed26e8c@puri.sm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VI2PR04MB10906:EE_
x-ms-office365-filtering-correlation-id: 0b2985f8-6edd-49bc-0787-08de5e1ee9c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016|38070700021|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?WLp1my3g77TKOZKbiNfo6kqbIZdDy7Zl371WAZR/Fn8JFOQKx65kpsRO9CSP?=
 =?us-ascii?Q?XKejT9nhTw4aB8yf4cDmY4IcdRHEBDpP/UvAjF168wwsCOXcgYybDciGx2vD?=
 =?us-ascii?Q?Pt/3jQZH+5+sh80BVJXX3tjbUgB3PWPrCfFiDxzls2kNfgaLmda7ummX1z58?=
 =?us-ascii?Q?lxUVukwXwSg15hxylJh84GqSBxJMtDS54Dhb715YxX8ksIMUfpgT0o4Dc3G4?=
 =?us-ascii?Q?q5cCjL6I4lPXpSfIwPrvAmi3DQiLZVZmhlmGoDdU1IdKbrfX6A+2hmaUB5ga?=
 =?us-ascii?Q?V72a+w/xeyJLXoiy+HxEupZynIrB8ofjIR8uN6cTfTLKQs8mxOk2g8GNmVm6?=
 =?us-ascii?Q?10LQ/3q5+kvYuTTm/SYyeUkE1lZI/AcMSjm2ywPdKHuD9kQqnbQNcTuL4Poo?=
 =?us-ascii?Q?2iCh32HFbkrWTjCLgXvhaHMX8TR7LKG1uVKm3RlLUGbV0rGf0kFBxMHXPFer?=
 =?us-ascii?Q?GjAxjsQWTe4cjHwXXxUWaWjJEgtqXcKe2jZAqAWHtMENgezeP7oLoxYp5zW8?=
 =?us-ascii?Q?oh71Uu3413coJ14S+DC2gHe5vky4P4cdhkU0njkmoxAJY5hMbsdpY0ycKfX6?=
 =?us-ascii?Q?QiuV81rsboxvKYzqCV4wW3nlC8zAVNlBEAjLKsK9n9RbJRsKiu1YqVrWm7fu?=
 =?us-ascii?Q?3v+phv2DEfLbJZ2DjAfTxVpi3YrLPjIOCq0kti0hosUrI4t4v8HcjQmkBm6p?=
 =?us-ascii?Q?J8IU6g87WzWhaUwD6KGXzxCzEbV7aVCHUTfcQMI5/usbAbuEFhBSxtUYR2Fk?=
 =?us-ascii?Q?mMCY30HcUMWh5j3UdIaiQudmtMr7bwcn2SisZNkGBElv7lrcrBuyMVQGi0s4?=
 =?us-ascii?Q?3e/vPocff+Bb0NxENh/co1uisZYkw6kAMyGkr8orxIqjuCg+wCpbG9T6dDnP?=
 =?us-ascii?Q?iGc/V75knRbgXbQRJLkTBjHB7Z/hqI5iAwe7s6dCPDbtGEAEJ6NK1/u8Nyby?=
 =?us-ascii?Q?4XzYj+q/qmninmpMsq7OjhkCBsJ2ju292src2iWAZDQZtVyUGJbCs14NinWG?=
 =?us-ascii?Q?tdk0fyXQnjz2kzWvQkDL93Yk9PT6VcALUgVedLRDtChoUcAnHbd68yu1mlqh?=
 =?us-ascii?Q?9h+3cJBLxg1V5ypX8zKHLa83VKXzVd5vkBzQ4dTGFYAfKN8eJ0hFIyFPnVkK?=
 =?us-ascii?Q?N6IRYg/hUD2OJMGtyrcQPnmwyRqG42zn9UBp4PyIXBHyZIss6bjTGMdXpI+y?=
 =?us-ascii?Q?1XX7hr44AktgmkYf2/SKIEnxRlnbHphZM6AwIVTk7JM7HC44ZsHRVozAKOAL?=
 =?us-ascii?Q?lGfujVEIzlOVo7HGu/pb5t9O7xUFfbCw9spcoQoiKodRkdI7FSjc6GuAQgaU?=
 =?us-ascii?Q?hgFj6T1gA61o87qyUJMABmly7IpTJZbtSp2b8OW8NQH2p0y8HhNRZrN59Ayd?=
 =?us-ascii?Q?7Ljd1Y1ij4FC2B0jIeHqsbhhuJRCRr1c5xg2v/6gDJHs9QE+sRHkF4bc9Nzd?=
 =?us-ascii?Q?ksDopuBlLhZ/OBmu/Jf7PaZFLky3hs8BIFd7ZriaIuWUiC2izfZxZQkAbATm?=
 =?us-ascii?Q?LrxBWFU/ud7rY6AU66YuW9ll6pSBpYSS+6ZrCkEzW3LWjaTWybVmK8uIuO43?=
 =?us-ascii?Q?Tm8RNk1OBVbpIE41UYk9sUgQL1ddfT59dI7jcueww9PhCviPaPyydp8EdYpZ?=
 =?us-ascii?Q?ZRiXbbZLjf0rnn3nst7AyW31S5w8ASD7lttoCKFWNv6s?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ge6DjXASMBsyjcjRylrsgN+PIZugfjvPQXsQkiXKs+2jo5FL9uyhPvcjzOL8?=
 =?us-ascii?Q?GAuLmtCs7i8C0375Fkr6qZACe0RIcNkfGLkeJ0xj1c92+9zw+Hr7Pgla79wj?=
 =?us-ascii?Q?0uxekgmud+2GeK011ZaVrHq5ZnpBANtoxk9fp+Ue9l1f57/xCeQvDSlFzFec?=
 =?us-ascii?Q?jnCnE2RS4LI2frv/zf27dXY971d9uHt0SWlZrRRYCjgAC4ljLeOc5o+DS8Sp?=
 =?us-ascii?Q?20EFhdQyMdWGhleBs5sLMF3oZ7WQ6BQoO1U3boDvIjaNlA+v9dCaMnVFF4/C?=
 =?us-ascii?Q?8zKHkJLgfnECFNX+nybvZ3XMzKea7zBVR+PUsGCZyDFRunvyqO4vhCOBqjlV?=
 =?us-ascii?Q?/9XsCS7cbvI3HDjx4tDe31IX1Qp9IO5CIim+XW/pf8cgkYHjKfzpoGCgniAx?=
 =?us-ascii?Q?mKKqP6E0xMYcklkoUHUXMrPDPr/F+3ziSoeKqT1ylQcVWk433+YVH9HDJeOw?=
 =?us-ascii?Q?8NkLmXFs/HisrMe6mg6zEYw0b+a5l+S5+SXm5x9m4g09f+JQhh2OUVerssEA?=
 =?us-ascii?Q?IfIW0xpz38wKFjAR45yhcJ0fcIfDjmr/4N/pqnHu9jYV+c+5/W+mAQ+wGYmG?=
 =?us-ascii?Q?Mnc8yciIitaBSmO2mRVVCIV8Wpv35IfF8Ho6H+vLgObfcG07EP1Jg3Uzx6i4?=
 =?us-ascii?Q?5ce5wVbwGLCj7mbyZF5JVeD4v7phDgZiRIpIiuGXlb6m/6QUHxa3iU2ycV8y?=
 =?us-ascii?Q?g9tf0seMAQJYeBUBGU5TeVNGjYA8HoCD2ovIWld+cErFMV/L82dh1vkMHk66?=
 =?us-ascii?Q?t1/mQCqz6agcnZMzUGOgq++dLxKAGzCPqPx1627Ijpp+Y7ren7Rwku2z84An?=
 =?us-ascii?Q?kZ9cAZwODGv36eUI+yu1fo/u9BlUkciEGo0PTYDmMkmK96yfo9fWOjZ58R5n?=
 =?us-ascii?Q?yX6hEK2wftoZgmyhdFDC5yQ5ikFKSYFwdE/6MxZQQojmISDrxbEJG3Ppjq6L?=
 =?us-ascii?Q?24y0+t3FlT6lgWppcQq62WMB6D/oAd8GjN19QhgcfB9ob2BP0dyNi7C96U/M?=
 =?us-ascii?Q?+Hn3HUh+NeYhpBK6DpKNAoBP/1nN9jZA78+8jiUgZ0r6xdAc+A2LiV5vZuy4?=
 =?us-ascii?Q?GNT34j1Lx25WlgqiFewmNpGob+4fltgFJUnOCSDGPYnWkljOQqMSRnol4YKA?=
 =?us-ascii?Q?6L93w0Cr1X24jJPvP+LtHFY45WVxSB/+a6YBMYflDZNRAQYdsJchervPVJiI?=
 =?us-ascii?Q?DbBTjyZ7SVUsNnw1yiVz+e2GJ0DfZmOZ+KkOIjpjQ56/3bpEuR5jfRnPb4kN?=
 =?us-ascii?Q?zmp9Ue7U1zewX/vKUucKxxFYgT0nALm8qA6WBEw2idU77qrbnzplb7CgC4Dk?=
 =?us-ascii?Q?2ToXpU3CGw6ni37VvGTH/rLMEOB9CZPvI36Ys62+sMw3D7WjbkxPgeWtG2tZ?=
 =?us-ascii?Q?TlS5413319QzFjzJvaHMB1Uc+m/7ETxE/NANkWxaBg4yubfLYCI+XviFtEbV?=
 =?us-ascii?Q?YXSQ9Iqbr4LEtmC+gowT5ZVKhbN3xpC5rM0KHex84FOFGxnnltGdsH3I8Ojs?=
 =?us-ascii?Q?zcPezatvJX282j/C7caZKha0DY3zc5lFefp3iOW3PXJZB29mc0T4ioryYvMK?=
 =?us-ascii?Q?oxTCi5MWgv9Uw3wQo/iA2PXrOH3vz+ALcTfpThXlRLVmeitc3tcIjc6jZF9B?=
 =?us-ascii?Q?1gPzrwOoevYNSx/mFv0dGdbSO0izartAUZMItQMaV0gIlkX237JL03Oblso/?=
 =?us-ascii?Q?4dAK1ZyL7JF3DXf0sGtL3XRfMCfaFyrLsYbgHKEwrCfzyqLS?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2985f8-6edd-49bc-0787-08de5e1ee9c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 03:39:59.7337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dUy9ymP3767TwNpy0iyCWzH/Yd1Be7ZTgjxdv2HzuNE9ze8xcVyBo95zHsDJe+RQ85rX/lIJH9QGlkGjPyxMKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10906

Hi Sebastian,

Thanks for your patch!

> Subject: [PATCH] clk: imx8mq: Correct the CSI PHY sels
>=20
> According to i.MX 8M Quad Reference Manual (Section 5.1.2 Table 5-1)
> MIPI_CSI1_PHY_REF_CLK_ROOT and MIPI_CSI2_PHY_REF_CLK_ROOT
> have
> SYSTEM_PLL2_DIV3 available as their second source, which
> corresponds to sys2_pll_333m rather than sys2_pll_125m.

After check the RM, you are right. But our internal doc shows
it is sys2_pll_125m, so I need to check the RTL code, then
back you later regarding this patch.

Thanks,
Peng.

>=20
> Fixes: b80522040cd3 ("clk: imx: Add clock driver for i.MX8MQ CCM")
> Signed-off-by: Sebastian Krzyszkowiak
> <sebastian.krzyszkowiak@puri.sm>
> ---
>  drivers/clk/imx/clk-imx8mq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-
> imx8mq.c index f70ed231b92d..cedc8a02aa1f 100644
> --- a/drivers/clk/imx/clk-imx8mq.c
> +++ b/drivers/clk/imx/clk-imx8mq.c
> @@ -237,7 +237,7 @@ static const char * const imx8mq_dsi_esc_sels[]
> =3D {"osc_25m", "sys2_pll_100m", "
>  static const char * const imx8mq_csi1_core_sels[] =3D {"osc_25m",
> "sys1_pll_266m", "sys2_pll_250m", "sys1_pll_800m",
>                                               "sys2_pll_1000m", "sys3_pll=
_out",
> "audio_pll2_out", "video_pll1_out", };
>=20
> -static const char * const imx8mq_csi1_phy_sels[] =3D {"osc_25m",
> "sys2_pll_125m", "sys2_pll_100m", "sys1_pll_800m",
> +static const char * const imx8mq_csi1_phy_sels[] =3D {"osc_25m",
> +"sys2_pll_333m", "sys2_pll_100m", "sys1_pll_800m",
>                                              "sys2_pll_1000m", "clk_ext2"=
,
> "audio_pll2_out", "video_pll1_out", };
>=20
>  static const char * const imx8mq_csi1_esc_sels[] =3D {"osc_25m",
> "sys2_pll_100m", "sys1_pll_80m", "sys1_pll_800m", @@ -246,7
> +246,7 @@ static const char * const imx8mq_csi1_esc_sels[] =3D
> {"osc_25m", "sys2_pll_100m",  static const char * const
> imx8mq_csi2_core_sels[] =3D {"osc_25m", "sys1_pll_266m",
> "sys2_pll_250m", "sys1_pll_800m",
>                                               "sys2_pll_1000m", "sys3_pll=
_out",
> "audio_pll2_out", "video_pll1_out", };
>=20
> -static const char * const imx8mq_csi2_phy_sels[] =3D {"osc_25m",
> "sys2_pll_125m", "sys2_pll_100m", "sys1_pll_800m",
> +static const char * const imx8mq_csi2_phy_sels[] =3D {"osc_25m",
> +"sys2_pll_333m", "sys2_pll_100m", "sys1_pll_800m",
>                                              "sys2_pll_1000m", "clk_ext2"=
,
> "audio_pll2_out", "video_pll1_out", };
>=20
>  static const char * const imx8mq_csi2_esc_sels[] =3D {"osc_25m",
> "sys2_pll_100m", "sys1_pll_80m", "sys1_pll_800m",
>=20
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> change-id: 20260128-imx8mq-csi-clk-2da0c4741ed6
>=20
> Best regards,
> --
> Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>


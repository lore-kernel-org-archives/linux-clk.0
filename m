Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011008.outbound.protection.outlook.com [52.101.125.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCCB349CE7;
	Fri, 24 Jul 2026 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784906774; cv=fail; b=E5PKVZMsDGXyH3Uqk9KXi8N75xGRxRiIHbYS8libgWZO6pQaizg+8GJ+mbWNodgU0l2MoVGRYchvc1IdtAB020/Ux/Fpy/3y/PFKjFnmmTZi/n06VQlvzYMllTegmLuOjklC/uxW+CVKDKXnJ3KmJajDGoCFMIcCQE/Np8X0I14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784906774; c=relaxed/simple;
	bh=Bn290QntClTazrj6y6uAwUPtuVlGYIqEhG2sDmyad+E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tvc7f3LfsopAisc6/MIROnIW7vUN7iFtpYLT7a3d60XyKS+vkCcE2wdTaNU7h4BuorAo8Bo4cEg3rT9dpSvE1FCgGZ6VFbGiY6edX+h+ZY5Si4xi11r6lZ3fuq/mgniLR75JCTjGVLup/v3mRd2oTLPcUyXfKAKUSPAF/sB5ohQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QGqUadbn; arc=fail smtp.client-ip=52.101.125.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QGqUadbn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOYWtjp+jJlt4BvDe+kTrzUeYjvTiPL7KnQTeWKEiJB8GMTkeRyhDGxvbz2FnA7G+bY02MvmTSLFHt+OnnFIHqoG1E2AgB6rVB891yyX2nin3aeZRC2cGd2xBTAYkCByBJHk29GY7UWe7V23eYoAxpsbmqdoZnos8f99/RzlQLTcpILbZAP4+CkFBUIiiWSWS1ZhsDLX95tzC6dQYUxXdSbRf6PM/tcYWqAF8uELlYRfuFVME5PcaprqwaIfNAYy/DjAT4wjTeuX1sppCJV3oSqwWK1CLP8y9qYUoA1jpujJmnkCk/NwPu2vPP+MZEhxKTLEiz5Pm13Es5rHNXzrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acxgN6MmaigVkpF8PkUnG4vjA+SwsGFRzA2jDWSu1fs=;
 b=WD29lb/1JycoebsrcTYgbag3X1JUDdWeWt+plM2DRyQt+YwWkc2jZ9DeWgfshgktgVRU7UxYyou20kcPSZSNP1zp9Xcw+nmhqqaLFUjgqDCL2828kLiEsMJu7I4WIaGsymHQkUtiAAbEPbNh1lJT3ykoz1MrNC2MUhnnYWXiBZS6yBiQXzoVZoVGMGx3s2uHFT1SJj/mbqw2Tw81G4jpe6PDUJYMiawn/1qMT5QTnmjC1S1+PMQgOyHiWYJ0M57s9ZibbpU5v+JFjprXXb49EJJbS+5K+wGsD3+wF+gyZkfPHafx6FuurIl05YBhEt22xrFxfZRBp2h/VaY6JNDHIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acxgN6MmaigVkpF8PkUnG4vjA+SwsGFRzA2jDWSu1fs=;
 b=QGqUadbnbX2Jhhoit2DA7Abg0Rkjlr0GMqahl1JUZ6dBNRONzcEramkfH/8OHiz7m3DTbcClOe9zRvzRDFwXB6zYsktbfJa2CdPnC32D3tRov79wXBmk89wh/KrKNoZKIJALCF970bYhIVjwk1mcHE2gv2O51RrMyxDs18cUPmg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB18410.jpnprd01.prod.outlook.com (2603:1096:604:4c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 15:26:09 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 15:26:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Bartosz
 Golaszewski <brgl@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v4 0/9] Add RZ/G3L USB2.0 host support
Thread-Topic: [PATCH v4 0/9] Add RZ/G3L USB2.0 host support
Thread-Index: AQHdD31PanBotJGjU0WhwiGgIXx1z7Z5/a6QgALhSkA=
Date: Fri, 24 Jul 2026 15:26:08 +0000
Message-ID:
 <TY3PR01MB11346FA21EFADC8A3D53D81BE86CF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB1134672A4A05BBD95782F70C486C12@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134672A4A05BBD95782F70C486C12@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB18410:EE_
x-ms-office365-filtering-correlation-id: 314e7d11-20d1-4e2a-8930-08dee997e2ee
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|11063799006|56012099006|4143699003|10067099003|3023799007|22082099003|18002099003|921020|38070700021;
x-microsoft-antispam-message-info:
 htgUL8jAsPuCINQYtW1hHUGw/HNOXOUg2zjiJBjc7kxRl57zsjJKPkCKp+B0O6Mc+aZlrmjcum2IxGgROVzldn7O/qiVUh3K8TORs/613FbZv/AACaoQcyk3+FyRq8RI+fG6DgLtFJi17LjMrOJmIt/kg8JRJNDhbowuYJFo2kqxsIW4P8Bove368tDbdGtIR4xMNWWsP/qJI9DREBxBYfeHH7fSNHmjSWUCz4z0GpxoYjpMhkPX4btbRWJjEeLRe6tLNtGb1RKL+OWD5R4EMikuhd2L85FK/tFbBA4/mUPuhK9pyzzlxDR8XnJJ/kFGf2ahwx91JmYKQvykQJYVh3xKsoPpgrBVwUPtOIMO2+iNQaulm+nGkZXlFmHgO2EiChWHD5D7yfFuGqWZFeSwArhjAKXHanBLjpT+F0YkSKRkijAGK7wR7BnCMjE6bRLWrgZv1+5n6S2QH7hF/mGBLUnorfxc3t43xJWKotSAC57/sJ8MGSFtTlG9LcCKBiOeQs9uaEKnMqAl3X2VwA8PBicHG5TDb4GAcj6bUtGoQ06A7WxW6ZoXlGY6byrKiijtzp8ZhP2TCawFlSL0zGZlfPYN3CzEXTz3MFW00gEozzUotC9fn59xYv97emaXLaWM0ybzhFpWlJgZ9hwSzen7Vj1G8v1xm8VGEsLLkUUmu+Pn5Tszr3xY+0M8ywvomtWR
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(10067099003)(3023799007)(22082099003)(18002099003)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2UGrnqWsnbqg7BTndEOOYRtkDfJfyA+hOKaRHWGFUOD0t6N9VdEa3sTW6jjW?=
 =?us-ascii?Q?JUxQ2Cf4IVNufWItTwHJi/yXH+PMS/uq/hARFJctj3jsBzyoLTwqIiQd6quh?=
 =?us-ascii?Q?kuDJyhTeOEhj8dY02jBVcV7wrzlpKtCLlnNu63wVW1B/GHHqGmEVl4zAz435?=
 =?us-ascii?Q?HnnNZuSYkiFyJN4MroxtMc0y0MCYbUGSsim1oNdiQmkbrV8jSXSDhirtqFKA?=
 =?us-ascii?Q?imI6hKT/O+CdkJzFh5gAliY42hv+MH+LmBh97O01q4Yh8Y88f4Oyh9EnLYJs?=
 =?us-ascii?Q?bN0+okG3vFkWpQ8pLjISO4a9e+I2Vx/E6wJSR8LLtAtez59cT3URc4ZzDJdG?=
 =?us-ascii?Q?IiS4oxb6QGMREYeDqfyuJtTS86bCnfkxpQ2LfBzNH4l0z1ZhBFL/V+P/wtC2?=
 =?us-ascii?Q?pfo0oi/T7HTpboS9XK3mFAW2RDzr9+JflUEgPnsJMFl5vd/FTAQn4DkRnBw+?=
 =?us-ascii?Q?34B2u/raVrGgzpSa3Pp/uipwEDxxPrmEt0Lg7I+6oLvRTlcI9Zgt5UCrzX7Y?=
 =?us-ascii?Q?ROVOyiH3+z5xB+bcvnIIr846nCzkONuQKANZsvwCCDAc6oIAo4Mhln9IVYx6?=
 =?us-ascii?Q?BWiFNgmG+3y6sRabsLqn0bAQADI6D5H0i9h+aQcm4eEIXMUwKkPma45sk/kh?=
 =?us-ascii?Q?1oxhQBKvisqDBU4x+f2S9oQX4DfRjYXiSO7T8sYGHSnmDnicowHGgBATWGX7?=
 =?us-ascii?Q?+a+3DGBm/egBJq87nKAHUwXltHlkCLkIQCsW9Sk7F8k2vJDZ6Md3zQ3C4s0q?=
 =?us-ascii?Q?SDHQB6VmpyiqO6amZr7yyC6vp7VsndzFPDU/tNmg7fM58nyWig4kwggWJdE4?=
 =?us-ascii?Q?iUGeBvRpMSS5KAc1GloJ3pOGf0idD/Kn/oMyxaHDXs6FMrje1o6+4JIEMuTA?=
 =?us-ascii?Q?8nYT5D8ZzLdDpU2mSGWgccbiqHu4q6yt3QALM7ix5KDPworv3i+QibeHfaG2?=
 =?us-ascii?Q?pa8+kOFXq2rDUXymJTcgSiyZ/L41eHQVjfV85PB0wZubWnmzwtzoqt7nomZ9?=
 =?us-ascii?Q?xTX8v3m19GvvI2sM4bRHWfyywVJf3OmuIXFYTJn4/yim7LtVT63BCrdlY6eR?=
 =?us-ascii?Q?bruo/TrzrFE8wTGE7Yf6cZicVrUZV5LZD9a/SE8/DAn+vjva1ajdF1oIJLU8?=
 =?us-ascii?Q?/6Eue33eHezb4HFBRmYn8Vkwqvhs4aY4a902ZX6xEFJGqiUry9BzZjPi74x0?=
 =?us-ascii?Q?zmcLw6cunc5yZF6IbvyphR1yayQAizxw6kpMysmaMPywwB3WQonpnf+yL09l?=
 =?us-ascii?Q?z5oT9W8dtU8Gg2OixL59vaP+KBJJNTCg28uNEgY83z9sG9+WVpxivxEZi30c?=
 =?us-ascii?Q?7weqrIivxI4/i4F+QgRwbYANXqeBicBwy8RXfoRsit/W3NSrFQY6qFnh/nh2?=
 =?us-ascii?Q?p3G35/VTBMXMm0S9xHNeNo2voHgUoSrNOb4fvVLVA6QeqcB3gFFmvrvzuzRQ?=
 =?us-ascii?Q?z83EzF0r9C87Ns2xDZQcj4w2Q+7vQUJekOMO/2xo1iSayLkKQJH/kFcPBZvR?=
 =?us-ascii?Q?5ih3rR+iWXEal/lUGNHtI8aog5aCd3sSjyjlGmadi5bV7iOv5mavtbp7g1WH?=
 =?us-ascii?Q?frTXXdFAnI+aVUlmYlefCBaFuzyJte7S3n7XBcRvBBUeH84eQjPfhFz8eViQ?=
 =?us-ascii?Q?UJzG9wHmDOcNBHiuehaWaY8yfDLPLT7OWU7EsCY4V5+h+riwL4HqfCSaX7F2?=
 =?us-ascii?Q?WJn6wqIT/kFbtFAAF3MxkFqw91jSc7tl6ywkcmUv5l80S/+eJh1mauPHKgc4?=
 =?us-ascii?Q?M3BrYnvLyQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314e7d11-20d1-4e2a-8930-08dee997e2ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 15:26:08.9327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAvjVmJXHcQRIxBYmoP0uo4AvacQrgVfGFL0ql7aLEB+mBPZAlc5QJtmrJjop+Ezkb69ezx80VaBX974gKM7VXn/+6VT71JPDpuckGa2D5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB18410

Hi All,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 22 July 2026 20:15
> Subject: RE: [PATCH v4 0/9] Add RZ/G3L USB2.0 host support
>=20
> Hi All,
>=20
> > -----Original Message-----
> > From: Biju <biju.das.au@gmail.com>
> > Sent: 09 July 2026 09:31
> > Subject: [PATCH v4 0/9] Add RZ/G3L USB2.0 host support
> >
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Hi All,
> >
> > This patch series aims to add USB2.0 host support for the RZ/G3L SMARC
> > EVK. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port has
> > an OTG controller, unlike RZ/G3S, which has an OTG controller only on
> > port 1. This series migrates regulator driver to use id-table so there =
is hard dependency between reset
> driver and regulator driver.
> >
> > Merge strategy:
> >   An Ack/Rb tag from Regulator Maintainer for patch#4.
> >   Patch #1,#2,#3,#4 - Reset subsystem
> >   Patch #5,#6,#7 - PHY subsystem
> >   Patch #8,#9 - Renesas SoC
> >
> > v3->v4:
> >  * Updated cover letter with merge strategy
> >  * Reorder the phy binding patch for easy merging.
> >  * Updated the commit description for patch #2,#3, #4.
> >  * Moved the handling of regulator_driver_name to patch #3
> >    in preparation for id_table match.
> >  * Migrated to id_table match using driver_name and reduced the length
> >    < 24.
> >  * Dropped rzg3l specific platform driver.
> >  * Dropped the tag for regulator driver,
> >  * Added id_table handling by introducing a common probe().
> > v2->v3:
> >  * Replaced items->enum in reset controller bindings.
> >  * Collected the tag for reset binding patch.
> >  * Dropped clock patch as it is accepted.
> > v1->v2:
> >  * Dropped patch#6(Introduce helper for regulator registration)
> >  * Passing pointer to an array of regulators to make it scalable.
> >  * Dropped regulator1-vbus and added a regulators group node.
> >  * Updated commit description for patch#1,#4,#6,#7,#8,#9 and #10.
> >  * Added enum instead of const in the compatible section.
> >  * Updated schema check.
> >  * Collected tag for PHY binding patch.
> >    in the regulator driver.
> >  * Added regulators group node and its children in SoC dtsi.
> >
> > Biju Das (9):
> >   dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L suppor=
t
> >   reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
> >   reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
> >   regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
> >     support
> >   dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
> >   phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
> >   phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for
> >     disabled VBUS regulator
> >   arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
> >   arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support
> >
> >  .../bindings/phy/renesas,usb2-phy.yaml        |   2 +
> >  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  48 +++++++-
> >  arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 105 ++++++++++++++++++
> >  .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  49 ++++++++
> >  drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  20 ++--
> >  .../regulator/renesas-usb-vbus-regulator.c    |  74 +++++++++++-
> >  drivers/reset/reset-rzg2l-usbphy-ctrl.c       |  44 +++++---
> >  7 files changed, 316 insertions(+), 26 deletions(-)
> >
> > --
> > 2.43.0
>=20
> Gentle ping.

Based on the feedback on [1],

I have modelled pwrrdy signal as power sequence driver and used
with DSI driver and it works fine. So, it should work with USB PHY control
driver as well.

So, there will binding change to dropping renesas,sysc-pwrrdy for RZ/G3L.
and the driver will use Power sequence driver for configuring Power ready s=
ignal.

What should I do for RZ/G3S as it uses renesas,sysc-pwrrdy? Should I leave =
like
as it is to avoid ABI breakage? Or do you want me to add backward compatibi=
lity?

Please let me know.

[1] https://lore.kernel.org/all/TY3PR01MB11346892D9619A8D1A6C2DF4A86CF2@TY3=
PR01MB11346.jpnprd01.prod.outlook.com/


Cheers,
Biju

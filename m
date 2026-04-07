Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2118.outbound.protection.partner.outlook.cn [139.219.146.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5B52556E;
	Tue,  7 Apr 2026 01:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775524676; cv=fail; b=IKvKQCl/Aj8vAMLkC1/U7Movy27WFLehKf9+uZKzF7EWabsP7+wkZfBtE586G8xAFfeoRx5TR83DdQbQh155d3qOEdxMg0/D+xEV7a06WMfK8yTw3zRV/OBhH0tjKij5GX4kQkPXAtfL5MWTSMnayTw3/OO7pAzkhP+nc2CaUUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775524676; c=relaxed/simple;
	bh=ZuJWs6tqd/fqi0/WqIrbQtIK+Z3z7YY+TrY2l7ykLlo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ff4NntN2vtqmGCol3kC4xXD0K1LwoYn0vFNdF/sykFukGdJ70ZRRF5lt3bAMXOBtdynDq52QgpWOAv0fUEvt8kFVJ34BzpBv7HbiVSP+pliOQbT8YHRLwdizq2EIvU6EmhaGQApSd9FnScza4sawCluYbS+h8aB0RBucVojXMiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9tUEn+ETlG/WlBGag35lDGnBBiafNkIWYlkQ6dBnrEdQHLKF49RzZ8tOfsyBf/7sXh3kdg0Sljk5Tq9TuuvKj6h+w7bt0NF+Ch10TVC5uP73w2sDTJC3pNf8Fo7rYSafw9Omfq5tOCmpXaSdwiFsY9xUoUo0+dCfYaxh7CfyGSIwqLFq+mVcK7dYDOzoabl6GcUmTMj3GMtYV6tL9/7f5P44UF5ZWcu3GdhRLZb+dITBHTdH7QOHCyFgQYZRxc2wVtHItRJpYJbJ37zrhFmuclPFk2rZUSf7Z24dHzYG0g/BpuSX/EKv+I6x1DZxm4OUxTpocYAUg5B7LtYeWRV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdQtL+cxKtGl1LZZHREO0lyNZng6AzbWHkqsVqGDKIo=;
 b=FDQJIdTDh6RXu7qeaJfLCuA53JstkDvMMiRT80MP+M+qQ/y6rstNyY0s667y7z+Z0A8nZHXBhf6HmMiV8YyycXSn1PY3Psl35jGiTzU6vW5b9J2BdiDfU+2SnC7Qo3KG+93lLe30Egqj88rQYsFLPi6RKjDP63e/ACjHmYNoBPpbFKyEJtnG2Q+VqwT4jcJA4lo9H+CMCG3/3cdix6mHUS9ZAyLz39U84OHzqMaeKAhRj0c10NHdhZt3pigw2A5XIzuSEhFiZcDGK+gv5oU8b45I8tb+p55QgNwfPMCmwGQGfWUymyH/lmNnb/3Bs+jlBAJQqaYJ4FGWJTwW4aPE0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1235.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 01:17:40 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Tue, 7 Apr 2026 01:17:40 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>
CC: Michael Turquette <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Chen Wang
	<unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, Alexey
 Charkov <alchark@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 03/13] clk: starfive: Add system-0 domain PLL clock
 driver
Thread-Topic: [PATCH v1 03/13] clk: starfive: Add system-0 domain PLL clock
 driver
Thread-Index: AQHcwy23fNrQamto+UeDw1ffArcAF7XNgm0AgAVP3TA=
Date: Tue, 7 Apr 2026 01:17:40 +0000
Message-ID:
 <ZQ4PR01MB1202771864829219B0EDACFAF25A2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-4-changhuang.liang@starfivetech.com>
 <ac_mdhEl9VtpTuw8@redhat.com>
In-Reply-To: <ac_mdhEl9VtpTuw8@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1235:EE_
x-ms-office365-filtering-correlation-id: 1a6db610-fc2b-427c-3998-08de94437678
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 JP4+hl1GwZc1G5tBx65o1YZhcOI3wNxmRQrGQnZGeVPG38fTGk3Pw+dP5A18grGoQ4EFhYE4cNpnUdTEBBbCqltpzmNGDartDO5YfDzdR0D8ry2ORD9hQ6TqH70/udajfparZSuV+zVddlb5QoZLjOHQa5G1wq4kYi6fy1s2uhXJbOx4Ex+a1A8w6yl4jE1xertpbUlRSCxBT/Dw/bdLqiYTbUS4BXiidufsYEfcpQTB6jqY0PPWkWSizFnJSavDP+L2mhXWce2wCqjbOYRK/xkbSlTlrGXArKYACdzDkIvk536zMpJUu1fOJC+CNoxpaUG1b7/f/Dof/ILROu1WtgN/z8i1/07e93LAd0GGecWBIfbFbE4AxIf8BlTMPJtOoP1GnjxaKbq78MGShYA7PYYaZDEQbCMYYBiL/Z6d4bJ+EGjkKLNaxJoPFMycK2OiGIa7fmsZldn7UlEth3y8dxQqtPhXI0Iu3s7cJ+SmN97xJF/IVnpp0nMRCpSJLiNDUKzCd7NSCusX/weJVp9POO1MeAHxdeMbpehQ4WmHm3HdGkrOlVaEFxojtfzZrjIr+C9nO+TJ/IIjuQqwqznD5w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AZnNpokl2Q+PJADFQcJ+ddUXHZ5DchiZuP+jI3gBTtUcOFlJcmWQSVQRt11t?=
 =?us-ascii?Q?mDeVcj46GXGy6ldhNNiO1yVMMqKhbUX8dHnbQB+8KCnWzHPzEGtR7zaNacQe?=
 =?us-ascii?Q?seJ5nwc792x08/SYGg5f5v8U71VAJELoDw8Hz2Kb6EkaLjqf4IIXsFVwJNex?=
 =?us-ascii?Q?6EVJU4wrFE+M4ilY6MlQgl7VVSrdqA2KV4Bs4/m21EMcLvn5MZVW8J9P+df7?=
 =?us-ascii?Q?ET3iNh2UYvUjuTG+Eee70y6QMxSqznnzC0hKiu1eqTXCnIbPU9vZhqsQJa7v?=
 =?us-ascii?Q?4uJv4dxAf2/rTN/Pu5RIaAbtePkzQTHEYctfnm91X08ooyLcJZrRLkKeILAT?=
 =?us-ascii?Q?/c+sKNnawUjUjBA/We40RqHuVTcTprTyOkgF9ULRZWPgd65qA7hXxBUKIw+8?=
 =?us-ascii?Q?Id9QQtusETS7WtKUNqXl6kqdXvK8cIpP32HONS9NTKWiNVTVD6PXZp6YjPkp?=
 =?us-ascii?Q?IinyGWaSUrdJ2ZUEuer3QnK7oOPj2f6VWXCAggDy1hD9fQrY5uGhfHrIaRga?=
 =?us-ascii?Q?3Fsg0r0Q//M9b9kPoMvC7fL2mpefmldYlSHEyQyJDIIO94BmXP03uJf6Scc7?=
 =?us-ascii?Q?rBJxgw1QzLgeTSPekxFqMLI97KDCnhzxKHNm2EPoFHXdBiDURmGu3iJrqTWz?=
 =?us-ascii?Q?LLRSBPlSMGeAZ04LxLHS1gtc37TPof8NqQCty+7oAXDLpTDHshRWL7dxxuYW?=
 =?us-ascii?Q?DdFwkg2xXyIVXzsgEgGyuFzJ+K8sdM1KM9ZhcvatMkgSGKpUSAolxj2vfIbq?=
 =?us-ascii?Q?Xoj8rwkA0c91GqBYrRncwriehLPePedsHVojutRdUA/h0fHtHAxkJbxkfcgb?=
 =?us-ascii?Q?1HTBi+R7jyx3cPO0tK2f3b1Mn3jb7gHzGiMhRlC+IyvzDi7O/lgic3yN2Y2B?=
 =?us-ascii?Q?TK/6jUtx/zb01DXr28OjXo3YOaewxzgeNjycVPezj78wzS5DMvf3W+qfPlnD?=
 =?us-ascii?Q?CShcRDBnLAuHkfdC2RYRoPg9/S/FTE6Ez9gmDk9z5nJrmi+nzxtiTNwu0iZa?=
 =?us-ascii?Q?sllXRzqMvHWxMgWMDkAz2rwSALf7SXvhlUqbyDkY9mkfhaETWlv05gWbI9CS?=
 =?us-ascii?Q?ZsqYNQhKO7uz8t9S5OJfMjkzxZwesrsPtj4jCKTfTdBQRkuKtOJjy6yLDv4Z?=
 =?us-ascii?Q?+eJGIWHxzA87xxx15HBaRxT6MciBMdBM46oJkfVvvFI6LQvPyacU9FBn6Tnu?=
 =?us-ascii?Q?MILYEOUq6wxTxvqr/BxTt+gaMoignqjaDxwn/jTUyCjmNfXeuCsMMNX/uSQa?=
 =?us-ascii?Q?okCgVrU/nAzXuXh4wkNXQBkIRmn/vCx6ZWLD5lSulB7BMO0xpTXkHcvE6Bqm?=
 =?us-ascii?Q?ya5kw9lUMqMWP1FBBzyxdrevn+2GtXBrpa3QvapqA5JBiUlAdm/oZmYj7/8Q?=
 =?us-ascii?Q?DcYBIeohMbjPV/GpRw1YtIiGGsFqPE3y3c3yb9CrwWqvTd8A6MWRP9etlfXR?=
 =?us-ascii?Q?e1x20vznO82wXUCdoOVaS9RRDn/ip8q53fIo3vyMCQ0u9j86WgA2rFAgySkj?=
 =?us-ascii?Q?aK/Tlsqs/P/x6a0tyuwy7UlMFizov9tbccae41CF6JtCyjY9KohQjT551yeQ?=
 =?us-ascii?Q?j5aMI2Rt25lJ2NUJZEHoVJB0q6jPWY5NtRfsGfxlAA2mBHFfXI4CEev0ceRu?=
 =?us-ascii?Q?zDZSfS68axdRVPua2o51KM09Y1aH4qSBcmDW5PGfB1a7lpkBgt1ZK9ANMD3O?=
 =?us-ascii?Q?jLPGfnqWbceaxEXIU6emiWfXYsxLqVoWrO08QcKCZ5iD1hG95VwZBb8Iiali?=
 =?us-ascii?Q?VMjRKML1GE8D1HOUT8bZRu7X04KK21w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6db610-fc2b-427c-3998-08de94437678
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 01:17:40.4367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e8Xz6At9X0Sn9e4W0zSvld83QqEDTvmar/8e8r5ad+PS5fKYV44zMqb+d9VVLykOA7i0NStKhTO6lV5KHMCEE1iDvEXgkWhZXAmggMFmGzd9Dga/FBnDkv1O0CzaOXWM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1235

Hi, Brian

Thanks for the review.

> Hi Changhuang,
>=20
> On Thu, Apr 02, 2026 at 10:49:35PM -0700, Changhuang Liang wrote:
> > Add system-0 domain PLL clock driver for StarFive JHB100 SoC.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  drivers/clk/starfive/Kconfig                  |   8 +
> >  drivers/clk/starfive/Makefile                 |   1 +
> >  .../clk/starfive/clk-starfive-jhb100-pll.c    | 498 ++++++++++++++++++
> >  3 files changed, 507 insertions(+)
> >  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c
> >
> > diff --git a/drivers/clk/starfive/Kconfig
> > b/drivers/clk/starfive/Kconfig index c612f1ede7d7..cc712da68bd0 100644
> > --- a/drivers/clk/starfive/Kconfig
> > +++ b/drivers/clk/starfive/Kconfig
> > @@ -105,6 +105,14 @@ config CLK_STARFIVE_JHB100_PER3
> >  	  Say yes here to support the peripheral-3 clock controller
> >  	  on the StarFive JHB100 SoC.
> >
> > +config CLK_STARFIVE_JHB100_PLL
> > +	bool "StarFive JHB100 PLL clock support"
> > +	depends on ARCH_STARFIVE || COMPILE_TEST
> > +	default ARCH_STARFIVE
> > +	help
> > +	  Say yes here to support the PLL clock controller on the
> > +	  StarFive JHB100 SoC.
> > +
> >  config CLK_STARFIVE_JHB100_SYS0
> >  	bool "StarFive JHB100 system-0 clock support"
> >  	depends on ARCH_STARFIVE || COMPILE_TEST diff --git
> > a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile index
> > f00690f0cdad..547a8c170728 100644
> > --- a/drivers/clk/starfive/Makefile
> > +++ b/drivers/clk/starfive/Makefile
> > @@ -15,6 +15,7 @@ obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)
> 	+=3D clk-starfive-jhb100-per0.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER1)		+=3D
> clk-starfive-jhb100-per1.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER2)		+=3D
> clk-starfive-jhb100-per2.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER3)		+=3D
> clk-starfive-jhb100-per3.o
> > +obj-$(CONFIG_CLK_STARFIVE_JHB100_PLL)		+=3D
> clk-starfive-jhb100-pll.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+=3D
> clk-starfive-jhb100-sys0.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+=3D
> clk-starfive-jhb100-sys1.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+=3D
> clk-starfive-jhb100-sys2.o
> > diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> > b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> > new file mode 100644
> > index 000000000000..1751a734ee83
> > --- /dev/null
> > +++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> > @@ -0,0 +1,498 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * StarFive JHB100 PLL Clock Generator Driver
> > + *
> > + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> > + *
> > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> > +
> > +/* this driver expects a 25MHz input frequency from the oscillator */
> > +#define JHB100_PLL_OSC_RATE		25000000UL
>=20
> You could include linux/units.h and then use: 25 * HZ_PER_MHZ
>=20
> > +
> > +/* System-0 domain PLL */
> > +#define JHB100_PLL2_OFFSET		0x00
> > +#define JHB100_PLL3_OFFSET		0x0c
> > +#define JHB100_PLL4_OFFSET		0x18
> > +#define JHB100_PLL5_OFFSET		0x24
> > +
> > +#define JHB100_PLL_CFG0_OFFSET		0x0
> > +#define JHB100_PLL_CFG1_OFFSET		0x4
> > +#define JHB100_PLL_CFG2_OFFSET		0x8
> > +
> > +#define JHB100_PLLX_CFG0(offset)	((offset) + JHB100_PLL_CFG0_OFFSET)
> > +/* fbdiv value should be 16 to 4095 */
> > +#define   JHB100_PLL_FBDIV			GENMASK(13, 2)
> > +#define   JHB100_PLL_FBDIV_SHIFT		2
> > +#define   JHB100_PLL_FOUTPOSTDIV_EN		BIT(14)
> > +#define   JHB100_PLL_FOUTPOSTDIV_EN_SHIFT	14
> > +#define   JHB100_PLL_FOUTVCOP_EN		BIT(16)
> > +#define   JHB100_PLL_FOUTVCOP_EN_SHIFT		16
> > +
> > +#define JHB100_PLLX_CFG1(offset)	((offset) + JHB100_PLL_CFG1_OFFSET)
> > +/* frac value should be decimals multiplied by 2^24 */
> > +#define   JHB100_PLL_FRAC			GENMASK(23, 0)
> > +#define   JHB100_PLL_FRAC_SHIFT			0
> > +#define   JHB100_PLL_LOCK			BIT(24)
> > +#define   JHB100_PLL_LOCK_SHIFT			24
> > +
> > +#define JHB100_PLLX_CFG2(offset)	((offset) + JHB100_PLL_CFG2_OFFSET)
> > +#define   JHB100_PLL_PD				BIT(13)
> > +#define   JHB100_PLL_PD_SHIFT			13
> > +#define   JHB100_PLL_POSTDIV			GENMASK(15, 14)
> > +#define   JHB100_PLL_POSTDIV_SHIFT		14
> > +#define   JHB100_PLL_REFDIV			GENMASK(23, 18)
> > +#define   JHB100_PLL_REFDIV_SHIFT		18
> > +
> > +#define JHB100_PLL_TIMEOUT_US		1000
> > +#define JHB100_PLL_INTERVAL_US		100
> > +
> > +struct jhb100_pll_preset {
> > +	unsigned long freq;
> > +	u32 frac;			/* frac value should be decimals multiplied by 2^24
> */
> > +	unsigned fbdiv		: 12;	/* fbdiv value should be 8 to 4095 */
> > +	unsigned refdiv		: 6;
> > +	unsigned postdiv	: 2;
> > +	unsigned foutpostdiv_en	: 1;
> > +	unsigned foutvcop_en	: 1;
> > +};
> > +
> > +struct jhb100_pll_info {
> > +	char *name;
> > +	const struct jhb100_pll_preset *presets;
> > +	unsigned int npresets;
> > +	unsigned long flag;
> > +	u8 offset;
> > +	bool continuous;
> > +};
> > +
> > +#define _JHB100_PLL(_idx, _name, _presets, _npresets, _offset, _flag,
> _cont)	\
> > +	[_idx] =3D {							\
> > +		.name =3D _name,						\
> > +		.offset =3D _offset,					\
> > +		.presets =3D _presets,					\
> > +		.npresets =3D _npresets,					\
> > +		.flag =3D _flag,						\
> > +		.continuous =3D _cont,					\
> > +	}
> > +
> > +#define JHB100_PLL(idx, name, presets, npresets, offset, cont)
> 	\
> > +	_JHB100_PLL(idx, name, presets, npresets, offset, 0, cont)
> > +
> > +struct jhb100_pll_match_data {
> > +	const struct jhb100_pll_info *pll_info;
> > +	int num_pll;
> > +};
> > +
> > +struct jhb100_pll_data {
> > +	struct clk_hw hw;
> > +	unsigned int idx;
> > +};
> > +
> > +struct jhb100_pll_priv {
> > +	struct device *dev;
> > +	struct regmap *regmap;
> > +	const struct jhb100_pll_match_data *match_data;
> > +	struct jhb100_pll_data pll[];
> > +};
> > +
> > +struct jhb100_pll_regvals {
> > +	u32 fbdiv;
> > +	u32 frac;
> > +	u32 postdiv;
> > +	u32 refdiv;
> > +	bool foutpostdiv_en;
> > +	bool foutvcop_en;
> > +};
> > +
> > +static struct jhb100_pll_data *jhb100_pll_data_from(struct clk_hw
> > +*hw) {
> > +	return container_of(hw, struct jhb100_pll_data, hw); }
> > +
> > +static struct jhb100_pll_priv *jhb100_pll_priv_from(struct
> > +jhb100_pll_data *pll) {
> > +	return container_of(pll, struct jhb100_pll_priv, pll[pll->idx]); }
> > +
> > +static int jhb100_pll_enable(struct clk_hw *hw) {
> > +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> > +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> > +	const struct jhb100_pll_info *info =3D
> > +&priv->match_data->pll_info[pll->idx];
> > +
> > +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> > +			   JHB100_PLL_PD, 0);
>=20
> Should the return value be checked here? Or just:
>=20
>     return regumap_update_bits(...);
>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static void jhb100_pll_disable(struct clk_hw *hw) {
> > +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> > +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> > +	const struct jhb100_pll_info *info =3D
> > +&priv->match_data->pll_info[pll->idx];
> > +
> > +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> > +			   JHB100_PLL_PD, BIT(JHB100_PLL_PD_SHIFT)); }
> > +
> > +static int jhb100_pll_is_enabled(struct clk_hw *hw) {
> > +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> > +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> > +	const struct jhb100_pll_info *info =3D
> &priv->match_data->pll_info[pll->idx];
> > +	u32 val;
> > +
> > +	regmap_read(priv->regmap, JHB100_PLLX_CFG2(info->offset), &val);
>=20
> Should the return value be checked?
>=20
> > +
> > +	return !(val & JHB100_PLL_PD);
>=20
> If regmap_read() returns an error, then is val uninitialized?
>=20
> > +}
> > +
> > +static void jhb100_pll_regvals_get(struct regmap *regmap,
> > +				   const struct jhb100_pll_info *info,
> > +				   struct jhb100_pll_regvals *ret) {
> > +	u32 val;
> > +
> > +	regmap_read(regmap, JHB100_PLLX_CFG0(info->offset), &val);
> > +	ret->fbdiv =3D (val & JHB100_PLL_FBDIV) >> JHB100_PLL_FBDIV_SHIFT;
> > +	ret->foutpostdiv_en =3D !!((val & JHB100_PLL_FOUTPOSTDIV_EN) >>
> > +				 JHB100_PLL_FOUTPOSTDIV_EN_SHIFT);
> > +	ret->foutvcop_en =3D !!((val & JHB100_PLL_FOUTVCOP_EN) >>
> > +			      JHB100_PLL_FOUTVCOP_EN_SHIFT);
> > +
> > +	regmap_read(regmap, JHB100_PLLX_CFG1(info->offset), &val);
> > +	ret->frac =3D (val & JHB100_PLL_FRAC) >> JHB100_PLL_FRAC_SHIFT;
> > +
> > +	regmap_read(regmap, JHB100_PLLX_CFG2(info->offset), &val);
> > +	ret->postdiv =3D (val & JHB100_PLL_POSTDIV) >>
> JHB100_PLL_POSTDIV_SHIFT;
> > +	ret->refdiv =3D (val & JHB100_PLL_REFDIV) >> JHB100_PLL_REFDIV_SHIFT;
>=20
> Should these regmap return values be checked, and the error code returned=
?
>=20
> > +}
> > +
> > +static unsigned long jhb100_pll_recalc_rate(struct clk_hw *hw,
> > +unsigned long parent_rate) {
> > +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> > +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> > +	struct jhb100_pll_regvals val;
> > +	unsigned long rate;
> > +	u32 power =3D 0;
> > +
> > +	jhb100_pll_regvals_get(priv->regmap,
> > +&priv->match_data->pll_info[pll->idx], &val);
> > +
> > +	/*
> > +	 *
> > +	 * if (foutvcop_en)
> > +	 *      rate =3D parent * (fbdiv + frac / 2^24) / refdiv
> > +	 *
> > +	 * if (foutpostdiv_en)
> > +	 *      rate =3D parent * (fbdiv + frac / 2^24) / refdiv / 2^(postdiv=
 + 1)
> > +	 *
> > +	 * parent * (fbdiv + frac / 2^24) =3D parent * fbdiv + parent * frac =
/ 2^24
> > +	 */
> > +
> > +	if (!!val.foutvcop_en =3D=3D !!val.foutpostdiv_en)
> > +		return 0;
> > +
> > +	rate =3D (parent_rate * val.frac) >> 24;
> > +
> > +	if (val.foutpostdiv_en)
> > +		power =3D val.postdiv + 1;
> > +
> > +	rate +=3D parent_rate * val.fbdiv;
> > +	rate /=3D val.refdiv << power;
>=20
> Could val.refdiv ever be zero?

Will check it at next version.

> > +
> > +	return rate;
> > +}
> > +
> > +static int jhb100_pll_determine_rate(struct clk_hw *hw, struct
> > +clk_rate_request *req) {
> > +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> > +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> > +	const struct jhb100_pll_info *info =3D
> &priv->match_data->pll_info[pll->idx];
> > +	const struct jhb100_pll_preset *selected =3D &info->presets[0];
> > +	unsigned int idx;
> > +
> > +	/* if the parent rate doesn't match our expectations the presets won'=
t
> work */
> > +	if (req->best_parent_rate !=3D JHB100_PLL_OSC_RATE) {
> > +		req->rate =3D jhb100_pll_recalc_rate(hw, req->best_parent_rate);
> > +		return 0;
> > +	}
> > +
> > +	/* continuous means support any rate */
> > +	if (info->continuous)
> > +		return 0;
> > +
> > +	/* find highest rate lower or equal to the requested rate */
> > +	for (idx =3D 1; idx < info->npresets; idx++) {
> > +		const struct jhb100_pll_preset *val =3D &info->presets[idx];
> > +
> > +		if (req->rate < val->freq)
> > +			break;
> > +
> > +		selected =3D val;
> > +	}
> > +
> > +	req->rate =3D selected->freq;
> > +
> > +	return 0;
> > +}
> > +
> > +static int jhb100_pll_set_preset(struct clk_hw *hw, struct
> > +jhb100_pll_preset *val) {
> > +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> > +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> > +	const struct jhb100_pll_info *info =3D
> &priv->match_data->pll_info[pll->idx];
> > +	unsigned int value;
> > +
> > +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset),
> JHB100_PLL_FBDIV,
> > +			   (u32)val->fbdiv << JHB100_PLL_FBDIV_SHIFT);
> > +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset),
> JHB100_PLL_FOUTPOSTDIV_EN,
> > +			   (u32)val->foutpostdiv_en <<
> JHB100_PLL_FOUTPOSTDIV_EN_SHIFT);
> > +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset),
> JHB100_PLL_FOUTVCOP_EN,
> > +			   (u32)val->foutvcop_en <<
> JHB100_PLL_FOUTVCOP_EN_SHIFT);
>=20
> These are writing to the same register. Should the values be combined int=
o
> one, and written once to the register?
>=20
> > +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG1(info->offset),
> JHB100_PLL_FRAC,
> > +			   val->frac << JHB100_PLL_FRAC_SHIFT);
> > +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> JHB100_PLL_REFDIV,
> > +			   (u32)val->refdiv << JHB100_PLL_REFDIV_SHIFT);
> > +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> JHB100_PLL_POSTDIV,
> > +			   (u32)val->postdiv << JHB100_PLL_POSTDIV_SHIFT);
>=20
> The last two calls to JHB100_PLLX_CFG2 also write to the same register.
> Should the two writes be combined into one?
>=20
> Should the return values from regmap_update_bits() be checked?
>=20
> > +
> > +	/* waiting for PLL to lock */
> > +	return regmap_read_poll_timeout_atomic(priv->regmap,
> JHB100_PLLX_CFG1(info->offset),
> > +					       value, value & JHB100_PLL_LOCK,
> > +					       JHB100_PLL_INTERVAL_US,
> > +					       JHB100_PLL_TIMEOUT_US);
> > +}
> > +
> > +static int jhb100_pll_rate_to_preset(struct clk_hw *hw, unsigned long =
rate,
> > +				     unsigned long parent_rate)
> > +{
> > +	struct jhb100_pll_preset val =3D {
> > +		.refdiv =3D 1,
> > +		.postdiv =3D 3,
> > +		.foutpostdiv_en =3D 1,
> > +		.foutvcop_en =3D 0,
> > +	};
> > +	unsigned int power =3D 0;
> > +	unsigned long fbdiv_24, t;
> > +
> > +	if (val.foutpostdiv_en)
> > +		power =3D val.postdiv + 1;
> > +
> > +	t =3D val.refdiv << power;
> > +	t *=3D rate;
> > +
> > +	val.fbdiv =3D t / parent_rate;
>=20
> Should a check for parent_rate =3D=3D 0 be added?

parent_rate is checked in jhb100_pll_set_rate, and it only supports 25M.

> > +
> > +	fbdiv_24 =3D (t << 24) / parent_rate;
> > +	val.frac =3D fbdiv_24 - (val.fbdiv << 24);
> > +
> > +	return jhb100_pll_set_preset(hw, &val); }
> > +
> > +static int jhb100_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			       unsigned long parent_rate)
> > +{
> > +	struct jhb100_pll_data *pll =3D jhb100_pll_data_from(hw);
> > +	struct jhb100_pll_priv *priv =3D jhb100_pll_priv_from(pll);
> > +	const struct jhb100_pll_info *info =3D
> &priv->match_data->pll_info[pll->idx];
> > +	const struct jhb100_pll_preset *val;
> > +	unsigned int idx;
> > +
> > +	/* if the parent rate doesn't match our expectations the presets won'=
t
> work */
> > +	if (parent_rate !=3D JHB100_PLL_OSC_RATE)
> > +		return -EINVAL;
> > +
> > +	if (info->continuous)
> > +		return jhb100_pll_rate_to_preset(hw, rate, parent_rate);
> > +
> > +	for (idx =3D 0, val =3D &info->presets[0]; idx < info->npresets; idx+=
+, val++) {
> > +		if (val->freq =3D=3D rate)
> > +			return jhb100_pll_set_preset(hw, (struct jhb100_pll_preset
> *)val);
>=20
> The cast looks to be here because of the const in jhb100_pll_set_preset()=
. Can
> const be added to the declaration of jhb100_pll_set_preset()?

Will try it.

Best Regards,
Changhuang

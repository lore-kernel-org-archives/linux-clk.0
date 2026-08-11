Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2107.outbound.protection.partner.outlook.cn [139.219.17.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4541A43079F;
	Tue, 11 Aug 2026 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786449293; cv=fail; b=JTXbBJB3P8O1Ogbrd3lk9lRKjpk3cCnSh9bfc1MrMWpdPdhFhdzR/HNfggHatBR7yhxnytak8blR4Pj8cglop40EpdGaN5NSL4pY0rC0DiXPDH0b35OtsN+DmxxCuY4hcT6ZusLsxgtHiaG6yX1cwG0griCyRJEtRNkFNk60vlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786449293; c=relaxed/simple;
	bh=5QqEuaWTUtb2AK2zwgnJl3DM2phv22XxA73qorNpM68=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=orXmddPC/0ygQiJQkkoF05Eb16R8GpdRQagP8YcD/RcLT0zUoIdnrXym5Y8TABkBO2ijTukXgIjzP+LULS4Yv/qQNouDOyFDNvJuhNcFwBS3NleQEUkW2Ce4lPIVg+1VKNcCoFJJT9UnWskad0UZt3uyBsl7FPDW1N+JzysD8hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfVV6dycXa090+dzCPpNPT2Ce7OhEveixQx3o8RlC8OonrcooTX+xp3lwnSi22oRCb9lsHrqNYzhI6g025yo6DbATPYkkwyWQntVPYTWk+VrCzU9fuSl2GRUOjsrSenPpVNX7m3oGbeqlkdCgChH8KqqoqZErnBGPuWXFjqNcno91etCkWIQIY03GCoexicAM5pelhyLo1oxbXMeO6tjr5z8giJ7Fpc+1j+zN9aPVruJUZCJVCFlJ7Pi1kFqpjqCj1DdoV2OGCHMDPyB2zSzf6Ltvzt8Lzn1qLGiNlWygV/qXydFzP8uDaXZKhA3k+ezJerOUGfCz1h+H/wmsf5Pag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwFNGIa6i02chPLwffm3c+jigDryL1XcYeoPRCZb4lI=;
 b=e/722O93EdrljM0Ffc9W5GDkjRq8sN865e5vhjx2mu57kZpg0tqfxiaJk9QjtDWP/keos92haEOUN+Hgnzr04bC1Vr4AjnDYKQ/yAxuh0t7QZx40nzkT/A0iVwjnLEk9S82RVFP30QKU7h2a15Agfou8yC1y7QaQDzTg66jeae/4hrjYVW68a8AE9Hyf/y41f7RlH0oN1GfYcNszRFdGQ8BBFgY6JO5pZm62UKO1eQETUNVjQW6yFjPu9L+STujgS96ZP9M9iqJNpFkF7txRHePD6jeAhKd5eqDKa7J05fjPxEv5Vpn/m/iZNDMqYQGny1Jb5zBJ+/AZ/dC8IqSGzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1281.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 11:54:33 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Tue, 11 Aug 2026 11:54:33 +0000
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
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 2/8] clk: starfive: Add system-0 domain PLL clock
 driver
Thread-Topic: [PATCH v4 2/8] clk: starfive: Add system-0 domain PLL clock
 driver
Thread-Index: AQHdJ6GLvS5NNuAYikeWCGx3U49v07aXvOuAgAEEKZA=
Date: Tue, 11 Aug 2026 11:54:32 +0000
Message-ID:
 <ZQ4PR01MB12022BC787EF8C07DBB34E34F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-3-changhuang.liang@starfivetech.com>
 <anozO_Q-a7AFQkaE@redhat.com>
In-Reply-To: <anozO_Q-a7AFQkaE@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1281:EE_
x-ms-office365-filtering-correlation-id: 0529770f-5609-4453-34ec-08def79f4f08
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|56012099006|10067099003|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 UGoGqOG55m1ZEj2H/um2B9Nn0q9VeiXHdoHidouLyMblqwySoGBRLflrRvmz0Qb6fV6G+Y3bodmPnQyDFlopTkVAcr8ZUAu3jCY+x9kIYwYj+1AqPmsNJJYBvtlCW9Ybw8h+cNbYJNcxgNjNZzueMWaNy8IzhUbbBePUGiJxue9gd4xiW04xLNjCmTfnPHntDrn/NVm/sl2wHM6kXgCGirTin0haC57IJrEA9Ylhih6EeC5UFDHAeTfwM62Qj1y8bQwYAxexhJXEKUtGInrVhpZCdhGBnjMZ2O9WZJgxbx7I/yvWHRBKU13ASmaMLbjS7+UnphoemQNk7AV7vKgdJJzT0/sqLm9GqT4sD4JMjxbertyt3uxRed8nhNc+vbLPIDkD8hWGlRgS5OOfWUW8sTV8pkKI4PfcD8YdRzLrP8sduBP5eF6GIuwODrdrdpDVmvLboF6yY1iSnqqaF+AnuFr7jrFbDzgqjk/Hl/US6RX4LlnrPw7yp+3fE7frlZfnXu6Q97+8uTp6AZg/mup+1SEjgGR7OczM+dxYAsq6v9/AUsBgKZ0MpfMTmP380JDQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Fnk1OF1/hNA7/bhePK3BorZJF+RnqUFrgabwmggQm3ldw0S8GJpKeOforCGb?=
 =?us-ascii?Q?E5DNmn1GAphB7mn/J0Z/yePiRzbb+If5ZPYqI/uw9pLefF6suKUO4d0c4ki+?=
 =?us-ascii?Q?xh8//Zsk0ZKX08vuDHQ8FU3CxaV2d8IZi+nXYzGZAhz/k7KXdKvzCdlF/G8E?=
 =?us-ascii?Q?Yn+sg55cS7UG6FQX0huMbTTKzBdgdqmVD2kxP+dIs0GQZS5ju6o71AGvxxwV?=
 =?us-ascii?Q?6+k0KZSv6CIuV2RKHQ10b/Xx2lwEaJHZcMm5VCw6UNKTX/xsmiZ5hPpje/v0?=
 =?us-ascii?Q?pZk5EhMrEDzsQGt20CYvsEs4tju7sv3sufKkpBqq61H3ULGjOq9KkqP/Ukqe?=
 =?us-ascii?Q?85JbgYaZUWcRtyk/iN11KfrR1i0jcWaJ8RDmvTQoYzkSoo434mU3byjldfBL?=
 =?us-ascii?Q?A6VQtdMlrbQaZXR+OoSAbot2iJ7cLIfk3Cyb7eKug9+h1ZtV+i/qxFgzK1y6?=
 =?us-ascii?Q?8hypmamzv9wu5G8fD54NHvimc75qxv8im7tJoOz/oMJgOcMoqd8p+HzR2/Qj?=
 =?us-ascii?Q?58QQIshzXArt5GrU3WsPBQKz4E8xN1CNtopj1r41E/xjXQexmfEthynP8pSH?=
 =?us-ascii?Q?pVCMG0usgmiEQBr2wU3zOQkPlmrvFabJirhRxSlRekIw10CAB7ISmJ7SujYI?=
 =?us-ascii?Q?0ZBRqLCNfuzJZhA6nwydqTIFbpdENKkHSZSlrYKh5ssP51VJDqF5nrfS17km?=
 =?us-ascii?Q?KQV0F/zD+urS2ZX3dPkQnbo5SOzSbAgTvg251LM3wbq6dB0rkP1MBQAaJTJb?=
 =?us-ascii?Q?GOdUoAKxjokjM4wpGT9K9HSywJEhagyZqw/sGRxwBrJByjsvEAed1+UOnOtH?=
 =?us-ascii?Q?DqBWaOO9fRdoRqKkJwXHCCig1xisjm3H2OCfgnejFUewyJeBkVKZGkKYDhmF?=
 =?us-ascii?Q?yGG3Gy5UvTsHrotZvb7T+Rb2KgjEkx42g001dPMjJY8405J2D6wAH5bQIgN3?=
 =?us-ascii?Q?oypTUCsEbO3bf9LsdFxNQVh5Zr9/BaHqLqxpKBN3XCZiNvDH8a1MWLyU9Z7k?=
 =?us-ascii?Q?C/oZcwc6x3l/PJ3kiTlYSaiX/jl0xzv8aSFX82ln+H739N8YdUg1TmL9FaaP?=
 =?us-ascii?Q?JQcodl330cOk8ELf/ZdrwxyNJW1UuFETUb1b1XfnEkYU7XzU6XZWXIEloi7m?=
 =?us-ascii?Q?PIwyLJqWP21eLEBfBLMdyzh2ptq0V3scPEieQ+dW+cErPvxmGTeTSU7MTMPh?=
 =?us-ascii?Q?bSbbzNFEKKzDbWlV5qctwYV4rWCkgT2GrA0kjTwnzZfPKuHxiXf7Vl0xolz0?=
 =?us-ascii?Q?Y7T6KHn/1yB3ehja8Gux3dV+nDtY6tFngE+CZEGBHUOczLbFSdSAFqtjtiq+?=
 =?us-ascii?Q?3wDW07Kz2eqp/fb+tm6N8cVNmEG/r1bn9Q5MD2eBvzi85WGSLtMDHAFrpaBm?=
 =?us-ascii?Q?7atN73CjRPD3pVnqY/rQA383hep3sJnCANpuKlxqE4jVh6YuSNigzSgf8cKY?=
 =?us-ascii?Q?u2u3NcmNdqnvVKC3gH6rwyT4gGUcpdam1Zm+iMzv+PFT6OJ3jpgyaG5d4ICx?=
 =?us-ascii?Q?gXiYcYZcqRBLvYyIa8CKO28dK+jh8xMfp6mfHzI0wJE4v6fJkFmZ2XW+c0RH?=
 =?us-ascii?Q?Os8bro5mH5fBbX5N5G7qSrAshhlGNJC6iV0d6WMAvplULRMwjLIUx6a+9eU4?=
 =?us-ascii?Q?cstgPtKLC9e7EFz109sH+lEu9LPNFtXdgkSLJTC45aNMrgyPk2byv8ONs9NF?=
 =?us-ascii?Q?hInImG1WCIJomXvjiaqWdgOtAe9dRtMWO8DJpWbDpvK6DtU95cETj2QtePwD?=
 =?us-ascii?Q?JG9ME6VCTqVZ4RfyinjojN+ue7PHP9o=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0529770f-5609-4453-34ec-08def79f4f08
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 11:54:32.9957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jwiQRByvwHa1O9p2Q+91KMdZ8I81v6JuyyGTdmEd8SdERYLkX3dL7Y5D29TzvU/Ph0eUB+vHlCTa3Z9zGYvAZqzfHKZDNGqMu6+n5HZkyo395/plzWffX/Ft+HWjiFB5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1281

Hi, Brian

> Hi Changhuang,
>=20
> On Sat, Aug 08, 2026 at 06:50:48PM -0700, Changhuang Liang wrote:
> > Add system-0 domain PLL clock driver for StarFive JHB100 SoC.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  drivers/clk/starfive/Kconfig                  |   8 +
> >  drivers/clk/starfive/Makefile                 |   1 +
> >  .../clk/starfive/clk-starfive-jhb100-pll.c    | 535 ++++++++++++++++++
> >  3 files changed, 544 insertions(+)
> >  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c
> >
> > diff --git a/drivers/clk/starfive/Kconfig
> > b/drivers/clk/starfive/Kconfig index 852464949334..a39dd22112fa 100644
> > --- a/drivers/clk/starfive/Kconfig
> > +++ b/drivers/clk/starfive/Kconfig
> > @@ -117,6 +117,14 @@ config CLK_STARFIVE_JHB100_PER3
> >  	  Say yes here to support the peripheral-3 clock controller
> >  	  on the StarFive JHB100 SoC.
> >
> > +config CLK_STARFIVE_JHB100_PLL
> > +	bool "StarFive JHB100 PLL clock support"
>=20
> Can this be a tristate?

I checked again, this doesn't affect the critical clock, so it can be chang=
ed to tristate

>=20
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
> > index 000000000000..55d589bc831e
> > --- /dev/null
> > +++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> > @@ -0,0 +1,535 @@
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
> > +#include <linux/math64.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/units.h>
> > +
> > +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> > +
> > +/* this driver expects a 25MHz input frequency from the oscillator */
> > +#define JHB100_PLL_OSC_RATE		(25 * HZ_PER_MHZ)
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
> > +	unsigned fbdiv		: 12;	/* fbdiv value should be 16 to 4095 */
> > +	unsigned refdiv		: 6;
> > +	unsigned postdiv	: 2;
> > +	unsigned foutpostdiv_en	: 1;
> > +	unsigned foutvcop_en	: 1;
> > +};
> > +
> > +struct jhb100_pll_info {
> > +	char *name;
>=20
> const char *name ?

Will Fix.

Best Regards,
Changhuang



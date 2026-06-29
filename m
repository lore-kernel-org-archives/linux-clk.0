Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023124.outbound.protection.outlook.com [52.101.127.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1149F3F7A9E;
	Mon, 29 Jun 2026 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724313; cv=fail; b=smtmTinhsNqItoOXY8eKEcN9KsERfBcaMsirB1+vtwSA3cU5vTLLWcQkVWqRX0MUoRWakXwtxJ0DeuU22NjJbhrH8Wj4JXIeAki10VTx+rSoz7RlL6LZZTp5mvhiiTZllaPP7rf/v/s4LwTZjPs+57fIqn3SrJJI3hbH7ebfdC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724313; c=relaxed/simple;
	bh=3G/SWsDLdztJdg3wzrwWfJY4Nq2FjQplmwVThGvAcbA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WOaHmHu0UYeye05O0Avek5zJO9mittqxRVDRIT7FrmrIQfDkm5FrZB8MK8uawoyZDAAAoniWqVY+MpS13E5+LkCd5oAk5sW7et2+uTanDR7T+388zTjNKpgqOaD2G0xRvyaAVfO9mTEEW0u2uqrguFVmzlLCmciZW6B0MZqyQu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zk/uo/1d4t64PyCd/e/qIxdBhWM+UwD9D9nTyYBctmN7s+yCX8La39ixHhPz32I5UzANSX8Q7iXXz5LYIFiurRxU0lBLOhjZAkjIvcpBhXv8C09c7m4VsnxjFj+8Lm0se6Pd25j/2v4qcYJZfay4Mpz4R3R4uMx2TxSP4fJ1IBNXgbb1jrjaPeV8m3I8On4aCnIP7nBsaHXCXSbrDDgvNbyY70OqRQTNu+9bX3zkybLqAIVs5tClgKv/gC6moe7diKgTZBknIza22ktfgRYmNyHD01nXpMzuHej4aST/p4glSw/QRUvMvO0Fc3WJA5OUzk12uJg0OnUH1+Ui31/aKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/6DMeF+VzrPuokfm4ZDmzjeVtbdIynLnrQnwoD7BaQ=;
 b=isE9JF63dOSkcj+sUESuoB0J2G7fQN0bHaDyjpABOC2/ZbpwofctwuWOM+TE7S4HycC+U8DAybb0hgvD/OUIYG7UAmTGnc9rPnOvWEneuZfDVkAQT2+CUQIGdJH7W20DXzSXdVWhao/NX8QscjeZ4FHleLPUNPFRjPNe9hyEjpFU5Jm8bzEyzfc1ratCtXOsgDlo41aOT5JVk9Ti9KkFnoCtErRr1zKnfIjEE/2tmUo6cYD+fJoIMWRPG0V31gPnHDgojeJGYz/OO3SshHZv4sX2PkuIisbwPBhpKEA4ajOlJbBeGeHsvLr/A3wkM0pBMX35EcPV4ozsC+xREbBlxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by SEYPR06MB6432.apcprd06.prod.outlook.com (2603:1096:101:16f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:11:46 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 09:11:46 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"bmasney@redhat.com" <bmasney@redhat.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Gary Yang
	<Gary.Yang@cixtech.com>
CC: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v6 3/4] reset: cix: add sky1 audss auxiliary reset driver
Thread-Topic: [PATCH v6 3/4] reset: cix: add sky1 audss auxiliary reset driver
Thread-Index: AQHdAt8NOhOy9rSMn0W7G5oKLL4fGrZNYZYAgAfI1iA=
Date: Mon, 29 Jun 2026 09:11:46 +0000
Message-ID:
 <SEYPR06MB62260AFE3A4C2CBC998F876082E82@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260623070805.211019-1-joakim.zhang@cixtech.com>
	 <20260623070805.211019-4-joakim.zhang@cixtech.com>
 <0193c47ff4ca98b1a6cb56ed8f4d8876b54756d8.camel@pengutronix.de>
In-Reply-To: <0193c47ff4ca98b1a6cb56ed8f4d8876b54756d8.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|SEYPR06MB6432:EE_
x-ms-office365-filtering-correlation-id: 4ba44a18-6353-4426-4d38-08ded5be71eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|3023799007|22082099003|18002099003|5023799004|4143699003|56012099006;
x-microsoft-antispam-message-info:
 nsJXqU3DDeN02DEtm2pkaRkOzvdUq/3VM3WktrXMPTBVEa9cDHMzbyGLs1T4kDF2EKnSWdCEnjcDePWdMbQUHduiWNBcHKm42N53e0B+FE+zc3dRo3Vp72VLagQUhoZdABNsFgCf4d7PPrGKfYKbjubmYqjb4N/dkU8HhLI+5aoPrb+oPcpzB+oZFVjOTDGXvZkHikqFxvxULbRvJy+ct9JR6+4a5agNWk5Gb408N49u9Ru0QAJzsLEI/vm8Bb2fQfridCA0p+UQ1mfchQupSEhTwDgfs5Laui3sxpoEJK7Cu+7iEBT8bvXZFNMdlfSAM0lOfhaaYcnzJQ8JLc3Gm6eQptni/MSni0RC82KjyuxcsgQJIpE/k37Ah+q4XMyb/dHPtyRocKTO97gDj5irx0ag9E1UTpWk0TqSSyQraIyUHQ1MJIRdB2Cx2TObMtfYEB5qi5MR+wr+KL6U8XNZxC7+h3IYB2Hl8Z4S1c16FJJIJMKnpR8YY737lpZo8JiLTofrsXjrqHfneUnnUiTUPDI4OGLoxXjWjAK+u0NpPWJRGqIScqZF6ezac8PU/yM5sYVD+l2SMbu2Fwm6ApCs7p3eltt0O46zm9rpMRiGZvad+Rbz6KLDSvxXfoN1zt2lUiW6TxKAPUdBuScH04UKsl2WQOjoi1LmjEmherPtF75+AFXrUc5hQ86NG3HuEj/ON8w85oxbDMwKGnwjFYu6estQqTT8SOn4VL71u/AMFDM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(3023799007)(22082099003)(18002099003)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ibg5Ais5PLqKNIyrDBK1wkbFEUazH78InRJy0ECUQAEJNHKp+Uyb88nMge8N?=
 =?us-ascii?Q?ylQkRCQiSsMlwtgL91sniqyLJJUFdx9NKKWiu0RFfgXN2hp4rjkTJ7CHNRwF?=
 =?us-ascii?Q?bs7eI1PDxp6LAIOS8cMOjzTW7s0h4J2XFMkOtjev+YsaUhHDJEOfhVbftx3p?=
 =?us-ascii?Q?m59aQ6Eb4ZhwwJPIfJxmY0MB6ZBGYmdd6rjUZoICm9hK3FiS9jdWt0BzKaC+?=
 =?us-ascii?Q?J+kORjKGCyvK9meks75Wk1oU2XY+2O44P5pjwPFCsVmIPk3xDy8WBI0cocgp?=
 =?us-ascii?Q?LfD4h196yrhX3k88iP2+MVqHkkPI/YHW2XBkkSKUb38Yswn9IAp08u9OVEq1?=
 =?us-ascii?Q?IC054bngxYT7eoE1OhJ0jTrTNYnbzm0tADNSgzu2bj25i4wnvevNS9t/t9Wl?=
 =?us-ascii?Q?BIlduj5xfMUDuOCSw/a7ykWNOQ0v3jjPJYvrrW8hXc52s/9CqQLzuaPfuxkP?=
 =?us-ascii?Q?0Q26jSlt3m9u/D/EnSfvc5D9uj3ITAbuFqCpXhPeMTz7nfAzxVVHHaiT4xfx?=
 =?us-ascii?Q?OKowxSgUnDKI9qUi9p33OVVG2mdbUX3Rk2Xuhhv6BGiJxoISTqD6Cnjxtt4y?=
 =?us-ascii?Q?Mpuu7z3idE1RRV7n/hFpjVdZmrHgM3YhvjDYjBIsyg4blOeBUKL6EYzuq8pm?=
 =?us-ascii?Q?DxepZUsUlwznj8ixXR4WG15DremRlJuK4jGWG9NTwkKF9PPInpbKZ8h2cdid?=
 =?us-ascii?Q?Zb/S3aoAoOm5xkqLMyLwsf7HcXzVkR/ov5fXkUhFT7tzggv1xoJzjQT7FDEn?=
 =?us-ascii?Q?2q0cpNnf2eIcIWNSGPiTE233Sslaq8wFbvZEa5Nl0Z2SMK0JNOAjkMfDieka?=
 =?us-ascii?Q?4Ujb6lK9WmBS1fvJA9y7tUUUNsXn8Pkf/j/GJGM4qCaW/Z5ZvHHFB/rIeHOt?=
 =?us-ascii?Q?6/Eh7M56z+hZWv9DSXtDPlvopiZvxjFQQ8/PhCHBQGUAsdXPiPN/dd+gJi41?=
 =?us-ascii?Q?OhnxM0YoPi9wLKLyT/oWUNVQOz/a472O+VfbivBT4oLTQgWI70KD9UpWNjIe?=
 =?us-ascii?Q?2oCzVUOF99RgdRtlcZz5+YtqdZbfqDTwZVqvJ0sxZZ2PHZc3sJe6fMzk1ZV2?=
 =?us-ascii?Q?1CQRWlBxXMoZNnGGTjh7B8GF3p+Dnb7Otz5acv08Ue8fbaU6Qi7TDGscgMGL?=
 =?us-ascii?Q?dvKXm3s3E9SjYTcasUm21C2acUFw5rhtluBVq4vDb44HiGNrzimUyDC7XDQD?=
 =?us-ascii?Q?uWsGXLI6tDwQPDuFk5EcjIJ0w9pP1XOX4UvDjrcwkCjNv+vQrgQb4sgxw0pU?=
 =?us-ascii?Q?D/N7/Km+W35nIIVL8I7y4EVTciGNE4zwIHVBd6zTMJCpzFfLIMHbyIv5nnNw?=
 =?us-ascii?Q?bgJq0yZEaYu+7PjMoQK3ZpXDpVucvlm1Gx1MuybaYMAg3o7ZfLQo+/Z7bpjq?=
 =?us-ascii?Q?8+SSEbB2S2rbQ4KxXwWhMUbbEu408sYwE9pb0ZO4EjkUj0NuxgKHU/bSficl?=
 =?us-ascii?Q?E76QlqFBAsc4CBMo/QlFKYR2pn9vVLOqO15TNQwivnrpXwRnwLqHQM4xOgwv?=
 =?us-ascii?Q?yVR4mppJSCN+mvNQssGuqSAyYHWA+QTcwzBvrc/ayKtGlqMAq8+tYOUfx9ZZ?=
 =?us-ascii?Q?agIA479FIv2VgFnee/k/ecykq9E/JZcnz1leJAdITYMc+GECnzgkB2CHU8NF?=
 =?us-ascii?Q?nlbrlja6D4P3onElKGNq3wWHKicojVOyL70Y0GyuVk4b72gc/22SWTRTvXaF?=
 =?us-ascii?Q?Z/GvkNjW1NlyQGLZyUckIVrX/rKKs1ckRqL68Xfs4lc74bfngpmuhYRNCl+C?=
 =?us-ascii?Q?apxUY/9ykw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6226.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba44a18-6353-4426-4d38-08ded5be71eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 09:11:46.4282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uuQhD6rS+k7JWAVd9yWYsoRm7TQAyuB5A7TcRakxf4MPbwySCdp4SewNqA0/dytTtXdf7wztmuRLfuAKiCwZExCy7zndX2NSc5d9SOlusSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6432


Hello, Philipp

> -----Original Message-----
> From: Philipp Zabel <p.zabel@pengutronix.de>
> Sent: Wednesday, June 24, 2026 4:30 PM
> To: Joakim Zhang <joakim.zhang@cixtech.com>; mturquette@baylibre.com;
> sboyd@kernel.org; bmasney@redhat.com; robh@kernel.org;
> krzk+dt@kernel.org; conor+dt@kernel.org; Gary Yang
> <gary.yang@cixtech.com>
> Cc: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; linux-
> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v6 3/4] reset: cix: add sky1 audss auxiliary reset dr=
iver
>=20
> EXTERNAL EMAIL
>=20
> CAUTION: Suspicious Email from unusual domain.
>=20
> On Di, 2026-06-23 at 15:08 +0800, joakim.zhang@cixtech.com wrote:
> > From: Joakim Zhang <joakim.zhang@cixtech.com>
> >
> > Add an auxiliary reset controller driver for the AUDSS CRU. Sixteen
> > software reset lines for audio subsystem peripherals are controlled
> > through one register in the CRU register map.
> >
> > The driver is created by the AUDSS clock platform driver and registers
> > the reset controller on the CRU device node.
> >
> > Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> > ---
> >  drivers/reset/Kconfig            |  14 +++
> >  drivers/reset/Makefile           |   1 +
> >  drivers/reset/reset-sky1-audss.c | 192
> > +++++++++++++++++++++++++++++++
> >  3 files changed, 207 insertions(+)
> >  create mode 100644 drivers/reset/reset-sky1-audss.c
> >
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig index
> > d009eb0849a3..f74859b292ae 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -300,6 +300,20 @@ config RESET_SKY1
> >       help
> >         This enables the reset controller for Cix Sky1.
> >
> > +config RESET_SKY1_AUDSS
> > +     tristate "Cix Sky1 Audio Subsystem reset controller"
> > +     depends on ARCH_CIX || COMPILE_TEST
> > +     select AUXILIARY_BUS
> > +     select REGMAP_MMIO
> > +     default CLK_SKY1_AUDSS
> > +     help
> > +       Support for block-level software reset lines in the Cix Sky1
> > +       Audio Subsystem (AUDSS) Clock and Reset Unit. Sixteen reset
> > +       outputs for audio peripherals are controlled through the CRU
> > +       register map. The driver binds as an auxiliary device from
> > +       the AUDSS clock driver. Say M or Y here if you want to build
> > +       this driver.
> > +
> >  config RESET_SOCFPGA
> >       bool "SoCFPGA Reset Driver" if COMPILE_TEST && (!ARM
> || !ARCH_INTEL_SOCFPGA)
> >       default ARM && ARCH_INTEL_SOCFPGA diff --git
> > a/drivers/reset/Makefile b/drivers/reset/Makefile index
> > 3e52569bd276..e81407ea3e29 100644
> > --- a/drivers/reset/Makefile
> > +++ b/drivers/reset/Makefile
> > @@ -39,6 +39,7 @@ obj-$(CONFIG_RESET_RZV2H_USB2PHY) +=3D
> > reset-rzv2h-usb2phy.o
> >  obj-$(CONFIG_RESET_SCMI) +=3D reset-scmi.o
> >  obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
> >  obj-$(CONFIG_RESET_SKY1) +=3D reset-sky1.o
> > +obj-$(CONFIG_RESET_SKY1_AUDSS) +=3D reset-sky1-audss.o
> >  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o
> >  obj-$(CONFIG_RESET_SUNPLUS) +=3D reset-sunplus.o
> >  obj-$(CONFIG_RESET_SUNXI) +=3D reset-sunxi.o diff --git
> > a/drivers/reset/reset-sky1-audss.c b/drivers/reset/reset-sky1-audss.c
> > new file mode 100644
> > index 000000000000..20870f37d7d7
> > --- /dev/null
> > +++ b/drivers/reset/reset-sky1-audss.c
> > @@ -0,0 +1,192 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Cix Sky1 Audio Subsystem reset controller driver
> > + *
> > + * Copyright 2026 Cix Technology Group Co., Ltd.
> > + */
> > +
> > +#include <dt-bindings/reset/cix,sky1-audss-cru.h>
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset-controller.h>
> > +
> > +#define SKY1_RESET_SLEEP_MIN_US              50
> > +#define SKY1_RESET_SLEEP_MAX_US              100
> > +
> > +#define AUDSS_SW_RST                 0x78
> > +
> > +struct sky1_audss_reset_map {
> > +     unsigned int offset;
> > +     unsigned int mask;
> > +};
> > +
> > +struct sky1_audss_reset {
> > +     struct reset_controller_dev rcdev;
> > +     struct regmap *regmap;
> > +     const struct sky1_audss_reset_map *map; };
> > +
> > +static const struct sky1_audss_reset_map sky1_audss_reset_map[] =3D {
> > +     [AUDSS_I2S0_SW_RST]   =3D { AUDSS_SW_RST, BIT(0) },
> > +     [AUDSS_I2S1_SW_RST]   =3D { AUDSS_SW_RST, BIT(1) },
> > +     [AUDSS_I2S2_SW_RST]   =3D { AUDSS_SW_RST, BIT(2) },
> > +     [AUDSS_I2S3_SW_RST]   =3D { AUDSS_SW_RST, BIT(3) },
> > +     [AUDSS_I2S4_SW_RST]   =3D { AUDSS_SW_RST, BIT(4) },
> > +     [AUDSS_I2S5_SW_RST]   =3D { AUDSS_SW_RST, BIT(5) },
> > +     [AUDSS_I2S6_SW_RST]   =3D { AUDSS_SW_RST, BIT(6) },
> > +     [AUDSS_I2S7_SW_RST]   =3D { AUDSS_SW_RST, BIT(7) },
> > +     [AUDSS_I2S8_SW_RST]   =3D { AUDSS_SW_RST, BIT(8) },
> > +     [AUDSS_I2S9_SW_RST]   =3D { AUDSS_SW_RST, BIT(9) },
> > +     [AUDSS_WDT_SW_RST]    =3D { AUDSS_SW_RST, BIT(10) },
> > +     [AUDSS_TIMER_SW_RST]  =3D { AUDSS_SW_RST, BIT(11) },
> > +     [AUDSS_MB0_SW_RST]    =3D { AUDSS_SW_RST, BIT(12) },
> > +     [AUDSS_MB1_SW_RST]    =3D { AUDSS_SW_RST, BIT(13) },
> > +     [AUDSS_HDA_SW_RST]    =3D { AUDSS_SW_RST, BIT(14) },
> > +     [AUDSS_DMAC_SW_RST]   =3D { AUDSS_SW_RST, BIT(15) },
> > +};
> > +
> > +static struct sky1_audss_reset *to_sky1_audss_reset(struct
> > +reset_controller_dev *rcdev) {
> > +     return container_of(rcdev, struct sky1_audss_reset, rcdev); }
> > +
> > +static int sky1_audss_reset_set(struct reset_controller_dev *rcdev,
> > +                             unsigned long id, bool assert) {
> > +     struct sky1_audss_reset *priv =3D to_sky1_audss_reset(rcdev);
> > +     const struct sky1_audss_reset_map *signal =3D &priv->map[id];
> > +     unsigned int value =3D assert ? 0 : signal->mask;
> > +
> > +     return regmap_update_bits(priv->regmap, signal->offset,
> > + signal->mask, value);
>=20
> Why does this propagate the return value ...
I'll propagate the return value in the ops callbacks.


> > +}
> > +
> > +static int sky1_audss_reset_assert(struct reset_controller_dev *rcdev,
> > +                                unsigned long id) {
> > +     sky1_audss_reset_set(rcdev, id, true);
>=20
> ... only to be ignored? It'd be better to pass it on.
Yes, will add.


> > +     usleep_range(SKY1_RESET_SLEEP_MIN_US,
> SKY1_RESET_SLEEP_MAX_US);
> > +     return 0;
> > +}
> > +
> > +static int sky1_audss_reset_deassert(struct reset_controller_dev *rcde=
v,
> > +                                  unsigned long id) {
> > +     sky1_audss_reset_set(rcdev, id, false);
> > +     usleep_range(SKY1_RESET_SLEEP_MIN_US,
> SKY1_RESET_SLEEP_MAX_US);
> > +     return 0;
> > +}
> > +
> > +static int sky1_audss_reset(struct reset_controller_dev *rcdev,
> > +                         unsigned long id) {
> > +     sky1_audss_reset_assert(rcdev, id);
> > +     sky1_audss_reset_deassert(rcdev, id);
> > +     return 0;
> > +}
>=20
> Will any AUDSS reset consumer use the reset_control_reset() API?
> If not, no need to implement this.
Will remove both .reset and .status.


> > +
> > +static int sky1_audss_reset_status(struct reset_controller_dev *rcdev,
> > +                                unsigned long id) {
> > +     struct sky1_audss_reset *priv =3D to_sky1_audss_reset(rcdev);
> > +     const struct sky1_audss_reset_map *signal =3D &priv->map[id];
> > +     unsigned int value;
> > +
> > +     regmap_read(priv->regmap, signal->offset, &value);
> > +     return !!(value & signal->mask); }
> > +
> > +static const struct reset_control_ops sky1_audss_reset_ops =3D {
> > +     .reset    =3D sky1_audss_reset,
> > +     .assert   =3D sky1_audss_reset_assert,
> > +     .deassert =3D sky1_audss_reset_deassert,
> > +     .status   =3D sky1_audss_reset_status,
> > +};
> > +
> > +static const struct regmap_config sky1_audss_regmap_config =3D {
> > +     .reg_bits =3D 32,
> > +     .val_bits =3D 32,
> > +     .reg_stride =3D 4,
> > +};
> > +
> > +static void sky1_audss_reset_iounmap(void *data) {
> > +     iounmap(data);
> > +}
> > +
> > +static int sky1_audss_reset_get_regmap(struct sky1_audss_reset *priv)
> > +{
> > +     struct device *dev =3D priv->rcdev.dev;
> > +     void __iomem *base;
> > +     int ret;
> > +
> > +     priv->regmap =3D dev_get_regmap(dev->parent, NULL);
> > +     if (priv->regmap)
> > +             return 0;
> > +
> > +     base =3D of_iomap(dev->parent->of_node, 0);
> > +     if (!base)
> > +             return dev_err_probe(dev, -ENOMEM, "failed to iomap
> > + address space\n");
> > +
> > +     ret =3D devm_add_action_or_reset(dev, sky1_audss_reset_iounmap, b=
ase);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to register
> > + iounmap action\n");
> > +
> > +     priv->regmap =3D devm_regmap_init_mmio(dev, base,
> &sky1_audss_regmap_config);
> > +     if (IS_ERR(priv->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(priv->regmap),
> > +                                  "failed to initialize regmap\n");
>=20
> Why is there a fallback path? The clock driver creates the regmap before
> creating the reset aux device, so dev_get_regmap() can never fail.
Agreed.=20


> > +
> > +     return 0;
> > +}
> > +
> > +static int sky1_audss_reset_probe(struct auxiliary_device *adev,
> > +                               const struct auxiliary_device_id *id)
> > +{
> > +     struct sky1_audss_reset *priv;
> > +     struct device *dev =3D &adev->dev;
> > +     int ret;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->map =3D sky1_audss_reset_map;
> > +     priv->rcdev.owner =3D THIS_MODULE;
> > +     priv->rcdev.nr_resets =3D ARRAY_SIZE(sky1_audss_reset_map);
> > +     priv->rcdev.ops =3D &sky1_audss_reset_ops;
> > +     priv->rcdev.of_node =3D dev->parent->of_node;
>=20
> auxiliary_device_create() uses device_set_of_node_from_dev() to inherit t=
he
> parent of_node, so you can use dev->of_node here.
Done. rcdev.of_node now uses dev->of_node.


> > +     priv->rcdev.dev =3D dev;
> > +     priv->rcdev.of_reset_n_cells =3D 1;
>=20
> No need to set of_reset_n_cells.
>=20
> > +
> > +     dev_set_drvdata(dev, priv);
>=20
> This seems unnecessary as well.
>=20
> > +
> > +     ret =3D sky1_audss_reset_get_regmap(priv);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to get
> > + regmap\n");
> > +
> > +     return devm_reset_controller_register(dev, &priv->rcdev); }
> > +
> > +static const struct auxiliary_device_id sky1_audss_reset_ids[] =3D {
> > +     { .name =3D "clk_sky1_audss.reset" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(auxiliary, sky1_audss_reset_ids);
> > +
> > +static struct auxiliary_driver sky1_audss_reset_driver =3D {
> > +     .probe =3D sky1_audss_reset_probe,
> > +     .id_table =3D sky1_audss_reset_ids, };
> > +
>=20
> Drop this empty line.
Removed dev_set_drvdata() and the extra blank line.

Thanks,
Joakim

Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2107.outbound.protection.partner.outlook.cn [139.219.146.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE898286D60;
	Thu, 27 Aug 2026 07:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817393; cv=fail; b=cTHAHrNQ1Hx1X/9+H/bSyxKjeD74Pby9lwLHUqXvs0TcUEhO829kNY0DOG+euLxEqRGwjmHYDDlHZnC5Qfp/nHvVeFR3/raCYd4LWAiIBoGF9zwIqt3EjzeAvXcUi7bSMvr4z4knXR6RX5rQUMemn2Q5O4o/iWPKplNCD7ZoHic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817393; c=relaxed/simple;
	bh=T0KLqOJSjT79AJdvCpap6PXLmAVw89KabYxIPOycq2A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NvXhosmPOo2m1GZnRhHdR7mDEqFMBWMk3AuPEEN/A/RdZpcqwdLiZjUwXiL16gKVMZeY94J2aIXTtCPMzFHUtJDnX9KUL3uZeK/TS2msO6v2Lq1jaZDObqAukHQ+UUA7JWz05gwIliPTp/K2IoJW/rEladr2lv+MNtWmJ+SVYR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBtsMR3KjAbofdxmfVrn8AT+cQ/l5WuW4crY0gVdfVrIaUGP9FjP7bMnMsC4ipqgaL+qypn7ovd/6I1FYwqJ0enIL/rE0I6HMtzmzv0S8dUDSrDpYMmjoujwDDA0T6ALCdNR4f26n75264cPTsUHbjmz2Qrjui5iofiUXdM484bBONC1Blzcv3yCetfa1bGnUIH5aMPEUBbRDUi6x5ZaEA7+i7TePnRxxXw08Wanh3T6qCnhRaUfqha5e+ELFC8HJErcXIsTjOPG9sLq4mZ97BlcGcmkIMkcO4VoLUCi6rUY9oFyPa/+ZfcgDfTsRBF7p08MH+4+GXVK/pxDFQRHJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf2rUYoizVKpRxK14CGX4sZLnevWGUAllETe+HC5VY0=;
 b=UFHBq1RFllhxL5WuQOwScKbqWpUArXZD1l5+yVlsduA/epQxaIEPvzUpBUMVfIrpWd+Ji/d/lGDClDXLscIC+15mw2pvc6hD1AP/NXGGImAT3nx2JxUdoVxH49GOrdcmxbW0yeQ5KdJHC1NPkfrqeDwEojvYtgcjNUxgRrO16F6TrgwB0mAFxEIyoliKZCI6d0O29TqVeQvX56QkGd8Ka6HxrPxpHt9edRhP3+ArSVvQ93b/sNZJheEm5Shl+mj5EO/TetmoRnMWGm22+p/eLSU3JQ73lR7K1+bNW2ga+RYjcM1p7YI8qWT/pMgG0oxVpG63ex3fJKvz8E2XwIHP6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1137.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 27 Aug
 2026 06:22:21 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Thu, 27 Aug 2026 06:22:21 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	<inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang
	<keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 7/8] soc: starfive: Add socinfo driver for JHB100 SoC
Thread-Topic: [PATCH v4 7/8] soc: starfive: Add socinfo driver for JHB100 SoC
Thread-Index:
 AQHdJ6GQ5ts+ksAe6k+ENksiQTa0y7aXdLuAgADirHCAAL8NAIABJ12QgABaIICAAQ8eIIAAkEOAgACNr/CAAM//AIAD6sTAgAKVxICAARWHMIAMXoFg
Date: Thu, 27 Aug 2026 06:22:20 +0000
Message-ID:
 <ZQ4PR01MB1202AFE1B8600DFBE0DEB083F2AD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260810-caress-rack-45615c8d9747@spud>
 <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260811-populace-afflicted-40a40e0f484c@spud>
 <ZQ4PR01MB1202DDE6C255441E1FC4F916F2DC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260812-snowplow-punctured-28d19616f707@spud>
 <ZQ4PR01MB1202F016AD1F1E699429DDC0F2DB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260813-presoak-scarily-b6cdecfcb7cc@spud>
 <ZQ4PR01MB1202CD24FCDA9039EDF2C7A0F2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260814-reverb-mourner-283116bcc014@spud>
 <ZQ4PR01MB1202BE1034795F1FBCF18076F2A72@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260818-recall-onion-3279fe070ccd@spud>
 <ZQ4PR01MB12027CF8ADC7A2B39F7FB32CF2A52@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
In-Reply-To:
 <ZQ4PR01MB12027CF8ADC7A2B39F7FB32CF2A52@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1137:EE_
x-ms-office365-filtering-correlation-id: 8b4b38be-3f66-464b-dd6a-08df04038d41
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|376014|10067099003|56012099006|5023799004|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 psLvidVG6NbGatjAOoiDMv+21FZLlLiCbapHFQINT98A4sPbf4EEfW6Cx6rr3oN0LjIevhPwOiYXC+9UWYFpYHDfjiV/xj2ibe+c9ncK185LGegfJAoqjcym4S2/50/t7IVmsB11cI1iADF9NLl8WcljmRO+7PRBlEi9TM1RiXYyu1MEuVf60pi08XYzUt+mpK0He310rv4TMN3vgX6EcCStU3joH9loBfLhG1U4Lduvd5wAPv1bjzN6PcWqFDxUIVSvj5BoZl8WpjRzXVEx+Dpa38LY2bbDA1z9Lp6Lq5k9tpy7LGSgSCN2bzaFlrkfncyaS6pzUy0nInJ1Ew1Pp1jM2Le0VmpZMPXMcDA8+8aVQmT3xinMd18krhHnkcAtsHOjztzOqXft/ZDHAIuC07sqkF8c51sS6oRzTLiBH5riRS09BZ97vryu4xkhPizVNcfBIVQKs/2RaQIqidDhOMRoFNBzO9s8Ly7uco8JgWIzPt1TIEcWnpGWf5+6HObCQwUD4q9DKmC5fnIW16MYXMx2dSBtsswEF2XdBF2aNNXzklPU7Zb1+B32D8EjLY+T
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(376014)(10067099003)(56012099006)(5023799004)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?POqroeNCg2SAKczo3Qd0e65aGSLrpCyrKMnxCViEBNU8gSof2rudu5Jwf/Dk?=
 =?us-ascii?Q?fb3L2/YKouP3iXGVobgUdpL7DL2pI4NuA9lAH0AQcl6K0f8wa4M8pjwmg1Ai?=
 =?us-ascii?Q?r58SH0n5JgWUHTXpv07WoUVTimeYvJyb26Mefaj75/VLUppQFPFOkU/kJiG7?=
 =?us-ascii?Q?6oEQWJzYxcuYIiKtfhfw4GXwresmeokYiJDbwjhTPPwjvGWtV9Z+CLKQt3Sy?=
 =?us-ascii?Q?+gh59DklNpSXqentj4DlCZDG2KFZYrsdy/xLpVxg9D5Dh8ggn0cdKuNiLpii?=
 =?us-ascii?Q?Bj1JRU3oYv/2FqvRfs9jRi1+Rrbhi5muZx/9kRWSxf/P6sg3ri4KzU2w4iAR?=
 =?us-ascii?Q?WQ/opmvOUidR8+hydB/yRn7x4R3ES8OkxHyRDkLryhq0/3YAOGikpFaVjE75?=
 =?us-ascii?Q?g+u2p/rooYeJV7+YbGKZSs24F7ATxTSLYHrUQKWcVU6js23WBKs++DocWP3j?=
 =?us-ascii?Q?ZAHLmRx19J8/NKIpT1kPWRKddF7+0uCIoSJGL1+R7cHJjauC4qQTnUmsz6tH?=
 =?us-ascii?Q?tuyxqYTcvNAisKTopCtIUxilx73TVB2IcpRMnCn/hCsliQG2ByGNqOn9rVu+?=
 =?us-ascii?Q?zhbuN6uh9iyyxWfAFwJ0lMfQBrFZfdbzJMxxtlnQehjbLmWyVrEO34CqS8RN?=
 =?us-ascii?Q?n3aFv3wx30rZ2S8Q4hWNeRRmDZ2hQH1jZF3i9uSumzOBMQ+KhaN/Y/tCH96/?=
 =?us-ascii?Q?B7mP/+Wv0Awxn8gQ/LicnK3lrmKaYWCM+N+Lg0gPHbf9tyy//aU3WuuOQ3o4?=
 =?us-ascii?Q?fkhjJyQJ+TTuxKQYjXp+r7FophhP1mGxgbpSa0bADyZrXNm3PB7bdxKi8uUM?=
 =?us-ascii?Q?ocUiCvmp2PdNgm/jYol3zm9A3ff5h0nNS7o+eLwfDS0u2bKNOcErBcwN/+dr?=
 =?us-ascii?Q?/c+0k2yVsgTtg3pluxZmi5cFF+N2dFFaLXAQpyTq+9X+c3+BTikVK/qL+iOt?=
 =?us-ascii?Q?r6Ot93/V5tbYh9ZFndVVy7WuagnOknqDrIyLsuKpwXn04qZkqIizFHUFSM4M?=
 =?us-ascii?Q?tvz72531U+gC4bRDrCBUg6RF2dsRLPx2Uuh3CImgWlfKZq498EEzyJV3xOI2?=
 =?us-ascii?Q?MB9Z8ZL7Lh09pB75GhV39A/TcLSEW3MyDwvQIepk+NGbGcRtvnooGxzWq3YK?=
 =?us-ascii?Q?tgHA9xk+PXB2SRZw3ORPOrq2jD4RZyzzhvrakLMcEYuUAqAuMHCmuImuRQAA?=
 =?us-ascii?Q?ih58ins4dJy/SaTIRr+WtevW7yYP5RUaclCgum5T+dM4/AuTZESi/h1z0JFM?=
 =?us-ascii?Q?01Gw2TRzgU+nAfrfidqJMVcyZhjKm6HSYOC4CRKzbwdBPDAG7/v/QAc/5JBN?=
 =?us-ascii?Q?r8pLycrE1HETM57ZyeddTMRByeDZR7uVZBvGtICY1qqpLC8F1WVKOvBlJfeb?=
 =?us-ascii?Q?rnIDkmkcU5KMo4s0NwRzW54F5/xJjb3gMdJtNgorgy/v115p76KgYJHHf00N?=
 =?us-ascii?Q?9Kb0mfSAgAVcgwYXhCkKYAqVf5BI5z7SYiRPG6FKQJKR1II/zq8g4i8timQQ?=
 =?us-ascii?Q?M3tJU48ZglkpdW0bSeQvBJ2mIz7NMt/+l301jJ6aCyIwkgEj1VIDjGWBYs/8?=
 =?us-ascii?Q?OqcHI63I3QpIHnTMec+2XyPDKZXTTaawfFqFvYndWAsR7NAuhRIcSYdbkQwr?=
 =?us-ascii?Q?0+uEAHb5XUHeS3WOtaIDz2B4+IEPNHMwS7sRZVCcL780OZ4lsBTlZ5FK1/s7?=
 =?us-ascii?Q?4861gpLvGZvNK3UQm0mSNhcyCOFfmko4y/B+HQQDkWmdxU51UdALe369ohCx?=
 =?us-ascii?Q?JGWdkVBvedQCnJJ2rH7xNj8Zh6VbN0g=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4b38be-3f66-464b-dd6a-08df04038d41
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 06:22:21.0395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U6S6gK4fVOK1C0W2zVpfYShONqBCf+oCnhLrOiGHuYesgzvu7P35SVh6BE5TnjxaC7lYYutD4j2yJLDaPbFFZzBfLRQaQoA53yBy+HXfYvt33qOw7yWHChyceza7r/Y2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1137

Hi, Conor

> Thanks for the review.
>=20
> > On Mon, Aug 17, 2026 at 01:27:08AM +0000, Changhuang Liang wrote:
> > > Hi, Conor
> > >
> > > Thanks for the review.
> > >
> > > > On Fri, Aug 14, 2026 at 01:13:38AM +0000, Changhuang Liang wrote:
> > > > > Hi,Conor
> > > > >
> > > > > Thanks for the review.
> > > > >
> > > > > > On Thu, Aug 13, 2026 at 08:10:12AM +0000, Changhuang Liang
> wrote:
> > > > > > > Hi ,Conor
> > > > > > >
> > > > > > > Thanks for the review.
> > > > > > >
> > > > > > > > On Wed, Aug 12, 2026 at 10:37:16AM +0000, Changhuang Liang
> > > > wrote:
> > > > > > > > > Hi, Conor
> > > > > > > > >
> > > > > > > > > Thanks for the review.
> > > > > > > > >
> > > > > > > > > > On Tue, Aug 11, 2026 at 05:36:19AM +0000, Changhuang
> > > > > > > > > > Liang
> > > > wrote:
> > > > > > > > > >
> > > > > > > > > > > > On Sat, Aug 08, 2026 at 06:50:53PM -0700,
> > > > > > > > > > > > Changhuang Liang
> > > > > > wrote:
> > > > > > > > > >
> > > > > > > > > > > > > +static int __init starfive_socinfo_init(void) {
> > > > > > > > > > > > > +	struct soc_device_attribute *attrs;
> > > > > > > > > > > > > +	struct soc_device *soc_dev;
> > > > > > > > > > > > > +	const char *machine =3D NULL;
> > > > > > > > > > > > > +	struct device_node *np;
> > > > > > > > > > > > > +	struct regmap *regmap;
> > > > > > > > > > > > > +	char rev_char;
> > > > > > > > > > > > > +	u32 rev_id;
> > > > > > > > > > > > > +	int ret;
> > > > > > > > > > > > > +
> > > > > > > > > > > > > +	np =3D of_find_compatible_node(NULL, NULL,
> > > > > > > > > > > > > +"starfive,jhb100-sys0-syscon");
> > > > > > > > > > > >
> > > > > > > > > > > > Remind me again why this is not just probed as an
> > > > > > > > > > > > mfd cell from the syscon driver?
> > > > > > > > > > > >
> > > > > > > > > > > > (Hint: please put this info in the commit message).
> > > > > > > > > > >
> > > > > > > > > > > The discussion result with Krzysztof at that time is
> > > > > > > > > > > recorded
> > here:
> > > > > > > > > > > https://lore.kernel.org/all/20260405-strong-watchful
> > > > > > > > > > > -m
> > > > > > > > > > > armo
> > > > > > > > > > > t-fd
> > > > > > > > > > > fad6
> > > > > > > > > > > @quo
> > > > > > > > > > > ll/
> > > > > > > > > > >
> > > > > > > > > > > One register should not be treated as a separate devi=
ce
> node.
> > > > > > > > > >
> > > > > > > > > > That's a different question. In the case of an mfd
> > > > > > > > > > cell probed from the syscon driver there would be no
> > > > > > > > > > devicetree modifications required compared to what you
> > > > > > > > > > have
> > now. e.g.
> > > > > > > > > > sg2044-topsys.c
> > > > > > > > >
> > > > > > > > > This seems feasible, and I can introduce this
> > > > > > > > > modification in the next
> > > > > > > > version.
> > > > > > > >
> > > > > > > >
> > > > > > > > In fact, you don't even need the mfd cell, because your
> > > > > > > > driver is going to be in drivers/soc/starfive anyway? You
> > > > > > > > can just bind directly to the
> > > > > > > > sys0 syscon I think.
> > > > > > >
> > > > > > > I suddenly realized that I missed one issue:
> > > > > > > starfive,jhb100-sys0-syscon is already bound to the PLL
> > > > > > > driver by default, I
> > > > > > can't use it to bind another device anymore.
> > > > > > >
> > > > > > > which is why I used
> > > > > > >
> > > > > > > np =3D of_find_compatible_node(NULL, NULL,
> > > > > > > "starfive,jhb100-sys0-syscon");
> > > > > > >
> > > > > > > in jhb100-socinfo.c.
> > > > > > >
> > > > > > > So it seems the MFD cell approach isn't really feasible eithe=
r?
> > > > > >
> > > > > > You could, in that case, probe the clock driver using the
> > > > > > mfd_cell like sg2044-topsys. What else other than the pll
> > > > > > controls and the soc info register is in this register region?
> > > > >
> > > > > We don't have any other drivers right now in this register region=
.
> > > >
> > > > I'm not asking about what's got a driver right now though, I am
> > > > wondering what else the registers in this region are for.
> > >
> > > Here are some registers related to debug functionality.
> >
> > So probably nothing else that linux will ever need?
>=20
> Yes.
>=20
> >
> > > > > So does that mean I can revise it to the format below:
> > > > >
> > > > > static const struct mfd_cell jhb100_sys0_subdev[] =3D {
> > > > > 	{
> > > > > 		.name =3D "jhb100-sys0-pll",
> > > > > 	},
> > > >
> > > > > 	{
> > > > > 		.name =3D "jhb100-socinfo",
> > > >
> > > > Why would this be needed? The driver with the mfd_cell would be
> > > > the same one that provides the soc info, no?
> > >
> > > My understanding is that one driver can only bind to one device, so
> > > the PLL driver and the socinfo driver need these two devices
> > > respectively, and thus cannot share one?
> >
> > Correct, but I am talking about the socinfo driver being the one that
> > calls
> > devm_mfd_add_devices() to create a device for the pll so that in the
> > end there are a total of two drivers, rather than create something
> > identical to sg2044-topsys.c that does nothing other than initialise tw=
o mfd
> cells.
> > May as well consolidate the mfd_cell definition and call to
> > devm_mfd_add_devices() in one file, since it would be in the same
> > directory as the socinfo driver anyway.
>=20
> Okay, I will use this method.

During the process of attempting this modification, there will be accompany=
ing changes to the PLL driver.=20
The main changes include the following:

1. Addition of platform device ID table: A new platform_device_id array is =
introduced, enabling the driver to
be matched by device name when no OF compatible string is available.

2. Dynamic device node resolution: The driver now attempts to obtain the de=
vice node using dev_of_node(dev).
 If the device has no node of its own (as is the case when instantiated as =
an MFD child cell), it falls back to=20
using the parent device's DT node (dev_of_node(dev->parent)). This ensures =
the syscon regmap can still be=20
correctly retrieved.

The current initial draft of the PLL changes is generally as follows: Do yo=
u have any better suggestions on
your side?

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

	const struct jhb100_pll_match_data *match_data;
+	struct device *dev =3D &pdev->dev;
+	struct device_node *np;
 	struct jhb100_pll_priv *priv;
 	unsigned int idx;
 	int ret;
=20
-	match_data =3D of_device_get_match_data(&pdev->dev);
-	if (!match_data)
-		return -EINVAL;
+	match_data =3D of_device_get_match_data(dev);
+	if (!match_data) {
+		const struct platform_device_id *id =3D platform_get_device_id(pdev);
+
+		if (!id)
+			return dev_err_probe(dev, -EINVAL, "no match data\n");
+
+		match_data =3D (const struct jhb100_pll_match_data *)id->driver_data;
+	}
=20
 	priv =3D devm_kzalloc(&pdev->dev,
			    struct_size(priv, pll, match_data->num_pll),
 			    GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
=20
 	priv->match_data =3D match_data;
-	priv->dev =3D &pdev->dev;
-	priv->regmap =3D syscon_node_to_regmap(priv->dev->of_node);
-	if (IS_ERR(priv->regmap))
-		return PTR_ERR(priv->regmap);
+	priv->dev =3D dev;
+
+	/*
+	 * When instantiated as an MFD cell of the sys0 system controller this
+	 * device has no DT node of its own, so use the parent syscon node.
+	 */
+	np =3D dev_of_node(dev) ? : dev_of_node(dev->parent);
+	priv->regmap =3D syscon_node_to_regmap(np);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "failed to get syscon regmap\n");

 static const struct of_device_id jhb100_pll_match[] =3D {
-	{
-		.compatible =3D "starfive,jhb100-sys0-syscon",
-		.data =3D &jhb100_sys0_pll,
-	},
 	{
 		.compatible =3D "starfive,jhb100-per0-syscon",
 		.data =3D &jhb100_per0_pll,
 	},
 	{
 		.compatible =3D "starfive,jhb100-per1-syscon",
 		.data =3D &jhb100_per1_pll,
 	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jhb100_pll_match);
=20
+static const struct platform_device_id jhb100_pll_ids[] =3D {
+	{
+		.name =3D "jhb100-sys0-pll",
+		.driver_data =3D (unsigned long)&jhb100_sys0_pll,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, jhb100_pll_ids);
+
 static struct platform_driver jhb100_pll_driver =3D {
 	.probe =3D jhb100_pll_probe,
+	.id_table =3D jhb100_pll_ids,
 	.driver =3D {
 		.name =3D "clk-starfive-jhb100-pll",
 		.of_match_table =3D jhb100_pll_match,
 		.suppress_bind_attrs =3D true,
 	},
 };

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

> >
> > >
> > > >
> > > > > 	},
> > > > > };
> > > > >
> > > > > static const struct mfd_cell jhb100_per0_subdev[] =3D {
> > > > > 	{
> > > > > 		.name =3D "jhb100-per0-pll",
> > > >
> > > > Why do these other ones need to be modified?
> > >
> > > I was thinking, since sys0-pll has been adjusted, would it be better
> > > to also
> > adjust per0-pll and per1-pll together in a unified way?
> >
> > I wouldn't complicate them with things that they don't need, so it
> > depends on if these other syscon regions contain more than just PLLs
> > and if there'll ever be drivers for the other stuff in those regions.
> >
> > >
> > > >
> > > > > 	},
> > > > > };
> > > > >
> > > > > static const struct mfd_cell jhb100_per1_subdev[] =3D {
> > > > > 	{
> > > > > 		.name =3D "jhb100-per1-pll",
> > > > > 	},
> > > > > };
> > > > >
> > > > > static const struct mfd_cell jhb100_ pcierp _subdev[] =3D {
> > > > > 	{
> > > > > 		.name =3D "jhb100-pcierp-reset",
> > > > > 	},
> > > > > };
> > >

Best Regards,
Changhuang


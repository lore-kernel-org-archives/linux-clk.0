Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2107.outbound.protection.partner.outlook.cn [139.219.17.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B00E2D9EFF;
	Mon, 17 Aug 2026 01:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786930970; cv=fail; b=oM+IK66e8loz3ZZvRgTGbSoS/vx8+T0nUPvRyEwpBeEC8ZPwjsOLjp4eql+qfKKFq0mCfGwt5AhOlb8C2E3m6F3sk1SX7tG35Sqg/WUGpFXz9KvlYetwuDgUeyGVGwBBdaEj3z1vQeu6/wmKZs7y18Bn+2z2c8zwh9+fq24A56Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786930970; c=relaxed/simple;
	bh=VR3ujE1vyzCGKh81YOOfbeSj/CcCnUA/vgPaVKpDsck=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CDoPoLjJpZ6V2MFGeSXy3HStVgGmZhqK98XsKuvuYuaIT/7MkQagpeh9D6+rMsbMWzbmGLEnjt1NhjDjJHuFtQkQwsfTwXkSEgkjD6hU217qB4UaOxr8SCyH8PeklvStkfVgt2D9G7hcNs/VwqDM769z1V6FeZ+PY2lo5tx7/uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzZXn36F1CYCXxnKUlG2xrqjTW/8hjX+JTwgfsB++8e4WMJibrBw8itoyayH3QykWqCI9pGQnN7dtFk+6aZKduj2us/p/bVGHWTmYk+A5uJ/AYSQGhXGb/0xY46y23sudLapK6R/lgWImm15mMPApZJfP+odyXv/fcQlaNMZd4P9KRu9P0ptwN+jJY/w79/wk2rk06SGeqZvXqMZSRnA30Ad7eXwgL9kEHXIj0zJi6m+axSriePxkJnTx9kShXEig3sNl6RwHYpED05lOijC2Cxt1wdUBttGbPp5YQ4NqoSvi7zt9uYkjDh55gAprNuLZ3n4IGCENCrky324sFJ1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hmm4y/6HKG94OfkN7Ufitkm9OwGgXsuei5SR8DX+LM4=;
 b=RlKmZgOHbqwlSnmgciIRVayo3OyqXkctsDJSj23M2nJnlbudz641L85GL/qXMDcVVB9acZoQ98yKJ78QXUnG8R9Ps5zVovPpcIyFLlPZv7QWOibmJfvGVMRwQCNMN1Y5+WRNWFLt/gbquQNF9mGVHn7IcGvdD5RwmcoFsq9IDaJaoAvKGqTBSj1We55/DC26316d3/lsMGOQr5Pt11MuLeUhymQD7LMfRB2wtdHR2GlqEMBjc+xlKMtV1GDMTymAZAEfUheMAq9/ttCuRMkT4zgh9invj3KRCOX/c4EJusexmYkan2FmsRDN80w7qoJYx7hormhCA8wIW5uyTN5orw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1218.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Mon, 17 Aug
 2026 01:27:08 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 17 Aug 2026 01:27:08 +0000
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
 AQHdJ6GQ5ts+ksAe6k+ENksiQTa0y7aXdLuAgADirHCAAL8NAIABJ12QgABaIICAAQ8eIIAAkEOAgACNr/CAAM//AIAD6sTA
Date: Mon, 17 Aug 2026 01:27:08 +0000
Message-ID:
 <ZQ4PR01MB1202BE1034795F1FBCF18076F2A72@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-8-changhuang.liang@starfivetech.com>
 <20260810-caress-rack-45615c8d9747@spud>
 <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260811-populace-afflicted-40a40e0f484c@spud>
 <ZQ4PR01MB1202DDE6C255441E1FC4F916F2DC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260812-snowplow-punctured-28d19616f707@spud>
 <ZQ4PR01MB1202F016AD1F1E699429DDC0F2DB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260813-presoak-scarily-b6cdecfcb7cc@spud>
 <ZQ4PR01MB1202CD24FCDA9039EDF2C7A0F2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260814-reverb-mourner-283116bcc014@spud>
In-Reply-To: <20260814-reverb-mourner-283116bcc014@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1218:EE_
x-ms-office365-filtering-correlation-id: 566a0273-103e-4ca4-c178-08defbfea772
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|22082099003|18002099003|56012099006|38070700021|5023799004|10067099003|4143699003;
x-microsoft-antispam-message-info:
 tTsepQTBWHcZeDq19E+LqHuNwH0EElUjg1Wg9bsgpl2kV1aa5BllniMrH5IwU0mc4Ct37yB2L/0lnRoYffqs/PbQVSRISyrexwreTPCyw5cj8Mj3LNeQwvndq5ixnqUsG3ul+SNeniKb6yw8B4jAVL/eYbcKZfSAJp5EZQiVY15CvnFJd72OgHe8pilX19ooV9IYCH4bl5BLi+fk8J4OIS7K4RylYaPbGDHCg7zNjzQxU49AJAGGjFZ7RBNVB+x4xveoDL+j+tGhQVSZKyNZg5uR+WtgLqaSFaLl5VwAbJ7a9d/k3fA2xlO4y+iYogxZLTqucYEMsu7zzaWwHyb9a5vnSY9Z+q9EnamPVkCibMcAdxvkUUZz0b9muierrgxdFvCTJNukOWI4ZRPCDkAVNu/7sV5uYPvJKrE3nLW5xR2xtvrSUP60StxBB5cEapGMRMtut5O+YJKISVZwSTiLRdVUvhWRsw5szuzsbZGx7DNQwlk7V/07C01lrsF3AVbNbaX8dqYZirjtH5q5QA5yxwrc83icOelvRWppUUDhaG7H8QPeX9Yk1Wgq4fLgNuoK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(38070700021)(5023799004)(10067099003)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dFvY2ofTTZap0DtIC5HQGWxD7C8rqdx+84HLQXM9ZluK93e1SL+8/AVfCqAx?=
 =?us-ascii?Q?lq5nomoRqsH2NC2vBaa+0VOVxpixXEkFZfQgMlhlD3Xq1ZvQlPM6Exzdznc2?=
 =?us-ascii?Q?W4wyG7fT+QadEKnNAYy+9xnmmUZEBQKVZAg7zO2rmT9w7PZ18JjKwFMJSppA?=
 =?us-ascii?Q?YOSkwq0qfDCFUCi+oIqm9YtyMMUv0OTy13RkQJi6iXGY554Eq4V+Z/00MxGQ?=
 =?us-ascii?Q?dCQRGCTREIMnIt/StDlOGN9SLw/3Elq281Fk/xXPYyJ1T3K4DPel6aaja6p/?=
 =?us-ascii?Q?P4pb68C2k7/8Yl6s1JMQQAC7eHAW2TOzIyRjQD8tITDDrs6HCsEcBHugUuoy?=
 =?us-ascii?Q?yPSO8pPQ9wBmnYVf3ZYm81V37gyyShFwXyQk1UIWK84PhT6KFa/cEr+EtIOM?=
 =?us-ascii?Q?+1th4x2WwH0D6ab2D/dV4p+Tki8OutzoO0oHydD+Hdo7mtqLrPPpRosN5FBu?=
 =?us-ascii?Q?XUwzyehy8qHizwCrRYTk6scoyqYiFlTa+f/RQz9QUKRumcDD71DHd+Xsbbak?=
 =?us-ascii?Q?qbyUuTDjaZY9YQkFprsx00ActeEbtPN543cHTsUfnba/g2H3UYkJ/a6U/J8t?=
 =?us-ascii?Q?dGFaU3t0wWyesQpDePFHRMP2AllXemLCpxTLoAsC7UU/h96SjCByGPE4bcYe?=
 =?us-ascii?Q?dRQITpTAKItyro2yTFuOcL7cSDHMl9jPsJdxlWhZMR85pkF9q7MiP5twj7v3?=
 =?us-ascii?Q?7KL0MdShaLUdSKlR7E6MYBXAW055khdwD6k2pg6pVUF3l84GA4YR5fZAQLZ1?=
 =?us-ascii?Q?ND0cc0LD9OzlyutVMXPU3nMx3ofUmwOjvyJ2trdsCI3207RRaDKj3EHO5uru?=
 =?us-ascii?Q?kGyyG/YZxiYjrYouEXODCUd+3LTd8u8hgIS+1aKEJUVbPI3XHGj4AsXbfyLc?=
 =?us-ascii?Q?v0LI2VW5pClp19oghMS2+meDLEg04Xfpz8o/sUrvHQ+MFWgAo2r5HtCj2jIa?=
 =?us-ascii?Q?6v1472L/ShLwGtNcjaP/++rcwxTjVqDlla21KvgwrvvECh4jESVEgZcFKKxc?=
 =?us-ascii?Q?Cxu3vbJDiQoTj/1suL5DGe3t+7K8blPrpqBNcrujW6wxUeYnm0oHhJAOBUPW?=
 =?us-ascii?Q?/R6tkv8Z2S1R+vliV+zgVYTX+k0mvot1kIoaN/6eh7+BYBQ2GWKcg80EgPa8?=
 =?us-ascii?Q?zPh+se/g6pWAsbgAiNwui3DP9ZqAxcMHq85AaHdD/xg3iKpmtgN5sjQHmEjK?=
 =?us-ascii?Q?DrrrL4FRsOud9WQRJNY32WcgHeVGcgBJ7bP/FxXruf/ko8a0T93BGKY7Av4r?=
 =?us-ascii?Q?Gls/AdVuIfL59lhLhq3yWXoVVbQ8h3QwJGrkhbzhhZrgi1hGcrhz4PDPQB9e?=
 =?us-ascii?Q?Z8nA+krgq3apBOMln01aISg4H8WtkJW3n5FZL6oEwR7Xps0rX2opoOWqxRRn?=
 =?us-ascii?Q?tkPn1ZtIvzMZOHRzH3ezZP1XG+fNaBhRpsnlRdu+w0PDwIAJ+W4iVmiVa2WG?=
 =?us-ascii?Q?0MIumrxkeG788AybYZUs8fRytKHXSxNgJRl0bvIXfMXbyu5+XJjA+oBryS1i?=
 =?us-ascii?Q?LQKYn4Z/jQ4FLSD9kf8QL4bItf3XL4myGNgQh/R+1kRMhw1kbd7597XQIBKw?=
 =?us-ascii?Q?Xi4+FIDV+bvUBhBAtFc98+czKWbOSLz0RtwTFCb0SYpD/jUHFDTRGY1KZoXz?=
 =?us-ascii?Q?gviRekPGZ0RXIILs5ysZSDjhNwuYCdLjSCesFi382P2TbE0pMhlNj9XoTac6?=
 =?us-ascii?Q?wuVihbaoH3/wHNeqtkryfc7EbgIsofobVkOKWCQrm/MRiPbKfOT6l/JBf7g4?=
 =?us-ascii?Q?ftTv47WYtk89pr5QFTfIF5Rt6aZLXiA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 566a0273-103e-4ca4-c178-08defbfea772
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 01:27:08.2241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kbE1zS+UgY2inC+R/qhMqsZOAhqD6A/aZj/4ZpV/Qf4hZ4z4qa48DCjqwaJvXKW8fkZdxWtQn3XGIhdW1exIaebqoCvLoSXVN49lX7PThEfb4Ib5eV2N8FMxj9ucHIV2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1218

Hi, Conor

Thanks for the review.

> On Fri, Aug 14, 2026 at 01:13:38AM +0000, Changhuang Liang wrote:
> > Hi,Conor
> >
> > Thanks for the review.
> >
> > > On Thu, Aug 13, 2026 at 08:10:12AM +0000, Changhuang Liang wrote:
> > > > Hi ,Conor
> > > >
> > > > Thanks for the review.
> > > >
> > > > > On Wed, Aug 12, 2026 at 10:37:16AM +0000, Changhuang Liang
> wrote:
> > > > > > Hi, Conor
> > > > > >
> > > > > > Thanks for the review.
> > > > > >
> > > > > > > On Tue, Aug 11, 2026 at 05:36:19AM +0000, Changhuang Liang
> wrote:
> > > > > > >
> > > > > > > > > On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang
> > > > > > > > > Liang
> > > wrote:
> > > > > > >
> > > > > > > > > > +static int __init starfive_socinfo_init(void) {
> > > > > > > > > > +	struct soc_device_attribute *attrs;
> > > > > > > > > > +	struct soc_device *soc_dev;
> > > > > > > > > > +	const char *machine =3D NULL;
> > > > > > > > > > +	struct device_node *np;
> > > > > > > > > > +	struct regmap *regmap;
> > > > > > > > > > +	char rev_char;
> > > > > > > > > > +	u32 rev_id;
> > > > > > > > > > +	int ret;
> > > > > > > > > > +
> > > > > > > > > > +	np =3D of_find_compatible_node(NULL, NULL,
> > > > > > > > > > +"starfive,jhb100-sys0-syscon");
> > > > > > > > >
> > > > > > > > > Remind me again why this is not just probed as an mfd
> > > > > > > > > cell from the syscon driver?
> > > > > > > > >
> > > > > > > > > (Hint: please put this info in the commit message).
> > > > > > > >
> > > > > > > > The discussion result with Krzysztof at that time is record=
ed here:
> > > > > > > > https://lore.kernel.org/all/20260405-strong-watchful-marmo
> > > > > > > > t-fd
> > > > > > > > fad6
> > > > > > > > @quo
> > > > > > > > ll/
> > > > > > > >
> > > > > > > > One register should not be treated as a separate device nod=
e.
> > > > > > >
> > > > > > > That's a different question. In the case of an mfd cell
> > > > > > > probed from the syscon driver there would be no devicetree
> > > > > > > modifications required compared to what you have now. e.g.
> > > > > > > sg2044-topsys.c
> > > > > >
> > > > > > This seems feasible, and I can introduce this modification in
> > > > > > the next
> > > > > version.
> > > > >
> > > > >
> > > > > In fact, you don't even need the mfd cell, because your driver
> > > > > is going to be in drivers/soc/starfive anyway? You can just bind
> > > > > directly to the
> > > > > sys0 syscon I think.
> > > >
> > > > I suddenly realized that I missed one issue:
> > > > starfive,jhb100-sys0-syscon is already bound to the PLL driver by
> > > > default, I
> > > can't use it to bind another device anymore.
> > > >
> > > > which is why I used
> > > >
> > > > np =3D of_find_compatible_node(NULL, NULL,
> > > > "starfive,jhb100-sys0-syscon");
> > > >
> > > > in jhb100-socinfo.c.
> > > >
> > > > So it seems the MFD cell approach isn't really feasible either?
> > >
> > > You could, in that case, probe the clock driver using the mfd_cell
> > > like sg2044-topsys. What else other than the pll controls and the
> > > soc info register is in this register region?
> >
> > We don't have any other drivers right now in this register region.
>=20
> I'm not asking about what's got a driver right now though, I am wondering
> what else the registers in this region are for.

Here are some registers related to debug functionality.

> >
> > So does that mean I can revise it to the format below:
> >
> > static const struct mfd_cell jhb100_sys0_subdev[] =3D {
> > 	{
> > 		.name =3D "jhb100-sys0-pll",
> > 	},
>=20
> > 	{
> > 		.name =3D "jhb100-socinfo",
>=20
> Why would this be needed? The driver with the mfd_cell would be the same
> one that provides the soc info, no?

My understanding is that one driver can only bind to one device, so the PLL=
 driver=20
and the socinfo driver need these two devices respectively, and thus cannot=
 share
one?

>=20
> > 	},
> > };
> >
> > static const struct mfd_cell jhb100_per0_subdev[] =3D {
> > 	{
> > 		.name =3D "jhb100-per0-pll",
>=20
> Why do these other ones need to be modified?

I was thinking, since sys0-pll has been adjusted, would it be better to als=
o adjust per0-pll and per1-pll together in a unified way?

>=20
> > 	},
> > };
> >
> > static const struct mfd_cell jhb100_per1_subdev[] =3D {
> > 	{
> > 		.name =3D "jhb100-per1-pll",
> > 	},
> > };
> >
> > static const struct mfd_cell jhb100_ pcierp _subdev[] =3D {
> > 	{
> > 		.name =3D "jhb100-pcierp-reset",
> > 	},
> > };

Best Regards,
Changhuang


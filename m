Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2138.outbound.protection.partner.outlook.cn [139.219.17.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E634352010;
	Fri, 14 Aug 2026 01:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786671008; cv=fail; b=DYby3US7Fjf307Ujq8xYvyj8TIewvMzI5YBJRrcagxjty61PiCFMXd6UzQ9gvv7nx+CLcd+n69rwD5ngw69wRUOtF0+Eq2iDB2NnSB9hUrzGevB6SGVFsFKbvqUw8qZa2Gg9FJxDpKH/wdfVYDx+1GH0ctJKlEaRaszskD/7fyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786671008; c=relaxed/simple;
	bh=7LDi2NsmDpgShHmajttH0Nw2XbyRwXWlnuHMUNMKcsw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LIbmxzbxHDtBE2zhjKqwTQMQ1Tm8MbIQ9033r2FLP7AgBYj30k+4dtVuHM7o58ntb/82jeqNPnRrTeDCMxLfjIrgGSnhUp3SXNAJmTmYyrfZ5hxsD5xGhcsMhqnJI0uQ2OTVluQgXGy8a+DcIHaWjp+HGCZNWJ0UEKLSlqgyjRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLsXKfgjc6AYZ/CKF2Y6oIrmK8qALnmPpMYYlz7jSkOVd3CgWHRG5dnvboF4RE4I6If3G0JliUK3wGrpYEcw0GM84DqarESDVmPzF2JDUWAUr2ci1EHk36Bw+BpSaHvpVNYz1avT4DEovs/ZJSKN/xqAJEQNvCSHVVnpaAHFIjgVMaxzYVFOVi2OHY8m9gFj2DvVDJrKMD5q1mDCtZdHY9A/j9svDDgDzi8oHRo1gOr7Odq+ZGnOaZZskkrBmrKZAZg5P37YXdgGkMxZD3IIiMYVYigL2kufn44HxdGVvUtiCXsd+CgVA0sYSelv0/X6mDqhtY2snCkVxOUp6GU8rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujsx2/lgDkLE+7kqd3MLuz8ATN/iDSKfC6knLghk53U=;
 b=HvsS4ChNI3vhGb3ZXNetoE96pJ+K6R52R75cTQRDIiKerfQkvxb6QRe9Vs9PvSLv92K6BJ8wrG3gVSb+Xeq2CNxx2WxScN/HTMXIvi5qf+z1igIVCZlRK05s44EgBjU4nKnnVV+QV5/rcD/KefUOCdCk7Ba/q9OJTUE1QmKb/n/b6Hhk6IxGVm1d54icS2FFmYYLJPg9eBq+NcHTBWb0kvpPww6x6fD+sqiXIuYKgPfcDFsfBNauMPFJpQVPXTjIGaVc4n0zb13GAtiJ6T+OnWMicYQ6Cp5AZWEMNpXzso/WUf+19qjSy7XyDn10kp9VAFzoV+Hzkm1+ZFSBHIJtrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1281.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Fri, 14 Aug
 2026 01:13:38 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Fri, 14 Aug 2026 01:13:38 +0000
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
 AQHdJ6GQ5ts+ksAe6k+ENksiQTa0y7aXdLuAgADirHCAAL8NAIABJ12QgABaIICAAQ8eIIAAkEOAgACNr/A=
Date: Fri, 14 Aug 2026 01:13:38 +0000
Message-ID:
 <ZQ4PR01MB1202CD24FCDA9039EDF2C7A0F2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-8-changhuang.liang@starfivetech.com>
 <20260810-caress-rack-45615c8d9747@spud>
 <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260811-populace-afflicted-40a40e0f484c@spud>
 <ZQ4PR01MB1202DDE6C255441E1FC4F916F2DC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260812-snowplow-punctured-28d19616f707@spud>
 <ZQ4PR01MB1202F016AD1F1E699429DDC0F2DB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260813-presoak-scarily-b6cdecfcb7cc@spud>
In-Reply-To: <20260813-presoak-scarily-b6cdecfcb7cc@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1281:EE_
x-ms-office365-filtering-correlation-id: 4eea29d0-cc91-483e-9479-08def9a145b6
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|56012099006|10067099003|4143699003|5023799004|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 7+fQphY5NvkdQA9JC7Ar026a/iBReFbDcmRSOuzWqy1X+yU0Mz6ADPFYSNBebAzVIzlYq0SoXfe7dR5jtA1XxTCkxVaj/DIQtsPnh7wka2WfX7b4Pi6RBjlPgVTI2foVTWBMFBaz82EnnjlHtPCf9fnn8tqP6oh4xtdvUdH1l0DNkwhHwndIorshCxBvinZqLkaGIK86bYa10/Cr5gcKZdGCT4Gdp8vUnfIc8Lk5pLCkGvhc0ZIWKNeBfkYD+JVzrlEdbkkvPQBA9jLQ71kcO1XzZvtCNlQ7ULpdrAXK24GgeFhCj5jh2Go+xD2T6I1RJYiVmX+HulTRev0pkLUDcdAKgMhgP4oZKNGceF3hMlqcdVDOyVoEssMSkzzDgVZlUXXcBquV0UWO63FOjSI/KbYkVvErOB3Rgev66p4qUEQ2s5Gu6UUYLbKvsk+i+IC+q6Drn1kQonapByI49ecCpOwHEXtRQl8+v1DWVSaV0Vxfd++1WLEaZpGYPOWJRwDbuU1Pt4DYKcztiwebYgyd3TY45kY3gCpYzyvuNaF4XoYqNExUFuiNrN+KSLPlGTFV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(56012099006)(10067099003)(4143699003)(5023799004)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tPrfz1rSkS+6H9gKSRxwk6tQSICiu/0hNd5IZARZeao9tVjuMVduw8sAqi7u?=
 =?us-ascii?Q?ytYENqukKIm5uQOgEwCKmJpEsgipbso1cnuAJ3ZM7Ljh1aZL5qWONYnzyDyp?=
 =?us-ascii?Q?AtmaxPci23y30bUv4eFjge7YlUy7Rdnp+ATflsq7wb836DArkWLO6qSM07d3?=
 =?us-ascii?Q?GH7JpG0GGn/krVuQgzD7jzPrHTeTeK8Xz27C0BTMseBo9aupuAf+RAJ8COLU?=
 =?us-ascii?Q?w5seVoErL5dgdnEMm2WdGq7MQTbOD3bEjjKUviikL7O88Cres98dqTre8Mqx?=
 =?us-ascii?Q?gWfNOTfkXWrvtmS/ZS3EQXvJM5JjIOqL4zb7r6/67bltwIiFODPlwTKERbhW?=
 =?us-ascii?Q?FO5lc8Xb2W5Jlq1b4SLj4d/EE/0kpPOjOtAMwNmL/Pt0M7luJE8sxj2Cs0xF?=
 =?us-ascii?Q?G+ZzQGdtDiddYTPoFsvxVhBNSgYejhHTnAGytQDLh0qSlnH+xCS8nFG50P9C?=
 =?us-ascii?Q?plfRMNiBT1pXm2iZTKO0AjGN7a8UQ8dEcRwbhLYnrUTztTs29bVPyOu5VNGk?=
 =?us-ascii?Q?8S5GENHrKCNZFQRsisEl4vprPe0N+aZYWbVFNsl/3FJnHQQzQ35KCkolq70h?=
 =?us-ascii?Q?+TwSsXBvYiZ0WsPPUMfN/xFf8Lqw40OnKUyMCKNkBZ+4KOqNnB6tL5oNv/0+?=
 =?us-ascii?Q?/mSG0ZXUoBfKjMVGgoXG+wVZua6A+X47wheuh84aJBJp7mzys64qVWg/uc/6?=
 =?us-ascii?Q?ZD0f0yuy9AmP3T0aLcFRU7LiHB6RP2TJiuvoqgkc23EAJrWwMY/h1qsNh7uG?=
 =?us-ascii?Q?1R9BA1GOkkxw6i38vkOsFfkcgoudvOQR20hohC9FwSitUIWTCHnN0tS380rY?=
 =?us-ascii?Q?7IgdC4uw7G11YRDMjm5iQWkdKvmPg3j42ruw5QdLyW3j7U/q3Z00AUYoOhjE?=
 =?us-ascii?Q?SSsRyWopNNz0vH2lWpb3oj1kUBF//rQ4mRPCzizqZ9/HS5S6cVpQiEE7FPAE?=
 =?us-ascii?Q?vSnxYGyZZeurnMwaVZN39GXpcSrkZODXnoQQvwOphlMkeBkq31DlBOmivnZj?=
 =?us-ascii?Q?Go0aFBNnSl6x7WJ8Dk5KRFadL09xXmfSDl/xbdxc6GdYlFJywfn4Pv4Cv/Dd?=
 =?us-ascii?Q?/A50h2GVuGcMUM7hdiUza148AHAur4eEKFLk15wRoUTSCx4DlogI8CmxvW9O?=
 =?us-ascii?Q?UYY9QnD3VxdVtOfIT9+yw0WHPTHA5DWfE1j09dbZ7nxuFiLLGMNitJhGEcAV?=
 =?us-ascii?Q?k1gfYWgzSW1YgTcsUQ+cUMh3+1i8jRwx7Yj8rBuAJfrvsZDBbHdSmuc7J6ok?=
 =?us-ascii?Q?jXf7xbsI5diSL3dsP+2QfVCu437ljrHsGQuQQjUH3tBTlVuh1jrs3sQ+1Fyu?=
 =?us-ascii?Q?KiITooA9ygwsuGjsocc7Cex2uRv41HT6OOfUaBYrzwk2wiVs6upbHlh89S1l?=
 =?us-ascii?Q?udRSHzx27aNVaADdaL9O9QhqPB0i4Kk3xgpDpGniysSM27ZNzBlVxDzCStSE?=
 =?us-ascii?Q?x+nUNW2V642lpTg1r73RjpU7gGsw3tqNauEUuaOFA78Vd8ssJfg7FIz7ken/?=
 =?us-ascii?Q?tjPxIG5bbCU4AmAUkS/gLFyUPsSctBIgX95FigVg7uttJM95n+NogTDCKxJQ?=
 =?us-ascii?Q?r6o5M1yh54doJVBW6wE0k89Y7N5QpNSocm3E3pctA/2IEQHxekgTt93AY7db?=
 =?us-ascii?Q?1R1MSKPf7QQK3E7nrS8YXsjO+h5ebAEb2PmlW2MAS7gFBzqtmzYPCPWluTm/?=
 =?us-ascii?Q?69TDXmbLS2/AtQbhlFsHjQZ6tgB7Ly90rQFulz8FTpDGEIIwqfZS4q/xYTMl?=
 =?us-ascii?Q?GP32mXnoV4hBWAiHqGD6Ihs9DaFw0ww=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eea29d0-cc91-483e-9479-08def9a145b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 01:13:38.7306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3Xzyrnxnf2HRSAu712otjW0GgQdfLTbf9eMojg8CW9qB8ctnpGdlbTSgmuvQv3xlb6/jRaqKumTaqw4f5IPqQ9TRdsjKZlzWrHl/NdLikCQVv6aj6q/hl0fp4dthato
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1281

Hi,Conor

Thanks for the review.

> On Thu, Aug 13, 2026 at 08:10:12AM +0000, Changhuang Liang wrote:
> > Hi ,Conor
> >
> > Thanks for the review.
> >
> > > On Wed, Aug 12, 2026 at 10:37:16AM +0000, Changhuang Liang wrote:
> > > > Hi, Conor
> > > >
> > > > Thanks for the review.
> > > >
> > > > > On Tue, Aug 11, 2026 at 05:36:19AM +0000, Changhuang Liang wrote:
> > > > >
> > > > > > > On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang Liang
> wrote:
> > > > >
> > > > > > > > +static int __init starfive_socinfo_init(void) {
> > > > > > > > +	struct soc_device_attribute *attrs;
> > > > > > > > +	struct soc_device *soc_dev;
> > > > > > > > +	const char *machine =3D NULL;
> > > > > > > > +	struct device_node *np;
> > > > > > > > +	struct regmap *regmap;
> > > > > > > > +	char rev_char;
> > > > > > > > +	u32 rev_id;
> > > > > > > > +	int ret;
> > > > > > > > +
> > > > > > > > +	np =3D of_find_compatible_node(NULL, NULL,
> > > > > > > > +"starfive,jhb100-sys0-syscon");
> > > > > > >
> > > > > > > Remind me again why this is not just probed as an mfd cell
> > > > > > > from the syscon driver?
> > > > > > >
> > > > > > > (Hint: please put this info in the commit message).
> > > > > >
> > > > > > The discussion result with Krzysztof at that time is recorded h=
ere:
> > > > > > https://lore.kernel.org/all/20260405-strong-watchful-marmot-fd
> > > > > > fad6
> > > > > > @quo
> > > > > > ll/
> > > > > >
> > > > > > One register should not be treated as a separate device node.
> > > > >
> > > > > That's a different question. In the case of an mfd cell probed
> > > > > from the syscon driver there would be no devicetree
> > > > > modifications required compared to what you have now. e.g.
> > > > > sg2044-topsys.c
> > > >
> > > > This seems feasible, and I can introduce this modification in the
> > > > next
> > > version.
> > >
> > >
> > > In fact, you don't even need the mfd cell, because your driver is
> > > going to be in drivers/soc/starfive anyway? You can just bind
> > > directly to the
> > > sys0 syscon I think.
> >
> > I suddenly realized that I missed one issue:
> > starfive,jhb100-sys0-syscon is already bound to the PLL driver by defau=
lt, I
> can't use it to bind another device anymore.
> >
> > which is why I used
> >
> > np =3D of_find_compatible_node(NULL, NULL,
> > "starfive,jhb100-sys0-syscon");
> >
> > in jhb100-socinfo.c.
> >
> > So it seems the MFD cell approach isn't really feasible either?
>=20
> You could, in that case, probe the clock driver using the mfd_cell like
> sg2044-topsys. What else other than the pll controls and the soc info reg=
ister
> is in this register region?

We don't have any other drivers right now in this register region.

So does that mean I can revise it to the format below:

static const struct mfd_cell jhb100_sys0_subdev[] =3D {
	{
		.name =3D "jhb100-sys0-pll",
	},
	{
		.name =3D "jhb100-socinfo",
	},
};

static const struct mfd_cell jhb100_per0_subdev[] =3D {
	{
		.name =3D "jhb100-per0-pll",
	},
};

static const struct mfd_cell jhb100_per1_subdev[] =3D {
	{
		.name =3D "jhb100-per1-pll",
	},
};

static const struct mfd_cell jhb100_ pcierp _subdev[] =3D {
	{
		.name =3D "jhb100-pcierp-reset",
	},
};

Best Regards,
Changhuang


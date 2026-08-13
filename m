Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2102.outbound.protection.partner.outlook.cn [139.219.17.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38D82C0296;
	Thu, 13 Aug 2026 08:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609490; cv=fail; b=YRdNKyREDofME4klAsMDP1zO01UzkuyviHhzAo7dloKqLh9u4alK/k6ZZ6slFevdR+rYldadkM9FGhdjolrrHtQ19RzT4fPoDku1d71Yh+TkVO2r9CAxh446c1M5FLG/4Sl9Vr3BBgvH5IVrsunmAUm+5KtnYztairiVRSd7O0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609490; c=relaxed/simple;
	bh=wyoSuPT4ykP6berG3LarM141QY3QXGxryqAQ6Q6y52E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SVcoPFnUxLXZljdURmsDhTXOFc7xCNwfSO/9994TKvZctHWyJJbiUAByRXe75DJM/FyymcB/v1XB+1oWAmqVEsks99Ka72niMlwWrfJO5rDrDA1Qx7xnBlq4D3d6Vkn4FQDWeLLzZ5OTbkQfMu0wjs+p94qea4Xdr11lh2SMfnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I11shw/mN3P4VsQzoQxVJKARm5hZ7x3phJRKoLxxrtmrqXRhRn4FHly36Lu6sm6GWfpi4txFBorp1w8iWk/xyOwCE8+8fT6m9bLKX+zq0mUMSJMgRcX9H8j6XEzU538juLAKQJGEuPjkuEuIbkDhULwae6HIzD7Uf1/0U3fAEhhkP55gJVtQhkFp0bzyHPMefBO9tgqigNreJbtItun0bMvA2bXACtdrYeWxtvPRNTP+ieRucyhf6YsH+vv+CAldMKUSwxgOwwrqtHfeg9YllpN2lKlK+RFdk9hSLPfNXTXdHhxIx2ODHv8SyKtz7b/v3MH5DO+eJQ99fSCwS0Y4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6Q28RFCokdz1NJ9uRUUm48vet1pfM7dZfopIejKzP0=;
 b=eGCyY0OOhY3CxU7Rn1boibwleXmMk6c7+FFiYkfirXyUGjyCVi6V1HFk7w5PTd2Gfe5dARp0h4kUNw27vwAu48JUrScdJfPWoc3HTl5H6LaJz+Gp0St81aEbe6TRgtfmMP0zD/hvp50ULJM7lXVfHdDHAm88kEVzzwLj1p0Mmto+ni/Ma4Na1DTA5WtjxTmYMNWWbaZYKSHc0ozP/XVGVuqJ3JbTEBdSDq/CPsKXb/K5Xa312ipR291SqsWmOiQKFM8B5WblNpsHx3piMrUmSYeCyeV/quWBmE9o/qxbuYuAjfOL+Czm98zv1B26eBcyLb0DBkl/6nhgV9FfK5cn+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1219.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 08:10:12 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Thu, 13 Aug 2026 08:10:12 +0000
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
 AQHdJ6GQ5ts+ksAe6k+ENksiQTa0y7aXdLuAgADirHCAAL8NAIABJ12QgABaIICAAQ8eIA==
Date: Thu, 13 Aug 2026 08:10:12 +0000
Message-ID:
 <ZQ4PR01MB1202F016AD1F1E699429DDC0F2DB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-8-changhuang.liang@starfivetech.com>
 <20260810-caress-rack-45615c8d9747@spud>
 <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260811-populace-afflicted-40a40e0f484c@spud>
 <ZQ4PR01MB1202DDE6C255441E1FC4F916F2DC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260812-snowplow-punctured-28d19616f707@spud>
In-Reply-To: <20260812-snowplow-punctured-28d19616f707@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1219:EE_
x-ms-office365-filtering-correlation-id: aa4c6979-edb7-41cb-6cc7-08def9124c92
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|22082099003|18002099003|56012099006|38070700021|4143699003|10067099003;
x-microsoft-antispam-message-info:
 PoMk31PgsPG8dLEfBEEQvBOV9KNcy44Bsw7gjNSDfJWyVX6pTxwIjE7N1VUSDWUnY6/kfGVV1Zk0cw1F4o2Z+eq2iF/uL7TqzxuiSfdMje/elgmiP13sKxwsGQMSR7t/DU7G6f3FI/O1LDHriFDG4+J2vCmdN0884s0RaObqXtvApylWfXH02rrSaQgWp13bGJ/o8sSckfMsUqUupzGSlr5MKJk06q2apalotQ6/m3nfKdE6rF+nxRGndf/NGn6HTtj+ArxBfYFri3OZJyo3kIQT1sSWlXohSsIN1beS/oGerXmcl2vDfpAbyPWQIinL5wHyQWJhtOkBYdw/GdmctEcq4zse5+RrNl5q8Rb1Ner7c21Xyz2u0zbrseiHafcDS9yHjp7AxHh7EWkGnWjVPCb2lwvy+JUDHHDIe7rvsriJwerqsST/m6BesxrCr8mb3OyTjFV2Ojkn2s2NODo2gdcBKro4ZBzuzGd1Hpr0niTDXELvZREqkFaPrSfMFQd2BRMb+/zzcg+3+chTLIYkVh6QjTjw95YecanNuJEiWwxM11Nm0UgxGKSIVUKhPGZq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(56012099006)(38070700021)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?S8SKyix8Grw1aakiz+j0E+SR2GfNDFcTE6taHHsjHl6Ec/k3rETcEtVKjHj6?=
 =?us-ascii?Q?mOBq989/CYW13FYGZkoH6rR6plbIsbL4RilAYkLdS+Se6hoc1+G/dQ1jI4is?=
 =?us-ascii?Q?AwXwzIc34OWlyd0+/LV0rw8K4tmn2zxfl+JOzE4NZaZkVoR/KK4FGDH87nQp?=
 =?us-ascii?Q?p5yfbUHu2ejG6ud9d7o+R358STshxqQpcGalGbFnrIGIgj1pL0el/2py4l+m?=
 =?us-ascii?Q?2GM68E1JY6uhWhmHNHrzg/izEh8ht9drDQt1pf1h5evQR+P7dlNgC38A0KiF?=
 =?us-ascii?Q?3a9vCk4FK2ADzusFHz+eehl8KMjarmTH9vPUfd7gB7w8Jjvws2Z46nCJt50d?=
 =?us-ascii?Q?oUY5EutXrEsRJdY3aBzdLQBTkXNoyBsv7O4NhsMTUo1bbkxIfw9d/CkUD2qv?=
 =?us-ascii?Q?NrGBnYkgqduhJ9mzvvyW6kHyLtfntbhFAtPylIikYNys2zvwj1VT6/9WDo2U?=
 =?us-ascii?Q?UidaTHcbKpQ50Y4/rKIwr6rhOVIg+Puvg04BcLd1O1tMzbLaFLUWI86ZaY5x?=
 =?us-ascii?Q?qwOPqzJ67ylvvIJXcxARpRrkX++bLYMdY20GrRb19ui0hjL+NZJqyxqVmUU8?=
 =?us-ascii?Q?pUrIhYVXUUNeAEePclENvRoUS96NhKQNSSLcnoTDyfSRqjdruxIO4JiILj8W?=
 =?us-ascii?Q?C22akf7iADqh61ILQzpUuRfLFZ3UfAvr8U4O811fF3y3zZihRS0173A6M1GH?=
 =?us-ascii?Q?DOdeMIk+cWjlSn+8TLUt6KiIFmPSEfnb8cOKH57eBDVBybh3QB4BXRyL3CTi?=
 =?us-ascii?Q?efdzhFdhbllW/D6Zif2NfZT06o2VmNT4vtTFIiL1VGDzCAR5xLVy6Lem/C6Z?=
 =?us-ascii?Q?rP67js273cOAUHuIut8fwzpfhWPoibgmMqYYSfdNQOpV4fwdn5stVmsUJjZW?=
 =?us-ascii?Q?krDfJSJLa1a0MrRSDLJ711AoYEH711sp774JsBQyd/InKc1Mbp4E9WbCBnZR?=
 =?us-ascii?Q?jFEW7jnjX/VqHRo0DtYRHHetgDetb/RZdHS2vvqJMe+AMkoKnB6i04846u+b?=
 =?us-ascii?Q?HCegFbSa3Hu+TcWxDcglliuvA2z+ftug7YT0jwEgWe5Fd+lj15KBe/Qy4Cb4?=
 =?us-ascii?Q?g3jrUj89coKLefaw8UPWHW4GWcJnB0A5IrMI2wunkYpvMDqEbX3YO295Xsj1?=
 =?us-ascii?Q?n5jvz96EtWAPIQRXwqoIOpLLMW/dW9uc2Xl6BGjs/HMPUj9LfZy1KAsZ3X+E?=
 =?us-ascii?Q?yrn4tuEdCumtgmXoqYjJZNomQxdNRuYdy41l+aGBI1mX8nhyYVwIjW1hDVJp?=
 =?us-ascii?Q?S8x7yUSrwRtPOAg7rX3r3tpRAtPgyARONGIZ2QuqArOZ1/8Z5iu1vVlCntZQ?=
 =?us-ascii?Q?n+FO+q4QmLLUQye9bgieqdQt3js0gLehvbuTGqtENtsNrwtHFBmERDtDb78q?=
 =?us-ascii?Q?KSUk8r1npUmzfmtRoxybj/OEWv0jRYqhVe9k0rFpsjoGc7XnvtuPk0FvVbvM?=
 =?us-ascii?Q?NrFjaQ70ZFDzv11ILfgEhoj2hW6y/wgFiCJuFGjROC3E0WsXinOvM50WMTC2?=
 =?us-ascii?Q?7CXgGpS54nhvufCW3aTmlRIcXJS2y8e92SW+s/AC40ikZ3boXB+8Xvs2oMe/?=
 =?us-ascii?Q?2lUhZJ+WB44OAshV0qQs6a45TvjTykfIpTdI/3AFSpYOtWGzv+vjVVqiNGmh?=
 =?us-ascii?Q?3xij90pcRPjr1EesRZfVQ0wKl9wD/kIqLCCbAdqKmn6cxd9Z1fYGBhmA0E3+?=
 =?us-ascii?Q?knm3l7KQ8vFnCe5raUNh6iD6jJiQwsuka/Gei4qwtAfcOLhWxsgCG1XEhMke?=
 =?us-ascii?Q?ZbY5XduEXue0IO5KwGG3n3h7iH8Mzn0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4c6979-edb7-41cb-6cc7-08def9124c92
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 08:10:12.2101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FxJOTF66lY7kmC62vjnZO6HJVDUlrCtHlYcDOicZw4VhV9+6EAqYcjAALFoASyVXqqjAI9afy3rYNkfOMT9K3DdkOwUkn469MrVKwPc09rfFmwpDMR1hPBnUqMoj+pAM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1219

Hi ,Conor

Thanks for the review.

> On Wed, Aug 12, 2026 at 10:37:16AM +0000, Changhuang Liang wrote:
> > Hi, Conor
> >
> > Thanks for the review.
> >
> > > On Tue, Aug 11, 2026 at 05:36:19AM +0000, Changhuang Liang wrote:
> > >
> > > > > On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang Liang wrote:
> > >
> > > > > > +static int __init starfive_socinfo_init(void) {
> > > > > > +	struct soc_device_attribute *attrs;
> > > > > > +	struct soc_device *soc_dev;
> > > > > > +	const char *machine =3D NULL;
> > > > > > +	struct device_node *np;
> > > > > > +	struct regmap *regmap;
> > > > > > +	char rev_char;
> > > > > > +	u32 rev_id;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	np =3D of_find_compatible_node(NULL, NULL,
> > > > > > +"starfive,jhb100-sys0-syscon");
> > > > >
> > > > > Remind me again why this is not just probed as an mfd cell from
> > > > > the syscon driver?
> > > > >
> > > > > (Hint: please put this info in the commit message).
> > > >
> > > > The discussion result with Krzysztof at that time is recorded here:
> > > > https://lore.kernel.org/all/20260405-strong-watchful-marmot-fdfad6
> > > > @quo
> > > > ll/
> > > >
> > > > One register should not be treated as a separate device node.
> > >
> > > That's a different question. In the case of an mfd cell probed from
> > > the syscon driver there would be no devicetree modifications
> > > required compared to what you have now. e.g. sg2044-topsys.c
> >
> > This seems feasible, and I can introduce this modification in the next
> version.
>=20
>=20
> In fact, you don't even need the mfd cell, because your driver is going t=
o be in
> drivers/soc/starfive anyway? You can just bind directly to the
> sys0 syscon I think.

I suddenly realized that I missed one issue: starfive,jhb100-sys0-syscon is=
 already=20
bound to the PLL driver by default, I can't use it to bind another device a=
nymore.=20

which is why I used=20

np =3D of_find_compatible_node(NULL, NULL, "starfive,jhb100-sys0-syscon");=
=20

in jhb100-socinfo.c.

So it seems the MFD cell approach isn't really feasible either?

Best Regards,
Changhuang


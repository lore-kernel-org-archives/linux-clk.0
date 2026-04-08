Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2111.outbound.protection.partner.outlook.cn [139.219.17.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2828335C1A1;
	Wed,  8 Apr 2026 06:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775629632; cv=fail; b=DGHupGtujHA9CO9+Jt+w3+fLBKxTXe5O+x3IgJlK3x9ICJMtdsFlI8Q14d2hg1EcXCWkgP0TfsefC8cMj87LQG3aKCC7ESheE/OPaVL9O1nWiGf38SyUWBKoJEyHWCwkSV8ze4DLMS9h0XQ0rEHJIxdRVIu1//oPauXljLV/g/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775629632; c=relaxed/simple;
	bh=V7VGsGwN0XeAY5lYqZTjKlpW5mexhfwES+jJdfmDdu4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sGDjk1BdOgC8z4udXtFpuLPFW5RgM15Pv/ajICcineqnjSqjh6UinGIYo22l19c48XSy3ssgH0sLR9c4BoHiFVZF+Lchs316aXAOWygZ4xpwm0C185ermtHjbVEUe+tbdBuWSgMsAcUiiRzSdF18k1p8/OaMmHLhHvswLRlEn8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtu0THbaTw7KmY2bDwdBmb/60386zz3eOv1v/fwq+vI4630KSkCm+9lDD7eKbTCXVPpoKuqeylDZ2Qc6EJkBVHMrEYCOzoq2w9mMTrO2kjIUwPq6Jc8ccP/jtDpPxTPNoegWyE1vGvFa+oIFaJJNqQy0+r5w0uFmh/Bvlh9BPEz1I0IDRiiQZhy41ckuIb4qN85GpJad/S8BbnU3iMbJ+Ynp/4Ev12mfNGQ6an6O9TXc36jiCUcysXqh6A97nrX9E5/S5i3VCE8plKDVVjnBW9Bfy777XMWIE0LMuJn2ujJ5yX5sFzhynTzwWBGLUJKrk9PSGK8WIecUDfuGH6rPgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7VGsGwN0XeAY5lYqZTjKlpW5mexhfwES+jJdfmDdu4=;
 b=ZTjp4XtollVRbA31g7CvN4y8GgO4HMqfhj3xrMOmbxhpe5GnAJgcy0Kr6eqY5xklp8DdeDzUIcz/PRaho83eZp/QhWjBcYgf1Ra+beUv1jgmc1QT0fJyXbfu3lo2/ZrAoAxCysRp4cbbYO51yKOD3Ny6fX3DlPsYwmuRJ6rZAhOV+KvBRi5E/uL2uKK09uyFTxn01yjnOXkUJh45FYma93Sg07PVpnpZDNv8CimdxhF1T/3yMbEJvl7VMPMl4urwRkEqjqBVhXmZT2Low9J7lzqMqYemZDmzCOIT12vfUQVmSfruEjBbLMAqIaNBMtFeG/CelMrsUYfL2vlOWOHS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1154.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 06:26:57 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Wed, 8 Apr 2026 06:26:57 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
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
Subject: Re: [PATCH v1 12/13] soc: starfive: Add socinfo driver for JHB100 SoC
Thread-Topic: [PATCH v1 12/13] soc: starfive: Add socinfo driver for JHB100
 SoC
Thread-Index: AQHcwy2+brZmrr/G30+nwu9e60DOC7XTxTEAgAD11/A=
Date: Wed, 8 Apr 2026 06:26:57 +0000
Message-ID:
 <ZQ4PR01MB1202C531265D6D261FFC479BF25B2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-13-changhuang.liang@starfivetech.com>
 <20260407-captivity-psychic-d2ee5c9109d1@spud>
In-Reply-To: <20260407-captivity-psychic-d2ee5c9109d1@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1154:EE_
x-ms-office365-filtering-correlation-id: da95a94b-50da-433b-39f9-08de9537d5a1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 tfIS/sail/JJC9YFN5pI7vyWRCoAwWkhQVuoh4CodqQ2oWbOzERZp0j7rIpCm92Pb3bpBJUHFtOBXPctStVxZ6FIb+auX5drY2g+COqfo+MgzHzspFfQpby+WOoKCOuuBWxGQ72lSsGQGRgt+V8rzh8odopS3WJnlt6RMbL+0Y+N/NNTCoofGUJkF/PUUr7wkAnjIXKQ3iqTIl5Qo88Nnf6cjvPtVkdgWUsBn9OPPPtZuP1rhCOUWaIn9ar4wVa8jDVlMnE3wTr4ZXupJvzXY6j38HMQajAAg6pA6Ot4DeunYSSzC1TjGLpipd17B+E8YLV2L4U/FKAt0vcX7g1mRDunPPJ7WsgK4gJRqU5+TQZ9Lp7+sleDWXfJpcbSEL+YQThQ9Qo1NGvoarrYkmnRH5Tu3tsmuoXJew7J/jxgaAWBmzdbWCYHtLYINoCwO+1g/nRox+vMsL1C9hAcRTC7txWayQJvyYC2KkXVrsK25gFFjVokecu0FFAzhkklflbGhrTOnEQct71pGA3EGO3BI3Ncd0xOn7KQ0p1UDS1hK5k6xXnzABdqaKFkyCeoTAkGyrydn670J1wHmh7txsXVis3R47qITD4Oc7qcB0dcApo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EqISOnnGyCen1Gt1jONdgYfA8fOFSzP89Ij78/2EsKIWYBSoSIi0a2erv1tQ?=
 =?us-ascii?Q?hVudPXB1AUNKefA+u78gjW08WZmLT6WR79foIeXDyQ6xhokSaCBpDkddshmh?=
 =?us-ascii?Q?stoRSdcHPDc3Qbni5h3QfiHcWKtUNAttlRLET/TnUqY0V4RY7yUakLFoVh6j?=
 =?us-ascii?Q?rioVHotqcSNjFF7aiGMyGM6ONQLorMk/SrdElfRDNkovprJsBFRpvX12F4S3?=
 =?us-ascii?Q?ZyTKG5eywlboNa6NeI6zH8IMxY3YZS15EzSLpNSBG2qwWh8IrZSJU7k6su/z?=
 =?us-ascii?Q?SkYIxuuM9+f4FWeB8CZAMCb3Gcx5m8EXjUeQmrbkG7p7k6tldffR9zakoWjv?=
 =?us-ascii?Q?rHH35rkwwg9kj+Nu1lRsr1ypSTd1ZLJI6XJTN/htZ+CEW79pQfDH6eriHw00?=
 =?us-ascii?Q?CBksdGqgk3CKh6H5P/XnLJv/wjC4OdNxd/l2yMF+Kkh1vp0Di6PZVsEyyHBg?=
 =?us-ascii?Q?8weYaYd5dTysWhLxSpPviq3uxkocyu/TnpNrtK0pkR2QIsZe1ZwfvoRhe33f?=
 =?us-ascii?Q?aDbXXQx/7YzK9Dg8IoU5Fufk0Hg2BmitD62TjyBB9eoa9xpCpmCyR4HH0164?=
 =?us-ascii?Q?8VqRgdDTAIve0SQv0Ok3pUF+bHZGxvbHHYiVsdlnSKxN7+60nW/1MYzcDafr?=
 =?us-ascii?Q?zXHZbGP4rf4KhDwJItM+TReldG74Tm1AqBa0e44clm7uOqstWWZjdfm2ptd4?=
 =?us-ascii?Q?sozTlsDN2q9+VUoWEXT2pkQO3dD7Zbe4Gvl06J1DuJJ6UaxyB4sVLRzptcqE?=
 =?us-ascii?Q?GapDLMbIGHRg3rHzswtDNazRYDEeFnMRf1qLR9mQ45tfGfRo3OeYzsL7yTtO?=
 =?us-ascii?Q?Nqg1dvJFhq6f6wz7prSCfsi/C7lCbSSv+Xg57r7Sej5l0VLCMCcQtAYj7T4N?=
 =?us-ascii?Q?Hqc2BynLvMtzx2GUVvwvDs5ZahFzQ0D+jUMmQJlZGluOxlLXFejOCGuwoCrR?=
 =?us-ascii?Q?ikLBw6o9iAPrq2NU446/lPzfeuW36lHlFiKQWWjDg4ck5W+6Fdrt7Ii9+KS4?=
 =?us-ascii?Q?2GMYKobMbe5sHGh1StvdG7ECucO2IdmS6UOa0WvqvS5rD7JBh8cD7XXYiEAC?=
 =?us-ascii?Q?UiwBFG8Y03gsV6fydNqvVQ70uqydFwOpBpMDwpUbBaSZOYMItv8TEnVybpRN?=
 =?us-ascii?Q?CzNflFbWxkqFrsXMVNvXMkUctAS+Cb6JlyOClXhrmq6ZjOqeUpj2B2hJ+mr1?=
 =?us-ascii?Q?OCDHqlnyd7cOAMckrLpwDhJDYfnUBFyDZTD7JpLMYt+32UriIOgBm2QFG2nj?=
 =?us-ascii?Q?lYOup8e+Wg1qn6AFYM4EJpqOcVfyjp+fpc/6/H5t/m6qEcfRd3Gj/SSp1fan?=
 =?us-ascii?Q?VlsAIJANcNwvMAQOq7SK9edFJrfJobOpt2C9o+NsfbzdHFJrB6VE6+gsX/m2?=
 =?us-ascii?Q?2tyhBpv0dgrrz7u4hVhpffvQztUnQV13Y87TtYYBTM4Gkoro6fGUpQ95X/04?=
 =?us-ascii?Q?Hzdz3fiXgM97moTPEatMo0de08E5Dfg0mmSGZxlT+54Vjr8yRoLlPIyBkhZa?=
 =?us-ascii?Q?fym17iAHu5JciTMSB+5U0XpiNYuMTzoGapGpOKZYcX721NOOmAz0I7d8fRcx?=
 =?us-ascii?Q?cX1zIC3H0skZT+Dov310MIO5OnRLEUcC5XzjOZ/xY5q0LZ3DGP3Bp7Ls8gXM?=
 =?us-ascii?Q?GGgYzG8bAfcaizvZc06GJkJ7prDbEw5Krf4VMihpl0zSUamsqR6llizDYeMr?=
 =?us-ascii?Q?hMOthm+bK+7FDO2AC6mYqAfLX/uGxPPfEGzK1UFjExUqvfk7m9ZXn43u0GsX?=
 =?us-ascii?Q?OVrnLBQST/k2OrmgOHGDx5ny82MvhgY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: da95a94b-50da-433b-39f9-08de9537d5a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 06:26:57.2233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z759SpZ6OCERjfxD0ehI3p/5ZEdHTxT+KECcN2JnvOtogIzxDreNIWisYR7Nhj9jzrYGERQkOslA3klfrYERar7g4xc1gStmH16cPjBYwgMiFJ3tQ6cDomusj2+lt44U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1154

Hi, Conor

> On Thu, Apr 02, 2026 at 10:49:44PM -0700, Changhuang Liang wrote:
> > Add socinfo driver for JHB100 SoC. Currently available for
> > distinguishing between the two reversions, A0 and A1.
>=20
> Maybe a silly question, but do we need this? Are both revisions available
> outside of Starfive?

Yes, both revisions (A0 and A1) are available to external customers.

Best Regards,
Changhuang

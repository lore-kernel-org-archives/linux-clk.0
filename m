Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2093.outbound.protection.partner.outlook.cn [139.219.17.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E5645040A;
	Wed, 19 Aug 2026 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787142587; cv=fail; b=gi3Ap08yCq0h6a9hdL4BmOU4LGoKofXGLyh0tBBBknt+yGshEU1Byhgt6HhOeGOHYWB+nVKdRsAtmzgApx60gjm8XjamXLVJ+ULIg/1fWaHxTPmyJ+4oOjDkiRQ/4Dalaw8B6fY++HVBfNgEQUdLAl4BaaishuRBmPQSPUVKWmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787142587; c=relaxed/simple;
	bh=XGIL6H9rUSeZ8YD+ye0c1V8LHSx36RDB4+EZwZCr7RM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XK+C7smpXGo645+V3stk0OH/do1KJ0IvAhtkTIQaknznmyVc8NmvKi2LH5nZxcjiF5Ya4AJAY6WXil6YRG6hl7vNJwPbU5GGcNZt1iVG/t12j6SMfmfwSoi27WMdUV7g8gcZFwthAbxO2enVehJ9B8oVIVynr4AeYjIq4Co8kmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
Received: from ZQ4PR01MB1154.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::9) by ZQ0PR01MB1157.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 19 Aug
 2026 12:14:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKEs1kdnY2r7pyOM8Vd2BQCMOwI4qO340GGsVFqWzgPo3uG4kxJNAXJI/yHiY1T0vAGho1k3WuHa0JY1cBK58nfxTNYfgPhNooprQVTAhkk5QR/0mFyiuJ8KzQn/ri9DcxWVdgESZevu6h6hgXdfauYQ0zNGO4ZDRPf/y4VRsFbpR6nx4PaNfezNdZjS6B+2kMl1wFWBELcwU5gnRRmd0oAU/7Um0fPsKMsyTRLCdBqIM7lFTiAH23MJnNOaukBRJwycfUbEe3xDKSW7CNm2+MXZ5ci9nqz7yCI52JsR0bRRAW2YSsFh255zqgdFJIyb9u0Fjl2AxWrHZgf5wmOiqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJhYZaeLBAI6r1UOORQB53hA3cfXohGeiYBc89d/EZE=;
 b=JqyXOjGddw/vdubKMlVKymSS9e2LIhn9zGlYiGTQx4mArjXAd2/ibCJVtpwcr++PzHTzbPfHPrJZgiG7Xtvt7vOBP5fDZsRR7PLzg6f9MgoUi4mPUODPRln8m/+wgs9SWsHaG223nxAhYfpMYW6qo99PAwwOWUZZKUPo/t01VL6/iCtdh/UAJMlLRbvQAcMU4Zxj60q241tX2N3pK1QEaBFxe3PLH3WqkKqOdxvngp3WXm3ydQMKxpx8cZsAYtq9dqOc4A28UMWqNJqCLo3Iklr2m+/oENhrBmZtDS000agKpXSwCgKilebRimLI3cw0xCynCtt6zsriP7ffLkqMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1154.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 19 Aug
 2026 09:29:00 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Wed, 19 Aug 2026 09:29:00 +0000
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
 AQHdJ6GQ5ts+ksAe6k+ENksiQTa0y7aXdLuAgADirHCAAL8NAIABJ12QgABaIICAAQ8eIIAAkEOAgACNr/CAAM//AIAD6sTAgAKVxICAARWHMA==
Date: Wed, 19 Aug 2026 09:29:00 +0000
Message-ID:
 <ZQ4PR01MB12027CF8ADC7A2B39F7FB32CF2A52@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
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
In-Reply-To: <20260818-recall-onion-3279fe070ccd@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic:
	ZQ4PR01MB1202:EE_|ZQ4PR01MB1154:EE_|ZQ0PR01MB1157:EE_
x-ms-office365-filtering-correlation-id: 52971ebc-9ab0-44c8-8943-08defdd44d17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|1800799024|376014|366016|38070700021|22082099003|10067099003|56012099006|4143699003|5023799004|18002099003;
x-microsoft-antispam-message-info:
 P3fYZYL6vATGSCHfsIF0YuX/34incF+0Y0UlYyW4OMwr3hZarMesX8zeJThE+jI3rQ9jg85kskxqsZZ19vOqG96kfxgfECxSyIgK3PXT2gqq9tFIzOkSB7dVZAQgf4xW/P0nCNYTLb4OGbCZuqwufqUIe1CJvJUqgaH1bb2m8kNy8pddAKqAeaO5mixZWBSYft2Fz3OcYio5rN4BExui4/rsGNb42BGzTIAcEPJUlZye/Y4aeZW3E0GEK/FfYKgcopO1IkswK765Otl1gIROaz0I7EfUDhSe84D2BFwJPrkajYvgOUCGJpp9AMEozZbJ8As+B3Q/i8ZfpMrQghIcrV8BH5yCk9LD6nW3OjYYlZYmOhlubG9Q3aZ0RwWrsyLdjraD/mJDBQ8rkanI7hKimN0iKuCz0t7ekZPpJX4ftpbZOmGS4rzNORYSpmAyneQni9zrY9NLLNyibPsgs1gffQ9j5GCTyESPrc0+eIl4V6Btp6C4S1RcXyGKJ/EiphRAMN6ycaHqUiR/uKIj2Dy/yCiW3vWqSNrZmZbHpbk3cwt6D9a1v1SCZftWIcMV6eU7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(376014)(366016)(38070700021)(22082099003)(10067099003)(56012099006)(4143699003)(5023799004)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?r/sEuCKp+fP540ozPdmJKkk+8I399mPBCNG8mjZWNEfXYKX0ecGhgzoiSqgt?=
 =?us-ascii?Q?4TVH0u75c0ynnNfzfxiPwsiNTFoJCrr/wM5xf2OPx1uQJaaDDNw6xbXXq1hK?=
 =?us-ascii?Q?DhF3v7sNAQz/DCN4QPm/aq97TlqwvJ6f+/zdV5wxVICNH2vAih28Dzw/zg7i?=
 =?us-ascii?Q?JdAne2CmF3AZz37URJRBFmlUSINm4U6sHWf4SSWZuojUhdwnqaQ2ltj56U6h?=
 =?us-ascii?Q?kBOBFWbMQl8bgixqX6t4asldXnKHpOhTjXoAmqPGtELU5Kg2cVL5HazX+n4s?=
 =?us-ascii?Q?sCUW/KtPdBZMxcXgcqp4vz/34CWw5QHj2uAOeCDANkv4N4SBAyOtkfjDmpgS?=
 =?us-ascii?Q?J5jP1kJmCLhNnG+TVFEnmUG2b4E9wdS0b4lovdGz7xBmw3FLqqboEFfGVJnF?=
 =?us-ascii?Q?9dEr1KuZD0p5UeY3imEz1/40vq7xvJXENO7RdK9b2HKeJ6Pym5kXwpOuBVbf?=
 =?us-ascii?Q?9tI+HIyjONcqdjLPMrAXZ2wMhEJTDDoUh8h/XnFSomipRwXB+v1+oYfpTtNq?=
 =?us-ascii?Q?4+3A56QNZct1e98/wa5ZjCNGUWR+bkjjcsm+LQ3j1rtI4TGSsaki9EDQQeNt?=
 =?us-ascii?Q?3iC0RlY1y/oIci2fBQzk+zvz78yiZm01iYlZFw1FFQweW3dl+LY1IfghGKoq?=
 =?us-ascii?Q?f4Zc0WMfybilAYHAskPRWf4PXC0ojZGD1GsHTdiwF50Oasxjvk4FY1CYWQwK?=
 =?us-ascii?Q?HvOUHzoJhJ+LtBt8WjGw2iEF42d0MM+iZ1JICJH91fR19zuog7zuk86R/UDo?=
 =?us-ascii?Q?f7ghkCPt9KRZWzcO/wYmLKi9wJfAHAahSqOYhPde+ehwf/LnWECsYw9LveO1?=
 =?us-ascii?Q?gGie5bZ8OdSefqJqMBpAM0G8sQpVmTPQlmuCwT1emGURgb8HEtj1hoNL5Jzd?=
 =?us-ascii?Q?prL8sOgGoYaC7QrnMpOGaaHluZC48mn69RMLXOBno7ud2yaz1s9uqPybwk3k?=
 =?us-ascii?Q?SZXPlHwtZ+JOmfQU/adWsoweE3a9adi5yhEqv6vpfuKwD9pASqJELyqens3q?=
 =?us-ascii?Q?ZpXf9Ft2tlsORaMwwGWSamuVXlF39lWfZhLiwwhFBBD3RROfRkoWQItvaJ+W?=
 =?us-ascii?Q?oRNNYYbBmVL8WNHaLh8yF5aYlF9y4Pe9ytXH4Kh5v2rwnvz3I2bwvfvq1Aqb?=
 =?us-ascii?Q?9IYXuMmRzSkX4AVu2N2rxWztyyQJiFS3h5+/12N1e9t4PVyy1Jmebbh0HSbr?=
 =?us-ascii?Q?FNWQggHlh2UUdq+PGqiMhBCul8FgJ+s93kpYjoUnbcugwRVix8hnJpR237zF?=
 =?us-ascii?Q?7Xt2JiQYkgjO+RYBgup1ZTi3jUgI2+wYO9pvWDIwQsuPpDq0IhmfvA7HzbkD?=
 =?us-ascii?Q?hNSIskoeEOW8Gj1raQIHYYlmEIexK59t+lvNDYBX/lhcLkP+dfSD9onp7Flq?=
 =?us-ascii?Q?zsOhpo0EIvMUsuTElcQqCZijX0WjULzCE+rf36/sWdQIvCuNALwEzrDjPwuh?=
 =?us-ascii?Q?NHoDFfqaIocqnb7QYmIJQrW8qwlPNy1vnoEsFmSIXK12Ffro9P1fPcA/qFqp?=
 =?us-ascii?Q?OSqAGYIF4+qq39qieE1y9ZfAInGQwlOV5UKZN1phzY+AcV3pl9jX329jCjP5?=
 =?us-ascii?Q?Jg53gaW9F5YEiveL8+U1dPktqntp1gq+k6os7PDUzRGp43+ho2U06VkJe6HE?=
 =?us-ascii?Q?YKag1pRjOEuLOGMTk+komcvZuc+2mhpw5kR8Tp22ul5QT0tbd9g4ImL+RK3H?=
 =?us-ascii?Q?O3AkUip6FXsoVxJz5sv7J+Ad8wGD1HV8YjLrP+RWky8/MqfKxXJw2XLMuoNb?=
 =?us-ascii?Q?lnYbR5hhPzQkMtcOUVNME1ftgeYPlEs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 52971ebc-9ab0-44c8-8943-08defdd44d17
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 09:29:00.1288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I2TavCtXVnTRc01tAcbODwIuH29A1ygpTUuBYS9ROQy1H3rRED8//KKPkBKN9rsyjhTJ6hq1RO15SMaQsNvUpy+7K65m6IiWR1PVhC7CfgqbphxEUFTvo18e/T/wKOV2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1154
X-OriginatorOrg: starfivetech.com

Hi, Conor

Thanks for the review.

> On Mon, Aug 17, 2026 at 01:27:08AM +0000, Changhuang Liang wrote:
> > Hi, Conor
> >
> > Thanks for the review.
> >
> > > On Fri, Aug 14, 2026 at 01:13:38AM +0000, Changhuang Liang wrote:
> > > > Hi,Conor
> > > >
> > > > Thanks for the review.
> > > >
> > > > > On Thu, Aug 13, 2026 at 08:10:12AM +0000, Changhuang Liang wrote:
> > > > > > Hi ,Conor
> > > > > >
> > > > > > Thanks for the review.
> > > > > >
> > > > > > > On Wed, Aug 12, 2026 at 10:37:16AM +0000, Changhuang Liang
> > > wrote:
> > > > > > > > Hi, Conor
> > > > > > > >
> > > > > > > > Thanks for the review.
> > > > > > > >
> > > > > > > > > On Tue, Aug 11, 2026 at 05:36:19AM +0000, Changhuang
> > > > > > > > > Liang
> > > wrote:
> > > > > > > > >
> > > > > > > > > > > On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang
> > > > > > > > > > > Liang
> > > > > wrote:
> > > > > > > > >
> > > > > > > > > > > > +static int __init starfive_socinfo_init(void) {
> > > > > > > > > > > > +	struct soc_device_attribute *attrs;
> > > > > > > > > > > > +	struct soc_device *soc_dev;
> > > > > > > > > > > > +	const char *machine =3D NULL;
> > > > > > > > > > > > +	struct device_node *np;
> > > > > > > > > > > > +	struct regmap *regmap;
> > > > > > > > > > > > +	char rev_char;
> > > > > > > > > > > > +	u32 rev_id;
> > > > > > > > > > > > +	int ret;
> > > > > > > > > > > > +
> > > > > > > > > > > > +	np =3D of_find_compatible_node(NULL, NULL,
> > > > > > > > > > > > +"starfive,jhb100-sys0-syscon");
> > > > > > > > > > >
> > > > > > > > > > > Remind me again why this is not just probed as an
> > > > > > > > > > > mfd cell from the syscon driver?
> > > > > > > > > > >
> > > > > > > > > > > (Hint: please put this info in the commit message).
> > > > > > > > > >
> > > > > > > > > > The discussion result with Krzysztof at that time is re=
corded
> here:
> > > > > > > > > > https://lore.kernel.org/all/20260405-strong-watchful-m
> > > > > > > > > > armo
> > > > > > > > > > t-fd
> > > > > > > > > > fad6
> > > > > > > > > > @quo
> > > > > > > > > > ll/
> > > > > > > > > >
> > > > > > > > > > One register should not be treated as a separate device=
 node.
> > > > > > > > >
> > > > > > > > > That's a different question. In the case of an mfd cell
> > > > > > > > > probed from the syscon driver there would be no
> > > > > > > > > devicetree modifications required compared to what you ha=
ve
> now. e.g.
> > > > > > > > > sg2044-topsys.c
> > > > > > > >
> > > > > > > > This seems feasible, and I can introduce this modification
> > > > > > > > in the next
> > > > > > > version.
> > > > > > >
> > > > > > >
> > > > > > > In fact, you don't even need the mfd cell, because your
> > > > > > > driver is going to be in drivers/soc/starfive anyway? You
> > > > > > > can just bind directly to the
> > > > > > > sys0 syscon I think.
> > > > > >
> > > > > > I suddenly realized that I missed one issue:
> > > > > > starfive,jhb100-sys0-syscon is already bound to the PLL driver
> > > > > > by default, I
> > > > > can't use it to bind another device anymore.
> > > > > >
> > > > > > which is why I used
> > > > > >
> > > > > > np =3D of_find_compatible_node(NULL, NULL,
> > > > > > "starfive,jhb100-sys0-syscon");
> > > > > >
> > > > > > in jhb100-socinfo.c.
> > > > > >
> > > > > > So it seems the MFD cell approach isn't really feasible either?
> > > > >
> > > > > You could, in that case, probe the clock driver using the
> > > > > mfd_cell like sg2044-topsys. What else other than the pll
> > > > > controls and the soc info register is in this register region?
> > > >
> > > > We don't have any other drivers right now in this register region.
> > >
> > > I'm not asking about what's got a driver right now though, I am
> > > wondering what else the registers in this region are for.
> >
> > Here are some registers related to debug functionality.
>=20
> So probably nothing else that linux will ever need?

Yes.

>=20
> > > > So does that mean I can revise it to the format below:
> > > >
> > > > static const struct mfd_cell jhb100_sys0_subdev[] =3D {
> > > > 	{
> > > > 		.name =3D "jhb100-sys0-pll",
> > > > 	},
> > >
> > > > 	{
> > > > 		.name =3D "jhb100-socinfo",
> > >
> > > Why would this be needed? The driver with the mfd_cell would be the
> > > same one that provides the soc info, no?
> >
> > My understanding is that one driver can only bind to one device, so
> > the PLL driver and the socinfo driver need these two devices
> > respectively, and thus cannot share one?
>=20
> Correct, but I am talking about the socinfo driver being the one that cal=
ls
> devm_mfd_add_devices() to create a device for the pll so that in the end
> there are a total of two drivers, rather than create something identical =
to
> sg2044-topsys.c that does nothing other than initialise two mfd cells.
> May as well consolidate the mfd_cell definition and call to
> devm_mfd_add_devices() in one file, since it would be in the same directo=
ry
> as the socinfo driver anyway.

Okay, I will use this method.

>=20
> >
> > >
> > > > 	},
> > > > };
> > > >
> > > > static const struct mfd_cell jhb100_per0_subdev[] =3D {
> > > > 	{
> > > > 		.name =3D "jhb100-per0-pll",
> > >
> > > Why do these other ones need to be modified?
> >
> > I was thinking, since sys0-pll has been adjusted, would it be better to=
 also
> adjust per0-pll and per1-pll together in a unified way?
>=20
> I wouldn't complicate them with things that they don't need, so it depend=
s on
> if these other syscon regions contain more than just PLLs and if there'll=
 ever
> be drivers for the other stuff in those regions.
>=20
> >
> > >
> > > > 	},
> > > > };
> > > >
> > > > static const struct mfd_cell jhb100_per1_subdev[] =3D {
> > > > 	{
> > > > 		.name =3D "jhb100-per1-pll",
> > > > 	},
> > > > };
> > > >
> > > > static const struct mfd_cell jhb100_ pcierp _subdev[] =3D {
> > > > 	{
> > > > 		.name =3D "jhb100-pcierp-reset",
> > > > 	},
> > > > };
> >

Best Regards,
Changhuang


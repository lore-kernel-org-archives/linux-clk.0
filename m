Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2115.outbound.protection.partner.outlook.cn [139.219.146.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263CD311592;
	Thu, 27 Aug 2026 07:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815448; cv=fail; b=L+Z1DgVYUrdOagEDpdp4g8inlbzjyB7YBS482j88L+7d0UPrllHUusGUHMXLAR3bPnln8nMNILYGAByC3f/KfKGNPa6o931gvleeS+M2VMb1GdAE6V8CKORvQA3F0Cge/SsAqxTAJcfl1VVUJ6S0ENnJJqSEhgjQa3kJEiHcTJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815448; c=relaxed/simple;
	bh=6AOuAD9mflAy11AHNU3UqHfv9/q4JfgPBN6BeO6t39w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=baLMSvhJF7b2p3mC3u7McgxgxONDWHukaEIL4l2N/B8NROLtiYPLGmZwPzDeW5lxJnYqZ2b/WjGWAR79XEZ8V2O/Vqs0REYSyd90NhtIk9IfpXOeodROnXbTQXoxaqWFnPPXb+5gKiApta6wKMePZVM2YsmMWPx9nuM6XLGkXAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqGOlfklBGheyIXgDQd2FjjuaOJEJFtXeWr+1+iCr3x9XyVa6MjR0EM8jQkUIy9NE03Pg/1d+fdlbV0rsnOo3RzjAjkIZw9xaAS3c111WhYoFrLnyW3jR9tyFCVoGEyq/m4MOfr4IlRh/bayXtk88t5DVpxMIk0Ke2EAFWty/6OrbqIt4khllSuS0qf+n7G5DJh+SmC3fdoaH3EiWKDjJwURUawX8DVhMMSO3rs2AU2+fXjDByKE/ssE4LoMPEYepgIxVXwzxl4xpzpde+DCPIeOhlO5/y7hwBv+L7+3Vw6tSKJPciLfTGbdUMpnui6pg+ZzwW4/sdzxQeHShqxxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzLmtunYd4LHJfH2eTGyBNtSSpjKBTtfl/Vd1JinhXc=;
 b=hTpn06Nvn7iN9nMRGjKpGL8CCG3RIgpYXk/3LnPhYUnkMF/MBLs8HqbiyzpGEMTqtUnlTAC1rDaroLtreaN2IA0B+s//3QhXWXOKIuUKTt59cjnA5FDW3jLb9pL18yedt+VFfDAeN3sSmAWj8XGnbmSxW8BIhSHtgoRu8ug5Mx3LGR7XLk+Bk/cBUEpSsPsUGyDqCj8OxiPst1gMQ7w1H2r8wouYLEfsYsBA6OY0ChSgaYIIllz+haev8XO/+q2aBPD7pdQapNRMAWVNbUHDw5ij4B6FAoK2yPmyKPDKYBRmcxYRQgSmYVMDT8cqYeCVnZTwxPM110N2qGGlp9Xo1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1316.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 27 Aug
 2026 07:23:50 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Thu, 27 Aug 2026 07:23:50 +0000
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
Thread-Index: AQHdJ6GLvS5NNuAYikeWCGx3U49v07aXvOuAgAEEKZCAGNmroA==
Date: Thu, 27 Aug 2026 07:23:50 +0000
Message-ID:
 <ZQ4PR01MB1202DDA7F5CCBC378932A7A3F2AD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-3-changhuang.liang@starfivetech.com>
 <anozO_Q-a7AFQkaE@redhat.com>
 <ZQ4PR01MB12022BC787EF8C07DBB34E34F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
In-Reply-To:
 <ZQ4PR01MB12022BC787EF8C07DBB34E34F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1316:EE_
x-ms-office365-filtering-correlation-id: 99424c52-a426-4943-c965-08df040c2460
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|7416014|56012099006|10067099003|22082099003|18002099003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 4dtEcRZ0Ai48xbByZHkFCSVQZwYdp9EI2tWh0P+uch8KS/buwH8TMN2gho9s63UnR7JOKnk1B+HmVS8d40rz92Tq64dlT/JXFVD3ctsrL4dRVWdYxJgyOtbyGYrb920QN6az+ztQPLlqX+kWYeg9FY358LZg3mVxWEaFZ4RAeMZOEXYuG0D2NeQWGy3r7TKcH06uOGbn7RzU4w95E7fsXyfzFW9ozOZPTJ4r4NRy3W5fkyn3nPagQ9X6qyb5/ZNl/W+gQbFtDIJL6rpavCtETuTHv9tzNv+XxF+LcH7IbwIVsuwnkMvagkX4U2W6s1oJVlqBtNj8T1UXlntMQjjKN5n58P0AUSgVv9RJpSA6iyzMbDiCVAhqWSzvPx9llHwm9lY6DTg/bHo9SEHoFIUjTImnKPOJIRKBUiOv89lspdGuVkVHedRq10Lh5hJa0Ppq+nl5+SMMqFMbXlLW286kjPF7XhTXl3leFL4tKd7ezVTLQOm/iSTY7w7S/VkrU+/icoRdp47kNtK4smwVQ48UYA5EwtnOnKNy6ALB7RyG+nbpHsAXtNwAXiTRR/tuUktA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(7416014)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kuB+FpH98vhbWq/wNA5q5I3iqkSgPooPUu5c7KBjgNXvRslaw+pbZzEFE9cT?=
 =?us-ascii?Q?tfiE34I2mSGTd2hITgFMZ11eB2c9+hZX2B6WfnBIMNMwg2STGaJgZLCrdyFb?=
 =?us-ascii?Q?BrjpXeSrwvb8LoMtdwNM93zncdoQ+mkATEL1BvgaHu27yHW+KBNCINQaxyhQ?=
 =?us-ascii?Q?QwDZYnATE4LdtD+OcNe/LxSGpzox5G/PI4tCa5YOYQpQpy3gi8qWt2A3Uv3u?=
 =?us-ascii?Q?3GnHxQP5SAbDPfvZHpJlxB/0a2oQn91Kui36YZXKmb5fHVP5xIXJwC3UfE/1?=
 =?us-ascii?Q?uT60cRxnrvfddcY7inpk2SfdqxqWvlZMvVYD7zL3UwerjRgImN753nyTlHOL?=
 =?us-ascii?Q?Fe2VOAtX4jharVjt+77pNd7t/UySlLDY2VdqVFolMFgUkg3V5kcyHmHDYkLL?=
 =?us-ascii?Q?PyULazoRU+stNIhwvxSO0zD/4vc3G0xGpYT+u0ko4Rf/NhQXIJq+fGeYOph5?=
 =?us-ascii?Q?DnAjOVPkuezFvrWJ2O3IKpmn87O6HlHDhlbNnDKxTPxOj06FMAPfReqXmGKO?=
 =?us-ascii?Q?6H5WjT7BzYHDlu00iNzLV0Lo7GJkXRu3BEuyqbe7Xs2vfdDmrZGfCoYrwGHN?=
 =?us-ascii?Q?A9FFzo6JH2+7ZblYwwsyPe6B62xCfJEiqil+NOBO+6PdvMgdSn1Af3SFx/v0?=
 =?us-ascii?Q?ar7s9O7rVsI9QASFFWw4Xb37TJjqLLMz5Pwi27UpIoTTOEQ62/pIhAtF01i+?=
 =?us-ascii?Q?JFsdts65G3K6b4baxVeC6IBzxOYOzMrdy92EJbZOr+cb9SQHtkYAeiqoHqWp?=
 =?us-ascii?Q?rpGSM/Zx0PFJlVtsr/2iHZwgnAT6xF2+ApXLJvU8hmqWdxTHcV2Bhqht8o8D?=
 =?us-ascii?Q?rbY7x6pQSIgWf18IzhAE3Jaxl9YR5EOcxnTpnGnsPfIv6jtL16G/SB2bfBBs?=
 =?us-ascii?Q?XY60fgDqyUcGjVCY0uQ5X3tszpiEajJto/sKphl0Wi4e465Wo++wYbYUeusM?=
 =?us-ascii?Q?bQeejlQyNgZO0Ldos+blUQEuyJy9zEbaV6W/YdVwAuTGeUyj4fFNFwXJYIZ+?=
 =?us-ascii?Q?oU5Vghzv2Rw5GNM6PbDvO9GzwPrmvCo7bmVRvJWBgggLbWAsKR6qLxE2ICCz?=
 =?us-ascii?Q?cXNd/TJXHeR+tAXfQuwwTemG60PATIyHUKqwH45+n0tY+Essg9B3eZAc4HjJ?=
 =?us-ascii?Q?2DtJNZKe823N7ANs/Z2EZWFfjvut3j+I7O8quHXkC0EfZFcs3oaP08Z7weSM?=
 =?us-ascii?Q?rXnywrTPom1veQMX1rC/CO9UFb1zTLP9tfOCPtFTKve0YKkEHcR7knCiL/R1?=
 =?us-ascii?Q?ElOQnMiqcCkkoMP0gpcdgowWkFqAUQWIp7Etyu9aVqc5/GQxieCBIX5oFsYT?=
 =?us-ascii?Q?4U+KH7mNNVCGQGBV2HQbqGCbSpDbB+BhennmM3QyaUmQ2fXsZjgaqD9XUPkr?=
 =?us-ascii?Q?30NxT2e/gzVJmvG8nI7c9R+I1Fg3mteMMb9YpomvF/X6dKiOWFf1bRzoM7fl?=
 =?us-ascii?Q?IVxJnGKfeESgfZarP6C7EemDkTAu4u/0QJDm7iu6UOLMj5oYLLXciHX/eBbo?=
 =?us-ascii?Q?b3Of0mKHBFa6dSXhuNh0BRm1qjBC+DgVvMorbwq/3cfQtwJoPIueszdMt/ZU?=
 =?us-ascii?Q?XZW/+XjidHw28HYCdlBrCyMQVu333uKAusWZtG0Mth4L/Q4l4g2YOxEq4pLp?=
 =?us-ascii?Q?Fo4kJCF6jkS1YO3HPSv9wltbG44VsK/7I/BqSrPwNAZ3Bojj4TqwoYuPZKPo?=
 =?us-ascii?Q?gVWHbS2tr+rJ8HDt69JYJGliEzpJhQIzDWtyk4mH1125Q9IWTak+YHGR4IQX?=
 =?us-ascii?Q?NkDet2ufE0zJSTzs4aj2wOoh6jB/2Hk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 99424c52-a426-4943-c965-08df040c2460
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 07:23:50.5913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U59mQIGmn4BWm+JHIWVhwZ0aMVr2vtxqsjMNvDMWy0s8VsrEW942FN/u4gXD6mmGGbPw/fepn2p7S4pis67nyMBX29DpK0b1aH/c1d61SPbRctRQpvjBGtADqc9Z27rG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1316

Hi, Brian

> > On Sat, Aug 08, 2026 at 06:50:48PM -0700, Changhuang Liang wrote:
> > > Add system-0 domain PLL clock driver for StarFive JHB100 SoC.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  drivers/clk/starfive/Kconfig                  |   8 +
> > >  drivers/clk/starfive/Makefile                 |   1 +
> > >  .../clk/starfive/clk-starfive-jhb100-pll.c    | 535
> ++++++++++++++++++
> > >  3 files changed, 544 insertions(+)
> > >  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c
> > >
> > > diff --git a/drivers/clk/starfive/Kconfig
> > > b/drivers/clk/starfive/Kconfig index 852464949334..a39dd22112fa
> > > 100644
> > > --- a/drivers/clk/starfive/Kconfig
> > > +++ b/drivers/clk/starfive/Kconfig
> > > @@ -117,6 +117,14 @@ config CLK_STARFIVE_JHB100_PER3
> > >  	  Say yes here to support the peripheral-3 clock controller
> > >  	  on the StarFive JHB100 SoC.
> > >
> > > +config CLK_STARFIVE_JHB100_PLL
> > > +	bool "StarFive JHB100 PLL clock support"
> >
> > Can this be a tristate?
>=20
> I checked again, this doesn't affect the critical clock, so it can be cha=
nged to
> tristate

I need to correct this again, this affects the clock registration during st=
artup,=20
so it cannot be changed to tristate.

Best Regards,
Changhuang


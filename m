Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795424146;
	b=caUWq2vxOJweCJXa4hUjx8YXV5am/3vWEHIMGhanWprwA0+howXonznMk+hcz6goz/6a
	 awxUkQ3pDmaZb8WnjI+hvqMnMmLIVcfUu/q8mbkcrqITaJpnculnqYlIHrIWTig0AqzUh
	 KMHUdd0SAcfP6vkf7LwAn5T0OxBJY1m43SFXPEUxZOl8sXoodkXorkYzHu90frEBbk34Z
	 NIbgwzzDASKptyXik+PnYiNcW+7F0JElvYD9uyay7YszRS8g7LjToCu8ovgpML74PVE0C
	 CAX65jGOEFTqwlnceth7bwZ7LXo6QpPfpq2aV2Z7Eb5HYPtD3tI1A9O+qFdsXDww1NA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424146;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SaqACj0ujB1xxuUowOQHZMZMgZ/OKq5pHPmB2WN5vVE=;
	b=E1XaQnLnLAEz9JxAU0y37LNNcMVFEVP7lr0HmgN5R8KCvbs0Cp+hEXMcULB35xoq3MHb
	 e0vtfxSeWpkHdJhXm3bcrPJInT3mAQh7OJc47pbup+tkP7XpWb0ZD/ZaTFr42aqPylXc5
	 KRsWi+f0nHSddweQEE/x+MJ6tGW+0muNdmOYZ8vFAlJ8wZ0oCmvL9St4JOns7ZUs7uf84
	 ZnkHaeK3MpWdPLb1wvkl9mc4RwyaPlu1giKUM8KQHhiA7wlLjpGvmmzmNw7AQp70F7f61
	 V8lZngbBwZEj4Vkl4tXmIu8rA9YawgTTjvzNEl4JIYomO6VQVZni6aYF1RG6zVjRXsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.124
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2124.outbound.protection.partner.outlook.cn [139.219.146.124])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC458606A31E;
	Mon, 23 Nov 2026 08:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC458606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcsRwSsXfY7YKaP6M7Wf2+7lUxIQjg+zPclYGTHKR32h/dwD+taIv+kYkR904y5p9GPqpTqqY4Ts5umsqmbDBzWf4VKSQlifJppt/XE4VjKFknTq+GZvSoq5ten8FHn+dAm9nxxE8P6E0FjyJcc38NaYkfr2DQJTokuJf0i6Y7QKwbfdtfhW0zr1wDWHCwx6tyJ1cZkauxyTJBTtv6/f1jzWZNRqUX/+aOnv+c8IyXtW2zZqGkE4TwOLLfNr49c2zzuz2OSXLfxX6AuibCpLM4K1pqsvJ/z+PawJYl+LQI2r6NdzCpZVZu8VM9zFzGJKMufWtvynUrSAaYj+J3/RIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaqACj0ujB1xxuUowOQHZMZMgZ/OKq5pHPmB2WN5vVE=;
 b=jnMUKkA8GRlMWwYTYeHKUzkvI53nntp2d4HjguqA6cdmr4fLy/KrKHt6qVnvsTa1B9R/YQfe65WZWmNZxJrO51VmDAAjkKyAGQCQhi6cGD9OTX3MKPmtgCR1EZ3Lo17gztkR0Ph7wg1epnbmN6V9pEH/sJ8fJve/jKMyU23DVOL+Z6hP/oNM8AYG7ZgYxd+doiWNF5qAklwpjpq6Pa7HTI7m2T52PsWEKXu1NeoGRAWyGey1SAYrHwr3cBMeyh0mDU+vUkMY9tnu6550frAwDNeaDO09bpt9lj5Ey5lj/dw5Ed6GsoW6GPbLecXHaTp2rn00q2xC1Aw2BhoJ1Mbufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) by NT0PR01MB1119.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 08:55:34 +0000
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 ([fe80::be4a:d29e:5188:b37e]) by
 NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn ([fe80::be4a:d29e:5188:b37e%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 08:55:34 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Brian Masney
	<bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner
 Berthing <kernel@esmil.dk>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v2 0/6] Add System-0 CRG for JHB100 SoC
Thread-Topic: [PATCH v2 0/6] Add System-0 CRG for JHB100 SoC
Thread-Index: AQHdd0RbBGIVV2rP20yGg05aRE58u7c7UXhg
Date: Mon, 23 Nov 2026 08:55:34 +0000
Message-ID:
 <NT0PR01MB110280991B65179BF63484BCE6452@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1102:EE_|NT0PR01MB1119:EE_
x-ms-office365-filtering-correlation-id: bc63ff92-9a8c-4c06-2ec4-08df493f892b
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|38070700021|10067099003|56012099006|261021121427099003|261028144727099003|261102123227099003|261022075727099003|261026121527099003|261022105027099003|261026140227099003|261021123027099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|261009223327099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 pkaE+ixNNUO8xgG7RD3sDmIyeXzyK/zvNWF9l+5Wr12yHXnYKJyT5mggvl8VYFCHNx4FE8Z8anZfKBsgQ/2Tz/VQEcAFSb3VttoMhA+cDdHcTViX6aWJwXNIWXsXYoAQU2C0bDgKnl1T7hVkdKa4r8Yn/6uTJTCiQFe+cY1UU3Cuu5bQ5pYWf21EuL32ZU+56MmXRKLRO3FHnZi4REWsrZoFObhFCNVBvJScmUXzJTBzDxlLUX+jsqrmB5UcHGn3dpM2ryrna7poME6d76nXybLW0VFVM3IY4T8PcQ3YOl04pTbpBmxSsIR3dgy9F2su9uxuzqzwnDtyD83Q4gAXFlRrHOacIf+7wOAl4FW+WnDpdxtkX0oemGnGojLET9QvmitljBbGq7XChMikGDDqMkYTwG3vCL0UEgiVVDl/7q0mmeEOnfZLJx4CBGMnVRL64ssW7glREtiTBxVXZEZbEBl1UwosvRcegGm8Ga+HppnGjP4P/VZuZwkTaX3DoSSOVuQ1d0BOK8AD5zJoAQzyMq1AFA2OI8yZOQ2JLuMDs1Kg0mnlVfIeyuJtblYecNNi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(38070700021)(10067099003)(56012099006)(261021121427099003)(261028144727099003)(261102123227099003)(261022075727099003)(261026121527099003)(261022105027099003)(261026140227099003)(261021123027099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223327099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pvi15q0VZA/zfYTYXFHTG3laMtghTddqCLxotjSClexIfO/nI7E1N3ZdJQRf?=
 =?us-ascii?Q?Xe2A6/dkMaojmUmpPwfMcHErmRI/AS0vVhFgsG4VrM10zc5mXGgoYSzDpBt3?=
 =?us-ascii?Q?wMug06aRYcyaeZgbu09YPIuucpbNrL+GMAdNuDeeH4IJlg5Rf+AqhwjZeB4d?=
 =?us-ascii?Q?uGreM6UZPOZNxwYWkkAET6KuRAmBLm86u9/q0qQthVnFY0/vFD7kuB+8q0EZ?=
 =?us-ascii?Q?UKtCcJJM5s2A4oWMOgzKrlVSjFNFNEdzvQ+CWFMCzx83mwZuK4z8kJqkS+hi?=
 =?us-ascii?Q?vn0YKJtopU17H038u4CztgJly6OpV0CP8sQOodMAuhvr/WgDqg754q5ktqss?=
 =?us-ascii?Q?BAD8rPIbdyryZ0/qTa4Os/Z17qUe6Nb77ON5FdcTjqHBRr5cWyhRvy8DObns?=
 =?us-ascii?Q?Bqm5QkHayPQARWO5rkrmqPdeCyIBcX6UyyI8t81F+yJgBo4cTGtU7sy8KSQY?=
 =?us-ascii?Q?abrUiKh4EC1zOCeqyBPqEcyswNeE+xF7oM4N3oH9km4PMjD3FrUy4nTuIGnq?=
 =?us-ascii?Q?t0akV4/H92AeNXaYVt6jwknucrXoOYvv80miIcGJFdfe4umrcdIfwqiPD7Cg?=
 =?us-ascii?Q?5E84YAbXnWH+IKKcJAUT0YkT5Jhybh/yZb/7eAM4FkUj/oXJSYhNioID7IDt?=
 =?us-ascii?Q?frbK3uWLXwI6OEPj3bELpjcZNaIUs9fxZsCsg5FHQVdn2fpgLz+3lSc0TYxG?=
 =?us-ascii?Q?YOHv2C6V9f7T2/e/Oybp9bkfzFiWuPzd+NNGbTEF9oBVux+CCcGvJ5gyfxvp?=
 =?us-ascii?Q?mc/ghR0sdn96SXZeg1TxPd70uMx7OPbjn2zOyrcDZptNTHurN3Q61ppRkFJA?=
 =?us-ascii?Q?Q+B0KvEZy2zDLeNIzRYrift6E0n/ez+FKGTl2L4ofx7IWRys3AqfvjIoglmQ?=
 =?us-ascii?Q?jFG2OKoQlVhPoybKEtKTkTfo9G1oacXEGkLR+J6jpTARMuSuO5iyktMIwNsK?=
 =?us-ascii?Q?3jMgToBWodULwo/lyEJ2ARRL53qX1YATh+Ca/zTCWocLVX/gNZrAbfFM4qxv?=
 =?us-ascii?Q?XcdiTaA/3WVin4I1I3zvlWTDQ7qmjGz3hEK9Exlw3M7GRINj1+xOBRxBjRX+?=
 =?us-ascii?Q?dLB4Lw9kQdD+kHVPgeL8JsMORVwShbHOCV9W5UHhFoQUGVGOVgl9U3P0QzuF?=
 =?us-ascii?Q?XmNLCFNvRxVk9pXnUJ8E2xhKyGqlQnBgpDYoJpi0o6MpvNTwLmpfmCfWrwoI?=
 =?us-ascii?Q?UXT+7ZCetLWG76nOUS+9ZpFnYQJuf6s/0Pm+9H164Fok5HTssC/8nVpxVp0R?=
 =?us-ascii?Q?/VoCeZ62ZZtGFr5Cu7ACKkt4jg6OpM7xkEX+cF5/MAFAmkuAmBRGIzrZaudo?=
 =?us-ascii?Q?APrvd0luBUBKldV5Sw2wgIvqbucBbTaKL09VSS9yMRQQGoGs6OC2xSSGZ4f2?=
 =?us-ascii?Q?ARK83bv1YssFP3B5i2rfcVkNztECtjocIXV3OPvziLD8cn61NQgR54sWtyBf?=
 =?us-ascii?Q?VqJsjUL7SD5bwm+MYqHyHGsvCVL1QlXgDIZ5pJLRr4QW9rDFD20oHr9k+OFW?=
 =?us-ascii?Q?6Ip/7oikrhwufD3Tg5n9dx1TBBDH2eTXtFCLTTh1UbUf92ABv9JEbVcd2A7V?=
 =?us-ascii?Q?ZCEA7T2lpCoKnT7UUksjSNA4QjzKy9Jrq54qh2YcNwGC6Ui2kAReusNQbiHv?=
 =?us-ascii?Q?u04oa7Dah3KdOR1mhVaDNLDzOqV/6RslTNZYQEvjzakXxP/B8GvIQxTnwo8A?=
 =?us-ascii?Q?0EDRe9W7xBJDZ65X6oN4x4Bxpsddz1OlzRFsGVTqkLTeWMM3Ce5qjcEXealu?=
 =?us-ascii?Q?2yQSxmVypw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: bc63ff92-9a8c-4c06-2ec4-08df493f892b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 08:55:34.2958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uE2Ikrx9JRQXgiXY+bYnswVMzsnt6o8DKWXVkDC+TLUX0625gkzGyU9OARQXgFwfh5jTQkQeZY9veDthJy42x6FQRA9+i9gCsxBaDZ8nZkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1119

> On 26.11.18 18:05, Changhuang Liang wrote:
> The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
> subsystems:
>=20
> The JHB100 SoC is divided into multiple subsystems, and basically each
> subsystem includes a CRG(Clock and Reset Generator):
>  - sys0crg/sys1crg/sys2crg/
>  - per0crg/per1crg/per2crg/per3crg/
>  - voutcrg
>  - vcecrg
>  - gpu0crg/gpu1crg
>  - cpucrg
>  - usbcrg
>  - host0crg/host1crg
>  - pcierpcrg
>  - husb0crg/husb1crg
>  - husbcmncrg
>  - husbd0crg/husbd1crg
>  - npucrg
>=20
> [1]:
> https://lore.kernel.org/all/20261008123338.11081-1-changhuang.liang@sta
> rfivetech.com/
>=20
> This is a split of the previously sent large series [1].
> The original series had too many patches, and there was a lot of similar =
logic
> among the patches. To reduce the burden of repeating similar comments and
> reviews, the original series of patches was split up and a new series was
> established.
>=20
> This series is based on the clk-next branch.
>=20
> changes since v1:
>=20
> patch 2:
> - Rename struct jh71x0_reset_adev to struct jh71x0_reset_platform_data
> - Use devm_kzalloc_obj() to allocate the platform data.
> - Add Acked-by from Philipp Zabel.
>=20
> patch 3:
> - Describe each clock parent with a struct jh71x0_parent_data. The clock
>   table is now made of struct jh71x0_crg_clk_data entries, filled with
>   JH71X0_EXT_PARENT() and JH71X0_INT_PARENT().
> - Drop JH71X0_EXT_CLK_FLAG, JH71X0_EXT_CLK() and the
> ext_clk/num_ext_clk
>   members of struct jh71x0_crg_domain_info.
> - Use devm_kzalloc_flex() to allocate the private data.
>=20
> patch 4:
> - Describe the parents with JH71X0_EXT_PARENT() and
> JH71X0_INT_PARENT().
> - Drop the external clock name table and the static_assert() on the
>   size of the clock table.
>=20
> patch 5:
> - Translate the reset ID to the hardware reset line once, in a custom
>   fwnode_xlate callback.
> - Index the map by reset ID and make it a plain array of hardware reset
>   lines. Drop struct jh71x0_reset_map.
> - Drop jh71x0_reset_info::discontiguous, JH71X0_RESET_ID_INVALID and
>   jh71x0_reset::info. A non-NULL map already tells that the controller
>   needs the translation.
> - Use devm_kzalloc_obj() to allocate the reset data.
>=20
> patch 6 (in v2):
> - Index the reset map by reset ID and drop .discontiguous.
> - Depend on ARCH_STARFIVE || COMPILE_TEST instead of
> CLK_STARFIVE_JH71X0
>   and drop "default ARCH_STARFIVE", the clock driver implies this driver.
> - Use struct jh71x0_reset_platform_data.
>=20
> v1:
> https://lore.kernel.org/all/20261013102707.9207-1-changhuang.liang@starf
> ivetech.com/
>=20
> Changhuang Liang (6):
>   clk: starfive: jh7110-sys: Fix memory leak in reset controller
>     register
>   clk: starfive: jh71x0: Move reset controller registration to jh71x0
>     common code
>   clk: starfive: jh71x0: Add generic CRG probe helper
>   clk: starfive: Add JHB100 System-0 clock generator driver
>   reset: starfive: jh71x0: Support discontiguous reset IDs
>   reset: starfive: Add StarFive JHB100 System-0 reset driver
>=20
>  MAINTAINERS                                   |  13 ++
>  drivers/clk/starfive/Kconfig                  |  12 +-
>  drivers/clk/starfive/Makefile                 |   2 +
>  .../clk/starfive/clk-starfive-jh7110-aon.c    |   2 +-
>  .../clk/starfive/clk-starfive-jh7110-isp.c    |   2 +-
>  .../clk/starfive/clk-starfive-jh7110-stg.c    |   2 +-
>  .../clk/starfive/clk-starfive-jh7110-sys.c    |  57 +-------
>  .../clk/starfive/clk-starfive-jh7110-vout.c   |   2 +-
>  drivers/clk/starfive/clk-starfive-jh7110.h    |   4 -
>  drivers/clk/starfive/clk-starfive-jh71x0.c    | 116 ++++++++++++++-
>  drivers/clk/starfive/clk-starfive-jh71x0.h    |  36 +++++
>  .../clk/starfive/clk-starfive-jhb100-sys0.c   | 137 ++++++++++++++++++
>  drivers/reset/starfive/Kconfig                |   8 +
>  drivers/reset/starfive/Makefile               |   1 +
>  .../reset/starfive/reset-starfive-jh7110.c    |  19 ++-
>  .../reset/starfive/reset-starfive-jh71x0.c    |  60 ++++++++
>  .../reset/starfive/reset-starfive-jh71x0.h    |  24 +++
>  .../reset/starfive/reset-starfive-jhb100.c    |  74 ++++++++++
>  include/soc/starfive/reset-starfive-jh71x0.h  |  12 +-
>  19 files changed, 498 insertions(+), 85 deletions(-)  create mode 100644
> drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>  create mode 100644 drivers/reset/starfive/reset-starfive-jhb100.c
>=20
>=20
> base-commit: 59841a2d8757b951e8d93f92ffdfaa8c9503435f

For the whole series,

Acked-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

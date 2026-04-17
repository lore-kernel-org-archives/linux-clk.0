Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C5117A30A;
	Fri, 17 Apr 2026 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417699; cv=fail; b=MfXoWypkgK3bRnC+chaRSeaU92lPdv5ugsfT2kmFfBbscPJ6UcCaNtOonqlCtrOJhCp54p8q68mo/Vdfeaxey/Te/jThV4MA9tVo6Di5jMVR1krhz9OryZe+dsIjAIYbljGA1gLZnlch2PtQdqft2CncqIibK+WlOMVhOnNBdEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417699; c=relaxed/simple;
	bh=hfkKgIsAcnyhhuR3H1f2Qx3u9jCafnR3IIHvKeJe6OU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QWJ1rUbT7nzqM01CLWY+WkHwMjohFYrp0JWkFt86RkECvySl17sgJIJHrt/jTKCsTU4LsHUfQTpcXrk0HMc1eAEZAEQaZLrKe0WWuAd66GEfcr8ZG+E13ov23dRvcVelI60tOOObCJSq2jzUCA5T+iA+r1D+Wkh3cpZD4s++Wcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IhziePyY; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IhziePyY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZDYbjT3lhkB8nPojiCq2HSzDrxx0eQhTI+It2pIoq1ijYsIYKcpWoG6+T7uYiqhhXanlfV6/qGOpFX2xggSaeaeYQKo+0OT6ByU2KnoS6WGAeRtEJd5Ya07aSCTDIjXB3CRO7zg21pO3Rsds7YV1Bz6fGjLHI//Q7kjNSOqkBhk2JfcsFp+NeLVp+u73fNsKL6UilhyMLZfT+iwhhjoQtl32BlwOzxnkKYGWOGvGOG8h3hcIf6j64GNrLHRN1KO2Y7ZWENlReyCQHRl/dosNlOb2FhjQckQK6t3yoFi8yxzSI6sUjLbxMaBQgPLK+ajDwPRuPUqBdr6skpBUF2v9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRRbipzDpgD89DT3DxLM9+gzBUTdpnDtktEgZc3z2T0=;
 b=T+xwBgP5x/g5mmHSTaWIOnBGaLUdMXMauP+Q+g3y30MbMJM3FLxBW8JWuhyraPQKHVgGSk7OgX0GV7dYNe6O/Hf9cTMugHMrVlE5tFGf6R9MGNwTpbOEnlQP5ctvLr6rfF3Fx2Jj4U/lyqyT5UmSYdVaaaRhl8w3Ssv80+4Gbyyh3iap79eTd0HTzzTCQwoN4emQJRms+tQnyJRJASpLQC5rlQnzrKlenGg8Xe2hVbmiqloZw88KjwNShCdGAvVhxFwBI6hmpclrN1Q8kpsjeMLUTqdWBqM+8s0LhkXFFdodhU/K25XGKysP2Wax/TPAXN4oy90V0gJPU8qh63B9xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRRbipzDpgD89DT3DxLM9+gzBUTdpnDtktEgZc3z2T0=;
 b=IhziePyYS/wAT5tSqOu1EvE9jQ2AH44A7cwi5cCFZldmgtg2fGhiR9AG479z/OpZhdl45vCQ2+RUDDrWtG2decFaAzDtDD0q530iRV+XOfqVAY4AANOJJtPaDkD98A11lPQaDg2I9kXqZEIWXj65G9LcJCvNeR9PDyRJ0rjEm/LCx49SWdJeOaX3uxZ7gr6m1Txmi9IRyfFsb4U7q3zGIXW4AvtSnKkfEptYHqkZ5LhkTiHyAdSpJcsRUQgLrmCM5aYbGNfuGMDDY2IbRs02fefxvMABKNvEto4jtu2TohyRGNRS8Mhbdg9wtvPxChHjrp/ACNBRm2IrifB0anKRAA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB11406.eurprd04.prod.outlook.com (2603:10a6:102:4f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 09:21:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 09:21:35 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>, "abelvesa@kernel.org"
	<abelvesa@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "imx@nxp.com"
	<imx@nxp.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: RE: [PATCH v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on
 i.MX95
Thread-Topic: [PATCH v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on
 i.MX95
Thread-Index: AQHczkQAtZZGian1QUyioBwQdiK9xrXi+mLA
Date: Fri, 17 Apr 2026 09:21:35 +0000
Message-ID:
 <PAXPR04MB845979CEDF7426A07BCB6FA388202@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260417082910.489995-1-hongxing.zhu@nxp.com>
In-Reply-To: <20260417082910.489995-1-hongxing.zhu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA1PR04MB11406:EE_
x-ms-office365-filtering-correlation-id: 527e6a6e-c35a-46a0-d725-08de9c62b8f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 q/jwTXnZSDjtj5N9n73/mJIMuh1JVZjPLzRiF3HOMEIGOuzgD4ulPxZg0wd6ap6rzvdeYbY2B4NpHtKp1Kw8EUnWQKMUKCzbkal9zI1WMVh9HIGH+8UvmLGVIr05BkO69x/Skn5FOSWU1HnBgPe/QdGfaum1AgGO9cHITSTEv0SYeucn1Zvb6bqG646thxbscDdC10ANJpZ2BF/b6zjZdk1clcEz5njI0eT14+G5nMOPZ68MdAmtmDREJzvCsxLXMtOwvaXMhdJuipYGP3XS5WtiTGJt9uJWbgTqlDPsoQUz779zY5kbYdCAAENB8YKRt6Dke9FAOavDuc38O7r3dYLxPgwjNoWNJeQN6pG60wB2ePEi9igJV0WMffQAT1jhLne6TTmy37JTYYqEQST143kCf/OIhA8WVGHYridRqzcBgXwSoJNlLHBCYSpHPMhyoJcThOKfQ+6qXeqPIcxTqM07HaqDRG2OV76gY6YZKMe9khiKATBKvd36A/7yEAmtOjG7JUs6uAC6Qt9OXEUe8cnQoygkWYwasFJFd2aI7e3YW1/eWv/L3nLHWLnFMY2aVRrODzRjWHX01guoxOZgFSLCj4hXJbqxpG6QBmVKjxRvIdQvfacpfDE1eWpsIkTGAJfc481z1ygTUNgsMjBZo9qCSMfPeQbGfNW7wftulHZqwu7b6XYHsmEzqge5p4SjnDonbkh1ZFWDWfvGjk7XFiMKvwlLsilGcVnVe/dhq6AciXKsrbo6Wk4YSgJAArk2EHYQhyJdqphKSiydTEBOiIsh7CrgI6dli+BoYPcJYDo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Bsfbet5vOkuwMOI4Wntc6z01xI1O0ZMiJOn6dp5OmkTyteSZxMLtVunsdcNO?=
 =?us-ascii?Q?XWIPkNZkboaDP3hCv6dA/q91EWzvoqr1fLDsKN5ehuZFUqD13fkmGkP9scV0?=
 =?us-ascii?Q?ltfw6PeOZNQvv+9Nw4y+GzZUT/VCAhz+g+kG8VzzOecTJAFtjOMC8rUAez8a?=
 =?us-ascii?Q?RgRRtpESez7b2nkcCiUZCEKh0uMk67pTQMwJG2dBEhxg2gF5mX9DM/IGuEfO?=
 =?us-ascii?Q?/uXg5mFq7efGMsrkQsNFo6jRyTmhNJwzzGqWMqiQ/Z+zqND4VPsJoIMwyhxa?=
 =?us-ascii?Q?ffZ5T0ApBMaYvQ4cMh4n6DGcYxXu/sfNgfY++2FKOYb8BBxE3MdcsNW8KBIe?=
 =?us-ascii?Q?8tuEk1BZ000/DDwZ+wSPselrAAfnoQsq+Z9ZPGYXhpJR3Du31UdzLA7oAkxA?=
 =?us-ascii?Q?K+/3EmF3wRyYucLj/5rhr8MjSGNfbUebc0NhDuxwoI9ebtAljIiSNDd1kBU/?=
 =?us-ascii?Q?UAiDiQaLZNzZnXj1/xAk9Hd9PM6kU68HS69t1OBTC0blOokDkLocRQhX8z5g?=
 =?us-ascii?Q?dGU5/NZyzaazwgRyeCztNla4dlnMu0H9L4Dkvs7xipiqjLbt7tXMg77tXhEt?=
 =?us-ascii?Q?UrKDHJAfTksDYlFAtwAP/AqpdRZO/eu6M84IcXPr2UFLhZ6MpoatTnBxmwfF?=
 =?us-ascii?Q?wKswfpQJwFpmQo03MvBJRopDYEQsK5DkytJGBnHf37uv5sEobsTh9bJcVbSI?=
 =?us-ascii?Q?yL5T8orwez/WmXmAY1PVjZnj5c8aEssKwKRBhdctnQI+yAh61/2VGkDPxz4Z?=
 =?us-ascii?Q?07gVHJEkbXt7wvD2XofrBsMmvRXhE0GmxgeuHVFWBe5Vyt8lAEyzlZ8/Wr5Z?=
 =?us-ascii?Q?MQFA8l+zmhGXY2QMMfZZDv6aP+CcB8BrIaBuqVXlAWUbcZLlfM20G824CM1S?=
 =?us-ascii?Q?y34y3iPr+Wl1sdd/cFhw0/wEvzub1e4oItOAzOUAvIlPEC8wJFjBT7G0cjMs?=
 =?us-ascii?Q?KL4DIVOF8v3oAyUAQru+TCesjICM7MFBmZw24ytIE0Urp3wGNIkhHjSSspDB?=
 =?us-ascii?Q?Ld1+SVUltAaaBuNxfX+oW18IJ+9wTYkfujY03SZ6iSLV0kHROISaoUOpmQWf?=
 =?us-ascii?Q?kIDREgYelsAH3GfTzBBhs8UyjX8nQs219PlQ35vjpjfzIOFgc6XFPOGJICMP?=
 =?us-ascii?Q?ZnbK57truvdJSE7bSsHNdwS0ySKIse5fXQt2zlLKuL7DDvivmFwNK++kj+4k?=
 =?us-ascii?Q?41PJuoO36o8526+mHKEUR4TaywwNTKWxTM2UWvUrWGHtKJ8cyeVWcSWT9OLP?=
 =?us-ascii?Q?1opqWEKfX65Y7aRu4SbwTVDNxLbUqn0TWxKl/6mAiPfhrVO90RupfIRf+Lsx?=
 =?us-ascii?Q?v4cwdFN6oBV2n7wlpLzD69Lhv/x1xIiqmYaIjnMTjk17y5tz/FOw2b7+yeqw?=
 =?us-ascii?Q?P0QaQz+0A1tUCEZfjgWhYqpfTZg/S78rh+daMexSCCBOGrX+4HUjboqVW9gS?=
 =?us-ascii?Q?xR51RF7K9mtWc54ic1j+unJXXQSaa6UXaX8btJ6TgYDDxwbW4kGFI/xt3PPs?=
 =?us-ascii?Q?YRyge5FMVx1oFIQph/ityhCkxn8C2rWRY5pjCQ1FAyUUmud7PNZiyGhz4NmP?=
 =?us-ascii?Q?lKlNk4ef5B7mJAD25BccSdljkxyvLdjhGhy+PRlCODL9fYxnIAJkDpGwJQB7?=
 =?us-ascii?Q?H/TRzIVm1tw49bBimdSeJ1sSA9DNc/Gx0nWfHh5U1u7pimejtz7QXW54TLLJ?=
 =?us-ascii?Q?VWFWGdg5ipRZU4YqSN5uDSkYflkiR/vqYmJHDUuhnTGtsFPm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 527e6a6e-c35a-46a0-d725-08de9c62b8f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 09:21:35.6687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aqL0BhN5HG+7ID8J9iePLsUPw+KK8bjUZmnE/Tf7SkHV9shuNoohryEt8CeGxaAqYrK9GTebjGJhc5WKDhNRjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11406

Hi Richard,

> Subject: [PATCH v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on
> i.MX95
>=20
> When the internal PLL is used as the PCIe reference clock source on
> i.MX95, a REFCLK rise-fall time mismatch is observed during PCIe Gen1
> compliance testing with the Lfast IO analyzer.
>=20
> Fix this issue by configuring the IREF_TX field to 0xF (15), which adjust=
s
> the transmitter current reference to meet the PCIe specification timing
> requirements.

BLK CTRL in HSIOMIX should be save/restore for the settings you configured
in probe phase.

Regards
Peng.

>=20
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  drivers/clk/imx/clk-imx95-blk-ctl.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-
> imx95-blk-ctl.c
> index 1f9259f45607..bc6957299cec 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -44,6 +44,8 @@ struct imx95_blk_ctl_clk_dev_data {
>  	const char * const *parent_names;
>  	u32 num_parents;
>  	u32 reg;
> +	u32 reg_init_msk;
> +	u32 reg_init_val;
>  	u32 bit_idx;
>  	u32 bit_width;
>  	u32 clk_type;
> @@ -289,6 +291,8 @@ static const struct imx95_blk_ctl_clk_dev_data
> hsio_blk_ctl_clk_dev_data[] =3D {
>  		.parent_names =3D (const char *[]){ "func_out_en", },
>  		.num_parents =3D 1,
>  		.reg =3D 0,
> +		.reg_init_msk =3D GENMASK(10, 7),
> +		.reg_init_val =3D GENMASK(10, 7),
>  		.bit_idx =3D 6,
>  		.bit_width =3D 1,
>  		.type =3D CLK_GATE,
> @@ -410,6 +414,9 @@ static int imx95_bc_probe(struct
> platform_device *pdev)
>  		const struct imx95_blk_ctl_clk_dev_data *data =3D &bc-
> >pdata->clk_dev_data[i];
>  		void __iomem *reg =3D base + data->reg;
>=20
> +		if (data->reg_init_msk)
> +			writel((readl(reg) & ~data->reg_init_msk) |
> data->reg_init_val,
> +reg);
> +
>  		if (data->type =3D=3D CLK_MUX) {
>  			hws[i] =3D clk_hw_register_mux(dev, data-
> >name, data->parent_names,
>  						     data-
> >num_parents, data->flags, reg,
> --
> 2.37.1


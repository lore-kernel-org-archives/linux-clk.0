Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BDC29406;
	Fri, 24 Jan 2025 23:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737762466; cv=fail; b=AAvSjNcaTePOvFdLyTmF5il42KIB0YV0yUfB8FFWgbVHVHy1JdRfnIGPd0wmnj4DKJkHFvsyWkPm9+j6qWzf72e+iTNBTglIifSk6QpINCMPCvqomKebxfkAAk1S0EC4XFaAO5NYsbGhGKUqfjL65my0lFtT8YHtQjvg5jvvZ8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737762466; c=relaxed/simple;
	bh=SYftL6JQcMSM/9G63Sl0nI43vAJ+ITL/WGK9uq1xoX8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pSr1QbnXECNw3EJvkuFGANTivCH0IH4NyM1NA5pQpYf/7bgCWpDQb8nYNJyWLx0sIU9DFxRavbbp7QxPwyKdQXa9AIKGmEYn5/01ZK/PIT16bL814WmPpvJdLhtF/9vFLdXnMzbb/qf4MzgqAG58hW5fGIqHPikH/9a16oOipqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D6c+b8qb; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D6c+b8qb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQ0PfWYqZpjl8JWF4jqPDxqBzlTjjb6yBM9AagSj10Ub9dljbygzKDxeEwezQqRyviAGPS8iffmkiMkmv1pboDWAI/YV2072npS3Vcb7jEGJ6oLxbAqwPKW15J0G7TIZWUToCsSDXlgtK6i8NSXBspMlI8TByUxNt+XnSCCfejojeJvpk1UPh9cAFTQfeNrHB65ePfHN3UVvEq9Sce0q3ikROk7zRxIJ6yJLFitawPxsAKAMOeu3hTNa2Q5tI0IL6+mdUpLnwPUpjjcxoQqZWVqWqb/JzzW7BdxsowCc9fp9H4MgbeAwqGgcD5bMXFQqCZoa+nIkgz2FnXbwMt/jvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBHsfwPJ1P16yEp8i/M8soKWQdr5ZhpFA3mwlw+qCRk=;
 b=Y+EzjC3T+TO72mP3yvzi23QVMK+PuJqQ78UvrClp6ncaMOkVIcuciqA6+XDkhgZsTPBm3lsQTvtt9BvPxoEXSuNSgwkvXknSyP+0w7vjrNwtxM4diCKxmLvGQuhqa3Y6sn9kh11GvpAEGNqIqng7kal3359nir14ZeUJhzg2FUVGhg5IouezaL5NsujcV5DNwBNZAX+bf6r8zWESV98d/Z35L+xqpb+T/hYNYp9E0WmGCZWK/rU0OzOGV8y3gdkGmi39C7LgqdefYSTJocGAE3uxUqefx6LNgaqEffVWDK4VQJK5GtTWzOURS8ERUB/uvYU2h8tqDT/77bVMtS6dOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBHsfwPJ1P16yEp8i/M8soKWQdr5ZhpFA3mwlw+qCRk=;
 b=D6c+b8qb89R3lUgvE6Z8xiURlY5VHnNXgQB2oh3YR2dU71loOOhqmUxkgEy3ZMUX+cWTQWnNBK6/UAllRWnCv91SLEGAXgyvQHgY5N+eAzNgQMH1Yb58AJYYXiJ+sgZckmr9XO7mx54kxMmDNvZxDMxkDmbb/sbdwzLZ46H+czZu1kulFB0B9WeD8A2r5MvoCJuXkqRYBqveogerO4WrDRy6/xMUzyZigBRvZAeGtkXrsdGIlynyCB+13R73/Tl9P2x45BPcX5qD2W3hW3Tm54dTy6Z5/WrjzYOl/aPHk68KLADK0De9SZ5FNECwQKXH9EHPBxIcQefA2VrKZxQmZQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8778.eurprd04.prod.outlook.com (2603:10a6:20b:409::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 23:47:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 23:47:41 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Dario Binacchi
	<dario.binacchi@amarulasolutions.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dan
 Carpenter <dan.carpenter@linaro.org>, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn
 Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH v9 00/23] Support spread spectrum clocking for i.MX8M PLLs
Thread-Topic: [PATCH v9 00/23] Support spread spectrum clocking for i.MX8M
 PLLs
Thread-Index: AQHbaaY5gYPllLkC7022/rYXoeuspLMl+VuAgACmMmA=
Date: Fri, 24 Jan 2025 23:47:41 +0000
Message-ID:
 <PAXPR04MB8459537D7D2A49221D0E890D88E32@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
 <e2de94ab-82ea-4d36-a9dc-75f6891d8927@kernel.org>
In-Reply-To: <e2de94ab-82ea-4d36-a9dc-75f6891d8927@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8778:EE_
x-ms-office365-filtering-correlation-id: 91e3d535-6b3f-413c-ec91-08dd3cd17dcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?f/o03a5AD+7omKy5GGdTMWrMo+Uo0Th4QXKof0ZWWiMnN0xHe3gN07gG0e3i?=
 =?us-ascii?Q?ZIQwO3OI9Ut2gnJYaEuJq5B175IIgaF6o27WgENFNwWKYNyvgiGwkHiDjjKO?=
 =?us-ascii?Q?Yv074q1Ih1ntuUjscKMcz0aCJ7oQcC8KntWBNTiW4zKeFsBe/HFzG2X641CD?=
 =?us-ascii?Q?BsUn1prXF+De7abkY/Ja4UcJlMRTkiP6j6MaN5DQABqQUB0m/shkx63AEm8s?=
 =?us-ascii?Q?QJhpCLCBDDRUy1TO3jAyo5guumY+H2EAqewf83ZEiLHgguuDxf+ld+TzZpFf?=
 =?us-ascii?Q?nYaN+51o7XcNo8uCTXIql9kKCZP7k3gQQ1e5QyyPw57tZDAAKtonYb5e0FVB?=
 =?us-ascii?Q?1SG0p1uiGjRbUSGNcLRroRYwo+waJ2UNXMwXMvStyVBFxRpYiL0I9i4nKicV?=
 =?us-ascii?Q?OaeGWcTPyHo1qytUEpen3aj+3OkIXxsJalvvddocK+snl8d3cR6wwITAtPWn?=
 =?us-ascii?Q?BDYM/WcXxS6HbochlHB+t/sBP1gdkNOMNFsNKK8g5BVNLe5YMYuPrXqHVkMT?=
 =?us-ascii?Q?McCeTfIDZsrpzEulcPf8dggqtcd1Zj93gc3QZ97r2kqtRfkfaydbgUdV6aDk?=
 =?us-ascii?Q?auLw1twyekb4G2+sXYm5Ixpd+WTCvLPZySEb15ustrDOUscHONgAl8ezqegL?=
 =?us-ascii?Q?4P9NQrqhDCVqVlTTWsrq7VBDc/SrGZhpP2qn+jvJbh5nMAOcD+Y5Ichv5odS?=
 =?us-ascii?Q?1iQPbDylwkPBcZwB14mcq9EmzX09W6WUD27A8GQHpXeTxMYl8uw0//E4dndm?=
 =?us-ascii?Q?l+92ErzeMKE9LxqIJIzLDryYk2qr0DJxaBaBczKLtDQQ9mFeU8T7hwSBu4is?=
 =?us-ascii?Q?l1oTRmFjNzL41NUZSb2zOMRJAYYDxWSlV2zNPH78MIoAExIoTVw/WyaU8p2j?=
 =?us-ascii?Q?ydz81YcztG/qzBU2rUp02CFKi2tA7AQ2Gzbn4GQnKjVxPe9yMhjqLHd8D78R?=
 =?us-ascii?Q?SUEIgWAbJS9nP23kfbN2DOytzr4j2fteFwqVvOlA+OHcRaWX3NLtHnZxI6+5?=
 =?us-ascii?Q?i2P4gam7e4MehF4ZFe3ERoF8n1GkCfFJPenCjX7PRZf85BIY+iktdO79OSos?=
 =?us-ascii?Q?D57JTg4qyxAK85J1aoa8tDUxBgTU+bIeSBqqSYnCup6pbFPs2MrYnlQN4v4p?=
 =?us-ascii?Q?do0sViSJULN82slXuDOHSSKsUwTta6nkshYhVqoHPgmOHafLlmRXVqVtHdnn?=
 =?us-ascii?Q?KGDOxgMUQDcd/7nQOFIJKuvTm8Kpj8i8oLWlQ4j37kYExNAhoTgfv2j6L8bv?=
 =?us-ascii?Q?ljNnwHESS7qG+8pWhWMoEiJUyRL9aQy9xKTPHYzZq0L+1A4FgSZDR4bm4NqU?=
 =?us-ascii?Q?HMZgJWHu8y7YMI9iHxUpsVOgrvD7GqCnMcQk2cB81JI5QrIBxJ0XI4/ufu97?=
 =?us-ascii?Q?ALtVpudBnM/DdOr0apvS46Q5ymS88jNuY773zXolRhxqcXE9c0TgEX4KlDIs?=
 =?us-ascii?Q?mYOqBtiTGxtT05ds8RSOrgp6oc0i3Zrs?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qoXQ9cj2vgNQoSZPe8Syg8PCn6G/lvDSYa9YTNtKXC4XadyGeethqd5Xkewp?=
 =?us-ascii?Q?62CZ96YyOQ1CcY59o+9zyEcnCMiPCzzh6Ive0NzccUZoP3A7craxs5sCnBtW?=
 =?us-ascii?Q?6SdhN/x6axlmKm26yeTcE6WeJuZAxduvknr/ektINGMkDrGZ83l/jbypBNav?=
 =?us-ascii?Q?hPCCBWLOZ+48E2GhTJBdALk9MOCHnqNevj5TJHv+tS/y5znZMqHqR3KrU1vm?=
 =?us-ascii?Q?CrTspFOp2kCEBCnTi8EV537CLn54w9+l0f0cP5igc1LHcupKEBn2AxEEH4R5?=
 =?us-ascii?Q?mTstVUx93iyaUwKB6JbupmaBT7m1YmOTTqZKf/Ch63R2zv/wVmRYHwWTJozc?=
 =?us-ascii?Q?hNBPDVJ1lIAvZveZG27BE+E6FJ9LbCaBg8p87/7hIwEybLfYTWAn/gAZ9ChH?=
 =?us-ascii?Q?eZIu854R3CtFhhbsaLT+jNRmWPNWjuPoD9gqhAk3DIp01OZcF9K+4BxP7dFU?=
 =?us-ascii?Q?g0pHZi6mx3SxTUzOSNvGBuyygkS7YINweAd0o2yMljGMbr3iGrXKJSzAFt05?=
 =?us-ascii?Q?gUefoeSz8HreoHUKTkD02c9rbhCH9sYlVivWchOQSTUWXFJAOW+KIwRJlh7B?=
 =?us-ascii?Q?maxwhwR9Xk6UIJxVGNdku5hAigBH3b4+wBtpHQmk9HRC3BcA+b/VO1RGcUxf?=
 =?us-ascii?Q?eZc6b0Ot4NN1Ke7QOq/kWOpxIKXqdgeF97orbGkPMILYRkD+gLDE7nt/GuIJ?=
 =?us-ascii?Q?Yn7K/zRdmsVcszV0WCVHwlLSNNYWPeAn5I6RRUWiVW5zTEUNM3wBdy10jUJM?=
 =?us-ascii?Q?4w8Yi2qXoWpb8rHycaWZiDtXsAz3j5ueWmEPICfSr2uZtldTjlqG683Nx9O8?=
 =?us-ascii?Q?7sII9G8/Vm+WarRLF35wbT2kemlKHSZh1ShvCx9mY/yVmRmwHdmKbYw10JLT?=
 =?us-ascii?Q?8ffnFpW+BNlz+DvLYfxdQVY+rAeBJgx7zcfQicI+04I868rXYRSZE6OWEfry?=
 =?us-ascii?Q?hpKY9kXrtmKDYxglxt8UihP3Y+LBmaqZipV+1E8YcVD1lD3hK2vDERWtpSKL?=
 =?us-ascii?Q?G9UGPLNxZkHMxny2aETIN7ObeCHcbH+9hQu5BJVBy3H0jHPcqKJWzrGvPQnu?=
 =?us-ascii?Q?UGmFmgYw78zya8bQBNHp2U/4o6rXqhUq4ahxv4SRwlDmdqRICY2/kdoxufoh?=
 =?us-ascii?Q?VkwdTghfyaohG134j1MCEJfqpgQlp19o01Yw4vHEcG6aG2UafB/gWTbVu96G?=
 =?us-ascii?Q?hVmn+B6dfcITXsLdUKo++5S5NMlbsNubMTmQHIWN4iyc3zS5FwkbhA/QTgtx?=
 =?us-ascii?Q?jb9D0JBl41CrhmHHuPM1n39OFyssmdOiSnUmrzgVxzHhvdQfg8Y93OGrwiml?=
 =?us-ascii?Q?6blG24M3Km7Z/wragPP6w4GJ5ZCA1xjt2YRo0sE03ibahxodj5WHkKM01L62?=
 =?us-ascii?Q?6PCSsyRFWnU94/VB1pk5nC+iOZwMYpVJEm0EKDzqkUMo2BI6ycRIsXi73M+C?=
 =?us-ascii?Q?/qKeZqfkkT27komtUJBOkz/Y+972VdmFdBA5UdlgoOiIit5+X/e+YIvtqYgY?=
 =?us-ascii?Q?wiPgA8X4c7A7sC+fyvkHu83R2o1x2yTm6HnU02uaf9Jl6LqHf9XRnOI82VMX?=
 =?us-ascii?Q?4WPHpcCVnXGsr8sQxgg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e3d535-6b3f-413c-ec91-08dd3cd17dcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 23:47:41.3053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bQ7iGKQUM2mt7bJO0jeEl/QR3ZrfbxGpDuvqmA+qiT/3wnT/VKGst8ff5QI5lW1xt7ZcoPerYWzHW+jpUi18eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8778

> Subject: Re: [PATCH v9 00/23] Support spread spectrum clocking for
> i.MX8M PLLs
>=20
> On 18/01/2025 13:39, Dario Binacchi wrote:
> > The series adds support for spread spectrum clocking for
> i.MX8M{M,N,P}
> > PLLs (audio, video and DRAM). It has been tested for the video PLL on
> > boards using i.MX8MN and i.MX8MP.
> >
> > Changes in v9:
> > - Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
> > - Fix building warning raised by the kernel test robot for patch
> >   v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
> > - Add patches for imx8m{m,p} platforms:
> >   - 23/23 clk: imx8mm: support spread spectrum clock generation
> >   - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
> >   - 21/23 clk: imx8mp: support spread spectrum clock generation
> >   - 20/23 clk: imx8mp: rename ccm_base to base
> >   - 19/23 clk: imx: add support for i.MX8MP anatop clock driver
> I responded in particular patch, but let's respond for formality to cover
> letter as well.

Sorry to come into the binding part at so late stage. I just
got a request for i.MX95 SCMI CLK a few days ago which is impossible
for vendor specific properties.

But I am not sure "assigned-clock-sscs" is welcomed by maintainers.
Please also help to check whether this is usable for your patches
to enable SSC for i.MX8M PLL.

>=20
> The bindings here might get obsolete already with work:
> https://github.com/devicetree-org/dt-schema/pull/154

Not intend to waste to your effort.
I also replied in the PR to express my apologize.=20

Thanks,
Peng.

>
> Best regards,
> Krzysztof

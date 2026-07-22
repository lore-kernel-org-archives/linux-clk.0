Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011023.outbound.protection.outlook.com [40.107.74.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7C13F5BFA;
	Wed, 22 Jul 2026 19:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784747725; cv=fail; b=Jwcqf2GEn+rl0RbK+aL9Hdqg+wPsyZDTm/cp/oTlj0ljVgezhYM+8dTnhZ/dAM/A7dzuvSWStd564QkT6KgnxNJiQ/GXdP/ed6M89U+mw3jMOmaGRzmbB5cGHHL7rbAASyQD0eoZcqMfpd2BEd0SZyAS0RI373Dow8+dCp9oWR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784747725; c=relaxed/simple;
	bh=tHSSUSKfUdwMsBBTugm+lUHs/+QKNeYAMEiANbczAeY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fkEuFIVSMAn0eJqzJmeMxcftKXv87d1pEzBzl9xUvW3v1uYSnWJxt5CQir8+WogfhxFb9eMg7zyEEOdP/jjgnX+AkbuNYsle2Gm80qX5ONHYrQqW9gULY+f/lFnaXA7R1KdEXQtvrpUa1D2POzbDVYe93j0Xv+W3NQjCKe8bKSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lLvH52yg; arc=fail smtp.client-ip=40.107.74.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lLvH52yg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sL+DnbL7dk8YxCKNSqbKMBFZx0Kaonw6UW7ViWZiHgb01UqQ2wb7wIoiKBCssSpY5lRRO26SOAWRR3NDud7gFzBD81fnyVsK9QhGul08gHyi5gTtTfNmDcH9wTk8m7jn61awI94kXjhm0E3+yitjbr0j5bKriR1jtl841BbCko1ZYOy9p65L/tdHSdByBkbmWETT5prhvJnPRjKyYbdA2jeTd8KrSYG7CgP3qABeEn8C8UB4JPht5zeDupXvPjRMfGVrFsErW4mcTPNnDUito0U0+YJU8331B3tZw80c7JIocpeWcv5mZLqPgJbP3x5iJ8mruTpMz1fbaTyOGh/0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpz7RN/S3FjKBibB7lWH5yFcm+bl6CWPwaktovvrmzE=;
 b=KcQ88rgOOFx6hVEAF5H6ZFXH22ElH1/qX1c/H9JKpG4UHCb5zb6Ym5EqcOTnFcOejcRnKwXi6tlp1lnpp2BcOKxjRJD+B5b8SFvCYctc4aXY1lQgenRMUi7gUDPn+M7P3zu83McP91Qiqr/zxkm1LJhPLQuQoWkQ+Gx8nfAjW2M/wtldsUMEE9ey/xIoSxQtDurx+GdmnZGSfv3bW9q08LuPKXyz7joYfhldExIkq5vVtxZdcKDH0S1zVGqE6Nfii1piAHudWXCsxKlB2xq3+4kRTPQRBSy59lUaskLmCj+bqKSybuAynWR7TgQBF9zSxZtRiVpo+o2P001n6mqFKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpz7RN/S3FjKBibB7lWH5yFcm+bl6CWPwaktovvrmzE=;
 b=lLvH52ygP8IsU+/3b/PH5Hawlof23ufM+AxU6jfima7K1B0B7askDrmo6SVDcDLDxwsyymWRT793GB/pkUs7BqXeayI2axeME6QZi2SFNsFWMpQXra76sChgRR1P8MFF05xvlQZkVVzjWjwVbg7Mn12m6EiJnC6XbZiMIDnOH/E=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9352.jpnprd01.prod.outlook.com (2603:1096:400:194::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 19:15:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 19:15:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v4 0/9] Add RZ/G3L USB2.0 host support
Thread-Topic: [PATCH v4 0/9] Add RZ/G3L USB2.0 host support
Thread-Index: AQHdD31PanBotJGjU0WhwiGgIXx1z7Z5/a6Q
Date: Wed, 22 Jul 2026 19:15:15 +0000
Message-ID:
 <TY3PR01MB1134672A4A05BBD95782F70C486C12@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9352:EE_
x-ms-office365-filtering-correlation-id: 24b96e18-69db-47e7-9293-08dee8258f91
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007|921020|38070700021;
x-microsoft-antispam-message-info:
 YIOyT98KsdukiMN+Ptw9hvrxdyS7lqdqDqdoJ2lMDBjes3Fso7HQteyvqerro2ESiiA7yoAdcYcMdH+XwmxvYXfK0DjNmzLVeNkRTno5JkEmPS4J/ZCANi31nnODEkLsJU/l2gPjZ9nwY7kvymNchjWxZ4gICfSmG2p356NMf3tHAVzGBv71shxzkY4JgiNl51YW89rrTXPRNy09vgwPKpdEVm19WXR8NqW6Hv2u/husfgW4yy8Z+n78U0pOoNuuNpLsVZYVxvdZvXfCZTdNNGpRGg9VTg0mZJcTqlwN8jcZ6/fJxbuHIiGFR2u89nDA35B2JL+UiWD9MrrmFGdTXtHO84vhGz4XBXR5zI7EHx4MLFbfbFObPRWRW6Zq8dQnC6o0jup0+eWpX/mCtcZth79iQ87e/fopOMrDW0bsqT1+G12J75D+6VN/bo03MmF/z+D8fYl2PYtdN04GUeIzoEi6moUmjyO6K7lUTV2cSX/M3hwWrAbwh4qXJKtKc4S2MrEDWeznxxGXlCMeH7iqYMLQcUAy0zPLn9kGzvONYSLZIH9VbHgH8J8P8M8UoaxpOcqZzoVHswq56ovJkMoZOuA7MAFF1+mz6qiKEKKljOF29IqBf6C42TI/qzLgPr/XAN3qJ0/DO8O1f0V2Rj8H/Z4tGoeA9pjQRqiyXlgS8MrDjqatQeGcfErn85NPHDz0B08I7DvbPnRwvOF5zhvg/WuUwBSoNm7Bm6bdfspXCu76rPgP9KeBGn5Cd6XIt02k
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IbeWUcMd+zT4b4w8+9zdq6HDOzgMonTPShZ0x2lPP6JrqTR0p2zlAzMOoRHD?=
 =?us-ascii?Q?8/COufeTxpyNE7L7lvkeMzaoCwex2CuG9GjvQEHdsdQD7X0YLvOvM3jWSVM6?=
 =?us-ascii?Q?TzUH1VY6TxCzsIgKjWdQjnwtJt278hgOeCIJmHXiUBieSulpATEipg5xiH/h?=
 =?us-ascii?Q?0ctuOEKrEEuaJWC0IqkB77pZmrSmQNguhxz6T8IA60OgE4yRIrhnmpO/jK8H?=
 =?us-ascii?Q?rHTGIaR4xmTALOKGShSeg11hZOU4XoUOkFhnQPK8ZhtoVl2/WXFgBbVTT59p?=
 =?us-ascii?Q?LeoYhyXH4vcEUI8+40xS1SEgczK4SUEfCghO4FLjjGtQbcSX58HK6AH+81Xb?=
 =?us-ascii?Q?5IfqeZvUK6ps8UUU4AX3l5FiODh+DT9FoAhK5Nwxo9J4YSWrRLqhVN9Tq5mb?=
 =?us-ascii?Q?Xwuy5JLp7k18XjzpJq6wx1r1kfasm/85XQofI6O/sxDOvD31j67ST2rSnxZd?=
 =?us-ascii?Q?QB37iyv8BAgnS+X7AcHHpiI4Ooz41sGxyeZgQfuoLj76pDQgSLQw7P8npAAI?=
 =?us-ascii?Q?DJS19QYgNBTczBG0hTxrWu6k0CMy3hp1yYKrARTVXk8D/4/eFNF0yU/OnyDn?=
 =?us-ascii?Q?I3hqz+Fur8CGPmPgUT2xt+hMPxHcq6SlcAI7D1qbuwcUj0SgpQeuHgn4oSPe?=
 =?us-ascii?Q?4khC5WR+0v8ISJHvlJ3IEnK3sFktbsi/N0s4NPtOW6JVxUe0FA9u4JGyWSYE?=
 =?us-ascii?Q?UN7jBrOqz7Ftf6y1fGv2HAwQWp1nC3V2iPX7yTTyY+7n+ejzaqTMIWXhDmvp?=
 =?us-ascii?Q?1KVyL4P6KfQBs29EEXOafe8GepS1TuMcVD6M+b8mcnWTuekGvR93P9HVt1et?=
 =?us-ascii?Q?WFpz3/sc9E4WfIEiXJ2UnpYQA2X6U37szEeG0/EFQplgc8AB2aYqykZIUJ/N?=
 =?us-ascii?Q?DXqhWIXB5O3SuivIV7h14Vx9VA9VWKT1OWe81UvnrEV5In0jgjxl1G0j9kYz?=
 =?us-ascii?Q?J1EFyvPKDdrdeSwT7He/cWx0yjNyRJZJv62KgRoK5/KiFLzWMwCLIJXIRMpW?=
 =?us-ascii?Q?daA3N7IX9rdi4LuXzH/14vKP7xmI+lbgMGKhIBiXLw/oHkfg3FaBCqsde7n9?=
 =?us-ascii?Q?qa/gWHJ2pcRXIp1vUpDhRXaM29C9ZqA2Gu8toEKnw24ZP++Rac24nPePpfMA?=
 =?us-ascii?Q?QQ2AL7x0n6KlQdNnQVhjg6gD7T6QxdGCqVebg7im95WA3Tz4h/hqqNRsQZj0?=
 =?us-ascii?Q?aiyPXCaOuI2GxFwbAl++ijM49wodnnEFXQtVIA4KKxQj1+nNMyXZPVo+dpNe?=
 =?us-ascii?Q?hXSLvDG6cynv70p1ruiuh7x+bfWV0Ki2i4w9b/hiTj6rkoE7OmrhK79Wjt8Y?=
 =?us-ascii?Q?DSXdhUO/PHxLU+O1vnIopKAL17zApOWKW7EGoiYFFeAdQU8bLyg47PVdx0b+?=
 =?us-ascii?Q?Ljj+Lt3+XAqU0cDMw2mKczW/WvT/uTCCbPGQtRRTJ6aAbvRyIMIOJzS9a5+c?=
 =?us-ascii?Q?GmQRpdIu0+WjA35sWMDYWZ/YRmsO9RHNL6kr/49ej8t/hsUNDCu5zg8OEOjS?=
 =?us-ascii?Q?DIlZgWXCvCmSKCw0uXY4+guCd+adahe0ChAu88YmVbay1XqWppaPkka2fukw?=
 =?us-ascii?Q?LrP9DXcAn0d8CVkN3Vf0vz+dndcCXr7iMZgjjAeycLG/seb8z799YZWFBSXB?=
 =?us-ascii?Q?Os3BwtoY5N6g8utex90+Y7Gwug5eAG+G0LS9UVmQvFS1kVQRCDT8CllvYP1s?=
 =?us-ascii?Q?2RHcSGedORd39sTe9Z2C6mucH6Su8p5laHikAKS8jI3gj/oAyD+YkfY8HCpu?=
 =?us-ascii?Q?cumMLmqTdQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b96e18-69db-47e7-9293-08dee8258f91
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 19:15:15.2756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y7+vYOzExyPuOe2Wr0tufgW5A0LvkDz8DrOA355aiJKxj3VIYXjUo9aJDjptgRnUfqKYQvl1WLj5CYu2KbwXPgfl62eDk8uwJzjs4hIbhVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9352

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 09 July 2026 09:31
> Subject: [PATCH v4 0/9] Add RZ/G3L USB2.0 host support
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Hi All,
>=20
> This patch series aims to add USB2.0 host support for the RZ/G3L SMARC EV=
K. The RZ/G3L USB PHY block is
> similar to RZ/G3S, but each port has an OTG controller, unlike RZ/G3S, wh=
ich has an OTG controller only
> on port 1. This series migrates regulator driver to use id-table so there=
 is hard dependency between
> reset driver and regulator driver.
>=20
> Merge strategy:
>   An Ack/Rb tag from Regulator Maintainer for patch#4.
>   Patch #1,#2,#3,#4 - Reset subsystem
>   Patch #5,#6,#7 - PHY subsystem
>   Patch #8,#9 - Renesas SoC
>=20
> v3->v4:
>  * Updated cover letter with merge strategy
>  * Reorder the phy binding patch for easy merging.
>  * Updated the commit description for patch #2,#3, #4.
>  * Moved the handling of regulator_driver_name to patch #3
>    in preparation for id_table match.
>  * Migrated to id_table match using driver_name and reduced the length
>    < 24.
>  * Dropped rzg3l specific platform driver.
>  * Dropped the tag for regulator driver,
>  * Added id_table handling by introducing a common probe().
> v2->v3:
>  * Replaced items->enum in reset controller bindings.
>  * Collected the tag for reset binding patch.
>  * Dropped clock patch as it is accepted.
> v1->v2:
>  * Dropped patch#6(Introduce helper for regulator registration)
>  * Passing pointer to an array of regulators to make it scalable.
>  * Dropped regulator1-vbus and added a regulators group node.
>  * Updated commit description for patch#1,#4,#6,#7,#8,#9 and #10.
>  * Added enum instead of const in the compatible section.
>  * Updated schema check.
>  * Collected tag for PHY binding patch.
>    in the regulator driver.
>  * Added regulators group node and its children in SoC dtsi.
>=20
> Biju Das (9):
>   dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
>   reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
>   reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
>   regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
>     support
>   dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
>   phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
>   phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for
>     disabled VBUS regulator
>   arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
>   arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support
>=20
>  .../bindings/phy/renesas,usb2-phy.yaml        |   2 +
>  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  48 +++++++-
>  arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 105 ++++++++++++++++++
>  .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  49 ++++++++
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  20 ++--
>  .../regulator/renesas-usb-vbus-regulator.c    |  74 +++++++++++-
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c       |  44 +++++---
>  7 files changed, 316 insertions(+), 26 deletions(-)
>=20
> --
> 2.43.0

Gentle ping.

Cheers,
Biju


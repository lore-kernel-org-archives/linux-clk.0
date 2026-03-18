Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010032.outbound.protection.outlook.com [52.101.84.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E1319CC28;
	Wed, 18 Mar 2026 01:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773797676; cv=fail; b=FsJ4HcjFgoPo4qdvvAZxQtajJKcj/U8WIFjFcTt9a9k7uQWOuFHSfQA4Hh1kVqjw8HlXq52he3IhF06NMkyacLs6YBO//rxN0+fbs7edoZIuAd20i8FlmD4Boritu4tKcZVqxughayymL9l+B6xtfwkgOgeQVwOiiJVmfKR0T+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773797676; c=relaxed/simple;
	bh=y/sPbwO/IS/dlyOMyqOdN3fV8xMMIea2XkTBrzq+MNQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=odGet8Z5Iu5s8HASg1bVk6U+09ITJ8rY2UrZCpQ/fNIfqHhKmhjyjUAlNXjkRc7XTfSxMEG8iOn9fGfe945mMmv02fNQVOdCT3fA7D4pz22I4jsMRjy7a6n91BgWaGK2YGUqskRXQ8pDZuAgb+WzPRhEJERZuA0pmxHoHD7aFDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IvGiX6+2; arc=fail smtp.client-ip=52.101.84.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IvGiX6+2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eogL/8m0twUBooUr8okVEsPUMIGYxk6JF67HnbW4xZ0eBtj3JiwIXa0S7O5LVTD5/HtOHFJnsuDB1LaUEb+EPr0PlQiX36bKlkBdq5G9yEIJ5sC5rVG6QZOvgaIRagCUOcmsTdBBTQV3yV0wIH04iFTmJMmQE3wyZMWCMbBEHpMti03PgBkPqwMZh0KkwtprypgHdXIF/0Q3A+kilAcZ7DOrZ/QtJwxTq7oft51hWEt7PSlTR5EjUdQVsSA25G4wsNiVLMrAHuw6rjcmMGGhqh1JF71MGz76JaaMJabVRwHrc2WFy+qp/qOg9x7GJ6lgdbjNeQLYv95l/DJbA2k8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/sPbwO/IS/dlyOMyqOdN3fV8xMMIea2XkTBrzq+MNQ=;
 b=MXMu8A0k3NDSVxNG37R2sFMr7jf63pMk8Zel5clHQGeGqCF7HDybttGWUxGLYjxBOR28SgrV+7PpKpKubcZnlg5rMEYoYcq7tfI7FIpf4rFDtGAxq7vuqvaXGLJuEUwOpMQhoaetBjMXVQUsikEmv5tvwjXzkvcHxqUucwzE77aF/w2wXNCkHlgUwnvETOUfXuI2E0k3WhCjLSTkwH6eapUDcXBYQt6VqVM7l0FhwLXp6oQB6fFvQPsasOSc6IzFhAOJ9LVuSjyzoFsu9Mnhba/PLeEGLODNiRitwj91czEnPjdm8uwhN3Zhz1TTBHk05T/x/2YS0pNwFkBCsj9hhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/sPbwO/IS/dlyOMyqOdN3fV8xMMIea2XkTBrzq+MNQ=;
 b=IvGiX6+27mIhOPJNer8dTLjVtr7zfhbBJ/nsZmlmY7yYOezr+zgp6kEPLrWqkvyplSqqxBYbCczMHcg4OjX/f9nDZn3DW/54tQ8YEs2FrUEFKhSejrT0WaQpN0YRHUWCLU/y/PitcsPOCKr8eLVF0ElbOTgkjPuDkNiabaUgZPKAWXbBBKplGEb2ILKd4PpI3U7hu0FDgh/rEl0VoQR5Ottc8rtmEybu2ea3Cspa8dtK/E6R3GxRpkSKd6lAWJRc2rdn51cCCPzvlB4dBdTm7iMHHKhj2OdzvNzBfosXI6zCOEzrmujQvCRLitYo3Gp7krHy6s7GZIRICGeK+to5+Q==
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PA4PR04MB7837.eurprd04.prod.outlook.com (2603:10a6:102:ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Wed, 18 Mar
 2026 01:34:31 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9700.024; Wed, 18 Mar 2026
 01:34:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Abel Vesa
	<abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Daniel Baluta (OSS)"
	<daniel.baluta@oss.nxp.com>
Subject: RE: [PATCH v2 1/1] clk: imx: pll14xx: Use unsigned format specifier
Thread-Topic: [PATCH v2 1/1] clk: imx: pll14xx: Use unsigned format specifier
Thread-Index: AQHctghP06OSQ6/h3E26NEcW0cj0cLWzgo0Q
Date: Wed, 18 Mar 2026 01:34:30 +0000
Message-ID:
 <DB9PR04MB846111CC304C2A3A19388434884EA@DB9PR04MB8461.eurprd04.prod.outlook.com>
References: <20260317121953.1100619-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20260317121953.1100619-1-alexander.stein@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8461:EE_|PA4PR04MB7837:EE_
x-ms-office365-filtering-correlation-id: d730df00-fe1d-482b-21b6-08de848e8098
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 +Lz5oiNMJBW7IJt7KASal6NLoTNR8j7pvzuSDwLLH6VQTCv8zVnIv7H18HuyM2/HA0WV/dNDDHBXfr0ls2CH1y3F806zvsZcxIX7bqdsSG0huvVPKG12Vsu51WkI3ZwzgOroNnOpla2kEMKcFVrrd2TtPMSuGUGIc7ma2tjSA+ZD7/bs6iu0CgEZnQ9rFNwsggW8lN2VrV//EVHb3yWhZJMUYH54boLgR6fKAUXrYPpbBe7sqIoC0fafeC9/VicVs1t2G0GWC1b/B7oOIE4YMN1kdmX3U4yqrmGtVfQsfiUDP8XsYRIvMEMK9o51kMv9KZhzTl/KpUa6rFDtfp3v/R0O1wUvUdK/o28vD+Tj3ezLSwa+kkGsXNg6PsY9FzQZRu9xzG4ODHZvKnP1LLkoQslojXAEV/rqkyD4hg5dK2V8shTbWOF2DLJ0vJdJMsHSvapHxM91SagEa5Y6pV1O0ZtiOzt0llnnyDa782OZ4GhQCiYSH/1P0xrE0NlWgZGtxRRmAy7qawoq5o1iixfxIg3FVk7WQQfyw7jn1gCyPRs/D0aM91sDQ/ja/05WmfZvWJdzZdBwG1YulewwkPsaQ3I4vcUxAovxlJXY4amRovh7r5Vh8hcD1eW3aG2mOI/3pXT988g7TyEftmKkCMVtEjP0lxJSuxU7RYda/UGWgoT9StULZIhiKBfFmEykBUoYejVuSBgvLrtEKmEC9Olgw4QVi8RltySIH18V6Zy0pDQkPI7TW4xd2j8XFXrK8tqAhS4L/wEZvVCJLcizDAgyyqYO+L3gMv9YUB35YYa4V4Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cgKYaOZIZX9Z4e1m9QsqHwFydShq+rVX8kRFMrajKF5LgN0fNRCBr/HEQ1i1?=
 =?us-ascii?Q?Yb1lvhSW71EnLnLHURkTu6g6FxpAYacDGuZsj/og3n5BK6uZiof2kHtuIA1R?=
 =?us-ascii?Q?jOJuSX2SaTebd3D43NX1T1SdpaZ46iSqNzbHq1nS3CHGUuXePTrclJZZKfiO?=
 =?us-ascii?Q?VqUzhNTbsBSO9aEKCV/8+amjqPG81r2Bc2bRRZXmCxXyuNUBoBYRMI/nK+Rx?=
 =?us-ascii?Q?x+TMsZ1UrBr5jJ/ZntV7ivHtaRI8IlqgQ8prHuIi2EwPOR0awYBhqwC0mxlI?=
 =?us-ascii?Q?v5oouYS935abG7L7y+wSM2jB4aMJr9Kp/jTcmkBg45a2dllEInAIheFR0qKC?=
 =?us-ascii?Q?8DhEawQWWn3EAgsd2hngpBYYBf/9cP6xc7Yhl2yqTi96tea9PFD0hyg1thPv?=
 =?us-ascii?Q?aly9t5igv31+w8qYule5OgTvXr46RDyBSU8kWsWWoYuINyuNT+4AdluYdx5L?=
 =?us-ascii?Q?vOVSH07Rr14KdwNpyUMJb/qya7sUCz8/vuweCVuCldj3YabdpaDACll7W2pU?=
 =?us-ascii?Q?GljPRI5pd3cWSrgoaJ/iZEeG6r3CE6sDaQY8VVoQR+mFRXRuehmeHtSvpIZB?=
 =?us-ascii?Q?tGeLCbKZSRfose6qIqnn3OUpJn6F3uew+cmqHlw1QjwlQaJPVlskUeCFQHaH?=
 =?us-ascii?Q?cRvVHU5u6c/SLjfcmw+Moi1xkBUJhB975nnOj/tURwqMqpYg8eMO2HV7rA9+?=
 =?us-ascii?Q?V6Hq2dt0ZFuV3qiZXewUI10Xui8SG5j0wZn1L23mnEKhVoEw6/GDV8pDH0Ls?=
 =?us-ascii?Q?pAxXp36JMG9afI0NzhKD9ibknai5p8TApbgpe4imkBCAZ5S7u+Ed9uQ41m2G?=
 =?us-ascii?Q?KAiQjm9ki+ryYK9CG8ZjaJ3L56jbhL2c+yKUCeVw4rMW/grmHuIZwrThA/hR?=
 =?us-ascii?Q?/GRH1zcv0tkzqSv2JFpsWMmiGCmNGqkvsqCCyYLCRs2OI1UjliHhJbRTINgA?=
 =?us-ascii?Q?DsQKkgcYJHl5kkKvcCVdkcU8O3fGEFAZv9pJQNHe81T+4qf9C40UIUzx00iz?=
 =?us-ascii?Q?ydL/ZrBCTSow6FHWHOqpFkpy/sUgW5XX1cXqVcnuZZZ8fl52iv4qm6qCd/zD?=
 =?us-ascii?Q?Gq+sZHiBSzlAsQ6NM7YVnzrqTfWZnmzwgNdj5Ik4yumJM7CNulyjv5GkCcJC?=
 =?us-ascii?Q?7Hcj0Wk75k55kza7BcB+V9IGfI5v7IEsazCzsLQnsMWEU1F1j95cSKNoE11m?=
 =?us-ascii?Q?kWznfBlMj7s/WIxu0WgzsufXm4nYIS7MQDkqfxiwq7WFq694Wm0Y5U3xiCvm?=
 =?us-ascii?Q?nRwSfspkAeA65V9Fvy+nOpEr9RogBoMvWcfBsf25kser43kGPFAZ4YfrwcTu?=
 =?us-ascii?Q?XY5iwqLtjcRb2+1C7jyMjYvaPE+6zKRWatWG191R5aA7hl1Bx4rHyqmgNaeP?=
 =?us-ascii?Q?I0HiZ5dJV/MF4aSWUFCGRmkBk1jFqRseEE8sGaTUGB3ey9RucCXRqFbipigW?=
 =?us-ascii?Q?8FCX4u+9tEsffs6jGnXFCUYkp7jAg5wd0epPZUADj7FuhBUTPRlhJwXzcLcI?=
 =?us-ascii?Q?fIUPhLmMomupwIo44k9v3pM/VuObzfGNI0H1HJWjUWDtuRC9HKROIKXfCCtq?=
 =?us-ascii?Q?mhf4Mu01KIjPIy7LDAlTo8bj9IqoywNn2nJ5ChrErZTbWBWjR9eNalKaBBVK?=
 =?us-ascii?Q?5WM1Tpi7q6gz4z8K8VhqAxPFIIuNd8todgWLBlnamqix5Ha2zeanp88qK9Nw?=
 =?us-ascii?Q?w9NgfUVzgdB4jX1jaKgc0yTJMFkRRJE6o0ot1mSznjzRsM9c?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d730df00-fe1d-482b-21b6-08de848e8098
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 01:34:31.0290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CosaM6yx23NoQEWGXb1mEyu82kp8OuIl8mq5Kf+RRA6ikNpD/eHUInCrf9PQVuPpCMq//tzJUKrf4cQKDg9ULA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7837

> Subject: [PATCH v2 1/1] clk: imx: pll14xx: Use unsigned format
> specifier
>=20
> The debug outputs use %d for clock rates resulting in negative clock
> rate during rate calculation.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011025.outbound.protection.outlook.com [52.101.70.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A23130F816;
	Fri,  6 Mar 2026 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772785289; cv=fail; b=qrtlDWKb0QNL05EIvr3zH0nSExuxfkrtQ3VxjIMVNGjlXKEo5+8Ip+o1ZzHXrfg3uc+WeUAHmsHUCr+DTn9L6L9viFffS/jtd7nQ7DS/5SmvKPYT4uB9MhW0wWSdjEKdFQT7hMEMHoKBn2F6+LL6h1IVuNgbmQhCeofvCLs3suQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772785289; c=relaxed/simple;
	bh=SjuT+ybmrNtgFygZDxYXgXwlQ6dHdKAveCLWuiQrvTE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iZsEXY0C9KKy9+lg0teAgWgdWZyFFY3QHKIRtqwEQL4YhbfgcLPUZzCbFOKcXXCmUKvnOcdvpRmM/mpxLLV5T/sXpnOTIU4l4eMTp1p+XiGi/NlA91fVw99FmFto+DzEd5TKZ/k4XuN1P5Aoqj9Zr3TSc9m53jxTGuJdHiHhC1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gUgjSGy7; arc=fail smtp.client-ip=52.101.70.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gUgjSGy7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSySuJ72idMEqZuItgIFuxuZTf8jLpimaSw26Hxq5xmJ82J1uC61GYwi2GZCDZNUUBn3nwLqhA2KEIeBdtTBMpXP2sJRejjhJXT0JqkwNfqYh/L7ooIXCA97j+5LsmO44OVizyCGqwj5WEcECjI9SHunomoOJnE3ggv+lIHT65+XWB86Vy0SaET7HM8aP9NvVHHeYLjBvhfEybbdudUQeOJSt3Qdq+YYlIMkf3Gz2CcZK9Zizj1YU8Dvw0ytEYX/puGa+jiZjNXfVzR9ka7ylm9jlZiBvHArwDjzRyS0V0icSPxS8425sod7fHsT5gjuQJm0IkRtb+9lO4SvVNHPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjuT+ybmrNtgFygZDxYXgXwlQ6dHdKAveCLWuiQrvTE=;
 b=Lsc8waCRcGjh1uCLsykboccU8MrmreuiXSTHtK7Sz1YbbWLVV1QVsNdGiKHyjqa4k1DTAqXuNXWZAFoRrVAl13bhwqocxDwHl+x7yRkBQavTpvJd67Gplwx1XRQJuxJzDooQhIPCluv+DFtn8Ef60V8h3zjFTssIb470ZWVR8/ql88uOgeJtr1ufArn3m3duOu1jL8sJwVrWFsP3eJKtJOoG4GKRXkhSYuGqcd1naS2YCUYT05L7430wJUykC1AxGHak2Df1DB8o+rO3gCN5jbePwXJPi2dYIQvODngowTxv2A41Mr+yrUXh+i8vIarr6MDw+lz/TkYFGXDybR+66w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjuT+ybmrNtgFygZDxYXgXwlQ6dHdKAveCLWuiQrvTE=;
 b=gUgjSGy7/qvgeM4ypiddzLTSKWGnqIINvHUccGQdBpYbQ3hODFg3bvncvx/HOCCz+7D3QK/xwAFUsK4WmAwFJo3xaKWMQF6vtoMmvi+T0zWx870G7yuSFnb8gL5+3e1vhPD1CgqtJ7yH/ARKhklkrTqJNqhpLcJTZpnf2xrrDOHJmV1IW/zjBQ2x+QvCiI4R3AUAPil8gxRDCkgl0pcQ+1G0UsAll5gn2IEldlSzPVqVCWr7JvfqrQLa7OpBKaeaiQEB7nRWbyWIqItd+waPU4tdH3Cn6+J4GW2ofKhzQeaSXZTEEtz7dvoprsnySt+AZv6JfJpdOysqbR9uA0UapA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10432.eurprd04.prod.outlook.com (2603:10a6:150:1e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 08:21:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:21:22 +0000
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
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/1] clk: imx: fracn-gppll: Add 333.333333 MHz Support
Thread-Topic: [PATCH 1/1] clk: imx: fracn-gppll: Add 333.333333 MHz Support
Thread-Index: AQHcrL3QVSJG7W7Y7EKPjmvmJhKNh7WhKswQ
Date: Fri, 6 Mar 2026 08:21:22 +0000
Message-ID:
 <PAXPR04MB8459E52FE318114B8B5F54FA887AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260305163314.2642523-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20260305163314.2642523-1-alexander.stein@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB10432:EE_
x-ms-office365-filtering-correlation-id: 28712075-6eb0-4704-fd69-08de7b5959b8
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 Ti1+XVVZrP/dFNvecoDEgNS9Jd2fstZlhq/Hp+1Snrc4aYVm6ORBPEcYO0LhHVZyRwxksKRuS02EsXbJrH+knmo2hDlGhQs4QLdDzBLKCqkK9+Jzu/xI1sv7m65anDoQY60czQTSpQlLyDpup0X8IMsT35mnU4VcVJfAvtsebK8jZvKUjNgoWCgiG1RXXczA6WWZCD4WRUPXCgCPZ7HkXRHZBrwu+EvEha1cew+QK+kPoWXdpotUfhzrPFYxdMMkOvVWWV6I3S5t6rYj62yIRHtriI9PP/E3yyD0jjwFtV3rt5tcF0F+qsOyRwY2ijdRSjwiNrOu8LCYAiY3ClhsuMWPAXAj7SIgbqmgrhLYOMHzBHWAo7k2cgc5wqGTpT854RcctScFVr/5Ja6lsy3HPkb2uF6jKa4DSyUOr+PtmZd/Nu4K/F36DimtBth9kP/U7rKG4zE45RtZgHtWm5rSH7Kv1tPJZk0YgwGqD4tLLUWQ5U4/9MQUIyNIEZoy0niXpUAxHhjS/+6bKpm+OStOwOqaDjDUbzlgjWgQcSSJpVAEfFT8Jiq0+CY++k16EaWfmbgUhrdE4lppdoTpbo4ufID79aubVn7mUk5ynPuQnA2NglARgpTYlpRPWRO8LG9oSMO7AdqQlFOjEJq1BiEBGvIHsYl2oFB5hIxlGH1W27AtARBvyiiFrSFZ43ehFNf7Alhtk7QmY+7U3tYvmOZlD1EAn9h6vdhEeYRk4xdHB2PWghDhGcQvFi57zvBUpEsDBjND+hVkin3VH9g0P6tAK9ZZ+a9mKatWw4zGfRlz7jc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?90CTMto+MAkG8gD9q9C+LIsfe6vMwL+vqAyi8Z/Z8oaSddJLuaZDdBzdOQmY?=
 =?us-ascii?Q?eu/VE7smcMceCzbZtE7leLiaYPHR1UTREIkXNblJEGIOFKsi3ncle+5lcZIJ?=
 =?us-ascii?Q?bz+qM9biXzT4OISgH2xN8SpRFUvfWbtvS7VX6WIY3MXShzos0kkUu00Rk/GA?=
 =?us-ascii?Q?gEHbH/hEXBvIE9qU/ZRyo2Jtg6xR4Yf5loOrEhIePtnC9ESG36TrUMvAgqIn?=
 =?us-ascii?Q?jOKZrg9yDkSRxAzv6mednOb5gOcbd5FqANVACkJNQ9pIewZmzbXdkVQBwvyp?=
 =?us-ascii?Q?kqyq7keocFZMB0L8hqc763GA98dRi88HyKFI1TKFZ4Oo53vgUoXwulN3MbKL?=
 =?us-ascii?Q?+2UrWn8P8G/bdJRxeaOi+d0/r/mF8DsdydVR7GrLowL8ftxZzEWAHHxuwqAT?=
 =?us-ascii?Q?+4LK0EQA4j0H7B9O9jBG9qwuzPcraZXUM3PYjOw7JXVFJY/t33/0Pzwl5s+r?=
 =?us-ascii?Q?8k9cqeQbx6dSZ18ygaMLcJxWwzYvFn8+N1qq3NUUPVak5aPseeUehnFZJVwS?=
 =?us-ascii?Q?8jx8tWXFNPkxnRprApnQg2gzzNVq3yvzTC1G1NY26LXN0WQXVQmVFFCItQyw?=
 =?us-ascii?Q?srJGaitg8Z45HUc1GaiQCk24tMrGvoiWYFXbAYA+NPFMMfflno73uBCy3Ekh?=
 =?us-ascii?Q?q2XbJX5sL4H8s+SqJaFKdoE+5iDzaVdWwlbrNXKr7FprtcoYPEwS1muNVB2k?=
 =?us-ascii?Q?flfktXLXEAG7AlzGFELOK+84fbIfxXJzGUiL+txGrToCIZgLeFORMLY5ZOSN?=
 =?us-ascii?Q?ib0W5XKrIiGzzZr2gvpD66j/Uioem+uckAsEH2uVYchtKLE1nOtYCJrB3TR6?=
 =?us-ascii?Q?61iePeo8Xl9qjnRgafz51aG88P0TNP/Y7iEOXSs+KoFpMUmr398VO67EyhnD?=
 =?us-ascii?Q?u2mIwFnY3T/xAdPTVPL6kyL/QmpDSt4vm/+qsWRH/F6h9yNso9MxKX1r7IXm?=
 =?us-ascii?Q?7XndqhIKhMCPNLNQMq95t8J2IVK2a+slF5Jq2wQIKikNZ3rFnW4leVzz6fp8?=
 =?us-ascii?Q?HpvkHqZ1PUt2aeESeDbJd9G3ZkcUEinppMHWAyVVAU3lT4snqC/p/xJj7kLA?=
 =?us-ascii?Q?Z9HlGeijmaiY4ht7UkFlMWSRWF9ljGGicFd4h8Eei8KRa88FHg0Iuen3meN4?=
 =?us-ascii?Q?6X6QI8Xhs5jDNM8F19Tmk5bCOs6QO4x1DlW4tl4pAEBp9BA0a/5RmFqvN25m?=
 =?us-ascii?Q?T4198dsRbMXLqWEfpNjHBLmStL1Cmmu6ms21ftW9e6sAH4nYVUr1Hxx/BEXz?=
 =?us-ascii?Q?eXhJ4EqXoSr1LMKwXhX+s105R/TT2D6jWhLLiGg7niktueV6JIEaRZq0scgH?=
 =?us-ascii?Q?Q41DlBZkNvvp6HwcF9LVLKcSt3q4UL/G6yklwtVoEpAnsoMTcSzzyFYadhq8?=
 =?us-ascii?Q?918J96so1DnALmkklJN5o5yszNwV5G7HkBANr/BdD2WzEMqkgMfjiBLyYM6c?=
 =?us-ascii?Q?YbPmcvduTP6ocT5pKiM9Qk2ryWJjCDmAMOpzYEAusNqIqhx3ftmyWEOdRDiW?=
 =?us-ascii?Q?MC2rQDdm8ozGthTbu2vay/aGbbfLcxW0ckFFVlm4Vs1TWNKLpMq1tqCaDgIK?=
 =?us-ascii?Q?owzaYo+sBGwJjqmrdMBd/PVTyWWa054RF1ts4uVGa30ym5BbG5LoqrREPVvy?=
 =?us-ascii?Q?FqrqEpCiqjxrkGhhzyHFpx/Rk+6KzfA+ezCh21MOe3a66CJhlcDy0CH7rhu0?=
 =?us-ascii?Q?fvq8F+lwnKOdQ7s4Bq1R+WQVK9dzAjy37rp8GEh5nnpuRiWu?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28712075-6eb0-4704-fd69-08de7b5959b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 08:21:22.0533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EWmspxIy90mw5n3IO4s0UWJASsobbM289jASjmp3S39oULgot3YiH9QWKopBB6Sw9uc1MHwIsbXq6Sxr7L5kYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10432

> Subject: [PATCH 1/1] clk: imx: fracn-gppll: Add 333.333333 MHz
> Support
>=20
> Some parallel panels have a pixelclk of 33.30 MHz. Add support for
> 333.333333 MHz so a by 10 divider can be used to derive the exact
> pixelclk.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

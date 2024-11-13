Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013042.outbound.protection.outlook.com [40.107.162.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A9B1F77A6
	for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731491009; cv=fail; b=K6TEo/quX7sMhtfJ0HfuqQoXrI1RVm5mzQm0koCtRNEUZbvQY4mpEMFDdA046Qu0JJCEDFA1Jbg5kjij/BOojJYJthJw8xqroDnGHBhd660MyIj4Qw886UY6sIMQF3xC1bkZYdf3cbRdEb9h8WqRrm0lPYKxsybWj7115BpWydo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731491009; c=relaxed/simple;
	bh=X8g3uMPoWCZckdy/wRXp5dERVj/s787zp+lcTi2hvJQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MV0UsHXDTuxZq11+/9qsRHICIm5PUfooxtbChPS4ZR5kVS3HhjWzn9bLKufpqBsmg2bny3ShWbNN7BmDAMUyDS2m1h6tVSbPO/OqhJKcCFl1GVRRDbPjGBUwtRo/pG+wHpJ4XwC9AaMicXtgM8XiJRhUXtcU3BLmAb+YUM1Nthw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WtaRaK/9; arc=fail smtp.client-ip=40.107.162.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WtaRaK/9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dly6ZHDxWSuM9hIpbdJaOlRSSde9tL3hiNodFwJgpH8E/CsKVmMLNoRs03L/nOup7leX3OfrZDOuWA+OMvggkCHSSwCX8fF/wpTYTS4MJJhZwu7ktWmXQUI8V3zUKtQx2Gh/cV7uCWuoSGrD1KIfvVRjuc5oaWw7H+e/EkeVzFhO8pkwLUWowZwa42xiTVZtLMsfLQjDou8PurSC9Hj8MLdy79Po4eF/5QT3JsioSSD0tt9zYj+TeUuh/Fs3PMNdgFuLjFrJ0itb5eXwEMe3UAP5knHQtTGR9aqT8RfeJww9iyCfryeaHqYv4tDCyQhVQoUTogja46D8xy6l7gEqOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8g3uMPoWCZckdy/wRXp5dERVj/s787zp+lcTi2hvJQ=;
 b=BwPGqtIo2eli2n6sv6hu5YpJn0hbxDux9agkWhn+8B06eGyHBqx2ThiDeDE9+BEStm0xBY4lsQl7npQnxAJ7LjMJDithBStVwuUuseuzG5oCNeURknGKaUTs6Ujpp75TzxSOTf6aYTFHVN98kYxEtYEaNDYToyyySHx3arMmojGVxXqW1RcqCNxAJO+cTkwduHSfOOYQLZ+4kLVtqNKBRwY1/5vbZTC9VEMCyg1WfqMeCRCQvzwSjelMYRVxmvyfRFP/NezMmFqdhHDBnk2ECHSFVv/Jto/Bjdm8cw+lQEQTBzy7+P3kS6GK5zi/b2d5xNAIE4ELwFCyEtubvfoU3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8g3uMPoWCZckdy/wRXp5dERVj/s787zp+lcTi2hvJQ=;
 b=WtaRaK/9QOW9k+VT2bX46Kw+BfHlzCXnhVZjeEhkSjUzQGVBDzeWizZ1FuMN3UHvhFSAQ4MRhjadRj/EEpUNP0E7r0bwJOmu52aoniPYkDQA2pkVn1/O8ujhNkvc7t9BdsivgX7j4ilL7T6bZhJ00uipNjXvLSGu81NB3I+K7spLkdMnAakdgGotzYRsZpPDHMGwKjcgIb1JfpI4YpwYEWNgHKV/p0ADGVfi+KDCxJoPHmI7yzEl6/j5B831jm1WP67MMn66cwNdLOBd0g0JZXYVgozNRLCr0tvt96drBKkdyfVzZ9fVklaLVjHKMyX4xVpYiX5OhI4nAixLKCwxcA==
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PR3PR04MB7450.eurprd04.prod.outlook.com (2603:10a6:102:8a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 09:43:24 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 09:43:24 +0000
From: "S.J. Wang" <shengjiu.wang@nxp.com>
To: Ying Liu <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] clk: imx: pll14xx: Extend dynamic rates support to
 PLL1416x
Thread-Topic: [PATCH] clk: imx: pll14xx: Extend dynamic rates support to
 PLL1416x
Thread-Index: AQHbNYCD/cCl3/9SCkG0Vss21RpK9bK09Ckg
Date: Wed, 13 Nov 2024 09:43:23 +0000
Message-ID:
 <AM0PR04MB704484543D44FFA70FD14100E35A2@AM0PR04MB7044.eurprd04.prod.outlook.com>
References: <20241111214516.208820-1-marex@denx.de>
 <e58af9fa-f1b2-4d1b-8ca3-d256a7dee4ec@nxp.com>
 <0a62d3b7-b435-40cf-9795-2fb4ea80a693@denx.de>
 <83a67ab8-8f3e-4ab0-b68b-4da156817649@nxp.com>
In-Reply-To: <83a67ab8-8f3e-4ab0-b68b-4da156817649@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB7044:EE_|PR3PR04MB7450:EE_
x-ms-office365-filtering-correlation-id: a7d745e0-0f9e-4c26-8afd-08dd03c79df0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b21zcUtVV21rYngwYjJyRlMrQmZqZFRyOU54Q1dtaWtZQlhJT3hRbTA0UGlp?=
 =?utf-8?B?UHIyWHlrR1dhVXpMSXlvNU5ERHBsdXZNUG9iSTFHZE9xR3FadE96eFZxNzF6?=
 =?utf-8?B?U0VZM1p2bVU2WjRWMmd1UVhaTnBOT3dQKzFDc2tTeTlyTnRlckI4emd4TTZx?=
 =?utf-8?B?VEdlWEVkNXdGN2k4cnEvUEVraEs0WFFobVhNUTBuWHdKWjlFTmxDb0pSVGVW?=
 =?utf-8?B?RXA0UDhTOWdsSU1hTzZ6SGN3SzFsd2NtY3JLcHFRSFFmcmpGOU1uV1ZDZXpT?=
 =?utf-8?B?MDN2YTVqTWhXUVlpZGYrVVVpNzdtSXMxZ3RQanZnd0xFREJxNzFIQmZjaGtw?=
 =?utf-8?B?RHp1RldTcEFybHZ0bmd5b0JyYldDWXN2bHdid3dVUXFDT0F2U1F1cEluV3dC?=
 =?utf-8?B?N0xCVGM3bjFQdjUrY3BHeThEV2FmS2lVclA3YWxEdjVtQlFGY29ubnozUlhF?=
 =?utf-8?B?RWhBL290ZkcwZm9jRFZML2IvaVFjbVJXcnBiWWpEOEcyRmRXZVZYTW0yQkpE?=
 =?utf-8?B?b1Vod0JYT1Fmdy9lZ3luNVkxRGhQYk9QNVVTa1VLNHVTb1lGOGdNMnNGUEV0?=
 =?utf-8?B?c1d1dFFFLzN5QTBKOXpiKzI5MDh6YU1TUVlObCsrNGtzdTVKRHk1RWNWN0lZ?=
 =?utf-8?B?ek53TWlUZ2s4Y3VVNnJCZ2cxcUo5Z2FYLzkxczMvMzd5MEZwM2pObGd4bStk?=
 =?utf-8?B?ZHpIVXpueHRlNlh1M3dYUk5VQXFrMEcvbDFscHhXVjdvbXZveDZCb0NLenIw?=
 =?utf-8?B?M0Nkdi93Mm1QSEFiVytsZkk1M0dBbTQ0Q1ZUODE5Sk1nbGtnVDJQRGFUdVFn?=
 =?utf-8?B?bXJ3SHJJNERqV0pTSzFuTVdoWWpaRi90YytTWmNOQklFazVDYzYwODNDT0pk?=
 =?utf-8?B?L1JTMEFrRzl4bHM2S2UrNlNiL3gzaXlNTENwdTBSaXE4L05xZFBCbDdvV0dZ?=
 =?utf-8?B?RHZQMHFRenoxeHVZY3ZsUG1SZDhpV3N2VUpRWVhick8xS3o0R1hNY28wQlcr?=
 =?utf-8?B?L2hoNDlFbWZWUklZdllsYUtmVzF4OVIyUjk0WnpzRXQ5RnY0cTlleWkvTGFt?=
 =?utf-8?B?NUt3SGhXQmNDd3VEQ1dKODA5ZjAxQklrTm94TTkvZ0V1NHNvajQzSUtCcFYv?=
 =?utf-8?B?aml3bjUyRXdpMW1nM09LQW9QTDBHTzdlWWZPQ1dUYjVFcmN1cFBpWFdQd2M5?=
 =?utf-8?B?TzEvQUtGWkMyUlNUU2U5NzIwbG43TG1MR3Ria2p3bk9xYU9mc2VBeHgxcFJy?=
 =?utf-8?B?ajFmaEYwL3J6NGIyWDczSTNpR3Erc3U3S2hrQnBObWtiOFU5bHJVN2p2eWFD?=
 =?utf-8?B?aWx3eXBWWWVNZDd0RzV0VkZkWmpVUlUrTkF3V1FEQXlqbnhGR1lGTkNBdXQz?=
 =?utf-8?B?U1Juei80elpxeVlPVGVRMU95SFVhOHBRTFMyRnhvS2F5WGZldE1zN1FNbFpU?=
 =?utf-8?B?TEh0S2QyRmRmYkptWE9TY3JGb2g1bElqd09ndkNZREZRdit3ZDY3MzRxdldK?=
 =?utf-8?B?NUNpdVlxNWlPNDY5b085VWFIZjg1L2VZSWhXdVFka2phUTErMjBmVzEvSmx6?=
 =?utf-8?B?UFJ3SERZbGxjaEZBUmNmUGN4andqYzFvOExYb3NMSUJGTXhiU3ZKQzZqRkRV?=
 =?utf-8?B?Y01mY3MzTmtzZVgzaThJS0FxcStEOTBoRWVnRk1xQzJ2RThuTkMrbVowWE9v?=
 =?utf-8?B?Ni9Vc3hsT2s1b3pZMzRhOGRQa1BtK3EzQmlkRUdqN3Nhd3FyWktZT3VWdzJw?=
 =?utf-8?B?ODhiVHlIU3pDODBrdy9GYTE2VHRvQUV6WWc5VFJnTjQvNjhSY3cxVFh3SDV4?=
 =?utf-8?Q?d9Z5gt1nwcKd7PZkCOIcTystZOtHolcj8v/dg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjI3ZnB3YmgyWUtwKzJ3R0JFQTE1WDZVajA5Q3IrODFZWi9XS0pLZThmQlZw?=
 =?utf-8?B?L1lORm44WHZvVG9TdWkwVy9veG1Nby9Nc25NRTVRLzJXYmY3RnNHbVJMZ2FZ?=
 =?utf-8?B?ZHVFTlVrL3F2bk1URXVrMitiQXZNZGdkd1N1WHBYTjB0TTF3V3c2eHVQQXll?=
 =?utf-8?B?MUtBMHNGeVlhUXg2L1d2cjdOVGM2MFY4NVpBWHJiTzZPZUxheGd4QWEvWmwz?=
 =?utf-8?B?MTRuNGR2UlhiSkRmZkc4ZCs1WFhlTTJ5WXROT3JiaEFiR2wvcHRQdjJNSmxL?=
 =?utf-8?B?U3pZS3R4Mks0NEpIWHVrd0NKNmVlaXJMZkhMNWhRczRNTjYrM2tUK2JTNGE0?=
 =?utf-8?B?VUV5dVBBc01aZnkwTGpBSFRxZ0plOThSZjkwSjZ6TGpnU1NrcUNGREh2VmtH?=
 =?utf-8?B?bndLYVBKWTNMcXFEK3gvRC9kZURmZGlrRjFKeUkrRDgyaGF5bHRaMVVaNkFJ?=
 =?utf-8?B?T1U2eUU2VC9KbW5YMHhpRVNNKzNyTmVsaWhTSFhpTUZvVUNrVUVuT1dmTlN6?=
 =?utf-8?B?VnBTTE1jS0VmaWhFajFEb1pVY3FtZ0NER0dTK0tHNkVsS212QXR3UXFwSmNt?=
 =?utf-8?B?dzFXN3RnREplbjVteW9UTDV6VU5jYVE4bFpzOXYraDZDOGNrbnY4cW40THBa?=
 =?utf-8?B?ZkJ4UlNrVGV6UzlxVHJ2OVM2aml2RDdTbDJ5MW1PU0NDOEo1WTViSUJOdS83?=
 =?utf-8?B?RnZQZ2FsTnNWVHFObm1nR0YwazIrY0ROalpMNHJrY1pUcDlsV2JjYUtiQ01K?=
 =?utf-8?B?eE9Id24zcklmelZPVnVrbHh3VUVBdGFUVG9JZElHQUVQOHQzN1grVHFsbGUz?=
 =?utf-8?B?UFZqMG9CRWIwVEVFWC9KeUdsR3lURDRZamtFNzQxWnkzRHRrQmlrN0NzeXhR?=
 =?utf-8?B?d3ZyTUpxa3c3bmQ0QVgrUDI1NkhVbFpmWnNjUnRIYmhtTEVrZFZGcmxlMTMz?=
 =?utf-8?B?OWJ4dGlTK1NiV1VsdXIrVWQ1MnNlR3M0ZldsYlBIcGhlMk9oc3ZrV0hqaGhU?=
 =?utf-8?B?QlZnUUNndERMU0hjSmZXYkJFMk1uS0c3QlZONHoraUhVZ3diMWoxZENGN3RK?=
 =?utf-8?B?VnNNcmRldWh3cTViMGU1TGoxVlJRUXZTR1ZXWndXaFJQRXFoQkIrOXlVb3Uv?=
 =?utf-8?B?MUVQSEhrSUtOalFmTzBwYXJsWmg5K1dZZXlCTGRRdkV0Rkh4K3VGOTlTODRX?=
 =?utf-8?B?ODhIVWFpcTFnU0Eva1hxWGJzQ0Z5dFJJc3VnRXdFc09FZm43MmJLckMwcTEy?=
 =?utf-8?B?SlRoWGpGbU5CTUFKelJDQ2g3dm9NbGFDNXdvekhKdFZwUzZKMGkvRVhiRzJC?=
 =?utf-8?B?UTBrR1BwV3dxTGd3d3VLRWl1OStHcnl0V2Q3OXh5TlhVaUhaMGJiaUIyc0sr?=
 =?utf-8?B?YTVlYTIyUWZ5UUpTTG5CMVo3MS9jVXFCQ3ZVV0gzbjl6ZHp1OU1HZHBOSEVq?=
 =?utf-8?B?Y1YvSDE4eXI2c29iVVFIbCtLc0wxejlMZXpTbDlvVHptc0xQcFQ2Tm1UOTZy?=
 =?utf-8?B?SzUzc3k0RkF6WE9zcUx6UTk4TjlHb0sxcTcwY0ZTbVJDUFdsbldzS3Z3elEz?=
 =?utf-8?B?K3hacE0xMGNRZXRCM3Yvbk1BN1BLejJuS2l2d1Z5SjRuZG9WbFpYUHl1YUlO?=
 =?utf-8?B?Vk9XM044c1lTU24vSEE5N0FvRlYvTGRrZmc4SlFWOGEwV2hHU0pTVExtWUVV?=
 =?utf-8?B?MWZha001QUVvMUMwTzc1aXJZaXg3YkpjUVNjNlhMTEN4ZldobmpEL2dpOUNW?=
 =?utf-8?B?dW9zZmNuYUF2NHFHN1hhYjFMNlp6bndzN0l5dVFTdC9PRklnUzltRUZ1VU9F?=
 =?utf-8?B?aTMwbmNiTHBHYVdOWWtCYW5XNS9pU29nSm15c1BSeXJaa0dkUHVSbHFqdWll?=
 =?utf-8?B?UXI2Nm9HOGp2K0EwM3BZOUhHdTQ3SVlmYXcxT3lRT2FJWnFVek45aTVHQXl0?=
 =?utf-8?B?dnhDQmdkaVB4cVgrcHpuMlpaSko2OEpmYTAzRzBBV1FETmdnMC9nK3JOUUZp?=
 =?utf-8?B?cmc1Rm1zL0FPWUt2cUN2eFliUVNnanpneVZEZDFjbnZPQ1kvZHYzTTZqUVNS?=
 =?utf-8?B?Nk1YSjJ4cHBOanRBSXlhdGNXS2FjNVlJaUZJdDcvclMwZ3BZeWEzUE5GV3M1?=
 =?utf-8?Q?+gvsgnegJgIGRvA04d48QOMJi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d745e0-0f9e-4c26-8afd-08dd03c79df0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 09:43:23.9314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fKyU9/tw9bbxKXG5ciTb8NQ7s2KkUrFph+IfqW2POGPoBnBKDY9RuIykleVX49Jvp/coZv/ywyG9f7LTB9bbUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7450

SGkNCg0KPiANCj4gT24gMTEvMTMvMjAyNCwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+ID4gT24gMTEv
MTIvMjQgNDoyNiBBTSwgTGl1IFlpbmcgd3JvdGU6DQo+ID4+IE9uIDExLzEyLzIwMjQsIE1hcmVr
IFZhc3V0IHdyb3RlOg0KPiA+Pj4gVGhlIHBsbDE0MTZ4IFBMTCBzbyBmYXIgb25seSBzdXBwb3J0
cyByYXRlcyBmcm9tIGEgcmF0ZSB0YWJsZSBwYXNzZWQNCj4gPj4+IGR1cmluZyBpbml0aWFsaXph
dGlvbi4gQ2FsY3VsYXRpbmcgUExMIHNldHRpbmdzIGR5bmFtaWNhbGx5IGhlbHBzIGluDQo+ID4+
PiBjYXNlIGUuZy4gbXVsdGlwbGUgdmlkZW8gb3V0cHV0cyBhcmUgdXNlZCBhbmQgdGhleSBlYWNo
IG5lZWQgdGhlaXINCj4gPj4+IG93biBzZXBhcmF0ZSBzb3VyY2Ugb2YgYWNjdXJhdGUgcGl4ZWwg
Y2xvY2sgb24gaS5NWDhNUC4gSW4gdGhhdCBjYXNlLCBlLmcuDQo+ID4+PiBQTEwxNDE2eCBQTEwz
IGNhbiBiZSB1c2VkIGFzIGFub3RoZXIgVmlkZW8gUExMIGZvciBhbm90aGVyIG91dHB1dC4NCj4g
Pj4NCj4gPj4gSnVzdCB3YW50IHRvIHBvaW50IG91dCB0aGF0IGkuTVg4TVAgYXVkaW8gQVhJIGNs
b2NrIGlzIHN1cHBvc2VkIHRvIGJlDQo+ID4+IGRlcml2ZWQgZnJvbSBQTEwzIHRvIHJ1biBhdCA2
MDBNSHogaW4gbm9taW5hbCBtb2RlKGkuTVg4TVAgZGF0YSBzaGVldA0KPiA+PiBzcGVjaWZpZXMg
dGhhdCByYXRlKS7CoCBTbywgaWYgYSBwYXJ0aWN1bGFyIGkuTVg4TVAgc3lzdGVtIGRvZXNuJ3Qg
dXNlDQo+ID4+IGF1ZGlvLCBQTEwzIGNhbiBiZSBhIGZyZWUgY2xvY2sgc291cmNlIHRvIGJlIHVz
ZWQgYnkgYW4gaS5NWDhNUA0KPiA+PiBkaXNwbGF5IHBpcGVsaW5lLCBvdGhlcndpc2UsIHZpZGVv
X3BsbDFfb3V0IGlzIHN1cHBvc2VkIHRvIGJlIHNoYXJlZA0KPiA+PiBieSBpLk1YOE1QIE1JUEkg
RFNJIGFuZCBMVkRTIGRpc3BsYXkgcGlwZWxpbmVzLg0KPiA+DQo+ID4gSW4gdGhlIGVuZCwgSSBz
dGFydGVkIHVzaW5nIEF1ZGlvIFBMTCBhbmQgVmlkZW8gUExMIFBMTDE0NDN4IGZvciBhY2N1cmF0
ZQ0KPiBwaXhlbCBjbG9jayBnZW5lcmF0aW9uIGFuZCBQTEwzIHRvIGZlZWQgQ0xLT1VUbiB3aGVy
ZSB0aGUgbGVzcyBhY2N1cmF0ZSBQTEwzDQo+IFBMTDE0MTZ4IGlzIGp1c3QgZmluZS4NCj4gDQo+
IElmIGF1ZGlvIFBMTHMgb3IgUExMMyBhcmUgZnJlZSwgSSB0aGluayB5b3UgbWF5IHVzZSB0aGVt
IGZvciB2aWRlbyBvdXRwdXQuDQo+IA0KPiA+DQo+ID4gV2l0aCB0aGUgZGlzcGFyYXRlIGRpc3Bs
YXkgcmVxdWlyZW1lbnRzLCBzaGFyaW5nIG9uZSBWaWRlbyBQTEwgZm9yDQo+ID4gbXVsdGlwbGUg
b3V0cHV0cyBsaWtlIERTSSBhbmQgTFZEUyBpcyB1bnJlYWxpc3RpYy4gKG1heWJlIHRoZSBuZXh0
IFNvQw0KPiA+IHNob3VsZCBoYXZlIHNvbWUgbmljZSBQTEwgcGVyIGRpc3BsYXkgb3V0cHV0KQ0K
PiANCj4gSSB0aGluayB0aGVyZSBhcmUgMiBjYXNlcyB3aGVyZSB3ZSBtYXkgb3IgaGF2ZSB0byBz
aGFyZSBvbmUgdmlkZW8gUExMIGZvciBEU0kNCj4gYW5kIExWRFMuDQo+IDHvvIlJdCBoYXBwZW5z
IHRoYXQgdGhlIGNsb2NrIHJhdGUgcmVxdWlyZW1lbnRzIG9mIHRoZSAyIGRpc3BsYXkgcGlwZWxp
bmVzDQo+ICAgIGNhbiBiZSBtZXQgYnkgb25lIHZpZGVvIFBMTCwgZS5nLiwgYW4gaS5NWDhNUCBw
bGF0Zm9ybSB1c2VzIGJvdGgNCj4gICAgRFNJIHRvIEhETUkgYW5kIExWRFMgdG8gSERNSSBicmlk
Z2VzIC0gaXQncyBwcm9iYWJseSBnb29kIGVub3VnaCB0bw0KPiAgICBoYXZlIHVzZXJzIHVzZSB0
eXBpY2FsIGRpc3BsYXkgbW9kZSBjb21iaW5hdGlvbnMsIGxpa2UgMTkyMHgxMDgwcEA2MA0KPiAg
ICAoRFNJKSArIDEyODB4NzIwcEA2MChMVkRTKS4NCj4gDQo+ICAgIEluIHRoaXMgY2FzZSwgd2Ug
c2hhcmUgb25lIHZpZGVvIFBMTCBkZWxpYmVyYXRlbHkuDQo+IA0KPiANCj4gMikgSWYgYXVkaW8g
UExMcyBhbmQgUExMMyBhcmUgdXNlZCBhbHJlYWR5KHZlcnkgbGlrZWx5IGJ5IGF1ZGlvIHN1YnN5
c3RlbSksDQo+ICAgIHRoZW4gdGhlIDIgZGlzcGxheSBwaXBlbGluZXMgaGF2ZSB0byBzaGFyZSBv
bmUgdmlkZW8gUExMLg0KPiAgICBJdCdzIHBvc3NpYmxlIHRoYXQgdGhlIHZpZGVvIFBMTCBjYW5u
b3QgbWVldCB0aGUgY2xvY2sgcmF0ZSByZXF1aXJlbWVudHMNCj4gICAgZm9yIG9uZSBvciBib3Ro
IG9mIHRoZW0gdW5mb3J0dW5hdGVseSwgYnV0IG1heWJlIHRoYXQncyBzb21ldGhpbmcgd2UNCj4g
ICAgaGF2ZSB0byBhY2NlcHQuDQo+IA0KPiA+DQo+ID4+IEN1cnJlbnRseSwgSU1YOE1QX0NMS19B
VURJT19BWElfU1JDJ3MgcGFyZW50IGlzIGFzc2lnbmVkIHRvDQo+ID4+IElNWDhNUF9TWVNfUExM
MV84MDBNIGluIGlteDhtcC5kdHNpLsKgIEFsdGhvdWdoIGl0J3MgcmF0ZSBpcyBhc3NpZ25lZA0K
PiA+PiB0byA2MDBNSHosIHRoZSBhY3R1YWwgcmF0ZSBpcyA0MDBNSHogYWNjb3JkaW5nIHRvIGNs
a19zdW1tYXJ5IGJlY2F1c2UNCj4gPj4gdGhlIGRpdmlkZXIgY2Fubm90IGZpbmQgYSByYXRpbyB0
byByZWFjaCA2MDBNSHogZnJvbSB0aGUgY2xvY2sgc291cmNlDQo+ID4+IHJ1bm5pbmcgYXQgODAw
TUh6LsKgIExvb2tpbmcgYXQgaW14OG1wX2F1ZGlvX2F4aV9zZWxzW10sIHN5c19wbGwzX291dA0K
PiA+PiBpcyB0aGUgb25seSBmcmVlL2FwcHJvcHJpYXRlIGNsb2NrIHNvdXJjZSB0aGF0IGNhbiBk
ZXJpdmUgNjAwTUh6DQo+ID4+IGF1ZGlvIEFYSSBjbG9jayBmcm9tLsKgIE1heWJlLCBzb21lb25l
IHdpbGwgY2hhbmdlDQo+ID4+IElNWDhNUF9DTEtfQVVESU9fQVhJX1NSQydzIHBhcmVudCB0byBJ
TVg4TVBfU1lTX1BMTDNfT1VUID8NCj4gPiBJcyB0aGUgNDAwIE1IeiBzdWZmaWNpZW50IGZvciBh
dWRpby1heGkgb3IgZG9lcyBpdCBoYXZlIHNvbWUgbmVnYXRpdmUNCj4gcGVyZm9ybWFuY2UgaW1w
YWN0ID8gSWYgdGhlIGxhdGVyLCBiZXR0ZXIgc2VuZCBhIHBhdGNoIHRvIHVzZSBQTEwzIGZvciBh
dWRpby0NCj4gYXhpIC4NCj4gDQo+IEknbSBhZGRpbmcgU2hlbmdqaXUgdG8gY29tbWVudCB0aGUg
YXVkaW8gcGFydC4NCg0KV2l0aCA0MDBNSHosIHRoZXJlIGlzIG5lZ2F0aXZlIHBlcmZvcm1hbmNl
IGltcGFjdCwgYXMgdGhlIGF1ZGlvIEFYSQ0KQ2xvY2sgaXMgRFNQJ3MgY29yZSBjbG9jay4NCg0K
V2UgaGF2ZSB0aGUgcmVxdWlyZW1lbnQgZm9yIG5vcm1hbCBkcml2ZSBtb2RlLCAgc28gNjAwTUh6
IGlzIHJlcXVpcmVkDQpGb3IgYXVkaW8gQVhJIGNsb2NrLg0KDQpUaGFua3MuDQoNCkJlc3QgcmVn
YXJkcw0KU2hlbmdqaXUgV2FuZw0KDQo+IA0KPiA+DQo+ID4gVGhhbmtzICENCj4gDQo+IC0tDQo+
IFJlZ2FyZHMsDQo+IExpdSBZaW5nDQoNCg==

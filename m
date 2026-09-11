Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327D536A340;
	Fri, 11 Sep 2026 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789092136; cv=fail; b=TKEeEmGawqfieHV0Q+1zC1Ua4wYDHR8Maq8nP4AH0xVfKK0NkNwO9n0xo+bV4hGWRxuky2n3uWKo2qOcSsX6y5A27DDf1K+b4Qlx0xq5nm+Ptii1Dn1GKuP8Yu9W8AvLGvT0tRsIvsqyhvyW0/MA9nAtNKBb0plPS9Gb/38yBFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789092136; c=relaxed/simple;
	bh=b0neb5KX4KNoQMvUKZdowlB9YXxNIWwHBHAGPuPkaxo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z4HNnszkhKWO5V0L/UmNNyGRGyh53Cf9n2ZfMuB4IYMfAJzRJVapAOkn5aJTfrztLnvXqUHn9w6CuhjAycwHxhz/ay4Kbh7p2aMuIa4aqsjxnC0zwsp+DqRHjFgXWdF5RDx0wHkaHgE6VMPph6GKMVcVV+TH+05mf3OMUcPsvyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ujSaBhaz; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ujSaBhaz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDxwOH3+8MjLtV3pCk8nwQYPXXt8pVf6ybXztUwP7N5mlCi7cVEYi9Q1j+Oo2EHqtjNK594RvVv8Fp4J+hB6iXXGAj/E8duPF0JYM/GXe11VSpCqPgaD1eIu9TQTPQrsmk5/cUqIWEuEY3cWffhte0WkCAJjS9YPmCzMg1iq2AfsNY3GDhsnAriN+iJzqXlWR45CPoI2nfIU5Zb2zEOwKy+zGm8k6+X1nLjCqrm83uXGDm7U+nsUjwfnRVNwWEDN+VmgGz65H0GLGmX1ww1OuVhZbYPS1a+5XIvZRS9+YFZ0kYyHvzI6MptIjyKzqDYcxGV/74fTK9p7USR6YyTgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0neb5KX4KNoQMvUKZdowlB9YXxNIWwHBHAGPuPkaxo=;
 b=oEec8kVhtZORDeCM6oIltWSXoKOlwpB5X01BxslGsK7vuelCg1wsYWZ9jHnVs/aMJO9DaNv2jDhbpp+vru2fUsbbO36kpvHwQrsUAfn/a3w0YftvmszbZuc+Lw1soNofCyS+dve7q5AzlEOlWT3ymlYRkZi4giow3D5kyoUbUDZCdQu+WUL6wR/GXNFViBlB6qRspzEtAkn/IdVI45geFbABYOZf42zgPPrjz59paNZfYb4dyKVJaCAJYG4pN1ZpUicV8HHpJMYo4uClkfc+oT7SN1gyJdHDzOnu9ei+4+32HpIBRoUB2TsqBnILA2UMIj0SHr3l3KxgcWTn25c6mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0neb5KX4KNoQMvUKZdowlB9YXxNIWwHBHAGPuPkaxo=;
 b=ujSaBhazqSC6JBt3LyQt8dick13O3QjhG2cnN04YvfojnTjIeCiWr0Gy2Oz+pfFYmHa0t/0M+nMJ9XNKO6Nsp1G9mfBc9IUdBsGMbiav4VvYZ6xZLdR8yIhVT9uvpGGE5qDkCCdoKERhctOV29hQKgLx5R40XLrawIt1DU0VAEAb587+lf3gYkd5rrks0iaygFmVbyBTTznhmos4EBN0DdY5EX2PaG/jcnCLNvSQcQ2QUSgWz0KB8pOGr5EyuFIooWIs87R0XawAxRGYZkJ5+y0uFf4VhKX4yDgnGrHYrEZg5UipHBtEl9SmUaFxuvPghcfeZGbAcoNouQlbvFNG4g==
Received: from ZR6PR04MB375776.eurprd04.prod.outlook.com
 (2603:10a6:910:dc::10) by GVXPR04MB10657.eurprd04.prod.outlook.com
 (2603:10a6:150:217::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 02:02:06 +0000
Received: from ZR6PR04MB375776.eurprd04.prod.outlook.com
 ([fe80::b83a:a0f5:2b29:50de]) by ZR6PR04MB375776.eurprd04.prod.outlook.com
 ([fe80::b83a:a0f5:2b29:50de%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 02:02:06 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Frieder Schrempf <frieder@fris.de>, Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <frank.li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Frieder Schrempf <frieder.schrempf@kontron.de>,
	Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
Subject: RE: [PATCH 1/2] clk: imx: fracn-gppll: Add 350 MHz support
Thread-Topic: [PATCH 1/2] clk: imx: fracn-gppll: Add 350 MHz support
Thread-Index: AQHdQTfj8ZXQIHTWt0+Rs+miEkoV3bbIoIcg
Date: Fri, 11 Sep 2026 02:02:06 +0000
Message-ID:
 <ZR6PR04MB37577605914AF62FE1F29B5ADB88BE2@ZR6PR04MB375776.eurprd04.prod.outlook.com>
References:
 <20260910-upstreaming-v7-3-imx93-displayline-v1-0-bb9446e6ed6e@kontron.de>
 <20260910-upstreaming-v7-3-imx93-displayline-v1-1-bb9446e6ed6e@kontron.de>
In-Reply-To:
 <20260910-upstreaming-v7-3-imx93-displayline-v1-1-bb9446e6ed6e@kontron.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-09-11T02:01:39.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR6PR04MB375776:EE_|GVXPR04MB10657:EE_
x-ms-office365-filtering-correlation-id: ec260267-1116-492e-918f-08df0fa8ae2a
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|23010399003|376014|366016|7416014|3023799007|38070700021|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003|921020;
x-microsoft-antispam-message-info:
 oL7PLzq9kM6aZGFKQd17LNxKHzjMfs9r/rBM65fnw6ybQrAZb/XOJClWvYeAwFW3GTLZdJijUDY6LoVL1+y9AV4c7KO5hdvZh5sqDw0S6spNL88eXXn1gyCho3Ta6NjHObYrsXn+lxCp8OsvlciiSB0sbXaEOuuYDN2Q/ORwzfVqP/lbC7mmis945gSevayYJ8STYf1uzrBHnfN/r+KS3IPEw1x/p+/0niCasNQvS//yWpqd9PbJ3DECoRHdue6q3VMt/IbFo3UQEoiI6J4zdnpwYmORRhf5uawgrYRnx+ZvYsbqeKCmUrdH3edSOF3a6CoKAbd7jxWIV7Hl7g9P/LSoWIrxhe0jK/ucyv5By/EOTp68T15gkY6CVGPB3Ir0nWbbZ2Xv+Ny9wzAtdg7GKtjbaoNJsYenN17M9733RT+jSzZvRfpGFl4/hTSzWGN7Y6n3P2k33+9WmKGeHHFgbM0bDaDx5LIk5JsrSmDaCMzNmGHSsTxC6crTIuFpOxBy2ZA5dPyDAW7jTBMis0B3CAcrdOouQDQV702BV7lWs+S2zqLqYbzdAH7pRkdWUMPJza6bHvBTWi14RTcY4nbm9+9lRaWQEt3UNPLDE5hBBjdzUSdsAPhuiltsKidLxdQ2TDKtMF1dxewF4bVp+pQ3T0OqNlMGCd3FaV1bUj6Trns1x7dVms6ufUNJV/KFVuRhxfzCib9r1J9yKGA9nT4hny2IR+wfcKO3PWD9LA0bD1gbG3mLCan4kq2amRWMnIAa
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR04MB375776.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(376014)(366016)(7416014)(3023799007)(38070700021)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1dHUWpwK1h2eWJ5T0pEWXNaa0tveXg2Z2lwR1ByaWlYeGRrMUZRM2dFc3U5?=
 =?utf-8?B?RTFKY0NNSEQxZkJ1ZkN6VkdLd3daTUZnMXpsYVg2N0J5c0s0Zk1vVnlkWFBF?=
 =?utf-8?B?NU5vYm96VnNVWnYrdU11MHJFZFZkN1N4STVHV2U0WHg2YjNlekVKdjZObVBF?=
 =?utf-8?B?QlE1QjF6WSszeGsxYlhFMi9TZmUrVWdqUm1scGhkYkJ3MkFjVHBtVk9BWk5V?=
 =?utf-8?B?ZG10ZTVQTUMrcjk4OFFsR3F5cDIrV3llUHZSMWtkSFB1d280YUEwRmRETGZX?=
 =?utf-8?B?a2Y3dS95VXhFRkM5SXZ2Y08rVkh6QXRVcUlJeVBiYkxXT3l5OFV0S2x2dDV1?=
 =?utf-8?B?bkNoYXRZYXh1VVh6WURxNHZ1MnJCbTNhM0tqNVRXbm95UnhpeThaUXBwcmg1?=
 =?utf-8?B?SXdTMEdvTWZEa05LZlVVMjNZNFFZSmRlYVFnYTBqS2hERlR3OWhURW9XRGFP?=
 =?utf-8?B?Nlp6TXA0aXVWNWpQZ2NocEtCOUM1MFBmSEU4SnYzWHFOR1FxK2JDOVhmRHBq?=
 =?utf-8?B?UmhqTnNPR0FVbFJIZGw2eUsxc1ZtVFpLR0gxVGhTWlZXS09sbWx1bHVtQmFo?=
 =?utf-8?B?ZlF2dC9vVFRwUnFzaGZxbTN5dzdMRkVWQjZMSDF4M0FRekpzYzh0M2Y0bVo5?=
 =?utf-8?B?UG14MnRDU3lydDRCUGp2MEJIREZDTVJZankrVHAzemdvQTFkcmg2ZVB0RGJR?=
 =?utf-8?B?Yk9xeTRTVmlKVDUyZTROazB6UG1PMCtyY0FHMVdSb2pZM2FFUU9VandFUDUz?=
 =?utf-8?B?ODA2R2JucXI0Q3hORlFyVWQySElOdmZjZC83TVcwQWEwVFAwdEJ4c2FGV2l6?=
 =?utf-8?B?cVhGaGYyVFNOUEgzWlhOanNVdnRLSTBCTG13eGlNSHpsSU1qWGRpQyswZXdZ?=
 =?utf-8?B?RHhzc2Z0SXpmWkZsbTk2ekRNSTJaYWRoVk5iUTdIR2RLNStVVWxZeUFFOUdT?=
 =?utf-8?B?Q3RIdHV6Q0g1WDJDd2l3Y3p6VzhkdldyMngreWNjVXByVFh5bGFZZTJnbTZt?=
 =?utf-8?B?NUtGMUJxV2ZxNUQ5cGZwL0JQTFR3anFqUml6ODRjVUx5MUwwYWYrWCs2TGxt?=
 =?utf-8?B?c0QxZ29vY0tkdm54YzYzWkpiWU9GdVhHVzhxNkpKTUhKVnZzcFFWVGJlNUYw?=
 =?utf-8?B?UUhZSGorMkZUcXZNVUUzd3hReENiTkF1TWZRTXVxbmRzbWMwMTJrREJzR2g2?=
 =?utf-8?B?MzFQT2pONG9nYzJBOEpUTFZvdWp4OFB2SUtkcnZkVEhuZlNmNGtvMlVOT3Vl?=
 =?utf-8?B?OEpuVWNrR3pDM0E2aTdyNzJrZU5kWllDT3ltK0tvTTJxWm1QdERpM1R3NzhN?=
 =?utf-8?B?Q1MzVjdaWWl3SmsvWS9LV24zdCtkY0NOK081R1MrR3ZmUUx6eUZoanVCaGR0?=
 =?utf-8?B?RHJtUWJvRXlmajViaGR5cE1YVnF5bWRoT0MvL1kyVUg2allYWWh6MVd3bm1Y?=
 =?utf-8?B?cGVlL002TVVPOURNbWppajBycThkMUR3N0tUV0RWQmpzQlFnQ004QWNRTFND?=
 =?utf-8?B?WWFqdmhvdGJjQy94Z2RtTHJtYm5pQVY4ZjFGZDBJY3BMbVpWcU56SUFhdC9J?=
 =?utf-8?B?STJCTndLVUVSSVdNRjluRW9UaENmTHMvNmpRTVplZ1BPU2Rkd3BVb1kxUm9q?=
 =?utf-8?B?RjYwOXZnc09KK01QTDI3Zjg2czZ5OXBXc1RHMEZweWFNMWM4b0FiVThBV1Zh?=
 =?utf-8?B?Vk8zQ28xcEVpa2l2NEFGMVBWeGZsVmxJKzdvU0YzMWFackJiZ1hhS05BR0tB?=
 =?utf-8?B?NEowZE9PV0RqRllzQzdSY2FGcUdyUE9HU0x3VEJVS29QN1gvUW9BTDBKQnRI?=
 =?utf-8?B?ZnNvS3c2clVwOCtoYXRDZnlacnlJbnp4TkVzWjVOZDl3RWdPb0R0eWs4VXVo?=
 =?utf-8?B?a0NDWUlQbWE1Y3Z0cWM2L0xIME5WZHlxN1FobUZIVzdHZmlNNjRMZ1RLdVB0?=
 =?utf-8?B?QUFQSDM2bHVNKzdSNDhja29VSTNSa3FYeS9kcDd0OUd5dERObXVqeUJyandt?=
 =?utf-8?B?dFhjV1FmempuNWUwRzBDWnlGZGlxYW4zb1lzZnYyUWVWWnhNU252NUNjQjVm?=
 =?utf-8?B?dkl4SG81N2dRNUpLQlpCeVFIVFk4ckx3TWgrMXZzakpFSWZ5WW1KRkQ1dVFx?=
 =?utf-8?B?WGQ1NTZ2S3RPYWtiazZhT1hnaVR4QXVTZnM3UURkMCtkaHhkL0pMNlB0Q3lQ?=
 =?utf-8?B?TGpTZlpmZFJpbTVqRTFUUExJOWc3K2ZjUGthc1FwV3BJZkc4eGUvL3BwNjl0?=
 =?utf-8?B?bDFCT3hiRHBBeWtlbjJ1M3ROdEJ3Rnk0NkdsczBIWVlrdUpjVlJmZHBEMTlq?=
 =?utf-8?Q?7wFxU4Fig/pS9JgKqg?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR04MB375776.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec260267-1116-492e-918f-08df0fa8ae2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 02:02:06.0434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uI79x52bnKWgBMKkkAhuYOmUZmOrGeY77FADow+U3fAnd3W1fUp77SWqIJdycNH2A1f9I30loDyIQEbaKSt3Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10657

PiBTdWJqZWN0OiBbUEFUQ0ggMS8yXSBjbGs6IGlteDogZnJhY24tZ3BwbGw6IEFkZCAzNTAgTUh6
IHN1cHBvcnQNCj4NCj4gRnJvbTogTWlraGFpbCBWYW5pdWxpbiA8bWlraGFpbC52YW5pdWxpbkBh
eGlhbnMucnM+DQo+DQo+IEFkZCB0aGUgMzUwIE1IeiBmcmVxdWVuY3kgc3VwcG9ydCB0aGF0IGNh
biBiZSB1c2VkIGZvciBkaXNwbGF5IHdpdGgNCj4gcGl4ZWxjbGsgb2YgNTAgTUh6LiBUaGUgZGl2
aWRlciBvZiA3IGlzIGltcG9ydGFudCBmb3IgTFZEUyBvdXRwdXQgb24NCj4gaS5NWDkzLiBJdCBp
cyBhbHNvIHVzYWJsZSBmb3IgcGFyYWxsZWwgb3V0cHV0Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBN
aWtoYWlsIFZhbml1bGluIDxtaWtoYWlsLnZhbml1bGluQGF4aWFucy5ycz4NCj4gU2lnbmVkLW9m
Zi1ieTogRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPg0KDQpS
ZXZpZXdlZC1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQoNCk5YUCBDb25maWRlbnRp
YWwNCg==

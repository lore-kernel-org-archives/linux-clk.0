Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5143ACF1C
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576741; cv=fail; b=JvRx3jguPu5cb7Gid7JSm65UsLLdaODuOoLcMVl2zNboQC2TvBq4Zg9ahLlgnX09JL2IGZQXZ7OP29iCdD6bx5EkfIIuPlvwkd7NFVOwHFL2PSDh6iXzVlnet6deOASQY3IwqzY0Yf7kD2MMr8+FZBM6ukhcxdA8Pt9ZJI7YjOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576741; c=relaxed/simple;
	bh=ksnAda+S3StBuOVORPKyY/Utwq0uXLVgOK3kRpD/Kqw=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=toGEA6yhlM0DhjAOwCcPmKoyuns+9ONPietZlR9XwE82YUMR1pXC2ItirUyHoog2VP3IW6tpi5ICRJ7jU6v/hwH9GoeADFsiUO8gchIAQaXYXFM9aDHKG1Lp146+U+3qEjLDLJLNRHDT15IvU/vnsyShczV6IBO89M4DyFNiPfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n9tMNMvn; arc=fail smtp.client-ip=52.101.66.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n9tMNMvn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCZ1zRvcJNOnxnm6MWD2xQjHTJs1IXtuH7bivrz26Tc4dqvrmyyOu5Fq2XI7u0GwGMnPibFCg8ppf+7gxgwdi/7Ap1IPWlacQIgrp0nkSVdjHaSGlaGvIYn1OVMGSl/EsfYfm4N6Ujp/He9u8EEnZKP1G9n5FC2Ewc1j0lU5tbQuqdYK0oa9GaXT0rta4CvGzLBsneMnD7SSSuGhDoJJ0yEFjJvQrCTwsUWjQvIzrnm0EHwprTmgQ4FmB/Dp5uyYtLDdBaTiUvO0VydQ64/kcnnPUISvcrTfGzKJndUToJIDxxWs535e4hE7gp7HKct8mQe3WFDVkV7DaMEyqfZ9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48fRlDJ1AqQ6BIcOdbw64QCB+ytL2Gec1G5f13Z8bSc=;
 b=y7fBLEHsOD/nI+w47AXi8OOaByPH9gTnsK4ij9qyQBc9JZu1PNnjxMv27YplFA9Vhnln5IpRIIHp/e4fCuD7+6LgPas01iPFsawPBvT1Tu3DdaY8OFSRgXsLOkBQYHNCzUWWv853XHQh6Dos5EfxZo7QlSdoEzlsx6SpeL2g5siC/1MQPnsOkF/l6Kap3oHGETEHWr2wkhRu2P0LcGeyl7qpCye2NgSDQzik2sfNXVcRz/NNIL7vYUz4s5NkQBTU4rpLC6sds7ILroEHRwi4UwyCIIPzv+1Jrq5Y1bLwHNgAHMsjz2mG6dvGnYzjWgGnL4h/sB1SWa5hz5NiQPGK3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48fRlDJ1AqQ6BIcOdbw64QCB+ytL2Gec1G5f13Z8bSc=;
 b=n9tMNMvnOGLfXtqISNc2gQ6/Ng2HBhiN4Pr/Hsd5FePip9A6lKnuWFFijqUU47VS+9fPJRsAEgJSAdxt7tpkXITAgwTqmaPxKd0Iu4v3gcojFhgZ1HHmYwPKtLTpoDEErBw1x6y++uPs7hlsKJgqJJ4p0qWpgm0KC7K/jy8Xfk1XJ/5k0VDI1IHdU7MCnU8aMj3z7XFMsgFqhjqx6mqgNPNurVkfeExDZuF5laZFYywARjvq/TdPizLK3utGwVzv1JtWjNUiirp5DPLWobINFBXQ5MYD/8Rc+cRwjIBZu33AxcGfjycEJr70vPrG1M9I1DG1iSbpYPz+kjme50ziUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 by AS8PR04MB8497.eurprd04.prod.outlook.com (2603:10a6:20b:340::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 09:05:33 +0000
Received: from VI1PR04MB6861.eurprd04.prod.outlook.com
 ([fe80::7f96:4bde:2e55:cd5]) by VI1PR04MB6861.eurprd04.prod.outlook.com
 ([fe80::7f96:4bde:2e55:cd5%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 09:05:32 +0000
From: Jacky Bai <ping.bai@nxp.com>
Date: Tue, 12 May 2026 17:08:10 +0800
Subject: [PATCH] clk: imx: Add audio PLL debugfs for K-divider control
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-imx8m_pll_debugfs-v1-1-e1e44b21be90@nxp.com>
X-B4-Tracking: v=1; b=H4sIAPntAmoC/x3MTQqAIBBA4avIrBNUxKKrREiTYw30h1IE0d2Tl
 t/ivQcyJaYMrXgg0cWZ961AVwLGedgmkhyKwSjjlDVa8no3qz+WxQfCc4pZGuuCiojodA2lOxJ
 Fvv9n17/vB5kYz7tjAAAA
X-Change-ID: 20260421-imx8m_pll_debugfs-246d0fbbb617
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Jacky Bai <ping.bai@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778576904; l=5882;
 i=ping.bai@nxp.com; s=20250804; h=from:subject:message-id;
 bh=ksnAda+S3StBuOVORPKyY/Utwq0uXLVgOK3kRpD/Kqw=;
 b=Pi8rdQCntgD1bel4UmsKb1KndS47EUN5TPJRCc/heCnkKeJnwQg5BdK0f6WBU4UkCkJxMsHYy
 SCsQlvZtYq/C8d5RJjDrsMb6ctLZR0E6bTwzDuniO/ElxDuFzOlT/Cj
X-Developer-Key: i=ping.bai@nxp.com; a=ed25519;
 pk=ckFjCfRynXBjQGmSmzOVI5hggMD9XnnNlwj/jcO/j1U=
X-ClientProxiedBy: SG2PR01CA0172.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::28) To VI1PR04MB6861.eurprd04.prod.outlook.com
 (2603:10a6:803:13c::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:EE_|AS8PR04MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: 51227032-dd12-4f3a-3b8c-08deb0059f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|376014|19092799006|11063799003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	nonMXJsw/WGCvHceZ0dZWWvlXdAhfsi187nxi22D9kMLUKv2GYyYx5G9NfbQ0avuiinZ4xEk51aSQd+8P/qcQTeUqXiF4vGMueEzWmfWJXxwkt39WNlEn8hnUVP7rOVGREBzxEvsa+W1CkSN8Mi37HV5tpLEZQKrAh4scdEbG/28twPr/ek278jCe7fN//63STJbGVXLh/2XvUcPi5fzMLrOrCk1CNkMrZWpXFLgqoCqLBzqswM04J2y6Ol8X7kyENRajLTVGFZx5LHHZSmRlgWWjZdP3NFPb0nI4sCDk1ZA48SorT3jcfnNgIr7VO14s1FbcJcQErgYR/WymsXnya6WqE/WlSi/EDDogsV4IqqqhdzaVvueygYEIvaDYtpwI4st1xa5QfJKqYX0h1OjVu09w6zPFg7GtceP2b3OCHHlFnlCa56VqYfDvv5OYbkK/IhxGGUeZ9IVXa40HNfukucE/aJy6m0Gh8PgdirSwHER5fCJ/Y51o6U4RM0b6ddE59twKnOp/F+4zGcglHw0Pmmu919J5/gpttdv0/hi0K/HpM0DbROlNVz9okm1Kw/j2WWx0bSZaXV+5DPjasdeSzM/EusspKbV7byxbvZBVGXhXwCMfJp4DZBZI+RrT4eHJMkSMY2i6GJoE9r9bvUdvZ41/3dPDU0Yunx85XS5ZTgEAubdxJoC6qBZYEM0gmTR1wGWxITU7lNACR77GqRHoKGMi4gDD6/F9iR7GHhWrkZ6tmMkQOCkOzocSIV6Q40V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB6861.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(376014)(19092799006)(11063799003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzRwT3pjVithWWt1UU9zOWJVZ0FXOGdHYjRKcFBGMURINTZVaTR6Nk4rRk5X?=
 =?utf-8?B?NVZDYS9wTFB1V1NNSlgzOEdRQW41M1RleTM3UzIyU1U1MERPbGIzd3ovNVh4?=
 =?utf-8?B?SVJIbDRzb1NlUFJoSTVnZmRrNDZHOW83STJXWk5Pc05LTTZZU2ZwZnhDR2ZH?=
 =?utf-8?B?WFZGUGllelVCd2pDQU12MmJyZ3NoT3lUSHF5SlNhN2FONC9IV3NhTWxDOEp6?=
 =?utf-8?B?ckI1TXAzbnA2OFgxUmIxNjlFWHlOOWJPWThsRjFTekN6Ty9QYUcrcXBFTU5u?=
 =?utf-8?B?L0hyK1ZBb2k0Tk9UcGlFMUtCMEVSZHFXa0lwRndOemd2a2pvdkFaN09SSktB?=
 =?utf-8?B?dC9yeUVRL05tRXlSU0Mvdk9ac2tEZmVOT2tJTjliTVl2dHM3MmE3R2NKL0l4?=
 =?utf-8?B?SHhZU3pVTHBWRjJOR0ZTcThrOThna1FUOTdYcVV0WDVrTURtbHg4TVRZa3p6?=
 =?utf-8?B?SXkwQjcwU3E5NGpYcCtycTRNdFdUNjBKZncveE9DTDVHWGV6cEFaYzFjVE92?=
 =?utf-8?B?U2RJRC93WWI1RG1tOWVOVmVFZjA4MHBoSXUrbnR3ZEpVRUVvYWdwUkphZ1pP?=
 =?utf-8?B?VGEyN0V2Wkd0Ui91MWpFN1J2a1lkQmtHOHlxbUxXQ0I0bDYrM2NpaUxiMkZw?=
 =?utf-8?B?RkJxYnFLaXdSQXUxcFF5bi9mS09WdVBJWUpnazVRUE5qb1RMeWkzZG9RSldJ?=
 =?utf-8?B?YXlRUlYzcjZqaEZCcHM5aktHYjVkVXJIR3FRZkh3Tk9FbHZwWHFzK05tUDdI?=
 =?utf-8?B?dWxQRThTRlZZeUlGNjBEbWVyNW1sNS9IdXB0Nk5XQi9HYkZsaDJVYU5PS0do?=
 =?utf-8?B?TmQxLzVIdDFFdHBHWDU4TThIcEpMSGdzVHdVcWQwaytNcEdaQk9QWjYyRXQ0?=
 =?utf-8?B?RmFtenkwcFlRLysxU0pjQ1lLMHpJcTY1YU9USW85ZURrdWRtZWZXdzVMOEVv?=
 =?utf-8?B?ckQyM1BVM05va080WFlsTzVMQ2xkd0RYdkVhZnJiYmRNOEdJMnVseDFsV3c5?=
 =?utf-8?B?bGREbHdrOGhCREN6ZmlnU0hvMUxabFE2THR1NVhEcFJnTHdhbzFmaW84TE41?=
 =?utf-8?B?TVM2U3ZLSFR4V0ZQVTMwc1NiTGd0b0FsU3dnM1YxN2l2RlpjV09oajRzcTla?=
 =?utf-8?B?dFV1NENQNmtldW04WXNtSy9qdjhaVVc4WktKZmlSbXdHWS8zdDVPZ1NSUGM4?=
 =?utf-8?B?SjBRUkt6V0h2TW1hc3BuNDBBb1YxUG1PNTZNUXg2U2lia3YwOEcwWWVOV0tL?=
 =?utf-8?B?OE0randjeUpwYUs3Y1ZEMUR5RDdhWm9nWG5rVi9LNGxzNlg5Rkl4SzA3Ync4?=
 =?utf-8?B?LytyTktkSjB1U0ZJVWhKMndyZEpySlZvSi9Id0FCQ0YvUUIyMGpDRFJNRlpI?=
 =?utf-8?B?ZG94enVkb1FsRGtibFJuVVpnZ29za1BITjhkcG9pZnc0RHpaSUlIb3oxdEtB?=
 =?utf-8?B?ZmFTNVJoV0YvbDkrOGNEa0tPVEkyd1VibS9BUEZPME83RDFmaUprT1lVcmxD?=
 =?utf-8?B?dzdlRk5oazU5eUx5M3FsVndNNWN0Q1RRTWJmdFdtcUNoSnFvaVhuRGNjQjA1?=
 =?utf-8?B?QUIwaVYvQ1BxZlFCa0pTenNhbURwTVBnbjg2V2EyVWNzKzBqWklsNzFPQkhr?=
 =?utf-8?B?VkFKVUV6OWhIbVh0UGtHeVZabmE5SXI1b1BMcWZUOUw4NVhCMkhqcnlNMHpa?=
 =?utf-8?B?WTJ3TElCaTR1dEY2OGR2Z0szM3M1ZnFHTHJZNFkyekFrYk8rTmlYLzBhUm9o?=
 =?utf-8?B?aDY2NThLRnQwVXZMaVI1S2QrTzRXMWtpMGRmaFZkNWQvM2JqUnA1cWdkVnVT?=
 =?utf-8?B?NzFJNHdnaVJLc01ES29lcjc5a29iYk80R1lPSmVQZGpBSUZHQUtROTlYQTRP?=
 =?utf-8?B?Uk9xR0Z0RHpNWkYyaEFucmNXVzJ0YVY3Tk0ybzI1cE9pN25FOUJEdCsyWVVp?=
 =?utf-8?B?ZVk3YlVkYkV0ekI0SDYwODhZR3RrZk80Sk84cWRhZTFxcUlaMy93NFBQMmYw?=
 =?utf-8?B?TG9ybi84ejlybnU0OTEzTCtSUHEwTkpTUk1YNW9LcUNLcTQxWENLaVlNcHUz?=
 =?utf-8?B?MWtoQTM2VXNUSUUwWHI5bSt0OXhhMCt4VEs3OTFoRUpNbTVkK3ZGRVEzZ09J?=
 =?utf-8?B?NWJuRWNVTmR1UWd1R0d3YzJXRVJaalVaNGE5T1NpVTBSY2IzMVIrYS9uWXBm?=
 =?utf-8?B?UW5rYVVRUXcraVE0RWRQMWlHcVhQdk5CcjJEejlHb1IvR2huWUdBY1gzWjEv?=
 =?utf-8?B?bC9hNVhzUHZQMnpDTWUrSis5ODNabGt6eGlPSXo3OFBxR2FvRGkzMXBQSkV5?=
 =?utf-8?B?MlUxc0hMRjVTbGdCZkdPYWtCbHJKdTNZdDZJT1hUcXAreW1mbjhJQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51227032-dd12-4f3a-3b8c-08deb0059f3f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB6861.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 09:05:32.8448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZZgtnugmHUDgLP1srezF+289xFRzZNOr+UK65sG043QsOVWe/D9gBBHkTbt3NUSCnsM7rtsAtMqF7gVhumyVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8497

Add debugfs support for runtime tuning of the audio PLL K divider,
which enables fine-grained frequency adjustments for audio PLL.
This is used for:
  - Audio clock calibration and testing
  - Debugging audio synchronization issues

Two debug interfaces are exported to userspace:
  - delta_k: It is used to adjust the K divider in PLL based on small
    steps
  - pll_parameter: It is used for get PLL's current M-divider,
    P-divider, S-divider & K-divider setting in PLL register

examples for the usage of the two interfaces:
   1): Get the current PLL setting of dividers
     cat /sys/kernel/debug/audio_pll_monitor/audio_pll1/pll_parameter

   2): if want to adjust the K-divider by a delta_k '1', then
     echo 1 > /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k;

   3): if want to adjust the K-divider by a delta_k '-1', then
     echo -1 > /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k;

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-imx8mm.c  |  6 ++++
 drivers/clk/imx/clk-pll14xx.c | 79 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/imx/clk.h         |  1 +
 3 files changed, 86 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 319af4deec01c188524807d39dff92bbd08f3601..6a031d7cd031c8b5f5b01e5531ce54360724ba44 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -298,6 +298,7 @@ static struct clk_hw **hws;
 
 static int imx8mm_clocks_probe(struct platform_device *pdev)
 {
+	struct clk_hw *audio_pll_hws[2];
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
@@ -610,6 +611,11 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 
 	imx_register_uart_clocks();
 
+	/* Add debug interface for audio PLLs */
+	audio_pll_hws[0] = hws[IMX8MM_AUDIO_PLL1];
+	audio_pll_hws[1] = hws[IMX8MM_AUDIO_PLL2];
+	audio_pll_debug_init(audio_pll_hws, ARRAY_SIZE(audio_pll_hws));
+
 	return 0;
 
 unregister_hws:
diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 39600ee22be3066683b562aa6f2a8b750d19c4cc..59f126f35474116bdad0aeda59777b9eb7f246cf 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
+#include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/io.h>
@@ -551,3 +552,81 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device *dev, const char *name,
 	return hw;
 }
 EXPORT_SYMBOL_GPL(imx_dev_clk_hw_pll14xx);
+
+/*
+ * Debugfs interface for Audio PLL runtime monitoring and control
+ *
+ * This interface allows dynamic adjustment of the Audio PLL
+ * K-divider for precise frequency tuning, particularly useful
+ * for audio applications.
+ *
+ * examples for the usage of the two interfaces:
+ *   1): Get the current PLL setting of dividers
+ *     cat /sys/kernel/debug/audio_pll_monitor/audio_pll1/pll_parameter
+ *
+ *   2): if want to adjust the K-divider by a delta_k '1', then
+ *     echo 1 > /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k;
+ *
+ *   3): if want to adjust the K-divider by a delta_k '-1', then
+ *     echo -1 > /sys/kernel/debug/audio_pll_monitor/audio_pll1/delta_k;
+ */
+#ifdef CONFIG_DEBUG_FS
+static int pll_delta_k_set(void *data, u64 val)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(data);
+	s16 delta_k = (s16)val;
+	u32 div_ctl1;
+	s16 kdiv;
+
+	div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
+	kdiv = FIELD_GET(KDIV_MASK, div_ctl1) + delta_k;
+	writel_relaxed(FIELD_PREP(KDIV_MASK, kdiv), pll->base + DIV_CTL1);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE_SIGNED(delta_k_fops, NULL, pll_delta_k_set, "%lld\n");
+
+static int pll_setting_show(struct seq_file *s, void *data)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(s->private);
+	u32 div_ctl0, div_ctl1;
+	u32 mdiv, pdiv, sdiv, kdiv;
+
+	div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
+	div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
+
+	mdiv = FIELD_GET(MDIV_MASK, div_ctl0);
+	pdiv = FIELD_GET(PDIV_MASK, div_ctl0);
+	sdiv = FIELD_GET(SDIV_MASK, div_ctl0);
+	kdiv = FIELD_GET(KDIV_MASK, div_ctl1);
+
+	seq_printf(s, "Mdiv: 0x%x; Pdiv: 0x%x; Sdiv: 0x%x; Kdiv: 0x%x\n",
+	mdiv, pdiv, sdiv, kdiv);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(pll_setting);
+
+void audio_pll_debug_init(struct clk_hw *hws[], unsigned int num_plls)
+{
+	struct dentry *rootdir, *audio_pll_dir;
+	const char *pll_name;
+	int i;
+
+	rootdir = debugfs_create_dir("audio_pll_monitor", NULL);
+
+	for (i = 0; i < num_plls; i++) {
+		pll_name = clk_hw_get_name(hws[i]);
+		audio_pll_dir = debugfs_create_dir(pll_name, rootdir);
+		debugfs_create_file_unsafe("delta_k", 0200, audio_pll_dir,
+				hws[i], &delta_k_fops);
+		debugfs_create_file("pll_parameter", 0444, audio_pll_dir,
+				hws[i], &pll_setting_fops);
+	}
+}
+#else /* !CONFIG_DEBUG_FS */
+void audio_pll_debug_init(struct clk_hw *hws[], unsigned int num_plls)
+{
+}
+#endif /* CONFIG_DEBUG_FS */
+EXPORT_SYMBOL_GPL(audio_pll_debug_init);
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3d1b7c1b4bf65e2329831832b43a5..9611ab127dad6f23770c18e22e1acbe2fc22bd4e 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -487,4 +487,5 @@ struct clk_hw *imx_clk_gpr_mux(const char *name, const char *compatible,
 			       u32 reg, const char **parent_names,
 			       u8 num_parents, const u32 *mux_table, u32 mask);
 
+void audio_pll_debug_init(struct clk_hw **hws, unsigned int num_plls);
 #endif

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260421-imx8m_pll_debugfs-246d0fbbb617

Best regards,
-- 
Jacky Bai <ping.bai@nxp.com>


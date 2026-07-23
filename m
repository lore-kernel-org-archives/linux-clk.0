Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012008.outbound.protection.outlook.com [52.101.66.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D593D5643;
	Thu, 23 Jul 2026 06:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784789547; cv=fail; b=O1MJUn6QE8H3zbc92pVHCOIHtUBZ9Vjy4/oCtUSLtrYH9VsejQtlpOFmuVuruPfohLGntS8fKA4esXVKdsCWXCEUBqlZb6gHJg/IXNVHZhWFwahnrjH6kVIJN0NiYKYbdH5GzMJ8/r/ELh5ciMcxQD8hBax1i3tl80AiSPishmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784789547; c=relaxed/simple;
	bh=/iywNgA4UsGBlh2yC5OE9+001dOSxQFvySuOxm0Rt5I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ffCGeIIftzvYEpceEEJvjFYglKcJJJnAY3Dfj4g6AbjM4XAHpxX+97wOx4tmiLSK9KRerLsglpobi+whMAnCI2Y2N/FNodmy1QDyqbQHas/25rPzriQjxcd8haHOV4vqzmU+A0agaDXaEWdn4qP8o4UXBHMrAPx/ru6BvenrGCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fIonpnFy; arc=fail smtp.client-ip=52.101.66.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fIonpnFy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJVBzmZyTkApddTaYgNf9jOZzlXbsm+nqVulOL0hjSGgoO5j74ovLD1jjVz48t/9La0WmRl8a4sxWdJ5LrqzsHyAcUlOqIrWqH1Ygggk8yXWi8JHwPpG46RzqzU7gTNR1yZqHYyXrWSmE342PKB5YSQw7Snq6qdyt4UsPattH4ey9QrYGxUIK5GW5+7MQTfPCkuuwkY+Mn/Te8jpyAqoKxVw3dhz1toYK7ZmJtWSYcC3eWbQqctR+EYfSwKtkcYyXcKRw0LNIAf/RMakHVR99aNzoGrKSnHFisuzsAAju0TiRM/W7uPU59KElJULFe/hLA9oMjisIysmxn3PeXT4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIAGdAIIez59cTVY2nXI3mziANVjtlFelMWvcB6zB68=;
 b=St3jc9BV86R/WShfZ3PSDZ/abmEaEbdZnzSfs4Qz7UglrZYiIog41qqQbFoacUQ5MdEMH/0tQev1eVJW8Wf72nBX5zRiTzPzS1KUNKXYQvjglg3tblu+zhXna31GuMcuzzmIFc9xCw3IUv/NL3HJPthcQT6IZkl/M2xEYHkk8n12dAopP6U/7ZzUlB8lSLTWtdSM9b28FlCsRHIdGsy2BpKAZieQURdKtLXc/iM3hhFMBV3MGx2aQI9YtBfpa94JVdyiC7LGYovfh8Hh2d2CaSSaetIoQa1ngsZ9r8xiMw9jmng5SfLKYae7POjje+Lbywi8NZKNwHHM1EGiJEa82A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIAGdAIIez59cTVY2nXI3mziANVjtlFelMWvcB6zB68=;
 b=fIonpnFyXE0rsAelFY+BO2p71PUaKeWmlO0SAH7MoTEcF/sq02gx1ePPEJIMGiE7NK69IEkn+lwXjtdHIih+9PDnckrFP1s7mC+s7mHonVXSQc2nD7NxbjbEGXU/agHpYTPLflQegOZXGIzpxKKLz1/90vODwXfgBPKYpj4s1HhDLITKZQXyNST8Oh4h4D2uxTp4Et9oejX9Dv1yXrIuQy+ziwEf25ICWDkyeNSmoIsMZ63qDhbu99/L+9yOcyQv3KhieCm898v6QMp6QFGMrgP8uqQpfu2+4OHDwHQ5YdcMkpGTAihklCb3p9jIyGlsvAAwhRF0qybBm5fy1MTbHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AM7PR04MB7045.eurprd04.prod.outlook.com (2603:10a6:20b:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 06:52:22 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:52:22 +0000
From: guoniu.zhou@oss.nxp.com
Date: Thu, 23 Jul 2026 14:55:46 +0800
Subject: [PATCH v15 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-csi_formatter-v15-2-0f59837650b1@oss.nxp.com>
References: <20260723-csi_formatter-v15-0-0f59837650b1@oss.nxp.com>
In-Reply-To: <20260723-csi_formatter-v15-0-0f59837650b1@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784789746; l=3610;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=aRL4uVticjLo6UEH4w/3+H0q3vF5opX2p1kyrpVmyMM=;
 b=+koG8DsWNPubzrJsRrnVdseHFXFh3JEZLyPjyvw844HDNUpBcThQ1n0x9/SHaJpjPVR9KS62F
 cOIil7dE35PDu7LA74lUH9tso0Z5eteG+tTcd7B68+14ZdnnSc9wc/4
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::8) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AM7PR04MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: 220fa0f1-fc0c-4676-0e06-08dee886f257
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|7416014|1800799024|921020|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 eZZk6C1tfY42AoTT2JSjrtOhDdHksOrCS5nIFMM1M7j+UuxlHpmW7lh9QW1I9yzQ+bKy0X8LfJFLJm2hVaQjV2GYELbUrkIhmh0ZnUT+jPN+9XHinR/GEyFOLmoX5QrA+tboERzwfpxMk1WwpGFE9pJcGL7sg85bkCPxiX7MbHBYJcmmwdWTEqMbkmFY8kvHyOWmzGtBWEZ6t3mGANjobketAtKnja9FC9NbzLS300vVMr3jL1uqFHqNwy+kBbc8n33tXj43H85A+nw35OTJoQeyIiAgi3ls7BN7opJZVXp6M3g+ldLtl+1uufzjuWqU2Hn8oI8ataMFZUUI7KohdqYhSBH5QSs0mDd+DM5FYnv6fqVyyaRr1JRSFeqtjdXXPhFhQC9E1f72u1s0Z9/gKAkmEnF0dzm3wm8S41+4H9CWstms/uP3483+u7ZX8b5PJS+ICSbFLskHOgLv0cN+0UtcXj1UMxb89O4yQ4x/CnQenMCcqjT/EkDAv/8ftjSeAM/vxAy7u5+QNYLcT5AN2ewCUX+N+MaTEErdyqhHlhM7v6Cm8WfBs9cbhhcopnbjCMFZsqR8bVOqMQN4d5KkLq5aSadzvI/64KTDbvQUVx5azAExuGeLaKEGmRRktJBTIgY635aL0HhWE0Q/8MJwROqiy5qoPaPiFZDrjfqib5I4xoGj9Ku7jkXDrexk2x33rq4WOOYhiScM+act1z+NVg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(7416014)(1800799024)(921020)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OHU2MU14bStlSTk1ME1MZUhoYS8zQzJBbTVnYlVXU3dJOHVEUVgrTmhMRzhw?=
 =?utf-8?B?SmZDSmVUcGZWQi9zL3Y4V1NUa1kvSU15TVNUWVpqY0FlSXZXWU5oYTU1ZWl6?=
 =?utf-8?B?cm90cm9QYVl5REFWTDNtbWNUTWRXc3B1TkdyOUJ0c3dvWGRlaHdYd1hVQVRQ?=
 =?utf-8?B?SEJmNUdYUTVSU1p6ZTZKc2I0VWl2MTBBOXFiN21OSUdGc05XWCtjM2tGUmZR?=
 =?utf-8?B?VXlTRjZIYlJFUTFSSkNQL2R6KzVPMnBUYTAyUXdUaE9NTVZNNVlXdDRnZkQ5?=
 =?utf-8?B?ZSs2dFpGOTdvcWpDdHRwSTZHZUplTVVvLyttOEY5anZsSG9ldTVRd0RDZUZy?=
 =?utf-8?B?S0VrbkxLS1hVOE5DTEpXczg4aTFPQXZadVFLOW9ra2hnT1EwQnV1eFVDWWZQ?=
 =?utf-8?B?b1VZb1BtVDczblZBcE0xaDFvK09KRWl2cFBKcU1IR3ZGZml0WDhZZlBhL093?=
 =?utf-8?B?TVZDNkVDdWRaSUZ2QjRkOFNPa0trQ0V2dENRcXNvU1cwMkN0QUFHTm9hdXpu?=
 =?utf-8?B?aUtTdHViMlBaNHdnOWp0RzFCZk14YnBJeGIrYngrejVwcFc2WmhNdXg3ZjRN?=
 =?utf-8?B?VmQwZDgwT3ZTNHR2UnVGUWg2d3NiZlRuek5yKzM5YmJxT3JYOUFjTWZMc3Q3?=
 =?utf-8?B?RU9RWVlyMitRd2Q0S0xoRDVrVUNkb3hTb24zSW9ScGdQaXdDRU53VzVVbGRK?=
 =?utf-8?B?T045YmZ2Qm13bDR5OUlYdTlOVll5T2NndVZZM0tPdS9sMWEzNU5GdlVsT2Q1?=
 =?utf-8?B?YlRoQXNPMURLTEU1NmY5WjU3Y3oxZXhOYmFSamdYZFVkbzdPSGZCNkxnZ2Zv?=
 =?utf-8?B?MFI3cjViMG9KT0JmaFg2Wk40ckJTaUtUdDJyTjZlZHVmRlExM0ViclpDN1E0?=
 =?utf-8?B?R3FhL2hnYzBYUGh5dTFMOVVlc2x4YlFtTTNLcDAxeWdWc1pDNlBXUlhYcWlw?=
 =?utf-8?B?OGlsL081R0tQNThwNzNSTFp5Wi9IUVdXemQ0NytTdjVIcGlORCtRVE92bHZr?=
 =?utf-8?B?K2FmRmgvMHg1WjJwYWs0Q1dRdnhyandFMXloMDlpRTJUNU02TlkrTXExN2RZ?=
 =?utf-8?B?bnV1SkZLdXM3NXgzNVU1SVQ4ZzhoM0lwemFCRDJ4T1N1MUZ2MVpkUVJ4dzNJ?=
 =?utf-8?B?cjdYWTNXOS9JMzlmcmhDK002TUd1QXpqM0c4TmNwRDRlSnFSaGU2amRtNHJS?=
 =?utf-8?B?eEU4TXIvZEZ6elpiZFZRNDluVGNYVEpqVUhxTkRQalFXRStidER4OTRhejJm?=
 =?utf-8?B?T0l5dGlsY202Y29ybEFlWHkvVTlILzNoV2RXbGRKUnUyQnhlTXZ0dTIrUUlL?=
 =?utf-8?B?c09WNnd5VTlJTk5KTXdyNzg5cTNJQlBQWHI3VHlWWHBreFNaVEpVMlpyRGcx?=
 =?utf-8?B?VkkvSyt0cGJMd3FSZWFYRktxRWkyUWNuSS9mekNkNUlkZEpkUUl1Y1ozMlJR?=
 =?utf-8?B?aHYwaU5kaDRrV1F3WmlzZkpha2Q2OHZVTCttazB0Z2U4U2E1WWxXVGJQamVH?=
 =?utf-8?B?VkNjWElEb2xyWnBGWDFXdUZMcFRtTWdBOHpGWW81TFFSYjBONnp2K3ExMmV6?=
 =?utf-8?B?cUwzaDlFWksxWHEzclYvREVVZkY3Ym55OXhCdFVFOXp2dkw0NCtLSHA5Z1p5?=
 =?utf-8?B?cEdldzRPdWNzOGxBUUQySCszRzYvRzM4S0JrZUJ6STlkSkVDTVRjT0RZTUJF?=
 =?utf-8?B?MmF1S2tpbGxsSTF1T1FHalcyUHVmV1F1cE1CQ1NZNktlaFRuMnh6MHBaeWNq?=
 =?utf-8?B?S1VkeG5SMlE1RmZYQWZLcG9PbVpDdDVOU0FyQ212ZVVHR1pQaWxTYStYSVhp?=
 =?utf-8?B?alBFdkFRZnl6dnIvSmVSNEcvdjBMMDhPVmJFMlpUajFZVFpQMmJJTjdPcG1o?=
 =?utf-8?B?ckd0SExtdmsxaEZFTlJyako2MzhzMm5MeS9aWkxyTjNFSlJSZzhUZUVpUDQx?=
 =?utf-8?B?L09Ga3IzTVpmNTlTRms3RVh0cDRmNDFuOWwvcmF1VGZuemNiR0Z2SEdCTGE5?=
 =?utf-8?B?VGtIQXNpL3NGdUdZOVMyTTAwbjVWV0x0VXY5dkRVSGgxbDJneXBhNFErVml5?=
 =?utf-8?B?eWZRK2tuWVlYU3RUTU9hdW8vd1grQ3V5S0FlK251L2Q2cWVTT3dpbzBMYU1H?=
 =?utf-8?B?dkUyOHN3UUFSY2hQWmk0Uy9LTSsvV2lDMEszaXAxOVE1U25vaytIZGxiSHhO?=
 =?utf-8?B?cFlVNUJsaUIyM2RobG9LQlpwaU40MHNMNEg5L3FHZDR3M29oQlhnTlpZYXFy?=
 =?utf-8?B?TytycHdXR2hYQUYwM3JPV2hRSHEzbXVBZGMzR3lWUmdRMDJ6bE1EbGFjMzBK?=
 =?utf-8?B?anBjTEVaU0w0SWpzSkZSbEFaR2N3eE1VY2thVDBETGxJTnVGK3c4U0pCSVpt?=
 =?utf-8?Q?HwqI/pMayVmEff05B6QBBH7RntqrgLVzRhA6f?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 220fa0f1-fc0c-4676-0e06-08dee886f257
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:52:22.5131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEe1dVwyUv7sxPJQoq6Rpmjug83IjPtJA3H31HC1vRE+RZLVFib+262eiIeioqjGLG7J09DE75DIaymiOjHthkhhEd5p+Z9iU/ad0eky8bO5hVy761MgvicQi+xc99Sx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7045

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The Camera CSR contains control registers for multiple CSI formatter IPs
at different register offsets. Each formatter is an independent hardware
block with its own clock input and media pipeline connection.

Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
with 'reg' property specifying the formatter's register offset within the
CSR address space.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v14:
- Add Reviewed-by tag from Laurent Pinchart

Changes in v13:
- Add Reviewed-by tag from Frank and Krzysztof

Changes in v11:
- Move properties to top-level and use if:then:else (Krzysztof/Frank)

Changes in v10:
- Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
- Add formatter subnode binding and camera-csr syscon example
- Update commit title and message

Changes in v9:
- New patch to address the issue of formatter acting as a child node of syscon
---
 .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index 27403b4c52d6..fbbf1b3f1790 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -39,6 +39,18 @@ properties:
       ID in its "clocks" phandle cell. See
       include/dt-bindings/clock/nxp,imx95-clock.h
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+patternProperties:
+  '^formatter@[0-9a-f]+$':
+    type: object
+    $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -46,6 +58,23 @@ required:
   - power-domains
   - clocks
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nxp,imx95-camera-csr
+    then:
+      required:
+        - '#address-cells'
+        - '#size-cells'
+    else:
+      properties:
+        '#address-cells': false
+        '#size-cells': false
+      patternProperties:
+        '^formatter@[0-9a-f]+$': false
+
 additionalProperties: false
 
 examples:
@@ -57,4 +86,46 @@ examples:
       clocks = <&scmi_clk 114>;
       power-domains = <&scmi_devpd 21>;
     };
+
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    syscon@4ac10000 {
+      compatible = "nxp,imx95-camera-csr", "syscon";
+      reg = <0x4ac10000 0x10000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #clock-cells = <1>;
+      clocks = <&scmi_clk 62>;
+      power-domains = <&scmi_devpd 3>;
+
+      formatter@20 {
+        compatible = "fsl,imx95-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            endpoint {
+              remote-endpoint = <&mipi_csi_0_out>;
+            };
+
+          };
+
+          port@1 {
+            reg = <1>;
+
+            endpoint {
+              remote-endpoint = <&isi_in_2>;
+            };
+          };
+        };
+      };
+    };
 ...

-- 
2.34.1


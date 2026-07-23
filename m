Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F0B3D3488;
	Thu, 23 Jul 2026 06:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784789534; cv=fail; b=h9AT8BTdIia5zAfJKxwIiCRDcjRzZP+4/WAhmAmXXzuAa/rbCiM9yqrk/Res5s+SCds3DPAscrslj1aVFv4M0YryCZHfQph14ZyI8oyU4njmcg0ogIo1G9EOwq0SQ6X5McUF20igAWehH/78XWRwX4x4cIQRLwCSLgGKzHYQL38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784789534; c=relaxed/simple;
	bh=cWf+g1o382B8X2HVUQYXPRTnLuuXWq+yJnu2c2Fijrc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=QlsjeC7PYGEiTydNPZi4Ih+tq/30gntDukMH2HaLIgomwLJup13hcNCckySItrneWh4iPzX8hcxQALGcireAAiOEPxn1G6Oj5v+01VGgi63Xx3IMaa7pDKgvQpym+5OIadPVaJSZ3y04QX7SsbFincEJwjiVpyIVkgAljdyU/xQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rwpIWENn; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rwpIWENn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmIES36yR4tYQNFXCGVLHeDSDyNdn3cy+bRY0QOvIMXNPPJQAkMJR5JeKfxY/4vdeV1WwaOPblxxNF6LMKB19vgoYkfRU/FExZsZHeBI9u25Sac3azhALrgjN+uTlP8UMoWCrFlJIqenPeMoyY1zXfc4CwLqzooRky189+Z65kG8UIFxKRIYfwaaBcL5cy9BehAAA1ut/Sbx745skBJ8dhx64q7gm1yEel8Xi1AYEN/3l83XELPdbEPxNlm6LMoEqgsG4mlMjVDIKMT5aye2yNRoq3sjrvYDOK2nBxGgELivJ805fZG74TW1WF8v558XdPVM8TIdNYB3kmYM8ZgNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4l9aDEtMRxmZnLBPFEV8hR/LxQKs17VjbEo5qkn0Kg=;
 b=atT3VD5uYv/nyKckGlpSONg794nu0/DZDQ6LwzJKGHuMctV7x9RiSKmhpHWfxFc3WKrXw4QgvVFPtSH2DWuyuzNrxrKOXhUq3Ssp/8oywub+3fkktGv55YoNuHX606aF329rTNiRdQI9PpRkzEfziOtXRDGX4F4cCWGqLKbdpWV2zBz31CPdN9JH5AL55pjJa2jzPSmX3rluks7BeHXCdA1KwDBTiY1awp8K7Df1/UXwVC/Gfj5RHfFFl1xLnCxMRGmxMGtOeJSw67g+AlfO1dguzpi8SyW0fv1wZIaR7k9PXOJ30oM1qKuDqgPwBQVrhu5kuXIf2TWLNih68ECIaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4l9aDEtMRxmZnLBPFEV8hR/LxQKs17VjbEo5qkn0Kg=;
 b=rwpIWENni5h2QZE5N37UsZHJ9hzTLKEJyw9PO/v0ehO9dkCR27I/hyp58RHDpFa621Cn894Bj55PMipsF3qtrX8EITA4IJGlLrREenQI3fD2QAYWlCznySMyoTRJBhqURxpFroZFPSLiV/3k266i7XGiXF0d/YPPGg2kjrbred+zn75FoSVZrAoyKcHW4zBDmbi2j2j9Bb978t+KJmOcecdIMeOieBJJ0Wfa3co2GuXU7fG/Ht0WIqa7jkmvNQ1Qpys37F2ygH6lfWzjETm9UU836ASBc6TVSt1Xpt6BRFsvwmlAmlDHhcTseBlH+02/fZpeWCXmBp5cdFC+9BagKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AM7PR04MB7045.eurprd04.prod.outlook.com (2603:10a6:20b:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 06:52:07 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:52:07 +0000
From: guoniu.zhou@oss.nxp.com
Subject: [PATCH v15 0/3] media: nxp: Add CSI Pixel Formatter support
Date: Thu, 23 Jul 2026 14:55:44 +0800
Message-Id: <20260723-csi_formatter-v15-0-0f59837650b1@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPC6YWoC/23SS07EMAwG4KugrimyncRJWHEPhFCe0AVT1I4qE
 Jq7kw5CkzZdJtL3O3b8081pGtLcPd79dFNahnkYT+WA6v6uC+/u9Jb6IZaLjoAUIqk+zMNrHqc
 Pdz6nqU8cyQrkGBJ3xXxOKQ9f18Dnl3J+H+bzOH1f8xdcb/+SCMQuacEe+uRtQpTaS5ueTl+fD
 2H86NachSqLem+pWCZk47IBQthaUVu7t6JYwwYiR6PB4tbKf8uARHsr17qZc3ARgxBua1Vtm35
 VsVF5AyIb1j5vLd9smfvecrGAQCYJpET+aZznh43XtTd7r4tXTF4rUEon0XpT+ebXF7P27Vkyl
 fokD+rb2vPe2+KDE9GUockgbOsRbgHcNoCl/z6TMALKC7xTBwlYJbTjx3XfnLaUkw2ogA4S6Ja
 gsWkC161b/zaizkG6fJAgqgSCJmHdPRmDdQaSDDkeJMg6oVkElNdJkrDZeylx94bL5fIL+SoqE
 uMDAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784789746; l=15284;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=cWf+g1o382B8X2HVUQYXPRTnLuuXWq+yJnu2c2Fijrc=;
 b=vD+G/+lWjwTYo5mHyo6YGG0/0vhocUNYmhwS3arQB+B5pexG8xRY9pLdCcb1ZNn0/wndbX8On
 YGREKrbLmU5AixF5voPWbgyr/9EjGrjgJqqjHCmuuz7Ajk904E8UFgy
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0304.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::16) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AM7PR04MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: 5178896e-c195-42bc-c6c7-08dee886e986
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|7416014|1800799024|921020|7136999003|6133799003|56012099006|5023799004|11063799006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 vLzuq5jWxLX1NE9x579Wu7W+alY/QbW3L4I/VRGh4/aS8hnMSgoaQoWpm+rYBCh76QI0KB1/fHSaoAuQlr3ODh7FNPBouXpQuq94oqvMmCCJDKkPkFGbsSkU2Eu6MshKuvCHGsOU+s6HtNQT+kgbXzCtleEq2PiAjnT80VyEjUd6C/jNaGz1L7rkgiir5V1vmRN92hwJcqPOrns/UZKzyZEZ8YrpdGXRm7i1sLZGZyp+ur3yxJfNLAFRbCbzJAZiFot0hRpiuOzvnqbv9aR62PqgkRgkLrdhs41Kcx/HW2uUvh4LCwFpQ+Uimw0GJFje26oeFsh4tKjFlRbFj0Zpokye/N73eAEQcY4YgU4ZogFYBK4rgKp1kwehqkVp+NdKeX9A+LdRycJSJIiuWmkskyp5ziVVNhZbFeE35bVCzOwo0y5zfoW69YsY+Sw2nvZRKtNktlxIXC+IeXAAIU2959mTI7mg4H3OE07RxLlKORk8xwk4mrFOoBplYJt+t+Gy4SZ/IBEDSziUMHP5Q0NEUvCn0urn0vtogaRSGPfK2B5fU93RECQ2NsqOIoweStOq6tKaF7QLNKVBAIwpZyCudIzSa1vlQnPfjP6Pgp2uOAmPP7+ocm1OmBONTiIpSaChSUU7HzL6JizRpcg/45U9vRJdLbxx8JvOuvcSl74R9bU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(7416014)(1800799024)(921020)(7136999003)(6133799003)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NjJqam5RMFdmRUZ6VkFMNWFHK1RRU2VJT0RLYlpoa0VuOERSR0Jqc1JIb0pJ?=
 =?utf-8?B?a0k0dTl3QmdTTGgvL1dZZEIzYTBJNGErTE5UTlFYdmJ0U0VUZkdKcFA0UVpS?=
 =?utf-8?B?UFJMaC9SSUJkTmthTDYxSjNqb1VNVDltRHA4ZkVDcXBiNzd1eitjTlRydk1W?=
 =?utf-8?B?MXZYRDRCWVRMbVk1b25SRWZHcnFaUGRkOCsxUDZjVkJLN1dSek1NN1Rob3h6?=
 =?utf-8?B?ODZJd1FRWWE3UTlGOXUyRSs4aXBaYjBiM1g1Z0I4NFZYcXgyMzV3bWg2ZnU4?=
 =?utf-8?B?bXRBMUtsL1BrL1NnNlphL2RJTTFMT2JDdFlHMFpVTWhHaVh2RTZrZURZcFBv?=
 =?utf-8?B?aGk2M1VkYTZvOFQ3NlJSYnRORDNiM1hFM1oxMTBiQjZDeENoczM5UTNWZGRP?=
 =?utf-8?B?ZHJkVGFHdXF2T2FKNlB0S3VOc3phZjF1REZ1QTM4U2ZORGlrcGI0SmpCeUNH?=
 =?utf-8?B?R1hxZ0hiMktzS2htdkQvRUgrUVVHVjhEYVluZFFDRWdRYWs4aW5wVEpxdE1z?=
 =?utf-8?B?eTVlcG13UXRGbWUvTndMaHM0ektFR2FGblVRbFl0ZTlTcVk0SXpicENqTG1V?=
 =?utf-8?B?ZmcyaGRkeHJwOU02WHZhaHQ2aGlXNEhuRllhaFFKUk41VG42YzRFTTVnSDJ4?=
 =?utf-8?B?YnJndGtnQ2xqcExBSnUyNFlNemQ1bCtiSHUvdkUwU2pvM2RpS2dpbGNnNEdF?=
 =?utf-8?B?cDRsWkpNc1plUkZhcktpRXFCOVVHUnF5bkcxaTNjZ01VdGhZaFdDWDJBZzc3?=
 =?utf-8?B?NjR0MU5sQnM3bHZncEZuY3IyU1BUVlRLMjcrM2tLd0pKNmR0RDQ1WFVuSmUr?=
 =?utf-8?B?RUU4ZGJld0JIY3Z2WEI3ZDBHaW1TdU1LUG5aaERSdlNtckg0RDh6OStYamFp?=
 =?utf-8?B?YzgrREszZ1RLelF5Uy9uMlFUdXVZZHd0b2NYa0lYbUJnVFJ1VW03bWcwSkZq?=
 =?utf-8?B?ZTUxTlRTUERGYm9RazVqYXJiSjZxOUVYTFgzK1k5dFR5NE5XdG53VjNxaFQx?=
 =?utf-8?B?Nm5zU2VUb3BQekdxK3RUbmRkaVdudDhOaEt2K25aYjBXRG1KOVBUZXgvRmxT?=
 =?utf-8?B?aVFjYzd5eTllbmxnQXppTFhYN3lWV3BkQnpsTzMyRFp2T1lrRnVHcW5abVRN?=
 =?utf-8?B?YlFidlRNRGd5Rm1pcjJ1bUp2ejV2SHk4SWdLZXlEUlkzOE9CQ0x0d1pGcHRk?=
 =?utf-8?B?Y2lNbTVNbCtDaTd4UlBDOFlvSHF5NVZlbWN0SUtPNU91NEZ3WlRLUWN2YTJy?=
 =?utf-8?B?c3FvYUx1aUttbnQ1WXBRYTkzMGJnSmlmQ2d1TG5CZVNrMysvcHB0akFUTTB3?=
 =?utf-8?B?SkZDSW5uVVlpTWwwRnlFbGJRR2NEdkVGWjZZU05hU0NZcFIrUkdSZUZ5RmVt?=
 =?utf-8?B?akVTVjg4NnhnRmJWcVp0L3R2VUZLVllYbmorREZsdlNPVHByaGZKMDR6ekRE?=
 =?utf-8?B?V1h5Z3F0ZGpSRXRFenU1NHgrQnplVXM4cmJaZm82QzQydExsdFJqck1hOUVq?=
 =?utf-8?B?NU5YUUxBUGZsaUpCd2t0Ym5hVUpTeE5HeXNQQ0laZVVmWDVXV1NSemxWL2ta?=
 =?utf-8?B?MTVqUEhyb1l4K3ZwVERwSWJQTWs0VmFTQk9qUU5QZWVNMFREVDJtSVc2U0ts?=
 =?utf-8?B?NUlxQWtJS0tJZWYzQlNaUjlBT0loSHRCUHBKbUQ0eXJzajhYYVQ2cm56RjhU?=
 =?utf-8?B?RWxGQTBqakNvUzdmNnNMcHlUM052Zm56YXBsTWFycEdvMFRvVGtLS2RYSGhG?=
 =?utf-8?B?WXN5dy9SSzFSaE12SkNlTC9PTkxESFNyaS9xMExqNjY5RHUxdjdjTGp6aTNa?=
 =?utf-8?B?SXlWM2RUb2xWRjc4NjU2UURUa0tkNXVtM05DUkJkQkhPMFlXWVExTHFlMm1n?=
 =?utf-8?B?VGlZaGRESGdDZkxwUGFmZWk2UW5ZanJNbXlPd3FKNWpuMjl4WHA3QVZyRmtF?=
 =?utf-8?B?dVBLVENTSmE1QndNUnl4eE9YcWdkZE9STWdiR3RhdGJBSTA3N2NUODJFN1g1?=
 =?utf-8?B?Qmw1ZWduTmhyWlhReXBNU0ZsZXlZUGVmRkhMOVRzSTEvc1hBeUp4dFVmdEo5?=
 =?utf-8?B?aFVvSGZ6RjAxQkNqQ2h1ck4vaGpUOEdjdU5FMDJFSDhDNjljOUJndkh5bWp0?=
 =?utf-8?B?RWtYTFFSN0NmT0pyL29hQTBLaFdVdEJIQ3RGbW5RN1d0M29WYktKM1E0YUNl?=
 =?utf-8?B?b3ppcXAyR1c3QituTzRML2VxcE1yZkZBNVo0NGVKTzI4OW01SDRGelk4NkVw?=
 =?utf-8?B?ckJ5Nm90aEJKdzBEVlhuZkxUc2Q5OTB1RDBwbm5YNmZ0Z2ZMbmlRQlY0WmRM?=
 =?utf-8?B?WExJY0MxaFJVMmhmejBWSGNqdHduZjV4eHkvQVRaYUJhRWhyc255eFc3eGZp?=
 =?utf-8?Q?KkVMdDOQz2NO6Jfd6BIcFMarPuxjRtbtsdCa6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5178896e-c195-42bc-c6c7-08dee886e986
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:52:07.7875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFK0xflZActGr1hOcKg+Z0ruKvASTO//bwhz+t1KGLVcKXoQaNjTVjZhvxoGcekS3nHw5+jTxksIriCNdmelIG0IFNHTUXDcMhU3WvzsnU4lxg3iQ2hU1YZgdbW/VzBz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7045

CSI Pixel Formatter is a module found on i.MX95. It could unpack the
pixels received by the formatter and reformat them to meet the pixel
link format requirement.

This patch series adds a new V4L2 driver for CSI Pixel Formatter.

Background
----------
The Camera CSR binding was upstreamed during the pre-silicon phase when
the hardware integration details were not fully finalized. At that time,
the syscon binding focused on the CSR's primary role as a shared register
provider for clock gating, QoS, and error handling across Camera domain IPs.

However, the Camera CSR hardware is actually a mixed-function register
container with varying control levels over different IP blocks:
- ISP/CSI: Clock gating only
- ISI: QoS configuration
- CSI: Buffer overflow handling
- LPCAC: Error handling only
- ISP: Pixel link selection
- Formatter: Complete IP control (full register set)

Why Child Nodes Now
-------------------
The CSI formatter is unique among these IPs - it's an independent hardware
block whose complete control registers reside within the CSR address
space, not just a few configuration bits. This architectural detail was
not reflected in the original binding because:

1. The pre-silicon binding focused on simple register-level controls
2. The syscon pattern for complete IP control was not initially considered

Discussion with original CSR author(Peng Fan) confirmed this reflects the
intended hardware design that wasn't fully captured during pre-silicon
upstreaming.

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev9:

Driver Info:
	Driver version   : 7.1.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev9 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev9: 47, Succeeded: 47, Failed: 0, Warnings: 0

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v15:
- [3/3] Add pm_runtime_dont_use_autosuspend() on devm_pm_runtime_enable() failure (Laurent)
- [3/3] Extract csi_formatter_get_frame_desc() helper for start/stop_stream (Laurent)
- [3/3] Use dev_WARN() instead of dev_warn() + WARN_ON(1) (Laurent)
- [3/3] Use pm_runtime_put_autosuspend() instead of pm_runtime_put() (Laurent)
- [3/3] Add Reviewed-by tag from Laurent
- Link to v14: https://lore.kernel.org/r/20260721-csi_formatter-v14-0-ca239fbb441f@oss.nxp.com

Changes in v14:
- [3/3] Use select MFD_SYSCON instead of depends on MFD_SYSCON (Laurent)
- [3/3] Remove unused v4l2-ctrls.h and v4l2-event.h includes (Laurent)
- [3/3] Rename csi_sd to remote_sd and group with remote_pad (Laurent)
- [3/3] Move reg_offset after clk to group generic resources (Laurent)
- [3/3] Remove mutex lock as enable/disable_streams hold state lock (Laurent)
- [3/3] Rename formatter_dt_to_index_map to csi_formatter_dt_to_index_map (Laurent)
- [3/3] Rename formats to csi_formatter_formats (Laurent)
- [3/3] Declare loop variables in for-loop and add braces (Laurent)
- [3/3] Simplify set_fmt, rename sdformat to format, drop NULL check (Laurent)
- [3/3] Set field to V4L2_FIELD_NONE as interlaced not yet supported (Laurent)
- [3/3] Add streaming check in set_fmt to match set_routing (Laurent)
- [3/3] Add WARN_ON for unsupported data type as it indicates driver bug (Laurent)
- [3/3] Return -EPIPE instead of -EINVAL for invalid VC (Laurent)
- [3/3] Refactor ENOIOCTLCMD handling and remove redundant pad check (Laurent)
- [3/3] Use strscpy instead of snprintf for sd->name (Laurent)
- [3/3] Remove redundant dev_dbg in notify_bound (Laurent)
- [3/3] Simplify remote_pad assignment and drop NULL check (Laurent)
- [3/3] Read reg property directly into formatter->reg_offset (Laurent)
- [3/3] Store formatter pointer in drvdata to avoid sd_to_formatter calls (Laurent)
- [3/3] Enable runtime PM autosuspend with 1s delay (Laurent)
- [3/3] Use PM clock framework instead of manual clock handling (Loic)
- [3/3] Add Reviewed-by tag from Loic Poulain
- [3/2] Add Reviewed-by tag from Laurent Pinchart
- [3/1] Add Reviewed-by tag from Laurent Pinchart
- Link to v13: https://lore.kernel.org/r/20260720-csi_formatter-v13-0-4dc9a80e4cfd@oss.nxp.com

Changes in v13:
- [2/3] Add Reviewed-by tag from Frank and Krzysztof
- [3/3] Add Reviewed-by tag from Frank
- [3/3] Replace pr_warn_once() with dev_warn() in csi_formatter_get_index_by_dt()
  to provide device context and warn on every occurrence (Loic)
- [3/3] Add WARN_ON() check for csi_formatter_find_format() return value in
  start/stop_stream functions to catch unexpected NULL (Loic)
- [3/3] Use regmap_set_bits()/regmap_clear_bits() instead of read-modify-write
  pattern and remove unused csi_formatter_read/write helper functions (Loic)
- Link to v12: https://lore.kernel.org/r/20260716-csi_formatter-v12-0-2601d17fc4af@oss.nxp.com

Changes in v12:
- Fix stream ID handling: iterate routing table instead of assuming
  stream ID equals loop index (0-7)
- Remove stream_to_vc[] array: derive VC from routing table and frame
  descriptor on each start/stop operation
- Remove V4L2_SUBDEV_FL_HAS_EVENTS flag since driver does not generate events
- Support stream IDs 0-63 by using BIT_ULL() for stream masks
- Add get_frame_desc call in stop_stream with proper error handling
- Add csi_formatter_read() helper function for register reads
- Use read-modify-write for CSI_VC_PIXEL_DATA_TYPE register to support
  multiplexed streams sharing the same virtual channel
- Use route->sink_pad instead of hardcoded CSI_FORMATTER_PAD_SINK
- Write back coerced format in set_fmt before propagating to source stream
- Drop Frank's Reviewed-by tag due to significant changes, requesting re-review
- Link to v11: https://lore.kernel.org/r/20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com

Changes in v11:
- Drop [PATCH v10 1/4] dt-bindings: clock: imx95-blk-ctl: Use single quotes consistently (Krzysztof)
- Move properties to top-level and use if:then:else (Krzysztof/Frank)
- Link to v10: https://lore.kernel.org/r/20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com

Changes in v10:
- Rebase to latest media/next
- [NEW PATCH] Use single quotes consistently (Krzysztof Kozlowski)
- Drop syscon parent node from example
- Drop Reviewed-by tags from Frank and Krzysztof due to binding changes,
  requesting re-review
- Add description for reg property
- Add space after formatter@20 before opening brace in example
- Enhance the port description with more detailed information
- Delete the blank line immediately following the endpoint in example
- Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
- Add formatter subnode binding and camera-csr syscon example
- Update commit title and message
- Use u8 for vc in csi_formatter_get_vc() and drop vc < 0 check
- Add MFD_SYSCON dependency to Kconfig
- Fix stream/VC mapping potential mismatch in start/stop_stream functions
- Link to v9: https://lore.kernel.org/r/20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com

Changes in v9:
- [NEW PATCH] Fix formatter as syscon child node issue
- Link to v8: https://lore.kernel.org/r/20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com

Changes in v8:
- Rebase to latest media/next
- Use standard port reference instead of video-interfaces.yaml
- Add parent syscon node in example to show device integration
- Remove fmt field and look up format from subdev state instead
- Unify function and structure naming to use csi_formatter_ prefix
- Remove misleading alignment comment from set_fmt function
- Optimize get_frame_desc to call once per start_stream
- Replace V4L2_FRAME_DESC_ENTRY_MAX with CSI_FORMATTER_VC_NUM in loops
- Remove redundant debug message in enable_streams
- Use MEDIA_PAD_FL_MUST_CONNECT flag instead of manual link check
- Link to v7: https://lore.kernel.org/r/20260518-csi_formatter-v7-0-562b750557e3@oss.nxp.com

Changes in v7:
- Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
  Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
- Update references from imx9 to imx95 for consistency with dt-bindings
- Enable PM runtime before async registration
- Link to v6: https://lore.kernel.org/r/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com

Changes in v6:
- Rebase to latest media/next
- Update v4l2-compliace test
- Remove unused header includes
- Unify macro naming: VCx/VCX -> VC and parameter x -> vc
- Remove unused format field from csi_formatter struct
- Use compact initialization for formats array
- Make find_csi_format() return NULL instead of default format
- Use unsigned int for array index in find_csi_format()
- Add err_ prefix to error handling labels
- Add v4l2_subdev_cleanup() and reorder cleanup sequence
- Update enable_streams debug output format
- Rename VC_MAX to VC_NUM and fix boundary check
- Update CSI formatter Kconfig description
- Use v4l2_subdev_get_frame_desc_passthrough() helper
- Fix error paths in async registration and probe
- Add mutex to protect enabled_streams
- Switch to devm_pm_runtime_enable()
- Remove redundant num_routes check in set_routing
- Optimize get_index_by_dt() and add warning for unsupported type
- csi_formatter_start/stop_stream: Process all streams in mask
- Link to v5: https://lore.kernel.org/r/20260123-csi_formatter-v5-0-d5b803f867bf@nxp.com

Changes in v5:
- Remove CSI_FORMATTER_DRV_NAME macro since only use once.
- Remove sd->owner = THIS_MODULE;
- Simplify code by using DEFINE_RUNTIME_DEV_PM_OPS macro.
- Link to v4: https://lore.kernel.org/r/20260122-csi_formatter-v4-0-6f6fcad1c33a@nxp.com

Changes in v4:
- Rebase to latest media/next.
- Add comments to describe the index field in formatter_dt_to_index_map array.
- Link to v3: https://lore.kernel.org/r/20251219-csi_formatter-v3-0-8680d6d87091@nxp.com

Changes in v3:
- Rename nxp,imx9-csi-formatter.yaml to fsl,imx9-csi-formatter.yaml.
- Drop clock-names property.
- Drop macro IMX95_PD_CAMERA definition and use a constant directly.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings
- Remove the assignment driver.owner = THIS_MODULE.
- Assign struct fwnode_handle *ep __free(fwnode_handle) when definition.
- Update yaml file name for csi formatter in MAINTAINERS.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver
- Link to v2: https://lore.kernel.org/r/20251217-csi_formatter-v2-0-62168af80210@nxp.com

Changes in v2:
- Delete "|" for description key. 
- Add empty line between child node and property.
- Delete labels for endpoint of child nodes.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings

- Update commit message.
- Use the value defined by bellow macros directly since they are used only once.
  #define CSI_FORMATTER_DEF_MBUS_CODE	MEDIA_BUS_FMT_UYVY8_1X16
  #define CSI_FORMATTER_DEF_PIX_WIDTH	1920U
  #define CSI_FORMATTER_DEF_PIX_HEIGHT	1080U
  #define CSI_FORMATTER_MAX_PIX_WIDTH	0xffff
  #define CSI_FORMATTER_MAX_PIX_HEIGHT	0xffff
- Use macro pm_ptr() to fix build warning when CONFIG_PM is disabled. 
- Finish route loop by break statement, instead of goto.
- Return dev_err_probe() when meet errors in probe() function instead of dev_err().
- Remove MODULE_ALIAS().
- Refine .enable(.dsable)_stream callback implementation, include bellow changes:
  Add stream checking.
  Fix potential pm runtime count unbalance issue.
  Add stop stream error handling when enabling remote subdev stream.
- Use __free(fwnode_handle) to drop reference to a device node automatically.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

- Link to v1: https://lore.kernel.org/r/20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com

---
Guoniu Zhou (3):
      media: dt-bindings: Add CSI Pixel Formatter DT bindings
      dt-bindings: clock: imx95-blk-ctl: Define formatter child node schema
      media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  71 ++
 .../bindings/media/fsl,imx95-csi-formatter.yaml    |  88 +++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/nxp/Kconfig                 |  16 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx95-csi-formatter.c   | 756 +++++++++++++++++++++
 6 files changed, 940 insertions(+)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


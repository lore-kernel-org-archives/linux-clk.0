Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010019.outbound.protection.outlook.com [52.101.84.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE463D565F;
	Thu, 23 Jul 2026 06:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784789542; cv=fail; b=ELbI7CiyQIf0nrvNzEPkrkaOwK3VWya6YVg1PsI8FjC2bWw10inLCBbqsUHokCyVbqBTLyc7O7BiuRXy9CJjUFbXRtwC/v8/Xp1wxj+21JZaDNoX+hEvtATuXzi96TqR4SSsjWrEoo+tl8bjQw+cfFkQuO44SmPBWh88mcWwuDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784789542; c=relaxed/simple;
	bh=H/TAk2D9RwCn7uBj+jw6IdS/CYOjt9KD+bKg/uoY+NQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kZ0qqa5RyDpuULXVNmh815WxWoUwNkieycLCe/rpJne2ZMGD1zYLoJeuFicaqSOra9lgClvk5ZARig7et4YiahafspNQlHKuscz/8c7DGcXvPItTP+LeOOHRKKWbLDmDTllZSjO8Xmu52N7MmKTT4OzfXmEW36xDYn6kbGHWCl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RDGyF+DL; arc=fail smtp.client-ip=52.101.84.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RDGyF+DL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSc4ttpiwk9xUZSqiqq+Wi5sKIBQ3g3so7yTUpt3NzOiw2y2jLiZevgkRHsm+pi58Mgef9XdqIqdNHN22zbdDGY5vdnN0W+0FrPb/UpxCYtTVaYeq5QyDKQQ1etfP/dadLSs1pyeZErxevi4lOz7ktypBLbWohPR0EUoc9j04bTWBA2F2LvCY4LBGjDff9L49MpXNjHD38BZsqCOXR+pUPNY7fyIcY3v2Ceqq4MXR/crb7EoKJ3JL2ryKDv5ZA80S/6sWGcAToJbAj7awPxQPuOVDiovKGuUjyHFIJkm8z8UWvf4UDAYnjrTXypqLNqKxV59tt08uMYdROxvf6qBlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mclfXq4X7FngkFtNYE6rNc8SKe176tMLQRlBSRzmYQ0=;
 b=rVydIdt8Yufyex4L/r0XDb69a0Vq3FWisNIgwFNrLSzPrafCRneUhW8mHiypnffMql4uiA5WlXW7U7VlzSumrUQfQYrsvDUMBnAjaTPhnPvdCjiRkAZ9imJKFzSdin8kVzUfdpYcUq6v9ru59OXIdwWY93O2RnNF0HGWqkbaY5qdm0oG8Vx1H01A/16XuoZIGnkPqlj2EkoHuAhC+/KbnVIobTyszucHzPoJu3uBl4B7D9dS94ImDdjtz2xGQXtkh9zila/Qj7R2GQ4ELEVP/fvthnp9o6Zgm/Hvk7bfuDCUHD2Nyy9xPxi3jhO9hsXUiGLW8xuOUiJ3ZhOZyIYI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mclfXq4X7FngkFtNYE6rNc8SKe176tMLQRlBSRzmYQ0=;
 b=RDGyF+DL68I8U3a7ncC0fAFd6cTblAO4KegsZjeUdaS4GG+Ej7wNVos2w8JAzX9YZd31+QHKRWkaHn3u0KEq81xNlDP2UfGb9bUWlFJsVlXtpEKy2UQMRw2YhcOsu2j2yj6SdIEqgLCi8BjlCC8WZAQkEjtGZf04XbjaB5XO1KSf8AkPZonn+LS94aC8r0l1wc6RxHVEJMnNVcBJy1eAxLRpEzsdKYR+oVO1ZR7T1upM4D2fGgWr3c/WxITpv9ygCOhQv4lTfCT2NWioayraeKONrnT35ezRwyqW+Oc9jS3lOAe6zzYG1IDYcaR9FE7GtgvNY5xT9ZGspQE6sS0n+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AM7PR04MB7045.eurprd04.prod.outlook.com (2603:10a6:20b:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 06:52:15 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:52:15 +0000
From: guoniu.zhou@oss.nxp.com
Date: Thu, 23 Jul 2026 14:55:45 +0800
Subject: [PATCH v15 1/3] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-csi_formatter-v15-1-0f59837650b1@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784789746; l=3999;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=1KxD4fu9BB5daIhnJsRaUVCtE6uczPiLVZmekvQD2LU=;
 b=k4RBj2ah3S6jS5SOMiiTlqxu70un1rUnf/00DAT0g5BGgukGci/R/AfCY1RLaIQ3MkFHaGZHb
 PGIwgUWI98pBmYoTdoU7vmVbl5JUaMfYLHdiEZJ1Sgp3aCxtErKNjr7
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0308.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::6) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AM7PR04MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e87f41f-0455-4c70-1ec6-08dee886ee51
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|7416014|1800799024|921020|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 kQYLGN+f2tpmF/Y0bpbR5V2hvha72rqFrRSoZmZlVDthc6HwAvljX+zfRh86DofqkcEnUDsljnYMFO61HkC/GsDZ7k68MrBI9QGW5q7M6dvY2QEWwlUxKaqUsw1mCixgi30HygRiOOu6dRZI6Ka9rj9v3jdrIgySRbcWf4hViS/gbS/UH5cmSRmWlMDaFCKOOCAFV7mWonCmHvFIKzxkyzjc60+bUfW40BNInFjh5SVIQVRBZivtmBU/wAVMBtXNS7I2URaLzWD2dNofRYLm+uxH+OCc96Hon24tGazvJ4HH+92IShkO/m3ecM9ykUMie5uyp9tRKWP2ntDobqgac8xQ3jD8uGHt01oZoeHMJEiWPzam7htFB9CCpE5u69IOe6kGgPy2WhqdvyHuS741UP3oG4a+FNov0q8tsFt+tIxoNzgPTmcmQq/JtcrmnZCyNuyjit3bbQwvwK0/ht1fWZikgpvFt4Tvpi6opIqTJkFvh2J1PGy1fjXEcHfVvsUX6JmheF5gcN1p0DrOyTnbOyQkKgHvLdz+hXTRMSR0SdO+Jp4tTzILW63iwzm87/w0gA4Qe4aR2xYwaetfaxvjJosBaCBLJ3FUTEDfiz9uTNDF51VFocfWsseCzcmlzflr0XLY42Qt9MvPBjybworrFpsTWbENP/gkDLo2eN5jb18=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(7416014)(1800799024)(921020)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ajE1RTEyUkt1TW5jYkpCL0JSQXZqZzBrZUo5cUVZd3pURVlrVkVBNUsvdzhM?=
 =?utf-8?B?S0RJckdRVnZhaHJWamY2QnVBY2J3Z1JyS29XeitvSUxma1pHZ2ZQUXVYR3Rt?=
 =?utf-8?B?Qkp4ZXhBOHpkZjVTSFpQOGl5N1kzcXlmRTJVMXNmUjFnTG1FWlAwNlRGTzBN?=
 =?utf-8?B?OGYvTDVzbTJ3VU9mN1hYeU5UMG1ZbHpFaTdHY25PNTZEaTcwL3dtZHp2L21T?=
 =?utf-8?B?SGp4dlQ4RFR5ekdxYXl6NmNQaDIrbTg5T3pieCtDai9saEVHNncrU01sbUlG?=
 =?utf-8?B?YU9sc3VMdFZuNzRkbXR0UG1XNGczcXRYMnQzTmhEK2piUVVqRVhiUFVIZWt2?=
 =?utf-8?B?MmRaM3cyU0JsYW1lUllkdE9TQ1ZleGpwWVBNSFJqNnM2R2pBejN4OFFCZ1Zh?=
 =?utf-8?B?eW82TUJTckllbEpYaGZtN3JlWURuQmY4Y0RabUNzVDFmREl2ZTh2a2NlK3No?=
 =?utf-8?B?OGxvaUQ0RXJaRTBFbFN5NllCTlcyazdSckhpVXI5MHV2MWcxL1FHZlFqQlUx?=
 =?utf-8?B?YVlSRXJZM0RiWFdycFV2dXlpcE1vbDBYWkJLelpXM0daRVVxYnVZZW0wNWRa?=
 =?utf-8?B?bGRYenBiN2dEQXNHVEVIdUt6QTZRRi90T2hNQUVVWjBQby8vK3hlbDVIK2gx?=
 =?utf-8?B?VzdMWktBbWw2MUVPQzFldldGYTI3RUZyUFNFbUQ2VG9mVzhyYzZkTm56cnFM?=
 =?utf-8?B?WTl1V2s5OStDdmk4cmJISGtEOUJTa2VmZVFJdE9UWFJNeS9lTHkwODhlNC9s?=
 =?utf-8?B?elNxUzByYnFnNkQ4dy9jWE52TUhKeXYyTU9RVjh6YlFnM2FxQUZGWmpJM25V?=
 =?utf-8?B?d3FZWmd5dm90d1kvbzVnblF0T1g4VUVaWmhlK1gvVEhSZWVaeE1EbThIZzVU?=
 =?utf-8?B?RVBSeUtpbFJIZVYrbG1MRElsWjhZQzhjeTVRNUtQZFY5QXo2TzJrcDUzREpG?=
 =?utf-8?B?TzlvMWt6TmwxV3JMTlVNNS8vMGNTRUFabytKVzlycjYrNGxxWkorZ0pYcFV4?=
 =?utf-8?B?eHBqNGdYOFdiSmV5bitTNTRTTE5SblNoVEZKS2RSQW9IcE45ZDJQY29LTnZK?=
 =?utf-8?B?WlNaMDhpTGkxaVI5Y2pvZG5qRFpPbGh1UU5MdGtHL1FPZzA2MHB3b1IyUEIx?=
 =?utf-8?B?RStQS2Rwb2pJSW42QW1vU2FGVC9GUjljSmFHUnkrWCtkNFRkelp6MzA3b1ll?=
 =?utf-8?B?RUh3MEtnTlVjWjVWckl2UzJUR2t4bTFzRGgxNU5rTm5YQ1FOTERoRi9icUNP?=
 =?utf-8?B?b3p5c2FUNmhvTFJZQmVHVFZGakgwVkNmQzRQbWhDOURUMWQ5dTFmQzJHQ1ky?=
 =?utf-8?B?cm5PNWtzaDJsVWk4R2dRR0lSSkZKUHNvaUxzbW5yRVZkOXVWNjFSNk15R1ZM?=
 =?utf-8?B?MTg3NUd0dWJsVUVSbndlb3phYlQ4a2dxdmUxTmVwVkplNy9jVk1UODZpTmtH?=
 =?utf-8?B?QnBuclVMMjJCMGp0TnFuYVlBd1VSU0hmdnRjWFhqSlJzdS80TWFWdGx5aENI?=
 =?utf-8?B?QVJVSXBURVJiWHdsUVNnc0hUWmY4TXk3OFVQbHpCSmpmcEZuZEhxak1ibG9k?=
 =?utf-8?B?N2hmZ1grWXhrenZrdFBnRHRLVU40OXV4S0xvZ01aN2NWU3hwb3JnU2E4WC9R?=
 =?utf-8?B?NXlQaDBHWU5ya2QrNFEvRUE4Y3BnTi9rYnB3eWlRRVRtQjgwcW9SSHJ5U2Vk?=
 =?utf-8?B?ZExtUXVmWFc0RTVmNFFMWmtYZUF1QTlvM1ZURk4zOEdoUEYwYlhSR3RqR3Ra?=
 =?utf-8?B?Q2tyRTRtRVk5bWRqaUEvS1J6NUI4TzJOMzE2SWVJMXRuQkd3Q1N6dTIyYzZJ?=
 =?utf-8?B?T2lKTlhSMXcxdzhvN1lxOVVXNHJVSlJCNzNXOU9qZGNQS05vNUxyT0duRHVj?=
 =?utf-8?B?L1ovR1BqbmdkRFIxK0JzaGJJeHJPL20ya3piRGdrYXc5ZmIyMUFlMEpzT3pC?=
 =?utf-8?B?bk1Kb3NFeCtpYnhWZkdEWWs0WjIyQzVFdXFYcUJiTkxNai9JemR6OEdzT1ow?=
 =?utf-8?B?Zkl5MUJ6TVdGdmh3aDI1NTVBcVhJeEJ2L2daa2xqdDkzMEpIRCtqWGFTblpT?=
 =?utf-8?B?K1pNZTRrVnZQRGhDdi92UWhSUDhZN1JuenNpODNlQWJnQW45M2V6d1VDMno4?=
 =?utf-8?B?c1Y0Z2dUZ3RQUnJBNGo3UzAraEcycmZlYWE4cHpwMVAzRjFGcG1nTUFJWE04?=
 =?utf-8?B?K3dxR2JvVStOdFFJbGhOVWhKbm41WkhPTUY4WGNYUXA5QkErVXo2NUJBQ2J2?=
 =?utf-8?B?eVNsekZ3ajhtMWh1U1dUZ2M2OUZlaFBFaEVjc2l2UnFEU0VZZU96ZVp4U3N2?=
 =?utf-8?B?UWQ2UHdwY1VMdFhPQ1FrTEQ1WDFINnNDMGFrRjJNMllGVHpWNk4vZytTb2dO?=
 =?utf-8?Q?zZiLcMj93ruqU4lPqHGiXpa5SFfbOVKOq67z5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e87f41f-0455-4c70-1ec6-08dee886ee51
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:52:15.6813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGGEHUXTwDfDV8yFI7kkREj78AW4ITFbHErcin35zIl3T4A/sNIDzidkrZ1hyG93s9WbhfyvMGh4ye84YGQkhA6tZJhFWKHiKYaFRMF1OevlPsx4Hj/G/XUE3Cgj9SHF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7045

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX95 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v14:
- Add Rb tag from Laurent pinchart

Changes in v11:
- Add Rb tags from Frank Li and Krzysztof Kozlowski

Changes in v10:
- Drop syscon parent node from example
- Drop Reviewed-by tags from Frank and Krzysztof due to binding changes
- Add description for reg property
- Add space after formatter@20 before opening brace in example
- Enhance the port description with more detailed information
- Delete the blank line immediately following the endpoint in example

Changes in v9:
- Use direct node instead of syscon wrapper in example

Changes in v8:
- Use standard port reference instead of video-interfaces.yaml
- Add parent syscon node in example to show device integration
- Add required constraints for port@0 and port@1 in ports node

Changes in v7:
- Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
  Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
---
 .../bindings/media/fsl,imx95-csi-formatter.yaml    | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
new file mode 100644
index 000000000000..58c4e1cc056b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx95-csi-formatter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX95 CSI Pixel Formatter
+
+maintainers:
+  - Guoniu Zhou <guoniu.zhou@nxp.com>
+
+description:
+  The CSI pixel formatting module found on i.MX95 uses packet info, pixel
+  and non-pixel data from the CSI-2 host controller and reformat them to
+  match Pixel Link(PL) definition.
+
+properties:
+  compatible:
+    const: fsl,imx95-csi-formatter
+
+  reg:
+    maxItems: 1
+    description: Register offset and size within the parent syscon
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port, connects to MIPI CSI-2 receiver output (IDI interface)
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port, connects to ISI input via Pixel Link (PL)
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    formatter@20 {
+        compatible = "fsl,imx95-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mipi_csi_0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&isi_in_2>;
+                };
+            };
+        };
+    };

-- 
2.34.1


Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8723911CA;
	Mon, 20 Jul 2026 09:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541383; cv=fail; b=sqfkpHTM8fSdBaga30ejvLpOgRYTTS5tL4VIDBQ6t/Vvf2iNPa60GA8K/NbX/FKFJqfYeibvnj8OALcDrEJa2xymqPAyCz3N6YjsUvjwbP4DqRyH2MziIqpY403hBs1NNLhXC1/JKBQ1Sgicb4uWKAlrE74Lmco+p1xEeJhMoRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541383; c=relaxed/simple;
	bh=5QQvazyKcUgEkh2//QHH4/xYXXWJMBUfk/EjXnR6seg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=lZWxTUTYue1FZqjhuc/fWxKtIfbMg0cO+UrDLNy6QdxofrDr94E1EnVDifwl8hqjNj7ACu58pCkXWkmdXcjXKli2U6oYq2Vn9kHMMQRL4JLrlyyvbZ0LWBGYg+Vc72B/USxA5WkKp1e3lC3JqoL4elNEf1t1BUjyjyrvz1TgYjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Oa0I4HOj; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Oa0I4HOj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCI8LHP+zWuWa7bkHfyDssX4rwkrNQNJKJEDK50wSgJoSZIoq8s9xVgP18rWTTRpkLRi4Ybv6nf7uBm9FPBISkDH5vauMbZ7O3lpbKYDNaJoJ0870VJduNx0vaamFKBTJhQISjGWqNCF1yDUAvi41Asp7+zl0T9mRmnd0k/PYHDNPiyHeteBgIRgRLyZ5VlmjHnA9HOfp3R9lEyHcV/YqX2m4nfLKnAXe5RPiefrIqEv0X85ppWBNpxx9IA7Ifqum7+i/yZ3FgFMW2/alRT1mFY5AXFroitOa2+RxX+1URgXcrIb1b6z4AyvbFeX1vGC7WA4VfQy6Zt6Ai5gIutHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jz4ljYFWRfupnSRX3/P8y0ECq0HYzytdm87k8b4XQeE=;
 b=GOBB/EmsD0TuOwseJWXKeuihVtlWtP2ZT60MAZWp4URtnu9CyUk77r8iXBIhQFNqL4/TGmsBqPoUb/3n1nK7TYhZdhtom9AR6zMXVrmFqz3V3ojUXtoz8ubCNZp+JkDdbbk0e51eJumd+wEHuNzHgQj7o+QYILXYEtUH/j5QGaa8/wmdgwIp6aaQGJwk3DtVIk99kCgXDwlXy1y+WKk2y6AlkBFIDjMHkis0jpA04lyE1Nos9LTwMlENH3e1lbm0/W6vUIYbK7zm7YqQ5+AUmvLlcyacL6uGo0Q+B8+7IwN8OxoPcePBtG5ccfKebld080e3tdx1CgVhrXKaagNyaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jz4ljYFWRfupnSRX3/P8y0ECq0HYzytdm87k8b4XQeE=;
 b=Oa0I4HOjV/QWFuwtIWe0G0DVNB2V4e3oZ9wBZRQ4sJah1yqa3M3LnD1XEZnNTYAmf4eshYBeeX5lf7fnmFxBe8cxFP5Lz5kxTwqDq8RREQw7BnoqN3s0tbfOPWVLqXLgHC6DQJkF+r6AHHo0DJZ6LP5tl6voHuBwiaS+u/I9ArrLvgtRf6TMBKkzrtpqTQaW/I1UQDaw4Qv9NV7NqFxDlJrOXxULFmYT91/92iXfo9vi7/ohGNFRHoxrvOhhcEEhAOJEJkBLeQ1hAKAMsGVhw5nZVT4zwjgAon0YhrCH8g/oCuFM/PTfo/pUOnrgRf4mT8bEHkBeAVxhyObrRrmOEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AM8PR04MB7425.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 09:56:09 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 09:56:09 +0000
From: guoniu.zhou@oss.nxp.com
Subject: [PATCH v13 0/3] media: nxp: Add CSI Pixel Formatter support
Date: Mon, 20 Jul 2026 17:59:45 +0800
Message-Id: <20260720-csi_formatter-v13-0-4dc9a80e4cfd@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJHxXWoC/23S22rDMAwG4FcpuV6KJduyvau+xxjDxzUXbUoSQ
 kfpu0/pGM2hlzZ8vyzJt6rPXZP76n13q7o8Nn3TnvkA8m1XxaM/f+e6SXxRoUANgLqOffNV2u7
 khyF3daaETgKlmKlic+lyaa6PwI9PPh+bfmi7n0f+CNPtXxIKuUoaoRZ1Di4DKBOUy4fz9bKP7
 amackacWTBri2wJgawvViCIpZVz69ZWsrVkRaJkjXCwtOrfkgDEtVVT3UIl+gRRSr+0em43/Wq
 2SQcrZLFkQllaelqe+9oSWwECbZaAGcOh7fv9wpu5t2tv2GvCYLTQ2mS59XbmN1sf7dR3IEXI9
 VG9qO/mntbesY9eJstDU1G6rQfxDKBtA8D91wWllYJfELx+kQCzhO34Yfpv3jgs2UXQAl8k4DP
 BwKYJmH7dtNsEpkTlyzLhfr//AhpqGa9fAwAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784541587; l=13003;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=5QQvazyKcUgEkh2//QHH4/xYXXWJMBUfk/EjXnR6seg=;
 b=X3U/LLDj4c51ZYkZocQS1BXzkDUUiFK/wzMrjcSLrk2HGgKZmAP2OMnh2RygXsG2qQQE8V+hG
 Nx5CEkpv7EAC+JRUU6yV2u3Nbg6+LNGYE5PQaSnDeDpu7WL68DhBq3d
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI3PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:295::10) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AM8PR04MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c70b454-c9cc-414a-b220-08dee6451f8c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|921020|7136999003|18002099003|10067099003|56012099006|5023799004|11063799006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
 FzAfiFT7YsjSCKJgxbQKusfb8PBMfSWN9GSkPKu2ord4rthd4ytjbaNqpMMIXOIupzfKJnD8zyzlDnO9K+Qa19iXQ5QZlwK1vhKIcaqXUa5R9eke6JxgQ2V/xHwV1m/v42Xtv7kjEk0XpL2Vbixy2Pq9FrPGaCWQfUfLMwNPpXP7bIxmWH7loCk+PTba9KSYzmnZUarPU4TpF5Hzo3nLV/CW4ExiobizgAnMIDl1+NDWuzBJ8Ye2FU9SreOH2mzWGMWVMiPVMAhko27jSMdruDn/bhE/Tt7sqo9i0QGkLwAnzj7Ap1yj7rncA1VttIWMShw2NemZTH7MBjGiIl0+yCDmdj429/8tLTAFBIaePBa7VayHUSegdPn/NNlxsXA1V8/j/NIOCzAOmnBSWNy3nZSe8ofqKLY2pqZAHCgCN8PEYRzSeN8r+ZvzLkO5SXj/CveUaGdD44aWlHsxy6HvDpi35RJtv3MarPaSRAY8/AlJqMef53P4RSc1ms+L0IpOlEKXzr2dT4dCXpaq16FoA/KvrGamNo3wGDT03Lo8ywgaNfI0cBzMSl+4QaLNwifbU132jtchg92MuRjXSzW0hwgMz/FyjoqPBpXjueNy2DfLOh4nWMEHHmKjcHIHnRwMXcEe1m52FlOjND38JzNqAoAEXYbUpvTICz5zXp1kRmg=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(921020)(7136999003)(18002099003)(10067099003)(56012099006)(5023799004)(11063799006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?LzdzRXVSSDlyWUxKSGFoTXk0cG4vRkZIa1ZtZWVzM3NOaUtiMzczR3l1d290?=
 =?utf-8?B?eWVnaUtzZzFoZE1OeVhOanQyVUpUSkJoWHRMU1lNTEtMUUFRaUtjalliSVZV?=
 =?utf-8?B?S2tlM2x3djFrVkc0NU5kZnQxQkdsMXRzR09IZFR5VDEvWHVlUnE2dk5vZmEz?=
 =?utf-8?B?ODJZZ2h6SklYQ1BjNHl4OHhSdU82UStkbnNXNkdZZTlDbzNyNUl0cFJwdThs?=
 =?utf-8?B?VTlZbEN4WlhGOFMzNHRYd3BDc3NTcFJmSkxGZkJ1NnVrSUpoN01ETVRyRDJP?=
 =?utf-8?B?VlpFNnIzQnVVbndFRWwxdk95UUNQci8zUkx5U2NGU04rUmdXdVhYbnpici9n?=
 =?utf-8?B?aEJaUmhsTVJXR2ZWUkx3eGFlTFpydlkwZklWWWxQeXNmN2wzK0lkSTV2aHk3?=
 =?utf-8?B?NFg3LzNFWENRSDZucGMya2Q0QUIzd1NHY2paR1VsTEIzRkYrV0l0WW9iSGQy?=
 =?utf-8?B?NUs5clFlL0FoREZ4Qk5RaUUwZlBnUTRDcy9rL3RkSFRmVzFMMHkzTWxhdFcz?=
 =?utf-8?B?bEw2Uk5QVDRxaXgrdW5YNk4xQmozVC94anBiZzFiZDAxQjkyTlhXSmhzQjBu?=
 =?utf-8?B?bXBYQ0wyYitaM0NPSjR2aWlBRjRwUXFRRFNXTEhpNzU5TE5VNG9DQXlscm1V?=
 =?utf-8?B?ajN5ZDloNGN5eDc2eFRDOWFsTkFHMzA2SXNEVCtGcTZVODNOMzVxQ0ZXN1lW?=
 =?utf-8?B?L1FEb2tQV2tuRm1TL0xGNkJoWGtoaHFDdGFQWXhyYXNaTE42ditCeU1DbkRn?=
 =?utf-8?B?RmtmRElXbm9aVlVBcktlRGZHKzdFdldHaEorYURiekxwQ2pobC9hMnpYTEVo?=
 =?utf-8?B?M0ovOFVBeGVOU3J0U3FsQnV1TXl5RXRMendKaGtpcXZoVCtYMjdBZkpSZk5v?=
 =?utf-8?B?VFFjVmM0QnYzK0pISkFiSUhCRmMvYmlwbklIVFBETjlrcEFXdEtwVkJsQThV?=
 =?utf-8?B?MW5XaURYNUxpTERjeVVGd1VaZ1hDVzdJdjJkRHYwNy9DRlFNeDlyQ2tBQmRs?=
 =?utf-8?B?VTFHektSbmpoNWd5N0F6WFhuRzBwYVkxOEV6eHRobEFjMXc0SitYTnJyMDQx?=
 =?utf-8?B?QUpiSnFPQlo4UEJCWUxtZUtrZ1RYNU4zVDI3MlhmbSttWGhta2ZHaldiSmJ1?=
 =?utf-8?B?M04zR2FUaEI5Z200R0lPZ2pzZW1YR1R1RlBpc3ZFa0xTRWVoUzRlRGRtZGNI?=
 =?utf-8?B?ek5jYktYQmdNWWRjMWRKOHhzczNXVEJKdmxjcUljQTQ2ZEZlellSRldpbXhZ?=
 =?utf-8?B?K1Jia1VyUzZYdm1oS3Y5K3ZxVEpuQU90NnRTazRhQXdFTndGL1doazYrM1N3?=
 =?utf-8?B?UXBNOGFrTXRJVnQ3RXZ0RFYwR3Izb1RmM0QzZ0RCRGpaMDVZNHNBTTE2SHht?=
 =?utf-8?B?cEI0amw1R01hUnhzK2pTK3EvQzNVeFV1QTBQNVBCRmQ5VjhVV2NNRS9QK3ZV?=
 =?utf-8?B?ektTa01DUVN1OWl0ZG1tUXR0Rmc1RUtkb3VmakNuUzFTdis1eWp1YTFkemJu?=
 =?utf-8?B?c25TZVZaa1VWS1FGV0c4ZHlIcEhWZmp1QWRGUXJxRkdiYVRTa2F2UTlSbmxr?=
 =?utf-8?B?RjBFMnB3SlRCdmF5cjljbTZKdTBqdVBNZHlyNmp3TkEzKzM1QmFvT1F1Mjcz?=
 =?utf-8?B?NUdDT2s1ckZsZFI4U0YzeHdUWkREc3cvY0xGS1VYeGI5MVU2RnBQZzZwUjho?=
 =?utf-8?B?K3RHdFp4dHp2ZldiQk5SUEI3T21mam82ZGpBaWJIK1JOTkpxSFlUeEdBTTYx?=
 =?utf-8?B?a29jK1krZFl4bVIwRGY5a0R1YzJoK2pHbGR3TzlHbDVHdW0yR3JyMVFJdUJS?=
 =?utf-8?B?NW9nRnZ3RG1QQmV0Wjg0ZWtZOWNESm1XWjlqU0U4R2VzdkhvdWlhcHpNQ0Vj?=
 =?utf-8?B?aHJJQ3gyblM0NHRUemZCM05oTWpDUzV2QlFTMStnaFJ0OFFDQzlGWS9kalk4?=
 =?utf-8?B?SVdNeDAraExpOCtxL3I3eE9LQkg3aW5TMnVYa01IYjYxZGp4TFpVTUo1cGlj?=
 =?utf-8?B?Zkh0bFZMVTY2c21veTdnTXNrK1pURFNYS2Y5am9IR1IxT2l6MDNpRWlnR1Yy?=
 =?utf-8?B?bHlZT3Q2NWlMV0dwdjc1ZTlYOFRqczVJWXozc2o3bU9CWVlIYzlKaEtWbHhR?=
 =?utf-8?B?WEZaQ3lPcVRpQnN1elVUTHIvbW56QXBSTHN3TFBGL25hVlFPbEpNVkZLeEtV?=
 =?utf-8?B?a0VQam9IUnR3M000M1gxMHY4Vk55dFhYbURwdDlxbGtlTWVreU42VUl1Qysx?=
 =?utf-8?B?N3J6VnBMMVgrYlVsZGpPR0phTldyZXFCR0VNOVZVZFNqQ3ZpUnVYT01wNUpa?=
 =?utf-8?B?VnFRZ1V3b2FLVTNQb0RYTktyUUlWNjJyS1FhWmZtWXkvb1orQWZJOCsvei8x?=
 =?utf-8?Q?w8QB1bAjPiNkOFYyxnz1TrU1rNNdLV+Hq1Pj1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c70b454-c9cc-414a-b220-08dee6451f8c
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:56:09.5483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WNBRuP5UEv+VZU77lGxhc+wdmiMIV2df/5RXymhyeqHDKoZuvcaYNmLfzxhNLQLVWFjh7Hb69+QDHoFuiTpgwWcv3XfkP5XGB/48NM6gfeIFM+K4IXCSG/S+fxE/0ZW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7425

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
 drivers/media/platform/nxp/Kconfig                 |  15 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx95-csi-formatter.c   | 808 +++++++++++++++++++++
 6 files changed, 991 insertions(+)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC6F3B47C3;
	Tue, 28 Jul 2026 06:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219037; cv=fail; b=ga8vGkiKXX2R3zcJkZ9Xmkujf4DZmRK3kMs6YxRscMr14CON2uuUvpz308zPdiBFqmETU8z7f/ECpcFEbEYUpcKhF7VbqHUOIGbtO83WWTHjY2VwruurZAWLVfWOQg0fuVK84bYMFoUMm3SBA5/sk+pYLQPZaxtBI67co0pi82w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219037; c=relaxed/simple;
	bh=Mt++3YpiBzN/V9wZgIiSA60cc1813BcvZ9IoEgEEfEc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=TLOx11Ww8+6lpELMClWW4H6qHKGyiqBG0yeFtfHQ0mzl9h/Wksbf9UY5RIfEDVFthHwGdaGVzxgIm5KGeLCUq2ZwdsDVIKpwrE08QU8CXHUsoHrr/FxR5Xno8RIWhWbCOjsjyG6GKFuhbLTdWytel77De2C8qysHAholsQCoBxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FdFafTdC; arc=fail smtp.client-ip=52.101.65.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FdFafTdC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFNVSh0NsgTf609S71E0V4vFeTVfBGArISpUv0kqewJzJj/miZrIW5wVFBxwnq88KKDmyoCYXGUH2EDN/3zdkmHhWv2Juvci/ZH34oqb5nA70njxCj16RQLPYYJTZDuEi5kR9cm8JFQB+xnFLxS2gbgwM/hs8amliRZnYl0C5X70AiIZIP7XtA4lAtapHrhGsP94/lBy4M6NAISNenr1782622oVAhxIdYKVqmqrKGkEFo+ZsGE1Io4i3NYki0h/Dk7oRAgAorlmgfPvNfrIEOXBIxf9RcFuuYGufwPl49Mo4fA3kjurgmnNmNpB44y4r1Beucro1kjWRnbHRPPbGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qEgrj+SKkbP5KOhu4HNe568oerpO0wJ35ImV3E5nqU=;
 b=CFlUBLtxdwhZIXF530MEr2GBLQhInB6rfCyDmLo3STceK+7QkHg+Y0FIigpA5g8KKykyfE/C/f985NHWJZWRRhpDcuAyA/AolEbuSXma84Pox1Y01qv8uKsukpqRMRHrMFMaSo5jwNxWS9WVcSYah/8bHuOtHzc+nyiCEpaYzLpugXlVg/tOBob6uKVv0wXzsfC9r1ZixTZuc9j1eZ2DH4qhcPmled9/jWl5zMv5q9NCWRU/goI9bFiYcLVzDs9MKZEqaabzLf+dhFjp5PTZ9kqTRJe/a+N0pcIs33xPWNADA2Gd8pd/kOHKLv/KC0D8Hx+f09Y4ekKSyWBvnJRFFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qEgrj+SKkbP5KOhu4HNe568oerpO0wJ35ImV3E5nqU=;
 b=FdFafTdC6VM2paYmocKW5/9hNwPbikjR/4LkVdpj3QmAOpJNQotrdX5FQIlRTsxw/dTg4lq0BxC0GvmuQNnD0dqoyqYBZ+kKv8uMKbZakUHCZTnqvLCmI71BvbKnwjSzO9dGXr0WUzV7jqs/I8A587b+dgqJxB8mEDqxVyk8qTOegp9Pee2YlC0NwumwZjzG/eMVH7wB5wOvDHLyCKK7kDhk0VLqb/9Mos1vehHWM2W7BOiNmP1CaUbAt4ikHE6f7QG2jdJLksAsPizAzH2hiB898jwfjKgzeHNSP1T0zXohrAB0IdNVkwssXR5UgpI51ZKOfeGWTvVlhYg3J9gC3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PA1PR04MB10400.eurprd04.prod.outlook.com (2603:10a6:102:44b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:10:31 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:10:31 +0000
From: guoniu.zhou@oss.nxp.com
Subject: [PATCH v16 0/3] media: nxp: Add CSI Pixel Formatter support
Date: Tue, 28 Jul 2026 14:14:13 +0800
Message-Id: <20260728-csi_formatter-v16-0-1065ba47530a@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALVIaGoC/23SzW6cMBDA8VeJOJdoZmyP7Z7yHlUV+bPhkCWCF
 UoV7bvH3qpagzmC9PsbD/M1rGmZ0jr8fPoalrRN6zRfygPyj6chvLnLnzROsbwYCEghkhrDOr3
 meXl312taxsSRrECOIfFQzMeS8vR5D/76XZ7fpvU6L3/v/Q3r238lAnEobTjCmLxNiFJ7adPL5
 fPjOczvQ+1s1FjUR0vFMiEblw0Qwt6K1tqjFcUaNhA5Gg0W91b+twxIdLSynps5BxcxCOH2VrW
 2u68qNipvQGTD2ue95Yctcz9aLhYQyCSBlMi/zOv6vPO69ebodfGKyWsFSukkem8a3/31zdR7e
 5ZM5XySJ+fb1vPR2+KDE9GUockgbO8RHgHuL4Dl/mMmYQSUL/BOnRSwKfTjx7pvTlvKyQZUQCc
 FehQ0dpfAunX130bUOUiXTwqiKRB0hbp7MgbrDCQZcjwpyLbQLQLK+yRJ2Oy9lHj2Daot9HOoe
 whZWSM0K/C4L9xut2+SpFg2JQQAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785219254; l=15846;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=Mt++3YpiBzN/V9wZgIiSA60cc1813BcvZ9IoEgEEfEc=;
 b=MBcssRWUTfLcvHhJACcvEmdBTahAoCQZu3TJ48vHFi67ryRdNBbT6WTZjuNv+CF/tJgRtVobV
 AtJ2kEH3f9qBlLo6djRlAIfkAcI8y/eA0Po6lcqrOtz1qjWo9JzpQmi
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI3PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::19) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PA1PR04MB10400:EE_
X-MS-Office365-Filtering-Correlation-Id: 4345baa3-367f-42b4-2236-08deec6eeda8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|7416014|921020|6133799003|7136999003|56012099006|11063799006|10067099003|5023799004|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 CMebJpvb3lM43nXhuO3zySPa6m/RFL22C4FBtQ52UGj1sAapbqee9uUsBd2QW1AlkCWjYAvpAIbaflgAK+t/z5sftntOYORQCfNJv+NFdFc3JjE9uUzaZg+0yeJJjiUebPAzkiIZPfpZcK5NGesWjHfWrC3qyxgCsB2zW5WOyw8sJg7oi2Z/RoaOxkpk8DvG4gdCl0yuWmgcLdlgZPMGljeliNc/WkmQFJbluex18VLvAV+swbDFjxWG0YWszt7toL17XzSUohVyepjFUm8ZdzmQaPQY+32aLhcmi4UUt8WN75PZVjNNDRPWkp+ytDkGZs6R4FK8H+iro+2zJrdfq5rDCNbk/4g6ihfGue3hjiGl8veDgF4dHNwzEi9V0AL2TsWS0/CA4bGLNZ6cWdDJMEGWKYFSlpQ88W6vG3saHfqQ7ZuZNV5DBsKNuyfednrTUKIs5VI8YWO6rnYW377/65lO6yVyVI5uu9n3cz1oQqxxXp5uCEe14klqN1YTpyZ0k8qvsC7oApB5myQf3a3yt5Vcw/QlEdAA0C3xikp9BGLCU4CXxfUe4GMNhw5f2VWY2iYsfK/H2HGVRRTnr5cjrGwcIVjSbsMOKr2wk4VuufghM0JHIGhO9nkAyjwqusC9LQhwD6gbcR4OWzlRetlZE938zPNopIA94ffZci2K1ap+skPW75gPa5yTNBYVnc8yiYqN2dp0kXb2uqHx7KLf+Q==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(7416014)(921020)(6133799003)(7136999003)(56012099006)(11063799006)(10067099003)(5023799004)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?b25vMnBRMnhtY3NNeEQ4MElHSlBFVUE3L09ZdllwV0RXaWZPMkZEYWxPdlpB?=
 =?utf-8?B?cVprMXhJbDVaaDdROUZxVHhHcCtBQ2VUR3l4TGk1WnYvblUyWFBKZm5reVV6?=
 =?utf-8?B?OVFYNlhDeDhwdzY5TmhRaDRxV1VMdVVud2t4SjhhMy9IemJlMllVOHlRck9R?=
 =?utf-8?B?aFljYlM4NFlxUldrUW1TYktFalJlc05Oa2l0NmhtQVlFQUIzblBkbW15ZEhX?=
 =?utf-8?B?ZnNSYU9yRDJrcGZWOTJQdHhVbXdYTjJtcW8rSmVEVlZUVmtwWHZDTG5DWmsv?=
 =?utf-8?B?Mk1yOGEvajdvc2VhSjZZZ1lKMndpMlFkSkNOdzVES2gvTFF2U2o5S09DRkVh?=
 =?utf-8?B?bDdOeXR5Sllhc1FEYXZ6aDJLLzYrR0tib2g1V1c0Q21NOHlLUnJYeEdGTXpD?=
 =?utf-8?B?TjBCRWdvSHNyT0ljWEFQMWlLZk1iUFZWMzIxZ3hRYk9ieHpWTXZRRDVNdUdw?=
 =?utf-8?B?U3B6WWdzQ0c2cXd4a1RkMkdmL1ViMFdNTTdQdWZCb0E5anQ2UHlBUmJxUlRO?=
 =?utf-8?B?d1dmalFJKzNFZERmRW9sRjYxUGhHZllCeUIwNTdhOTlUS20veDMvZXlDd3ph?=
 =?utf-8?B?LzQ4K1RqeElxNFJoU0xnSGpmd1ZodjNwT2prdWIrc3k0TXJhN0Yxbml6MWVt?=
 =?utf-8?B?SFRHVEM1SkhSQW0zWENVdlA1VkxzclhwNTdZZTEwSHorM0pvb21xUTZaV0pP?=
 =?utf-8?B?NHhhSkd1SzlDTWZOL3NJZ0x4SCtQNDdiYUZhNEJnVXJUSE9GV2tPV1Vxdkls?=
 =?utf-8?B?QlFRMERoYUd0ZDFzcVhBbkxrcTRDMkNJbWFNeUNQSnY3VXNBekZPcTBzcWdR?=
 =?utf-8?B?YUY0cXBJeElXS0t3VVV1VGJRaDd4VTdTYlNBazZ3ZytHY214QkdTYmNUR3hH?=
 =?utf-8?B?RmdSMklrbEs5dFlubkhrRjBKS2thT3AydWpFVlVDRHRUd09KOFc0SlU3VUF0?=
 =?utf-8?B?eCtuVFMyOFluSi9QVzBvUjVzcy96T2VxZHcrOVBmVTVtQllDcm1waSt4eS9s?=
 =?utf-8?B?YTNMU2pTaDZ6WTRJalNqOUJLTmN5dmprZ2hxWVhBT2ZjZG1HSGdvNlFic0JQ?=
 =?utf-8?B?U09GVHlWVXExYTFlUmZlR1dDdzFaT284dnF1L1R6YXpFZmpuUVUrNjlZRTIv?=
 =?utf-8?B?RlNjSjNzWTRPRCtMZHdQSE1EVGhmZUV4L2U0Wi9Pdm45ZGVJVmhpakxYUWo5?=
 =?utf-8?B?Ym41dzB3bmQ4bFRuZ2NWT096NnY4OHgyUkI2WEZjeEFaZ0xLeHNMU3l1RU5D?=
 =?utf-8?B?RzFUYVlqaXBtUm41VXlHUVpOdkZJSFZIWTJJRkk2Wm5hT2Z0YXJTMHhEMllt?=
 =?utf-8?B?MTdqblBLaDZSTjhpaGtxd3FXbWVKZmUwQ3doeG9nNE05aGprV3F4d0NCRmdX?=
 =?utf-8?B?b3lRcWlNWC9LT2luVjBuU1VxKzgwYThQVkgzN2xRZHM1a2t0aXJiNmwwZGp1?=
 =?utf-8?B?Q0JLL05CQVE5Kzg5WmlmdWY5MlBtSGNkWlJZdCtKN2svNTltQ200MmgzUFlq?=
 =?utf-8?B?RkdOM2dFOWVRMGZIdm0zZ05HOXlHMStUZ1RHejNBR0JpMU4wcG1KeDZSZ2Zh?=
 =?utf-8?B?MjJISzFrNGRGcnpOUlVES0Zsc0l0RnlLMldaOU9iWEliTnNDRlRrWFNWY0lC?=
 =?utf-8?B?SkdnQTFOZlpSYmwxRHpsNkY0bTNNWnVZNlF2WlFHYzd5Vy93TU0vdmVEV0xr?=
 =?utf-8?B?V2dvUkJ2ZlRnNHRpbFFCRXNDQmtQSkszVHJRckF2YWQ3b3dXaFpnQSs1TG4y?=
 =?utf-8?B?QXlIT3NOejlmTG1nK1hUQ245Q1RNMXhMWXcyUTNFa3NGaXc0M3VZYS9iaSs1?=
 =?utf-8?B?c1pqNEFsQWttUi9BK3NmRThEZG5xblJRM2EvcHE1Qmhla3p1OGFsd2o1Slhr?=
 =?utf-8?B?WHR6ZWhDVFhIU2V6bWsvRUw0V2RxYXQxUGNjVWd0Rkt5SGhxYTBPcDkvTm5y?=
 =?utf-8?B?eW5rLytEV2VTS08yOUZCdjl0N2ovdzBCLzZIV0I2K0k3MWl4ZzB6cExvZnRt?=
 =?utf-8?B?cnlmMWhPY21KZjE1UEVDK3NEbUhUWmNyMXUvT3d5ZHZGczlYMFpvcGJJMkoy?=
 =?utf-8?B?SHJibEJKWDFPYXVXVHE0NEFaOFRTeEZySEVNbHhYQXZoMXNlRUlQUlZQRVlo?=
 =?utf-8?B?SEJJa0VYUVNZZFI4WWxhZHdzT0YvTEFwWWI1ZENLM2F6enZBeE5SZ3BpT3By?=
 =?utf-8?B?TEhRcVhIMW5QWmVFVEdPVWF5Z29BVzhRdTZkVGpudTVORlVGY1o4ZlRMRk56?=
 =?utf-8?B?SElvOFoyNisxTlhKTTRhSXE1WDBPaElkZ3lNOVJvWEYzaGgxTFRYQ05xQzBj?=
 =?utf-8?B?SDJTbGNsSEk4ODdYbmhuc2JkWGkrN3pVV2V0VURyVFE1KzN6L0d4SkFIUjRV?=
 =?utf-8?Q?dwB7FEkKLGvNGoGAYDdo75acCs5L1vgSn8vd5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4345baa3-367f-42b4-2236-08deec6eeda8
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:10:31.3806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdkyPVKTMKbE5pw7KGuHh2tgHyaUXrRTS+17wb+ZZmI095Sq6CIpI8FpC1BwK7PhRkVFuFFohFCrmcXfISuP4jesfyavAiHsSfCOJcxfG4cD6dUBv/HZBeJNoXIa2IAL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10400

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
Changes in v16:
- [3/3] Use depends on PM_CLK instead of select PM_CLK to avoid Kconfig warnings
  when building with COMPILE_TEST without PM enabled (Sashiko)
- [3/3] Add err_pm_disable label and call pm_runtime_dont_use_autosuspend() on
  csi_formatter_async_register() failure to fix PM state leak (Sashiko)
- [3/3] Add pm_runtime_dont_use_autosuspend() and pm_runtime_suspend() in remove
  to ensure clocks are disabled when driver is unbound (Sashiko)
- Link to v15: https://lore.kernel.org/r/20260723-csi_formatter-v15-0-0f59837650b1@oss.nxp.com

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
 drivers/media/platform/nxp/imx95-csi-formatter.c   | 758 +++++++++++++++++++++
 6 files changed, 942 insertions(+)
---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


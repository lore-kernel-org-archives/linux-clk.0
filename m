Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DF63BB699;
	Tue, 21 Jul 2026 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623054; cv=fail; b=o1TlhQsvMwTk3s5V+r4XmJYOstA98v+ovupVHzQ3yV/PVJpLB5ngfy7vmdHbCOpc6Mf33gJCTUgGQgO89xra4HdAxqrdTjUOe/eRwrnTS9nXaQoOisBliD7IVKc7M6Do5F8N21wWqZwXG4U6YjMDSncuARf8GR34z7Yhv8IVRFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623054; c=relaxed/simple;
	bh=/iywNgA4UsGBlh2yC5OE9+001dOSxQFvySuOxm0Rt5I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fMZKxV8rhO4LOvgw1Rgh1DOyF+BeEddcntIvliGI1bW1FAmvRY/jVy3AQxDBsrPTL/riZw4EUKBX5F7poptO5M/Vv1VYM0zFmm/llOctyZbJDv0JPA0x/S0VavYVNPTZJxMn4N3+5EEGIx21oD/TcnCI4luWcjQF3MoIN8IqYvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FCPJv5an; arc=fail smtp.client-ip=52.101.84.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FCPJv5an"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMRTTaPDZkMWRG5pXn+QajrUj1siA32FTMe7rSiOhEASjgOVX0Weq9gte5Jh6dC11NgX2gyQKWYDpLP4wGVx6MBVPMFxgQskHKJ90W7sufaRyeeZ3O6h2KJFPzQn3wXZsz4kwqPR0aWQUZecnLE2gAeuN9Ctd35ryfWZvxykciIA2Kn1foFbnMSkj8X+7FRmbcBC6TPli7KypH0buEIasORaL9g63Lpo7a1/Mf4Vzeqvim6GeQRZuQiybhgb8Me5JRR27jBvfdRm5JUayyg3amJIj5S49u01Dp5RtKwvdU/QomWhnWWnznQkTZR1e8xTVcnPuVECsTF+SsntmdFVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIAGdAIIez59cTVY2nXI3mziANVjtlFelMWvcB6zB68=;
 b=NCkmFE/d63szO0HfgO4GuhNV/1vqRRgKDcQRBOBHn6M1c0mct4YmVe5dgdcxSGd4QYBzebAEYSAWu+suliHeMlKHZ0XXAXS2CEBkxl70BT1O4cggWvghNyX9jmZ/upg0jHIpKo8yGPaFzBouXMutteFLVaDeJ5GbT2o+/wtyb9knfnu09Djh9BQL1jixQT/slVBSrP0qLrML7cJyhWN9JLm8YniiUVoqJGJNR8d9o73J1Zfc1gZf0pIJzpZr7BFxBXGTo58xG4DVR2hATXnZjD/HgYM92J3usnFcj8IjdqvWU76eH2Kukoj6i/pIhBwBS6PUS4c+l7POKXFUJWq4lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIAGdAIIez59cTVY2nXI3mziANVjtlFelMWvcB6zB68=;
 b=FCPJv5anY0P7xmYAMvZ1fn9BbmreMJlh6veUuRPJbbZ108UB44yxio5gdQaaaPFJMtRrP2b+39uDJ5NYj5Qn2SjwyXzhT/GLP0ZuzEHMwLf3WJWtn45VjDfakKCzF2Rp6sCnkea6VGwog9jR6SDq0kOtGdYuqP+nmOJ/ElPfG/0qlWE1cIksrd4qier3oWgDl4F4Cw/BcJwmetGZL2vic0LVEqTkiN7m+HqRnChG5qmIgdU+e67SQfpmcuxYYd1fvPDe2D5bTj2YLI2HzkSx1XkWSM7mPJKnoa6bxMF3Y8vZJfMOcmOWbYD0CgcNziq2b63WKUA1625NNx3lWhohgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 08:37:28 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 08:37:28 +0000
From: guoniu.zhou@oss.nxp.com
Date: Tue, 21 Jul 2026 16:40:22 +0800
Subject: [PATCH v14 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-csi_formatter-v14-2-ca239fbb441f@oss.nxp.com>
References: <20260721-csi_formatter-v14-0-ca239fbb441f@oss.nxp.com>
In-Reply-To: <20260721-csi_formatter-v14-0-ca239fbb441f@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784623255; l=3610;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=aRL4uVticjLo6UEH4w/3+H0q3vF5opX2p1kyrpVmyMM=;
 b=TovPnwTQ+MW9/rOA08goCMl1PeYNzWkVSvqnquEycGc5TKF1AoQteD9RXCMB3O5YDP58stwIc
 RofINRsR0Z0BTA9mn0dULqHprV6tMWRuYz4alE3vIiMR4oWc9wouBgk
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: f7304f7b-691a-400d-ebb5-08dee7034c4e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|1800799024|366016|921020|56012099006|10067099003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 8Xtg+gUM/JwIOGOVmYliylN5LWl03tv/Dv2iiy565VtwSHil8ntQrXdTrEcM9xkEoB2GM27r40BSrxiiGPPS90fHkiUA0jfI356T7bq9Iy52yaWS4/LiTkW90QJ7XuNruzbbp+f3LQmwBvPcRya4AD1A7+fl7JhxwOVeOmD6QhlKY7o97BgP+6RqkKzVk7WrQ8CLn2RiS67K7hhPvf54SY453RKuUKbPzRpX0swk8QKuGaH0Sedp4OLC6VLtmKN/lO0Z/VQ/lA69IKlhL+E+M2kKON5iFH2JZ9yAEicCcT1VAphPo7wl0lsXNQFYM8EBe+9WlaOBp3ha2yXzn6E7nuOm5NpBfR+zraZytJNIVgz54qRNATkVsPpbzeBlnUOhkmAT5sTmQZLGXkGywMYR4bS0BnzawW2Kr2d4Xov4cO0DsuUpZVi7CvksO+uqnK0FlXR3tCCCgfhXd0pdrlmvnIheCA4y+JIdrpHD/scO2wikjkk6uxajCdIwj9hJcMlY0zzgjyor2SZFDWnyfEnxKr3zA0yGQnZK8Lss2Dn0x9LBpffgoOaBttYdAjuLBQf4pnbqe8fJm0cmPiBfBOevfdfX21kEsqeatB9/UKlFbfZerLaug6gDNVgQoBZdY+Z/CprUG/EW7ExbbTL/D3/q3cGauNslxlegClf2iHrvs/3pgA0FzSGuD4wXlLeOj7kQ2K92dhB9trXBdirO//B0cw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(1800799024)(366016)(921020)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TG1sc2Nmc2puSkFwSTZRUDdZVVBYK2lqR0wzWUJ6NEFNSjVPUytSTVU2WS9U?=
 =?utf-8?B?cGowYjA3UUZEOWRUaVBnZGdhZnFCTnFSZlRLQ1FaZDM3bVBJd1NZaGttbW1Z?=
 =?utf-8?B?emVOR09SdEw1SXg0aXdRcnBaZEtQaUN5UXFsUnlRTTl6V1JZMUZSQm1TeWFw?=
 =?utf-8?B?NW50Q0VqZUc1b3dxeEQrL1JWZ3VXeldGSGFoa2JySkhTaEd3S0hqK3BCNUpF?=
 =?utf-8?B?aGhMeERHdWVzOTNFN0kvRXVjTFo1WDgvSEhiOVo0dUlydEJNcy9EeWpQUkQ4?=
 =?utf-8?B?UHBpeWQxS1lmZFdHejlWV0N0Z3RmZWlSMDNWTCt4NVRnY1lJdzZZanFWNGZ6?=
 =?utf-8?B?bTloRk0yVWNkclJ1TXlUZy85SzlkT2R2VFNrcVI5RzI5OFR0bVNIR2F6azY2?=
 =?utf-8?B?TzMyUnNKZ01GU3BkTG5rYkNseWFIQ2NLTlVkWjdwc0hveXpQK2V2QlYzVzZE?=
 =?utf-8?B?dkFBaGpTQ2habURTMVlnM0o5L1FDRTB1R2haVktRTGpWSTNlY2dYSmIyRVpu?=
 =?utf-8?B?WDhoeFB5MGlTQ2VKcTI5WGJvYzRoZzhRd2VnODN4WWlZcnMzMXRvK045eC9R?=
 =?utf-8?B?Nkt6RWo4UjltOGhFVTkzWXJ0QVdFTUV2dVlWU3ZMOVA3YXREbE1LK0x6V3Ur?=
 =?utf-8?B?eHJNMVBkWDlXbGRoUm05b1JWd3laQXY5eVNmU3lDT29mTk5rRStMc2JnUVg0?=
 =?utf-8?B?K3NhWnloZmFqZTRLdG82TFRyS0p4N0tYZE9JV2pXUWVlYkp0ZEp2RUtzMmZa?=
 =?utf-8?B?WE1qWUxyL1BTU0liQlMzdlRUR1Q1V2h5KzhjK3ArdHcyV3QvM3FPeXFCTWdC?=
 =?utf-8?B?Q0dCQUFFTlJlK3VEZWJoRDJwSmpzRlpUbThtWWNraStoS0s2bVlJVTgzN1lH?=
 =?utf-8?B?a3dETStIb1p1eVRzU1JmNjVUc0g5MTFNTThqZVZjYWd4TC9CS3V6akk4OXJL?=
 =?utf-8?B?TDVCNW4rczN2R1pSTWJ2M3RjL1ZBZFRrMGRuMlBrN1FUR3B6cG9aYWFZRGdI?=
 =?utf-8?B?c2ZTclhZNTU4WGtaQUU4ZlZDOWVNSVhWVG1yaVNmcnhzQWZMcWFzazJ2TUhp?=
 =?utf-8?B?TFNDbzE3cEw0Vk02OUpvaFRndEkrM2wyWGxmYmlxS1FYMlc3d2VucHg1eFFu?=
 =?utf-8?B?REVSOG4xcHhoVVNwR2phM015a3BNQjJPYmZFU3N6NUUrNVRvNE5sYXJFbTc4?=
 =?utf-8?B?dGxRVVRyNlFoTGtpWndsYUFSaVpPV1J0ZmhvakFBVWhPTlR0cVBPOG56dnhD?=
 =?utf-8?B?VUJsMFdkdGU3R292dFJCeGdZWFFTQ0Nyc0Nkb2U2WldIODZ4Ly9TMDVSYUor?=
 =?utf-8?B?ZitlYUN1bnZmdGJBQ1pFUkw1aHpkMk01WU1NSkRZbGt1cWpjWmQra3RWVFdJ?=
 =?utf-8?B?aWNHbDJmYUNDeXNsc09DcHd1UElOVkdHb3QvOWlRVm0yMmdoN1Vka2RMQ2V2?=
 =?utf-8?B?dTJhVGtSd01Rclp3UXB0ZmgwN0ZBMkYzMXl6N2t6dDFxOUYwd3ZGRW5GTUQ4?=
 =?utf-8?B?dEFMaE91ZGI3SlA3eDRKc0hyY1VGVkRwU0FDVkxNRVFBdklLa3hyY0FubkZU?=
 =?utf-8?B?bjREb1JPQlZwS0NHakxDMDdFc0crQUowTmkxNjVCYmp1ZDQ3K2tqNEV3MTFF?=
 =?utf-8?B?N0RKQnN4ejdSWTEwQ0R3eFVSS2VVTlFESmhwb3JOV1ExOTNvT3BvbVd1dG81?=
 =?utf-8?B?ZU50clRDM0FiS1phUHR4Tm9Ba3F2eXhDekM5bUVCUlNpak5GUXdyanhoNzZt?=
 =?utf-8?B?OE9NZWlSMDZXUGZadUVsVUlnNXJHcGRHdXI5QjcwdVRKdXNsZWpWZHJxUXNo?=
 =?utf-8?B?WVpGSFJLWmg3Z1NBRDdNYnFpM0NHRHFWaEFkSUtSN3NqT0lZczBMZmo2LzB1?=
 =?utf-8?B?LzgvTnpvbUdzRGhKbVRGOEJDWHFzQVoxRDBxRUl4ejBKaHQ2RVdURjQwZHpz?=
 =?utf-8?B?cnVqOXN0R1lrQ2wvMExMQVZVRTltZmV3ekRxaFBrKzd4UmZHazc0cGxsWm1j?=
 =?utf-8?B?QnJ5aVJNam8wK0ZsTUJnTHVyNmxUZjlHYUhDNjhLSFdYeWtZNFhNSk05STJC?=
 =?utf-8?B?MDUxTHdMTDhubExXTmlIUjdtYXpqNmFsUGE1bDZxVWVJd2tBQ2hCeWN1M3o4?=
 =?utf-8?B?enQrTWhBV0NFWUNKczdBMWFBSXRDai9rTHFKS3d2S3RRamtFTnBpUVQyVVpZ?=
 =?utf-8?B?TFE1cFBwTDg3T0J2YXZLZ1phUHVxU2dUS0ZmL0FKdWRYNFAxS2orMkJGMEtQ?=
 =?utf-8?B?bk4ySmFHQ2hRNXBvNng5Nkc1M3E2R3FRRHpvN2lNMVVuTkxjWU9LZVJLSmE3?=
 =?utf-8?B?RkRnS2w4UEl0MEl6Q3JBWk0zVHpyRm81Q1doY09Oa1YvR0gybFF2Ui9IQjln?=
 =?utf-8?Q?quPoldavYPTbP3smRPRoqT2lf71ZZMD0kAG9f?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7304f7b-691a-400d-ebb5-08dee7034c4e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 08:37:28.8211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpJFxNO97kJLTVl4Fxg68yNL6C3jVnYROuo7boW48qtkW3F25k7GZVAbYREnzS1dAKYiBTvdnk6MX1bhlRdwCAig/70qlLt/3bOlgHNqamzJlgEYXudr4cd58d5Rs6ky
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150

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


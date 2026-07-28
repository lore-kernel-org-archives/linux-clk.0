Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010031.outbound.protection.outlook.com [52.101.84.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAEB3B71D8;
	Tue, 28 Jul 2026 06:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785219047; cv=fail; b=b4z7UOWWUZMsDXcn3QoWW/OzMm9WVSPcVGbXq7JhMOLMQtdwGssjSOdD2Z3E3/jpHO3TVSrp9BxLKkBIR1dFt/3XaXhS/aiARGwh6pvaPuWC3fGI00oGZ8MyJ+NY3Zqz7Ox5q10oZ2+UCFsXaoourrxsKYzZ1AD+vA2lNhaos/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785219047; c=relaxed/simple;
	bh=/iywNgA4UsGBlh2yC5OE9+001dOSxQFvySuOxm0Rt5I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VaPnU9o5svlt8+4ELSHIT312arkRL1nrS/hEkEEDl71e1HrppI2tUUZzbeVPVsn73EhnEV5Ymtz5xWpwivMvzICBZmVOxR/x00X3W158r9/Kcw3mm37Szalin6k+QeI0JdCByvEXDUwgGdAz5Bvcdux2aHSovbSFfRPctAF3DbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=s/mGWpTB; arc=fail smtp.client-ip=52.101.84.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="s/mGWpTB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zly21a/LLbtCKNDSmNTdxAn5SkzO4EOXsYnOKHtfZ1NjROCfHyTETZFb8jarvTeSr6xz7TYWopVK2j05y2hQh3lRSE/3zh3f5+oJZOh4JnJDXkE+QCzhfbdzxIsgGayS2T1y5jxjGHe4h0yRlU3GVaKTV6PXAv5oiGevBDwxsbgz+pdCuChIPiLdIz5hkMTNmERdCZM9ScIbH9KUbETQk9ptnJkHksqsIiDV38gE+WkZXlKcVOInuQtZPscn+/kJakC2oiEwN/UQFBZ/4QJNezZ14s2zIXN3/EIQpXizi6FGqx06w7DbnMooCIZZ1uXZ0cYFEebFBOxQVUBtdeI/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIAGdAIIez59cTVY2nXI3mziANVjtlFelMWvcB6zB68=;
 b=jUXF5nE/rdzm/mgNB1u2OK8bE3CqrGOiXhgvED4Y/OJ0V0UXWt26+30rxbYT2SqoWWogDdRvneKmapdYshfEPRnEvZyAuZCtUmDycY9QB5PuIpEIrD8hLG5q6xW8pLnX05q9BnPaGz+hOqMK9WW2/C4mNoEKsP12QzIejwDhboVrWA+858vYOgm+oRpbf8/mobCxeos2/OBWsqdYKB5juShTOqAcPoYIlQBHX2FnIPBbB37WcvhXJTSMYWAQbj+xGud2wR880reQwIqfEnFfEfJ6xY5kFRTlgHl6XcN5Ivl5335o1jErQK/bunLBUrS6aorV54+k77kGS4f/cajVAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIAGdAIIez59cTVY2nXI3mziANVjtlFelMWvcB6zB68=;
 b=s/mGWpTBbnVPATNc8sMP0MjuOw3R1sWqEygAWPxF4SqeuR3pqh7juqkLez0zW4Ac2nLTQTwQhh2G3VoLVf559nsYbIPQTgBaEv5QjqkjEqRGp1dfm2jumhsrhImbGvdMSgiSi7gxFswNy53R2WeEmHB4cRcSw74FcqPkvozztXU+wtyZhZQi4CL6ZUwnYALmsvwDErnAevzSmQZil+n8jC6hcD/v41sVi1pB8OR9bs4KyguRnCpSf0hAHeY8pYSkejZhWLR9DNPZXX2LYmpbIydlsfl0ZNmcGAYk6jKChWIMFxysu1Y6/arGQMQHtB2ruDm6IcFhmPFby1Ph8ClafA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PA1PR04MB10400.eurprd04.prod.outlook.com (2603:10a6:102:44b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:10:43 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:10:43 +0000
From: guoniu.zhou@oss.nxp.com
Date: Tue, 28 Jul 2026 14:14:15 +0800
Subject: [PATCH v16 2/3] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-csi_formatter-v16-2-1065ba47530a@oss.nxp.com>
References: <20260728-csi_formatter-v16-0-1065ba47530a@oss.nxp.com>
In-Reply-To: <20260728-csi_formatter-v16-0-1065ba47530a@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785219254; l=3610;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=aRL4uVticjLo6UEH4w/3+H0q3vF5opX2p1kyrpVmyMM=;
 b=D9WYF86JNzsaCvJFTveYIB/1i/aHrAPFi5ZAD5cm3xAuCP3FdI9nrt8oKhu4kyZuF72PrAxtf
 aMJ6ZXf2RJHDqng2aW1QGkzdpwtE/nKwgxP0ioK2Tfa1sPMqonpQGPt
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PA1PR04MB10400:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ebff4f9-0b98-4aaf-dcd6-08deec6ef4bd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|7416014|921020|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 2ao3u3jcxVQoaej8Z1+1YFuLMiMCjU5g7Pl2TuM6sXwz43W1Rmn0sK9CUIV/9WqmiAXcZP53Sg0A9qspqKho9DKs2VEW0VOAmnrfYC6mfH2OfGQVCh9U3CwOCMUPlsiX+xB7OT8Jk59wy82b9DZ1d2ElponVv7FIYD/gJzqPaTJi811zD1DphprbhXSh7mOuoE/IvNzKPou7Ojg2bDtQkWDenBFyYNUyG9E73oXokra7cLw+efJaUJ+lWHURDOQKRRaTcH8cA//aieOLB4ju2SSqF2iLehL/H3b//EH6tWFvmgW27nBjNOCoafHXkQOox4TGwnwUENSF9WIPdDX3M6VOH+kNoIT5HXmNQyHKvvZwyxXrZdK2wTXu/6h1THkenzglhvMc3aAkaZuO89knRyG2pUgCL67BzIv8afsP2WT90qaZ7/BqEjMsGCWcjgbbqoNuW2qwz1zPQkrzS2go+SHb6r6ai16p7dBFvOrTwMzf/ziF3fdthzxxu8cmsJeWe639CVV4qUgY1pq6+gJs1ggV0Xh5rRBE+WGXdq+zlKKkuHsgqyZkCeyV/DXrbM71G/2D47mxn/NubOVpHNIKcMNgIWSMP8OaAeLpWbExsKes+YYHsq0Y1gjDuSCsxNZMss1xBtapCwp93MZmRA/bwnIsorNbxsN0/G4Wv6CTCzqgz9ShroZW04b4iRG/BXogtOAOaO6sR2RmvQuy0ZGueQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(7416014)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Zk51V0JyOFNaeTZOa0hSc0VmQzhWc3NVRTF1T0xHbTB5clRETEgxK00vUXZJ?=
 =?utf-8?B?MFpyWEJCUDZ4MGJYU0hMcFRPZnprYzllQVc5MzFGQjdROE01aUZDYnlCM1Rh?=
 =?utf-8?B?bC9BRW5lcnc4UXdpUnVkWHd6TndBQzA2bkNCd2xFSFZjY3FPajJkVHNHbkJv?=
 =?utf-8?B?Qk5pQlFaQVdrUy9oR3p3Y0svL0RhWnk3NkhaUnVlMzFwWUR4VVJzQi9vd25k?=
 =?utf-8?B?MkJVNlgzQThTQURVVk5TRW5tdloySTE3SDdkYnVuZUJQVmZzaXlwK1p0N24x?=
 =?utf-8?B?b1FGLzlicUl4b0I5ZDQ4RlgxczM3MXNFVWRSSUs4VmI3a2ZDZ2x4OHF2T3BR?=
 =?utf-8?B?aW03WmhWK1N6aHk5dnVSK0lLcnovQXdKU0ZBUnQySEFJT0ZTeGJCVVhrb2N5?=
 =?utf-8?B?RmQwUDlzUTdHc2UrWG82VTROaGxrUUZDK2g4c0ZNeHVZMXdUbmRickxRU0g4?=
 =?utf-8?B?Q1dpRDdRbmJnSnZTR013c0VUUkszak1XS1NyeTZOTWo5RjlGV256WTBPSWZ5?=
 =?utf-8?B?ek8rWDVlYWR3VzY2VHBoaG9XbHhZdnUrMXJGdDFHQitWUmwwTDlpN1dOeFY3?=
 =?utf-8?B?RzVETDVOeEVJQUV1cVd4UW5NbVhIWFhSYXNCM1JLa0gxUXVCODVvaU0yWlUz?=
 =?utf-8?B?aVVBRlh5UXREd1pLVmZFU2haRWRZZVoyTjNGVjFlMWFnbDFtdUhRVXlLTHZO?=
 =?utf-8?B?VWpjQVdVNkQveENrMlI1TnU4cDcyb01zNlBITE9wNGI0RGtseDFWaUF5WnpJ?=
 =?utf-8?B?RVFkaDlDNXpUZ0p0cFM5dnhSNnllTmpYeW9rMHJYeGVDQUt4WDZwdklhNG1N?=
 =?utf-8?B?MC9PVFBpcGZORW5CenNnYk4vUHNhUG8rcXUvOHM3L3JvUEhEVHBrb2xnbmxw?=
 =?utf-8?B?NkFnR2YyNDZHbUVCTGF6SS9CcTZpZ0N0NEE4ZHRTMDBzeVhuWGZpbzNKbXZk?=
 =?utf-8?B?dHBKQjRpSnhJekVpa2J4SW1pN2JGR1dhaEJoS2orYVRYRHAvT2RnU24ramtB?=
 =?utf-8?B?OGhCVGljTGowUFdjOTRWbm1pZ2NleksvT0RkbUhtS3BjY1JVN0xuNjZkZXdI?=
 =?utf-8?B?Wm10czB2cFU2Y1RjbG04U0lMaTlyck1oVXM4eUxYdVFpa3NOdStQZ3pjMmNZ?=
 =?utf-8?B?dGFrN3JjWlVVWGpIQXJKdUZNTjArMlIrMjBrakd3UHlVMWcrTUV3alJCRXJY?=
 =?utf-8?B?bDc1MXNlT09JZzYwWWRZSHRkaUJLeUxWNm9JcDh6Z2ptNENxQTZ3STdURHF3?=
 =?utf-8?B?Q0NtUmxzWVFNSkl6dHlaMXNqcmZJU1BUTUFwcTJuZjV1aUp0MWQvd2hva2JX?=
 =?utf-8?B?bHl1dFZ1WitwZ2xMU3htdG1leHVSS1QyMnhjQU9HNzFXVkw4NXNxdmU4amZS?=
 =?utf-8?B?KzQreEYva1ZmWUFRUnpVSlV3RnFrNFZXOS9OSEZ0dVpiWFp4eUl6Q2x3T28w?=
 =?utf-8?B?UHdlYm9RaFFvOHhZVnd0UWdzOERyb0lHK1ljYjBoOGdvenlDMFh4UjR2d1FU?=
 =?utf-8?B?M3h4bkpBQ1hsK1g4SStpdERUSThkTit1UDF0aS9ZcWFnOGZvSCtiWEh4bTFP?=
 =?utf-8?B?cmJ1UjZwOWNOdHlneHF2bmVUaERQbWhvcDM4eG9HcGM1K2gxZHJ5M3hsZDFr?=
 =?utf-8?B?amc2blAwSlVmaVhFeHZreU9NT2dHaW1JaVpWbXZ5MGxPcURzTFMySlY1VWlP?=
 =?utf-8?B?dm1zeVo5S2YwYjZoSGoyaTZyQTE2Y1A3ditrcDlOOEd1WXB0QU1LT2hQb1Js?=
 =?utf-8?B?R1ZZbDlHNzM4WmVId2JDSmMxWG5YM2o0QzFwQ1kzM1pzWFlPM0cyU1E3aHk1?=
 =?utf-8?B?RkIyRjFqS0ZJaUlwVWxaeE5lVGFSYzdiOWlKMDlFZDQwWFBiRk9zV1BHbDMv?=
 =?utf-8?B?Q24xMDgreGlETkEwdFpwT0tydHo1UEZtNzJzbnBUODVzR0xITmtRWHVEcWdl?=
 =?utf-8?B?dUpMUXIzN2NNVmxtOXVPR0pDOWhDekRrWHhvREViUlhXa0VwZUppREVlWlZk?=
 =?utf-8?B?MFZMWHNWRTZxSDJLeXlOcklkZWp1aHhEekd6Z1BRZ010NmdWcEdOSGtVT3Iy?=
 =?utf-8?B?TzFHNVdRSnJLdkhJK00zM0tGWURhUWs3RDczaHpXb3VyMFdSQ1huTElvZVU0?=
 =?utf-8?B?M3Q0NFZ5UkR5YnF4REc3RnNYbHhDQjBtS3BBSVhMQkV4WmlNTjRkVmEybGxR?=
 =?utf-8?B?bXBRVWxrWGdmNUFLRTJqT2JySVBoWVRyMW04UWtsWUZkVkVkMC9GUFJqbVpY?=
 =?utf-8?B?S21xNEUySE96WXIzMUVNL2JPWHY4cnIyODFSbEZyVnFPTkVxOWdjcGlDMDNK?=
 =?utf-8?B?NUt2NVZMS25OWVlmSGVOZTI4ZWhBSndOSkh6bFRWRll0VDJnd3duTTBPdFIr?=
 =?utf-8?Q?zHXs9ap/mTuqeGP9i0YCTVLd37fBq3in4ZxE1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebff4f9-0b98-4aaf-dcd6-08deec6ef4bd
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:10:43.1664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2t4WgjgBzDjkWF4TImYqLQIvPzPzR6A+f4iBgOBCnVPrMFRjElha8lzMuI/G3+t0nlyVwVV12zt74t+mVYZZf0Bp1OCPWvWsp28Z2EWo5LDQgE4znp2RlQoi95rdhd3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10400

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


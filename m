Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226833793B6;
	Fri, 12 Jun 2026 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781253807; cv=fail; b=rNLzPemTJDn1/i06W/Qk1ML30bNzUAhQSZtQAmslZghIhXPNG8GfUljzreVQw1yvfKtyGS+ZZz4iXarCe0FKm8oLWHoREs2AvrrgaMYlgN4gjBXGKsDPpu/e7Hi4xAi7LwNly4McicYRX2QEGlSbtF7zXDg/ZfnURcKqy1io/LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781253807; c=relaxed/simple;
	bh=NjwtBJwFgDMZ5Uzb12c2RnzCHEaks2V5F7sGbzpAks0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZucpAjfjAP8kbkCr4OPgMhD4DSz2D0FS7GRpjTQih/+mNDN5kVpi1ONpUjJKzqK84Axtit/T1PC4JkPtMa+vVORPLG1+aaaXkCf5YiUd146xWOYz5rW+hTwdZIBIf2bqqxX9qiqJ+rNoWeIxQlvqBwgqzS5P+tg1ZyZ7aASYkdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dyAc9wGy; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dyAc9wGy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcR5lIx4GjHXgAjxj2qolCjVk6iF6dJt8aF9896QwUROSKybAPQ52YFZ19UZZupKJvbcMqAHTsNm9Odd0G5ErY6nez4LBfU/APUj/vUehRBl2nht+PeGL0IqitolkG6jGnSp/f2ACSbcXeqJZ42hyiXUKyAZXsiCh1x07VF/hamPlAJ96p+m1qkrv+ATBEgdDOchmBIYwYpE+XFB1x4CgK+IsuMKwoU8vda+HPpg1EX54D0RsMmXJfC2pWcYF9fGVQ377wcDpBhfcOcx7Kx9TPR2mq4o7/LDqwrpUv+NOKJwrbfxZxCYWBz4Ngjdbntg5OkZTCIe+COkyVZ+TZPEQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GvpOqNTXmhcBMJKr7mll4R6caW94N7lWlWX9pq3mNA=;
 b=NKswTD/0ZoF2Fw1rVvRXv26CiGHiIigFgQM1FWnhl8kZ707zM6COinqdWQ7VQuBu76SS8Pl/DJD3aC7wv/di9rFP7NCgcD0XsmNRNg/jRvdKggOjovW/MtKrldHYq8k7ihI1xVjgqKBDeXRNOlvcTx0mX9Z/7PF6wZoU8prQOuI642F6gtKMdpoi3P2gf4kyVuI0Q02CvSub9RzPiPAyAQwFLz9TmQ+hv93cj0CA6rYpOaxbRog+P7RMXZFwXtO8W7pNlZyst8PyMXyrE7MeJP/4EvmBNTSYec3ThIOMRdn/YjcDsGTsJs1r0dSCC46ebTiNpSdhRrkWE+HV2Y9GqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GvpOqNTXmhcBMJKr7mll4R6caW94N7lWlWX9pq3mNA=;
 b=dyAc9wGyNlZUWc26cyypRCOn21y8cwV4upfsNyHgStkYIDWs7k9zP9ImUugI5Lnv4Btk1J/mAXSOB/3Xkzr6GaRe0A4DKHces72k44fTzInlhzOTxm8/tFSo4UrykCBbDol1rgCAif9aP2V7/SJ4TQ/v5vvZwF94InWu/4U3Iy1SGqPGSVwW38yQfQNoaN+4tluW35/Qp4PblVpZRMahQfcbwe7IL3R5Om9U6HqWAhMhogB90/h19O1iRx7gmdGtKg21ppmOABYY2tSQmhRd7S4ELDZt0GgMGCEm3J+b1ELWDwEFGQP2ltk15nZ6kn0+YCmispG2A0C6GeELYr/c0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB12293.eurprd04.prod.outlook.com (2603:10a6:150:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 08:43:21 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 08:43:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Jun 2026 16:46:23 +0800
Subject: [PATCH v10 1/6] dt-bindings: clock: Add spread spectrum definition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-clk-v10-v10-1-eb92484eda38@nxp.com>
References: <20260612-clk-v10-v10-0-eb92484eda38@nxp.com>
In-Reply-To: <20260612-clk-v10-v10-0-eb92484eda38@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0134.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB12293:EE_
X-MS-Office365-Filtering-Correlation-Id: f49312c3-79b8-4d77-1c18-08dec85ea7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|23010399003|1800799024|376014|3023799007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	323/cTBqfptrWPC4yMcK8R0T+07bHOrpMAUXS7oBvRLDKOR18Tfh5tOGx2iv/9qS+CP5k2xXF/3enuYsy4lkP6Q5zcO0Gn/Bp9uVFYmY818Y90DC75oRGSbuCirEKr9vnHPd8gPnRS9+TEx43KTeCKRRQFYXQ4oPJ4es1nApSydMb2ft7j0ZpXIITrcz/75VfkvzntC5XgPPFKtjyDjk5XzDsl+6d2C5/NjK1YvingoPicaTqoNxtk4ANK3f3sEkCFgXAOmE5up23XwMFmK5ObquZtTIJpb9qEk4I+x7q5RR7TElTlTIMZZ6cGqUMtO6NZntZqUykHjxm3kXrqbwQ+KXuMLSCdQM9XtlaBvnYrMpCB7EPOcr085+RdaqwBAxkHWAAy+P/cqXoQ+OEYdeddK+svLivO8ET/agLGFomcz6fJ77zj9n/HpdJZIO1ew1gzW8HZ66T7hY2NiuZyrLDenbTDx7P2kL53iW2ArK6ew3n3DDy9RY4IWIKSuU1VjUZWBrJJ3X/jBGYHESDey2r9J1Bp96Y74em0OupqQpHbh3QNN1hjU4YRUylf1qqF8Zozpy97m24qkb6NhuybWjJaiyVrvthHzWgR9CR/7RaoUzOrUc09JubKdgdk752UpXECsUsWC3Q+NQlWvCyZF025K+DfL8nQFVqALxle4wXK7/R7aLZbdXftI1wl+l1CFv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(23010399003)(1800799024)(376014)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUlmUnRnNEtuVkRvZFo3RWR4U0syQzV6THUrZ3F0VnhpeE1YajIvcGVvbnlG?=
 =?utf-8?B?aXltcDNrWHJWWWw1U0hsMUY1OUo5Y0FBeTRmK3NhVFJsRHV3STIxTXpNUlZn?=
 =?utf-8?B?MnJIM0tKVlRad09WcWtmek1uRWM2S25JSHRYTk92WW1wM3VNMmVUajlYRFdx?=
 =?utf-8?B?MUhXTVFTSFJDb2liU0hCc2ZUbkhVTlEvbEk4QTZZemZMWEx4WS9LSmVuRndi?=
 =?utf-8?B?SlJrZUtVOHNFeVNuYTZKTy9LdGdLdWVDbjl3U0MzUHhSZU94akxQdHhHYy9a?=
 =?utf-8?B?NW5TU0RpOFFibmhCVHN3Z1k3S0dkdGxhN054R09hQ3VOcXVscCs5a2piL2Ni?=
 =?utf-8?B?cEtxSnZQSXdCMEpmK2JWVTlhdVFhUXdyeWpCSEdzS0hOT2hLWk9xZlR6bWVv?=
 =?utf-8?B?elJDOFlCZExaNkdFNloxWjQ4RFVsYXZnbGxVK0FWRmpLZzF4cXBUWkQ4dGJx?=
 =?utf-8?B?VWNOaXZHSllsWWNmVHYxUGVaNndnVm5XWS9OZ0hnNE1ORnZXSUZEZ01HcTNO?=
 =?utf-8?B?QlBMaWhxeXowbm1Bay93QVo1aVdvMEM2MWdIK1lDWUNORUFnY3UxeW1Ud1o2?=
 =?utf-8?B?RHNubU1PYzVyRFc2ejRoanViajE0V0dhZHVCaVhUc0pOTjljdEsycEsyTm9I?=
 =?utf-8?B?MzBPUldzYUo5UDV6UGQ1cWpMSlZveEloY0hMdVFaQ054N0JsTklObUFhaWZT?=
 =?utf-8?B?R3lCTGFjcVZ2MzVwa3V6NHI3VFlmdEUrakxWclRRZ2g1SjNCSnQyaCswb2JI?=
 =?utf-8?B?NEZBMnNKanROb0NrQTZnQUFEalErakR5M1U1SXEvS3lKVWh2cEk3d0x5dThy?=
 =?utf-8?B?a0YvU3hlS0c0VHM2WXU0UXZ5YmNHQ0dQT3RVNXVsUUVCei8yck1Tc3kzeWtF?=
 =?utf-8?B?UjdRSEx4NHNLMVpCdWVFMWVwM0tOTXhDTEQrK3JkMjQxb1dQeUxFeXVaSXpO?=
 =?utf-8?B?U1p2Vy9OMVlibUZGREVaTldYVlJPbUJGZFhvdXdwRi9ieXRER1FseElKSUYw?=
 =?utf-8?B?NWN5RWVXVVJadDY5cGV0ZFZxTk1aT082NmJQakpmdWZ5S1gzc1ZQVnAxbHNj?=
 =?utf-8?B?dDd5MVA3L1A1Zlpmc2pQTjE3cnFZc2pDRDlFOFJTR0FoT0dHc1ZackJwQXpj?=
 =?utf-8?B?ZTVSSm1tcWROTXJwWkJUVllwUlJhKzBJYk1HK3l3WTFSWlN0OHZJd3l1QjVu?=
 =?utf-8?B?Yk5Pc2NNYlMxMDU3Sy9IZzZNZzhxSWxMdUx6Z3dEeGQ2UE51a3pxYnNrcWNw?=
 =?utf-8?B?VEszaTc1NEQzNkhnZEtUUCtPajRJbk9hdkNlYnh0ZWV2VGNDQXVxbkNaK2NB?=
 =?utf-8?B?TmJlTkxTNmVldzBYOXJGeWhwNVFtemYxMTFIaC9HaS9Gb2ZtdmlERmtkUXh6?=
 =?utf-8?B?akdnV2Y0UjVkQWRVczNpZ1hLSWQ0VElvZFlFVjFwN3FOZFZWbCtrVVZENEI3?=
 =?utf-8?B?T0MxN0crVVdpN2o1V0xCc2t1N25GU2ZtMy9GQldFMnNHMm1GWnYwdzFZNEFo?=
 =?utf-8?B?Y1RQdEFoQy92dm84OGp0REJWcFZVNU1pRVVxKzBiRVlOV2lwdndCTEw1ekYz?=
 =?utf-8?B?OWs5ZjdCUGtxdU8zS0F5REZzY1pZYnhnTlhnU2xLMmlSNkpIeTlIbytlUHQx?=
 =?utf-8?B?N0ZrMUs0dEdESElUN1M4NEh1Z3lzeTdVUUdXRXdMT0VST0ttZmk1TE0ySmhr?=
 =?utf-8?B?VHJxVXdqL3NkaWxtcHowTUVzeW9RRTR3V2pnT3BTK0xxL0Nzb1RDNDFiVVFY?=
 =?utf-8?B?eHBYaEJhdlkzWFVpdmZ5cEtKemdCSnpPMTRKS2taMmExNkJiYnNScWoxZklv?=
 =?utf-8?B?QVRBWlRXejZmd2lOcUo4L0NEQ05TalNNQmIxVWRwQnR6UWpYazdnZ25CMTJu?=
 =?utf-8?B?d2kxblBrSmR0TnZKbHJRN3FrQUNGZ0F6U0NMV0wvZXFNYzlHb0ZWVUx3QnVB?=
 =?utf-8?B?UFVkcDVSK2VrdlZhSVVMQis0VEhMYUdPMTBnZG1oNSt2WkVrQmlpOFl0andE?=
 =?utf-8?B?cWsxUjg1QVAzTHMydEZ6NDdqYlJDMU9KNDVhZWdOSi9vQkVQWG1XQ3JuRnZk?=
 =?utf-8?B?RjU3VmpiajVTSW1NdUtvQWoxYldIaHIyMUQ1aWtYTXJYd01KeVNFUDNMQytE?=
 =?utf-8?B?WDN6WnptKzUvQ0swMDM1by9xancwSXJxdmxKTFVUaDFNbHJIZ2JCY0xBc1JG?=
 =?utf-8?B?MlRQTGVMWEZGUlJIbityQ1FHNnlWR2tub3FJdTlhK1lwS1k3V0VmMWw3MEVG?=
 =?utf-8?B?MVpsTHcveWFKbWdPTU5Yczd1TGE5UjNXaEE3R3o5cVVMa3hVbzcrNEhsSW84?=
 =?utf-8?B?dFhEMUc2Q0ZCWjlFTVpGOHR0V0dXcFNCMDJhbnl1RXY1MC9sYzk3bTFxVjhk?=
 =?utf-8?Q?+rd9Bb4u6yBRTAXb2b5q0rxIYDl3NAWmP8AQK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49312c3-79b8-4d77-1c18-08dec85ea7b4
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 08:43:20.0409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiW9PSS1o34W8hv9HGDmblKlJzvEUCZjBcyyQqTpsf8zP/Ul7FA2CHBtaVu5xVwPDAnKgmWkgkwCOLN6fRL8TooN6AibLeeJpQoeW/3UW8jGIr6fw13G4nR5kCwTvEjw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12293

From: Peng Fan <peng.fan@nxp.com>

Per dt-schema, the modulation methods are: down-spread(3), up-spread(2),
center-spread(1), no-spread(0). So define them in dt-bindings to avoid
write the magic number in device tree.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/dt-bindings/clock/clock.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/dt-bindings/clock/clock.h b/include/dt-bindings/clock/clock.h
new file mode 100644
index 0000000000000..155e2653a120b
--- /dev/null
+++ b/include/dt-bindings/clock/clock.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_H
+#define __DT_BINDINGS_CLOCK_H
+
+#define CLK_SSC_NO_SPREAD	0
+#define CLK_SSC_CENTER_SPREAD	1
+#define CLK_SSC_UP_SPREAD	2
+#define CLK_SSC_DOWN_SPREAD	3
+
+#endif	/* __DT_BINDINGS_CLOCK_H */

-- 
2.34.1


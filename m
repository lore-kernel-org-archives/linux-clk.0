Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA553E714D;
	Mon,  2 Mar 2026 14:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772463600; cv=fail; b=AsaIxvgvFWkdj+lKJGJZu0VABtsEqx4hCYoTXDl4+wEA0zK+H0EWtHevD5xClPdWmJJ8ORjl21eUte6ABrIgjTlEKaikuU+mX7kko6/FThuZTuZD5nRr61nx7N7Iel+PsxoJvBPf2euUaNZqCS/4+a29Do7dQqYgOf30EDh5zG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772463600; c=relaxed/simple;
	bh=ThP3UWOqp8sEbKXlqk6JjoFIogRFA8SOwcF47bwy3S0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nl8Nxjapsx6V2tRNlIKwhQOwceFVUVIDjuT+vRSfzQx4lOALHCelhzd3s7499FHkfKOmYFFF+F/BCBffOjn9y+AdjYz0W1ThnN4J4B2JSn6fGJE0fYjBy4CAs5sbTdJCCshtVtm3Tuit/ZM3KvmIAn2dWYvZByfJDDvDJtfxoPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e7TyOzd2; arc=fail smtp.client-ip=52.101.72.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e7TyOzd2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPhLUHxS4gl2fnvTtSsLJUBxXs4cJkRxpF7UUSMxb7PGgM05IAiuhuF43IRKEXj+PHGXUH596hYwomyWDLHzevdbheX4uAJOkklW9uTu5pxdMfmyBUbnbDuGptUT7V4ykEtCQdq17uTJpaBZI5XgyAIy4VIdf7b98F/VJIgqjmWLmev5bAJVok6jj9c9bQAjGV/hPkxP88FxsMtrC3xqpOk/BRpRzqL3lE4JXfavNwplBB4vyC9Ds8Tt40Y1cEjNOCe+aBhrdvB1GLiPe7a7g+egOL2kQ2sc1J00uxdhHQ34xQPgYdklVbYjldfO5uaBqZEKyVy3WwDzR3uCeVin1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOBHJX+q02TVDHNuAO8LtVZLQsK6tQm89clsq+BIRMU=;
 b=RlJPMV4mXfYpJntgVkRWha4YIxsMr9LyEcbVSdgNv+FdSKgnqAN6Vh7oMOD+gH85Tm5MQYNv+m2DWqO1w24E0uvDLIQl2JktPRkVbeDWrs2MCtIQULXY6vB07ge+hc1LO8aTA42HzTiWDx69dJtwcPsnvxImyauzhBi7r3UkvgBuNubUS0uc8PqBdEzWsgTbB/xEreKnr8L3rcCA+DCTwRgG2KcXCd4PlBG96Kkxwldsfnwcsi4Z0Z8hymi+nhjpEg3pHpLOcMKjgKM1PBjcR9+VwejkGx5MHDXoboR1iBsPTa4eDLNQnjWDThPiMS5quF2nIU0iCxHn5txHW3rQXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOBHJX+q02TVDHNuAO8LtVZLQsK6tQm89clsq+BIRMU=;
 b=e7TyOzd2BjoG5i9NaVZ1Sot5ov0pNF1tf2l3oycUt+ueWZXHYOPXJXOSzLrEE2QFlv8MXkoESuu8ruo7SNaYcryhsUtjkXq+fLicBCoJURa97w/rtRkuTtEemyukkPxZpetWt3FLmh3NqR/5+ntWELIM8eXEDoNE7dpnY80+pf1oIKEk2QAEG7wNfl7N9e6wTAqSNRkMCNR82bOpdgEMCbv8ublx1dXUeXfdjCFmXKsoWsYJn+4m2OrHjRyFKDWKIahuX5V3otJRw+YBx6E5xAMElV5O+YdYdgSyI7T5apZ6KFvFL5mRMOJQaXsmz3p2fqgwROOb0EXzITALoHEYvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB12255.eurprd04.prod.outlook.com (2603:10a6:800:304::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 14:59:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 14:59:52 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 02 Mar 2026 23:01:15 +0800
Subject: [PATCH v8 1/6] dt-bindings: clock: Add spread spectrum definition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-clk-ssc-v7-1-v8-1-2356443a7e4c@nxp.com>
References: <20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com>
In-Reply-To: <20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB12255:EE_
X-MS-Office365-Filtering-Correlation-Id: bde8b669-77ee-4932-68bb-08de786c5bc3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	MO2GmDM3QokLE8pH+ZBHqU5uJviGg53agBtoh7K6puazcn/SQ5D0qqEEsp4Qs1+T1dD3zJBjyn7X/x9wDTAIKKRXSDjCtpXa73c+ZZBxohS/fRgW9xn0Pl55VQP6XSRc5+J7S6mlId/qK7FfDaoL64LcY6SqPecPhUUL+7ug5XXtBp3YD+4VqFlvgx+7OUWISYveO3jCmQiXRXyehI0eOYzkGmNcvSqAtg7IT8UzGAx0j6smstIJv6MlJNJIFPtu4VCWURSaM6UYo5uhS1+AKoQGlTAqSz5q2WiBSWQhL/P5IiJXiQoezklMW3r3s5CwIIHc2YMELjSBLqCSYX4pLOD3UInrgCZuqyj/ckwflc/BjCJ9hFRshfzZPly5dmdbzoG4Y3UWUekmLC2yd9d6u4E/3MIbb2907ZWl/2/Kyg/06c6Q1ugjvQnha/9Ur0QxUMxSMSMnEv5CzfhaE4JZSm5/4USeqXazi05uH8fI1Q0BG1/cy4OhXKGx9UNfOVOvmgU4e21yjQI6VhojBjAyRPF/TuGvoZ8lJuMxBwG+72r2uK7DyOzyxCUPwsCOd0cPPD1lJ2R0LdOzHl3sMuVH7nWAFK6KRkIXEQxHCWxVWJpRwXmej9xI2p/xeJY7x8zgz0zfu7a+1AQPdOwZoz3I9JNw8s3iXJ18tpfLobgV1t8c3DNr2CQG1NYubEDBKAVOwFO2TPltWVC0nLWtQMg15BE8fG/QVwpLySotd6fkikb2feA/JKzH3pYOcLrAfnjIRSeNmGeXOoY2fDc1I3qVyYCzzo9MUYC3lpJQ83Dozvc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFgvQlhRSGlRMWNQcEJ1MTM5UUx0SFVNWEkyUEo1KzNTUElxMlNVY1MvUkRX?=
 =?utf-8?B?OTVJRDJiUi9XMkVSWVdlUXVYa0xFK0FsMFhsK2hDMjIrSmR2M0VpNXpRcmZM?=
 =?utf-8?B?dmRiN2ZEVFFvVy9xSEFIMStKL0VOQ1lFREhtemI0VitUaHk1UmJ4ZFhLR0do?=
 =?utf-8?B?NmxXeUxoemNvMnVKa0MzNi81eGYrTDJuVzJ3ZTJ5WFNOUmp2N2hvRmczUmV5?=
 =?utf-8?B?MC9tNk55eVFCZ2RtL3U1d04rclZBU1FlRDlaUFVGMzY5M1BPUTZOOUhJRnVQ?=
 =?utf-8?B?UnFoMlZkMnc1MVpGbGRRWEUzc0hhdTdBcFV4aFAybndvRGFkMm12UTMzZ2k0?=
 =?utf-8?B?SFBUWFEya0wybmZnTUVhUGI1Q1o2T2VtaDJIMzJCVUVWZkNsSlgrb3RkL0xi?=
 =?utf-8?B?MVMvOFB0bUYrSjdHU1djT0IxQllwcVYxbGU0bHFWV29iOFpqUW9Femc0SE55?=
 =?utf-8?B?VkxJSVVOUmp1czRXMDRRWW1tMXVpNkxHN01ZUVpYM3JtNGdvY3JCZksrdlZ2?=
 =?utf-8?B?SDdiZDQ1eDl1dVNsV1FBaEovNTlGZHM2Nkd2R2tPaHNBa2NMWUFsV0ppQW9v?=
 =?utf-8?B?TTNqYS9yT0NxbzhDREdSMmQzNHVnQ2QzdzV3RmhCa1JlZy91dk5kZVZqNXZL?=
 =?utf-8?B?c2dBcTk5ZGFrMlk3SU1YYlVSWU9qc200d2dyRXZ6UEswbmdaaHpneGlLMTdN?=
 =?utf-8?B?NkpqL2xveXFTZ3Iva280MUhXTzBjRnFWRm9sS1ZNb3BWOW1jTi8xU3FoZ3FO?=
 =?utf-8?B?Q3BSdzNQNlVuRkhMMjUxS3BzeVFwY3JBVXMvTUE2YzJHUFdUOENSaEU3R0JU?=
 =?utf-8?B?Y2NlSkhuMXBuSi8rRW1XQzlHdWFWV0ZMZTNwVENsVjYxZmtha1hDRGc5dWRH?=
 =?utf-8?B?Snl5ZitobE5zTzNqWUQwaDYrTVpJVkJvazhsTDBDWE9uSm1YUGFaNkswQ3d2?=
 =?utf-8?B?THQ4blhpU240QitWaFVhSDhvVzlDalBWOVhjL0crM0Z6ck1hdEZ3dnA0aHg0?=
 =?utf-8?B?clJTS0R0eTA3RllPZkliWDB4bWt2QkVKRHhTSDZlSEpmT2htaWsrYlBNTXVD?=
 =?utf-8?B?cGJ3cGhtVVhOb1liNzV3WDU4VUk2VUdpQzcwWk04ZUl0cXFlZys1Y2tTbCto?=
 =?utf-8?B?enI3UkxKbk9DREc4NkdDNHcvb2lPUm5RZjdKNHpaRWlJODRVTVE1bjhPSUhK?=
 =?utf-8?B?aW5XYkROc1oyc05kU0dOdGxqZHFwWEZJeURnTmpraE1KUU1zUkpNR1FkZW9R?=
 =?utf-8?B?ZTl5ZTZZUUhYenFhN3ZMb1FyL3ZTQTlaUjJHVHFaYTR6K3NGd2hDZ3NrQk1w?=
 =?utf-8?B?WlRNWTBLK1dYUDF2a29xQ3hGbis1ZzAyVlZwOHNOUlhCUUJlZ2sramx5cEVn?=
 =?utf-8?B?c1RlckhubkxUM1dqb2dTRXloVVBCZC9CK2pzT0UzTTJZMkZrT2l4bElRRHlG?=
 =?utf-8?B?eVlRN2s1UzNrVXpwOUVPblA0M0dFMW5WdlkzRkY2c0prdmVhR3RWYWRLenRz?=
 =?utf-8?B?RWhyTE5nTzE5dnZuUlgxZ0pWUElNR0w0WVBiaFZPc1ZHVGthZWl0S25nRzN4?=
 =?utf-8?B?VElvWGVGVFc5bWprNyt2MS9SR2pvM0Nud2NZalBESUZycVZ4enY4dkY2MWhh?=
 =?utf-8?B?YU02c283YnpoRmFlZ3NiY1Y5anlkczBEejd3cUI5WTFiK2NmWVR6bHRmdndC?=
 =?utf-8?B?R3dOVmRCTjJPYlRoaDRSRU8zd2daTzdWOWlyTktwOWEwaU9nZW5GcFFoVTFo?=
 =?utf-8?B?cWZkT3BOaCtrVUgrWnNueHY3alVMWEVyREFWVUJOWXowb2ZzYnh5WGZJWXZt?=
 =?utf-8?B?M2ZLSkVmdVpGN2xCWHd5a05NRVJKcU1yVUpBWlNyNHRWcDVzTjJKcG9wSndE?=
 =?utf-8?B?VTdrSDZIM3V4VjZhY09hcEZOLzlGVitRWEZnamJoYlNUZXk2dkpjbUp3NDBD?=
 =?utf-8?B?ekZSRHR1TjZFN1BDOEh0RnJhdUhYd2d3U0J2YWJoT3JRWmdZNVZubFhVcS81?=
 =?utf-8?B?UWNDZFhhRmJYQ0NsaXFWeGhSQXF2UFNNbk8rcmh6SzhWcGNwWnZHTUFsb2ov?=
 =?utf-8?B?TXpnQVhWWTg0Q0psM05vNHh0U1d2bnUzM21vWTVsMHZIRXdxT1F3R3pkSjFM?=
 =?utf-8?B?RGxUZ0owZWJGWklQY0xCelMvR1d4R0RpdTRRaFN6aitBR2RaN2dDenNMMnVD?=
 =?utf-8?B?QkJDdXFjd0JXM0R3RGR1eUJrVkd5d3ZFeEVCTDF4Zi9VQTZkUlRKNWVXcys4?=
 =?utf-8?B?bUpRcE9xcVJ3RzBDdFVhbGt6TWFMN3NIZ3pHckxwVmxJUnhCeEViOHMrcmpq?=
 =?utf-8?B?NXpPQUVRZXdxMkVYaUFWbG5WeXdmM3R1SGRXODJKTUlWWHpHdWk1UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde8b669-77ee-4932-68bb-08de786c5bc3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:59:52.6577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBvl0bl9r5oqIcQgUuEc/mBPmd2+p9Mou869/0ddJU3UYQtkepMdMI6LZ21tH1kI3Vyp/8PrkDF7flVGCkXJSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12255

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
index 0000000000000000000000000000000000000000..155e2653a120bf10747bd7f4d47f25e0493e0464
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
2.37.1


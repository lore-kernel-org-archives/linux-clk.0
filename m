Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011035.outbound.protection.outlook.com [40.107.130.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AC23AA4F9;
	Thu, 12 Mar 2026 06:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773298650; cv=fail; b=tXgsHzdfVOGoXtSDrrvBtfDBmnrfHeqAzK45geXmxkYBO+gzuLagDarJlzOepEkuphsx/c8WFXOQYQvD01gfSiqSuf1vuJCQJUctHqGpI/SX119W+8NGFMtuVHIebFcwwMFM/DRvX0UTFcuuAcb1y/R+x02VjuN4smg7t/BneDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773298650; c=relaxed/simple;
	bh=ThP3UWOqp8sEbKXlqk6JjoFIogRFA8SOwcF47bwy3S0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=X85LgH2/i5I4bC18krkJJch+36qnQ0/nGcGTkE2RqrHPJ3wVs9NdXxtfCdp84NLnVltg9/TVJJ5lFdrNeF6OcBuzlm9VHvgUIpDPJv6anaQ2XQ03AdYH9cLcrRhgJElldYMZRrE6PX/SXyJAF306gVJOPISwdOJpu36O9XXgPj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LS+I+E+c; arc=fail smtp.client-ip=40.107.130.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LS+I+E+c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypf8W7ZeNOaBWoreRJcvxHjWpdeYtJTXXF1qP2G8K440QRhlGdW0IItuhFhjGaZfzVgp6sTcwqRzEiiixusw198uwpyhSNrcJsMvmOrGBCzdnWFuH9piDIY/KoaU8Blt14BJgZUkuyh/0DsfGHkKWkMV6lubIkwAW/F5jPEUsX+JFkWsEnWJVpeQYbp331ID+qoStHa35xL5GjCevG+CPcfo5BaGef87lMcNx6+vVaQDvknjKkZriwwmJ/aSdJImZL51BEF8pFXw0hoTKP9BXM+Gx7N/kvNFsKCMK7ElCUt2G9xTTeuob9BAeHHwWERzmFaPCsiT1dPJxoavUkaZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOBHJX+q02TVDHNuAO8LtVZLQsK6tQm89clsq+BIRMU=;
 b=oGXtf3du4AzJZKeiQ/uN5j+0EIt86FHTw7QJ1PSPp1Kn229rErXz1LV0KH+0NFX2Pm6joOsF5sbctHhcPhD3/21fs6+fGu8l/bNfcX6ruSv6Le/bOrJXd5I2q5ktek70M5UKdcDTOeENkUrDpggceK69LO17oqRqWIgQWRViiRHRsCMR2tvioDlhhaQSSMAjrLj4smE1mPPy70zqlkgVTulspBp9mL7GqdU4FY4d4A3Pa21QzuVSTwc2cwM+wPdxf7HXpR8WlAmubAt1MVLGRrU+I4cBQ6PEKZ/wrHo/dBAjnqQdjhV7efWZJRcBV3sYAek3qj5UAZZdI5LXdSJqhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOBHJX+q02TVDHNuAO8LtVZLQsK6tQm89clsq+BIRMU=;
 b=LS+I+E+cXJvH0twPIBzcL6DFqDahdN9iO/9/vkZDnLr45k/v3kYpugFajI7LCjp98cFoYXwj91QaO9gMKBAJyBSsF4CQlyD+9GDX66AHN5W6Utf5fV3djCf+leAkb1SoS/Fkopt0NB3GWfJ5nrkIEE5g79itTwMAuRlKXFIW4B53kN18bSXG8CLXk9bnMnWyCfOx1B+9px6N+mmDQLFEUo6YjdzcR2ZCOxYOP5TdKcEy2FpJnTaMt72Hsm+r3p+ns6ZGA3irmEqKR16PK+OrJoXO+W7pqqbyMH9wQbXED0yLzqKDcj5NP6U1LGaXcccc8fBLWInzN2fryaeBXa2dgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 06:57:23 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 06:57:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 12 Mar 2026 14:58:17 +0800
Subject: [PATCH v9 1/6] dt-bindings: clock: Add spread spectrum definition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-clk-ssc-v7-1-v9-1-0a9d2e188d9e@nxp.com>
References: <20260312-clk-ssc-v7-1-v9-0-0a9d2e188d9e@nxp.com>
In-Reply-To: <20260312-clk-ssc-v7-1-v9-0-0a9d2e188d9e@nxp.com>
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
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: 02bdb5e1-b69c-47e0-8482-08de80049c95
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|7416014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BZmMvD0aLsCNanISJ5x7prpOhHZVUJjOXOd9j1F4PFwmTy0RcdtylWFuk2/6OOPTAT2gaYALsmFL7P/jNYXMCnp3TFFKYj+FyCuLO93u9rNInCvtuiiYAvcm2fwDIMvl5bEvAbaqkq7d50J7dlMy5/+m9yLJZAWpBbHLEGXIEARCWL5GIgpU/W6b9A4h4jwzenwqtDq9lMYIkxDqC9RE6qqIX8mC2zo9w/LT9LkrtSHTr6ctar6EQzlbR6mkQ3TBBzZYITyM3ct/TVx7tZDrDXXzjdGy5NEpcSMFAa9eKnp4eszPsHbpwZDJDZx6+DAqLYsMqKm1dYQ9+ZWrYxoi6hesYTp5jOLBPPjISY5+9rFKVV9kVXtRXhKZEqEmI2gSPXpk8lWEzQ93ZjDR9ZE+GPO5VfkAaSRxeVEay4qbaFRitE8i0d0zMBcvh1TOCvSccigrlBui/rSerzhg/kL8sDFVDcFWiX953mIL9mEgy3MWhwLy1tUE0g4WDdIXnXVur2QANz8CTvPeWl1KBzkB8xFnq1LWGrMiYZqKhpZNaym3Fn9jNuHSxY9i3Ro9/GEEqBV1blJP9xJ89nGqSrehWi0bLE93wdYw22zwmKzUHVzdEXMZPkzQ4GjtYTWbguC6smLGwtS3Uj8xY/t9BTDmGQ0wL26ohNdu/m3pcPHyzq/scyrxOgNBOkTep/Q4kPo1PRqQcNCFNebkg/g6gNVksgOaU1NDryDbq+qiYRnHtFSqOxV73yyexELduYvo7i7jnjk6jjUVwb9EfXD5ygJ9uuKHviU2BpOrXOYlNZTXm9I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(7416014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akY1NDBwTzIyMkV1TnY2cjh6VnRPZ0doUWp5MUVRcVVCSVNPOG4vV29OWHhq?=
 =?utf-8?B?cXJlTjVXT2FwaTMydlE0NDJtN1o0YWd5LzRBayt1eGlGVGJMbisrL05EeGlU?=
 =?utf-8?B?Y2x4WHN3RmZmSFFqZmhuYXhQN2duV2dqR092bFU5NFlJamk4eitZTWFIUS9q?=
 =?utf-8?B?aGt6RTg5TU1uZTFjcER4UXA2Sm9uYmI3N1VoQnlWcUVhMFc1VGxLczVCdlRq?=
 =?utf-8?B?RVpSbmJpZUIxR0NYbHJPaGdqRkMzQWJDN1M1bWlyUHhscWcvak8wMndVNUlh?=
 =?utf-8?B?VHdGZ2RvZjVUQU9BWU1ZQTFKWFNZSzhSSGYwdjMvN2FrdUlkeXJoc0o2QkNv?=
 =?utf-8?B?SGwxamxIRmFkWXlrOW5EZ1BXS0hzczRZMTFTZFlaeWJFTEJES0FqdDJjL2Rs?=
 =?utf-8?B?WmxCeW9zWFpsb2t5cm01YzYzR2d4YmtpMC9abldvUU9GdmJpVnpUT3pkYnpl?=
 =?utf-8?B?MFdXb3BCYkpqenh5cGRvakdLOTRYRnR3L1hSMlRSQ29iNzE1VElYWjMrRDNY?=
 =?utf-8?B?aldzSis3bHBzdmhzSVVjdFhDbFBOWVJMTkZOSnVTemhDN3d1QUJOd2hGMlpI?=
 =?utf-8?B?eWVKdjRKbGthOEJURUVRVVFsOGJjTE8ybUc1ZXVUaFFaSWQxSWpZQzlUUnp6?=
 =?utf-8?B?UmpwWEpjNkVGVGJVM0ZkUXE1TmFKbEprMlFFaGd1WTRsOFg0S1Y0OE9BbVhM?=
 =?utf-8?B?QnYrWU5Od3AwTFJnZzkySGwzcytnUnhaV2dNMWdVUXRzeUtFSGlNWmM0SC94?=
 =?utf-8?B?QTZUK3Zlelo1cFVaZTQ2MHFnM2lISHQxdEU1SVBkMmY3VjQ5UjUvVTZvTXFw?=
 =?utf-8?B?L3psYnREa0cvakJiMkF6L0xFTDRscDZhTmgxWXVyTFByVXlITU41R3FVbmQ2?=
 =?utf-8?B?Qnl6SEZkcm42dmZObG1KQlhYVFd4dFovcTNWdjFyRUNwUDZEb2F0QWpiamRJ?=
 =?utf-8?B?VHVpa1F6eTBpU3NrVExMUnVpKzJNbEVncjAxRHY3dUVUbjE3N3kwQVk5ZkpT?=
 =?utf-8?B?VTg3N09oNWVlbWpTYyt3cVIxa2RZMFh5YVBSRkdGb2ZVbDRYT3hpSjVQRzBs?=
 =?utf-8?B?dDdPRWZsUTdvZ1plRktlWjF5U0piZGZMVmJpQkIvR3BqaDY2L2FENlczOTh3?=
 =?utf-8?B?MFlNYTBJWmd3aGptV05uUVYyMkpIMHltc2x5Y0JYZFBvdmF2ZlpsaU9XYU05?=
 =?utf-8?B?RzVKcGVuaHJtVkNPM2pPazRDUXpQeVVMbjFrRW8xbkZsdnhsOThzaG92M244?=
 =?utf-8?B?KzhjdWpTNHdrU3RhZG9QVzZ6d0t2SVdodldiV1FGZ3VkUnRMVnBwdnFhaGdH?=
 =?utf-8?B?Q1NTdWE2NmsxNFM5ZlZaSnEwV3BxTllKYUF2SERQNEY3NDFQbUcvZWdxSURs?=
 =?utf-8?B?NzV4eHlydDNUaFlsZHpCeXdkNGZOVXFvYjMramZ6N1hKMW00cHpNUDUzVGxn?=
 =?utf-8?B?QzZ1SWEzaVhTbENub2VPZWtYNUovc0tXd1pQU2FtNHl6aWt1OE00SmhYcjBh?=
 =?utf-8?B?NDlNd3hOVDBhcGFrNGhzTTVpOFJFdENFbEw2UHc5QzhWNkRBalY4cGxaYkdr?=
 =?utf-8?B?TjRTaURxWG1kTjFCRlk1NkhRcnVZOUovS1V3b2hXVGZia1F1dWtOREtBNzg4?=
 =?utf-8?B?WjVldm9PNWVxNFZsVDcwcERzc0U1dEczR1dFeXYyVnpwZFBhUDdYSmhiTE1m?=
 =?utf-8?B?UEZvaTZ0VjBwWkZxZ09CZXdhb0RMWUJIMjIrd0xaU3hnUFVBeURwT3pvbFRE?=
 =?utf-8?B?MEw2bzN3T3pwOTE4QlA2TkxBU3FjK09vMHk4OFk3MFpBa1pSNXZLV1EwSExq?=
 =?utf-8?B?ZytvWXBuNjh1RUxyWEdBa080cFdFazIwWlRzYy9qcHgrTkZranpHazBNOHFz?=
 =?utf-8?B?Ynd4MnZocm5qYjRvbWcxaW00K3NvdFBWeERNaEZ2dTJRUkVtK1ZYdkJlRnZJ?=
 =?utf-8?B?azQxNWcxa0RWMVVkQXNTU3RSbFZUVnBIWHloNzRsOW9obVBTOVg0WFlXd21l?=
 =?utf-8?B?ektURzJPOXYwYTlub21leWhXSStnZmZEY1l1azI0L2R4VS9RcGh0TEtLZ21p?=
 =?utf-8?B?eFJHV3pTMW5hU24xWmI5Z01oUW1rUDFLczdBTHhwc25FTTEwNHhDUWV6YXE1?=
 =?utf-8?B?UnNOWm5vbExrc2pVUzhMckNKT2wyMUJLQlRFeE9RWDZ1N0tGa0h2SEJrVDRR?=
 =?utf-8?B?empzTFh4K0UyNU51WEhjRDlXZ1FkQVY0VEZJS0lldVdWVHlPZ2Z0b0h2YVNl?=
 =?utf-8?B?NGQ2Y2piOFJUUEkwMmVuN3hJSkZWNDFNUUdGR0NLVnhseUgyZDJ2TG5RN1lY?=
 =?utf-8?B?WnN2UklYcWRRNUduTmZTMHl4SWMyL3lOU3hNWHhua2lZeGtaWFBsQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bdb5e1-b69c-47e0-8482-08de80049c95
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 06:57:22.9534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlO1QHRwNEDxic3Px3/6XgiqGGy3DbOBdRg5bB+mcW8a7IoPbyZQBTzJoCKLFQ5wD63ewpHv7orgnJ3tEuhoMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997

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


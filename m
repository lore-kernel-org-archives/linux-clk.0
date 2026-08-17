Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A59E3F7895;
	Mon, 17 Aug 2026 10:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964191; cv=fail; b=hGMjCK55ogUr8wECWTvDHSznGPcJnBtouHR8eqIkSL7ZxGHzTUHPgpIGgfbk47kssnuP6saGKeUIAlovVA3viE2M0ctCF2g2I29USjhZ8+7iWpBGVjG+ghkRye2lkbpEkVFCrW5Itu16pqZ5oFaWJlqvB9kvYgLl2i+7Ma63dpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964191; c=relaxed/simple;
	bh=4CK/3bE0yn0NlMwz0Xo60VRXHlIkruvIuWlIRUz/S7g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XAJB73AfsW7sA66iUcZLbuTXvcCtYZXZKzegvmPBRmxQZDEpeUf9REtuHl9kaGHGESSQWF+cW6Jo9SouME6PUO/QWjwZLkWfJd122WgXV0Iy4a/TCGJo1YkwK8uX5HCJcv+HB8+dDnJgV80i9sm6PDfyNZQ26CYvocncA0PqVWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cG21YKdD; arc=fail smtp.client-ip=52.101.84.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cG21YKdD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/U9OgPffl4RMeuMocCkATuxVSu2qbQA7hGR+S4Lek9gfOKrRul35KtcpZJbMCMVd6pG8wVdM28cUb4oVnEYI0+dhYmq49jl2uVOcuv1FFSXSZe04iuVtR/G9LWSs88QeTX5/2AnVpz0MqDxtAVBIb/pc5h1KeKws+XDH7/CTCZ3RQk055Wj/oVkEfblS/d/kH+pY0uyC7/fGY1HsTghHlly3ez0lbyOuv7aQpfcVl4bWWlO7mM4OynpVs5ILniJjM17Lm5xrq86nwZMHAZTUkDbYwOGcDF2vAOUKBjhOkxpQo/fdJF3NL/DekKM55JfLA5JwBDlaj31tEeWxwb7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5NVoMvtQMK61916v8Blqy/6+Zj8q0q39lvdVHTpHRo=;
 b=AamN5Swao/WGUmWIeOU2CaObGaP454Y2nvRltaRoW4z6bGbyt0lAZXvkNatVgs0zn7nU8xxjD/TXG39J2MK5JqxF8KbFDAwKFoJL+Uqor4T3dISiom8JLFthmGMsIJcLst2KeU1cNpO+c8FQE17z6oQAeSGkVHSTe0LqMEprm1HUCTSIO7FHtLO1BjUPoy/re5QkR18MIMBS1BUhR3h8CE11SkEiUs8R+s7HNApg7jVhuOOXZ1Z9YL0bbIe0OMEYYTQ+kV737gT6xJSjO+hogEn52CM4H/Wr2FZ1W3BUuPTGpIOab9IGstKK36rqSDgVIzLyj6XqY5OE8tvWNgxhkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5NVoMvtQMK61916v8Blqy/6+Zj8q0q39lvdVHTpHRo=;
 b=cG21YKdD54tBPhbvpRELCv76/HB+varQXZQdyu6jBjVA2bMbf9TaDNRWoo6FML75K3YGBAf25XHdQb27bgObKR+VySjs3EVdpiSQSM04QS7AViQTKo0Z3fZmDMm5mTKSSWz8PRZDVkEQDuX/XPDAaUcsj4cro5xsTI0keXhtjFTTNSbZelPOMzsra3JyYHg/IAohL+t3RqhRTlQc0i5OiGH9DvvEgfuCOyOqENcqfzbc3zBIGFxc9LhzT4hHtOXaxrS60DFu0y/McZh+jAiQoZqOKc27A7Z1eRcRufDUOtqUjwS8+jDCPKkBImZKyWaEJgWYdIJaDu4UwnKuunE4Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9072.eurprd04.prod.outlook.com (2603:10a6:150:23::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 10:56:09 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 10:56:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 17 Aug 2026 18:59:36 +0800
Subject: [PATCH v11 5/6] clk: scmi: Introduce common header for SCMI clock
 interface
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-clk-v11-v11-5-36e9bc701b11@nxp.com>
References: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
In-Reply-To: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4e9cd5-8335-4ece-884a-08defc4e2526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|7416014|376014|366016|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	c8EQFuIMtvE6HKVr6UJulTFjFkkamaR2dtSEvniPUiR1GCG8OynHpbbLsR+RjFGuxuynG/s7/WWRu/AI5qsnSzw3yh+IF9FXr5NeKnRIvRydeaK/DK46zg7M8+oK80czXzl4WxWCNrouOVBmPo6wExSUJWEc3ldWzRFJev4q8YkIsguZn3il0nhT9gjAC0nj8/aVFOlTbv3y/umhVyQGZKz2/Azsf3oDqYOpFB6ArRoWyLy9PP2MYCGEE7a1aHbWZ+3KBsFm/1awPxR1LmoOVDYRalZpTlnWlxFaxOdyLeNj+XBKslDFCVr9TgjwSVb26MprBvVGvcJXUOtG6oWyRnjXmsNjILT559xPOjJMFV4CzksgduOZVyA2zAtrOaW/WqfLr5/CknBpynz+IdCBefz74HW8yF0vOW1T8rRjrOIfs+8yJzbCFDXZ/k+D1XJqC3bKXL6WvL+gsVd8c1xlqv6AZm8QdMBwqNOxPjKW2+/7vagP/I/BQocZSGWoMIqPVivpyXAvZJvgyqhUAJA4r0AzJPu/h/b3Ovv3gmSiG/+czxzJ1k/XvrYKuEYNMLy3/Y09F+c96OYtN5hjxHmVCM/3bixG+l6MaomCgmEB5mjl8MR2roELuofFQ6gJTv8cMYeQm3WHdVwIPJyALqMJdgImh1RuUrf9qYdpYx0X7l0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(7416014)(376014)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkhIWjNwK3c4VlVoeUxXZXkwTGRDdEpEV3pEMjJQc2djK2l4dGlxZXhha01F?=
 =?utf-8?B?aHYvTVBWbFQ2VXo0TE4wZmptUXJEaU9jR1VjSHNCTitGdDhVMnNKdnc0K1g1?=
 =?utf-8?B?RDJxNk4zb1RDekQ2emZJM1g2S3dXUzY1aU1vRFZDM1g0WWpSdS90TnI5bHlU?=
 =?utf-8?B?cEgxNzlOZHcrTk9wT1N5azdva0QzT2cyNTU5TDlhNmJGdkFsL3FWNi90eXVX?=
 =?utf-8?B?Tm91K203N3c0NHA4b0p5bVBGNThSZW5lMXlOQ0x0cGRLZnNMek5DblExOWlF?=
 =?utf-8?B?WjJzTVJQdmdXQ3A4WWp5dlIrRnFVRXhBaHpsRGFrS1hpTDVJYlNXSjVEaG1R?=
 =?utf-8?B?MlpMdVp2bXZFVWl6ckFTTHZmMlRqT0VYT3Rhb1BwNmZ0QW11N0tTaThEcTJU?=
 =?utf-8?B?V2p2c1ZsUlZGd3BpRkw0R2s5ZlR0MWFmN25GdzNyc2t1MVZ3VUVBNW03dFEx?=
 =?utf-8?B?N1FZTGlaRkp6Mnh2ZE85b3g2RnluWFowbVZVL1E2aDZiOFVlM0N5TnZiOWpl?=
 =?utf-8?B?L2tsUnF1MnZxQ01OMVk1UnlMWEpCckV0SGh2Q25wVHk5RkZyYmE4Q01DUVE4?=
 =?utf-8?B?UEZZOEorNnE0OEhRVlVGUmQ1YzlwMWx2Nm95cHNFeWdXNXZnU1VFVjU1YVZM?=
 =?utf-8?B?bEFMc1NkdlkzckhQM0x2akZXUjBnKzZUWk0vbm1qOUFybEhGbkRMeGh0TTBz?=
 =?utf-8?B?NENsK2F2ai9zUUhvQWUzS2Z6T3I4TytiajVTZ1p1VVVVd0x3U29vNlpXUk83?=
 =?utf-8?B?THRWT1dXWDEyQ0FXMWVHNG1RTGVHaHNmS3hpUE1EdkMyL2VXcWJrMG5ZWlJq?=
 =?utf-8?B?eXhpMzVPeWdJVWtsZTNEOVVabDlYUVRHRkZCS01JQ0diSVFQVUNuSlhsaDRM?=
 =?utf-8?B?TUVXUjV6YU1aK0NSc2JZRVo3T2pTR3Fxa3UzbTBoZ1dzTE52UTNOVytnTG1r?=
 =?utf-8?B?WjRoT3dNdnc4VVNRWGxrb0lNTkJ2Y3I1U2lESGtBbWdMdkx0bHJxQWZzajdp?=
 =?utf-8?B?RjAwYUVoamYyNXRmVEM3VlVITDhGaWZZODJQUUhOTmFCWWgwNVprRi9BQ1ZQ?=
 =?utf-8?B?MXBVZ3hZYVhhUEM5UzkzUDhVbDJNSXA2L1pEbG9hUUc5QUpjQmIvTGVHelpS?=
 =?utf-8?B?MCtzM2JMS0gyTHp4dGI5NElXdXhxYWFsTDhEZ25reEJ2NlAxaEVNbHBsSG1H?=
 =?utf-8?B?a2xuWHJNd1J4Nkk0NElhTlluSC9KWUw3TlMyTUlQbEVvMGdieEFOUHRFUDFU?=
 =?utf-8?B?SURzZituMlc0OGw4T0MwQjliSnJBTWpOWUhIajdiWTZuRUFUbGllanFGTGJ2?=
 =?utf-8?B?UDRnMmUrNDBrUlJzMGQyOXN4QTZQT0tpM1FOclNYallkQzZUTS9yaDhoMFJ5?=
 =?utf-8?B?WTdFNE9ZamNZTHNqMWFEa2xJRktkeUVpYjV4QldQNFFPV3ZzUllCSmx0WWN3?=
 =?utf-8?B?S2t6MHdDaWo5N1JXTDVsdEpDTzBuK29EL2pTTnFPZkFrUk9mTDBYelIwcVky?=
 =?utf-8?B?NU5kcFNpeVJVWS9VV1lza3NEQTBZVDJTYUkxRmVMSnpXbnpGaHVKQWNLL0hr?=
 =?utf-8?B?ZVNyRWR2Ty9ybFo3dkRPVzE2QkNxTGZ1dmFlODUvRUZVWE00cnMvUVJoNGY4?=
 =?utf-8?B?eFI4Unl6eFRSWEI2MDROLzQzbGlRQk5YeDV4YytiQkt4ZjM5TU1ZUFN4SXlh?=
 =?utf-8?B?bEhmL3U5R3U0OFRyb1dxRXdXT1hmRGtzL0xqVFVXTmk2QkxIcGpOcWZObXFS?=
 =?utf-8?B?WHMwY055VWFlOWNycStTZlo1eko0SXNyTitmcHdhMkI2RlM0RFQ3RjlXZkVh?=
 =?utf-8?B?OHNJd3R4YjNpTXZQWlRpL21lcWZlem9VVjdMOWEvUHJjVWh2cWNkaklMZkpy?=
 =?utf-8?B?OVpkbk11MjdQTldDZlBqalNPVy9qVFFyclEweGxTbWpEckhnMHBiQkR1OHNn?=
 =?utf-8?B?anQvK28vbnBpKzhid3ZZQWVCY2NHQU4xMDNKdDZFcm9vV1VLWWI0bHZYU3l4?=
 =?utf-8?B?OVVzV2xuMGExNE5mclZOKzNMbXRmQzRaYnZYbWhMNEFHekRGREdweFgrc2tX?=
 =?utf-8?B?R3kyRjdPQzgyVjBSUk4xMzY2YW9XaDdwQkN5cEdFVnowcHlacHhpOExKV0lm?=
 =?utf-8?B?azg0a0tnb3Niemk3RlVHQUkwUzRSZlVhR3EvNlAvK0x5SU9BNW03eTNSZHE2?=
 =?utf-8?B?OW5IVVhJTFFWMCt4OXlONGU2OFpuOWJ6cDVFTDdRSzBsOEJKMlBvTzBiakRq?=
 =?utf-8?B?S2k4LzVlTzZwOEJUZHp4SkN1UmVEV3NabTdmVDBWK1lNdkwzTC9sUTAweG5T?=
 =?utf-8?B?SXR1NWZ6VERUNm9tM0ROV1YzL3lYWEdORTdmRzVQYm5DU1hJL05ZUjAxemZh?=
 =?utf-8?Q?DOvZOxIPW8C96+Dmtaw+N4rPX08GC3zyPHKvB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4e9cd5-8335-4ece-884a-08defc4e2526
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 10:56:09.6722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLmhSftDu/HTTH+o88kYQc3LSeE4PsSmAi2VAILSw74M4dakpxfjp6D6LmB6YcaiYSHFjOEzLy+zvAU4t4ezDtcmOOomBUecJo1E6KRaFFO+vblGg/kMIDkBFSvqqSw2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9072

From: Peng Fan <peng.fan@nxp.com>

Added a new header file 'clk-scmi.h' to define common structures and
interfaces for the SCMI clock driver. This header will also be used by
OEM-specific extensions to ensure consistency and reusability.

Moved relevant structure definitions from the driver implementation to
'clk-scmi.h' to facilitate shared usage.

Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk-scmi.c | 27 +--------------------------
 drivers/clk/clk-scmi.h | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 7c562559ad8bb..d88e78cc9a12e 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -13,32 +13,7 @@
 #include <linux/module.h>
 #include <linux/scmi_protocol.h>
 
-#define NOT_ATOMIC	false
-#define ATOMIC		true
-
-enum scmi_clk_feats {
-	SCMI_CLK_ATOMIC_SUPPORTED,
-	SCMI_CLK_STATE_CTRL_SUPPORTED,
-	SCMI_CLK_RATE_CTRL_SUPPORTED,
-	SCMI_CLK_PARENT_CTRL_SUPPORTED,
-	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
-	SCMI_CLK_FEATS_COUNT
-};
-
-#define SCMI_MAX_CLK_OPS	BIT(SCMI_CLK_FEATS_COUNT)
-
-static const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
-
-struct scmi_clk {
-	u32 id;
-	struct device *dev;
-	struct clk_hw hw;
-	const struct scmi_clock_info *info;
-	const struct scmi_protocol_handle *ph;
-	struct clk_parent_data *parent_data;
-};
-
-#define to_scmi_clk(clk) container_of(clk, struct scmi_clk, hw)
+const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
 
 static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
 					  unsigned long parent_rate)
diff --git a/drivers/clk/clk-scmi.h b/drivers/clk/clk-scmi.h
new file mode 100644
index 0000000000000..6ef6adc77c836
--- /dev/null
+++ b/drivers/clk/clk-scmi.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright 2025 NXP
+ */
+
+#ifndef __SCMI_CLK_H
+#define __SCMI_CLK_H
+
+#include <linux/bits.h>
+#include <linux/scmi_protocol.h>
+#include <linux/types.h>
+
+#define NOT_ATOMIC	false
+#define ATOMIC		true
+
+enum scmi_clk_feats {
+	SCMI_CLK_ATOMIC_SUPPORTED,
+	SCMI_CLK_STATE_CTRL_SUPPORTED,
+	SCMI_CLK_RATE_CTRL_SUPPORTED,
+	SCMI_CLK_PARENT_CTRL_SUPPORTED,
+	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
+	SCMI_CLK_FEATS_COUNT
+};
+
+#define SCMI_MAX_CLK_OPS	BIT(SCMI_CLK_FEATS_COUNT)
+
+struct scmi_clk {
+	u32 id;
+	struct device *dev;
+	struct clk_hw hw;
+	const struct scmi_clock_info *info;
+	const struct scmi_protocol_handle *ph;
+	struct clk_parent_data *parent_data;
+};
+
+#define to_scmi_clk(clk) container_of(clk, struct scmi_clk, hw)
+
+extern const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
+
+#endif

-- 
2.34.1


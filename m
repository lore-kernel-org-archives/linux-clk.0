Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8748A382367;
	Thu, 12 Mar 2026 06:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773298668; cv=fail; b=Zl3nGM1qan9xyhKZ/Gn0+Kh855RO6STQlWBzXio/2+ahH8P8FHcuK4oFM4lhjssMcAaTJlFLfAN5b6fGOIVu2dRt4aQMp5Y5IohLkW/C3meGCX2ZUwdZHp4/FjJ0Q8qWp15U/4wnO+oGNjM/oxnUaNpRoyEMTeIA9ALwdAghw50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773298668; c=relaxed/simple;
	bh=JLC6MakEYLjZyLi1Lk8OfpXU8eCjff8lE82qWjh1B88=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sTcXtBsIAP9Qm0xrYCZkMnkOV2psSK5ECST50CSfvVmx75XxWMZlLzPlCz/VA4J29qNl+uiLhYWHw8gw+cumFeQqID6stWH2cTe/Xd34dXABVMr7eE6f0GDI2YzoV/I7PyfB5NKl+vWox/Q767AP9EIVVkzvlLDqRfML7/eMfzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Yp3ulq7j; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Yp3ulq7j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXYKIVVYlupZQq+m/fG5BhycUoRwaV5hf6FR+YKr6DyBeMsx8VuR4PCP4q89lzkLkV8QJKZG+EMlcIbwwYeQ2+HdS40Q47JtJs8QumwZaQ2Ac5wUO44dzqytULc5lqu0U00ZViBJtF2j2mJDfrZbtnmo9LmIT8z8eiNNzmG/m4Bn49MRau6osf5wNkZl+PEiy5f5kODVPjjO6WzdKK0E2NhziK9sE5KZMq9pEJG46i/8gA7rEkxl64dWV/rOFVrXzRhAn0cCE/u9OmRgjLI2hClMenEjUv0EPisqFzcw97pk/yhYBx5YFtWwvXeawcP/pp3q5ZoxUOZG6n9/TZ2CBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM5JSHU1l87OPtt7ZaQFMlVLBnvdejkKoGjwrux+QhQ=;
 b=DOWR6JlidNHM8EqpL6hsfNYTbqoqal67ksQI7KI/tNtUmUx2bwNATihqc3JpaNx4rSGZHZM1eKe+rBZ1ZEOIa8ptNF+XzzRl04gLMSASrqk/PUo/sBTq0iwPgctjHGN2xoyO1OQ7WE7y2HvewN9J6qF9ZsnVvGJC8+Kw+2yFa9BVHHw7jDwTVpJsze6sp8gQ0AD2AImbE/e9CFyzeL/29Vn68M/mRz9QBR/3EFakFCU+g+4pSoFrDBurUfukrrauD7KJYgIaSghdjzcCo+S+FpYROc8ubfPONVU4TqONNC5ctrlkGgrhcm23bnPqGGM4+tvy8R1n6ThQtJ4r1WUcxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM5JSHU1l87OPtt7ZaQFMlVLBnvdejkKoGjwrux+QhQ=;
 b=Yp3ulq7jSckYy1xQzOE1MfSaRmWUKHdH92Bbx8J61tmsoogckmk+B20ckvCAxnYcclfkpp3ufx6U6FjmJrzXNEp/d0M5M4NmJTN/Y2op1EzmpqFaQDPfRWTkIhiTICL4MKe1PU13hTcD0T0Y2fkLs0+0hzoGITaq1DXWCGVbj/8ZyZyyI2Q657PqaGFh2y7K+ipHAhY4JIVKFM64DD8A5VTjetYbCWDzRvBrq5U+d1xgxbaQAy0x1+zXsqiDLo79i3sbD5fn+FGAmux1BKvSwzbGWlfD8bhCfOLN+FjqDXE058Z6qKqeWJjU6KjVRY3QVxgOQ2ftz60bEdK+Tq/4wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 06:57:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 06:57:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 12 Mar 2026 14:58:21 +0800
Subject: [PATCH v9 5/6] clk: scmi: Introduce common header for SCMI clock
 interface
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-clk-ssc-v7-1-v9-5-0a9d2e188d9e@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9677f968-4b00-4b04-1f4e-08de8004a788
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|7416014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8oznTzmif63KooWA73cmEELUXr1KlEFarcQEpkMIqpr9mKM3L2MUIafz5KXmgl7qmYZCiSn/SkRChIC0fGpKbUETVR+oHw24WLUU/hAFrQtyfavl6nzILgAL4DN/SAFYCVTQLX5d8p1e+6ljsIO32GX/y0bxIeBrQT75HI8rZlFgLZe7m9TtcarNDO8u5EbFwvZNx32PpCHs9TkpOTHwOaNQ2qIfkgfVLP+4jHAehuniWmCG8+mnbus50dksw6UN6U2Y8ILsJYaTpnGCLr5kgwf6LObMeIqVwzK2zvMKyYrkEjdQirJDFIit00qEKZxJ+VAlHk1kbaEOFOiWJMJgnuK1Dg/YuEy7INdGnDUQSXLIVpqGeZqqou6te6DDErZ8KXUAxrH2r/1aEXA1tTccFLVJA5CGm89NCNN+8DLhvWXrPnuX9dXWLfOv+zZkm67CTRA6t2uz8xwKdGg2P8K9GpEMxhi6HLkNTrfGzeYSVwgTHOWrlMMZsBeMOk+8rzz2ImSgfApYJHD9RI0ZHLtOxVs3uRJWIkArcMJlwTJ8fKVIPzpMFfoSJJXoPtgXjOQy0zQrlfn9heCFl+bwyrRLWkFX+qOWJC7QNZeI8pR7OVBbjo/f27DHnF+hd79De0GghBiV3q3aiAwDJv/6jte2KatAOtJU+G9Zp42r7L/tUsr3ErP6QdEzDLbhTIcRSASJV2D5AcIsWbmuIc6eCGLRmjuWjghAI2wI75s+rzV1wCTeOjaOOmHOOXy+XtJNcj06R1StELozWcTwXrCcZguShVTBVQFy5w1QEmowW4cOU4M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(7416014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUVRbkFPNWVEeXcreGp4MUFhTlR3cm1XOHFjWDE5dk5BNjhnZFYyenNkTFc5?=
 =?utf-8?B?TXQxNy9rSVF5OGd4UFYxdC81Skk0M2c1bngvQWQ3dGNXQXpKZnBMR1ZHRVRr?=
 =?utf-8?B?T1NnQWNXVlhnSHFBWlpvbTcwMWd1Sml3cFNiQVRqcW9zNzBoaS9PMkRGeThx?=
 =?utf-8?B?NFFKbEZpcko3cCtVMEdOUUFIU1IySk1IcGxYcFJGQVZ6SWF5WHZnZEwxemxC?=
 =?utf-8?B?Witnd3k5RHYzcEV6b2ptVHNqMGVLSW5NQ1Jwek1xN3VSNFZBWTdRTlVkbGtQ?=
 =?utf-8?B?eVJqNjJadGhjQWIzeFBRUkluU0Fpa1dEbDhPL0tOM1lReU9RWUh3RXpqYlZF?=
 =?utf-8?B?VTUxNTY4YVRLM3dWV2NZcytLRDN3ZENBMnBBOXJQQVBIYWJpQThFK2NBU0w4?=
 =?utf-8?B?NWM4MXdISTdmbk9GK1Q2Z29UNFJSWHdTMkxoZDlEanRkUTdjM2hzbE1WMHpk?=
 =?utf-8?B?RzRoLzFmb2lobnJJak9GWm9MRGplNkU2NVVjQW15QTM0eGQvUy9pelRHdmZT?=
 =?utf-8?B?NXBBTXhtanFOYTZKOFpNSVppY1NOU25qQUt0RkxjaTNtRjVxRC83UkFNZHNL?=
 =?utf-8?B?bGhuNXZETjEyanZIWkJJd3RHbnRnK3dKdjBzSklmQTQ4U0VNRUM2dTZFNi9h?=
 =?utf-8?B?andIK0xoZmw3VEI2Yk1sV0ZXU041Wi92T0hWMmtmbjJiVnJ5ak9SVE94SlRR?=
 =?utf-8?B?TDF5MEpwdUVsNHVtT1FNajRQNE8zUlZiVDVYeG1WVEh4WXFFRXgzV25ETk5t?=
 =?utf-8?B?eEU3YWFTQWRrRWVjc3c1bjV2cEVLZVV6WloyWVdNWWpvekZuYnc1WlNzdytm?=
 =?utf-8?B?UWFpMmdKK25aS3VLVWY2eTl0TnZNWjFNV2NYZFVxeDVBeWpQOXdTMnRFdWVu?=
 =?utf-8?B?dlpzTjdPQ2gzQ3JyY3pCZHRZeVNFKzgxMWFqbDZld0YrZzJROXRVNFM5WktS?=
 =?utf-8?B?MGp1MGE0NzlnRnU4bXE2VDUxZ2kyTEw4eXpmK1ZnaGl2TWwxZktvR09YRVJw?=
 =?utf-8?B?cUg0KytrcTliMGlwTmZHajBCWDE4QityOTRHUGpNaXRucXZuWnMvWXllQXVy?=
 =?utf-8?B?R3o1cHJPTU11dTE4ZzN5UXdxYXlneVpwbHJneXluc0Q1RXNneWF5MUlRTm80?=
 =?utf-8?B?VWxoQXlpWTRlTktvZnZucG9jQkJBamd5eVQ0TmZCaWpGdDRvNWN5T0RtWTc2?=
 =?utf-8?B?czI4V2h0ODRvODdUTXJicjBwSEl6eVZydUtuWWt6M3N6RzB5L3hsTjk2MWw0?=
 =?utf-8?B?bHFHaGs1VVh1MkxsQ0V0Sy9pR1JMeEFoWGRVYUhvelNPdkZpaEFjMlhzYTVw?=
 =?utf-8?B?TXlBWkVXTE8yU3N0SWF6RnY1MXFZWGVIcEtPeGNEeVhmb3FNS3pGRTlJV2tY?=
 =?utf-8?B?R0NDMVhQK2VMczhJMlRZTWsxMmQ5WTM4aEdqTnhVN0dHQ241QUJ4Qm1hUEp6?=
 =?utf-8?B?L244aWcxeC80Ky85bVdwUklDcHd4UzRpWG11MXllbzQ0Vlo3d1p0VzhXcEhF?=
 =?utf-8?B?ZDNFTkFhcGkxQmRKWnd6R2ZQVTljbTFXeC9PeVNqWVkrQTM1RVBVeTBDTFdP?=
 =?utf-8?B?RXAwdXZYN2N3ZERTemliZDY2YmliNDVTQTdzNjRkZ3p4QjB4dmJhWFFrNXVm?=
 =?utf-8?B?UHAwZUZORFNZeTYwS0lySlRqTkFINjQzUFNLMmFIWG5pSkZVSklySTg0TUg3?=
 =?utf-8?B?dlNIQTZJZGxqa0tnaHhSd0k4R0JRdzUwSjZJSWtJTW9aVUduV0lqaVR4eHMw?=
 =?utf-8?B?TVRoMzY2alliSE1WVGdtdUZ3Y0xzbUZZdXBEbGRVc0lCOWx5NTY5eExnTUht?=
 =?utf-8?B?cEgrUVhwL0dSZ0ZwL1FpenFLNEpWMWRldU9UZVgzWTdVL2NhWkc1VkNTRHZY?=
 =?utf-8?B?V3FLQkZReTh6UGJXV2lJdjJWV2FQVUh2UmxTQUJsME1waW5VZ3JuMEdxemJk?=
 =?utf-8?B?SmRkTjZ2VEpObEczMDJVeUd4djcxaWhvQ2thdlpTdkE3dDdSRlRqL3RHdTdS?=
 =?utf-8?B?SmJyRFpYTG1kMkVhb1B0c1NxYVBaM1crZzNVVnlIQmdSY0RSMk9sME5hSEN4?=
 =?utf-8?B?K3d1QUxIc0Y5ek5NODZVVDd2NG01K2FZY0pra042V29FNEJqUW00N0NjNXhu?=
 =?utf-8?B?alphVitRejI2VUVQNDh1blBtcDRjT2Rpa3Z4b2VHOGUyekdaR0tBMXlFa2s1?=
 =?utf-8?B?ZVJWVkpNdGhISjllcEtMa1VzM2hHQTJTYXBROHF0ejhPdTRFSmtuTXh0V1JQ?=
 =?utf-8?B?ODNRUHdHTFRiQ0pEcVlyS2dzR09FNzFBRXJLeXN0MDVOZFlVb29hbkhXNXNP?=
 =?utf-8?B?ZzVKbDhEeDRSb3cyR29TTGpLMWNQUmx6dStuVWNHS2NhMlBXd1pNQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9677f968-4b00-4b04-1f4e-08de8004a788
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 06:57:41.3513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IW4iA3GNaJ0y0Apged647wwDanmykRq4F4fb5oeF2TQLaOe9vA3ULJ74Ks5j9i9BzKK/qNqr40hWSZskmGhZ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997

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
index 6b286ea6f1218c802d0ebb782c75a19057581c20..bf85924d61985eb9e596419349eb883e3817de73 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -14,32 +14,7 @@
 #include <linux/scmi_protocol.h>
 #include <asm/div64.h>
 
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
index 0000000000000000000000000000000000000000..6ef6adc77c836dc2d599ff852cdc941f217ee388
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
2.37.1


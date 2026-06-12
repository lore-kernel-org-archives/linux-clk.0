Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010059.outbound.protection.outlook.com [52.101.84.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8AF362152;
	Fri, 12 Jun 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781253839; cv=fail; b=GiGhLtMqJkeKUYP162qeSEojFlD9w5jnYK2Ul8JRrmKCX4cGm9fCkV1OxAw0EP/Y6fc1oXXu/Og04mEIk6/5FHtjEu8Cdr0NcHvjJBLZA6D6L43eLJllMZ+ddCz7wO3KFc3JMBv5EhsYNocXDM0PPrcN6W3JhQnMb+IA11+Ul9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781253839; c=relaxed/simple;
	bh=gbgSHjyDbtf2t/Pk+SimwQoNVI3oOiuL2Gq7Lm/2WhA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DAUFvIh5Sl9QjiNX9XRtRIJ3UTbqnpw91v6qIJAnKI+Tkb6kII8UlwiiJAgMKX6Tg8PnjoqXtIYKNAA41Pck/N/KaP2wAun4ecdpfSG8HUdT+x5090t13dvw2+tpeM0m6LtBtboZFDy9U83793ANOVac5zFr7rgCLrOlYoyhOSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fZ8fZ4Hr; arc=fail smtp.client-ip=52.101.84.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fZ8fZ4Hr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVUFDaZY7psKwzz3sJFcxDC7h7ZzUfVnQ9Pz7ltblPVzR8vnYSF1fnM32wUjQYDz2jbDjYUC1j4FkT+z++tnDUn5z1v+tU0kUDbQdHwnhjNc7mot/Qi9P/FTri+f90jEzFKE6NuzYuhhT3qhheV3omVCxc9MT9kHcp0flMVmM2g/43Tuzxgu9ZUmZTErNSc0X0KZQiUOl5n8+Oegj7CLZBOdSW62uGlqPZZC92cCuuo6fsuUQn8DnKlkE3u3KgQ4ORe93bKH6ypFKrDA5MlQbUdWh//IAvpjqkVaLCGhMztbJAkSNCryHcWO2KEw9W0nMerQv5JxcC5KSV7W0zmK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddtUxbuU5hjHBxeCK9kjY327enFieNmTZTebw+7q6bw=;
 b=Ps+zHQFoeS6ijOJMyk/8HTBlkY+FjkJhKtdXoAKkKLEfJiV/akvQGgKfm/tYBWCWiaQxJp9WEgyUQq3hA68Glhx0SOin26rciWzzYoAOn0RJ2bb9aYHr0YdGKYmX3V8RArFgdAm9vDZW/nS318rAg2uUhFFzKI/qSt3ZJMYm0UOIQgiDftjn2cyue4J3f5qQ/Tfl+zJzHvwm1P8A2VWbomiCl7RALbh3R0X5rbmy+8IByec6girbzlqqxZicFSnqjz/2rtdf0BnUx1BM9xqIDZ7LV1qDo8s7Z0oFYCa+sJg9f15cnJOxBC/xFo1r8YfFai+dKB+rbtmi1r4N/ngqhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddtUxbuU5hjHBxeCK9kjY327enFieNmTZTebw+7q6bw=;
 b=fZ8fZ4Hr+X+juMYLDTtNotheCnu0HXxfWE/HwU82nH+moMWF+mpdCLmAIshwTlhtdbwMnEjt1rBrs1/WlilN7iv2US2UTIa1WZgabw8DdF37wMUN9iYAUpiR5z1N+qB4tVE+451jjtMRwuQpB61qJhJpYDqHlsNViHuiEWHd4S4XCHvInBiCBOgHhQtBdcb3nMuqTKxC9SdRAXgoKAr6HA3g4FFfMrAYouG1we6QRFBdwKKgwQTDF8de3dwvaeS501em3okiTsgMUqwxWj8dyhAuL2yUkDSB4Rq929kjws9mm7x+dSGORXUCOKFnl+M5bbT640kCwmUNKWIo6HSDlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB12293.eurprd04.prod.outlook.com (2603:10a6:150:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 08:43:53 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 08:43:53 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Jun 2026 16:46:28 +0800
Subject: [PATCH v10 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260612-clk-v10-v10-6-eb92484eda38@nxp.com>
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
X-ClientProxiedBy: MA0PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB12293:EE_
X-MS-Office365-Filtering-Correlation-Id: b642d0b4-a0ba-422c-17cb-08dec85ebb4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|23010399003|1800799024|376014|3023799007|18002099003|22082099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	WnoC0Nqr91D5u55ncPZOQYG1a9cab+k4O4sQVaCDTccyDQD5DSO6Qxrd0SncFziMlmlW1kMLB7ZyI0LZSGtV4duS4/E6E95awxb2drc+dS093K2NiGz/l+aI5faqEs3Ttah6V6aE6hsSO1xmHMI/L9wCGVXiaisl2uIKkx9As66/N9CB9G5kTSM/akI4WsKoyVOZsBJ1q4X2sQ4vRJYSACmlxHqGsTEyHiHL3XJ4GTYP/YbLKxMA3tXnIZOREsUdd4DmkNP5Fe+LJKtvbt6MnRDGIp4d+qKmDNgT2Brl9+dvpluhHSxgQa4jIRxOzz4GwAZUxNon65DFCqfQ7F6qS13RgnbPLHVH9Ovr0bwPKvN+b9KW/kh3ZjaVqS2GA4G3P3ZQT01HB1pFLvHx2C+Tv+lvjH8XU1M/kuRo4kSs5zLskYf0+9l16gWEJBb9GiR74JjW8COGnGzKaNuEND8IQZWJpmMR/faarsxd8Oo2CdKAgwOZmY8/zYX3IJhfLdRY6UeibAleXGI4kNEC+erZeo73pPNI34uUq4vmoJEEQ3Uux3EDo1tALyAEGDoPQgRJV7PxyI5GGFASO2iAQvd3b+pdiwD/QXi8mUXOrP7giKdPOIKFMutxLZBlCSOOhNGwf64lFBNr7EEFodDXT9yZCX8m4PzsrDVOKMrzMUxrFiZkHqSz3Rfa18t2ql0fQggx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(23010399003)(1800799024)(376014)(3023799007)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2hJN3JqejFqNkxsV3ZUVWczTGNOUzQ5amdoNFJHcFhZTDVRdE9Ed0xBUXBv?=
 =?utf-8?B?L3UwVHFVRlFZWXlUNVlXeDRRemdNcm1MYURrTEV6bzlmYjJTZEF0cXNSZTVv?=
 =?utf-8?B?ZlZKTDJMOVFId3hJUlBEbXJxaGEyQ2RRUDVnWHZRMTV4eEd1amZ0aVJDbXNr?=
 =?utf-8?B?Nk5BSVMyQjYyQnZ5eWdXa1haMlZHdnJvZWxGNW16eUZvY2h6dm5PRy9YaWpC?=
 =?utf-8?B?MHdXUDlQYkZ2aHcvQ0U1NVh0aUhITGV6VE8wcldjNXE5ZDhmWkNwVDIrZGhv?=
 =?utf-8?B?aUVFUWdNVUU0VmZzSWs3WlpmZXNRbWJXd2NqUmlZbmMyTGRqQnlVbjNyZmpt?=
 =?utf-8?B?TjFCelhsV0g0VWdzTi9vd3p3NEpxWEt5QVA0VURmWHpaU0hLbVRVa2l1Ukh3?=
 =?utf-8?B?RnFJbDZXNXdZUnhjMWJJSVJCWUtNR2dVREIwWnlHT25uU3lGQnhQZENvVzVQ?=
 =?utf-8?B?bU5ZWi9RZWFDcVRXZGlHVGtqS3lZOGpWdHFXeWwxNzEwNHUvMkovOGxKYUlv?=
 =?utf-8?B?KytBZlNyQ0FNQjUwb21PdDJHUGhGbjMyT0Y3N3I2cVdWbHB6VW5qOVI4S3o0?=
 =?utf-8?B?dGd6R1lxdjN1ZDJWWWpRMFpJL3ZzZFNCellQcmRXRmZPUW04V2pWMlE5c1lo?=
 =?utf-8?B?ZmgyT3BDckVRYVRHUyt2cTVnUWxRWk1sVDF5ZTREQlZjYWdzUkVYbnVMeEJ5?=
 =?utf-8?B?THgxcWVIRGl2ZkxwdzVsTzEzbnh2UlpZd1BMRnpNTFJ3cmR5eldRcWhWVlBO?=
 =?utf-8?B?eXJCY0ZxdWYwSDZ4TG1qK3FDVE1RWG45THpxMERVOGw4N0p3QVJTWVdtKzVF?=
 =?utf-8?B?VjNhVHZoRTJoWFJ0cWZwQVNIck02L0hEbDBzR1lBdHluVDJQR1F2VmhROElN?=
 =?utf-8?B?dG9BZWo5MG8vU2JaeWxLV213NmN4RTNvVElsTXQzcVpBWTZsbzd2WkdrQy9p?=
 =?utf-8?B?M05xWUpzYm8ySDYvUlNVbFpPNkFTcTlOaDA5TWx3UUxDNGJ6eVpISkNUbVBv?=
 =?utf-8?B?SlkwbzV5S2ZPM05GU2U1SVZKV3FsUHBFMzI1aWtOQm9JYzFmRG9DRkdTS0ti?=
 =?utf-8?B?WU42YnBKRTRJUlYxMDNNNTVjZnlobllkRWJCL0pzSFBMeG1xKzR1ampKRTlv?=
 =?utf-8?B?ckttbkVwdGVrZjFjaTlPNEdsWGhvVGhrRU9EMXdYbmpqTmNEdnpYS1Q2MWlr?=
 =?utf-8?B?bEFTWWp1aUZ2SFh0bkZDV3JtUHAxaTB5b2NxQVFCSEhINEM3UUVITnlOWDF0?=
 =?utf-8?B?OHA5ZWRrUXBlbUZTemRLNjRCY3BDYm9ROTFaSkRBREZ6U1o3N2gwQkcrMTdZ?=
 =?utf-8?B?dmxaVjJoaTZoeWhsZk81NzB5bk9KazBUUkc0a3Y4SUV0RUFneThpWWxNVy9n?=
 =?utf-8?B?eFljNTVJK2NQSGJTcWZqWXRNVmdsbU90d2JvK29ScGhsc1FTcGc1cDNOT1pJ?=
 =?utf-8?B?bHYrREFBWnBBOTNMSEZRMFdNdExGdG5QVFBZTHRDd1pWM2ovUnlKK09BNk5Y?=
 =?utf-8?B?eEZEeHdaV1ZRWSsydjBna1VEc3JTaVlrS1MxK080ZUgzM2o3MzlPeVk1d2xX?=
 =?utf-8?B?T2ZFTE1vcTAzTEtqZFEzVmFOcndRSDcwem4ya2V3K2lSc0J5ZVE5MjRMSGc5?=
 =?utf-8?B?a0Vta29wRC9qdmJ4a3EyWDlOek9LOGhHNzRLUUMzUHNnUkVyTUk1cFZIT1JC?=
 =?utf-8?B?dVV0aGNEaTRzY1I2WVYrc2pDNTRSSlcyNDNWdTdWcjJuTitzOUg3WXYzS2RR?=
 =?utf-8?B?OWljdGZ1Y3hzUDY3UVpvalIrTzdsNDN1ZWhWZm54ejErS2ZVMjZ0ZEhMSWRH?=
 =?utf-8?B?TW9tQlJoYkdqemlFdW1ZRmQ1aGV3L1NUTkd6aWo0dnpQUjRsYXA4UzliZi9t?=
 =?utf-8?B?MkhacnVneHlJTlJzbDUwZy80Snd1OTFLS1NrVlVIQUptRGVEQW56RFRIa2Na?=
 =?utf-8?B?THNlVHUvb3FuK0FDWEZmem9wVXR6dWc1Q0U2R3BSeVhrdVJsMDBYRVdNdEpa?=
 =?utf-8?B?a0hqZVA3akFoaEN5TkVnak5XMy9wL3BHOSsveENJMjBqTzNOVWJTSmM0U2dN?=
 =?utf-8?B?RWdKVE93VU02RUZJalRQSWZsVlhKT1NiRGt6TktzZ2JkeDJtT1plTTRsbDcw?=
 =?utf-8?B?dHpxM2NkNGx5eWpBUG9hQXpqdFI3Z0V0eVorMFY3WThhZEF3THFOUEt0Qk1P?=
 =?utf-8?B?QnZHNjNQMDJSQ2owR09vV1N5NXc3Q0YvUjFQREl1U2VzMWgrUXFyV0QzdEZ0?=
 =?utf-8?B?WGJhZ2NkdU96QzVDVG5NYmhNY25WWlhvOEtvZ0xUV3NpSGdXMG9TaERVSTZm?=
 =?utf-8?B?dTVaVUlabldtNHYwZm82ZitVWmN5QVBqWkRvODZuY3FxVUNiaER1WnA1N2ly?=
 =?utf-8?Q?M2zhZPD86Dl1r16gGnYoJ09sjVtOvUnAvmyaq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b642d0b4-a0ba-422c-17cb-08dec85ebb4a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 08:43:52.9788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: monjWyoFZwEqLCwAVKMngH8JhdDrQQrJhaRPYYiIgOaQzsAadz1TUkSO3QDqPb+808/bX5yaEFw7i94EQ86jvCVD/wSdEYMWuIe4s6fFdahY+Pwsnnu93avhu3F4e9SW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12293

From: Peng Fan <peng.fan@nxp.com>

 - Introduce 'clk-scmi-oem.c' to support vendor-specific OEM extensions
   for the SCMI clock driver, allows clean integration of vendor-specific
   features without impacting the core SCMI clock driver logic.
 - Extend 'clk-scmi.h' with 'scmi_clk_oem' structure and related
   declarations.
 - Initialize OEM extensions via 'scmi_clk_oem_init()'.
 - Support querying OEM-specific features and setting spread spectrum.
 - Pass 'scmi_device' to 'scmi_clk_ops_select()' for OEM data access.

Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/Makefile       |   2 +-
 drivers/clk/clk-scmi-oem.c | 108 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk-scmi.c     |  19 ++++++--
 drivers/clk/clk-scmi.h     |  11 +++++
 4 files changed, 136 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 6a726331b6c9e..c2ae700ec0f2a 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -98,7 +98,7 @@ obj-$(CONFIG_COMMON_CLK_RP1)            += clk-rp1.o
 obj-$(CONFIG_COMMON_CLK_RPMI)		+= clk-rpmi.o
 obj-$(CONFIG_COMMON_CLK_HI655X)		+= clk-hi655x.o
 obj-$(CONFIG_COMMON_CLK_S2MPS11)	+= clk-s2mps11.o
-obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
+obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o clk-scmi-oem.o
 obj-$(CONFIG_COMMON_CLK_SCPI)           += clk-scpi.o
 obj-$(CONFIG_COMMON_CLK_SI5341)		+= clk-si5341.o
 obj-$(CONFIG_COMMON_CLK_SI5351)		+= clk-si5351.o
diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
new file mode 100644
index 0000000000000..be11d359b4ec3
--- /dev/null
+++ b/drivers/clk/clk-scmi-oem.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Vendor OEM extension for System Control and Power Interface (SCMI)
+ * Protocol based clock driver
+ *
+ * Copyright 2025 NXP
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/scmi_imx_protocol.h>
+#include <linux/scmi_protocol.h>
+
+#include "clk-scmi.h"
+
+#define SCMI_CLOCK_CFG_IMX_SSC			0x80
+#define SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK	GENMASK(7, 0)
+#define SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK		GENMASK(23, 8)
+#define SCMI_CLOCK_IMX_SS_ENABLE_MASK		BIT(24)
+
+/*
+ * Selection is based on SCMI vendor_id/sub_vendor_id and optional machine
+ * compatible string, without involving impl_ver. impl_ver‑specific behavior
+ * should be considered a bug and handled via SCMI Quirk framework.
+ */
+struct scmi_clk_oem_info {
+	char *vendor_id;
+	char *sub_vendor_id;
+	char *compatible;
+	const void *data;
+};
+
+static int
+scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
+				 const struct clk_spread_spectrum *ss_conf)
+{
+	struct scmi_clk *clk = to_scmi_clk(hw);
+	int ret;
+	u32 val;
+
+	/*
+	 * extConfigValue[7:0]   - spread percentage (%)
+	 * extConfigValue[23:8]  - Modulation Frequency
+	 * extConfigValue[24]    - Enable/Disable
+	 * extConfigValue[31:25] - Reserved
+	 */
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
+	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
+	if (ss_conf->method != CLK_SPREAD_NO)
+		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
+	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
+						 SCMI_CLOCK_CFG_IMX_SSC,
+						 val, false);
+	if (ret)
+		dev_warn(clk->dev,
+			 "Failed to set spread spectrum(%u,%u,%u) for clock ID %d\n",
+			 ss_conf->modfreq_hz, ss_conf->spread_bp, ss_conf->method,
+			 clk->id);
+
+	return ret;
+}
+
+static int
+scmi_clk_imx_query_oem_feats(const struct scmi_protocol_handle *ph, u32 id,
+			     unsigned int *feats_key)
+{
+	int ret;
+	u32 val;
+
+	ret = scmi_proto_clk_ops->config_oem_get(ph, id,
+						 SCMI_CLOCK_CFG_IMX_SSC,
+						 &val, NULL, false);
+	if (!ret)
+		*feats_key |= BIT(SCMI_CLK_EXT_OEM_SSC_SUPPORTED);
+
+	return 0;
+}
+
+static const struct scmi_clk_oem scmi_clk_oem_imx = {
+	.query_ext_oem_feats = scmi_clk_imx_query_oem_feats,
+	.set_spread_spectrum = scmi_clk_imx_set_spread_spectrum,
+};
+
+static const struct scmi_clk_oem_info info[] = {
+	{ SCMI_IMX_VENDOR, SCMI_IMX_SUBVENDOR, NULL, &scmi_clk_oem_imx },
+};
+
+int scmi_clk_oem_init(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	int i, size = ARRAY_SIZE(info);
+
+	for (i = 0; i < size; i++) {
+		if (strcmp(handle->version->vendor_id, info[i].vendor_id) ||
+		    strcmp(handle->version->sub_vendor_id, info[i].sub_vendor_id))
+			continue;
+		if (info[i].compatible &&
+		    !of_machine_is_compatible(info[i].compatible))
+			continue;
+
+		break;
+	}
+
+	if (i < size)
+		dev_set_drvdata(&sdev->dev, (void *)info[i].data);
+
+	return 0;
+}
diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index d88e78cc9a12e..2dd50c5b4ea8f 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -13,6 +13,8 @@
 #include <linux/module.h>
 #include <linux/scmi_protocol.h>
 
+#include "clk-scmi.h"
+
 const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
 
 static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
@@ -210,6 +212,7 @@ static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk,
 static const struct clk_ops *
 scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 {
+	struct scmi_clk_oem *oem_data = dev_get_drvdata(dev);
 	struct clk_ops *ops;
 
 	ops = devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
@@ -256,11 +259,15 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 		ops->set_duty_cycle = scmi_clk_set_duty_cycle;
 	}
 
+	if (oem_data && (feats_key & BIT(SCMI_CLK_EXT_OEM_SSC_SUPPORTED)))
+		ops->set_spread_spectrum = oem_data->set_spread_spectrum;
+
 	return ops;
 }
 
 /**
  * scmi_clk_ops_select() - Select a proper set of clock operations
+ * @sdev: pointer to the SCMI device
  * @sclk: A reference to an SCMI clock descriptor
  * @atomic_capable: A flag to indicate if atomic mode is supported by the
  *		    transport
@@ -285,8 +292,8 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
  *	   NULL otherwise.
  */
 static const struct clk_ops *
-scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
-		    unsigned int atomic_threshold_us,
+scmi_clk_ops_select(struct scmi_device *sdev, struct scmi_clk *sclk,
+		    bool atomic_capable, unsigned int atomic_threshold_us,
 		    const struct clk_ops **clk_ops_db, size_t db_size)
 {
 	int ret;
@@ -294,6 +301,7 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 	const struct scmi_clock_info *ci = sclk->info;
 	unsigned int feats_key = 0;
 	const struct clk_ops *ops;
+	struct scmi_clk_oem *oem_data = dev_get_drvdata(&sdev->dev);
 
 	/*
 	 * Note that when transport is atomic but SCMI protocol did not
@@ -318,6 +326,9 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 						 &val, NULL, false);
 		if (!ret)
 			feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
+
+		if (oem_data && oem_data->query_ext_oem_feats)
+			oem_data->query_ext_oem_feats(sclk->ph, sclk->id, &feats_key);
 	}
 
 	if (WARN_ON(feats_key >= db_size))
@@ -375,6 +386,8 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	clk_data->num = count;
 	hws = clk_data->hws;
 
+	scmi_clk_oem_init(sdev);
+
 	transport_is_atomic = handle->is_transport_atomic(handle,
 							  &atomic_threshold_us);
 
@@ -406,7 +419,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 		 * to avoid sharing the devm_ allocated clk_ops between multiple
 		 * SCMI clk driver instances.
 		 */
-		scmi_ops = scmi_clk_ops_select(sclk, transport_is_atomic,
+		scmi_ops = scmi_clk_ops_select(sdev, sclk, transport_is_atomic,
 					       atomic_threshold_us,
 					       scmi_clk_ops_db,
 					       ARRAY_SIZE(scmi_clk_ops_db));
diff --git a/drivers/clk/clk-scmi.h b/drivers/clk/clk-scmi.h
index 6ef6adc77c836..d7f63f36c56d1 100644
--- a/drivers/clk/clk-scmi.h
+++ b/drivers/clk/clk-scmi.h
@@ -7,6 +7,7 @@
 #define __SCMI_CLK_H
 
 #include <linux/bits.h>
+#include <linux/clk-provider.h>
 #include <linux/scmi_protocol.h>
 #include <linux/types.h>
 
@@ -19,6 +20,7 @@ enum scmi_clk_feats {
 	SCMI_CLK_RATE_CTRL_SUPPORTED,
 	SCMI_CLK_PARENT_CTRL_SUPPORTED,
 	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
+	SCMI_CLK_EXT_OEM_SSC_SUPPORTED,
 	SCMI_CLK_FEATS_COUNT
 };
 
@@ -37,4 +39,13 @@ struct scmi_clk {
 
 extern const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
 
+struct scmi_clk_oem {
+	int (*query_ext_oem_feats)(const struct scmi_protocol_handle *ph,
+				   u32 id, unsigned int *feats_key);
+	int (*set_spread_spectrum)(struct clk_hw *hw,
+				   const struct clk_spread_spectrum *ss_conf);
+};
+
+int scmi_clk_oem_init(struct scmi_device *dev);
+
 #endif

-- 
2.34.1


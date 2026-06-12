Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3433237C912;
	Fri, 12 Jun 2026 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781253830; cv=fail; b=ovovqXafihPUMPs4l3RC20rrNPWdNdk5JFkQ3cgalI0m+Iej8H9bxjr0OtGSkifoyIZSeSLuc+TTqmpULnsmyRNd0xyTIDvWrHawQ7SgsqkhG0BoTAZaaTJ+jtvoB0wZkk6oROIbQfENKJSmJEYOhqcKhB+2mg4uUcQ4SS/N3C0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781253830; c=relaxed/simple;
	bh=4CK/3bE0yn0NlMwz0Xo60VRXHlIkruvIuWlIRUz/S7g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=J1VaMSNHNowLFiTF6HaPYUKdlRElf0ObQd9bZvWgdMTBS1A+szKUhO4aBgQfl8V/DVMgga+SJdu+YFMmkX6smRP2ZvoJ+4Bm/P6HVBCdgA3QIno3fKWt9qVvuUKlKSP77MCcItmLqX+MVHwsK9vvSS5ylzWFWMWXyHcvCOV6q9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JY8i8NFy; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JY8i8NFy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kv2FVyOUk3H2xG00GCfKhHE8+Vl0EW6Sx10uEBSd8Du//pt/OEaJbwFvxLM1+R+C8tKHIz3jylyw8ED8Y0ksKHsCYR4DMqFkrv0mbMBbKnBdjGsV5x4jJ+FAdthyiIXaFGyo+GEbHxuxTg6AFl2G/oyzW4ojSE6Meef0+4PU99CeUM9wOeFa3jtZ9h0GcXK2V3oZvzoJOjp6sM2NZQeXmtRZEeNrhePckwDx3D4ip79IrVYjW2a4KduzedMAqivo3vO+0nlXOj4deD/8m9atXHWvt0bsTZdVkI7N2e0shC+/vuG34JybUMxePTID3h0V+BYMhj1+8JvtJr9TUOdFEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5NVoMvtQMK61916v8Blqy/6+Zj8q0q39lvdVHTpHRo=;
 b=SAcDuT+OQKzN0dpl3QORnyigDaHyxvbLnusEs9sagZZND1VDlW3esIFmYSrljqykP1Dhx5d1Z43Kf3s7FWVUuKp3TpUpWdU3P8ub/0xCAC4CMj/M2/Z6cHbutVwBSBPpJfAh2WdX234k0KstpyV5T1JZYq4LQKmZALidqk26KOIGFc0xjpdtoMru6gwS3WVgu+C8/BV8IA9/JEPeJOfLgi2m0XmDVIFrJADsrOc7PF7Ni3h4zSZs/t/ZOaI2N9R4IEhp3I7f3TB8ccYb3gUF1USC1Sx1QHmUppEjKKdy4y+pXPF+R2NABMNLNG1R/+bJn4GFv5A0FOMdaipfGs6zVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5NVoMvtQMK61916v8Blqy/6+Zj8q0q39lvdVHTpHRo=;
 b=JY8i8NFypTC8yistjJ0U5SY44EKpAdB+tczSRnBR2LUtdsXUC2ngkd0/cQOjfKsjABQyCpiuYsPNfc/aNomae73Rmm14nf+0a9Clj/eNL3fczr4JoDB8R1i9e4rbSumhYHZIpzC6tDL/F0/KGnYG5dU/EyrukddkLmyvVJ6CG8I+5dPf3TGNv1/7KAtDlJ/A2qNibA1ZPhYUXmvgCokb6d4+kpAgXYYep9ywdWCeL239wP6poFayg/7slkOHYAcUAc9uNAkoqOUvOyYudB9GydFFZE8dMESbNEC9nJXJZdOI7DxUO8x2TgQw2vpTXJwIlQ82am+eMTTsIsW5YQO1Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB12293.eurprd04.prod.outlook.com (2603:10a6:150:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 08:43:45 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 08:43:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Jun 2026 16:46:27 +0800
Subject: [PATCH v10 5/6] clk: scmi: Introduce common header for SCMI clock
 interface
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-clk-v10-v10-5-eb92484eda38@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB12293:EE_
X-MS-Office365-Filtering-Correlation-Id: a69e72f1-bd69-400b-b9e9-08dec85eb668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|23010399003|1800799024|376014|3023799007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	8ek7fHRPFuH0SDK/eLPGQL0riODuq0RmKe6qF3Eu3fzR+Yp01a4AV7/Ra+13f7GSRB6l9acR9kQ3g0VCHwcQdev67ET/+xQjs2ktwWEB05rDytxzSS4kdMRrmiXSiD4oSoGZBZJ/DUeXxLcONPdWmR6Ow3HqxRBryeGAni8AtG5DTrY3Az+53MgGSqVqMplgFlOqy3U9jfnJ+/dJ3q9B9+RGBHU2QPXd6FXdBTVt19xnoD/t/bDwXKkJgZG4Nbj8/sX4Az4voQM21nR496CEXcp5o1asfWWHX8WmCODZD5LXQ9oOq81xXq3AccqAX0yQzgrWX+QEyS7PV7KsBQuctUZrILlEmCZByLRIKDjsizStWbGTwqCkAwyb7fZ2Z5c/bLuDBQCJuJBvC6TH3YHommAHY3+emUGizbnjBzANClDH0Asb7d/jRz6nLl3mZhLp/WDu2HJM8TYfGR6Lf74VD/+hVD3xpju1y666M8rlTdI8Nvvfh4xMeEFZrr5PIE49I4G2CeL6w4bB0dQc9t4wiiPqsoXf277xpGf00JVDnR9W1BcbSyK0SZJvazVsAIdfz22f75weUCibE1R4m5tkLxuvw4w+UkFPbdOZMnzojd3RGMBRVp1FK9aHR1ljlD8/vovh+OE0+HyHWQIXPi1+m+fP2FkIj7/AfY3SJ95Dbtp0XeeMVwS/K6CErfheDu0G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(23010399003)(1800799024)(376014)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3RmV1ZiaUNYVzZtOVN5V2pkQXUvTC9WRWlWQkdUblh2RnhrUlpwbnVncXU1?=
 =?utf-8?B?cGdyYUJSajFWelVmMUhyZXFvdFdhL2JRYnhiK1ZHTkg2VFNORkxxbCs2NXBt?=
 =?utf-8?B?OGhRSU54ZTVyNWhFOHBDd3d3UEU2K2dxeG5QUlVJTGNjbGtubHlrS2t2clUv?=
 =?utf-8?B?MmF1K3hTY09COGpmUU5IR1laNlRZR3ZnS0NSWjdRemUwazk5S3U2bG1Bdnli?=
 =?utf-8?B?dFZ4NlM1ZjhzNlNwOFFUUmdnbGxJUlV2SE5Nd20xa0JYaHBLbkRCcU9Kbk5Q?=
 =?utf-8?B?K1FsYis0WDYyd1YvelgyMGM0YUdQdks4S3RqQ2dBZTBpbHNCaERJSEFpRUtT?=
 =?utf-8?B?cVhEUU5WTFNBaWV5S0Y4Z0hwNUhSTGt4SkJTbnpZRG92RWEvTHJ2RlYzR2c2?=
 =?utf-8?B?RkxZS1NNYnJpOG4yYjllNVdsKytSY2l3UWxYbWpKSDNwRmk2VElqbjZrdjk2?=
 =?utf-8?B?T0huWEwvQW56OWNKR1lqdDNWK0RxMEZGbzhJcmUrUW1rQWV4c3JMQ1MyVCtT?=
 =?utf-8?B?R2tIRE5Yai9rYnBKY0Z6dVFFSXQrODVESWVVMUh2WjFJd3d5ZlFlSnZWbkds?=
 =?utf-8?B?aUQxM1F6Sy9IVGpsTjh0ckwvT29Fc0pPVjc4NDBpMzRlaCtnaDd0aWNRQzd0?=
 =?utf-8?B?Y1VOL2hOdC9YT2p2Y1ZrSHUwYmRDZERkWGZuT0M1NUx6cDZWY1RmSmZTRzVC?=
 =?utf-8?B?eVc0NzNsZXp6c0FaUlJiUnFyNnNvM2l0N2ZaUEdIZDQ4QlNhcG1zalBUT0tv?=
 =?utf-8?B?Sng4Wkd6TGJoQmw3elNHaWUxYlUxNk9rY1pVRnorVjluOEpSaUZ1T2RsNGRL?=
 =?utf-8?B?OFpsNXd4WmVHd1FUQk9MY3ZYVmpOWWprTzNJSC94SG0zTFFwelhvK0pkaU1L?=
 =?utf-8?B?V3hpOGJMZS9wRlpBdDM3dWxuK1BTWlJwR0wrelppZmdkaDdaOG40ditBejF5?=
 =?utf-8?B?aGhpUEVzaENpK0dXTDc0d2VJM0VZdXl6M1puYm9IWWhkV3dCV3hCeCs5OW5s?=
 =?utf-8?B?WkR4ZE1QcXE0UmpKbXNxbmZhcnVzZ1J0andGTys5dklkc1lrRHRUcjhlOEdE?=
 =?utf-8?B?dTd0NUFXTE1JY0YyVjJOYm5KQzUrTGJDcVRoc0k1Y0t6MDUyWnVPdDFlc1dv?=
 =?utf-8?B?aEt3bzZxamt2Z1N6YUt0ZmN1YkFhellnejRZSTJDN1UwTzdpbDVZMFE1Z2JD?=
 =?utf-8?B?N1lKTzhnd2FRMW9KeGd5NHhTb09sSGZZNjVWUnljdWM1L09Db2t4UXBMS1o2?=
 =?utf-8?B?ajM3Skwxb3Z4SjRmcTg5S01kU3ltWnMyZTlMdW5uV3pId014ZmR5MlV4R1Fr?=
 =?utf-8?B?Mk1yNndxcVljUG9yTWJMVXplYUR4MEE2bnhiNEhqZGdwTUQrcDg2QXVUM25R?=
 =?utf-8?B?K1gxdHdKMklFNmVqVXc3VUtLZFNKZXhFRmlaTHJDWmI4NXlOV1hGUzB2azRJ?=
 =?utf-8?B?OHVudVJsQXNjUXQzeStQNzA4RU5ySU9jZCtYZGtMOVJGZHVOeHplU3FFdTFV?=
 =?utf-8?B?WEQ0dG1uSkp4WFZNRE9scFZjNmlHNE92VjdvZ05VdGovaWg1ZGRreTVkTmxl?=
 =?utf-8?B?TjFEblVtMGQvbEtaUW4xR21LRHFoY2JGQi92TThzMCtYMWVQV2loenVtaDFU?=
 =?utf-8?B?a3ZiMUFTVDRBTVJSRXQ5ZUtqemd1enhxK0NudXFUQ3UxZG1oT2Q4bG5PMkV0?=
 =?utf-8?B?TXBMbmw0TTZCbHhndFRZc0VQYzRxcW1GRS9sazdMWGxYRkx4MCtxVzRRM202?=
 =?utf-8?B?VE03b2Nud2RsSFhoR3hqcnQwWCswNzc2bFQ0WWFWa1g2UlFiZStlT2RLbjVE?=
 =?utf-8?B?RmVhbG1yU0NEUlFJUjRwdEdvdVEzUGxKdkpqYlIycFlxaGFxQnR3VXVzbXFW?=
 =?utf-8?B?WUVDQTZmSitERkRYVEIzVW5VOHpiaUE1SERsbVZnN25uRXF5WTdMSTRvcVFh?=
 =?utf-8?B?OVVnUFdZUTFLSDJSdEpkY3J6aVI3R3JiSEx1WkJtaWhkNER4ZUJIYnUxdUFT?=
 =?utf-8?B?OVluUE9TOE91RE84QWV3YUdXNUlVRWxWdW1tMnEyMUJoaUQzTWJ6YzdxSkJs?=
 =?utf-8?B?N2pEVWtQR0hZREdXQ1EyeHJkWElxa1hreWtNekNWWWJIWlVkZ1YzVGkydVRa?=
 =?utf-8?B?TXdFOEE2eTlrWGx2c1lDbU5Odm5WOFhkZTMvcUJ2VmRScW5KTWJCY2pMZzVy?=
 =?utf-8?B?dXhYcFF1TlhKUFhHTWVXY1hTTW1nVkU3UDV0UzFIRkM0cGQ1MUlWdi9hQWIy?=
 =?utf-8?B?Y2hpRXZkdkV5QkNNV2RrTXZXcUIvN0RXNTNZQnNYOGdSQWFZNVVJaHVESGlV?=
 =?utf-8?B?VGF6aFdXMjhWOGNmT0dhUWlQNHMxQmFBaE5JbUNYam5TSHBGcysxV2tjVFhi?=
 =?utf-8?Q?yua2TpvgQ8QehrHMPQo6aaISumKIPddhqIKjH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69e72f1-bd69-400b-b9e9-08dec85eb668
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 08:43:44.8602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9LrDnspetByCoIQEh072fw4lkRmcrS5Y8DH8fpdD8AzeRH7bWCxhmE8BktbFJoSBItnj+PBdaTOjRWdLrkBRozD6SyYZkxnegkfSGd3QuqCOZ9Np03X9Ie/+X46WjZP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12293

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


Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFCD3B9933;
	Thu, 30 Jul 2026 08:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401554; cv=fail; b=MzavG7xx7Y0v1NpBZr43OoHNJPwKyStJ8IGsjUWJoy/f9YrigQ4RzDapBv/31pnBWdEwJF93Blu/5LR6agGZctJ2RdgeUFZa5VauEZA+Xp7kqoyh3WMr1DjU8/cpF5UVQ6PPn55zzAiYsEG4p3mlkxwz4Uf0Sry7lY5W9hgZuRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401554; c=relaxed/simple;
	bh=sXTWuiAUtdTQ8EYaZdIp4qXCknIRQEPXqTzWQQ4qzvU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HuVDpbdHD7NjfDSqhfe1+Bye713LXkiPnISvWKDPlP0nAZ8jCUyJMIUW4fXTBVLJFADGf/uM/RpdAq34ZMKMrrrX0+ejDMILH6rIRgbLruSMKfHyLs9R0CMcsp5IToTMFCzzJYZz3Dwn2Gxuzy3TlJEXUqLHr3GiTYgnGuTEW6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Veveyjvd; arc=fail smtp.client-ip=40.107.159.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Veveyjvd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kjx2q17dzSuH7gbfFtvDIyUKqTgJOj+b+l3klY5KgfY1hTI5lQrSR61NCGYpd9bg9mDklFrs7c2mT136nEDhTYCLBYswa5PIuI5ltGo6Rp3SZAyTYlQKRigK/GXzDSOAeB6GygOVyQZtEWKYfeWVtqBZfZkFJP1LSQYXTwJIjtRKWErgiBZOcnygmmSpRDOCNUetU/QdXFnNwgkYN1XAR1kSzR6y6CA164wR4OjJ5QlgLVKEgTa3FWXBq7GEWN9x8dVfJHiF3lRcRwLyiNgmFp46Pq1Fpf7FPc04bG0zyMeNSEdH5lT6IDrCXTn2QJVgBRs4MlCt1OWll7zVyDKweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K//e3C74QPpak+5fLiYo6my20Rnu2TirGxzMwRz/Vxg=;
 b=EqAdJmo6pc+a5ssi4s9T/b//ZCFavoyeW2xxQjnUlcPdlWi0eM0WPC26vLwp20U3LxJTmLDa/XSTXdDiqgcA0CKNCHP4WEcThHKLs9acrkV8DVt/WsQi+Uu4RiTBpYMMTl5zKqp5vgIBxMxmADn+0jSEgDEkE7Hu/eCUxaJXGfTMQiIV3rJJbXf0aFZowjeMzTzUIx+7VF+AFGq6eFAbo9ep4V6CgTLH1ooK3fWKUVxPHjRBRnaJ8KxaA8mSIWfxP8G4fBVgHRj+HPf8oRVRYQioh2YLrgqrkQjHrx9eNGh2zIVLuhIn3jCcHMd+ks0PIm1d0/KPjEtRdU2TRIerjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K//e3C74QPpak+5fLiYo6my20Rnu2TirGxzMwRz/Vxg=;
 b=VeveyjvdTLw7tNb8cXLcMUMkedTS+yPgUyUcQsxTTg/IdS3W+ytpgcqovQ0ZBI4WltLtSXBWEUzpOg8PSCYSMEGkL4crezDM85zrCJqdJNt82Thm7MKZhJV54vkNKOAt2VVtev/dkEIV+4A3ASXMBpxR76SrD3DlfZ1SfnD0Pi2I8YjWd9sjsiWwEVITAWtwD1D2qCvKICU7ej1eAEmE5Zl2OoJt88VO62RS7StoEvVjzetZBoSef3KDsk4VSBMqSNWjFsAeyT0lB9QoKamDi+dB7YEuQFGzfTDtmQtTPTv10cBvac099nwl1oHxUrqhBvP7OCwJYx2o3xzncNJXog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by VI2PR04MB10786.eurprd04.prod.outlook.com (2603:10a6:800:274::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 08:52:29 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 08:52:28 +0000
From: hongxing.zhu@oss.nxp.com
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [RESEND v1] clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x PCIe
Date: Thu, 30 Jul 2026 16:55:42 +0800
Message-Id: <20260730085542.263025-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::10) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|VI2PR04MB10786:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f4b47d-9511-43bd-0e3f-08deee17e27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|23010399003|1800799024|56012099006|11063799006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	ND+JCZxXuNsCFg66aPYVGipFO4x8mDlL4Ok6llQWLTI3P40Fn9nc3RHQ6ogYIyoOOyroWxNeYp5NkyJ1TNZZDayQYVxDVCeohg6LuN6ymPiAAIsWyTd7CN+zrZsljqUrY4IV36n65M5ZdyJfqOEK4nOMoBHI791CTgG0O+1b2eyrXSztfYGHAj3AO+WGCcJyQEy5eGQMMDXRrPsTbjcS4eBcGChmZmZLzsF4TgD0rE/s7F/64FWbz9fz4Q7yS4/p+P5YnorUHzl3Ik9daQF0dNDU7HuN9m9OcOtmvxHgM0c0E/p0LDDghsL4ZMcjOc/gh3GBMKtYc0uJkSnBj2ZcT1IMchsfx525tyVH2QwOtfPuAK2UMcAG4KTCzb3tRFfKZDAN4D7td04UH5edFnbiY+0SO49PDhnJ4uQBvlrvlVcf+KAWziR3uENckeWm3s0CJzOXqruvCjLYFtRfLAlsgk5IBStq9N2ZAFUMjrfzmZXVZij9gCFiMsOieKSXBU0l49M1RH3yJwnlcQ25gmgZlgEGWChf05aKNiCpe1D77VYiJ/vjgnRmoSwx4sOI1eDd/MKDa2jybKn8V/C68vH0K9MPusPDgGFU1Kj3QqPa81bspaI2lJTgatcBPahJPyxlt8/NdaQSbf1fdbkZlLMiwwbVEcpxiNTb1toOVsBb12M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uvV9xHpWUu//EJkq45x0HY6g8DvKKLQlK8ltFfua07PaWv4w6GaaTmo/mZ+t?=
 =?us-ascii?Q?FJLS+p7O+QbGL8xEkYn4XBnXaWHyKep3E0zTMDHx5Jn2IYABO25QV+aaSL8G?=
 =?us-ascii?Q?9Bpe2OPGi9eRS4samzay+oB94z6BQdqkFhy8L8P4IQ9zeCcFPhiS2UkUVLD/?=
 =?us-ascii?Q?k0dwIn5MvPmvG6FzPcaNKmvD8xCW4I+V/3lKSeYMN8C5xdjjFK2teTb1GQJw?=
 =?us-ascii?Q?vm7sgrPx8CncUuYMNaW8KE3Vg8Lm+y+zB8klKcDxNWyVl9sTYNyeG19F807o?=
 =?us-ascii?Q?PSGB+SH/O1VClk7G1l4t78CdWLe2+bzxxUmL+Q8hqQbkdovLo4uQ61FIhLIL?=
 =?us-ascii?Q?rS7d+9jKL+ycHaDQ26BdIstz4x1JvLicgi3av3KNOEhfStE2VKMAoH+yWtH3?=
 =?us-ascii?Q?LsLZs6yv0OKHkgr9CyMTBb45TZW3ok/jCSoCyJO1d5vgISPXi7CkELFCzGhJ?=
 =?us-ascii?Q?6tzuU1ARwjmT/KY5eHOg5NGhB97/KpItnv9keeeSLKHlbl0wYKN+fQw+8lDY?=
 =?us-ascii?Q?C92bSg/XBikMARu83/TWriZGs0U7/sxTQ+G/hrIFlRlUn8QFu2T8w8g1oQqc?=
 =?us-ascii?Q?iH+kvdJFNdgCZzHok7pgqrvzkyg5OMHl+Cc9grmW0TCj5j0BVBYLIxnTe3nE?=
 =?us-ascii?Q?GZGUxQWpinaMLi7dGG4rz2RilzCNih30tXO2MadE7O8rFHWzGHSVlzH5+AFp?=
 =?us-ascii?Q?fcph6gWMZMkPXQBltyvottutd+yHRBw6MYX6fJJPCf42PDLTZEzcSSIENfSv?=
 =?us-ascii?Q?SMy0DrR4U4dkJ+Amt2xOmE9y0WA4hb9NQxnx3AGpwkNhyaEf6Ws5rzpr79Cj?=
 =?us-ascii?Q?NSTRamfVUDLQd3U8UNDNI/+eTO88NkvGPlo0ihZ9xwwOjK3fRC1jhmycK+OJ?=
 =?us-ascii?Q?tC+PcjYg1BS4rlknYmyyeOqjpNBAWNsRibFRZ+EsbjWdlrFqt9hvIVWs/g7+?=
 =?us-ascii?Q?oHEsAITGlr5lSnnPzv+PqP7owPB4IAlHO8M8o2P/Llyt6/euNrlGzyuYcB5M?=
 =?us-ascii?Q?J3hpcFQL2YEpSABSQEGgscMTCtlAx9KlEB3my69xHckdcfCvpr3XgKzUnRfM?=
 =?us-ascii?Q?Zqx0l+LAUBn3toVGvC4tQY1BXo0N8VjgbybeaNOKsEm3IeqHmFv20ImT8gZi?=
 =?us-ascii?Q?xbHNcRAF2Gw0MU5Z0ThdhxMXQ2Jqi6287FPp4s1YHYRmz+ulGDXlqDcWG8R5?=
 =?us-ascii?Q?vR3SWFro2agJ/mwgu6oGbxrcRhztK7dH8sDqcSo/ZqUl4cjm9SAFjIjPFSkW?=
 =?us-ascii?Q?5Ojg5eJErJBdUkZ/Mz5pyH0Q1FohAjqLdINh8NhIX1nC7Khhn276nVQs/Thr?=
 =?us-ascii?Q?NwXh/Gf1NpzYcwWKHZkCrvJ4P7NfljuJ+FGKYKSdKs7MTQJ0dIZhNcrh2AZ0?=
 =?us-ascii?Q?tHMPs3rSvU8v6TjYennofrdAhm0k8j4Vk6vUeI69Id1nJMrtWbBpYoWsrDtq?=
 =?us-ascii?Q?JXlvlSfG49qaw5XN3WgLURD6H+s3baAxGhppuzW3AoIheSh4DG+raSSCOT+7?=
 =?us-ascii?Q?t4i7KptYwEljyqhUmKFqi1WAfPkY6T7THjQHv3deK3vBbHawvfDRf19vxkgj?=
 =?us-ascii?Q?5bTOP/UJwAsYDEA/d1dVEffBeI163LC5dYbqYWaaIZ2FQI9KqLp1d2OdC4sF?=
 =?us-ascii?Q?9w9Lh90cTg0mzog+timJCSzxVV7VnKvbJb44Hv7uVctH75kdZYCjHiyjfofv?=
 =?us-ascii?Q?7Ad9ZC7JtCC4zrVFSv0+6m1ZyZRsn8jSCkv3/6EYInkXCTVnOKgfH1IiSRAP?=
 =?us-ascii?Q?pJBDr05Djj4nmOPZBzhpO2jIQqjdC2Mz0uCkcbWE8JmcmP9CzJzG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f4b47d-9511-43bd-0e3f-08deee17e27f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 08:52:28.8173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gm9pphA+Jt5taBkv2i6h+VUQD7R7+PwUA2/lkaB+M6CLVlbmx7BH5+VCMcGyfu6nmjVFaSMQPflr9mdPSu5uoJZ0ZRYKSgrANzt7Ab3j2naPBZF9fcBtH7WrvSn6FjEX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10786

From: Richard Zhu <hongxing.zhu@nxp.com>

Add a func_out_en clock for i.MX9x PCIe to serve as the parent gate clock
of the CREF_EN (BIT6) gate clock. Both of these two gate clocks enable
the output of the internal 100MHz differential reference clock.

When the internal PLL clock is used as the PCIe reference clock, both
BIT6 (CREF_EN) and BIT2 (FUNC_OUTPUT_EN) control the PCIE_REF_OUT_CLK.

If these bits default to 1, the output clock is enabled. With typical
100-ohm termination on the board, this results in approximately 6mA of
unnecessary power consumption when the PCIe internal PLL clock is not
in use.

To eliminate this power consumption, add a func_out_en clock gate that
serves as the parent of the existing CREF_EN (BIT6) gate clock. Both
gates must be enabled to output the internal 100MHz differential
reference clock, and both will be disabled when the clock is not needed.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 56bed44719954..1f9259f456079 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -286,18 +286,28 @@ static const struct imx95_blk_ctl_dev_data netcmix_dev_data = {
 static const struct imx95_blk_ctl_clk_dev_data hsio_blk_ctl_clk_dev_data[] = {
 	[0] = {
 		.name = "hsio_blk_ctl_clk",
-		.parent_names = (const char *[]){ "hsio_pll", },
+		.parent_names = (const char *[]){ "func_out_en", },
 		.num_parents = 1,
 		.reg = 0,
 		.bit_idx = 6,
 		.bit_width = 1,
 		.type = CLK_GATE,
 		.flags = CLK_SET_RATE_PARENT,
+	},
+	[1] = {
+		.name = "func_out_en",
+		.parent_names = (const char *[]){ "hsio_pll", },
+		.num_parents = 1,
+		.reg = 0,
+		.bit_idx = 2,
+		.bit_width = 1,
+		.type = CLK_GATE,
+		.flags = CLK_SET_RATE_PARENT,
 	}
 };
 
 static const struct imx95_blk_ctl_dev_data hsio_blk_ctl_dev_data = {
-	.num_clks = 1,
+	.num_clks = ARRAY_SIZE(hsio_blk_ctl_clk_dev_data),
 	.clk_dev_data = hsio_blk_ctl_clk_dev_data,
 	.clk_reg_offset = 0,
 };
-- 
2.34.1


Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013008.outbound.protection.outlook.com [52.101.72.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852A213B7A3;
	Fri, 10 Apr 2026 03:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790950; cv=fail; b=N9Dyap/is0cafUbjGa3YFrjWVbu9Lhe1moqIxquE24PAszY0AL2EGC9a+2aoZ0oDzBjHf9F5R55lG7AV6pkCNxFbzdmhTvWEl63Sg992A8jVmPto7RM6WICURJCZsrF77Iuzm5uvJg1o5uqR4f113Mm97OcQG067fXlC37DJAyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790950; c=relaxed/simple;
	bh=mztDw/HEbSGVZLYLgqGW7bL5e1+dJ0h9vGbMPiT0+Wg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=G2pAe/3x1+Kx2s2nUgLWrw3HeIENu0p07K8M8YmtABRQkycf5g0wiU7h6UNOcL5iRzWfNNiH1p131yjRBoynxvSFrf2SUJ//1PO3HL3lQJaj7eQooeVjW/OMB5Pusq/zIE6fGoV8boovkyGnL6K8n61oNQQGVF5KtdPncPk1c98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gb4Riyba; arc=fail smtp.client-ip=52.101.72.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gb4Riyba"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3lx6pjkkdFfy9SVHwm1t0spOP6MdWdk0Q8Oxhs3OqergSqZgbaIdbKaVeKpE8IB1SchlXSRdPdt8Gh1QwtV4jpbh3Yag3CyrMCNU48C4ikxUTxnNstI3VUM+C5zAgPjc4SW5B/XTvwg6HX/wtVAOsRYXwVzSjPRmVxyotLny0/liKFP4v+rAL0DB+gSTMyI1vErWbaxlRQRoDQ/ZBRhSmTyYbg0P9YnyrVHzsmGgp6oemJUdSxhxmWJtyde+5wDIGudenJam2qrBVmx7e8t8z8hYQHsyVExggpC3klmreotAHjYATu5uQ4k4+LnlhHnVKV8df8cofI5RR3AS2irEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmL9UpavVjEYFNKryF6KV/LikMpxuqEqdZ5cRN/zxdU=;
 b=pF2INOLNqGaLS92gNW5iMQ629mc6PrawRh/sLSjxh+l+TbrD8phJT30kbtalwF9ywhYYNW7aTaiMYYqbFUVyHbVSnaq1ZQcig/pTR5JZL3EdUlNq5eAme/I4lqA4sW0GjLFmcTySDhffDGvQHrTCrL2gwgQMKzqSwJRXL2Z7hHir9eoudpa1q9wMG6L69IHG8NQM1cDwFKOY4zKGy0pyHnExPObK/jmCucmcOqKGXFpYSfO7Hj9koy/pJjcjA7m8uLmDO4GEHkLjcqtybfpea9uTAaZmnfnFjVBqVD281qXb9jHMXNCdzlmfq2yRshm5xpp0q06rLD5SAD2hkvD0qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmL9UpavVjEYFNKryF6KV/LikMpxuqEqdZ5cRN/zxdU=;
 b=Gb4RiybajgNZ33TIeZExf4jkb/J6SBKnlWKV+oypUAAsbLZRi6fhUm8JPFREd6e7ncdWxIGyxjr6TrtHxKr5xHjno3q1OkSTyWxkM1JesmVRgZ/LPdTP7f0SqXCGylGlD7kKEXe+jYbdG9041+tV/fUpRhsDRcFCS8rRte5guZHo65SkvcLmi0V1WBfkBrZ9A8WEixLmKLIpclXWQhSbeDAxm6wbbnfsiqMDVwhxZGX6lrP9OnKShrdSBVyr8Nk6YW8eJW7N/34ibPr2x5O56L1aeRcpnuRTdPTjVnFWNfrxoc0DSHGvcCVYCy1CJMneWEePayIAPZxgPkneJy1FTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AMDPR04MB11606.eurprd04.prod.outlook.com (2603:10a6:20b:71f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 03:15:46 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%4]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 03:15:45 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: linux-clk@vger.kernel.org,
	imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1] clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x PCIe
Date: Fri, 10 Apr 2026 11:16:56 +0800
Message-Id: <20260410031656.2578632-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0231.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::7) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|AMDPR04MB11606:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d3d0b8d-a3a0-426c-70e1-08de96af74cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	03PBGURpLNMyYneaUErtU7+XSOQxGDPtYGgycp4tolnHXKdO5scED5ADRUgh2S0YCfGQLIz1PY3fyotLg2lILQkhsNyrEx/4h/CblegOzIYOzX+hvehut/APM1y5XTOYN8mqXo0vdwmRpCLjJFCMEA+6Eh9B/mWholpLl4N1VMtiNjRABjOhGJZhgdMjMasBH/CGYpToF5OR9XxZ2GQgFUlnXNG2/cv6dRfU+y3Z5fSIHiwdOQamnmV3kSdSadH0gd1w711y1Q2jDvHKUqEYi5KUdHrlqsBUSTNH+m26CGdfTsUpbuwDcgeRyVJmTEKSf7oAT7/w+SJEJ0h8Yzi4fkAg/2z0uScbrly44PYA+gcOp7t9Qhbno0pI8bykW94ikWlkIFM5r3WKApfuZwux2xInGeCzO82bHDSUa/SLUM36kkto9GZqJ0X+iIpc0wlQJWlINAEElCx9r4q0oEXuenJvteCRQPhWNrKqR1WTjoSBSX7uzBRD1a1PQyRu9gLQlVrSSQMZ8ZwU+hy3GVAMOBnv+Wp+NW/59LZNoc7KBTz/oWxdXaG3DSUr96xBBohLBrpHCet94vCJcRyEatJq5a6G0vivOmJ87ilgJsky4jcOC8VFUSRYMB4Wkb/74cuEYa7x+Y+C9YRqpOrCdJTE6y1Yhs3DF5L5Zm1ujRR03GDvydOzED7e9S/QM0UOQmKP77V2LT1hIRyNSjknrBKysk+p5zINOFMjyy5ihzSpOystlKrFepYreqzbTqrJzbcJQYPhPbNRSmrzkmLSRmlDx1jKBuvm3tZrJmW38/rjjcE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iqJe3HvqmnWBBrSPyM72DNEjdEX2AY0RJBC4kOqj4KZBx4Bb7o34rCy+BUuk?=
 =?us-ascii?Q?LvJIfs+Yz54VzYWZaBOM3V+z6Ox/l7twjkJKfbL80JgIEA78N6OuMtBTPf9l?=
 =?us-ascii?Q?qQO/5m3QrExYQ8gv5mrPq0D6HdWRZi+Ksg3MPMNfhhWqi9pdI0RjE85M5myU?=
 =?us-ascii?Q?R3q6aL8mfpD8GC0OKkmaMrqbSMfaUXeiRT/bt1IL/q3R/2VPPrOYajWCKh5s?=
 =?us-ascii?Q?GstvMOfKu84wCXp+CQxYG1YKdlDoOAvmSmc0W+P/LuUJ9kGcHrM8KUT4gVfj?=
 =?us-ascii?Q?wIt+VC4hOfMSKjASo5IMgrAnQNLrZEjeDOhetUZoR6PyH9bEbkdlM1e/3Maf?=
 =?us-ascii?Q?ddzNVXFjE4KMES0qZdoWEPfBzj0j0Dn+Pb6hpCELLmbIpuZHNd0ueC+rhsyF?=
 =?us-ascii?Q?G0E5sxqUldUZixRgxmibWlh/mtmYqo3Wc7SqjJJaqgl0W5Z32fl6+I5SAAR5?=
 =?us-ascii?Q?mETJ+LBn2Iic1ccKE0oLxjG3v7p5wSlOvplkL8NWLejyHzlBGYUsvdfDquU9?=
 =?us-ascii?Q?IhwR1CtwF8VY2rdLgmY03ZyK4mY282UD1ZRoJ8D+NjWkVgNcMfPo8nuO7wK0?=
 =?us-ascii?Q?KJYxTpM3F9DOQK7vLTh7gYtnXk7aB0+lXCTcb0CT0FyVZhyh1ZLZFmFD8GD7?=
 =?us-ascii?Q?PqZ5DeG06Pv+suLDnilkGar5RqLuuzSFb5OUEeA+sLYZ56LeyjpKVnp1KhFQ?=
 =?us-ascii?Q?dK5pEM3+bjz7bZJVgo72i9p4DcjPFpQSkpKZcthwl/vwA8Lv5QHuPbe5UX50?=
 =?us-ascii?Q?0hzutNHn10rw/lLm2mEl91g41EgWyGrKn5NmKCS22hv+497eXtq+50Xac2lN?=
 =?us-ascii?Q?7hMqHcRWx7coPqBt6h2He24oGl2Fwr2hZNvGBbSyGlr3GnBYBREgsOS/zxa1?=
 =?us-ascii?Q?YG3JIlM7VTZlZ1E9D8mmE4cfaKYFe+aUf7VSqNOJWKlpy9jk1lgDjDcfdsIp?=
 =?us-ascii?Q?SFo21WrW2ahdzRW6NX1M1bYiAYkDiAnqdMwjuOhpJZrafxz35WhOa7UbpUnP?=
 =?us-ascii?Q?ngcHdDmRERP9h4fXB+CGQpx4YtjIVJEMP6jDJp5DyCGs/0gIfoHse3NziPwV?=
 =?us-ascii?Q?a8KuHx+2LXAEKxB7o3bEUj+3CXGFBOfu+idd2qHu+vhiM6BFz/7yqXKi49UI?=
 =?us-ascii?Q?3iW7aJP/WZb5j5rB6r/FLE8b6OSJrHNev1TXRfUImlcD0B6zN93+XjjbBG3z?=
 =?us-ascii?Q?QInIrtRpkIyJWAfxcayeJCD2wH2bmS+zJZnQTZsXTThkHw7ebHYbvLjD324O?=
 =?us-ascii?Q?B3LijE1disaZOG3K+cWk8PMAu0e6tf7BzCY86t/YM1vcysNJpehyu4zcbHhy?=
 =?us-ascii?Q?KbM1HcJdymJ5Tpa4M9FJZcHU5sl2J0TScZgL2PQ+d4iJltig0oy0YHM+mmB5?=
 =?us-ascii?Q?/r2f4urn3DO94QByaBUKojFcExvkk15zRERdbcsedO6EY95uRWBUU6RMPS0y?=
 =?us-ascii?Q?FRgFHk8P+Ue6l+PhF9mp9WuCWXk+aG8msOw682EaxjfBidJAqn20BVsW9MPw?=
 =?us-ascii?Q?kbUy7/qH1Bm8swH6T+WMFTvs42mCCku6EvoXUlM/qcO3+00bE25LybGPP70g?=
 =?us-ascii?Q?eSaGKLOZkOpra6SYda0OpPTdwyD39F2UtFcshpw5khyhq9vLRtbfs29vvCVs?=
 =?us-ascii?Q?GZon1LHUkcEnc1Qr7RaMLO1ThiqaA8/tO0FeQEdBO8UsQXz/Qp7ay+Z2jbLB?=
 =?us-ascii?Q?YNzYJsEpgcCB2Ypkgkqx4P1RCGeJO5LLOuErgECkoAbijrWFKcnDjj85JccF?=
 =?us-ascii?Q?2KtgJ2U+1Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3d0b8d-a3a0-426c-70e1-08de96af74cf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 03:15:45.9372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M961+9p0ds4NQf4cRsVeKILgGldErOzWCGoKRLArYKfC0EOEJ+ZnMxYFpyYVu1qC9KTt/nWDp+TE/R3RmeO1Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11606

When internal PLL clock is used as PCIe REF clock, the BIT6(CREF_EN) and
BIT2(FUNC_OUTPUT_EN) control the PCIE_REF_OUT_CLK.

If the default value of BIT6(CREF_EN)&BIT2(FUNC_OUTPUT_EN) is 1b'1.
With the typical 100-ohm termination on the board, this results in
approximately 6mA of power consumption.

When PCIe internal PLL clock is not enabled, these two bits should
be cleared to 1b'0 to eliminate this power consumption.

Add a func_out_en clock for i.MX9x PCIe to serve as the parent gate clock
of the CREF_EN (BIT6) gate clock. Both of these two gate clocks enable
the output of the internal 100MHz differential reference clock.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 56bed4471995..1f9259f45607 100644
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
2.37.1


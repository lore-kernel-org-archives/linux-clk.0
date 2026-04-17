Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13235349AE0;
	Fri, 17 Apr 2026 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776414440; cv=fail; b=JtDuCPam8TK79P1XrTXcIejh72V7Mm3FH+rL8moFF36f6uKeriRwrJO+LvPS/ebHrz2vbPfrdk1uDBBWXW805TtOrkJZxx2PCMKp0TIzxhPegW9iusCTjwOfm9at5EmJ8H2ubmVxWSwr/iozEetKErQO4xVYWXWomBpMXUHi3n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776414440; c=relaxed/simple;
	bh=quAhHlCjyqfBNBsIpF4OSDmYXLRla5Ik0kA0DgmCwgE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SyeVBBmwo+hC41AU1sb63XDzFhlTDnesYjmIZQGUg0Ey3GSHEl+J1cJdLGcSBiUQ9t9UWAIvrlpjaslrNCMMB1Qg9GeeY9+NmbuXxkYtQYbEdGiP3ef/H2jUtY576TaNePb4aqoLYEXHPRhKKDS40e5T5JsBNg/1rSKeGxnXMEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OWKdcolZ; arc=fail smtp.client-ip=40.107.159.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OWKdcolZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1KryYrkqyu2vXWDcI24jcdFP5gCE8xiyZlcqy+OG96AGVyC9yKcoq8b/HnpaA3XAwxbjuYFUW/4TuqNyUOYfD1yhcyXmJu48SBFbg3AXSQq+y9bzyNcNsTsvU0Bb+edePV/XGMwudwkMzh1giERntsHiQsfGfIjc2s/0ptdBCSX6qvcqB+JstvbLdXPAA2eVW5VlocEhuWwO9zgdcM5ASOq+EG0pxIWZQnV/1W89rOBDZwUCqGuySj6RC7Y64JbKvOuhjQC0IC52E1bK60rX2nmSVGRhnoYEkuJJ8a85VGihjf3c4wdNgdCKBILsW8yGm+f2L8z1Pv8gqw7Dz86GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7grnC+hHgum27QUpVZGzuDYH+wc2fGSm/9THj/vqoyU=;
 b=mOKjBkeORJy+BRc3ODiUHVVoBzPPyAEg0XuvJhoMsyfYYe+frdUEenfRdsIrUG0VBXjSovQ2qnjBJqYEm6MdXIFsPIu/H8ZrGswUXsylfBTCIaJJbsGkbYu2SwDJZChqVCu5lk1QjgkI0qnSkJUrJbgG8AcGV7LFm0S+SOKciOKrCDfYluwRqteKa+OlbsNZrmxES8kFbLdUR4a+mpBm+rUBKNKRR9ORcFVarg3BTg1Te6ZOASCmH7Em6QbmKJ/iSu8If6VU6gNI5CusAINNodlm3NokvKj9zri77vQLQ2ZUp4u8M9ijvq2ryyEtfiqUIjpAofmJ9d9CBgsD94n7/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7grnC+hHgum27QUpVZGzuDYH+wc2fGSm/9THj/vqoyU=;
 b=OWKdcolZKozibUZ9YBmcnxZtTLfO5r5GpnNBaU5grDIHTegxvPIwI+6kYDkK7915fEmCwnukqxQHiC2cJVbeLXhwCvD84DInDOcDxktXIz83Lgxau5QLr/mdMWBgRjq9bbyAiLWfHt4hvIEsfXuE31rOJ+X34/MBmfJMopu4TSZeab17YPjGCNslF78ymAFw9JlukQOVugFkHz/cR0kDBsKlaBZ/9kkmlCGATKY2E4JcqUP1QZi5f+//P4DpYTTbWicIuGiNF+4evIdBNZ4rilouFoxnOiteEmJ/cy/OrJK+1cfM2//z7GcpaBDFPCznrpa6xjql9fT/Rj8QWHlf6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5220.eurprd04.prod.outlook.com (2603:10a6:208:c2::19)
 by AS8PR04MB7719.eurprd04.prod.outlook.com (2603:10a6:20b:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 08:27:16 +0000
Received: from AM0PR04MB5220.eurprd04.prod.outlook.com
 ([fe80::cbbc:93fd:f7b0:76e5]) by AM0PR04MB5220.eurprd04.prod.outlook.com
 ([fe80::cbbc:93fd:f7b0:76e5%5]) with mapi id 15.20.9769.046; Fri, 17 Apr 2026
 08:27:15 +0000
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
Subject: [PATCH v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on i.MX95
Date: Fri, 17 Apr 2026 16:29:10 +0800
Message-Id: <20260417082910.489995-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::7) To AM0PR04MB5220.eurprd04.prod.outlook.com
 (2603:10a6:208:c2::19)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5220:EE_|AS8PR04MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 119a063b-d0e5-4965-6cb6-08de9c5b21c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|19092799006|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t5LMG7JsW1s2J5n89SNMZ1RJaKUcOw4qLmDWmCQhmq+YMduXhcXTMYeIq1uyjpPCc48UazmyVtXLfCwFfYre2Az3RrShu2tz5jMnrmSypAN9HYE0bGv97i/BuvG+6N/p6Ng43LLZXY4GnJhz48IK2uloy2pTXnRqHOO7a0ilgptaNmjC3OkxJ24uLe7JvPmLrV222HjerbvqDznupSymAIqJ/5SEwaKQh6u+8gXL8mPFedSYiSb9/4ZbQ4wcNjhUewdleIJbfbOWf0Y1Zms2MtUA5MN0KOgdclfSHjWfQjnuC5RpNeMt+TAvfz8pG5EpdihDwAJvAjRKquPd3B7pGgiIRPoSVJljzdaG6/bYMOhrcm4yG0kM0s5mf8bWkzTF9fBEt3mpQn4jfOrhBN6GTFWre+DQ45QShgzFYiLJ0yGaexruWLtsoxFiwGUVc0LeYscsAQb3nL7LilNKliuhfyteCgNimzw6tSAzDcqqTf0ZY/j1DS7L945TI+nRXJwsvaY7zPhswMm9mtnZIeafOgj7J6STu1I+1UqaM53AhkiLNgqzHqUqJiK+GB6/qdOS9e+mdC59Mmd2WuZeXDYWmyv/l2IKBpTtue8gJQE3nZDGZLcsSBV40F9xYHx/AvNicymAqm1RMHrlL+fYs+ahFl1LdjA/o/Q+cj+7TYg896RYGOh3LgJ/WR7+hB+66JMpH7up8+DH1jJ7S0JKN5gIkVCzhVjPMmxyj7El+dylspkhvoDIRX1urzhMWJHISvEZiCzbhiEciB4dLUs9PRLvNlr7lEQex+Jpmr8KPM8bqVU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5220.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fzYlrAWXk2nGjrhdaGEIal58aPlM6er/idw4jfoOD39AceWwyh84Lvd15tqL?=
 =?us-ascii?Q?YYUWXItaiCEhfnLICdZ6k+zDBUU5+8hceRLT1s3FhVroGv0eXZg+8cQjKYzV?=
 =?us-ascii?Q?xDOtHRkHTc9zRmtBqvpwqfbXNHVnFhCIi8XQ5oQeWKSAYLmviqozUJb2mONH?=
 =?us-ascii?Q?qm+KzaAwN67j/F32NnTedu+UkbHa+xo1nid7pSFnAI5KebzWS3Z2QLH0H45j?=
 =?us-ascii?Q?jNA0ec1dBXzwHBKbbgKgG10r9H6ogSsoAkyBOx+9OpvCNLJedrCqCYsmt/Vj?=
 =?us-ascii?Q?I57UCzKMRiHVZIlGJhmu1uZzFTEL4jyjiOMsMUrz0hfzNsnxGs6Ff5vqHz4M?=
 =?us-ascii?Q?B+TN5MFsEOiunaLOqq7us8gmmm9CaYhUs2/7Sygq2RcAG2L1X9sAC1oeRwYo?=
 =?us-ascii?Q?QiuBzhz85cKhYGz7a1QnrZP+ghmeBs1cEbkC8vzqpIOfRLrKX+zR4CZImQoG?=
 =?us-ascii?Q?gf3v/bidwgMYBtcgOPMcTwGjUAvUXVzpmZn7Ee+mGi26axPxGTOGQAx6dDZR?=
 =?us-ascii?Q?Dgxi09iczTPeiKAI4CuyaGdl8jp/WYht4kL0tfNUvPsXnHp6ztcerV6Q+ITq?=
 =?us-ascii?Q?NqtjJOGm9hcRQHjp6yVkTE+4fkl+6XvTQ/zU+5eyynScPYJ36Smu9VtrqdF0?=
 =?us-ascii?Q?sZbc9YJhSwyhO+GX3CqDxxrIMqKfEEco9wrU7FAfj4loCWgeOVWeyXIU6I1v?=
 =?us-ascii?Q?fyUI8BpL90IMSXE3gtHVRWk0RnTWyIo95yvBZpaKHSth/GF24RDzvO4iVAh2?=
 =?us-ascii?Q?kJJ95TMDYPYqI3WJNwZarHqgTPc69qCVZAhlMIA0DLFMqLx0hG5G1fnvynuP?=
 =?us-ascii?Q?OeXcGAf4AU/fKsY0h84QSUZKmrCA64Eruea8+/7LkPi1t9528VS9U/3avEKL?=
 =?us-ascii?Q?ofpAauogm0bmoy9/JlmqU3ifNDgkTm91IfA4oiS+knrftS+Ov6g1pvbn6eIG?=
 =?us-ascii?Q?Fy8HmpaUgdWAe8vYlAf83w6zrsQWbKvJq70tBLFmN+MdpXYMwPNdepzhizcv?=
 =?us-ascii?Q?GhqENFmSJnTwl7GjMM22CWbHF20CaPui9+N50VjuWHYoQApt8XX3IrJqO8Sn?=
 =?us-ascii?Q?BcEumfiXZ1D5cm1QOEEqcELiAdJF6g4LzQOCxWbcwQ53X6TjtAXwz6QfND8c?=
 =?us-ascii?Q?jShwexc6NnSgleYVvXCx2ANt5Q+XyXXPIFmGKx7hkG6ZOnpS2dP/Ewn3SwN9?=
 =?us-ascii?Q?WB99D9bRFQVJbsG71KjPAwLcTVbBswKc5iJcrhjTCeQrKv1nAntO1GvJrKXj?=
 =?us-ascii?Q?6UewRG7A06p/Bc9vZ0O/6okmQSYbPCuzkTnPPhuFHxSJgej95F8gM7Tyj5w3?=
 =?us-ascii?Q?SJp/J/UB9mOv6j2pgdQ8K5bFTztPN9pBlVjC0eBSAeezGa2ZHC4lDSygqKGo?=
 =?us-ascii?Q?AAG3Wi7ypnlXkyW5iWPlUQ+UISq5dN7w3kWVran+mjWSb05mKwRiG0LBfXHP?=
 =?us-ascii?Q?f36UKHm4i8jiGJJ+3KfAJ1X1V+Y12AM8hSJuzg5FLUjENn5X/au0xNQUOVth?=
 =?us-ascii?Q?ccFkHaHllcZrOq7dRjDFe0H1iaEqk/3zc+cgxxfp50YDy8QrmObOb924CoeL?=
 =?us-ascii?Q?E32fafsNoA6/b/sgPAGhrvuNWxt7ONT2nqyeiMApgBqrZvHMzPnVXSRqIm7e?=
 =?us-ascii?Q?7cAfY94MOnPQRxhLmj30/oH4KBHrsmttrlt/aw7HWclWlgJd2JnjTmlG18KQ?=
 =?us-ascii?Q?xO21TBI00bpr+E4LYQ0b6o3lZJ/uR1w6AuXQ27DyHUzRGmxtsQ4O4fmBJUz0?=
 =?us-ascii?Q?YkL38vN2iw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119a063b-d0e5-4965-6cb6-08de9c5b21c4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5220.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 08:27:15.9032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SUSibQ9d9lydHtYfg3lOGli4vn+uz8h1fksqgPc3eDiEFHZ9EdsdQPESSAg6gYF5nT/DQA/ueRp9nQQG3ZkVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7719

When the internal PLL is used as the PCIe reference clock source on i.MX95,
a REFCLK rise-fall time mismatch is observed during PCIe Gen1 compliance
testing with the Lfast IO analyzer.

Fix this issue by configuring the IREF_TX field to 0xF (15), which adjusts
the transmitter current reference to meet the PCIe specification timing
requirements.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 1f9259f45607..bc6957299cec 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -44,6 +44,8 @@ struct imx95_blk_ctl_clk_dev_data {
 	const char * const *parent_names;
 	u32 num_parents;
 	u32 reg;
+	u32 reg_init_msk;
+	u32 reg_init_val;
 	u32 bit_idx;
 	u32 bit_width;
 	u32 clk_type;
@@ -289,6 +291,8 @@ static const struct imx95_blk_ctl_clk_dev_data hsio_blk_ctl_clk_dev_data[] = {
 		.parent_names = (const char *[]){ "func_out_en", },
 		.num_parents = 1,
 		.reg = 0,
+		.reg_init_msk = GENMASK(10, 7),
+		.reg_init_val = GENMASK(10, 7),
 		.bit_idx = 6,
 		.bit_width = 1,
 		.type = CLK_GATE,
@@ -410,6 +414,9 @@ static int imx95_bc_probe(struct platform_device *pdev)
 		const struct imx95_blk_ctl_clk_dev_data *data = &bc->pdata->clk_dev_data[i];
 		void __iomem *reg = base + data->reg;
 
+		if (data->reg_init_msk)
+			writel((readl(reg) & ~data->reg_init_msk) | data->reg_init_val, reg);
+
 		if (data->type == CLK_MUX) {
 			hws[i] = clk_hw_register_mux(dev, data->name, data->parent_names,
 						     data->num_parents, data->flags, reg,
-- 
2.37.1


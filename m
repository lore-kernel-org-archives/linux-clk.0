Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FF63F9F3C;
	Thu, 30 Jul 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402082; cv=fail; b=sr/A6+WasPv8FoWLLNqUDCjrymog/32akQUnQiATNM4KfqEI3O96WaiH2+XjlPo7uJu3m/yhrx9iTg2ZkoWjgU9UQMD/gPyTRXEVb8y9a9RnMCJ9CVARDZZTG8m0zBIcKFWC8s0yIDsGOngIyWO4/OzGfKGieexJ3ADXD16aJBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402082; c=relaxed/simple;
	bh=2IJVykOmnD6Jx4dmtIrUqQwd/CQg646CVkESAnfmGfI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ngpQQP4JMuq98RapjSoB3avEppxS1teDArY+uDxiXlDZrOHewOs6Gg5myxW30LACjWh40QkPJYtf7dPwoQEBErTPgC6xJGz0vq0VVbslDlx6Hr9TDyWTlRnEEBFgGtoZuzYAsLg7cJe9t5J0dFXeBgYCdzwxUX3zkNAP+OpxB0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kxPnzcGJ; arc=fail smtp.client-ip=52.101.69.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kxPnzcGJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3bfrEnt5rI+ysS4U9cpaZg3Yg6MpPPILA+a62dgj9cy2s6h5X08+xb93SgvRvGr4hK+w22+jR2Z4vh6PcYR2IM7gWDi/3K+xU31xAxKH4qKJHs4kbXJlnYDPf/rsts5T3t7iwEJWtuPJNCHMV/VMO8S9/Kn/sYTD8p9n4UAoq9SaqaMCdzgZiNJuSsP7NLg5h7RkflXTtYnjsOySI2IqnnVPEEUHnJbzmODXjYICb70LDyPQtGU+8VoaEVpkQioBxQlxlN1M/CGZEe8sYBB+/d0WLvwYvk6XQILsXkOo3HqxZ1K7LzXg27ltPTvPqaqPfQ86rPS7c59ZTfhln5CoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nK3fxoKKuamJeMbqD8OvdylnNIMC6gUQRUju9Y2xwD4=;
 b=ZOqmOJAabSDgcEsnuX20ODAqXl7vcoOHUv7iYk4yZGjEMadQKlEhLPcwCpr66qmQ9zqJ9ThW/VB4xRtiJBhWZiHOFinxLt7FezAjcQxV6KMekgf6h5tlxkNbdajzC0bVcJFbzG18y/FWBuScOXjMc/xvCe25yoGvdBtxKAcTLgQqqLmJ4LgVInc5WSw+fWxAO3FqsTAHWq991WWtBco84AbJ1w72VWvuuoUou5gdFoHsfsDj3YG1i/bmaJCenMrVU9jmK/apD9xhjJmtKhgiGBVNgtdB+kpXQKaatrDjmBKI+9AnUhIAKbEj5WTQ3nxIY7BAiB98M9YtV6TwBB6Kng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nK3fxoKKuamJeMbqD8OvdylnNIMC6gUQRUju9Y2xwD4=;
 b=kxPnzcGJW0nabf/pl3S36sCkC6B1s8PuUWjbpFP8YZw/HErRrLarEBVLV1xVrnTmH1rMs2ozpR4PLWYdPYzbcof4RNRhgZj32xVQV/fi3mJZZEE7/TEREhVbtQq1C8XjjGAabMhgZUJljld+Ba0oKIxGewdW3wsPtuVIxmpoOVZu9xlBbHRdLR+gwnT5v8LhhIF538p2T84RcxTC0OqTzCuD8ZX3SVOj4O7FvSwgh9hWlynKVkev05tUZuYXMS3OA1CCHdAgbuOZAlBclOJs3+xsom0hiQnF6/lRuoVGqTW+ImuQdRP6axMDlI9evoOwm+VBJhl41/2wxyNS50+exQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by GV4PR04MB11776.eurprd04.prod.outlook.com (2603:10a6:150:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 09:01:17 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 09:01:17 +0000
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
Subject: [RESEND v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on i.MX95
Date: Thu, 30 Jul 2026 17:04:47 +0800
Message-Id: <20260730090447.271109-1-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|GV4PR04MB11776:EE_
X-MS-Office365-Filtering-Correlation-Id: bfde4967-9151-46bd-70bd-08deee191d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|7416014|56012099006|10067099003|18002099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	tK9FoUpXFt+AzRnpBMPTsodjnMH5hCGwBeRJKwAgZyJiE1E/811+t4S7g8Fb0hxcSNoanmfgRypPC2JCxdhmBOsJmN7FuMGSHQi1K45XiLGI1aen6A6o14Uj7CoYdCy00ExqLE4IgCRDrInlKuhG6nygmRAg9Lts72uhR2ko5M64l28wvNRTh8webSqQPjSjo2Xhl95KBkpeNCBDH+sMopIoOiACHXs2CIWE1WOF1fy80GXUXS29p0QRJlh8jxiN5ytfDMElvMd8SGHwSODMpzFdBCvQp+qN4IaX2MUDsHRXo9QNNzv34pBD5zj+8jsHtLlqzAgNAV1Edi4F4tCs0yUJcwN3/R6Om2wrO6sORH6EKk6D+CX+q3m23s83+n2si1K7vq87cKyOqK1k+AZMOcEmeMHLFvGLumOheb0KRqachQ7PAkKRETfFoN5CgHp4YXLOWIr1Dw65ZR2s1d/TwVr2bgc3oFE3ztUCNkmvIYa8/ZUSg/qZ3yot8iirNSV/ihOUtza92iUSPv2Dnw9jEwpB3K0lr+Ik+YhsjSmOMppcwl9ocutIMVxT/I4g0OVXXOejqU+LNhKqntPcMNLLL6HBKptWBJiPMlEfox3szfIubKWALZBAhNcvsk4Q/rKn/zw0Lq/ZE1zanr5z9W6O3OoZ5r6C8FkMTksPRBRqv+0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(7416014)(56012099006)(10067099003)(18002099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FOCTATESBUH2oBB6D9lwPbtP3TBFCyE1p020bE5lHJm61MrP39edknizjZR9?=
 =?us-ascii?Q?dheGFZ/1G1dVCzDi9Mdrw5ktsnQ+z2n1KyCNS5tNtiKjZqo9GHGtxm3TkipG?=
 =?us-ascii?Q?O3BWN5PmbSEvP208QITuZOAm/iijJ4BnDPxg9dc5iaHe8fxiY0ir+qUefKXg?=
 =?us-ascii?Q?KDk1CW7YN888XA78gMZ+hYkEbWzI+BPZWIJV++ohKSkgBRd1hR25HwN6jmU+?=
 =?us-ascii?Q?Ouo18B2yvZCd8qzkfQRK0hO+jh4s3SOmxpU0WxaRhtzepSH/EN9TKHsJEWU6?=
 =?us-ascii?Q?YZkaleCxfJZievINz8UyfIpdc1QaZqmKNU6XAXghXcQsDjKIsTQVwN2e6i+2?=
 =?us-ascii?Q?Tuz63yGhwc0ThWcTz1YdJ24jqwbvA3ihogNQDaku0zCVPSjQwNRzeDirW4Yy?=
 =?us-ascii?Q?/ecssEAswtwbs9ik/7PP4WANo75R7kDWZSkvJEls82wtfTxZJUpx2Ta0gmsj?=
 =?us-ascii?Q?2o/Sgna/Mf2dXYORLYQHniFOQs1yfHll4WvFuuj8eqJNFo42b9QAkeaMsCRa?=
 =?us-ascii?Q?xNSJvdztngA2okzj3vQvS8x3qoh9Pv/0jb9iIScnzcjHl7/7KbHvscFPlvd8?=
 =?us-ascii?Q?Dt5y94UeR+BTm5LRLMKZJsPVn6z0p3XTXpowAWFFLbz7Q3dBc023A64/OBLL?=
 =?us-ascii?Q?7S56YmC5uuwTZO0zjk/zSFuGa/KDGgqMxsbfpIXQHqdYh4BPECpR1RXvoDUL?=
 =?us-ascii?Q?4o8pdwzYVavN33Ea86+SuVSmyZEkW1zUUl7qmA4FRXFMDwCSefCB8iI2FWEP?=
 =?us-ascii?Q?6Uj/Aw2D2INKSSTh1E6BngQqeu83HF2dgMJR0OsH5rg0AN5bA/eWpSFBrNYm?=
 =?us-ascii?Q?YUTnzXpMi/MoYU8ftGB1txvYEoeFFFrMAtk6APZoCHrNqqom20mrFZWnsIOV?=
 =?us-ascii?Q?YySjvXpg22rJmTyOfLfczUVsWDE0QTPKFCzYwT0nyHHFWSQhqknoLopTbklm?=
 =?us-ascii?Q?wTU6gzLeC2C/YPa9FZQatJQd3b7N0QI6VDpzemibQ704oTmKsPZseUquyBsX?=
 =?us-ascii?Q?s29mGU8SromaLbwUdukCmZyp7tNH49vAU3rjRV35oNZIViELGlsLpSA6erwn?=
 =?us-ascii?Q?BXFDtr3r/My37MjxpPemhtlYhLt8eJIFNnND/SuWZny5GHvyWw6XEK+lV7U4?=
 =?us-ascii?Q?HyrE5oOuhYHybiC6n4d6u4zBqZaNmpsQV67ylvmEnaKlG+bEz0eJOhDc1pV+?=
 =?us-ascii?Q?bsar7nc0F+eOpM8sz5c4s5ni+PjupwWNyEUILth+4cm0R+DFHHLtSss3ad4H?=
 =?us-ascii?Q?CeKlXOk0SBH12NgxQ2pm1nOyL6lDVbdedcVfxuqvrS5Y3ahLSbYdTB9RQTMa?=
 =?us-ascii?Q?81+yqo3uNIByqYjNkvqgnZMvhlwa3GW+egDf8AH5BYzwbaTLroyozYlKE3y+?=
 =?us-ascii?Q?Aq7G5x0BpQMOywcofbc5ZTDWS3lRdpNyVYH7cAHz9ASsaDWTeYIPj1zbGcZw?=
 =?us-ascii?Q?AOX5yukF2K3Oby9bh60amUEoRkUDnMexDwFerh9GNF90rn/+E6j3KIJ3S6gF?=
 =?us-ascii?Q?67QhqjFzQ6qrhq/BsACkRNWkKLZ1eAW4ZmckexsP7rcl/ecyQARtu1LsX7na?=
 =?us-ascii?Q?jUMFtAf/2aNM8oVDpu0RUDuHGCd4xFy+K6DipUjEU+WHIQecUxq+J2TAXi1V?=
 =?us-ascii?Q?3H77lt4S3ZhMog1DbACDfw9MPE/Ps/r4cW/KG3H4t9cGBWzpsCUjBON+mdz9?=
 =?us-ascii?Q?DJ66XYoeOfvyyOOerGknnWNP/sh4SGmlMA4RwmmiyAWJVmSK7QcxYrNVsvgi?=
 =?us-ascii?Q?0J//2ZGt0WOtLD18Kk8Hi+jZ52gyv46REW65WQ3YvXy7S3mAPoOy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfde4967-9151-46bd-70bd-08deee191d9e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:01:17.3490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gxX3Gj0Z2TB+FqKLuUp7IIBgI+NzrGTjJORNo1kd8S/mBJQ63xTN6vE//cdj307nO0HBH7kApT9/D13UW78H0okf0B1AGHL8M+2FYubngnuYS3MfQ77MmdUYjC3+JVuy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11776

From: Richard Zhu <hongxing.zhu@nxp.com>

When the internal PLL is used as the PCIe reference clock source on i.MX95,
a REFCLK rise-fall time mismatch is observed during PCIe Gen1 compliance
testing with the Lfast IO analyzer.

Fix this issue by configuring the IREF_TX field to 0xF (15), which adjusts
the transmitter current reference to meet the PCIe specification timing
requirements.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 1f9259f456079..bc6957299ceca 100644
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
2.34.1


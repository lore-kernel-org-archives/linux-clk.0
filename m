Return-Path: <SRS0=xqQ/=MM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F4BC43143
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BB92206B8
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="E8F6tPG6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BB92206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbeI3Hm1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Sep 2018 03:42:27 -0400
Received: from mail-eopbgr10057.outbound.protection.outlook.com ([40.107.1.57]:48520
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbeI3Hm1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 30 Sep 2018 03:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDQ+5PJEpfl+8nqdYmmx+qOEIrOwTiEtlTZV4/mRFrM=;
 b=E8F6tPG6TxHWfWOg5aSWTZgU2C/dIg4R08L22TfX1NYstHWMX6uGbPf/Wo1mCA6ugdAuz1KHw0g8/pzk3/t4s5TeFNmmknYawzN4lm45KoyaVjigJM7HK5FrIHb/JpaB8TooV/NppE5GL4eL0jsOtfInQDqHUFr6GZMxctTg5JM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 VI1PR04MB4221.eurprd04.prod.outlook.com (2603:10a6:803:3e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1185.22; Sun, 30 Sep 2018 01:11:34 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V3 07/11] clk: imx: scu: add scu clock mux
Date:   Sun, 30 Sep 2018 08:56:22 +0800
Message-Id: <1538268986-24890-8-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538268986-24890-1-git-send-email-aisheng.dong@nxp.com>
References: <1538268986-24890-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::15) To VI1PR04MB4221.eurprd04.prod.outlook.com
 (2603:10a6:803:3e::20)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3de7b102-507d-4692-273d-08d62671abbe
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR04MB4221;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;3:gMTwM/rirIRUfn5W6cFpiI5+gw+ehiVBKAiE2gDJ906Dk0cDWvw9GrQliQrotcB//9kOEuR94Tmf5i0mEQFyJewCeh9os3VP+Aq8MEHiBKqokNY1j/1rKTr/g+8La6mL1bRIEDtqISFogrP/XvBA7S/F+KadYrMIE3bKljUyUya7xeff4XElnibk1ZfXTx5HuH3Vz1eTCT0BKu3xnwefVohksFVGlgEWje85LlRquo8ta0U096qQrUSemNzBnNfY;25:AD62ubcohmGcWiqDRDhW0nMchjcKudKEVFCJi5M60Szy6YRSbpgrOw4MHDxrAy3Hy0GIkCwXfNTeo4N/H/bRR9AuYi4XzEuHa5QLxO3yCqChkWdUa8duuXD/f8rthXvPBu3cU+WfQW2tGwFEhqxiarduuMQEBdHrTGdL6Ds9zxOwCoulgFpzGj6U5rDTAAUII0m7y0ud2i3MSI9khPZnZe63smS+Z+mGKfLWgewGuWHuf75PePK1N9tztTT1ak0v0iGkW6PS41qczo8yXKCiVB6J2aebkD08Sd7ugBbz69m1aYXISIf/Ic8HSN/02Z0TjFeJl5HJJQhQa/z7ovSUzg==;31:gRgjPRLeebnAsoGZJvdxv1pgn643APOf7T0XmsMnSt9SE+0RGfB8V1mZ0LuMcjIQkhDdj7pSiufNRieHk54FUYsvYlrSWAo7XZnlz4fjQ25PeLFCh+1k3fqcov/AcUGgZ2VQWq6HkRooLQcBFBhBR+ilarnuIKbfWbRjrL2ilczQjgMAay4dP5WiS20E6zc53isRuPumgsdcf6UqMmnxUMDOeRSp7w4jkXVMxnayWcQ=
X-MS-TrafficTypeDiagnostic: VI1PR04MB4221:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;20:FeTlv2yhWOnFezWdX1JgdC4zcDscUlUCvL9pP95279bq6mfpevmLr1WznQ/WHxTUVYaJp3xPI4eeOdyG7C2Jvd0EUtjiP8qBX/wEDc3e4AF6EoNN97/Nt8zDUiwLPV464tXQ7JI8j2DSyZrIiX7ZNol3iR9LUlalPRqEvpW5YC4JUqPV3tDOlCP4p2FHBW1pTX17k0CrCOcXmRQYzC45gltusviYCL2JWYjDGwYMwsY86ZR30HTIAOQslTddTOBZg41bpX57vg/ywb2icTsSmwwuZttPigDQmqvMyKLLkSw72hjcyFnGNUPhCORmukLMObsAG640P6nvgUF4LEtb+9E1WS76HdyjMM3xeFVoDPxulumBatBIQ2N3TvFdBMPYVV1tiBfKtUQrmgy/hO4BumVtXuObSbqMB/lcpOMZNAo3v11nplyP/FXsRl0kr5n8czWNltB1juE2VyIyB6Lo06BInoID7DaD3USY0BkzEnHqynpv8of8lHrWwTq/FyxD;4:GJPgrPmPAnicy4a0AkKQCnk3m2svTiqL3bE/mA0guFDKBDx1hTYnC/yeScRY0XdPVKhkhPUzKN/NrFrZnqQgecayrsA4xbTTh7j133RaAzFB8W7TK7/Pt0mA6UBJri6GVCM0yBXSCk8qk43P1skis+4Dn6ZU0azCCwz7E/lE+y5xNxTZ0o0J6F6Y0bXjAFsT2cRp8xQ+2hyTWHy8J2cuuIKmLlDOjDL/bFKnPxCLPD261eyVrONOOAVpN52o7r+pb6KH/5CXDhrT0JK+Dum9ehssRc4lB8QEjKICov0Uh9+GyssJIcnpmX8+HT8xUgSa
X-Microsoft-Antispam-PRVS: <VI1PR04MB422166A6FB6D4F4BE11BFDCB80EE0@VI1PR04MB4221.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(10201501046)(3002001)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(201708071742011)(7699051);SRVR:VI1PR04MB4221;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB4221;
X-Forefront-PRVS: 08118EFC2B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(366004)(54534003)(189003)(199004)(14444005)(6486002)(81166006)(81156014)(66066001)(6512007)(8676002)(52116002)(53936002)(11346002)(446003)(2616005)(956004)(476003)(486006)(6506007)(48376002)(26005)(2906002)(47776003)(386003)(6916009)(478600001)(97736004)(68736007)(50226002)(5660300001)(8936002)(6116002)(50466002)(6666003)(3846002)(76176011)(51416003)(106356001)(25786009)(16586007)(4326008)(34290500001)(186003)(16526019)(2361001)(2351001)(316002)(105586002)(36756003)(305945005)(7736002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4221;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR04MB4221;23:DldxxCycOIseYBxQR7FL31wB7qwAs0AqTLcMCMxRq?=
 =?us-ascii?Q?PIYPoNQ6Yq6542SCaVjSFyJ4Nti6BOtU78bTzcZ2dNV7MQbKkzznEkr+2ClK?=
 =?us-ascii?Q?xUPUnG2EgxMkZbPjx7I8574QhKFsCkmhg/q1kfVplVgS0qOU+erAfDYF9YIW?=
 =?us-ascii?Q?JGHOKs5LhMyqrmOCLDtO3rEPdr3zQxBLWze8dzEwCS7YMbCoyxi2QhZ91L4V?=
 =?us-ascii?Q?JfGo8n43zbtg0tbE+iqlvk/5NBrDgl4oZDOGfn8LWhomUAYYSu3SYlr9I0HV?=
 =?us-ascii?Q?wGmWQzQqP8qZDmGwEaCmZlQw9ltPeBMYFUx0ojr/5YnvSJvKQj+DistSMWi6?=
 =?us-ascii?Q?5CtfishWkqBQ9Fb5xqDMVwe9t12B0m0yD8icJG0hpDxDIavjOOqoVz+KT1n1?=
 =?us-ascii?Q?rmdvY0hqGV9vyLCf40ut3I+Nw/tjYuB2f5tZCkzdt+QTYHFy4w7hVogcMTBo?=
 =?us-ascii?Q?V6KCxl/QGr3/U72FuKYEOwSN0OqH7wgw8nnE6ZelFGfE7LLZkzeW+zUNlT+G?=
 =?us-ascii?Q?JSdmv/0GV0YWihO9OqXiGiEsp1C6V83QOMklb054xXn6+1Y2tPwi/g0enhJC?=
 =?us-ascii?Q?U3wojfb9L50/2o949y9YTwCTNE1wdIINH/jswQRaJpyukatnm8tkuyoCB42Z?=
 =?us-ascii?Q?pWzr9/CbIhME7ra3dzDbFSvJoMLlY0XAdcfZnxgd9uoOFlHvGdHi7zypPpvM?=
 =?us-ascii?Q?dqXdejWaPR5n2NL3Zsv8S7I3+JmQ8sAHKSKIasJMihWt5pu3fQZtb/MDX9xK?=
 =?us-ascii?Q?/bBGmmeM2nKhQuiSdDSIRYzprtOI2sbxV//uuFs2Rjq58IRaC7GGaIiK4k7e?=
 =?us-ascii?Q?pi+QX1GolBBY+JIdXUByIZXIsToBvUWGoq5YQCDIN7w9kx9GO86s17pBRK5A?=
 =?us-ascii?Q?8GpjFmXvWLcks9FPflQiyDbNNzYzv6JgLi+iTtoq7duJLmNNkViC4ICKnTQz?=
 =?us-ascii?Q?pf62Pa8VrbeLbgH/yD9sRqJEw+F8R+KUt1SQkuGu/elmr7QcVizPhuIPmUaz?=
 =?us-ascii?Q?ls61o7SanbCqxHtQgwOKXK5fDK250DLyAeCYxaTp2USBuqOKSgX+YF3G86XA?=
 =?us-ascii?Q?62Iao9U0LArP2d7CdrNVC3XoXalOrS9xT3jHm0bt9dMmiKqAMp9M2DYdLH4f?=
 =?us-ascii?Q?pT/+p6WwuoAEU4j0FhAnoeMbRg3R7lHG5Nr+iRkm/mLlr5IAWcp00jestnF3?=
 =?us-ascii?Q?tgvPiSbGI3oRJkPInl6+PZ/vixERj5VFaDyGgLfG5//pEIzZrFAyLsI7sXYk?=
 =?us-ascii?Q?5X+GYd/IiMe7uJw364Aj8bXlYQnu93SzvIWynhc?=
X-Microsoft-Antispam-Message-Info: HnrLn3u9teLSRUfx5X/q049foCqM+sP0yooLrOF27n/xW5cv5LbUb2QFT5n7oy90ulcBJNbFCa8cmaGZB9BCQ6htgEGt46iwvCwKPr9BtGIDAAWzj7642jmhc2SwLjQ8m/6FZV2xhxswYu9Yy44gdWkJt/MrGv8joiF+X7XOBKZZYe03YtpgiP3iLRA/GI6Px2BGrJjnork9xXy7nC7f8H7M+kiVIXVLEHfcoTR0z2YKC9dR0+Vj8OEyYy4gUnTRTCgKgBm6C+uQzzM2e4eEYCzIytUfmYY5UVFIeN/bx0MUkcjI42Kz81XFuv+M2U3LU7nmOm9bmAwtaGzsQuSS4FAiXslqo29UDi/pYn/aY7w=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;6:MYOXJYJZ8UTOnpXIRU9q2TP3vOEDm21rxgC9q7Yfab4Av3Nitsq1DaOJafI10L4ZU5g4toAtboLQdfLtSTDV/OAKFHyJpv8bcpyEWsZeBs8geElv/Jo+IBJI5oE49aX2RtKc/ZheI4lKRQ7wtWnYvQV4xm+Ahi1kzsXaDL9wctx0hecTFdkdv7r+h0Jfve0JOuprIZFjj1U1QR9aYyEv5czJqjNVRYQ+b/9bOEp/+p5C00+5ID9Rx24qepjUWX0CZd1NJbsA+GQ8ixraNkY0IH8Mj129SfPAjjx9HuFVN1ylbDhG6SLkFdw7A6OWPhWHzMa0+n8mr8YmijS2u0sMIUQXg8dVCzEDYXmBx5VFh4oht0HIWluZ5rO8umva1pwXchezVW1yyqfEN/uAEbvEYfDjTeM4baJguphce8uKrLWhs0E2YabD+zR4wPvxU4ej6tBhuT8shCooMS78vzV77Q==;5:YnqePAbK9Wb93GyA9vJUSNRDbVH0+sVYcS8xe4UCyv6KvyBIfeIRE8jNx3j9hgXXy93mjha5XszDdJmwMZHCT2RMZlMIFQt0NKXOzB23Ojs9SOlgbB+ooE7dWS524qkv3v8gm5igU53BZ4S2XxP7wJoVpurk0uboASa+kMViA64=;7:jRZUzTDLqGYTeuA1LqPA9yUC0ryDyufYTKVt0SiaeDKtRrakgOohLBD8Kv7kWql7akZqmnpSvYk9tO4RmoYCoJsUM/DBcfSMTBUvnsWcjt19rianhzQsOy5xfgR8G8C7TaVVvHuLFXBP5ZVRzCWtBcmsiwIFFdA6v0re4FDyylSvj+9inSnEkeMKVrNDAp9j++HtYTg0NjQO7dv/H+GEIJt1iDqJvc6N6S1l3eQ3sC64vTAVDGAe57lemlJkvort
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2018 01:11:34.6490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de7b102-507d-4692-273d-08d62671abbe
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4221
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add scu based clock mux.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v2->v3:
 * structure name and api usage update
v1->v2:
 * move SCU clock API implementation into driver
---
 drivers/clk/imx/scu/Makefile      |   3 +-
 drivers/clk/imx/scu/clk-mux-scu.c | 131 ++++++++++++++++++++++++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h     |  13 ++++
 3 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-mux-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index 25d3511..aee56bf 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_MXC_CLK_SCU) += \
 	clk-divider-scu.o \
 	clk-divider-gpr-scu.o \
 	clk-gate-scu.o \
-	clk-gate-gpr-scu.o
+	clk-gate-gpr-scu.o \
+	clk-mux-scu.o
diff --git a/drivers/clk/imx/scu/clk-mux-scu.c b/drivers/clk/imx/scu/clk-mux-scu.c
new file mode 100644
index 0000000..b5f5b18
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-mux-scu.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017~2018 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <soc/imx/scu/sci.h>
+
+#include "clk-scu.h"
+
+struct clk_mux_scu {
+	struct clk_hw hw;
+	u32 rsrc_id;
+	u8 clk_type;
+};
+
+#define to_clk_mux_scu(_hw) container_of(_hw, struct clk_mux_scu, hw)
+
+
+/* SCU Clock Protocol definitions */
+struct imx_sc_msg_req_set_clock_parent {
+	struct imx_sc_rpc_msg hdr;
+	u16 resource;
+	u8 clk;
+	u8 parent;
+} __packed;
+
+struct imx_sc_msg_req_get_clock_parent {
+	struct imx_sc_rpc_msg hdr;
+	u16 resource;
+	u8 clk;
+} __packed;
+
+struct imx_sc_msg_resp_get_clock_parent {
+	struct imx_sc_rpc_msg hdr;
+	u8 parent;
+} __packed;
+
+static u8 clk_mux_scu_get_parent(struct clk_hw *hw)
+{
+	struct clk_mux_scu *mux = to_clk_mux_scu(hw);
+	struct imx_sc_msg_req_get_clock_parent msg;
+	struct imx_sc_msg_resp_get_clock_parent *resp;
+	struct imx_sc_rpc_msg *hdr = &msg.hdr;
+	int ret;
+
+	hdr->ver = IMX_SC_RPC_VERSION;
+	hdr->svc = (uint8_t)IMX_SC_RPC_SVC_PM;
+	hdr->func = (uint8_t)IMX_SC_PM_FUNC_GET_CLOCK_PARENT;
+	hdr->size = 2;
+
+	msg.resource = mux->rsrc_id;
+	msg.clk = mux->clk_type;
+
+	ret = imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret) {
+		pr_err("%s: failed to get clock parent %d\n",
+			clk_hw_get_name(hw), ret);
+		return ret;
+	}
+
+	resp = (struct imx_sc_msg_resp_get_clock_parent *)&msg;
+
+	return resp->parent;
+}
+
+static int clk_mux_scu_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_mux_scu *mux = to_clk_mux_scu(hw);
+	struct imx_sc_msg_req_set_clock_parent msg;
+	struct imx_sc_rpc_msg *hdr = &msg.hdr;
+	int ret;
+
+	hdr->ver = IMX_SC_RPC_VERSION;
+	hdr->svc = (uint8_t)IMX_SC_RPC_SVC_PM;
+	hdr->func = (uint8_t)IMX_SC_PM_FUNC_SET_CLOCK_PARENT;
+	hdr->size = 2;
+
+	msg.resource = mux->rsrc_id;
+	msg.clk = mux->clk_type;
+	msg.parent = index;
+
+	ret = imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret)
+		pr_err("%s: failed to set clock parent %d : ret %d\n",
+			clk_hw_get_name(hw), index, ret);
+
+	return 0;
+}
+
+static const struct clk_ops clk_mux_scu_ops = {
+	.get_parent = clk_mux_scu_get_parent,
+	.set_parent = clk_mux_scu_set_parent,
+};
+
+struct clk_hw *clk_register_mux_scu(const char *name, const char * const *parents,
+				    int num_parents, unsigned long flags,
+				    u32 rsrc_id, u8 clk_type)
+{
+	struct clk_init_data init;
+	struct clk_mux_scu *mux;
+	struct clk_hw *hw;
+	int ret;
+
+	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &clk_mux_scu_ops;
+	init.parent_names = parents;
+	init.num_parents = num_parents;
+
+	mux->hw.init = &init;
+	mux->rsrc_id = rsrc_id;
+	mux->clk_type = clk_type;
+
+	hw = &mux->hw;
+	ret = clk_hw_register(NULL, hw);
+	if (ret) {
+		kfree(mux);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index d92b3b3..fdf58bd 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -68,4 +68,17 @@ static inline struct clk_hw *imx_clk_gate_gpr_scu(const char *name, const char *
 	return clk_register_gate_gpr_scu(name, parent, rsrc_id, gpr_id, invert_flag);
 }
 
+struct clk_hw *clk_register_mux_scu(const char *name, const char * const *parents,
+			int num_parents, unsigned long flags,
+			u32 rsrc_id, u8 clk_type);
+
+static inline struct clk_hw *imx_clk_mux_scu(const char *name,
+			const char * const *parents, int num_parents,
+			u32 rsrc_id, u8 clk_type)
+{
+	return clk_register_mux_scu(name, parents, num_parents,
+			CLK_SET_RATE_NO_REPARENT, rsrc_id,
+			clk_type);
+}
+
 #endif
-- 
2.7.4


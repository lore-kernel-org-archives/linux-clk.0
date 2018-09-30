Return-Path: <SRS0=xqQ/=MM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E374EC43143
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D01E206B8
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="GaiijBs+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D01E206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbeI3HmT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Sep 2018 03:42:19 -0400
Received: from mail-eopbgr10057.outbound.protection.outlook.com ([40.107.1.57]:48520
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbeI3HmT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 30 Sep 2018 03:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsfAisKxoOnn7NKEfEzwaXC79sEhPjDc+DxyGECdtlY=;
 b=GaiijBs+l9uwIBfH/7T822PXFCVh0WT4h7f09HEfBAT2KxcI9Oc1a7DNo+Wpd9MlDbsphpGYszvdlCqHM0zuCKjs2iP/mvVj27eUF9pldj+/YwbmizJ8Xa79T3y+mnVRrB3oPnxEW/fKkwX/9uOvCXr+oPil0Yk+h7fTH+/7y9g=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 VI1PR04MB4221.eurprd04.prod.outlook.com (2603:10a6:803:3e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1185.22; Sun, 30 Sep 2018 01:11:27 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V3 05/11] clk: imx: scu: add scu clock gate
Date:   Sun, 30 Sep 2018 08:56:20 +0800
Message-Id: <1538268986-24890-6-git-send-email-aisheng.dong@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: e4e4edba-0bdf-4e5e-e16b-08d62671a7bb
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR04MB4221;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;3:lBAb5TJHZwLlmiTlSXUSKufHjfjz7z04crEDjRpaJNcGWcaHWX6n1UWQ4Q72IAfVbW6xtS0K5eqtRDYIc6nClih6GZB07Q7WFnCMF2+cRcyn/JHMbBhs2JCJPYqbCLYjaTpsDoYASOxRDpouuh+iMAK72enLsSdi89T4PASoPbHxPWcFS+hcYXzeNJWNXLM4gif8uYanmqMLq/Svif9MQwxOKtmhb7sMUTq3QBXDiOzUPQ3xay0H7BMUKstt0blf;25:Zm98MjcdKwjHeGTU46Begy487QAVCYGFSnTV4nZNHlJtLZEHI+lHHoO5V6mRao8jEgpUCs4SdWqguYochGbfAnt0z94wEYyI31IqN1uGJJLv7UZ2qomrphLkv5JwZtHpN6s9/7Gh1yaFzYz4ExCes8LkCDmLBuUGAEMWQdL4l9Njf1peaq2ESy3sdoVNQf03k5Bqw8FsJ4gar0FrWRCmFXdtKNmFtBZJJn56OSzbs6fa0UxqaUcJ6U3XwXWR7BfdS2RXBLCyvkSc7kGFegfw6uIRD76/LqXjU1c9BamDWrK1sjuqnQ8VBXEO9PxTKauwpmymv2RLZMLIc0IW3+GsWw==;31:lJjLCpj4EHx68TvV8Wv86jt6yskTIe87muqnQh8ddmCrHo3qqxRdVUWnJBUaDYRGcZGYTWRX3B71bFpXokpiTrSLVClzf/Zm3vgiO1IQvwcXOwJbsZAtyyUF1Ijvrjz17GsqWtp2XtBC1yyL73IvankxQj0hGtdjlH0AqyWsj1JyDRObPAQ3SnAB3DpiHG2ze5Dl18WxFX/smo5zqdiBv/53MUITG7kR+zjA1+M8Nhg=
X-MS-TrafficTypeDiagnostic: VI1PR04MB4221:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;20:zsEi5Cj8OWErNkOBmR/EHHDJ/g4T5LU7WhSCfNogTwPC0wBxLiA3xS0stZo9YJKxqT2/gMmmche2G5PUyPSPMncAQnB9EvuSU7oUGYVxynUqRrlZHRoxxntbqxpAIoeq+Yt8P+R1oYB0cp+4R3/SzoN2lcSP30hvE61X2ZtuF9K/v/EN5p/ESRZxQtg7xEFEyl2GxZiRAq/meiXY1r8sDfgfdz+IzEW3CI95hV/5826qQolezZvGueWcs7FWIjlT9feyjgahfqG/mRNGI5A3EzUaKMEZj4M4DZRsOVRo9McBPHf24s1LhxsfSC40NS1c5urOmSswChlNOsETmtF3wBc+JhzBhDmvVL/5I0MEclyvbTUj9s3CX5O7JjpEhiVUDNnZLAeue8gJNx240fslPjvOdNTpfp82tip/Dr0KhfIsIgpvY7Pfp1yYjUEIptt9k/mhcDLHI09ZtsL5j+DU7mXMbKpfgNgJU7z1sNp8d1JLO8TUy149ma+dFsQV5mL/;4:GlW8SZGJvHHDTlDiNy5awNmmjiJZEU/hhiZyekfsgkVcvh4iv1rqxZR5N4fWqrdm4Xo++NT5y3GyxmpPBeNT+VlJH6eqMri/lWL2VIAw4wynEkOVGZHqKOGjYBP82PZC4E33bGn7ehkjyMs4+uBKtdAMRak+4nkPeRlqn6Dh+5vp7tqK/kAb634GacFzeM+mjXHdNy9N1hDnBxaYVzlzTEiLDJTHvj5LgGP0p2vo8lHIzNwWGmCAIbvAHSOLlHQZHehiwuCipfApD3VcrcAKAmCXYavHnGGgiPORtqfdI8LaRnPZh3O1RajCjSyt1o+j
X-Microsoft-Antispam-PRVS: <VI1PR04MB4221BFE359F10A9789A7F6C180EE0@VI1PR04MB4221.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(10201501046)(3002001)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(201708071742011)(7699051);SRVR:VI1PR04MB4221;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB4221;
X-Forefront-PRVS: 08118EFC2B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(366004)(54534003)(189003)(199004)(14444005)(6486002)(81166006)(81156014)(66066001)(6512007)(8676002)(52116002)(53936002)(11346002)(446003)(2616005)(956004)(476003)(486006)(6506007)(48376002)(26005)(2906002)(47776003)(386003)(6916009)(478600001)(97736004)(68736007)(50226002)(5660300001)(8936002)(6116002)(50466002)(6666003)(3846002)(76176011)(51416003)(106356001)(25786009)(16586007)(4326008)(34290500001)(186003)(16526019)(2361001)(2351001)(316002)(105586002)(36756003)(305945005)(7736002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4221;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR04MB4221;23:MawyCoGSHT4lnjUi0IvOOsp10QwJSAetjHhr6zIpd?=
 =?us-ascii?Q?gBeTtOEzZPHjrwxndYxdrZew36fa/Xu/hBOwNeysBUIvRcb9Z3kj9+qP3I9G?=
 =?us-ascii?Q?6+BibYlz7cdsQ5gFiNrviOiMWcCbZa/an7Vw94vndaQsFBhmjKZkmLJsE7A+?=
 =?us-ascii?Q?68H2aeK4RoAMWgOOaAPXQjhkvnUuJZ2e8p+VixUxDr6x+HnhpiEFYiSvsb67?=
 =?us-ascii?Q?AO9Z/O8WJRCfTf59kAtMBxmvccQ4d3AMgwbtucv+mCmmoD9+niDsYn6U1v4h?=
 =?us-ascii?Q?4kwpaWsrB2jyv08wB68I/e4axB6yhRjF2GrHajt6WUpzc1F6w9p9w9IY+Mc+?=
 =?us-ascii?Q?7ecmjw4OsNIHJe7c1LKEQyNuvrDK7qaYg/nsKxh0cacIt0Vr8gv0ZLQLdzUJ?=
 =?us-ascii?Q?NtCJgBGKpFGIsYvpF9b8vwwz87Ub9KVKXEGYOKZp+csaD+s8T7d1Y4oogwy7?=
 =?us-ascii?Q?BlPhxCrBlxWwC8w+tkLVCceFMkzn8BV48f0UJRuwsY+AIPjNYeKxzliBgGvT?=
 =?us-ascii?Q?rWjnOvAX1drLgg0uinfdMEHuFdD8Y5hASdnTIeZYQRfEsEdexprEQEwwOF4P?=
 =?us-ascii?Q?QwsJuuUH8R9kG1dLlikQBYeEe69/P44wwHFmt7xfJFSrdG6/oYpwR8gCXOkj?=
 =?us-ascii?Q?CTA4hK1eY9aN3pdzSQMXMf5xw1xIR9IiDCVodqn3z+ole6uhLDxX5a1KkK2j?=
 =?us-ascii?Q?bM4sqGemeMT0TBI68Aef8auW52bVlOx3MSWr09oCpAWndfkQsUSY46cHWRyP?=
 =?us-ascii?Q?g4hO24ioOIzsmutEMedRVLiSwCmrVJtiOok5+7E70rXWCOoi61jdbOa6WO4h?=
 =?us-ascii?Q?4OXCmG+PSBJ3IoxxcPuygIWJn7yVuJ83g+sxyOUPrMMkqviv1vgZMhaSY1ER?=
 =?us-ascii?Q?XAotIKPuasgqLt9DeC/xTQnZI4NWGeD6BLKak1UDfASHSVyglaT+2NAlVEnB?=
 =?us-ascii?Q?D+svITP9BlSIdXuPdatM7rbjD2356BZTs+BtKF/VwC2P1Hmeqm8u49YAH1w1?=
 =?us-ascii?Q?I9UWlBvlplBaSIfA3sdMbg7jBzvZD8RhkU1FpdOJyrpPN/MjHS5p68G/6fGW?=
 =?us-ascii?Q?gGl4pLGdnXH+f22djlYjoP3J3sIxr71z8vzhkoHytTLEaMsPxSoqSvDjAH4Y?=
 =?us-ascii?Q?U6LVO88VbdCz0Ac0/wkw+vcsLND711Ede6U8sFuivZVsbKsGv0gRpwRRuqry?=
 =?us-ascii?Q?xjXsstqvpx8HRFOWTBNws66p0y06Ust/yW2dur5lJlf6oVX8nnyAuU0cp7xN?=
 =?us-ascii?Q?8KLaZF2Dxhrn+Ns+zRZBgeAeK9JeSVScSAzynGg?=
X-Microsoft-Antispam-Message-Info: pr/GOoVFcgyFfsbzeSI1EE3Bagq3YyDAzB62Mvj1pqK1GmP541RvOsVdx70ibjGqDdXlcJbWYKDpuybu+Lz3ABiv05UTOIdbTzVuIkj6ocu3CemG34ySwci/K1jXo68l4UyNeyRetT+nwehALoNMZQDCj5kn85Yz63MdeoZ8FTV/1sMvO8T4SeRhgbnd4lpmJ8B8eCxA5hAU/h50rCTw6TvGpR+lXF+ub65GkIszY+GIXJfU+OjERUMvW+IBhUh491ejI8TZ2xXfdT0rZInP8fm8CCSl+Lp7SH5ilevw7EqT1sM+T8QXGsX6vl65KI2NyxPEKd6OjvKA4BlzwZq123qlTl8vwbhAtuNS/I+ehk0=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;6:CTwjc1hR0F7C7wPPhiYZ8CSG8sYK7xm6YJbemIeSKKDFWweSZnc9wJG4G6Ua+T2+g8lZFCMHwzlnGJT0bCyoksAc4Af4AWovr4zp5QhOV7ofZHZaAyjtN1bPVXQbrgAeIXXtjiMrI2mN6R3Y8UBaYcDgTJ5h7V1/Y/6KO+c9d1E4L/o7FVbAgM3qUE5utWGzKOPSdv+qEV5PGGRRy3hhdK4Lit8wFwbpLBLgwE8teQVKFQJ8VBNuW7wuOY82McXDA36eygIpDad2TX6b0ZJcLcr34tn57I+TDyFnPPzsWTMq8Mva4h1VAUN9adzVhq2/GY7WcTmoqYLH5jTi5NEjddFx4p7pJiQjxYtEpX+ibMg/sQ9UaEvjlPREqOcJHYxz3S4uFlaKod5xHFQqKyWrovQMGtypPZViyj6NhUieuVTOTs6U7Lh1VLcKcJFrS11IP+uqkOmQkiXVhPMjdp77MA==;5:080IfAP1z8SCMWdOEDvRFyPYQttQ0I6FX+Tpg+ycPDts4iGelwDVe5DWq62MWk4pI4yrU5Q8FetdbWjsfqm4f5kH6w1vXwU/Ipm6LYeqaW96BdJLmwwIu49D19ijxkqQLxJDjc+8DkPCUtyooRTOVRfLBbFb2BiMF1YRNWoUU0U=;7:Sy3I9bHSrP5tVk+OVA/hMw9HwzhcBYpDQrGJzYCqDlmQ40ezTIHoHvgrfRZ0a5KtFtMKLlSF/7McUy22L6BNRtbejk2A6GXM5+KCFELn5WeR1caTb7spW9+lq1w11mzphR46rPZSoUUZLai7vHDBe/8YrCaaXQcM9o26IHwqRsC8BP4AYthhMUWReCu4BZANWsKwxNHQC8tEj96WhYmRfnBglM86pNEJIeczjF+ymi74jF/IhJke1wsdFDImsopG
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2018 01:11:27.9332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e4edba-0bdf-4e5e-e16b-08d62671a7bb
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4221
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add scu based clock gate.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v2->v3:
 * structure names and api usage update
v1->v2:
 * move SCU clock API implementation into driver
---
 drivers/clk/imx/scu/Makefile       |   3 +-
 drivers/clk/imx/scu/clk-gate-scu.c | 223 +++++++++++++++++++++++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h      |  23 ++++
 3 files changed, 248 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-gate-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index 9e7f4aa..2abed17 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -3,4 +3,5 @@
 obj-$(CONFIG_MXC_CLK_SCU) += \
 	clk-scu.o \
 	clk-divider-scu.o \
-	clk-divider-gpr-scu.o
+	clk-divider-gpr-scu.o \
+	clk-gate-scu.o
diff --git a/drivers/clk/imx/scu/clk-gate-scu.c b/drivers/clk/imx/scu/clk-gate-scu.c
new file mode 100644
index 0000000..f55b8c0
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-gate-scu.c
@@ -0,0 +1,223 @@
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
+/*
+ * basic gatable clock which can gate and ungate it's output
+ *
+ * Traits of this clock:
+ * prepare - clk_(un)prepare only ensures parent is (un)prepared
+ * enable - clk_enable and clk_disable are functional & control gating
+ * rate - inherits rate from parent.  No clk_set_rate support
+ * parent - fixed parent.  No clk_set_parent support
+ */
+
+#define CLK_GATE_SCU_LPCG_MASK		0x3
+#define CLK_GATE_SCU_LPCG_HW_SEL	BIT(0)
+#define CLK_GATE_SCU_LPCG_SW_SEL	BIT(1)
+
+struct clk_gate_scu {
+	struct clk_hw	hw;
+	void __iomem	*reg;
+	u8	bit_idx;
+	bool	hw_gate;
+	u32	rsrc_id;
+	u8	clk_type;
+};
+
+#define to_clk_gate_scu(_hw) container_of(_hw, struct clk_gate_scu, hw)
+
+/* SCU Clock Protocol definitions */
+struct imx_sc_msg_req_clock_enable {
+	struct imx_sc_rpc_msg hdr;
+	u16	resource;
+	u8	clk;
+	u8	enable;
+	u8	autog;
+} __packed;
+
+/* Write to the LPCG bits. */
+static int clk_gate_scu_enable(struct clk_hw *hw)
+{
+	struct clk_gate_scu *gate = to_clk_gate_scu(hw);
+	u32 reg;
+
+	if (gate->reg) {
+		reg = readl(gate->reg);
+		reg &= ~(CLK_GATE_SCU_LPCG_MASK << gate->bit_idx);
+		if (gate->hw_gate)
+			reg |= (CLK_GATE_SCU_LPCG_HW_SEL |
+				CLK_GATE_SCU_LPCG_SW_SEL) << gate->bit_idx;
+		else
+			reg |= (CLK_GATE_SCU_LPCG_SW_SEL << gate->bit_idx);
+		writel(reg, gate->reg);
+	}
+
+	return 0;
+}
+
+static void clk_gate_scu_disable(struct clk_hw *hw)
+{
+	struct clk_gate_scu *gate = to_clk_gate_scu(hw);
+	u32 reg;
+
+	if (gate->reg) {
+		reg = readl(gate->reg);
+		reg &= ~(CLK_GATE_SCU_LPCG_MASK << gate->bit_idx);
+		writel(reg, gate->reg);
+	}
+}
+
+static int sc_pm_clock_enable(struct imx_sc_ipc *ipc, u32 resource,
+				   u8 clk, bool enable, bool autog)
+{
+	struct imx_sc_msg_req_clock_enable msg;
+	struct imx_sc_rpc_msg *hdr = &msg.hdr;
+
+	hdr->ver = IMX_SC_RPC_VERSION;
+	hdr->svc = (uint8_t)IMX_SC_RPC_SVC_PM;
+	hdr->func = (uint8_t)IMX_SC_PM_FUNC_CLOCK_ENABLE;
+	hdr->size = 3;
+
+	msg.resource = resource;
+	msg.clk = clk;
+	msg.enable = (uint8_t)enable;
+	msg.autog = (uint8_t)autog;
+
+	return imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+}
+
+static int clk_gate_scu_prepare(struct clk_hw *hw)
+{
+	struct clk_gate_scu *gate = to_clk_gate_scu(hw);
+	int ret;
+
+	/* Enable the clock at the DSC slice level */
+	ret = sc_pm_clock_enable(ccm_ipc_handle, gate->rsrc_id,
+				 gate->clk_type, true, gate->hw_gate);
+	if (ret)
+		pr_err("%s: clk prepare failed %d\n", clk_hw_get_name(hw), ret);
+
+	return ret;
+}
+
+static void clk_gate_scu_unprepare(struct clk_hw *hw)
+{
+	struct clk_gate_scu *gate = to_clk_gate_scu(hw);
+	int ret;
+
+	ret = sc_pm_clock_enable(ccm_ipc_handle, gate->rsrc_id,
+				     gate->clk_type, false, false);
+	if (ret)
+		pr_err("%s: clk unprepare failed %d\n", clk_hw_get_name(hw),
+			ret);
+}
+
+static const struct clk_ops clk_gate_scu_ops = {
+	.prepare = clk_gate_scu_prepare,
+	.unprepare = clk_gate_scu_unprepare,
+	.enable = clk_gate_scu_enable,
+	.disable = clk_gate_scu_disable,
+};
+
+struct clk_hw *clk_register_gate_scu(const char *name, const char *parent_name,
+				     unsigned long flags, u32 rsrc_id,
+				     u8 clk_type, void __iomem *reg,
+				     u8 bit_idx, bool hw_gate)
+{
+	struct clk_gate_scu *gate;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	gate->rsrc_id = rsrc_id;
+	gate->clk_type = clk_type;
+	if (reg) {
+		gate->reg = ioremap((phys_addr_t)reg, SZ_64K);
+		if (!gate->reg) {
+			kfree(gate);
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	gate->bit_idx = bit_idx;
+	gate->hw_gate = hw_gate;
+
+	init.name = name;
+	init.ops = &clk_gate_scu_ops;
+	init.flags = flags;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.num_parents = parent_name ? 1 : 0;
+
+	gate->hw.init = &init;
+
+	hw = &gate->hw;
+	ret = clk_hw_register(NULL, hw);
+	if (ret) {
+		iounmap(gate->reg);
+		kfree(gate);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
+
+static const struct clk_ops clk_gate2_scu_ops = {
+	.enable = clk_gate_scu_enable,
+	.disable = clk_gate_scu_disable,
+};
+
+struct clk_hw *clk_register_gate2_scu(const char *name, const char *parent_name,
+				      unsigned long flags, void __iomem *reg,
+				      u8 bit_idx, bool hw_gate)
+{
+	struct clk_gate_scu *gate;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	gate->reg = ioremap((phys_addr_t)reg, SZ_64K);
+	if (!gate->reg) {
+		kfree(gate);
+		return ERR_PTR(-ENOMEM);
+	}
+	gate->bit_idx = bit_idx;
+	gate->hw_gate = hw_gate;
+
+	init.name = name;
+	init.ops = &clk_gate2_scu_ops;
+	init.flags = flags;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.num_parents = parent_name ? 1 : 0;
+
+	gate->hw.init = &init;
+
+	hw = &gate->hw;
+	ret = clk_hw_register(NULL, hw);
+	if (ret) {
+		iounmap(gate->reg);
+		kfree(gate);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index 10aa687..57de592 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -36,4 +36,27 @@ static inline struct clk_hw *imx_clk_divider2_scu(const char *name,
 struct clk_hw *imx_clk_divider_gpr_scu(const char *name, const char *parent_name,
 				u32 rsrc_id, u8 gpr_id);
 
+struct clk_hw *clk_register_gate_scu(const char *name, const char *parent_name,
+				unsigned long flags, u32 rsrc_id,
+				u8 clk_type, void __iomem *reg,
+				u8 bit_idx, bool hw_gate);
+
+struct clk_hw *clk_register_gate2_scu(const char *name, const char *parent_name,
+				unsigned long flags, void __iomem *reg,
+				u8 bit_idx, bool hw_gate);
+
+static inline struct clk_hw *imx_clk_gate_scu(const char *name, const char *parent,
+				u32 rsrc_id, u8 clk_type,
+				void __iomem *reg, u8 bit_idx, bool hw_gate)
+{
+	return clk_register_gate_scu(name, parent, CLK_SET_RATE_PARENT,
+				     rsrc_id, clk_type, reg, bit_idx, hw_gate);
+}
+
+static inline struct clk_hw *imx_clk_gate2_scu(const char *name, const char *parent,
+				void __iomem *reg, u8 bit_idx, bool hw_gate)
+{
+	return clk_register_gate2_scu(name, parent, 0, reg, bit_idx, hw_gate);
+}
+
 #endif
-- 
2.7.4


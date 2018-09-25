Return-Path: <SRS0=aw6K=MH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6B9C43382
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 17:00:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 931DA206B5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 17:00:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="OrlXsNSs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 931DA206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbeIYXJR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Sep 2018 19:09:17 -0400
Received: from mail-eopbgr70052.outbound.protection.outlook.com ([40.107.7.52]:28491
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726922AbeIYXJR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Sep 2018 19:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0aqRxqzfrR+rMGrufs3ngka3mKBVYboCo1OtZNhb3E=;
 b=OrlXsNSs7vUsXx9bm7SbxBIyY8Ofa/FBvQUAFcW0KEOuOm/T25ndNXYceQaujlZcD5H6wU2TeZVzxrnQDFEb9JIR2OjPbiWgWS5sBy9HYsYCWBSO+gklwYPHW5G8xThqW77svc3uJd3zRO6xPoY0JpoU+inxQzaJAt5zQCvduMo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 AM0PR04MB4211.eurprd04.prod.outlook.com (2603:10a6:208:66::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Tue, 25 Sep 2018 16:59:27 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V2 08/11] clk: imx: scu: add scu clock gpr mux
Date:   Wed, 26 Sep 2018 00:43:54 +0800
Message-Id: <1537893837-31172-9-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537893837-31172-1-git-send-email-aisheng.dong@nxp.com>
References: <1537893837-31172-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR03CA0033.apcprd03.prod.outlook.com
 (2603:1096:203:2f::21) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f98c4dd0-857e-4902-750a-08d6230842d9
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4211;
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;3:sUcphyPim6rGfId5Sq9yiIueNWb1yXkYPuT00IzdylBjlYlzVAtN0s6vt7UgAvgkn+Z/acMUiHsXkuM8MonPR6FFWHlRCIepfPqAM97NIIsphunU0FkU0BYpxOIJrTaA9tz+ftiLuQYxqvLHk1mvQ/Vhd075Ob/hmqF6hFTlOMVBjcW2LD91ct4UfgriEUMgD2SzUI4Jry7SG47G/tjkffR41Mfa0jSJZmRM+v0WiFJ0qiAfVduXnypyw/gBxMKA;25:kganZjWGt1m/6c5eLXUZfdSfGQrIT8ibTkEniQMKPZKVxgihUUNi7/Yx5hG3rNFqmwMczHBQWB5+tVr5wgPyOEzeaF0292E2DFpnSJ9aTZoZRkgMVYN/iY34ynC8mAPcqhL7RCPrQarfwvq7AMHyhn96PXGh5UkiLvXXnVbaS9bED4HXIELLdBwyq2XS6rVzBfhKdSbghFUCXBSUT/u8p8wITuqF11X3yl/DpdjRz4I/UXGd9LZHbwenY7l/dV2R+uIk1sFtRihRPzB+wyLBvVjEpyfVhEgXCWTw3sp6+z6ODYVs23XDUh5merKN6H6l0/PAbngw6NP9igQLlrSqVQ==;31:Rq3w7pOvJHcbzIUWVKTXD92UB3uwY7VeGTPzeVV/VppZuDzVSZBahvDGsnETwRB6OMjV656tkgFxKfh8x4QIprVXHM107TzPQ7lXeZit5OC2L6seJpDPgkUGzr0kCta7z8jZ482Jot80AphlaslyD+KShPsLMc9bekSA7uOUzDy1zKy/142PeQFM8QWzQbsCAwtqnT6qAvzJwMOZYYNBrlSU7iiOMT6JA1rItoRStL0=
X-MS-TrafficTypeDiagnostic: AM0PR04MB4211:
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;20:Mn5oiZtZghtegrdcgXOVb6rlfIWmHASf5zpz9J3qRTuBKp2JqgTEmU0EiR7V/IDcFRvKvkd2aXW419iFGq5yKWUbm21CVpyUt1TrM2XK1X8Hdl/1fzh0F4GZBb1dbZatvgLjgFamY3/mTwSuUDpJwVumrbW2zsmFdDb1z5GhojH5FF9eZpPZ4Jpq+F++vpHcskhxVzfFUoOyCBrieAgSLCJgFfGvpDEJb7uy5KIhFqPNn13oqZ3C/CINqnZPLVAPe2ju/HVu8j2ImmnrRTi0JIvkII8mESE5q4KP2ikPhf86vWbMsrxRkWEPkmiCrJ7pGrMTI+BB8SwRRgIhkDYcVyQgPeOsIZk3a/Q1RaWRE9yEgNYrB7lMt8igThheArY49UIjal9ijCRhq304O1sTpU1RE7FdtGCKCWWI7knOYWQv4dKOvF7rqe/CabpvlO1QqQC3ApR8x3qA/mwa9Ug9W/G8lMRivVUk5pSSRT/sadRItCObJan5fMjEsD72Y6wT;4:+WkLX7RHN0aPvyqaURUQ3iD9cXwSh2ZPi+bmbMNDFYZdhS19v7lissf8npxHIDIz+qrkpahKtiNl1FT2+04bM8XW+tYZpctqp3fKNCm3bFn7Hwj0wQdFkMqpPZ4qCDlrKI2QQtVL0UXmA0dMc1/R3F5IR/QbQIdP8Ft4D1pOGCu2aCE+9+3M1j1H2qqYTFUNNvWBRmWB/DxfZnq4AO02i5O77Kw7KxV+C5EdLsNunbXrX8ULuizcVg/R4xM0QPloLZs721lQGGQqSRTBm1ZWuaaSWgRHGt4S4gjwX/pGXF3Y+UHD98ARNvijy4p7XnbZ
X-Microsoft-Antispam-PRVS: <AM0PR04MB421138968614B66C145C19D180160@AM0PR04MB4211.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149066)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051);SRVR:AM0PR04MB4211;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4211;
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(54534003)(199004)(189003)(478600001)(6486002)(11346002)(446003)(53936002)(6512007)(68736007)(2906002)(48376002)(6116002)(316002)(3846002)(34290500001)(14444005)(106356001)(186003)(16526019)(2361001)(2351001)(26005)(305945005)(7736002)(486006)(36756003)(66066001)(4326008)(47776003)(25786009)(105586002)(6916009)(6666003)(50226002)(97736004)(81156014)(8676002)(16586007)(5660300001)(956004)(52116002)(386003)(86362001)(2616005)(476003)(76176011)(51416003)(6506007)(8936002)(50466002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4211;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM0PR04MB4211;23:Hj66sEgA/7EU9IPKbCVUOZSSHaa3dyDVgSx94j06s?=
 =?us-ascii?Q?Of/Ytezs7k6hP8gFuibH0fNiINAe6q6iMIN/qRWx2j3T20U2Ifje2ug2Ho+P?=
 =?us-ascii?Q?1xNCF3QO2CfUOxze8dNs0RXk3v5eOZCD7shFeZEzyjhG+5sGuStQRVnQwwbx?=
 =?us-ascii?Q?L7tF8NylWg2tHXeZpy8BjoSsjoozQwYvU0V/+46lnXhoBU/sJLIO6ye3aiA+?=
 =?us-ascii?Q?3RAhCWl0n5bfVoIETyllnhVxcHJktGMVdBS8dssZdvRi+FXMVphI37gxK8ox?=
 =?us-ascii?Q?k3+bPXwvmVMUiHLO6YHVZPpuV2Lpapfr1l3lGFE8m4VXVlO6YPlo/IxysHrk?=
 =?us-ascii?Q?0K+o4vhzi1SQhConprHGu6yam/sSZ5oDHLyxHZ2H8z/12Pb9duJpoUa8QZRz?=
 =?us-ascii?Q?nl0nIRYzGekFCsl8d31Pa5KMtVqpvi+H36lOim/e9egEVzTJ6XiA03WgMHcB?=
 =?us-ascii?Q?vzwxOVqkZxpv+cQ6XZjlRRcYhqkfADFlL151kzouOAEYfB0pQaXVD0v0OHw9?=
 =?us-ascii?Q?CvRX51mF0JydkMXw7ZLTQYsDMFN075cmQNn1xy/wti8t0k32ri381Gsn24UX?=
 =?us-ascii?Q?LpqPe7MeAFXg/iiHnVOw3906XbqFr4uFYc4d289PG9YvRd6zYLovpdVTDqCs?=
 =?us-ascii?Q?4d/R3FsoPnBnHye9GJGmvwCqbyy2b1rfcjsuhAyVtgKUpIXLRVWBLjPTE4F0?=
 =?us-ascii?Q?KrpKbbGBHVYqBTERrbWjWn6V64GbdueuaiEWtFc4efqq2XllfPkW2ls+4PZ1?=
 =?us-ascii?Q?MmsKW0UzXnjZWD/DOE/89PMEzo6IXvDyob6iZ9bgIrafR83eOycHedaTjn00?=
 =?us-ascii?Q?murct4m3YGZ4yq6Xf1LWS8Ilt0ouiN6PrmP+kKBTPSs7+wxMRGVofMby6ob0?=
 =?us-ascii?Q?VizSwjM5+6fa3VMPgRItHmOzLnjXXFPq278OJdNnAWHUIeDl/KtHHh4v8xb/?=
 =?us-ascii?Q?j+c4pP9US6GtpA1O2B5j+dQJBgwbE814fqpPV3nMCUQwU3qPYxTYDmJH3Kye?=
 =?us-ascii?Q?Q/ORdqe2iFJqMhlAJldIssKVn9mlnoHYJb3TZQgvI9XlEwsUD+eAU7Ll50nG?=
 =?us-ascii?Q?WMGY1G3p0LFVmhw0ZhRASyJDAZmZXnL+US9dAwI8/2cSa1leP7jHj6omgJxq?=
 =?us-ascii?Q?6QSfRDsZ21f3CT81OXGbGLZhapD8OYb6THVtYfpCYOurBGi03x0/dl+0bm8p?=
 =?us-ascii?Q?5u4HiyHf2wvJGLY0uMxKwILG3OvEekzp3IjEkkBcvsBBi0+SuNE7UgPQ7gEN?=
 =?us-ascii?Q?x3To3EaKncKXGO4EItm+vyrv45ysqg2ph/T0Gcc?=
X-Microsoft-Antispam-Message-Info: 8cpiE3fwSnTKL3LAUljj/LeR6+JM3kPFeuphV7Q5GkUQcX234D1uDvzpbRd1683eK9lVHEH3a35Jww1/nV+1P9/GhwrzyPBM3LjNzr+y/L8nj2PCO0+qfb3FIqSVX4AN86akVTI2Kh3ff520IFd+Bc07kYav3H8qnC66ome9JG5u4+AeOkFNIyxulk1dk6ca+6D6B9GcCqoLqGd3LHYlBzNFWvcqOqx84wtzi7zqJWF53gnhrpMPrLcdYO6mYypWOydpUQiQ2qutdJyAiSdfeimu1wij71O/E1u4gixefvvBlGs6zX+n5r9F4YAJukhHZrtR3YhC0I1M82+K2EKcKqq+h+L8yw/PrVluKTZo2YU=
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;6:6iiZ1/J1+kYLemOifm7wWxa+MFjrJCPlZiny5d6N4ajetzjFS7ZyVdXORn3XR5CIuRJeWAyeXcxam8gJthRRIMOD48gIrS+zfsRTh4/Ilk4mGBpQpDGiLpTCydpH6eqQFfJlnVO1iMLQ1ibF06iUva8PI0WuL1tpslUS4IZEx3WxgjSwFj2TidSCFvLrQ0W63kly0AYawfMU/LHx0UNoA0hySBlMg/pUSffVNcoThkC7GT8jPE5lTo03ZwDoGjZDpUPN+SFsKQ7XlAIE17viuEFARQzGtoYdc1qgm0IE3Pmo7df6lnLg3irbhtUPHmZ9awgZvna20EV/1NqjHfD36l8xF2rE/dUv2nz7dhw6uhngalX4uogvZWl/y/tr1ADEHR5G8yMRuH6n/dAKHG31VCwLmVDbYAidmQ+OkTamLrD/f/NtjMVJnsisSb9FGbVeCxV1s0leLnq6ikIrbH02DQ==;5:RI6c6G0SlFkwJF+1ackniEsDhBwUIty/howeS3vxxMPqXYemtSveghccslPzm5ZCVQXdqBIAx6ShhOj4aDWaYwOaj9RJRdGkctCo/0NXTRzQFJhAzWAaL5CWH5h1d5Tc3yd3Ttbw0MJ2U/33+UwQ8ntGKgBRESCXB5hCQ5f9i1s=;7:dU0bHjaQYHh6dJCvnVieTH6GzZUTJL6bcj0r5iHR+YO8yHxcporeKTdq9F4COujOqOTaNnxTqAFtgCxP7G6XHvv/QFdeN2Du9R43jmmsuCrOXhEIbmIBZL8x0HMRqYHfuiLebkW8fvxT5HUTISaxxgNZYmCKCSJVKKGOTPdF19XmtfJw3uNIjrX/iZxPlWLiqr9ZGi800IWI0C/mmsgheP0e+hq0J1pGpdFSlwhgEmFMfZ4lJ5feBFkSmUX83ZaN
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 16:59:27.8543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f98c4dd0-857e-4902-750a-08d6230842d9
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4211
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180925164354.Rpe61lNKoAJr2CYfGA6d4EwazyVcqtBu78540yNasAk@z>

Add scu based clock gpr mux. Unlike the normal scu mux, such
muxes are controlled by GPR bits through SCU sc_misc_set_control
API.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
 v1->v2:
  * no changes except headfile name updated
---
 drivers/clk/imx/scu/Makefile          |  3 +-
 drivers/clk/imx/scu/clk-mux-gpr-scu.c | 90 +++++++++++++++++++++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h         | 11 +++++
 3 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-mux-gpr-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index aee56bf..a76ed78 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -6,4 +6,5 @@ obj-$(CONFIG_MXC_CLK_SCU) += \
 	clk-divider-gpr-scu.o \
 	clk-gate-scu.o \
 	clk-gate-gpr-scu.o \
-	clk-mux-scu.o
+	clk-mux-scu.o \
+	clk-mux-gpr-scu.o
diff --git a/drivers/clk/imx/scu/clk-mux-gpr-scu.c b/drivers/clk/imx/scu/clk-mux-gpr-scu.c
new file mode 100644
index 0000000..c4b5687
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-mux-gpr-scu.c
@@ -0,0 +1,90 @@
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
+struct clk_mux_gpr_scu {
+	struct clk_hw hw;
+	sc_rsrc_t	rsrc_id;
+	sc_ctrl_t	gpr_id;
+};
+
+#define to_clk_mux_gpr_scu(_hw) container_of(_hw, struct clk_mux_gpr_scu, hw)
+
+static u8 clk_mux_gpr_scu_get_parent(struct clk_hw *hw)
+{
+	struct clk_mux_gpr_scu *gpr_mux = to_clk_mux_gpr_scu(hw);
+	sc_err_t ret;
+	u32 val = 0;
+
+	ret = sc_misc_get_control(ccm_ipc_handle, gpr_mux->rsrc_id,
+				  gpr_mux->gpr_id, &val);
+	if (ret != SC_ERR_NONE) {
+		pr_warn("%s: failed to get clock parent %d\n",
+			clk_hw_get_name(hw), ret);
+		return 0;
+	}
+
+	return (u8)val;
+}
+
+static int clk_mux_gpr_scu_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_mux_gpr_scu *gpr_mux = to_clk_mux_gpr_scu(hw);
+	sc_err_t ret;
+
+	ret = sc_misc_set_control(ccm_ipc_handle, gpr_mux->rsrc_id,
+				  gpr_mux->gpr_id, index);
+	if (ret != SC_ERR_NONE)
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct clk_ops clk_mux_gpr_scu_ops = {
+	.get_parent = clk_mux_gpr_scu_get_parent,
+	.set_parent = clk_mux_gpr_scu_set_parent,
+};
+
+struct clk_hw *clk_register_mux_gpr_scu(const char *name, const char * const *parents,
+					int num_parents, unsigned long flags,
+					sc_rsrc_t rsrc_id, sc_ctrl_t gpr_id)
+{
+	struct clk_mux_gpr_scu *mux;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &clk_mux_gpr_scu_ops;
+	init.parent_names = parents;
+	init.num_parents = num_parents;
+	init.flags = flags;
+
+	mux->hw.init = &init;
+	mux->rsrc_id = rsrc_id;
+	mux->gpr_id = gpr_id;
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
index 43009c4..828700d 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -81,4 +81,15 @@ static inline struct clk_hw *imx_clk_mux_scu(const char *name,
 			clk_type);
 }
 
+struct clk_hw *clk_register_mux_gpr_scu(const char *name, const char * const *parents,
+			int num_parents, unsigned long flags,
+			sc_rsrc_t rsrc_id, sc_ctrl_t gpr_id);
+
+static inline struct clk_hw *imx_clk_mux_gpr_scu(const char *name, const char * const *parents,
+			int num_parents, sc_rsrc_t rsrc_id, sc_ctrl_t gpr_id)
+{
+	return clk_register_mux_gpr_scu(name, parents, num_parents,
+			CLK_SET_RATE_NO_REPARENT, rsrc_id, gpr_id);
+}
+
 #endif
-- 
2.7.4


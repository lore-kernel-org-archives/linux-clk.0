Return-Path: <SRS0=xqQ/=MM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9D5C64EAD
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E6E1206B8
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="f9TwGu5C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E6E1206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbeI3Hm3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Sep 2018 03:42:29 -0400
Received: from mail-eopbgr10057.outbound.protection.outlook.com ([40.107.1.57]:48520
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbeI3Hm3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 30 Sep 2018 03:42:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6pQcXcjQ5Gl3SCA7Za4W13vU/VwuSYwATwJHVfDca4=;
 b=f9TwGu5Cs6ctbXo/ZhqfeU2uGbegHK4LD6gbIQzkE+hG1RFTNl9J8XAFCiqHxLD6ehMptJtP+EOTXhHaVZkJ67JavPQdeJdDJYnVHjY+9M/wN/UssUknWiv7fqhAZU5JUyUMuSdG9vJbDVICLuq6nr7WSCN/YK+Cauo9mVdZUM0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 VI1PR04MB4221.eurprd04.prod.outlook.com (2603:10a6:803:3e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1185.22; Sun, 30 Sep 2018 01:11:37 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V3 08/11] clk: imx: scu: add scu clock gpr mux
Date:   Sun, 30 Sep 2018 08:56:23 +0800
Message-Id: <1538268986-24890-9-git-send-email-aisheng.dong@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 92c3a8f3-a0b7-454f-7c4b-08d62671adaf
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR04MB4221;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;3:8EIfGK3NEx+xLSQPlbJW8j7RkL5VlZCW1ibRwD5/k9TF4uNQJ5ptYIOs62HJdbixaEd6rQ4Cr8uk5VXgBuuIzJUMGbm+wT0tOVS7Uxpg2IoJrqDRgElmIb8rh0O8xyE69VGpu36telE5g5LVdRWngV5fDUCJI6PWkNZxi3psdJ8tIBHXhVC48pvFbRJZy1yvJ/4OcKyucWJLidOKrKdd8BrS1mqxK524YtgiCd/NBJOhXodk3YUE5sfe+17jU2B+;25:cubyDSeaf+yXOn5XVsjY5yNbKHS6e8QH2vSjG+ZrHjs+8paFEpVxnunC/Q3++YwI/BVZJazTMyXQlfcmLFjrrOWEvQvqjgWWeKgI6Tqds0+p2eD7RssgEhxAHAUNifkOtOWAYcQwzl2wob1Z8I6iGRrbFLh5lYOinWIkRHOrfrCPsOWbEud0BlutSsN6WvYiwOa5uq14DgGt43GR0OLZd3tDk4KrNWwSrgzzeOCNx2nI8pzowu8rVu37cxyb3NyqpNBl84trTeNkCI5qG7vT7GtzKN9vQBdxM6p9yRS3ASaqxu15f3g4KOyjITSbrGvWxyn1k9mEAiYaAADxjhvT5w==;31:FUdHodlXNYNXPE7fYDh8tvMM4hgBJmQ4ZLGwka5jsk1kWlt5rypf3EasKR+Lp8jYxMG3IsjjpbhUXFA0p9hXMgaId5WLsOBey/4AZl2pgI0a4v195rR6x8pyfBmCaDiboXoFzOmcGgKsM3Sw4vTdNgSdMg6qpp27oXBZJygoK0DAG0SP/ihLXWcShgnswtGAiKCEBGkqonaj3lmsvV6lGYSNL8HYahlJEIlQglbtvIo=
X-MS-TrafficTypeDiagnostic: VI1PR04MB4221:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;20:PchDW6p4o6VAT7WkHqw8yQWKvy2yLprLGsUWxsiJckwG8042bwl0UkM1soHkQR5nGjDy4eVqTxhrxhgLzZQ1etm4cYdZ0GFJ5QsxHfVvmdvykcLeaiF4cJgMO6Jyzmdx/2MGRq/w4E67ocp0SgrUk7kIWTsnWKDxErXoK73ha4DZ7rgh2N99yl32WAPC9Tb+EyFZyTPZcpOfvki1Bex59C882n+J9yQqeJ0aFXLaGaGLfgTXs3vQOzqz5XnEu8rrlVHRdtcUnCrb8zKs5eBKyY2ighK49mqWLg+8fnXlm2Vf3QHhYjKnzri8fSMEiUNhQhfBN35WrKk9R8zWRLHLvj46kBtpD5UlFJwHF74V/8huqq7txX2Zr3YleRVqw1RFFgLCRSkBAhwRKYNryNMklbg4TRgdRTAWDzDK9PYbinEeXa2p+EyMHehslgGlusJylqCCJpGusGVALASw0233UsUcrgYuYlBisDiQdpW/xwEnr20SU8gUbm2orfInDDvT;4:P8xI3NgsE67XjRTs6MySoIfKrUxaCUpWiO38KbgfmdvpEex/rXp+BFdKobh9mo9FVDJyMnkAJNx6gPGTiUhk1+94wee/CaC/nVoaVff6Jx9K/kw4WvKuI/XaR0ZoVmAj5rhJYD6wgvJseZ4OUxNHRbbgThdGeUloPqaLv8s79xWZzzs3L1ifOJyLFaslgPkQXDxB/kOTFR6MtUU57dbGOMz9jEuFevNd0T2vwZAo/0BGc/gZWUVo+8uPuUkx5SjvUwUzollAC82F3RCEsVQFbEy9+Clm1drMAmMCVaHb/xbX7uKDpcATh4cMlAxIRkB1
X-Microsoft-Antispam-PRVS: <VI1PR04MB4221FA92FC75A3DB8BD9AB9780EE0@VI1PR04MB4221.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(10201501046)(3002001)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(201708071742011)(7699051);SRVR:VI1PR04MB4221;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB4221;
X-Forefront-PRVS: 08118EFC2B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(366004)(54534003)(189003)(199004)(14444005)(6486002)(81166006)(81156014)(66066001)(6512007)(8676002)(52116002)(53936002)(11346002)(446003)(2616005)(956004)(476003)(486006)(6506007)(48376002)(26005)(2906002)(47776003)(386003)(6916009)(478600001)(97736004)(68736007)(50226002)(5660300001)(8936002)(6116002)(50466002)(6666003)(3846002)(76176011)(51416003)(106356001)(25786009)(16586007)(4326008)(34290500001)(186003)(16526019)(2361001)(2351001)(316002)(105586002)(36756003)(305945005)(7736002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4221;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR04MB4221;23:DSeCKktkaSf+1BvHiS9TsUwJrt6vlB4lR1TPwMrVk?=
 =?us-ascii?Q?gf4KnK8dkNOoGtJL/ABIXoG5eWxuPFNAfN8tKA42J0GWX0BmtmB43BFvBFlr?=
 =?us-ascii?Q?7tkoMsibRQZpeWPAph831BqqwlTXvXRoZFJx3MGNJR1mdw87Pcf2QwoGMBn9?=
 =?us-ascii?Q?62CPyfOk7If6UipOCUnNr4JjfAcsVav28vQbrxoRZ9ZsYsHQYgsjHQqLWkg4?=
 =?us-ascii?Q?N9R03q15T6h/IWPnp5tttyiJD0awVxL+WjzkU+MHKa5cGuunYvQkQJrHtmOy?=
 =?us-ascii?Q?8jRYJ63gcMCt6kJjADy2hi3oZcip36iC4blPHXhVcfBrPk31p9Yv41ok592F?=
 =?us-ascii?Q?hUYpYPco3Dk2c1yA75s5g1lAhRb8MjLiEnxKhDDarfOW+FJGejY8ur4gJbkK?=
 =?us-ascii?Q?F1Bz3eXKKE7ntMq9TVSoOrT+celKTqxTdRENwnRxoO83YhRSj78BPfTEHxwB?=
 =?us-ascii?Q?ZNfwfIEmwoIOtIHkfhbWFsqpfzjFnM054AttN/Nq7fGu0QzqZrcApJ+qyaSp?=
 =?us-ascii?Q?8CwMuc6A+Uk/mC0JmK5l+ZqBUmCis/7ReirOHtPXyvLVY8Uz5XVHsTxbkNde?=
 =?us-ascii?Q?ytXryvksawYF8ePBEQ0PgFjPINCRRO7HiEx1TXcSWGqHvYL/sZbt7KwmGdGd?=
 =?us-ascii?Q?Py97Fn5v7BgkYxfrClje7tdWtWD+lx1W/zSb3tLyhhkTnNy+SOUf4gPBbF3m?=
 =?us-ascii?Q?FKme1MW9iwhGmYj0QzdS5+xcNyy5PaERFqYWGvIIMOGMNvLTq1J8iWCyWbmP?=
 =?us-ascii?Q?GpjQHPMsdorawwOZfLc1vQyQoXsbrs//bJzBhdmqsBe0snceLqrEVm4SHruV?=
 =?us-ascii?Q?mN5jZLq6YpmnXM89Rt7VkEF9Zsuu7BpdY5OTc4jU7yAhMhEPwIEzooiiLxVc?=
 =?us-ascii?Q?xHOKKgZW7NvDiumd0UxIbFxywDX2g+D1KFoZmrIHywdaLzw5pib32d5LBi8R?=
 =?us-ascii?Q?K9sSGd9URbXx6a5dvTu2ZqoCla2p2UZgSRABBisSXgG+2+NY9TNG3oQR14Hu?=
 =?us-ascii?Q?5AYXxTRLgDOMt5mW5KG3Y0T7y6dnKz6J8104pd4UBIsmIYiiLe4sCxgxwXXI?=
 =?us-ascii?Q?gxm0psyEV6BhGqOO/M88JvM2u66EgYZ2i7UFV20Xm3tXfGtaiOBstKSz2C0v?=
 =?us-ascii?Q?f2GXahA8dcQNjWo3VT+fW8X8G8z1qP6PtA65aq2JSuB2c7xJL1CXikUnIFxS?=
 =?us-ascii?Q?l0rrIzUCIWeuIB4APvAVjA/flW2Tc05wC5xilmOydvuGgImzarpIPNO5BCnC?=
 =?us-ascii?Q?U55uCFTFawYzvJ5Wo85+sdhjs2N4+Lqm1y30rur?=
X-Microsoft-Antispam-Message-Info: 41o/gbKbBe+UHh42X2HKWzFt40+9o+G+UVgM7KnHGNWBHB3DjtfZltU2joQ0EydYTkuQB7n+5hQA72EvT/1Th0064zit05rblXwRhNeuGPHUanV/qIIJJijPLR/lNt2+SVTLLnsYxn+jbQevdPdpBuN+4SVo0GXJY8ThjeduOLa7oObxFPLOMBvWVRvnlePSbCd/K4Ecw7BVh8h64m32NGmshsei3c3BKmXsm87tLjJkGJxHBMlf9vVrIkQvGN9ReckS6P0+8mQ+LsfiEqOs4DKtYJi2jsRhyeXOUpq9/8p6oGBCVMxoccZXhZkNcgVr45JEEcltWzsnk437lspfrxSEaQB0jtSp57DO9GaB92Q=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;6:LuvmerlEAPIXLq5Uxb14H5KKTJC48Ox9g09DIavFbdirKKFLudtPk4FL23Xf+/6ec51BYGkx2Aamlaw87UIcTwvpjfq0sUtW4q61aImPcxzzYbLFmRnABsJ3fUnjPTIj+MhHndyf2Fd5kTD3pmEfm+e97Y0mfxjwpuEsSJYy1XTCCb6iK+POiR1MMWl6/TyvsPFLCNwbh028D5FIo/4pjGJxXprq0KTOUEqb+vsrqN03gF5VJmNuD4opv1k8YAzu5P0U5aAPSzK03vT2Lybnq1m317zfRn6SjcQk0vR5PNEaiBTNG1GVrWmN+GR/aaCCJshidO4dbqIKOdaIY92ZhavDwpR4Pjg54JD4eE54an6okWlmMVl4+rR+KlLCoE1ZaZh35V2LZswesCktNCl5/0FDi3P0Tu/QQtXfSPm/tZAbUeKKqh1S6axnqhuOmSYjo9zYnJMTRcNaWKA9j1YxqQ==;5:e4gk5/1TUtYZXMXGxpeP8Lqw6ks1yMGIMbpOAiwXbyhrd8ABj1eTHfO2iM3RRKFjy+Ybya4HVu1yUMQugCw/6Fk6SUJWIVryvUKo9UmQk1zrP/tl17jpobNWO1+oYftqepVzl0/2n598ObxkhwAUh9jI6Iz8ikemwJpJkOX/gfs=;7:o9O2l8Mghb6y9ihEaiOJd70ksQeXKw+1vDyq/jj6ivTIKTMdxu4T1vh6qPWjuHkyFnbm1ep33iyKy99tfJi8kABP6hzBA79ZJc5Hk6u0oefJh+eoBCdCyfvn7D3+nF9lV4CiwVpNBVKanxYmZbuoKQS3Tzx80XmH+cy+WjBMmMqQXEkaJ7HDCPMdg/vITGbeEIlDtutk0AiM4fHHqY5lMEWKW+4OMWC13cMroC/GSo3yXga2Eehj7sA51qcNT24b
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2018 01:11:37.9123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c3a8f3-a0b7-454f-7c4b-08d62671adaf
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4221
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

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
v2->v3:
 * structure name and api usage update
v1->v2:
 * no changes except headfile name updated
---
 drivers/clk/imx/scu/Makefile          |  3 +-
 drivers/clk/imx/scu/clk-mux-gpr-scu.c | 91 +++++++++++++++++++++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h         | 11 +++++
 3 files changed, 104 insertions(+), 1 deletion(-)
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
index 0000000..7d3f3fd
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-mux-gpr-scu.c
@@ -0,0 +1,91 @@
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
+	u32	rsrc_id;
+	u8	gpr_id;
+};
+
+#define to_clk_mux_gpr_scu(_hw) container_of(_hw, struct clk_mux_gpr_scu, hw)
+
+static u8 clk_mux_gpr_scu_get_parent(struct clk_hw *hw)
+{
+	struct clk_mux_gpr_scu *gpr_mux = to_clk_mux_gpr_scu(hw);
+	u32 val = 0;
+	int ret;
+
+	ret = imx_sc_misc_get_control(ccm_ipc_handle, gpr_mux->rsrc_id,
+				      gpr_mux->gpr_id, &val);
+	if (ret) {
+		pr_err("%s: failed to get clock parent %d\n",
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
+	int ret;
+
+	ret = imx_sc_misc_set_control(ccm_ipc_handle, gpr_mux->rsrc_id,
+				      gpr_mux->gpr_id, index);
+	if (ret)
+		pr_err("%s: failed to set clock parent %d\n",
+			clk_hw_get_name(hw), ret);
+
+	return ret;
+}
+
+static const struct clk_ops clk_mux_gpr_scu_ops = {
+	.get_parent = clk_mux_gpr_scu_get_parent,
+	.set_parent = clk_mux_gpr_scu_set_parent,
+};
+
+struct clk_hw *clk_register_mux_gpr_scu(const char *name, const char * const *parents,
+					int num_parents, unsigned long flags,
+					u32 rsrc_id, u8 gpr_id)
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
index fdf58bd..fd36a98 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -81,4 +81,15 @@ static inline struct clk_hw *imx_clk_mux_scu(const char *name,
 			clk_type);
 }
 
+struct clk_hw *clk_register_mux_gpr_scu(const char *name, const char * const *parents,
+			int num_parents, unsigned long flags,
+			u32 rsrc_id, u8 gpr_id);
+
+static inline struct clk_hw *imx_clk_mux_gpr_scu(const char *name, const char * const *parents,
+			int num_parents, u32 rsrc_id, u8 gpr_id)
+{
+	return clk_register_mux_gpr_scu(name, parents, num_parents,
+			CLK_SET_RATE_NO_REPARENT, rsrc_id, gpr_id);
+}
+
 #endif
-- 
2.7.4


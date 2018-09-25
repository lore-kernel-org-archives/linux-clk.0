Return-Path: <SRS0=aw6K=MH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58643C43382
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0864820676
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="x827cDNv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0864820676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbeIYXIA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Sep 2018 19:08:00 -0400
Received: from mail-eopbgr70075.outbound.protection.outlook.com ([40.107.7.75]:45688
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726322AbeIYXIA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Sep 2018 19:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60H0jisURaZFTWUDlVz39gDxrv2rFQ4q+fIH20fsCZU=;
 b=x827cDNvSVCc9sfinH0Lu5/u6OCCqraTMlvrEP4Ud9zy6JzuwgBAUfn7vYN+UAtbi+54+Tj3eEubU8eUoT39lkhEQeGdMAMYXlM6EjJZlAyCXW0sDUFd0WFcSoJlVZZ3rMfGkLXAvq2gQdU5hNo7pnRCtKkU99jJtP45bXwRgcY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 AM0PR04MB4211.eurprd04.prod.outlook.com (2603:10a6:208:66::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Tue, 25 Sep 2018 16:59:09 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V2 03/11] clk: imx: scu: add scu clock divider
Date:   Wed, 26 Sep 2018 00:43:49 +0800
Message-Id: <1537893837-31172-4-git-send-email-aisheng.dong@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 81831be0-343c-470d-d378-08d6230837ec
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4211;
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;3:1TJtAxOqeTNXvtZrawzUMkVx95i6QtdjP/gPl4YOcpkr4F+EV38+nM5AKmZqjCInH9hoQfy2gi9UcjyZGTMTVylyzrhfv8kwjoXfudbvHfODXp8Azfk5OSDbju7s6O6dn4H+lEyHq+4AndehWUw3AYdwWlWG5qPM/wQMVH8JfnR4UDpZ2rgRiJQgd39Xs+RC4kGlofSuCNBeThdsqJrbeaTa4ekjLEwPRoZUS1d7aNXvDJ+NZAb1ewWMM/SjHZn5;25:o2JJh1mVVYdjVlRjlzSQ0SRIemR7S+E/35YN50wB7sNndVOIIne5qH/mcOUBdADpQhEcc/7rf49Pg5QOX9sJQ0K27khaXSTWAvrlP4a6FAu/+CB72iLDgTdxsIDSHLwIGr60cqQOIjzL/TIDH6cibqkrxZ82MmWu8eooJ4uptwWOOgIJ3hO1NqRSDZItfN296cob0+G0gZRDUxD/85uHvAUp4ikJ6WffCNLLSbZ3lVfuIYD3sxKnh1uJSrIpnNxdZKKlIRTC+2PzFUYsmQE35LeDlTfVQ9wJ46hYiTqDmboK3j6InT7PHsNYxWFwZ6iSWL1/LomP3UgLWsdwk79XqA==;31:vusfEGwGLBbz4UKf6NBlvIOr6mX2JOHPmvAZ+kEBvMXdXzR7WPyhNRLdAJlkQmTRfLmpsap0ENU49zRGzUzSFclEcNqtd6R/0yuxzlNhEp4/ZPoze21lyXr3z2yEN4GdBSPddDe3lm0AXCTtW4vkteO3eNqJDVdZGc1gQ+skURxFkk3DRTdie5UMxb8Bwdcuxmas66HZIUX6SQTwwyiZkjvWUOgwlO8YvLdui3nDmzc=
X-MS-TrafficTypeDiagnostic: AM0PR04MB4211:
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;20:NEQNLWNxHmaXNSdKIyU2zFJGLCVGFpWaP+1L1vs2U0lSmO+Q1oe/GlUfbPC6L1xsJQqgbbFrO+xj3H+QVTCUck/ER1buM6NEy7H8gTzLWFCIDbd8JCafInzGxfigVdgfwLPwpzK66DJ21CupfLtuXGiBzsJGjr03d4l8j8GZj4eq/PEe4FiLOwi7MGCl8cHkx+D0XvN8T2PA0//mVQHE3EKe/xBy263hNmgvmS8Fhd3poZUSDEzo4iO35BxCcq5VymX7qVV+DE5T4OosOTQQNjw9W6C2DnVPV0+PjwLrKHE+gTvCjue9f/SoIamt9jMQOFCfDHddScwDDG+py+npXolPv6XlTCI/zkcA43PSl88MbUdYcHPN75LPnSerOqbCqRNswofHmoxNA8l2tn4g0uYvSJ3TgWnRiNfDueFXrOhTxxNF2yUES6Mg0yuz6itBX5opUux7+6zzGgl463exig4xIGFcaOFCmSC3w9Yb4jPgErpvyIrM6E20cmqH99rc;4:xosdl5iWHWBjg8So8J26OWgF7eX6Pkl926cTCM1JS/ZD7WSWMLeMMpdCYl/ZqXmYZH+fVE6l4HvmC7Sn6cf9d7Dvi4mByGEY3RWZfJ6WQpKkC67HZELkPhIignxyykLOMivfIaNMIUKU+pyVVvTXa5uVOJnqagEwqxYGwoM1L2UIE+Rfic61TxhSEpBLNe5FSd8irC+g3k8BEYDelp/2gMY0+iw0YymVFaehmwmWsD513uXe0XhnOgdkuicdmdo197P2iULYvqeSRKlpH7zep+J6rRbReEmB+DAJ0iLvym0s+y/iWvriUaK8fAV6lcBR
X-Microsoft-Antispam-PRVS: <AM0PR04MB4211586B4FD8088C92CC6B0E80160@AM0PR04MB4211.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149066)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051);SRVR:AM0PR04MB4211;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4211;
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(54534003)(199004)(189003)(478600001)(6486002)(11346002)(446003)(53936002)(6512007)(68736007)(2906002)(48376002)(6116002)(316002)(3846002)(34290500001)(14444005)(106356001)(186003)(16526019)(2361001)(2351001)(26005)(305945005)(7736002)(486006)(36756003)(66066001)(4326008)(47776003)(25786009)(105586002)(6916009)(6666003)(50226002)(97736004)(81156014)(8676002)(16586007)(5660300001)(956004)(52116002)(386003)(86362001)(2616005)(476003)(76176011)(51416003)(6506007)(8936002)(50466002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4211;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM0PR04MB4211;23:WBG0W6VuJv8Xf/MdriwwmLK0Tw8gVghFD5FpGDLA8?=
 =?us-ascii?Q?IAyODXcDCIzsAVDAAb4M69SXKG1YIQk8Bb77H1DUzJoCpvPt3GT4t0zYft66?=
 =?us-ascii?Q?jAOLihNVrSV7iTnxS9etAoN3EkihcFNymTtyU+xQYpF72yQxv7p/nx0CPGce?=
 =?us-ascii?Q?6bnyJGIkL20l/3UuAL+acqbhPFC7fnJLEnn17CnZFA5HormcFs9UOedaBGkb?=
 =?us-ascii?Q?46z5uFXMXr23gV2Wj+XSkJFuImuuN1m0I00+ovpHcyyA4BwK40CmWX4/RHqX?=
 =?us-ascii?Q?6c8nCd6G8uJ3TyMU6m4JV/f47Fls/IXtD+fb1QTgaPS0BCUOkXKYaz1ji1ko?=
 =?us-ascii?Q?xcomxiPnG2VOIVilYgK7CraJMEju9Ofma0ILyxSFChiFfXgIvcXDVa/Q/WCL?=
 =?us-ascii?Q?Y2Wu36CivUsoGXld9DDPY2j8vWzUnZJow3Q7VH662inKdsTZ6yxIOb/jJwSS?=
 =?us-ascii?Q?pdjToWZNbh9KCU9mcQb94pqh/I0RyZ7Fob+gj/0kpOMAbw+dCO+LDcvSXJEc?=
 =?us-ascii?Q?azWnZltnEvUHwj2kLmBTvYJgnxF+WLJlRDLdpgdcyCzm+7HtJqxCddcpJc7r?=
 =?us-ascii?Q?NXKi9fFEyLyZN+5Vfjr/LxtdRqerhhZTzxso8i0ZQRV7SUCzIr+xP6X3ZyEI?=
 =?us-ascii?Q?rETnuFZGAr6Bk79gua1SeQydTH1v9U4yA/VVSyuW4a1UwvImgrgr0Z278CfE?=
 =?us-ascii?Q?/30HRquEu1QzaNCSPIXhJVy/OShXlKJ3paFyqPkaLLh0wH7ZGVJ/mf4S3DdY?=
 =?us-ascii?Q?t4Pf98iXa6x16UybqVVejt6vHTbGvPhyjM1whMW3xSaChLtnBSPDpxKe7vyc?=
 =?us-ascii?Q?Tx8gaI8j+BQIAcO9Stfvo6MZLpf5UQfZ+7wGvlfx35H+1eqHDiqlzL7oiVib?=
 =?us-ascii?Q?JugBXNptbAAsZyI6Dm/8DHYMOuxKqffJg9v1Z1FrlfikwUT0Vp7KfFHKPFYs?=
 =?us-ascii?Q?EL72KS1sm41fbMZ2vCpIw7IZpsAaOVW14WMZw/vhULQ3yqtKFKdV4Tg15kB/?=
 =?us-ascii?Q?ROcGX2iNRD4sGoeEL3z5QaFnKMpbY314Ew5QflLMLQo5QfVQM52f9V5iwjh0?=
 =?us-ascii?Q?4B6z7o7uhP4LMcddpI6V170hmTOZAIR6bsVzH0GCh5LOlxdHv4/2eyZTEqFX?=
 =?us-ascii?Q?rBHPgCwzgB51xtICk4vGUgc3bXjCFY2zLDtA7LQSmpw+F4GaVK+P52oMnJqG?=
 =?us-ascii?Q?DXpM/nvKXrHHBM0EPGM1PYVCnU9vF2WvezwXh320Vnp0sHby7Mk9r+Q5ATWq?=
 =?us-ascii?Q?CyzQlg/glWtjRMksafQG8/1QMk9a8YGlsDZJ6Po?=
X-Microsoft-Antispam-Message-Info: lGNCMpCN4USoI1dkbiD+m3IiNVbLVxfIUXTBaHof8TZpbAWlkAiKKkmf1dIh2jxtzFjzxH8DU4ZmjHSo7lSvN6jWtRDOrTIC4EovqqYA7zbhrjUnojdv7TF7DttT6HzTbsSGgoQjZOYb9/3JgrbyaaUenKFfpW+AQNjc7+n3GBmQNjmgjvNcDx31A2DAmLGDJSb3EhiZf5Q7c2aydI/SkoBFmTCOyCE+ft+0b4jVpuN2dWfzIOLN+/+weuJLNbgR8ocvhGX/uO9tkfDOusLT5VDPSkM6JEeUZ+aQNKoSbcIE+muVDtwJgermD7QRB1Hl71NALKrQlbHAmdoCwukMQ+DmaXLI+LM71wc52WdEoTQ=
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;6:fb8o2WDXc9thdMo8Kgqer6uBGRFK4ENE0HrO1rWiHa0FbGpWznK/rmNKIBr/MR7AjsOFHSTFJ8/gEViXRosmHvjML1FeVMfN6V5jD0bLopkfxC8oKFXjMIBxI99fzVUtLg7nHqva9lgSIYwjRHtYoQIvQ+l10zDg3+5BBH0ac+YNNzJA5N6I0hZQB6jQXzlsPJLDDgVdLYj74x9OLmN46DP7kSZERoUWweQs9rvXQrDIkf25V2Otbu9Br24JL79a2UPzmzviDhO2KzzqCv0RfBZPcHnQjngLYFhYNYWGaThpapkblzU2aE1A+RWzdBlKurM7z4YGIURZwWM+jLOTj9QHic4Q9kg/8yrNWkHQC9KA5JGhkIlY8iwB+zp11i5S0SFY7+lSNt36HtVHKFvlaGEFKVkRjjn28DiGRv648QNUKOr8eb7LEAxhIeVQNLOx5wZ/Sqo/xyXBuO8A8+nrQg==;5:Nad+iW32jWz+76oYCmEnEWJuz2AvEIjww3oQxOSsjkTPEFrjjjB+vIbfF8d4rdxWUYuzmTVI6OZgSNhkLrNNlh+CvZGAUMRazSeuR74r0rsrBQPttTMq2PfXapAAzeFcdczXt3M4iAdcIBmf7XOCmfcWN25Fnhh7yw/f/utQ4QY=;7:EkzTe4fN3MVtQAcvcH0xc9X/Q6gweNLt0voeQl1uu2TjmiQjaEUwxFz20taLlKwDiyPf/StA44SMR29Jhv5bQKa6rxwGfW3ksfIcBv7zvU4hsZfVbqblLH58RtO5fK8MmltPLEF0OHI/KTDPQNyj2VdelIzhrb/wk5PdnI2paYw/0p2u5wIShjjPsfYvUUUnKjnbCgrNGlF3fLVbuWxjL7HnDvlKEnh7n2Y//Z21VBcmV5vdVfeJoGTJdl7BRX7r
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 16:59:09.5263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81831be0-343c-470d-d378-08d6230837ec
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4211
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180925164349.kTtIqV9p4uhAPDbV1AM3PIF14mqHQznMa1r37yhf0KQ@z>

Add scu based clock divider.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v1->v2:
 * move SCU clock API implementation into driver
---
 drivers/clk/imx/scu/Makefile          |   3 +-
 drivers/clk/imx/scu/clk-divider-scu.c | 190 ++++++++++++++++++++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h         |  18 ++++
 3 files changed, 210 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-divider-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index 7dead13..7e360e2 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_MXC_CLK_SCU) += \
-	clk-scu.o
+	clk-scu.o \
+	clk-divider-scu.o
diff --git a/drivers/clk/imx/scu/clk-divider-scu.c b/drivers/clk/imx/scu/clk-divider-scu.c
new file mode 100644
index 0000000..9da75ae
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-divider-scu.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017~2018 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ *
+ */
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/slab.h>
+#include <soc/imx/scu/sci.h>
+
+#include "clk-scu.h"
+
+struct clk_divider_scu {
+	struct clk_hw	hw;
+	sc_rsrc_t	rsrc_id;
+	uint8_t	clk_type;
+};
+
+/* SCU Clock Protocol definitions */
+struct imx_sc_msg_req_set_clock_rate {
+	struct sc_rpc_msg hdr;
+	u32 rate;
+	u16 resource;
+	u8 clk;
+} __packed;
+
+struct imx_sc_msg_req_get_clock_rate {
+	struct sc_rpc_msg hdr;
+	u16 resource;
+	u8 clk;
+} __packed;
+
+struct imx_sc_msg_resp_get_clock_rate {
+	struct sc_rpc_msg hdr;
+	u32 rate;
+} __packed;
+
+
+static inline struct clk_divider_scu *to_clk_divider_scu(struct clk_hw *hw)
+{
+	return container_of(hw, struct clk_divider_scu, hw);
+}
+
+/*
+ * clk_divider_scu_recalc_rate - Get clock rate for a SCU clock
+ * @hw: clock to get rate for
+ * @parent_rate: parent rate provided by common clock framework, not used
+ *
+ * Gets the current clock rate of a SCU clock. Returns the current
+ * clock rate, or zero in failure.
+ */
+static unsigned long clk_divider_scu_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct clk_divider_scu *div = to_clk_divider_scu(hw);
+	struct imx_sc_msg_req_get_clock_rate msg;
+	struct imx_sc_msg_resp_get_clock_rate *resp;
+	struct sc_rpc_msg *hdr = &msg.hdr;
+	sc_err_t sci_err;
+	int ret;
+
+	hdr->ver = SC_RPC_VERSION;
+	hdr->svc = (uint8_t)SC_RPC_SVC_PM;
+	hdr->func = (uint8_t)PM_FUNC_GET_CLOCK_RATE;
+	hdr->size = 2;
+
+	msg.resource = div->rsrc_id;
+	msg.clk = div->clk_type;
+
+	ret = imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret)
+		return ret;
+
+	resp = (struct imx_sc_msg_resp_get_clock_rate *)&msg;
+	sci_err = (sc_err_t)resp->hdr.func;
+	if (sci_err) {
+		pr_err("%s: failed to get clock rate %d\n",
+			clk_hw_get_name(hw), ret);
+		return 0;
+	}
+
+	return resp->rate;
+}
+
+/*
+ * clk_divider_scu_round_rate - Round clock rate for a SCU clock
+ * @hw: clock to round rate for
+ * @rate: rate to round
+ * @parent_rate: parent rate provided by common clock framework, not used
+ *
+ * Gets the current clock rate of a SCU clock. Returns the current
+ * clock rate, or zero in failure.
+ */
+static long clk_divider_scu_round_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long *parent_rate)
+{
+	/*
+	 * Assume we support all the requested rate and let the SCU firmware
+	 * to handle the left work
+	 */
+	return rate;
+}
+
+/*
+ * clk_divider_scu_set_rate - Set rate for a SCU clock
+ * @hw: clock to change rate for
+ * @rate: target rate for the clock
+ * @parent_rate: rate of the clock parent, not used for SCU clocks
+ *
+ * Sets a clock frequency for a SCU clock. Returns the SCU
+ * protocol status.
+ */
+static int clk_divider_scu_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	struct clk_divider_scu *div = to_clk_divider_scu(hw);
+	struct imx_sc_msg_req_set_clock_rate msg;
+	struct imx_sc_msg_resp_get_clock_rate *resp;
+	struct sc_rpc_msg *hdr = &msg.hdr;
+	sc_err_t sci_err;
+	int ret;
+
+	hdr->ver = SC_RPC_VERSION;
+	hdr->svc = (uint8_t)SC_RPC_SVC_PM;
+	hdr->func = (uint8_t)PM_FUNC_SET_CLOCK_RATE;
+	hdr->size = 3;
+
+	msg.rate = rate;
+	msg.resource = div->rsrc_id;
+	msg.clk = div->clk_type;
+
+	ret = imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret)
+		return ret;
+
+	resp = (struct imx_sc_msg_resp_get_clock_rate *)&msg;
+	sci_err = (sc_err_t)resp->hdr.func;
+	if (sci_err) {
+		pr_err("%s: failed to set clock rate %ld : ret %d\n",
+			clk_hw_get_name(hw), rate, sci_err);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct clk_ops clk_divider_scu_ops = {
+	.recalc_rate = clk_divider_scu_recalc_rate,
+	.round_rate = clk_divider_scu_round_rate,
+	.set_rate = clk_divider_scu_set_rate,
+};
+
+struct clk_hw *imx_clk_register_divider_scu(const char *name,
+					    const char *parent_name,
+					    sc_rsrc_t rsrc_id,
+					    uint8_t clk_type)
+{
+	struct clk_divider_scu *div;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	div = kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	div->rsrc_id = rsrc_id;
+	div->clk_type = clk_type;
+
+	init.name = name;
+	init.ops = &clk_divider_scu_ops;
+	init.flags = CLK_GET_RATE_NOCACHE;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.num_parents = parent_name ? 1 : 0;
+	div->hw.init = &init;
+
+	hw = &div->hw;
+	ret = clk_hw_register(NULL, hw);
+	if (ret) {
+		kfree(div);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index c503a52..c433cd4 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -7,6 +7,7 @@
 #ifndef __IMX_CLK_SCU_H
 #define __IMX_CLK_SCU_H
 
+#include <linux/clk-provider.h>
 #include <linux/spinlock.h>
 #include <soc/imx/scu/sci.h>
 
@@ -15,4 +16,21 @@ extern struct sc_ipc *ccm_ipc_handle;
 
 int imx_clk_scu_init(void);
 
+struct clk_hw *imx_clk_register_divider_scu(const char *name,
+				const char *parent_name, sc_rsrc_t rsrc_id,
+				uint8_t clk_type);
+
+static inline struct clk_hw *imx_clk_divider_scu(const char *name,
+				sc_rsrc_t rsrc_id, uint8_t clk_type)
+{
+	return imx_clk_register_divider_scu(name, NULL, rsrc_id, clk_type);
+}
+
+static inline struct clk_hw *imx_clk_divider2_scu(const char *name,
+				const char *parent_name,
+				sc_rsrc_t rsrc_id, uint8_t clk_type)
+{
+	return imx_clk_register_divider_scu(name, parent_name, rsrc_id, clk_type);
+}
+
 #endif
-- 
2.7.4


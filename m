Return-Path: <SRS0=xqQ/=MM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441A0C64EAD
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2D91206B8
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="iniN95qg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2D91206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbeI3HmY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Sep 2018 03:42:24 -0400
Received: from mail-eopbgr10057.outbound.protection.outlook.com ([40.107.1.57]:48520
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbeI3HmY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 30 Sep 2018 03:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec1Nle5tJRWBsZkPF+oETWmFC06vlcJFkNt7TL0zWR4=;
 b=iniN95qgRvIavKgUbKxNL9xArkGjA/fqPwdCOaJ5bi5COWvIRVZBwoAsG0G3CbruCgfIxaD53l3nVbAFEr0IOSmU1o6bCOI/cd0J8tp5H4fblJjb6BbglEcsdABOAks7iLIejmSpbVISzHvkGFXXTL/PhXLO4iat8wevFM1qZec=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 VI1PR04MB4221.eurprd04.prod.outlook.com (2603:10a6:803:3e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1185.22; Sun, 30 Sep 2018 01:11:31 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V3 06/11] clk: imx: scu: add scu clock gpr gate
Date:   Sun, 30 Sep 2018 08:56:21 +0800
Message-Id: <1538268986-24890-7-git-send-email-aisheng.dong@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4bccdf6f-4317-4c07-d2da-08d62671a9ad
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR04MB4221;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;3:wBHAZr2X3r+UaMPQpKy4FAhsGPtqxboWSLWQ7mDDtIZy7+jACE5VuxHaOsHoCK30BoxrPPImPg1bpB4tYtOAdf5xZsLzOVr55p6cLger7zPCrAbGoyBdyZ+CcNIecE44ih2wMDTuy1vYcXfdEfl0fPfQA06vIYQTpW1vRltFdZHULKpn94SVwLxHsPTgCt0eYn3xrPWBT/L0iFR05NYJMCi6iYmLW9xk2FjRJL+hZ2PczkHkN4vGbRXWzwrQALCF;25:AgklNbUcxJN1SiX7HDuANOc3DW48LHsBesdIlBXwi+sXF9wyZZNkbPrDJ5LRcVIJOQ1K33a/p+dqb4Gph1SgUvUjZC700y3mYhPrDHJasHbPTyk7EGz/lVTgTJ3n98n2i94YUKhvN73o+nfSLCRetNu6uDCbrO7n1gWhjriHgBlSJfbrjfJm8oY9r0Om93bXjw/kTHnZLe7lnaKHtLh5td7PpAUG1jkbFYjRGDNzGc21DDZjbGJBsAF2tKcQaGdvK9xCc6urq2pENZns9YTYinoDTwt2lXLEmvmDY8PA1XTbexlQCKZ8hrZ6oWEzP95ImK9cWn+s9T8oq1CZSeTizg==;31:E5FBYC+4OFfV4QDrtzMWV9qItQNu4MB1VYNVZM1zK+FxNvJz+FUNko2tldU/qhWmQlB2oQXoJClVqROFf2oOqC3mOFRPzbNrS1Qbvzrvabjd0W+AM9Ntyx8DS0YZghyBTHgl4udYMFs/eRgR3v8uDAS3skol6veHSTpOKJe35XfkVlyaei6vZ+dXOxKS10yvxMlfNjzPBK68M2hbo7EmqjALNP4hziG/fMevF5YT7Xk=
X-MS-TrafficTypeDiagnostic: VI1PR04MB4221:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;20:RZJnwvnRrFIET35XBlgqnlL/QFyCYdn05LjPyht+kWcSRQKNJh4/xBHuvUT/ruQyRctVuWHzbxElA/meH/e/yIeXqmlSkQs2WkivgJ4qNRNeQh34tKmxPXuGq/OR4GyvlYBpq95VNebe+JTFD4JsUl0tkpMW2Xd6dGp07L2S+x+Rp8B9LYHwIBD9tmOmW0gikch662evCC5P8IPMvwRoQCirFFds3kdtQk4BtEUmOoCBu6MBgq+NFOAAL6MGqTRexFj91q8KznGRSXqs35vvIqi9Gh7fK3U/OslcW2GHXWJYxSCvbfSE2/KwxSj2HX9t6ctkDN834KFHl96UWaL/+uGXfjJCKn27LDJ20VF3+0IyQJJQ4kWVt+7xvgUWzA5PukKOdBR285ZD/awJvYAr7TcLkLw9+0qfS3EqkF5Td7KoBTxkBvS6+jySaY2Eat+TUesWgo9VUkROi726Ol265NwfJp0c2yxcPbOCjJtke6FpXaP9UVZwZPKPxXeCktf3;4:OEVQE5aAtQwQLP1g4qBd6wDV/5mXiKtLt5ZQe8OImr9e8E4ChoLCNlt94YGlnjCm2smNwuNg4V2lbKgJJNt1/MlMnZifpW93MkyZg/3kCW/fYVbIY94j6WcaYn9H+Of3ODUhiCgnag51Qe1C80fXqpNLWLZDWica2tzE+We5RxY8BO4ZJT7cq2pdU7MSB8kXQ9Mi4LvghHBJEAMFROMcXmq4GK3rKXGtXu5BJ9U+cc5ZSuq9A7tYVyseUvwOOlf5cRvbxKZVJXwxmZ9m6wb1puV1EQzY5jzTyTPgq7+UXIpsF5G1zRt2r65/HvKY+CTt
X-Microsoft-Antispam-PRVS: <VI1PR04MB42211813D1B8568DDEA3973A80EE0@VI1PR04MB4221.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(10201501046)(3002001)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(201708071742011)(7699051);SRVR:VI1PR04MB4221;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB4221;
X-Forefront-PRVS: 08118EFC2B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(366004)(54534003)(189003)(199004)(14444005)(6486002)(81166006)(81156014)(66066001)(6512007)(8676002)(52116002)(53936002)(11346002)(446003)(2616005)(956004)(476003)(486006)(6506007)(48376002)(26005)(2906002)(47776003)(386003)(6916009)(478600001)(97736004)(68736007)(50226002)(5660300001)(8936002)(6116002)(50466002)(6666003)(3846002)(76176011)(51416003)(106356001)(25786009)(16586007)(4326008)(34290500001)(186003)(16526019)(2361001)(2351001)(316002)(105586002)(36756003)(305945005)(7736002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4221;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR04MB4221;23:f2mJZRUl2t2rEi92AnjORL7/eGlMsCU4er6Ue9/9t?=
 =?us-ascii?Q?3EwKPGihir/E/actPcPaQ92UydlIZjJirtfrFkQCNcBtrTaTveypbV0kThfS?=
 =?us-ascii?Q?d7HGJeH3XoMR8XXE6GSe47xEb3PXI1y0tQxMUaZdRwNz6hF0SX/pRdRS598l?=
 =?us-ascii?Q?MoV8ELQil7TCoDDzYzY3eFwB5MJQjvvQvgoKzBIBlTGCbt6GZU57I4dmdU28?=
 =?us-ascii?Q?tklEuOLH27fm1r2CkiPPLE3ataSVd0Hgt5cFZC8Cscxlj9Stb8IxunaH6VVQ?=
 =?us-ascii?Q?qWpPOZd1KNVBBIdoz5ipsHG8ELJXXGQzOn2hLCi8J2FdLSOpC8qaNwKxKszf?=
 =?us-ascii?Q?LZTK0MS4H0dvfg80g812cHm12U8piwHElLlaNlYSmnFqF8LNBkC8zo26lHD8?=
 =?us-ascii?Q?xkWJ9q7XeBMYBCsRI+Hv0zrQCwZABm3t5Wje87ldYR4Xqy7QrwD15RpNt18+?=
 =?us-ascii?Q?3TAU/+TgQ9h45Wh5g8ukoYUSDMhW508rg5QJD/dZ7hJYNL+BnmYYW3jLQt8J?=
 =?us-ascii?Q?Cf8vPy7pWpnXrfwdm3NN2FwM9SGURr20xuzk1YzE2C6ap5bFqv34ajvhyBAb?=
 =?us-ascii?Q?BjKZvPcjQ41txvxVJ1mXNBWCgSBLdKeWYYbj0rzF0MuECEgyb8FhP5v/Ugwq?=
 =?us-ascii?Q?W8SHx3N3bkH2uqVkmu7GiSJU8qe4uBIB1OFv+2tpUok/TG3+qnF22gVuq+wS?=
 =?us-ascii?Q?gfRc6Kl0qHoRXcXZ94WB7Etm/ap4D3MJ546J28s+aUgRZpbVYoOwFldIFYX7?=
 =?us-ascii?Q?NhbHE5+dHCzm+AYM/k/ZiTMdiUh5aS8vyeljDal1c2gICQEzYhyLp2+awZhK?=
 =?us-ascii?Q?pMANhuVq4ciLBOIx/4aYtqFYYwhUD5qkTe/wAPbyCgdP0zTc3N6SMV3F8paL?=
 =?us-ascii?Q?YksNiGtSw0hUI8PtK5PVBHlvoDq5BBMZh7CVTos6eeX5pxKpRtzvc/IgIseT?=
 =?us-ascii?Q?P/+Val3gV6F0hFcTseKFpP0kNYKKoRjxApw47m8oxKRK/YVFliJh+w++hUEV?=
 =?us-ascii?Q?xI4oomUgQquRD2d/kCWoKBNtrX+DbK8gHwyM5rclWTgYoBzT+nD5lvzWyE7W?=
 =?us-ascii?Q?RmYJmk/O8mugTlYnuhmU9VtDFRLrv1WIJXMMQTjsK72fi+T/5/nyygymHVSU?=
 =?us-ascii?Q?S2i3zRNQzf3B5wGGVpmV/ce0bIDecGR3G0t7gJAFComkuMdvBw2hiYna2kiw?=
 =?us-ascii?Q?3XtYcSZMbrBV7rnAx5BYo4EfvyZGxPYvgnqIWtw8QUbXkZZJBZp74Jp29SJv?=
 =?us-ascii?Q?ZIs2pV0CHHdxZCzm3/gQQh1RcfXi1+jeWAjUKVx?=
X-Microsoft-Antispam-Message-Info: g47dD6uVPvPgcnFLaim8npd+0OWSfmzuTFtliroLunv0nQ28EFJh+4x4RqnYEyLmHluAZoyEmeCjI5cUk8nlD/aZgAltTbwU0GBTPgDNxG2GU1OZB8x11ZBSgoSVKJuA5CzRpgVellQhtT6LTqv9BHzljlp5RBnvTAD7SUnl+iqwBMpo8VTdWKjg5A0HO2WYOdpVJPSZHr4GkK8/a7h2kxZwIP8S7E0KxLqib7KRUVE9TONh241QSq7x95gFOpqfJDWI7ex3KduJ6aYwg5CdP9TyUsrU/QB5e1iEM1vKaqloM4NgBV4wdYjlIpsioDYPJygM5y7bbyDpCSFQ1RtbjYDklurFE7mnIjWwKXBisXg=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;6:tT0UnpRTRF0FIH/VC0sanYkk7JK6VuoWrfRra4J/81TB2ZiTKf4voT/XRChiClhgOufDdVL1NyJe1w6ghCQpOzBMcv9Nku0gKYu5JJGRHLLi4f723UWAzTUQbFgSJwUaOTodMqkOxIBrf+k611y3M8gqO0DQXVYmzGinPKgGrADmmNcgjxG9Qkav2zHINjPzig+luWS7dvpavh2LJdAf3WNM7m+nfe4zsj1DlW9MjIApjoFh+Rs5jP7hTreH8U/nItxmUllC75lADSAtmgYt+5H11JAQIRQCg4nHDkRfn7vqw5beUMoVO7ARcDkge1m5q0msX5Icgnq57eb56QslTh+eu6bcnzIoNz26RnJvQYFssuybYz7s8ewb1JpBOCLZ/aw4OAD0Ju5pR43Y/43VJU/nMOTc3uPRz1ub9AaI5SQDsu3MPHLifLcJHlP2J/x6pAVHApmeZbUrSpySYK7oHQ==;5:+CrK0DVY9WC7/0ERQxzEoyl99osjp9LN8Jn/CZAFd4h5LneGeXrx8wbRfMDTknEGSjnYKdbJc5JOBKUVuChjrZAwk9Ur6Da1thMomki0HDWi40MA7cby+uis4tkmO8VkrNJIwvgrwUcpEdXvtM09vqz274hmIDjoVlXnTnBBpzc=;7:m3NzBXr1vB71k1eZkjooCq2ogjyQg9Ybq1/RAsi5yxgD+TmxXEYX9snaiIJiGmHoMZx7cZZk5wMMxNkoq5r0rqkFtS65LzMnVvcGfJPFlZ+2HnwiWmKgxdeMxOpKM04ny8ClPlsOBS50g8PV6CkkpM7Qrx2HWeBqMqiMxs9s5wxdukHhmP6RV6qINSSlW1UxVUyq4IltGVr+G4VFQWcsJZA4KP95nhD4rEv6NpuGDnKcrK3p7rqecTrPNpcqnaFP
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2018 01:11:31.1915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bccdf6f-4317-4c07-d2da-08d62671a9ad
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4221
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add scu based clock gpr gate. Unlike the normal scu gate, such
gates are controlled by GPR bits through SCU sc_misc_set_control
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
 * no changes except update headfile name
---
 drivers/clk/imx/scu/Makefile           |  3 +-
 drivers/clk/imx/scu/clk-gate-gpr-scu.c | 88 ++++++++++++++++++++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h          |  9 ++++
 3 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-gate-gpr-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index 2abed17..25d3511 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -4,4 +4,5 @@ obj-$(CONFIG_MXC_CLK_SCU) += \
 	clk-scu.o \
 	clk-divider-scu.o \
 	clk-divider-gpr-scu.o \
-	clk-gate-scu.o
+	clk-gate-scu.o \
+	clk-gate-gpr-scu.o
diff --git a/drivers/clk/imx/scu/clk-gate-gpr-scu.c b/drivers/clk/imx/scu/clk-gate-gpr-scu.c
new file mode 100644
index 0000000..7b8bf3d
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-gate-gpr-scu.c
@@ -0,0 +1,88 @@
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
+struct clk_gate_gpr_scu {
+	struct clk_hw hw;
+	u32	rsrc_id;
+	u8	gpr_id;
+
+	/* default: enable 1 disable 0 */
+	bool	invert;
+};
+
+#define to_clk_gate_gpr_scu(_hw) container_of(_hw, struct clk_gate_gpr_scu, hw)
+
+static int clk_gate_gpr_scu_enable(struct clk_hw *hw)
+{
+	struct clk_gate_gpr_scu *gate = to_clk_gate_gpr_scu(hw);
+	int ret;
+
+	ret = imx_sc_misc_set_control(ccm_ipc_handle, gate->rsrc_id,
+				      gate->gpr_id, !gate->invert);
+	if (ret)
+		pr_err("%s: clk enable failed %d\n", clk_hw_get_name(hw), ret);
+
+	return ret;
+}
+
+static void clk_gate_gpr_scu_disable(struct clk_hw *hw)
+{
+	struct clk_gate_gpr_scu *gate = to_clk_gate_gpr_scu(hw);
+	int ret;
+
+	ret  = imx_sc_misc_set_control(ccm_ipc_handle, gate->rsrc_id,
+				       gate->gpr_id, gate->invert);
+	if (ret)
+		pr_err("%s: clk disable failed %d\n", clk_hw_get_name(hw), ret);
+}
+
+static const struct clk_ops clk_gate_gpr_scu_ops = {
+	.enable = clk_gate_gpr_scu_enable,
+	.disable = clk_gate_gpr_scu_disable,
+};
+
+struct clk_hw *clk_register_gate_gpr_scu(const char *name, const char *parent_name,
+					 u32 rsrc_id, u8 gpr_id,
+					 bool invert_flag)
+{
+	struct clk_gate_gpr_scu *gate;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	gate->rsrc_id = rsrc_id;
+	gate->gpr_id = gpr_id;
+	gate->invert = invert_flag;
+
+	init.name = name;
+	init.ops = &clk_gate_gpr_scu_ops;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.num_parents = parent_name ? 1 : 0;
+
+	gate->hw.init = &init;
+
+	hw = &gate->hw;
+	ret = clk_hw_register(NULL, hw);
+	if (ret) {
+		kfree(gate);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index 57de592..d92b3b3 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -59,4 +59,13 @@ static inline struct clk_hw *imx_clk_gate2_scu(const char *name, const char *par
 	return clk_register_gate2_scu(name, parent, 0, reg, bit_idx, hw_gate);
 }
 
+struct clk_hw *clk_register_gate_gpr_scu(const char *name, const char *parent_name,
+				u32 rsrc_id, u8 gpr_id, bool invert_flag);
+
+static inline struct clk_hw *imx_clk_gate_gpr_scu(const char *name, const char *parent,
+				u32 rsrc_id, u8 gpr_id, bool invert_flag)
+{
+	return clk_register_gate_gpr_scu(name, parent, rsrc_id, gpr_id, invert_flag);
+}
+
 #endif
-- 
2.7.4


Return-Path: <SRS0=aw6K=MH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31774C43382
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D572420676
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="CnUW/w7j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D572420676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbeIYXHf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Sep 2018 19:07:35 -0400
Received: from mail-eopbgr70048.outbound.protection.outlook.com ([40.107.7.48]:58664
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726322AbeIYXHf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Sep 2018 19:07:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RBWCR5YA0FIa154nkzRbfnbFkDsmfsloqXK4HBVTzg=;
 b=CnUW/w7jaAbfrCI4WlitGj+kKbIbrcq0N2/xLA7mS3C4XaZVmdtKH6Jz4mbe+Lyo9AaUyJB5vzrXNa+w5iNMUCJ2NyWrwaob82I+W3zG/63OndFlVCjJEdxt4j5qTgPmJYhndXebjQeCI3ppxSJoUiZxMZYC9/KDmNUTwEZWdVw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 AM0PR04MB4211.eurprd04.prod.outlook.com (2603:10a6:208:66::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Tue, 25 Sep 2018 16:59:05 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V2 02/11] clk: imx: scu: add scu clock common part
Date:   Wed, 26 Sep 2018 00:43:48 +0800
Message-Id: <1537893837-31172-3-git-send-email-aisheng.dong@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: bc895fab-dff1-42cd-296c-08d6230835ba
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4211;
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;3:6b00MzqX3adRXN042KIWntNNZw7JnY6v43tWnTssgic/09OsXpoJ4PBNp1Ce1rrCi4NHqm3jrM7dEQybPx7AynTfesXW9IFxKhufjY9tl2r1UOkhAxPGDBIX2P0/ukcJvmXR4JHsSL/nVun46G+2X8uugxYVcOFFY5fPvgsF/K0NC1nLJrVG8UN4gN8SeA3h1J1vjwYVcN05Bt5b6WX0z9XVVKY7aVp+VNaPJzx/N0OvxjHr4UUsxhaE99JsT7Tq;25:NH1b8aBlwBnySMkPf3sK7e0NgMMo7MEMMJ8t9UWRJ4tQ5csA9pwvLMq2eySFPwYyp9WcUguw8pm3rFywKry622XzNPw7xvYFxLSATfJ/WOIaCKwQnpdXV/KZiyy3Jd7y7iRHqxk0NM1JAuBxg7axyVf9aruhiMrsr+Svjv1E7PhTa+luzFEOS1W9RAhbDD2OadWbEpfI7bxK7Z4ZG5AGoip2jPO/Eboneev0GKtwk7wNbmXbonZ1x/hlgeiEckQkv1PFQLzdU10LeCf5BDSVrKJPQZINfJTGkpZwTxs8PWsQdQZ6SU3Xt2K3qDnU+Dkhd8e86leqRxQhntwT1X/HlA==;31:7X1pltC6nQC0HUqK74HCDmA9Cx5bKQdU4rjNVvck0RvQqq0Q55RUZ8xXuTxVjNh3ps4d34e1CXmxh+WRuxALvhoxJR/97kqC/Rv86Y2KnUsVSm7IN1iaYm7lcprZ15CGX2uzxWuSZbM7x2+6jIajNAy68hRBGhIVFynDL0zTbSb6Eh2K1/y4cv6TK89QdbB79N+5Fj4ViwXMGFmV5JRcubRV7KHUrbMI587DOFoa4y8=
X-MS-TrafficTypeDiagnostic: AM0PR04MB4211:
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;20:ghqbGY754xlbEsZNPPAkifwGq4kAOVREtVppocfEGC9etiMPMKOaUeUsqUyxsxiE6zuFN+Gvhix+KrqypCsBtNCxtnm3VJVaxucLBbAH+KosXn68k0dQGwhjBjk+z3ToYsK6XgXH6VPb8k0QgB9tduL0q8+716epdNw1xRrS8u+fQ2ZoJ0IWFy5HAz5OcPzBatCV7iUe6HIoXsFTSDtu3Xcb7ru9BDUh7nRv5FV7xO1cdd5VqnctfYZYM+Ni5ecpkoUeUdKh+c5CIhOPtT1O0lWTeluSXP3KLHLOMdEbodmISGcppAyjmG7GL11+xf3stKdXff+Qi62yOgxuniNjm1nsErCa1jZ3SorUW3J/FzJvhEVEXPuM+6OVlTRpZ0/TmW8oyawfNgpwOUl46wZp+hjkkXCIgl9BxO7tqBi4RhbRq5VjAPyoTeXnnTPDAbePNhBi4knCB+Q3nOwfc9kewJFqpNf3k+juSUIqrZEnUT9oGqpVH2Ea76sIrt59mVL7;4:+COEOUI0Hiqv6wnkr9Lt6lQ21BiQjLqBgnC2VZvuPoTj5gW4fPSuoPk+lx/8d9GNU24c3TKy+r0YtR5T0fkBljR/3l09kCsxJR62TWPw1mk9Y9GM6zJxXRBNQsbzHjyreBDfBOrW8TV5bsn8QawC3RfQLSipurcu+brlIQ4yF7laqm89DrKeJQ7J1rBD/XYFrhzlr/GsSUofdBzfhx+fMDWOrhEZW6DFt+iZr22HPpYpZI4xzS99yC3I8I5qctaYzDobUJkH4vKBvaXqWLpKWRF+FTPlY8luF3U2sXijlCuffzssUtRxJyRkDKZ5WlLH
X-Microsoft-Antispam-PRVS: <AM0PR04MB4211A91347D3D17E6D0A2A1880160@AM0PR04MB4211.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149066)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051);SRVR:AM0PR04MB4211;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4211;
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(54534003)(199004)(189003)(478600001)(6486002)(11346002)(446003)(53936002)(6512007)(68736007)(2906002)(48376002)(6116002)(316002)(3846002)(34290500001)(14444005)(106356001)(186003)(16526019)(2361001)(2351001)(26005)(305945005)(7736002)(486006)(36756003)(66066001)(4326008)(47776003)(25786009)(105586002)(6916009)(6666003)(50226002)(97736004)(81156014)(8676002)(16586007)(5660300001)(956004)(52116002)(386003)(86362001)(2616005)(476003)(76176011)(51416003)(6506007)(8936002)(50466002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4211;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM0PR04MB4211;23:BXxCUPzoILC3vDx7luJziVUBLOJeTjy5Hqgbdym2X?=
 =?us-ascii?Q?4NXBp0hIWVzq2NpbvzscKFaFfVPzPAFdmvWP8zs6mSAr/DSCHPRslwqbYV7v?=
 =?us-ascii?Q?7ZBPtHOgjs3nIJEuQGT6XGZ2zCORfxRLJQO0SARptMmfSu67dmYImwAGaBC6?=
 =?us-ascii?Q?pFAycQZr3TG/F1X4z+nGV4YexY0PbdHS3HFLb55hut/PZ+O18I1XLe7j0euD?=
 =?us-ascii?Q?EvkMeAcQFNqr6O/7yAvROvXAVolLGdRibCGaH2zIzLpdR8HUK76pD44JbnEw?=
 =?us-ascii?Q?6vp83vYzpnRi7bxyaY+a+tSCd2xrRTZImgS4NeASYor707sQtvquqH1SsZnV?=
 =?us-ascii?Q?MWtX9GJr3S/c7dV9Gx2vQJQ/8PsS3QxRxp7E7PN8v1twxQblHIChQjJoYVbw?=
 =?us-ascii?Q?5nX97xCgUGM26RLJz0Ksw10lhXNoi2ur453vVSq862cblgfb8mpkwk7ZVeEF?=
 =?us-ascii?Q?G0XqQDzXpkhxeyeE1Y+3cDUcxlI+pk4MYZAJ8w1X4Wd9Xh46rC6w/0gTG3J0?=
 =?us-ascii?Q?oXxP6K3Lh48IDOnJ44LSMfPd2sz1EtBNqolumLloFByxWoHCONcwih80iJUb?=
 =?us-ascii?Q?9gHo5+ooosfB30hfmLzycmdwsjGJFhzycYZynwxtLLn1zd/PcF/xj3Tt9rZi?=
 =?us-ascii?Q?gZSGrtDo7/0SC7XpCNPJXxnqhgyHb5tJw1ykMLy0IBCAwd8MmTtXJXE41v9X?=
 =?us-ascii?Q?dtf18Pd7HM/WEdIn75hcQlZOnvmg4+qerVLNvsFNlEzzI7fGyaRecRxKt+Ci?=
 =?us-ascii?Q?y06BYCeZ9Z0dkBxckkkjGK7Fbwcoyy4hG25sHdbXRepj9b0BV0brEJHsWUur?=
 =?us-ascii?Q?z2vRHdgBHXoX/GE1n1u7OU+ydWl7bUIjLlclSnxakWN8Uy5y/ivBwle70yK9?=
 =?us-ascii?Q?A/8oEGmpa8fj0aWjO1hD0OKzGdpV4RPAl6opUjQ4Tih5mS9a0TVAW7NaRAMp?=
 =?us-ascii?Q?/FVQzccXf6qRF1iyxdo2WGOsbpoqsr0mtTbdFEuMf7TflyQxReBndF8tvwgK?=
 =?us-ascii?Q?Npr5irtHShcig2aMAZyElftuXORKXomRwUVCR5wQC4sO7AJ0fzeKIe+aYaZq?=
 =?us-ascii?Q?89+t67ZucKarR6stMpnz45Mo+frgX9xPTGwvikCBm2QDVFfeVqR9sLB4+yRz?=
 =?us-ascii?Q?puKr5auup637Fn9MOXf8kcILpJbOgz5FAlJUSpO8z3yjQctQDtWLUQUH2eOg?=
 =?us-ascii?Q?iikdr/Rxw5g3076r4rkPlY4Hk9yi18lKEWIaHnJAeMgMQ20OVQKBWVrAjwEH?=
 =?us-ascii?Q?Ev7zn4huYww1DN0LTbgWncAVGMUdJJQNIuDuls9?=
X-Microsoft-Antispam-Message-Info: jxMnSttNADFjwXl3oTKcAQeQzMm5xJrNlJTmKbbP6IHkm9KtzYeezK8LYMQsSEdC5VGaJtg//52aVmhTplLCO7lskkOa1KL94VYUZinUhDyiAZ7a5HVs8bKCcCbUpDp06v+JtqH+D3IboG3YBT8kS0aqoEq3ttmkCvZO2cWigdIEcfWRsWlUlplQouZkVhB3oP2gfWR2TP838u4wv4dsHcJpgcW2zkJ1Svg2swa1QQWIm5nHc9RzCD6BhgpIjhJoe4vc7K97GJly1yTJ8C7F+Lys3yalidWcl2mZMjI9KwCURQ76jLxfePudbCUxNCJFVYiYZw2SEP33ZxmKgHsm2aRv18Pryl+gDsuk+ivQ06k=
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;6:rrREgQi/fyTyd+T+J06l7sP4ROhU+fpLxPf3/CAfsZf/6ORCa+sIz669CxhrTxEp+ZKWutgJ66mOOOrLMxjx23sEWhgS05Mlo+uYgWkYfUOlWsqptdNDWH74dCb3+eQyigSo7z59uMtQxJDVnRLtnJfM4IqeAoXm/EPNSG0+OPoEGZbA+9QnVBHNNTmEbmw+Qd9YxSWYn3yjH9cMAPAQ0joYgvUjH4kwvF2wePUlso6VuM7W4pqFxfFremiNos/dcd3NrhZ3VXtl584up7jqEDgByXygwTGwae3gH8lhedpXRgK9rHksVPcBNHsN0/XMjOdwypuOB9fhuZOPpfjpghckkpR+/NcogIFPHbZG5kPNGoVlXLOPn4KDYZvTQXQNQOyjrRRRt53RLEBUj5NUDOYZP5VS0svDyhHr3yLIci+7SW8wz4R2KWUrxuKe+1UnouIMXGmu1n4Vhs32AA1CwA==;5:z6zJr3RTbrqDr2aQNhksjRbPeQBBQg1VI9xFLbQPit7pLFZNGScvVGQBSb3eSX5N+d6uUS1eiEYPrTZuhvAsvkhqOt5UG7OznVp2GtSUQlcXb9+4SLJkQPo0mGYrp8ozG5xECjwKzkWZFRr9O6i5n/JF1cWRr1a0f30U6I7Z7hI=;7:suXMlnrimI5CaMcPWKLw39kkmGi1Pg/Mjhbog1cR8v/yflDFq3dszlb9JT6jJa4J/AL4dvi3tlaaH00V13VPW6MJ/MyD2PltLr+mUpKFajoXunkKiecQXQax3iEnPVnf3fkIYvRlFjgXkAp2RPmVb9kxhtqpiq68JKqLkTyy74qycdwzMs41n8pH3KLbC6Tqt15S65J4Syomkq1UheoXV1LxJOyuFdk7QXu3K6ioKQb0gJrnkTy4QrZMpZun8jkl
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 16:59:05.8388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc895fab-dff1-42cd-296c-08d6230835ba
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4211
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180925164348.PVJlWnfR8pJCJPHC8vdZ-lNliJHdZtZRX_6H3hzuAHw@z>

Add scu clock common part which will be used by client clock drivers.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v1->v2:
 * update function call name
---
 drivers/clk/imx/Kconfig       |  2 ++
 drivers/clk/imx/Makefile      |  2 ++
 drivers/clk/imx/scu/Kconfig   |  5 +++++
 drivers/clk/imx/scu/Makefile  |  4 ++++
 drivers/clk/imx/scu/clk-scu.c | 17 +++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h | 18 ++++++++++++++++++
 6 files changed, 48 insertions(+)
 create mode 100644 drivers/clk/imx/scu/Kconfig
 create mode 100644 drivers/clk/imx/scu/Makefile
 create mode 100644 drivers/clk/imx/scu/clk-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-scu.h

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index 43a3ecc..b1599bf 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -3,3 +3,5 @@
 config MXC_CLK
 	bool
 	depends on ARCH_MXC
+
+source drivers/clk/imx/scu/Kconfig
diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index d447f8c..79b641a 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -13,6 +13,8 @@ obj-$(CONFIG_MXC_CLK) += \
 	clk-pllv3.o \
 	clk-pfd.o
 
+obj-y += scu/
+
 obj-$(CONFIG_SOC_IMX1)   += clk-imx1.o
 obj-$(CONFIG_SOC_IMX21)  += clk-imx21.o
 obj-$(CONFIG_SOC_IMX25)  += clk-imx25.o
diff --git a/drivers/clk/imx/scu/Kconfig b/drivers/clk/imx/scu/Kconfig
new file mode 100644
index 0000000..4d018fd
--- /dev/null
+++ b/drivers/clk/imx/scu/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+# SCU based common clock support for NXP i.MX SoC family.
+config MXC_CLK_SCU
+	bool
+	depends on ARCH_MXC && ARM64
diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
new file mode 100644
index 0000000..7dead13
--- /dev/null
+++ b/drivers/clk/imx/scu/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_MXC_CLK_SCU) += \
+	clk-scu.o
diff --git a/drivers/clk/imx/scu/clk-scu.c b/drivers/clk/imx/scu/clk-scu.c
new file mode 100644
index 0000000..4c253a5
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-scu.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017~2018 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#include <linux/errno.h>
+#include "clk-scu.h"
+
+DEFINE_SPINLOCK(imx_ccm_lock);
+struct sc_ipc *ccm_ipc_handle;
+
+int imx_clk_scu_init(void)
+{
+	return imx_scu_get_handle(&ccm_ipc_handle);
+}
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
new file mode 100644
index 0000000..c503a52
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017~2018 NXP
+ */
+
+#ifndef __IMX_CLK_SCU_H
+#define __IMX_CLK_SCU_H
+
+#include <linux/spinlock.h>
+#include <soc/imx/scu/sci.h>
+
+extern spinlock_t imx_ccm_lock;
+extern struct sc_ipc *ccm_ipc_handle;
+
+int imx_clk_scu_init(void);
+
+#endif
-- 
2.7.4


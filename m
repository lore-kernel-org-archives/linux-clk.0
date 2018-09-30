Return-Path: <SRS0=xqQ/=MM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFA4C43143
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7648D206B8
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="shboYqy+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7648D206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbeI3HmF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Sep 2018 03:42:05 -0400
Received: from mail-eopbgr10057.outbound.protection.outlook.com ([40.107.1.57]:48520
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbeI3HmF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 30 Sep 2018 03:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KXCLo/czKkeh2JOWD7ho92cjVVm2dzZhEKJmItsrKs=;
 b=shboYqy+s33gI5GvPHLOb4F2NEhmJwgfc2gnI452TIcn6CoSDNARTkC6lCESj56qNvgK6c762oQ7thv6KGdsaXplYoOtjDa9JF1epCgHre45TZxHei55WvnJKzxVNBUObVJcYk2wUCQIBFO8ZkhtEo39WeLx8FXUXYb2xV/oPm0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 VI1PR04MB4221.eurprd04.prod.outlook.com (2603:10a6:803:3e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1185.22; Sun, 30 Sep 2018 01:11:17 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V3 02/11] clk: imx: scu: add scu clock common part
Date:   Sun, 30 Sep 2018 08:56:17 +0800
Message-Id: <1538268986-24890-3-git-send-email-aisheng.dong@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: cdd040a5-901b-466e-480c-08d62671a1bd
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR04MB4221;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;3:DI+QGnMkJfTlHQ/SlrhTBLmZWTF+HJpNP0t8w7uWHqC2IULw4uawDirke5IqDhv+dOqQTHPgAAtMmufl8E0Oy2RD3qdAj3UzyxMBFZ8h3XakvmOCKx874sV34kU5jZkF23gF5SeQ1ho4ZMK8Q/11ox1Q3lO3fe7fNX57dUB1yO7LVxy1a3Axu2t7hakSh+VnUYuq+ay9U4PTqGKo8NkThZ4Xxsmx5UEPk/4lNDpBqUwBE/8LA48P8xY/eWjBx5Fp;25:7DIDch0krq2ZHUCvdX1t8/g3tpj3FHhLXrI26YFMhx1cZS+uRgHnvRJG+HeBelxqb3nXeIFPQ/iisuz4FgiU18GRmvGh5bj36ZXFowPfgIdoOXZ+QsDrPrQj75exs+q4Xraw16XDbmbZe4X9SsPU2uf961PEKn4PBw/BykzMkZtptLM3ADI03vqfOQOKToLAlAjAuVHV6KG9NvGB3VCq4Ju9O6LkwO7xYzGSRUIuqgCXkY8Mls1rsgmzAxk7iWnqDVyXxoIHA64wQOul2Lefqb+JkmXWeBHr3CFPor5P36asFKH4iccGedftx+wOlqjv9rjQDCqoZeZ7crMxVNUgAQ==;31:aIuMLX+KhY5W5tbE0pzGpif8q2G4GcFVL+gnlR/c4Eo/2OrPvYa7QfWJqDPR6vERvbsLWDtaFEZ9et11gD0jH/OOZxVuzCPB4nXxt0zyG/mSMzQSFArhj654SmHr9TmHQHHAB0RD6H1nXyT9kNm2m1cZs2iZuUKn4nYENZkrlMSbgI1aQ2H5FJjF5C22+Y8IHYjFcpXcb/nQ6kioiXHbjavDscUobRYhFVUM/wghby8=
X-MS-TrafficTypeDiagnostic: VI1PR04MB4221:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;20:fSDWd7Bx7YMBx4xCsam2bYm63oIm39CFYaDAjCWnuwwnK8hI3GsooIjTF1NdR5JeAiQi+MvQfccYeoKrRpxdmdc5o2AtdmWnsGyebOKsLwilMmMU2ormKIg/hFB/fvRN6u9XFtrsxxUC7QeghAsJ1qzug/5eaiPQD0tWPBSzg3R2W+sehGKLDl4WcmtccibL7HO7/TVttTNwINiqtgOdjiOa+WjBpDwFzQ/wRv2D79YRWkv/mBEgrwMsV4PlSPOe8XkZtuuKEzCaAcIiyLDBaKGgIMP+h4CCXfCREBb2jZ3Jix4vPK4Zn1RLTkihN28c3x3dVgH/QN5MdBM/iICNfym+gTeUzdZl5DHzXC9Y9SnqoAH8mA16D2jV8tltcA/zQ2USGoeW/UfUVWMp9BBvyjwJPDvZehlZfS4jvcN58ngiFhaLDMwg8LLHZ628Ze3dJYaF5txw+IfbDtlUXxHrFeg/7zKh8NM3OpoqXYnwTjsbxhUq64fobCgc1ofkTDxA;4:xLDN6HMkSJzh2zYHf4upRyEPi5YgwJ+2hIXzZ3n8kww40oHd1PFkfuDV9HkQJFKg/pQNlv3TSRBfZcxUHhtZyv/xVoO+JBz3UjpgF7uXQ6uO8b8a1UGpENiUsDPZlkNY2aQtu7bHPwgkiIWvSK5dYFWD5eSBTMol3XLYm6g3HCD5sbff7YpJxyx9K2tZH+zYrnYdSmcOuu6V6uBTb9bsJ0C8oG7wRFzOu5Wgs6TMqgoins7F0C7TVqr7GC4IAi7t2Ir39BUlKu/3wFjSzftCnA1guVB7kpFY1M/9NhgfN3Sw9YnmD8DTMlfP6j7qL2TT
X-Microsoft-Antispam-PRVS: <VI1PR04MB4221DFC1A88E910EA3E091A180EE0@VI1PR04MB4221.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(10201501046)(3002001)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(201708071742011)(7699051);SRVR:VI1PR04MB4221;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB4221;
X-Forefront-PRVS: 08118EFC2B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(366004)(54534003)(189003)(199004)(14444005)(6486002)(81166006)(81156014)(66066001)(6512007)(8676002)(52116002)(53936002)(11346002)(446003)(2616005)(956004)(476003)(486006)(6506007)(48376002)(26005)(2906002)(47776003)(386003)(6916009)(478600001)(97736004)(68736007)(50226002)(5660300001)(8936002)(6116002)(50466002)(3846002)(76176011)(51416003)(106356001)(25786009)(16586007)(4326008)(34290500001)(186003)(16526019)(2361001)(2351001)(316002)(105586002)(36756003)(305945005)(7736002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4221;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR04MB4221;23:7lr878HIYIVNkejVsnmECMsrXC4BAx5mYigATZ5+T?=
 =?us-ascii?Q?eUPgV89tfT26JDm4KtBDA//X6HuJzUdHay8hpJd45sMrPBU8V002QNV/Q2nM?=
 =?us-ascii?Q?tF42To+1PGkfSKX2bUuzJy3uiAh2TgvzwCqZ9D6z/y/CVHtFk5kywKYCrkQk?=
 =?us-ascii?Q?OG6+HHc69wJghmx5v9vGngAqOIOEQhcJVMUgbjrfLDWibr1t3chBk9UGALhp?=
 =?us-ascii?Q?w6x2M38bRyuWZw086MWe2CeznXjrkqGfQQT3BAK5s54acfJtswkrxkEw5lpc?=
 =?us-ascii?Q?REXgxYdGFm5vrzRK872TLcP3iODlbiPO7lZ8LN1R3qGursdLmIpv6D6ZDeuu?=
 =?us-ascii?Q?E7F/TJ4CVXQlbsCEvged1x3B5F456K66lqYU4IqXbLxQNcKt0Klqi4kjSpcd?=
 =?us-ascii?Q?x0N3N5HScTbuBgSm8yxUPMREo2lbRc9RnUPmcKzMPutJPEHJrSqdEcUoNQX3?=
 =?us-ascii?Q?Ne6Vu4HUa9TGxho8vILqBqvguq80hDpoCH7DKjOvBaBGYb3MegR2Icgr2P1C?=
 =?us-ascii?Q?3858e7zRUpo3e8WWF/oj0DhbV6GFVBLIS1Ve38rSC8r1z+VctA9V23E62Z+i?=
 =?us-ascii?Q?NSz8384A6wjezuzfD8Lmcz2TLZGdNkA0a8DWVsFKDbw8lwHu3LqAon1buthR?=
 =?us-ascii?Q?GiIMQKMEONAWdfe60RLZJH7uNSeESfH/n9d8ixv00O7TK2G1/jVIiDNcQ3+e?=
 =?us-ascii?Q?WpPZekWE+Hpmb9h+ivQ35BMcRFfV5x2ZljkHcjKrXyJcqMTrbgHqB0KKJ5Zu?=
 =?us-ascii?Q?pai5gQ6pel4MfbgVLSJ23vH/cMjXmbkDp4mShhwGeftQjxHka6PRDu666Eho?=
 =?us-ascii?Q?STHynuxTxaiIVBQDlE99i2ulFoggsT+eHOXHxUihdYBMzL/u4n4L1Nqc5AEI?=
 =?us-ascii?Q?gGi3cccSZxkUSm80o3D33JhqWYnt819TaDMvhFHbQlo6TTOG0BHdZy0NsQUn?=
 =?us-ascii?Q?7eRmw265ann7aRrWHJk4QTBftLH4EDlaAzInFru3BCcCVNXOQUeVSRDi6Dmz?=
 =?us-ascii?Q?6fmSI4wymvvZ+RNvAtZUQkqN8zZbSZ3/bAXy7N7IFeGVXaH9yRsKecj2kHYN?=
 =?us-ascii?Q?1V7tvT09Q0MLasCClTkTkwM038j3ZRlybncAqby5pJV0fgoEPTMIRxIWwWmE?=
 =?us-ascii?Q?GhWnbEelPrfqrd/9DBVQtlQoLo9vmApwN98V5wSp3E/Snr68aThWrlRz8faN?=
 =?us-ascii?Q?2xJKZ6ausPMDM39Kt4loXNHarL2s2A5vQOEfnz9qDUr4u2dssWtrogLIbH8r?=
 =?us-ascii?Q?5Lum8N8zi+0XrDrxXA=3D?=
X-Microsoft-Antispam-Message-Info: J7A01TwaxHsdPLaaf2y/TcYhP5RehQ/O8EI+zGOw4Fm+C6RaqQDBTNN+PbixfA6fBB1K708km18Rw9vbZYmHbxXkyyCLX6Jgbp9X+Dw0phxg22/uHEav68UkwnXwwm2HNSwyFq+9QoLyX5b+xabjcOVXiQQwZdMGyMJNpZrclOFKZJeF3oPORzKOB/GRghAbYQW0xbaa5ZlzN8ovgkSQ7c82dyAAX+u+M9zGr9dujyamtlZ6qpH59PDvuDZM4Ma9RLPwrt9UbNfTWAp7tlflKmSC7LPY+Mg0mbC+g9l84QzQtfkr4f7vTIgsvo7uN9d9dzAvuSb95h2k5aAUx006+02ig77BoicfvdHFQ35mXo8=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;6:hxuIIkkybMq05HgXicgcAdCnwqm07aG9xqGW0IyT7vYw91GsQsNB7P71lNEwrW03e0KHXb7v+PcZSv5loLiJ13wNzSggCrwZk3Jular4dhMQ6l3u+2d1XpSxp805gqeCgjpGyJvqW5RbPEwnkUP7hKda9h01QvYINmXzWGLM6Zm6PHrjfMV/X9f21ZK8tFJcrSGgvpAK5ddIY0TnGUmExAAmX0KLMnTwWUBAdPRSA7j4l7vfROvDInv1BqntgZH/LH29nH/Kli6l7VlVl9I6opSk5urhtHfy2659kffdz/VEs5KtE1CjfnZtgZ+Io86j2G5Df2Cuq/7QNqoerdiwIXMoiVCYaGSv8zO3I3jXYvzyI4WcJEkycRm7SHObv6FlyeHmfwcID6O4qtuxE9HYBjOJJBHLBixCgg8Yvxtv2zMxzOEb2E+ds3uZ2tazm6FQ276BZki0QX4RJD1gNF029w==;5:FLELp0GNxE7JrxUFZ2pqp92aDx2aZl+9MeoA1vA+QKDXfgPN3xu5Uwc60kEIJxaK4qw+/5ERWrPZZqvHxDEawzJkT5TeL0u6v1nva7S+NGZjc7sF7xCfBywHLGUGjOWNvobOXXus4rj/oldRhp6piCW17RYoavpo+6ZwuxreXc8=;7:pN744WJkU4pDmp7UaLUxUxG7l742qWQ1bHRRPZyFOzW/sSI+OAicv/Es3NJ4Pmp/r4jNrPcB0U5BY6qjyANT1gobbhpVuJgAikBTpE2BRx5s9qoF3AXk4IfuXdqBzhISbIxzF7TXrBXK8uvoQY1pRPRTFJypPAeCY7mK3XpVvNSz9j2deYFkrjYAXmMsJFz6yGuVTGL8ClTYwr431D5eOKym3CtWnD2nwmJ/BFV/4L5IL3jbCwTWSUh5IsVniqg0
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2018 01:11:17.8700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd040a5-901b-466e-480c-08d62671a1bd
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4221
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add scu clock common part which will be used by client clock drivers.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v2->v3:
 * no changes
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
index 0000000..826049f
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
+struct imx_sc_ipc *ccm_ipc_handle;
+
+int imx_clk_scu_init(void)
+{
+	return imx_scu_get_handle(&ccm_ipc_handle);
+}
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
new file mode 100644
index 0000000..1ed2946
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
+extern struct imx_sc_ipc *ccm_ipc_handle;
+
+int imx_clk_scu_init(void);
+
+#endif
-- 
2.7.4


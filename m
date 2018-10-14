Return-Path: <SRS0=5HZW=M2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A574C6787C
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46BE420835
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="MWoygvX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46BE420835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbeJNPsT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Oct 2018 11:48:19 -0400
Received: from mail-eopbgr20064.outbound.protection.outlook.com ([40.107.2.64]:63156
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726124AbeJNPsT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Oct 2018 11:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lvqf8ap+lxMB5uH1nBItkBVXsAXHGGkuaTbTk7KkRz8=;
 b=MWoygvX8+tJpmB+u33CKuvCKZVOUTd0Ka9hZFOD2iAUJmW7mYFhphkyGMkmDMq0JHh2eHn+O2W77sVjgAqA3hS+4iDiT7OMgi9LNn4hRUMwVEzRZBfsTwc7giT2tTc92Mt7gkCMPL85ggcJgjJhQGjRQ8kIgTQIQj46iRtjl3Wg=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4435.eurprd04.prod.outlook.com (52.135.148.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.26; Sun, 14 Oct 2018 08:07:45 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.027; Sun, 14 Oct 2018
 08:07:45 +0000
From:   "A.s. Dong" <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>
Subject: [PATCH V4 02/11] clk: imx: scu: add scu clock common part
Thread-Topic: [PATCH V4 02/11] clk: imx: scu: add scu clock common part
Thread-Index: AQHUY5T9MGUT6Zv05kq5JPA5N1+iFg==
Date:   Sun, 14 Oct 2018 08:07:45 +0000
Message-ID: <1539504194-28289-3-git-send-email-aisheng.dong@nxp.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:203:52::20) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4435;6:ndX3pzeeiN+H0HJJYiWjSkJ8ETo7rFGVSOjxiSzAezgmZC3wC6mdCDuKFTfvKfwfywnTYm0LRPizTeJ8qRcvpwBpNKDBcq0RrvPcBQ8RO70w8Kb4F/Q+BduYwQ28XViGGvQDCbkV8yMjv/QheK5jfRPg4Y6ATiE190EEeWg8RWQ9KQ7pmkpzHbHK7EI+KuP5h8WyP9MXuCcWo9V4nMrc1biXo8x8Af8Y7/WE5W2i3YNI9TvyPn+b28LetGwp8cM6TGaqKPnCJUl8npzL3A5ke42dYtRssgzgGe46XSsLwJTMq1SbLm+0jCdIHeI/tVnFvKG1iwAzgXMT+YTNvMkT62kSgFugR6zdiLxUEf8ZiM3x080am9+HTQR+JYrdbo4AS8cFgvWEFoS/rdFp2i5OMxH7IxZuNEthg6vujONFfs4vDaDlYpg1BhTi0Z6RH2kZ8RGip18GG8CibacPFWPD/w==;5:btl2jSLQlFN+z69jUKpJCS7UNgFrYfYTeib4fzRP3tERIh3hIuRUNG7MgqUWItNKN2j6ht/H18yMm/LKJ4v7Uw8Jju2Q0jSDP0tG/Qs55+e4en64ScV/m/V/ZekPUDnS4zAnZV1zMpzjABHg6Vb+vuRCYAC9/UQ3YsexbdbzRZ8=;7:LBv4gsoswfBWGHfC20639eKV7bxajWJ0gOkOsPiexDil1I1ccTzv3OXUcesiwesdxX+913IX7sRadcYH8BaIS+SehypKwHbhUWl5UhYS2v/WmGtph7w2DUkqPp90d1372U1OUClglYvTI5edMVQ1kgSNiQad+5FHcQNUYWcTQ4ZGFn/d9vTKionAz9COlyTwS4IXdHRNQ48ImeHGGBH/kDkIxJG0EITAWeWsm8UyV3JZEUdaVbAdPNIQZb4kpt/Q
x-ms-office365-filtering-correlation-id: de034651-e3ae-4aac-bbcb-08d631ac1f9a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4435;
x-ms-traffictypediagnostic: AM0PR04MB4435:
x-microsoft-antispam-prvs: <AM0PR04MB44356AA71FFD20D40A2E0C3780FC0@AM0PR04MB4435.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991067);SRVR:AM0PR04MB4435;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4435;
x-forefront-prvs: 08252193F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(396003)(39850400004)(366004)(54534003)(199004)(189003)(6436002)(186003)(76176011)(5640700003)(386003)(6506007)(316002)(36756003)(52116002)(2351001)(99286004)(6512007)(106356001)(6486002)(446003)(26005)(8936002)(11346002)(86362001)(476003)(2616005)(8676002)(5660300001)(102836004)(486006)(81166006)(81156014)(6916009)(4326008)(54906003)(2906002)(66066001)(14444005)(71190400001)(71200400001)(256004)(305945005)(5250100002)(25786009)(2900100001)(97736004)(7736002)(50226002)(68736007)(478600001)(105586002)(3846002)(6116002)(53936002)(2501003)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4435;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: FyFbWI6Mv/DueXhsmaEaD/4PaKWHAp0e5RcS2urIVV5g+KG7KcREJAFhxscI7ujQHIrdNHWDSg4dcWn0EeT7+AcNbLNIX0HtuZIL1k2C82ygML568JSFlTUfDaBCU1mYv3AKczSZ7oFxD/45WJjrO3HO/LdANHoOH5M6y97m5+FwElK1yJ9APzQao1wzn01AXzz08CG9qLDMyI8PiEMRe0SCw8rU1vzKbPH4FwDmXoHJTvJAt1GzA+9YJ6Pf9mEJ5yQjwvYYgiKLIWrmmtzc0nFG0haudSsnAfF+voB/JQsUdrRK2itoI02mO4BUzn6ft/n61tJwuX3rSYeTzVYSL3VY6jCfEygZJ8bTX/Iw8L8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de034651-e3ae-4aac-bbcb-08d631ac1f9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2018 08:07:45.6966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4435
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
v3->v4:
 * scu headfile path change
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
@@ -13,6 +13,8 @@ obj-$(CONFIG_MXC_CLK) +=3D \
 	clk-pllv3.o \
 	clk-pfd.o
=20
+obj-y +=3D scu/
+
 obj-$(CONFIG_SOC_IMX1)   +=3D clk-imx1.o
 obj-$(CONFIG_SOC_IMX21)  +=3D clk-imx21.o
 obj-$(CONFIG_SOC_IMX25)  +=3D clk-imx25.o
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
+obj-$(CONFIG_MXC_CLK_SCU) +=3D \
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
index 0000000..b964f35
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
+#include <linux/firmware/imx/sci.h>
+#include <linux/spinlock.h>
+
+extern spinlock_t imx_ccm_lock;
+extern struct imx_sc_ipc *ccm_ipc_handle;
+
+int imx_clk_scu_init(void);
+
+#endif
--=20
2.7.4


Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3ACECDE43
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:53:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 379BC2086E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:53:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="UBpaZmjJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 379BC2086E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728433AbeJSAzm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 20:55:42 -0400
Received: from mail-eopbgr20072.outbound.protection.outlook.com ([40.107.2.72]:51963
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727294AbeJSAzm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 20:55:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGSf3K3/rj0cBVT2OgKX+HnNeT0xfCvfubCdpCl1ieI=;
 b=UBpaZmjJAX0Oyp0+5Ek5nsC0iVmpEiL5FWjrygd2uXYR/2cWk/udocP3gLQN3cPeYs26lxUKmlrDYOjWhUBCTgp3QqKBsUksZ7bugfEjr+ucWITwD5rv6xICxoozgF+kwEfbUj8b5CNSTeyIo9+JVP37du4Z3koyGyw/hLDUgDY=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4001.eurprd04.prod.outlook.com (52.134.90.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Thu, 18 Oct 2018 16:53:49 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.033; Thu, 18 Oct 2018
 16:53:49 +0000
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
Subject: [PATCH V5 2/9] clk: imx: scu: add scu clock common part
Thread-Topic: [PATCH V5 2/9] clk: imx: scu: add scu clock common part
Thread-Index: AQHUZwMkd9jDC3KsvESi41G0bGmy9g==
Date:   Thu, 18 Oct 2018 16:53:49 +0000
Message-ID: <1539881347-20871-3-git-send-email-aisheng.dong@nxp.com>
References: <1539881347-20871-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1539881347-20871-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0P153CA0028.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::16) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4001;6:AqnZ62r/WnqrfRudE/3URz3VhF9jJucSLZ9GCqsCT89Y3euiG/Zei9+g9oZBxNjcw/Db4c1w/AW/Hz0OKs1T9f6a8vzZh/d6bIED19/aekMCBsAAVH+AAF3dlz/kQ3tI41GuZxmAfJZ684q04R/BcMazQ3xqQ0h6RS8ahdlPa8WZbLbyMpfutFPizQwA6FIW2va5eO1aC7CTSWDo8u3m34Dm888Xiag/P43up/2etRL6c3Vf5787GdcVsjmUe3aA/oZct7BbTFiUObz0iiRHDAhI3PjWXw6F95SVknYEI0XxCRbHXSm0rCUZCC5I8xe60m8DT6zhCDhJBxQYVqGiXwguvoeRQxJKaKe9PY5LqqeqvCCKinZFISSQpT3nUuJ0jI592YWsK16/I8i4p/ct9PAzyGcOYncke3fTOrUguPoK5BJb5jk3/GRZwC4uzdVvhKd6mFCDavXj+QdFXzO3pA==;5:sOvJFRX31dUDIac6TbQadX/jg5Y7k/R461BZrkNDn2zMSLJj9rbY4gyzGiKcZQDg8N4Lc4qrHo4AZenu8NwIFZZ+xaAaIN6ZFTHDNiZkQ8COC4WW5rwp1VmWpKJhpZBr0iphyJwr5X6iQNO3qJ4CW3snNfnieNJpYvaPS3sZhc4=;7:C7E+5I1oURfOpH6XsRXqhJma2Gyymvs1yAkosjSDP9HRwMWLiCH6nye6MzK38G2ZY4iJUhrmhTyKWh3ZggxQyc0Ob/Rt+VQEq0aYhzSj1S8dlKMqEDSVlA6TgkqM0SMy1a8Re1VAWVIqO/mYXBSEuEs0sVF605zAy3Qnk2vL0Rh4T6xkCKLFckUfiUgvUFPCZqgr22rdoll7RbiBC0IEkXk24pOlJ+W9dO4ENTYMswQm3iwMsskV726pMQyIhe6Z
x-ms-office365-filtering-correlation-id: 8fda570c-c28f-4584-f8ca-08d6351a46ab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4001;
x-ms-traffictypediagnostic: AM0PR04MB4001:
x-microsoft-antispam-prvs: <AM0PR04MB400143EBEB9424321B73758480F80@AM0PR04MB4001.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4001;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4001;
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(54534003)(14454004)(6486002)(54906003)(53936002)(26005)(5640700003)(2906002)(102836004)(99286004)(2900100001)(97736004)(105586002)(52116002)(106356001)(76176011)(2501003)(6116002)(386003)(6512007)(5250100002)(3846002)(71200400001)(6436002)(71190400001)(2351001)(6506007)(486006)(11346002)(8936002)(36756003)(476003)(81156014)(8676002)(2616005)(446003)(508600001)(81166006)(25786009)(186003)(68736007)(86362001)(4326008)(305945005)(50226002)(256004)(14444005)(6916009)(316002)(6346003)(66066001)(7736002)(5660300001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4001;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-message-info: RPfBiIVNJo0puPU77jOLLOf80F9s7U76cZAVBoIhDmVnh5n/VLF6NIU+8ju39GqehK3ZeryFC9f4XL3+t93oJLHL8PDPpOHtvq9mVcQLWJ6mqWSzM4UVucLBo1H44SLrpHuJHocl/tlTKaH/9xWyvIlxd4m4E4xXJyGyS2WDKqes5lhTOSWz/shdP2OoyDlDL1FKkHy2ODjC5/hgzHM/JU3LkvRUXfR6YKriy6adzgxgBIzrCDg0nA4SMAdLoZjqt1jz//t+/Shr7boD5DmKZ7Pgiw5/ylgANvYRUdbiIVBYdNDrvwsgb8PZc4r1nmunY5bs+9eYzzDLlGFIXMF5VG62Z1Q4kMjRTDwh6HPTqNw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fda570c-c28f-4584-f8ca-08d6351a46ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 16:53:49.3413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4001
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add scu clock common part which will be used by client clock drivers.
SCU clocks are totally different from the legacy clocks (No much
legacy things can be reused). So a new configuration option
CONFIG_MXC_CLK_SCU is added.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v4->v5:
 * add more explanation in commit message on why put scu clocks
   in a deeper folder.
 * move scu clk files into the top directory of imx folder
v3->v4:
 * scu headfile path change
v2->v3:
 * no changes
v1->v2:
 * update function call name
---
 drivers/clk/imx/Kconfig   |  4 ++++
 drivers/clk/imx/Makefile  |  3 +++
 drivers/clk/imx/clk-scu.c | 17 +++++++++++++++++
 drivers/clk/imx/clk-scu.h | 18 ++++++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 drivers/clk/imx/clk-scu.c
 create mode 100644 drivers/clk/imx/clk-scu.h

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index 43a3ecc..63e7b01 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -3,3 +3,7 @@
 config MXC_CLK
 	bool
 	depends on ARCH_MXC
+
+config MXC_CLK_SCU
+	bool
+	depends on ARCH_MXC && ARM64
diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index d447f8c..eec6d72 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -13,6 +13,9 @@ obj-$(CONFIG_MXC_CLK) +=3D \
 	clk-pllv3.o \
 	clk-pfd.o
=20
+obj-$(CONFIG_MXC_CLK_SCU) +=3D \
+	clk-scu.o
+
 obj-$(CONFIG_SOC_IMX1)   +=3D clk-imx1.o
 obj-$(CONFIG_SOC_IMX21)  +=3D clk-imx21.o
 obj-$(CONFIG_SOC_IMX25)  +=3D clk-imx25.o
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
new file mode 100644
index 0000000..826049f
--- /dev/null
+++ b/drivers/clk/imx/clk-scu.c
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
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
new file mode 100644
index 0000000..b964f35
--- /dev/null
+++ b/drivers/clk/imx/clk-scu.h
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


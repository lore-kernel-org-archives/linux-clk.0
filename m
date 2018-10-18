Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC59ECDE43
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:54:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9991221473
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:54:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="vWpBNOKV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9991221473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbeJSA4i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 20:56:38 -0400
Received: from mail-eopbgr20068.outbound.protection.outlook.com ([40.107.2.68]:43510
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727996AbeJSA4i (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 20:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUtsIT43TyRVKzKi3+BK5KRZ/I9UQJykIFmx6RI798s=;
 b=vWpBNOKVt4GfXHbr4NPVtGBEzRUXRF8PmPJ8ZxwdYghuW1u/LNDl9va4xon/wbM8Kh7YWi5GbmynPU7jI6whAFclLWyOfKNXUN/5XpbcUylYhEbWbcXPU/1TNs8VzMyeH/Df1mGNgYjXJcXmuwDWG3cdDIQR80t+F8Ge/BmbRSA=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4001.eurprd04.prod.outlook.com (52.134.90.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Thu, 18 Oct 2018 16:54:11 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.033; Thu, 18 Oct 2018
 16:54:11 +0000
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
Subject: [PATCH V5 8/9] clk: imx: scu: add scu clock gpr mux
Thread-Topic: [PATCH V5 8/9] clk: imx: scu: add scu clock gpr mux
Thread-Index: AQHUZwMxoKuYMobzYESB5z7OZfAUfA==
Date:   Thu, 18 Oct 2018 16:54:11 +0000
Message-ID: <1539881347-20871-9-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4001;6:481avb1/ZtXfNi8hAzQeje9vd3HzkcXoCOvETKb6h1ZMRLj+DA6lkLeDQXEr1UdfkXnJPi8xLdyeNJBiROoiBFmIVgTeh4MJO63xpORs4jJXk8XKVJBxSpHrcYwtijveZgrdJ/tf2uNZ2rMyOX1wnyMVqsenWmFI/ULRSvu/OVANy0R0bB/T5xni7DlHh1duUuv3e4Yv/Vlv/T3pzaCkMYJboqMJRijP7v93Uh9mqZAGvX4hEADoMOKIVFvHYEG9o2MiIy0E3V9Zqy89efkqhN69Y1KcuZ0F5WBCpeV6oSGmEXYausQpN8nvSxaxCx/k8gbwDMNDVF+XFoaTAkgINoj5rp2nREbumYnJYVZptn91b7BHuwF59QBG7did68IvJHTzqnBliJ6IYr+dHTDYLD19gQhZIoTqjQ76Ur734FAzYkkF3PXMHT+RTRRkZro0rNEAWHoNMDNIx6IYvjxjvQ==;5:gJjjeyzbV42LEq1cl4/9GkdGmq1DmUmmOsYOdq57VUOibNr/JYgEdVKxIlup7H+/69/AA/RwvoLdWgpRJxlL4UbASGmKhDxKlI/GthVs3YuvSBZ6xLBCRBEmt4zu9DsXYWWT208BxG9OOZM9vpReDBPcZPzfKpjQG6OPEuYY04I=;7:XIT9WzxXr/XWXB5ZfIL/t4XXnXy2qDWHZI2P5cr1+4oLf1M7+yVPm2fo1bwh8U7tuXzVCN99eyL0fJoc6FmujsCLSmyWtZ/AJ5uYd4Sf5DhNzqOryTfBM9K3NO3l7tV+U5CTEAcfPGjSG8TsOsPMghNtDK4mb8WQ643U0bDfGK/EK1/5Xtumd/Z3TJB1nnNskVr+nrRK2Pts+n0q4Z5xK/lPQDC2sWz9M0eoaF9L7v7CTawJsIFxfhZUNFmhbE3K
x-ms-office365-filtering-correlation-id: be54360a-128d-4db1-864f-08d6351a53bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4001;
x-ms-traffictypediagnostic: AM0PR04MB4001:
x-microsoft-antispam-prvs: <AM0PR04MB400115850D32D9A86E4B871B80F80@AM0PR04MB4001.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4001;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4001;
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(54534003)(14454004)(6486002)(54906003)(53936002)(26005)(5640700003)(2906002)(102836004)(99286004)(2900100001)(97736004)(105586002)(52116002)(106356001)(76176011)(2501003)(6116002)(386003)(6512007)(5250100002)(3846002)(71200400001)(6436002)(71190400001)(2351001)(6506007)(486006)(11346002)(8936002)(36756003)(476003)(81156014)(8676002)(2616005)(446003)(508600001)(81166006)(25786009)(186003)(68736007)(86362001)(4326008)(305945005)(50226002)(256004)(14444005)(6916009)(316002)(6346003)(66066001)(7736002)(575784001)(5660300001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4001;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-message-info: A0Ovf96M3RepIAaRsl1SiQ4J/4hkPnsd00yATpWtVIXd2BVBnWRQJerk/OyCD7rb3jfjLyYrYugwak0weREUtg8wKgZu5xxVA4CdM0V3TsCSFeF/oWt5rmj5/BbO1kkaXNrfk09x8aa6WFaR+ocjodUdbPlHDWiy5xabUPZl+J3wByh4bUxBM5mY5AyNfMSYOBk3ZUb5lX3GJkrUQPJ3s0KNy1z/8p1BaGMnqn07b1mvJwKPEWEfHBVRnJHFbEuRBXeB5JBek3LkX7vOZyWAV61/ZlYQkU/wcB66as/9OlyBgFDVYnMctDvrIQ7Em6hZ4GJSRqNu/YBHpbDLqC/RoLyy5By8fnuR4WwJtCNT71k=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be54360a-128d-4db1-864f-08d6351a53bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 16:54:11.4718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4001
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
v4-v5:
 * remove one unnecessary debug message
 * drop explict casts
 * move scu clk files into imx top directory
v3->v4:
 * scu headfile path update
v2->v3:
 * structure name and api usage update
v1->v2:
 * no changes except headfile name updated
---
 drivers/clk/imx/Makefile          |  3 +-
 drivers/clk/imx/clk-mux-gpr-scu.c | 84 +++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-scu.h         | 11 +++++
 3 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-mux-gpr-scu.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 5f1cece..e0d327e 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -19,7 +19,8 @@ obj-$(CONFIG_MXC_CLK_SCU) +=3D \
 	clk-divider-gpr-scu.o \
 	clk-gate-scu.o \
 	clk-gate-gpr-scu.o \
-	clk-mux-scu.o
+	clk-mux-scu.o \
+	clk-mux-gpr-scu.o
=20
 obj-$(CONFIG_SOC_IMX1)   +=3D clk-imx1.o
 obj-$(CONFIG_SOC_IMX21)  +=3D clk-imx21.o
diff --git a/drivers/clk/imx/clk-mux-gpr-scu.c b/drivers/clk/imx/clk-mux-gp=
r-scu.c
new file mode 100644
index 0000000..441c53b
--- /dev/null
+++ b/drivers/clk/imx/clk-mux-gpr-scu.c
@@ -0,0 +1,84 @@
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
+
+#include "clk-scu.h"
+
+struct clk_mux_gpr_scu {
+	struct clk_hw hw;
+	u32	rsrc_id;
+	u8	gpr_id;
+};
+
+#define to_clk_mux_gpr_scu(_hw) container_of(_hw, struct clk_mux_gpr_scu, =
hw)
+
+static u8 clk_mux_gpr_scu_get_parent(struct clk_hw *hw)
+{
+	struct clk_mux_gpr_scu *gpr_mux =3D to_clk_mux_gpr_scu(hw);
+	u32 val =3D 0;
+	int ret;
+
+	ret =3D imx_sc_misc_get_control(ccm_ipc_handle, gpr_mux->rsrc_id,
+				      gpr_mux->gpr_id, &val);
+	if (ret) {
+		pr_err("%s: failed to get clock parent %d\n",
+			clk_hw_get_name(hw), ret);
+		return 0;
+	}
+
+	return val;
+}
+
+static int clk_mux_gpr_scu_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_mux_gpr_scu *gpr_mux =3D to_clk_mux_gpr_scu(hw);
+
+	return imx_sc_misc_set_control(ccm_ipc_handle, gpr_mux->rsrc_id,
+				       gpr_mux->gpr_id, index);
+}
+
+static const struct clk_ops clk_mux_gpr_scu_ops =3D {
+	.get_parent =3D clk_mux_gpr_scu_get_parent,
+	.set_parent =3D clk_mux_gpr_scu_set_parent,
+};
+
+struct clk_hw *clk_register_mux_gpr_scu(const char *name, const char * con=
st *parents,
+					int num_parents, unsigned long flags,
+					u32 rsrc_id, u8 gpr_id)
+{
+	struct clk_mux_gpr_scu *mux;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	mux =3D kzalloc(sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return ERR_PTR(-ENOMEM);
+
+	init.name =3D name;
+	init.ops =3D &clk_mux_gpr_scu_ops;
+	init.parent_names =3D parents;
+	init.num_parents =3D num_parents;
+	init.flags =3D flags;
+
+	mux->hw.init =3D &init;
+	mux->rsrc_id =3D rsrc_id;
+	mux->gpr_id =3D gpr_id;
+
+	hw =3D &mux->hw;
+	ret =3D clk_hw_register(NULL, hw);
+	if (ret) {
+		kfree(mux);
+		hw =3D ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index 2a5a45e..bab6a7f 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -81,4 +81,15 @@ static inline struct clk_hw *imx_clk_mux_scu(const char =
*name,
 			clk_type);
 }
=20
+struct clk_hw *clk_register_mux_gpr_scu(const char *name, const char * con=
st *parents,
+			int num_parents, unsigned long flags,
+			u32 rsrc_id, u8 gpr_id);
+
+static inline struct clk_hw *imx_clk_mux_gpr_scu(const char *name, const c=
har * const *parents,
+			int num_parents, u32 rsrc_id, u8 gpr_id)
+{
+	return clk_register_mux_gpr_scu(name, parents, num_parents,
+			CLK_SET_RATE_NO_REPARENT, rsrc_id, gpr_id);
+}
+
 #endif
--=20
2.7.4


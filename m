Return-Path: <SRS0=5HZW=M2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97ABC6787C
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A544320835
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="iismjE1S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A544320835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbeJNPsV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Oct 2018 11:48:21 -0400
Received: from mail-eopbgr50049.outbound.protection.outlook.com ([40.107.5.49]:46820
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726237AbeJNPsU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Oct 2018 11:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5haimtRRdduUy32eZzWfPUdbB5YMaSlU66y7wyTbxo=;
 b=iismjE1S1gCXBKbea8Mg0APEXxCJ7E0qHlluWOLR3ZmJodDEYXsbbvlUOuZyrBbUuTsvlZHYrdJpAjiivk1PIntuNOIIdcb7vGpQt2hHDJy1J3eBZfXTPfe7z07PLXWyT6vaDxDQ9MyUV2Gba68dCPdfNRgmPYbsJJfFxNLpYgI=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4724.eurprd04.prod.outlook.com (20.176.214.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.21; Sun, 14 Oct 2018 08:08:06 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.027; Sun, 14 Oct 2018
 08:08:06 +0000
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
Subject: [PATCH V4 08/11] clk: imx: scu: add scu clock gpr mux
Thread-Topic: [PATCH V4 08/11] clk: imx: scu: add scu clock gpr mux
Thread-Index: AQHUY5UJiMWo4EyTlU6ZkZDeCgMmng==
Date:   Sun, 14 Oct 2018 08:08:06 +0000
Message-ID: <1539504194-28289-9-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4724;6:jVq8RPI8nTuRyx4LjMgKK176gccWqgZry8wsFd0xRrg4jgaVj7UosIaJ9/fXIfUHCMcTt1eP80qRLC5CW0jl0wUTKuHhgurdhPq+PdP9yMXRydSq6ZqTit39Uhj/nbi4O6OIfDKySqTrnOZ+R+bc2mor9vV4HrSQcdyJLRWZ9tl3XDg/cyDcnZTqU2sdeL4CavuBV6Z5E6NFN08KwQxu66ydUJAA4O0yibcghm+s57bMuwFaudgL1ZzuHOa6fGp3f7y55kgG1xgke/TzLvnleaSA3b/Iw6Ke4CB4tB8gvmPHLQr88dhz38NZM/t9m3O34o0PhK1FvdmuKcSljFuZiTa7v9AhJ/Opqe2tcE8BVJdeZ9YgDNXX5R72p6GdcKZO+tpb6454SFhsNfkMhWXfBYL3AaS0NBjOjW1+rE24GYo98e1opxGQ/BpQkO3C/DKOq+qwzuqzyZUKA4eYBvuV1Q==;5:/cBdgDojBxsnSxpfZHuAG/SefeRtC5bhmxKNLom5lcQTFB7+VLAfGPYHCdNVRefcyjDCThPOTbgVdwNH7r+xvF3+DUU/hyKT2jy7Lk2h2z4wLycRJO2aUM7vkgjrgrasGtP+Q39nK3mQGfZRtwIWgjsP1n64Uu7gxiIPM7WN08E=;7:e5hmvpHrQJCTJvsCvo6vI5ygke5Ew95677iBQRpp9YsPbFnGUYd+xEFJztlp5D7Oy9/Al6k4Djst0IlA7qmhXSUH7BkK0Gw5OItzL3OcJEzvy/UFjmlLrvQ7Xl+xeM3CidWjAGeSMHge6vEjsaW/MXXTKb9jwhr+74/PgWtuaaPPe1A4BFwSQZrXUXEapGFjaa+6vEIvkV8Ilpc9CVNLW3IAbvYeBYmU3g0Db2WHMOdwa/Mc7vhrziPoZa/bTJlO
x-ms-office365-filtering-correlation-id: 79cbb3a5-69da-4582-428a-08d631ac2be2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4724;
x-ms-traffictypediagnostic: AM0PR04MB4724:
x-microsoft-antispam-prvs: <AM0PR04MB4724E07CA53E221EA3F40D4D80FC0@AM0PR04MB4724.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(944501410)(52105095)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051);SRVR:AM0PR04MB4724;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4724;
x-forefront-prvs: 08252193F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39850400004)(366004)(136003)(396003)(376002)(54534003)(199004)(189003)(25786009)(50226002)(54906003)(486006)(5660300001)(476003)(5250100002)(14454004)(2616005)(2501003)(3846002)(86362001)(6116002)(105586002)(316002)(186003)(478600001)(2900100001)(106356001)(14444005)(97736004)(2351001)(256004)(4326008)(102836004)(81156014)(6512007)(52116002)(81166006)(99286004)(7736002)(5640700003)(36756003)(71200400001)(6436002)(71190400001)(6506007)(66066001)(6916009)(8676002)(76176011)(26005)(53936002)(2906002)(8936002)(305945005)(446003)(68736007)(386003)(6486002)(11346002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4724;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: ut+nUh5ohkwIA/tanLnm6727OCxeQA9PBc11of5uDwG8+qRHzrolHO+ZpDcYQsMViwRkIs89gEdhBuoEsYkAVzCoc6qauW7gA6EqVmG0NhsAhfINTPoCyEMjGaj6PrUCn6ABVSnk8z93Fi5I+jV2aTKIlJBwzCWAZ5VoGu1oX94MJ7ndd5VybRcD8npbZi/pMLWE82/0SgZqDpgFNBlegWl26UlnKKND7dXlNMe6oeb/tg8n7MXFCeBr9ou68AE9/sMrzYU1htVkgMkxv2K1vX0oOpuyNqMBkzWB91MpDXsWptBo7uLkGkC54Fq3mPLOwdvkRuk3RmOJxoz/VvRSOurIWqSs+2xo4Mb2niyV/zk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79cbb3a5-69da-4582-428a-08d631ac2be2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2018 08:08:06.2880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4724
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
v3->v4:
 * scu headfile path update
v2->v3:
 * structure name and api usage update
v1->v2:
 * no changes except headfile name updated
---
 drivers/clk/imx/scu/Makefile          |  3 +-
 drivers/clk/imx/scu/clk-mux-gpr-scu.c | 90 +++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/scu/clk-scu.h         | 11 +++++
 3 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-mux-gpr-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index aee56bf..a76ed78 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -6,4 +6,5 @@ obj-$(CONFIG_MXC_CLK_SCU) +=3D \
 	clk-divider-gpr-scu.o \
 	clk-gate-scu.o \
 	clk-gate-gpr-scu.o \
-	clk-mux-scu.o
+	clk-mux-scu.o \
+	clk-mux-gpr-scu.o
diff --git a/drivers/clk/imx/scu/clk-mux-gpr-scu.c b/drivers/clk/imx/scu/cl=
k-mux-gpr-scu.c
new file mode 100644
index 0000000..2ad7a80
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
+	return (u8)val;
+}
+
+static int clk_mux_gpr_scu_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_mux_gpr_scu *gpr_mux =3D to_clk_mux_gpr_scu(hw);
+	int ret;
+
+	ret =3D imx_sc_misc_set_control(ccm_ipc_handle, gpr_mux->rsrc_id,
+				      gpr_mux->gpr_id, index);
+	if (ret)
+		pr_err("%s: failed to set clock parent %d\n",
+			clk_hw_get_name(hw), ret);
+
+	return ret;
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
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index b2b56d3..8cc58e4 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
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


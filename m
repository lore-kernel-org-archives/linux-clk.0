Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293E3ECDE43
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:57:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFB972086E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:57:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="S7q/620X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFB972086E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727294AbeJSA67 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 20:58:59 -0400
Received: from mail-eopbgr20069.outbound.protection.outlook.com ([40.107.2.69]:12295
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728474AbeJSA66 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 20:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CTdsYx1lJed/l1UUOzwvVqTRbwep3+yI8Fw1+YaXFU=;
 b=S7q/620XbSCqFJRbJ9+X585U/yrE9f/y6OEz/vOzvyelpIacqFxkvMonotGbsS1bqQEYARyajitjghVE59/5wY4U4demrHkdXz+4R2sftwSotruldIMAp5CgZrK68Y8PKsvwq0301uGmr6GCNPmvLDZSOO/yi6aQjQtvJ+rUfzY=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4001.eurprd04.prod.outlook.com (52.134.90.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Thu, 18 Oct 2018 16:54:07 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.033; Thu, 18 Oct 2018
 16:54:07 +0000
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
Subject: [PATCH V5 7/9] clk: imx: scu: add scu clock mux
Thread-Topic: [PATCH V5 7/9] clk: imx: scu: add scu clock mux
Thread-Index: AQHUZwMvEQLtCMHQLkqazeFQoZn0hg==
Date:   Thu, 18 Oct 2018 16:54:07 +0000
Message-ID: <1539881347-20871-8-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4001;6:cwGBpHvw2jRKa6z+QsolqdvNNal/cIu1VOb/AwoXAes0TaHAdIw5rTM0h0oUEPcrDFQ8gfIhlK025HMEwRMdMbdpzYsqPkMkMZcInXVkKV7iHLAMoYoKzXovvqri3ScnUCHRddRh/3E1dorYVQtjsJLGT5lIR58Ucya8W0XJlQ8hHIQgWWAPeY/1CJDl0Y1Mr0wNAbmuea1C+ZwVtQVYS3hycw/t9RfdxPtCJtdRMS0kKFbvTcFNo/IkGrivXOuVTcxjJm1vRVK176maoXNyDPZhp+Xw8Zzovj7v+37XZ5L4BRr/rq3fra+PGcg4yBs9XbMw4HxBcXB9KWzMO3jt63yHT1MXR5Sj3pWWVazCS5PiVzQpHw68dfk2dkyV9b433+iwtFH/n5xxM9bdjmNbLPA6mn4rQc40xrPkikhCrlJG3U8jTUZe9fZ9CGuLRJS/LdS1uAOIbCMWH3E//dwTvw==;5:24chAdj8bM3LducM9lc50lXWsR3j+P58olpUX45FX3yLtjzffYdN7uj6xt6FMee3rIQ0ZIrSpKbdUs5fBj8Yg4vcqN1dyc99XOrrDkHh7z3ubFyFyQUxFhebcBYlsj/98kv8rTNGxQ0qY4EP2BtJCMIVkSPrZ70zfl4ErdQgON4=;7:GVYLybv1IL640azte5qjEiNmt6yk1DH0aFwf4iElDQcN5WfpZBcCSn3cLwQ9dl9FVeJ37AEJI0VDdDerIShqIHOKOhlS6mxv8KovG/XFPkgOgswdKs9F29MBWjR2nexB6wGRNRFRp1ACSezDe07LfHMf3PcVMoz+3QAivkq2iiooIRC7vYNx3+C85CdPxXctBumkMabsSHQ3t2DfNJ/HNwNluPCJKDgZVDqtdH4OcHtgCJvfq9w4cbeCc1BBYDQ8
x-ms-office365-filtering-correlation-id: 33055d4f-b442-4369-0b2e-08d6351a5199
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4001;
x-ms-traffictypediagnostic: AM0PR04MB4001:
x-microsoft-antispam-prvs: <AM0PR04MB40017DCCE56D6A7EA7F9FBC180F80@AM0PR04MB4001.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4001;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4001;
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(54534003)(14454004)(6486002)(54906003)(53936002)(26005)(5640700003)(2906002)(102836004)(99286004)(2900100001)(97736004)(105586002)(52116002)(106356001)(76176011)(2501003)(6116002)(386003)(6512007)(5250100002)(3846002)(71200400001)(6436002)(71190400001)(2351001)(6506007)(486006)(11346002)(8936002)(36756003)(476003)(81156014)(8676002)(2616005)(446003)(508600001)(81166006)(25786009)(186003)(68736007)(86362001)(4326008)(305945005)(50226002)(256004)(14444005)(6916009)(316002)(6346003)(66066001)(7736002)(5660300001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4001;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-message-info: L633+eSFa/VmFxAXNBUbJVqPSCzbD+bH8E7Wo+AQRLZtgXibnhfCYkvr/2ToKw8X3IPDMB6aN5MbjdDSDrQZecfHtYHF2O1pcAwCwBVo3C8iywvSL8gICybKpCtctR7U4tgirWwaqsNnT9akeebA1YKBt/O4WITR6xIf2V9byHVXuPZoJ+Lmex9tiKJq269MA/eTIPtsF/5TeKzsfq1EnxlXnpmRlqjPySshp8OAUgJdiTQtbYsCKNs3CiyWeOLhq64/y7pIwpC/F068CRVks+9wl4Da5PbpYI00iPI5mKxFN3KqPlXgk5XGctPAAURV9KC3CGo/Q/bzyPGvFCDRHvUBnzFmJcXaQrKS/iIOVUU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33055d4f-b442-4369-0b2e-08d6351a5199
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 16:54:07.6922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4001
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add scu based clock mux.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v4->v5:
 * use union to avoid struct cast for IPC read msg
 * remove unnecessary debug messages
 * move scu clk files into imx top directory
v3->v4:
 * scu headfile path update
v2->v3:
 * structure name and api usage update
v1->v2:
 * move SCU clock API implementation into driver
---
 drivers/clk/imx/Makefile      |   3 +-
 drivers/clk/imx/clk-mux-scu.c | 123 ++++++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-scu.h     |  13 +++++
 3 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-mux-scu.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 4564175..5f1cece 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -18,7 +18,8 @@ obj-$(CONFIG_MXC_CLK_SCU) +=3D \
 	clk-divider-scu.o \
 	clk-divider-gpr-scu.o \
 	clk-gate-scu.o \
-	clk-gate-gpr-scu.o
+	clk-gate-gpr-scu.o \
+	clk-mux-scu.o
=20
 obj-$(CONFIG_SOC_IMX1)   +=3D clk-imx1.o
 obj-$(CONFIG_SOC_IMX21)  +=3D clk-imx21.o
diff --git a/drivers/clk/imx/clk-mux-scu.c b/drivers/clk/imx/clk-mux-scu.c
new file mode 100644
index 0000000..8addff1
--- /dev/null
+++ b/drivers/clk/imx/clk-mux-scu.c
@@ -0,0 +1,123 @@
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
+struct clk_mux_scu {
+	struct clk_hw hw;
+	u32 rsrc_id;
+	u8 clk_type;
+};
+
+#define to_clk_mux_scu(_hw) container_of(_hw, struct clk_mux_scu, hw)
+
+/* SCU Clock Protocol definitions */
+struct imx_sc_msg_req_set_clock_parent {
+	struct imx_sc_rpc_msg hdr;
+	u16 resource;
+	u8 clk;
+	u8 parent;
+} __packed;
+
+struct req_get_clock_parent {
+	u16 resource;
+	u8 clk;
+} __packed;
+
+struct resp_get_clock_parent {
+	u8 parent;
+};
+
+struct imx_sc_msg_get_clock_parent {
+	struct imx_sc_rpc_msg hdr;
+	union {
+		struct req_get_clock_parent req;
+		struct resp_get_clock_parent resp;
+	} data;
+} __packed;
+
+static u8 clk_mux_scu_get_parent(struct clk_hw *hw)
+{
+	struct clk_mux_scu *mux =3D to_clk_mux_scu(hw);
+	struct imx_sc_msg_get_clock_parent msg;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+	int ret;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D IMX_SC_RPC_SVC_PM;
+	hdr->func =3D IMX_SC_PM_FUNC_GET_CLOCK_PARENT;
+	hdr->size =3D 2;
+
+	msg.data.req.resource =3D mux->rsrc_id;
+	msg.data.req.clk =3D mux->clk_type;
+
+	ret =3D imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret)
+		return ret;
+
+	return msg.data.resp.parent;
+}
+
+static int clk_mux_scu_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_mux_scu *mux =3D to_clk_mux_scu(hw);
+	struct imx_sc_msg_req_set_clock_parent msg;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D IMX_SC_RPC_SVC_PM;
+	hdr->func =3D IMX_SC_PM_FUNC_SET_CLOCK_PARENT;
+	hdr->size =3D 2;
+
+	msg.resource =3D mux->rsrc_id;
+	msg.clk =3D mux->clk_type;
+	msg.parent =3D index;
+
+	return imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+}
+
+static const struct clk_ops clk_mux_scu_ops =3D {
+	.get_parent =3D clk_mux_scu_get_parent,
+	.set_parent =3D clk_mux_scu_set_parent,
+};
+
+struct clk_hw *clk_register_mux_scu(const char *name, const char * const *=
parents,
+				    int num_parents, unsigned long flags,
+				    u32 rsrc_id, u8 clk_type)
+{
+	struct clk_init_data init;
+	struct clk_mux_scu *mux;
+	struct clk_hw *hw;
+	int ret;
+
+	mux =3D kzalloc(sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return ERR_PTR(-ENOMEM);
+
+	init.name =3D name;
+	init.ops =3D &clk_mux_scu_ops;
+	init.parent_names =3D parents;
+	init.num_parents =3D num_parents;
+
+	mux->hw.init =3D &init;
+	mux->rsrc_id =3D rsrc_id;
+	mux->clk_type =3D clk_type;
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
index 673b280..2a5a45e 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -68,4 +68,17 @@ static inline struct clk_hw *imx_clk_gate_gpr_scu(const =
char *name, const char *
 	return clk_register_gate_gpr_scu(name, parent, rsrc_id, gpr_id, invert_fl=
ag);
 }
=20
+struct clk_hw *clk_register_mux_scu(const char *name, const char * const *=
parents,
+			int num_parents, unsigned long flags,
+			u32 rsrc_id, u8 clk_type);
+
+static inline struct clk_hw *imx_clk_mux_scu(const char *name,
+			const char * const *parents, int num_parents,
+			u32 rsrc_id, u8 clk_type)
+{
+	return clk_register_mux_scu(name, parents, num_parents,
+			CLK_SET_RATE_NO_REPARENT, rsrc_id,
+			clk_type);
+}
+
 #endif
--=20
2.7.4


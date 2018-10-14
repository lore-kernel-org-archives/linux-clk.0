Return-Path: <SRS0=5HZW=M2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D594C6787C
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0994920835
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="xiWgBUuc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0994920835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbeJNPsh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Oct 2018 11:48:37 -0400
Received: from mail-eopbgr00067.outbound.protection.outlook.com ([40.107.0.67]:15923
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726115AbeJNPsh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Oct 2018 11:48:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAZU4B2h4h+a8ubBv6wtJp7PnIolN3AdYJ7PHr66TEg=;
 b=xiWgBUuc/9wUI55GK64vOvO44iUE85psmZihUWwsbrzZI1w5l2+zv3LH5PGk8ib/PCo+bYhCsfYUA046g4EkZzYsAe7IJi4IqUnGWCPoz9zg35AHBdH62onKuAnt1+yzuvEDEv26uDlnCwPXUXqe89T8hjdcAlrFA3VtefXTkps=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4435.eurprd04.prod.outlook.com (52.135.148.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.26; Sun, 14 Oct 2018 08:08:03 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.027; Sun, 14 Oct 2018
 08:08:03 +0000
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
Subject: [PATCH V4 07/11] clk: imx: scu: add scu clock mux
Thread-Topic: [PATCH V4 07/11] clk: imx: scu: add scu clock mux
Thread-Index: AQHUY5UHlC5qDxfH/0yOf6Mjgsy7YA==
Date:   Sun, 14 Oct 2018 08:08:02 +0000
Message-ID: <1539504194-28289-8-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4435;6:tIyWyiJUGulo73WDF2KB0xXrbn782BPyAypte8XIi+zVVR1jhQrKkCKeilwxuoXc8O5OSQd1ir6goL0vNwcB2Fa5wL1bNoUcpgkv5U8zJCv4eYojFVODmf17zuFwMm5rvXpIOogDvK8+VZVXJiCLNi2vZbJBYFDt10EeW2WsEz8vTsYxEZtsHSglynR/BOVM7leDcUZ4/UethMR3PBIVAJSCcm6WjW50UP0bUdxR+uPonDOOJ9pFyMzWWGGu8nKtwwYzhFTq0eet7OKwt/Z4PrHziTDePz9A/lrC5QCtDTwF2BF0qtjaWz+1N0svQi6waaMWC2xoZsgjhoAu55ko++7UvGv8n/xxQcHCnubQvEGL1mSFBRt3M0dLmU2uycXBxDWg/uOHmaQMfySjnbOOg8Q8HolQrk814zO3ZgpqcyAMQmUVi7L0sjgEYw2z6nSpe5GgpRRQLoCL3dFjHuePuA==;5:Lf710Ac3f7vMpz7/YqxTIE6PcpmmBt83jEPDgOhuPpqK6U7wMDSU46egWl8XTp/wLIkEgh4F9uIhF/ZQXQ+lEganG0chtbyBEriMYBQYLEgssvsEq9qYUE9gm/uGjUqM1wzXGqnZ+jHbQbZoccPTRnaG4+7vdJx5ttsuuXd2UdQ=;7:NJNzQgqY0cstBifuxIo4hznjgGrdjh0tKvaUPO9wEZYoG9W0gWi+1BT4Ig/zewDyhO6lx00WqpUhUp+YI1j+yXnSRPs6GvXsBvph5Auc8TJ2d2yxZ/Birx1T33VdcCBdTCXGE5x3wlYNfnWwCPRmvWV2uPMwYxigJZlqjSJDlkdbH1KQerVEas4ZNc5Ir6nyJWbSjEbkaKsfACSdRTzCnFzcy++Mhhl18+xxt7LCXT5/OVbfK62vfN3y0oWaf5U/
x-ms-office365-filtering-correlation-id: 6ff1077f-ff32-4032-86aa-08d631ac29df
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4435;
x-ms-traffictypediagnostic: AM0PR04MB4435:
x-microsoft-antispam-prvs: <AM0PR04MB4435474B18D235BAE6E7754E80FC0@AM0PR04MB4435.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991067);SRVR:AM0PR04MB4435;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4435;
x-forefront-prvs: 08252193F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(396003)(39850400004)(366004)(54534003)(199004)(189003)(6436002)(186003)(76176011)(5640700003)(386003)(6506007)(316002)(36756003)(52116002)(2351001)(99286004)(6512007)(106356001)(6486002)(446003)(26005)(8936002)(11346002)(86362001)(476003)(2616005)(8676002)(5660300001)(102836004)(486006)(81166006)(81156014)(6916009)(4326008)(54906003)(2906002)(66066001)(14444005)(71190400001)(71200400001)(256004)(305945005)(5250100002)(25786009)(2900100001)(97736004)(7736002)(50226002)(68736007)(478600001)(105586002)(3846002)(6116002)(53936002)(2501003)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4435;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: pN/ZFTO6uGi2uuQ5fX40vt1/p1OZ3CyeaYTD/jyQhqfjRkno1l2rrB0PftPUJMjHepm4yZC/3pNK7ZShiSRPLZiZLQ7R6opIVvrfBf6ymGzS6M8IIyH+q2YhNoA/lVRJOQnJ5TrgOwmdgp9dnpY+Z/yVt04uXB5xofCXbXY2HlbKkpK6zN3IHN2htTk5m/6neL5DlE8jq8fkLx2WyoteHL8mrNCruQJEC87X1rkO7gSA5ijmDKIjvvIIaa1BYQuM0vKHK8Q0Z7vHTaQcvWBYLJ4wXVsyTFtC8Qmxnie/PxDyl07ySEHo/53Ml6hCbGuXmZTs3guLd8lSYdD/JhxONLlNMrNGm7KvrOolhKPhwwA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff1077f-ff32-4032-86aa-08d631ac29df
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2018 08:08:02.9376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4435
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
v3->v4:
 * scu headfile path update
v2->v3:
 * structure name and api usage update
v1->v2:
 * move SCU clock API implementation into driver
---
 drivers/clk/imx/scu/Makefile      |   3 +-
 drivers/clk/imx/scu/clk-mux-scu.c | 130 ++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/scu/clk-scu.h     |  13 ++++
 3 files changed, 145 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-mux-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index 25d3511..aee56bf 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_MXC_CLK_SCU) +=3D \
 	clk-divider-scu.o \
 	clk-divider-gpr-scu.o \
 	clk-gate-scu.o \
-	clk-gate-gpr-scu.o
+	clk-gate-gpr-scu.o \
+	clk-mux-scu.o
diff --git a/drivers/clk/imx/scu/clk-mux-scu.c b/drivers/clk/imx/scu/clk-mu=
x-scu.c
new file mode 100644
index 0000000..fdef58d
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-mux-scu.c
@@ -0,0 +1,130 @@
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
+
+/* SCU Clock Protocol definitions */
+struct imx_sc_msg_req_set_clock_parent {
+	struct imx_sc_rpc_msg hdr;
+	u16 resource;
+	u8 clk;
+	u8 parent;
+} __packed;
+
+struct imx_sc_msg_req_get_clock_parent {
+	struct imx_sc_rpc_msg hdr;
+	u16 resource;
+	u8 clk;
+} __packed;
+
+struct imx_sc_msg_resp_get_clock_parent {
+	struct imx_sc_rpc_msg hdr;
+	u8 parent;
+} __packed;
+
+static u8 clk_mux_scu_get_parent(struct clk_hw *hw)
+{
+	struct clk_mux_scu *mux =3D to_clk_mux_scu(hw);
+	struct imx_sc_msg_req_get_clock_parent msg;
+	struct imx_sc_msg_resp_get_clock_parent *resp;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+	int ret;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D (uint8_t)IMX_SC_RPC_SVC_PM;
+	hdr->func =3D (uint8_t)IMX_SC_PM_FUNC_GET_CLOCK_PARENT;
+	hdr->size =3D 2;
+
+	msg.resource =3D mux->rsrc_id;
+	msg.clk =3D mux->clk_type;
+
+	ret =3D imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret) {
+		pr_err("%s: failed to get clock parent %d\n",
+			clk_hw_get_name(hw), ret);
+		return ret;
+	}
+
+	resp =3D (struct imx_sc_msg_resp_get_clock_parent *)&msg;
+
+	return resp->parent;
+}
+
+static int clk_mux_scu_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_mux_scu *mux =3D to_clk_mux_scu(hw);
+	struct imx_sc_msg_req_set_clock_parent msg;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+	int ret;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D (uint8_t)IMX_SC_RPC_SVC_PM;
+	hdr->func =3D (uint8_t)IMX_SC_PM_FUNC_SET_CLOCK_PARENT;
+	hdr->size =3D 2;
+
+	msg.resource =3D mux->rsrc_id;
+	msg.clk =3D mux->clk_type;
+	msg.parent =3D index;
+
+	ret =3D imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret)
+		pr_err("%s: failed to set clock parent %d : ret %d\n",
+			clk_hw_get_name(hw), index, ret);
+
+	return 0;
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
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index 56338ca..b2b56d3 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
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


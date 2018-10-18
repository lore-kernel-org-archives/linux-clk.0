Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31861C5ACCC
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:54:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1C142086E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:54:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="L/Q/brVc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1C142086E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbeJSAz5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 20:55:57 -0400
Received: from mail-eopbgr20040.outbound.protection.outlook.com ([40.107.2.40]:56870
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728474AbeJSAz5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 20:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lEdZeud7iVVi/mk2hMNHIq155h1mQEtb+3ylRsceRk=;
 b=L/Q/brVcwelcf23x05icWzkG79/88dvnobX/g2ObrNQb8kPp2ulwJuchSfDJa+GcB0/eqZtE+iKsTYLkuNKwc55Apq5I+XKd/PPyd1w7lksl1LheBOGQmSALFU9fUzMsvspvp1gjQ5GCFWi2zJud6G7cU/lwj6mhdcohRWXWLks=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4001.eurprd04.prod.outlook.com (52.134.90.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Thu, 18 Oct 2018 16:54:04 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.033; Thu, 18 Oct 2018
 16:54:04 +0000
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
Subject: [PATCH V5 6/9] clk: imx: scu: add scu clock gpr gate
Thread-Topic: [PATCH V5 6/9] clk: imx: scu: add scu clock gpr gate
Thread-Index: AQHUZwMtMo8DYlWB6kSiRSHaPsWO5A==
Date:   Thu, 18 Oct 2018 16:54:04 +0000
Message-ID: <1539881347-20871-7-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4001;6:W/1LBzAdIdd6qd3pEPrclcQcXTDb4R48qxOlJ8J/5RpZ2OR3gZZlEkHtC1HDTR0+pvomM3EbqCYNsrjan/TNgwiDG0ndesN40LtHCVpLYWS9nZllIu0SrNxpvkpn9fum6h6KMpaL7TqZdtzsnlm18/uGdbFBfDM4ClHblkQNgs2m5tmkRP6J2EVYeuk4TZ5wQRSyxSNq6bUfXALBek8Fayn9z43WuT8Yq+ppu7OecklQQpyi64A5EsUua8lRKQTKaO+xmJgIHVTQ9Foa20Ee40fc7IJ3zZXaqmocyxCtIJz72zQIdFPHr5tbzfYoLrFjtc4w6h1FAQ/vu63xIbIvS2vjQzDEK334S4X5DoPQCkVcn9CwLu5IDb8KG9nAA/SPXMMi/1dlh83K5ky8fc7DqGIH9Fsd2P12nwBS6o15JbHuD28+ku/Raalerylt3Xe8rKS+fgwUS8/xi8hKs9aYWA==;5:PChT5FMhDo0bJUxpYWcZvh5r+DQ9mA8qHOWHx8djTiOi/LGJmfYy82RDkJR4MM5RvgMUqxJQPcJo8+9CJ/xlZySMGkOLlA5W9++UBsRo1VK+H2TYRXWnuh8QxGwWVWJXyJwZ2VsvtSrUdrvlQcNm10TPEITgXb7U2mdeCyUBBpU=;7:jaxsyjJPU8oa8erG9VTrkejlTAFD87//EkS2ovpgMU/UtoSybB/Et/oP0QIq7siqq5Oy/jbGTn2kX6UCb45bVMnlYUolRZqbY1hBLyIUq+U9J0d22Ovp0Vwa7oRiviYc3YaejW+26vqGz7uDT7Cblzhwo4ZAHN2A1LxbKd6duQZd/GqLVcIN2axKhLAaAUQDLNceGKrjz6lC9P4O1o1OrYYvT4nzhvSTkgYZtYXng3Ap6QfFArV7joU1h6OL1Vrj
x-ms-office365-filtering-correlation-id: b2bdce96-9cf6-4778-6672-08d6351a4f6b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4001;
x-ms-traffictypediagnostic: AM0PR04MB4001:
x-microsoft-antispam-prvs: <AM0PR04MB40014CA61B7831A640F038D980F80@AM0PR04MB4001.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4001;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4001;
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(54534003)(14454004)(6486002)(54906003)(53936002)(26005)(5640700003)(2906002)(102836004)(99286004)(2900100001)(97736004)(105586002)(52116002)(106356001)(76176011)(2501003)(6116002)(386003)(6512007)(5250100002)(3846002)(71200400001)(6436002)(71190400001)(2351001)(6506007)(486006)(11346002)(8936002)(36756003)(476003)(81156014)(8676002)(2616005)(446003)(508600001)(81166006)(25786009)(186003)(68736007)(86362001)(4326008)(305945005)(50226002)(256004)(14444005)(6916009)(316002)(6346003)(66066001)(7736002)(5660300001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4001;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-message-info: P5v+t72LdEFZOj3Lb7iDDjeqoO2aXhhJ6W2lCmzHmBMYNs6Fq59oVTpsdtozLcckpseFrUOSM5wjEker5X/TwTte/a/ghxXV3q5VtilYPJI1Ve55dmiL54B4wuHfP2tEgaou/LVoHDy9MXgbRyIrr28kgZw90iBprnGbVRkvsb2VAgjs0fd4WnpxV4YNOeZNsiF/KFTSjQgm/mPruG5TlvXRzJURDBEqBspvLWyvxExjPbbtv+tlmt5oUfpe4Ln/0CnpwFm+NNTltdIhw7jkqMOZcTfXlBPL0MFxGJYZhCItBung1csaFQTHZyeaA9Rp+NH4ib1Ca07thayjp/09bITYoAJ1uCMvWoc2p31cxlg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2bdce96-9cf6-4778-6672-08d6351a4f6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 16:54:04.0846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4001
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
v4->v5:
 * move scu clk files into imx top directory
v3->v4:
 * scu headfile path update
v2->v3:
 * structure name and api usage update
v1->v2:
 * no changes except update headfile name
---
 drivers/clk/imx/Makefile           |  3 +-
 drivers/clk/imx/clk-gate-gpr-scu.c | 87 ++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-scu.h          |  9 ++++
 3 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-gate-gpr-scu.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index e311e28..4564175 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -17,7 +17,8 @@ obj-$(CONFIG_MXC_CLK_SCU) +=3D \
 	clk-scu.o \
 	clk-divider-scu.o \
 	clk-divider-gpr-scu.o \
-	clk-gate-scu.o
+	clk-gate-scu.o \
+	clk-gate-gpr-scu.o
=20
 obj-$(CONFIG_SOC_IMX1)   +=3D clk-imx1.o
 obj-$(CONFIG_SOC_IMX21)  +=3D clk-imx21.o
diff --git a/drivers/clk/imx/clk-gate-gpr-scu.c b/drivers/clk/imx/clk-gate-=
gpr-scu.c
new file mode 100644
index 0000000..4a8f6d3
--- /dev/null
+++ b/drivers/clk/imx/clk-gate-gpr-scu.c
@@ -0,0 +1,87 @@
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
+struct clk_gate_gpr_scu {
+	struct clk_hw hw;
+	u32 rsrc_id;
+	u8 gpr_id;
+
+	/* default: enable 1 disable 0 */
+	bool invert;
+};
+
+#define to_clk_gate_gpr_scu(_hw) container_of(_hw, struct clk_gate_gpr_scu=
, hw)
+
+static int clk_gate_gpr_scu_enable(struct clk_hw *hw)
+{
+	struct clk_gate_gpr_scu *gate =3D to_clk_gate_gpr_scu(hw);
+	int ret;
+
+	ret =3D imx_sc_misc_set_control(ccm_ipc_handle, gate->rsrc_id,
+				      gate->gpr_id, !gate->invert);
+	if (ret)
+		pr_err("%s: clk enable failed %d\n", clk_hw_get_name(hw), ret);
+
+	return ret;
+}
+
+static void clk_gate_gpr_scu_disable(struct clk_hw *hw)
+{
+	struct clk_gate_gpr_scu *gate =3D to_clk_gate_gpr_scu(hw);
+	int ret;
+
+	ret  =3D imx_sc_misc_set_control(ccm_ipc_handle, gate->rsrc_id,
+				       gate->gpr_id, gate->invert);
+	if (ret)
+		pr_err("%s: clk disable failed %d\n", clk_hw_get_name(hw), ret);
+}
+
+static const struct clk_ops clk_gate_gpr_scu_ops =3D {
+	.enable =3D clk_gate_gpr_scu_enable,
+	.disable =3D clk_gate_gpr_scu_disable,
+};
+
+struct clk_hw *clk_register_gate_gpr_scu(const char *name, const char *par=
ent_name,
+					 u32 rsrc_id, u8 gpr_id,
+					 bool invert_flag)
+{
+	struct clk_gate_gpr_scu *gate;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	gate->rsrc_id =3D rsrc_id;
+	gate->gpr_id =3D gpr_id;
+	gate->invert =3D invert_flag;
+
+	init.name =3D name;
+	init.ops =3D &clk_gate_gpr_scu_ops;
+	init.parent_names =3D parent_name ? &parent_name : NULL;
+	init.num_parents =3D parent_name ? 1 : 0;
+
+	gate->hw.init =3D &init;
+
+	hw =3D &gate->hw;
+	ret =3D clk_hw_register(NULL, hw);
+	if (ret) {
+		kfree(gate);
+		hw =3D ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index 3885884..673b280 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -59,4 +59,13 @@ static inline struct clk_hw *imx_clk_gate2_scu(const cha=
r *name, const char *par
 	return clk_register_gate2_scu(name, parent, 0, reg, bit_idx, hw_gate);
 }
=20
+struct clk_hw *clk_register_gate_gpr_scu(const char *name, const char *par=
ent_name,
+				u32 rsrc_id, u8 gpr_id, bool invert_flag);
+
+static inline struct clk_hw *imx_clk_gate_gpr_scu(const char *name, const =
char *parent,
+				u32 rsrc_id, u8 gpr_id, bool invert_flag)
+{
+	return clk_register_gate_gpr_scu(name, parent, rsrc_id, gpr_id, invert_fl=
ag);
+}
+
 #endif
--=20
2.7.4


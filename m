Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1269DC43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 14:12:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C46C82147D
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 14:12:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="TOg7Sy9I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C46C82147D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729534AbeKVArY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 19:47:24 -0500
Received: from mail-eopbgr00078.outbound.protection.outlook.com ([40.107.0.78]:60000
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729080AbeKVArY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Nov 2018 19:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWnkiCS4NY31t4GjVc98V2E6AXLoFLKzSPDji0bBY7M=;
 b=TOg7Sy9IXytUvHxc/7nQ2ETUa8AUH/5Z8IRRxIeCTWqy/MxVxBKL5lliUfZl158cwN+87Huc6H37KzYP0lZaxALzNgYeZMdltSk5D2IGuS3GxaWZ2V3vGpCNDF9Lj2CZQUfqnbqjA4hfK4jEPJKA2DZW27nkdjK9O5YRKvJfH2I=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5076.eurprd04.prod.outlook.com (20.177.40.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1339.23; Wed, 21 Nov 2018 14:12:38 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1339.027; Wed, 21 Nov 2018
 14:12:38 +0000
From:   Aisheng DONG <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng DONG <aisheng.dong@nxp.com>
Subject: [PATCH V8 6/7] clk: imx: add lpcg clock support
Thread-Topic: [PATCH V8 6/7] clk: imx: add lpcg clock support
Thread-Index: AQHUgaRCQQJmVj/lpEGe6LAmNSfItg==
Date:   Wed, 21 Nov 2018 14:12:38 +0000
Message-ID: <1542809234-539-7-git-send-email-aisheng.dong@nxp.com>
References: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1542809234-539-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5076;6:jd9EcLuXZw34vGnReVtQ2K3qN1+znqSoFCGEKqE12+EfKuf5fz4odvc9uDuS/sU9tyHvDRQVum1evGrr+fmXTTZAwNLBTOjKvO/iVItrUYYF43ax4qDvqGBWbVYZOvS8lrbuiRWU7OrnCbYf2wi5M6LQz/qq2kE549NGD/B6EoBA+9C6vjWcKCYlFopJV8Lm3+yvE0VkBJ/Zu24Ua9WBRJLY8gQ/X8Ex1z/2C9ZlLSCD6ynVTFthiPzFTW+rcYEAOlD85PD3sowI3bm/mV4L1hjJSrUyQX3A74M63SuX4NcMlouAph1EMK823tJ6ILsLVKef9yrGcfJahO70gj7Jk1LiTp3dEbeI+CG9d+SWrORadKFh/CgV19e+ft7ALBXrAG1z3hAUTRYd2WY+T4Bo5G0vQUDDoVsx8aNI0BFWA3IRzHTf6050Q/hAM6OhciuIVlfQRp49aIIkuouqx2Z9/w==;5:tASVOkbIpp+Ja74P4nv7HBym8osta4DfBX+Mj+i+PRnlCSLuDbFTMQN2t8cSJwJu/aPCe1MOaln6ktYREUfEVkHGj6FQ2XUNJqJNmYRP3kGuC0QdEmDr103PqxWxmpN/en9k6ITJXmdD4kQePDjmit+zYGm2bB0acExz69WZeHg=;7:1RkFYSGjXsurC3aYHwRNqrq2+EC07kwYbRKVqj7E2fl2BJsl4ki64uiPnRxsEon4FDpFZvetnB+rVADFRBr+fg+r7scUxD4e03gluWJSk9n4w3cjlWPPK6fxmCOxw62KF8duS1HSyTr0jdZi7txFGA==
x-ms-office365-filtering-correlation-id: 28e207b8-4da3-43c8-7990-08d64fbb6465
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5076;
x-ms-traffictypediagnostic: AM0PR04MB5076:
x-microsoft-antispam-prvs: <AM0PR04MB5076F5EF5210FCE833B7A79F80DA0@AM0PR04MB5076.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231442)(944501410)(52105112)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5076;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5076;
x-forefront-prvs: 08635C03D4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(136003)(366004)(376002)(396003)(346002)(54534003)(199004)(189003)(76176011)(6916009)(52116002)(2906002)(6506007)(316002)(386003)(99286004)(8936002)(486006)(6486002)(186003)(26005)(11346002)(575784001)(6436002)(2501003)(86362001)(2616005)(5660300001)(50226002)(102836004)(71190400001)(71200400001)(446003)(5640700003)(4326008)(476003)(106356001)(478600001)(305945005)(6116002)(3846002)(25786009)(105586002)(36756003)(14454004)(81166006)(2351001)(2900100001)(54906003)(81156014)(7736002)(68736007)(97736004)(66066001)(8676002)(256004)(14444005)(53936002)(6512007);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5076;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: wuEqv142Vn/3vqxu5urjcklQErBkv2tdTzpkowGFYlmxOnwTbdA80s2S67YFI7cqFTjsC96zp1m6u0bJNeTvrwsjIsEtH9T3XHCeepKiXrsycI1hgNMGhMa8bxAoW+g3mx8FPvjU8tbQSCiAMp45SylxlpguxVNHS3ybrQrMpEzfvvdPyv/E1oYBHlGapehd25HALhCczdjYI5rueE+B27x9hH+b6JwyQTynN4SHbsZ65YVbx4IGP73tHYbJTAZuh0hEjMCeaExkyUQ/QMc720lKsY1VZIltwsbVpG9AEWalIFw1J4L9zJ/levwlaZHg+IfRQBGWS5FPq3mZOKBL5sOAnRaElhy0AtFP7bFBRUc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e207b8-4da3-43c8-7990-08d64fbb6465
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2018 14:12:38.4791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5076
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Low-Power Clock Gate (LPCG) modules contain a local programming
model to control the clock gates for the peripherals. An LPCG module
is used to locally gate the clocks for the associated peripheral.
And they're bedind the SCU clock.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
 v7->v8:
 * add doc for struct clk_lpcg_scu
 * remove unneccessary reg checking
 v6: separate from [PATCH V5 5/9] clk: imx: scu: add scu clock gate
---
 drivers/clk/imx/Makefile       |   3 +-
 drivers/clk/imx/clk-lpcg-scu.c | 113 +++++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-scu.h      |   3 ++
 3 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-lpcg-scu.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 8369a34..cd2b6f0 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -14,7 +14,8 @@ obj-$(CONFIG_MXC_CLK) +=3D \
 	clk-pfd.o
=20
 obj-$(CONFIG_MXC_CLK_SCU) +=3D \
-	clk-scu.o
+	clk-scu.o \
+	clk-lpcg-scu.o
=20
 obj-$(CONFIG_SOC_IMX1)   +=3D clk-imx1.o
 obj-$(CONFIG_SOC_IMX21)  +=3D clk-imx21.o
diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-scu.=
c
new file mode 100644
index 0000000..15b7d94
--- /dev/null
+++ b/drivers/clk/imx/clk-lpcg-scu.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2018 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+static DEFINE_SPINLOCK(imx_lpcg_scu_lock);
+
+#define CLK_GATE_SCU_LPCG_MASK		0x3
+#define CLK_GATE_SCU_LPCG_HW_SEL	BIT(0)
+#define CLK_GATE_SCU_LPCG_SW_SEL	BIT(1)
+
+/*
+ * struct clk_lpcg_scu - Description of LPCG clock
+ *
+ * @hw: clk_hw of this LPCG
+ * @reg: register of this LPCG clock
+ * @bit_idx: bit index of this LPCG clock
+ * @hw_gate: HW auto gate enable
+ *
+ * This structure describes one LPCG clock
+ */
+struct clk_lpcg_scu {
+	struct clk_hw hw;
+	void __iomem *reg;
+	u8 bit_idx;
+	bool hw_gate;
+};
+
+#define to_clk_lpcg_scu(_hw) container_of(_hw, struct clk_lpcg_scu, hw)
+
+static int clk_lpcg_scu_enable(struct clk_hw *hw)
+{
+	struct clk_lpcg_scu *clk =3D to_clk_lpcg_scu(hw);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&imx_lpcg_scu_lock, flags);
+
+	reg =3D readl(clk->reg);
+	reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << clk->bit_idx);
+	if (clk->hw_gate)
+		reg |=3D (CLK_GATE_SCU_LPCG_HW_SEL |
+			CLK_GATE_SCU_LPCG_SW_SEL) << clk->bit_idx;
+	else
+		reg |=3D (CLK_GATE_SCU_LPCG_SW_SEL << clk->bit_idx);
+	writel(reg, clk->reg);
+
+	spin_unlock_irqrestore(&imx_lpcg_scu_lock, flags);
+
+	return 0;
+}
+
+static void clk_lpcg_scu_disable(struct clk_hw *hw)
+{
+	struct clk_lpcg_scu *clk =3D to_clk_lpcg_scu(hw);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&imx_lpcg_scu_lock, flags);
+
+	reg =3D readl(clk->reg);
+	reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << clk->bit_idx);
+	writel(reg, clk->reg);
+
+	spin_unlock_irqrestore(&imx_lpcg_scu_lock, flags);
+}
+
+static const struct clk_ops clk_lpcg_scu_ops =3D {
+	.enable =3D clk_lpcg_scu_enable,
+	.disable =3D clk_lpcg_scu_disable,
+};
+
+struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
+				unsigned long flags, void __iomem *reg,
+				u8 bit_idx, bool hw_gate)
+{
+	struct clk_lpcg_scu *clk;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	clk =3D kzalloc(sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	clk->reg =3D reg;
+	clk->bit_idx =3D bit_idx;
+	clk->hw_gate =3D hw_gate;
+
+	init.name =3D name;
+	init.ops =3D &clk_lpcg_scu_ops;
+	init.flags =3D CLK_SET_RATE_PARENT | flags;
+	init.parent_names =3D parent_name ? &parent_name : NULL;
+	init.num_parents =3D parent_name ? 1 : 0;
+
+	clk->hw.init =3D &init;
+
+	hw =3D &clk->hw;
+	ret =3D clk_hw_register(NULL, hw);
+	if (ret) {
+		kfree(clk);
+		hw =3D ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index 09f381b..b8e91b1 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -18,4 +18,7 @@ static inline int imx_clk_scu_init(void)
=20
 struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id, u8 clk_type);
=20
+struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
+				unsigned long flags, void __iomem *reg,
+				u8 bit_idx, bool hw_gate);
 #endif
--=20
2.7.4


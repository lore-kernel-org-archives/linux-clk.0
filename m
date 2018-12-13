Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A689CC67872
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 01:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6192E20811
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 01:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="RJ4Bv7np"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6192E20811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbeLMBIR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Dec 2018 20:08:17 -0500
Received: from mail-eopbgr10087.outbound.protection.outlook.com ([40.107.1.87]:38154
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726389AbeLMBIQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Dec 2018 20:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrPsZHj2S2ztrG4tcDJ9HC0msI1+R3t33wenWN21dtw=;
 b=RJ4Bv7npxNWHwKHMltv+mIlt4ZhZpwSW6Z0hIYH8b/oJzb9UVtJ2izeNS/+xAI7eJvShr6D1kCCqN/vaM5i1Kgo/62jEHM/dtUWU9oFa8vw4A4xOUeo/5aM4514S77zFBNTKuuV7kJelMt1uOLurXCyuKwDdrO+VILT4DJnLQOc=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4852.eurprd04.prod.outlook.com (20.176.215.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.23; Thu, 13 Dec 2018 01:08:10 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Thu, 13 Dec 2018
 01:08:10 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH V11 6/7] clk: imx: add lpcg clock support
Thread-Topic: [PATCH V11 6/7] clk: imx: add lpcg clock support
Thread-Index: AQHUkoBQL46loDs+9U29C5dtcszbbQ==
Date:   Thu, 13 Dec 2018 01:08:10 +0000
Message-ID: <1544662938-5020-7-git-send-email-aisheng.dong@nxp.com>
References: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1544662938-5020-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To AM0PR04MB4211.eurprd04.prod.outlook.com (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4852;6:YqZCB/g3CsgwbWv/D8480vBVUWiMd9il+T4XYI8wO7xXzyd43Z6+BowGEZKyljGXc8QBhclaN5+A3EFdBCgVsh2+1z09r/efz/VUsRn6dtrpgeoUkRYvwYnnexHVfy8lnnLET0+G0C86BmxTDxxX6zi46qcwPicHEsxeyjn7dLkss+UnoeV7qjVSHp5MQO1y9kFNUf9Q5RjsiyCqzXixgzQd7cl7Xt0xl89Jrr3O13uGA3X+6TfW/fOYlq2tzltoDFuB7jVPIiqNt/GlMda89VyMoH/qEwvXfxLWWEl6mvQIRwCWi24W2HXPQQ8CP5trzL+uLynpDW+OCpCQKHUoDXSOqlE7138ckUNaBVyzpgcG7bCcamLMWv12OL6x5cq9x7yP+BG03UfEf4kiejdeXNvr+nptEkgW3bHga8x0jZfpFAE62WJku1qnNXf0nlEXr5yanD4J5riHw+F20SjqHQ==;5:kGNZr0YEBnB+5dQ9xe/7gkCcK6HU0gchJaxFh9XAxSHmbdk7/lrGbwMBgxFqRWkHCkhXXzqJeUe8rj6jVP4nQNqcg25CMfeFXDF9D+IrnhxLpEa/ROwE/9txzNh/P29JtDvFVTKm+sqS1YZULR4RoXWZ5ZNDdMgZxfVnIzDk1RU=;7:7UMymxS5PPtcL2Nwbt4XRkJMiLQ5MlUOrlr5MA2FSccRPN1lcTU1WKuq57WvBvCUq5y/5wh0N6UHAf4CwjKHNNVC11nSNVYkx7jked/fzf4pHRSQUyokZuRi7kVyCC5uijN0VhfV+S1jIV9nNP0nkA==
x-ms-office365-filtering-correlation-id: 64eafa27-4443-4d0e-d6ad-08d660977291
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4852;
x-ms-traffictypediagnostic: AM0PR04MB4852:
x-microsoft-antispam-prvs: <AM0PR04MB4852C75E27EAFFAD3A2545BA80A00@AM0PR04MB4852.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231475)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4852;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4852;
x-forefront-prvs: 088552DE73
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(136003)(376002)(366004)(346002)(396003)(54534003)(199004)(189003)(53936002)(186003)(2616005)(2501003)(11346002)(71200400001)(44832011)(476003)(5640700003)(6506007)(3846002)(52116002)(71190400001)(66066001)(486006)(7736002)(305945005)(6116002)(575784001)(50226002)(14444005)(6486002)(8936002)(81166006)(14454004)(68736007)(81156014)(6436002)(8676002)(256004)(316002)(36756003)(86362001)(25786009)(54906003)(6512007)(26005)(106356001)(6916009)(76176011)(446003)(478600001)(386003)(2351001)(97736004)(2906002)(102836004)(105586002)(5660300001)(4326008)(99286004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4852;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: U5krQhNObziNyiolMZbJzmAcAFV9XZe4I0Vx/nnx8N4gQo9VtZaSWSRfcuE4m1nG00o/nGwxDZgg8ilTznD9sXeiBB7htoFul27Qo8gzHSPHD6Nz1OXEA+zHaV3Qultbb9+BKWqi72cxqlo8PiZWZ4qObdUONXozqZYIndNjxlXn6tE5pCONQHbvCgsFMT3eyzvKezNDXyvzB6e1nDqBG8oAwLWmzb+j1IO/iXErUyfjXsydhcCAjO0K2VcOrZrYsYvAlEXvH06Q1YJDYRexHEZS21f2xcnQv7vp19ljqQCyhyNy9ooGrT+vZgynv2xZ
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64eafa27-4443-4d0e-d6ad-08d660977291
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2018 01:08:10.0674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4852
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
v9->v10:
 * no changes
v8->v9:
 * use readl_relaxed() as it does not need insert barrier
 * a small code logic improvement suggested by Stephen
v7->v8:
 * add doc for struct clk_lpcg_scu
 * remove unneccessary reg checking
 v6: separate from [PATCH V5 5/9] clk: imx: scu: add scu clock gate
---
 drivers/clk/imx/Makefile       |   3 +-
 drivers/clk/imx/clk-lpcg-scu.c | 114 +++++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-scu.h      |   3 ++
 3 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-lpcg-scu.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 75312fb..4f72163 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -21,7 +21,8 @@ obj-$(CONFIG_MXC_CLK) +=3D \
 	clk-sccg-pll.o
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
index 0000000..fbf3416
--- /dev/null
+++ b/drivers/clk/imx/clk-lpcg-scu.c
@@ -0,0 +1,114 @@
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
+	u32 reg, val;
+
+	spin_lock_irqsave(&imx_lpcg_scu_lock, flags);
+
+	reg =3D readl_relaxed(clk->reg);
+	reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << clk->bit_idx);
+
+	val =3D CLK_GATE_SCU_LPCG_SW_SEL;
+	if (clk->hw_gate)
+		val |=3D CLK_GATE_SCU_LPCG_HW_SEL;
+
+	reg |=3D val << clk->bit_idx;
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
+	reg =3D readl_relaxed(clk->reg);
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
index 309b4de..52c1746 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -12,4 +12,7 @@
 int imx_clk_scu_init(void);
 struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id, u8 clk_type);
=20
+struct clk_hw *imx_clk_lpcg_scu(const char *name, const char *parent_name,
+				unsigned long flags, void __iomem *reg,
+				u8 bit_idx, bool hw_gate);
 #endif
--=20
2.7.4


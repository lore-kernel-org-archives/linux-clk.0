Return-Path: <SRS0=kVDh=NV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7C3C43441
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 15:20:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3951220858
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 15:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="kKl59O9J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3951220858
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbeKKBGG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Nov 2018 20:06:06 -0500
Received: from mail-db5eur01on0042.outbound.protection.outlook.com ([104.47.2.42]:53175
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726270AbeKKBGG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 10 Nov 2018 20:06:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWL3TXgEYDNCgDD7C+hjSoeG2UGr9YgLF6oNWl+YER8=;
 b=kKl59O9J9WY4Uh5ZFPOFmMk6oGzaRReOAd0ytOGAo8FXRbp/nvAc4SKfGXa+F3NQZqBp6aSe8SaxwzCkDLUAuEs67mF2gIrzzuWdOdbn2I89T4scY7fWM7Ar8Rb+AOZ6IYd34lbzNe3TEAPEUQikjeUDDCHmaCQ7DtMtsqZ4G1U=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4067.eurprd04.prod.outlook.com (52.134.125.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Sat, 10 Nov 2018 15:20:04 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10%2]) with mapi id 15.20.1294.039; Sat, 10 Nov 2018
 15:20:04 +0000
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
Subject: [PATCH V6 5/6] clk: imx: add lpcg clock support
Thread-Topic: [PATCH V6 5/6] clk: imx: add lpcg clock support
Thread-Index: AQHUeQjbR4L3PvLGlU66QmxGjWSLrQ==
Date:   Sat, 10 Nov 2018 15:20:04 +0000
Message-ID: <1541862894-8209-6-git-send-email-aisheng.dong@nxp.com>
References: <1541862894-8209-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1541862894-8209-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0024.apcprd03.prod.outlook.com
 (2603:1096:203:2e::36) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4067;6:3h909FQrRdyh1gIHkvB7SWZ+SOK2hKPJ8nizL/3IHLYdmLz6jBmgxEwM6HExd2Lgo+kBWREYJ0mx87TGp2P9Q9sV0n03u11VFSH4RPYl00VF1y29DaSjpodhEWuRYpzjdw4APaFyeIBWa+x9MT1F0xL7se5G6es0pjPGuuXwI2gnmTes6smp8+9oB1qcZV276vb14WFKSW5jJsgveTT5shLDZJCBjzIMMCKJkVL2ExVRQtdumcR/+NkHdt+RCRJcF9q+CB7B0YsIBZOTNY6fWpdCNPsPizcVJSmgtZGhqY5P7+hGbLGj83ukoYUYlcNgx3Kh163d6Ge5bYhKRpQHVsK0Aj9ezNTXxRUL+H4F/CgAW4MSfxUg6Hq90ZA+4aE/dfypff7W/oviDy/Y95H7y/E7MmXz1NxLp7TWrG8kfLd2xstQj0YsBInJTvdJCmadlL4PrWUqxTneI4UJdcAprw==;5:5wCEUhuWN5yMMnD2nPgTOkYz24V2bROyXxK4g2N1CvOMPtgG9AtCtdirDmCO3mqlmeeqgdP4SU+mebQGpQwtTpMDtQ7EA6JHqrh95OBKZg8x6ksCf50WxeS0Nqm4+1yFTdeTrgEc5E0fAHx3bliMfSIrnT08dtBCzeHFaoZsIlM=;7:MmcCL0NZr6MWoHOMrwH/7adjhDCs4T9l4DfHwWdQVC5bws81Shq5YdGPqhH/0oXEZYC2iBHHGPqlGTU2BIP2H2L7zSBQHeVhrg7luhwpoXUdyG580aX9DN542ZjH9pve9+KgEQ/AbgSxMjBsAxUZcw==
x-ms-office365-filtering-correlation-id: 09c065bc-7fc7-4cb4-b0a5-08d6471ffdaa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390040)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4067;
x-ms-traffictypediagnostic: AM0PR04MB4067:
x-microsoft-antispam-prvs: <AM0PR04MB4067F214580CB90A574149DE80C70@AM0PR04MB4067.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4067;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4067;
x-forefront-prvs: 0852EB6797
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(396003)(366004)(39850400004)(136003)(54534003)(189003)(199004)(2501003)(25786009)(50226002)(71190400001)(4326008)(97736004)(2900100001)(14454004)(8676002)(99286004)(76176011)(186003)(8936002)(53936002)(52116002)(5660300001)(102836004)(81156014)(81166006)(68736007)(446003)(386003)(11346002)(26005)(71200400001)(486006)(6512007)(6506007)(66066001)(5640700003)(2616005)(476003)(7736002)(305945005)(86362001)(575784001)(6116002)(6486002)(3846002)(36756003)(6436002)(316002)(54906003)(478600001)(105586002)(106356001)(256004)(6916009)(14444005)(2906002)(2351001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4067;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 3ShBgJbc04Q1GooVHMIxHGLk8rW6NQT8D48+DkNbKnblrGzGLPzTF2JMjgd+RSjxFws2cejn/ll0wq97DEy39PPJLX1QT3QEWrRr6L0sriI8PWN413XIN2JHwoYaspTc0/ncOSFJj8GgO53s8yPZKVWatyM26vLVuK/ERAYwBF/Co51IOvGPfUnVDfoyjN4nHErv3Q//10KIrCwrEXFG6rGIflVk/FyZ/z33Lvb6518+X1FgHuaDD+wJSueB4T+SEPBaiEMZYW6ADbNTStMl2+ZuEUAZD+b+0E+4WR4Tf66Cco+xfzMyMGQoHfO6eDInSPPjelfQzZKeVkoMIs1e+SZyCNtNTBwDrmjEccp9Z3s=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c065bc-7fc7-4cb4-b0a5-08d6471ffdaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2018 15:20:04.7465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4067
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
 v6: separate from [PATCH V5 5/9] clk: imx: scu: add scu clock gate
---
 drivers/clk/imx/Makefile       |   3 +-
 drivers/clk/imx/clk-lpcg-scu.c | 108 +++++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-scu.h      |   3 ++
 3 files changed, 113 insertions(+), 1 deletion(-)
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
index 0000000..54a1cb3
--- /dev/null
+++ b/drivers/clk/imx/clk-lpcg-scu.c
@@ -0,0 +1,108 @@
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
+struct clk_lpcg_scu {
+	struct clk_hw hw;
+	void __iomem *reg;
+	u8 bit_idx;
+	bool hw_gate;
+};
+
+#define to_clk_lpcg_scu(_hw) container_of(_hw, struct clk_lpcg_scu, hw)
+
+/* Write to the LPCG bits. */
+static int clk_lpcg_scu_enable(struct clk_hw *hw)
+{
+	struct clk_lpcg_scu *clk =3D to_clk_lpcg_scu(hw);
+	unsigned long flags =3D 0;
+	u32 reg;
+
+	spin_lock_irqsave(&imx_lpcg_scu_lock, flags);
+
+	if (clk->reg) {
+		reg =3D readl(clk->reg);
+		reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << clk->bit_idx);
+		if (clk->hw_gate)
+			reg |=3D (CLK_GATE_SCU_LPCG_HW_SEL |
+				CLK_GATE_SCU_LPCG_SW_SEL) << clk->bit_idx;
+		else
+			reg |=3D (CLK_GATE_SCU_LPCG_SW_SEL << clk->bit_idx);
+		writel(reg, clk->reg);
+	}
+
+	spin_unlock_irqrestore(&imx_lpcg_scu_lock, flags);
+
+	return 0;
+}
+
+static void clk_lpcg_scu_disable(struct clk_hw *hw)
+{
+	struct clk_lpcg_scu *clk =3D to_clk_lpcg_scu(hw);
+	unsigned long flags =3D 0;
+	u32 reg;
+
+	spin_lock_irqsave(&imx_lpcg_scu_lock, flags);
+
+	if (clk->reg) {
+		reg =3D readl(clk->reg);
+		reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << clk->bit_idx);
+		writel(reg, clk->reg);
+	}
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


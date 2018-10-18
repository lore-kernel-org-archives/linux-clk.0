Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F45ECDE43
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:54:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CBC52086E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:54:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Lex4+Dlg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CBC52086E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbeJSAzz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 20:55:55 -0400
Received: from mail-eopbgr20040.outbound.protection.outlook.com ([40.107.2.40]:56870
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728474AbeJSAzz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 20:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLvpsOVHKSF5l8iLFnW3fUbtsYwDUfBvaEpmvSZuGKA=;
 b=Lex4+DlgwWndAsnuuyM789rrQ+F8QoLrs4mnVjf+G5yJidwPKYT+GostUs8B2vhNAYza+giXkJQXm7Je1Ns5G9ePHlLOffvbPOAuRrj3TgZDH9+prBgACAFHhEXWU4+9ac1xKm3xx9967mGHW/+slPXj+7MQEhLSQXtbSyl7pD4=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4001.eurprd04.prod.outlook.com (52.134.90.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Thu, 18 Oct 2018 16:54:00 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.033; Thu, 18 Oct 2018
 16:54:00 +0000
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
Subject: [PATCH V5 5/9] clk: imx: scu: add scu clock gate
Thread-Topic: [PATCH V5 5/9] clk: imx: scu: add scu clock gate
Thread-Index: AQHUZwMq50a7wiNbiUqAScSYFUSxjA==
Date:   Thu, 18 Oct 2018 16:54:00 +0000
Message-ID: <1539881347-20871-6-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4001;6:65sH2eFoW0oRm2sxZttTvjPQgnC3YGWpltcBT07i1KpFmglxq/X0OGMSX7xNqvnXGUOpg1ka1Uw7C7rq/6sphwy23kOMZVe8JFVNjTQtLLrzWpMa6DJliFYZlj6nGxjKwT/GLpzbx1+WidEZnws0wdkpMMpnkrw4SOr9NVHgr8wJ91zyCQ+2/hrizDkffl9Nn79SsNimRmF3CB68dSNWupg/60b4OyhHtr0HKVygMn3cXlZI1Otp209evJCpWRxbAMZrSsS8MAEy0yAuiqIFv4Ebi5gO8KFERFaagsYRK09/rzDTPDD7saI9XdB6PUfd0TBhwC3/LyYY94JPpiBxZ0gjpWseWoRCaSYhRF5fB1Niy5loLSGStdQL46Y21VVQJuDAQwl/qyB7Hpe72vZsOFDXOJVLj9lcH9I3yRJZFv1/Q/AO75b8X0uLZ5+tWF9eRAjBmtJzFIpWBWN3mWaPrA==;5:97LhZQ78Wj2eV6OhRmWIsCLjCvzxhDnwYE0o8kv0JEEOteUcYPD/LbFxui+xdqKzy7BL56kQ+YJdCwDdbd3O1LtAtq9PRGNRX/q41g+hGap/DY8OLQv8hteqRweFmnGHAK4fCc16SHfzV7aiSf5IaYdj4EC9PyAUKXPh68EqYw0=;7:vRRAvpJ8yCLygfLhUndLwQSA5TkB8LAimpYAvVEq/ZLBJioxEch+hxPNaT+MV9i/crJWZuLIG430Dt9cq4o6N9mmNztYMx21zPHGFHGslxGBrNKH0tEDJarb6IsVLl7zm+4qOtgoczoZvCzfV2za/LWBRPf2htw2kcU9Z//JKL7NYep7X3QC7uRYMBfCEjQCLBw7RgKMpJRGNxd1DNv1LrDNq7ixIR0KN/IGn9iiwk+PNglWJz4AG6M7XyeCN7SZ
x-ms-office365-filtering-correlation-id: edcb7682-8727-4b5b-cc92-08d6351a4d23
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4001;
x-ms-traffictypediagnostic: AM0PR04MB4001:
x-microsoft-antispam-prvs: <AM0PR04MB40018A8414797B274704024A80F80@AM0PR04MB4001.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4001;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4001;
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(54534003)(14454004)(6486002)(54906003)(53936002)(26005)(5640700003)(2906002)(102836004)(99286004)(2900100001)(97736004)(105586002)(52116002)(106356001)(76176011)(2501003)(6116002)(386003)(6512007)(5250100002)(3846002)(71200400001)(6436002)(71190400001)(2351001)(6506007)(486006)(11346002)(8936002)(36756003)(476003)(81156014)(8676002)(2616005)(446003)(508600001)(81166006)(25786009)(186003)(68736007)(86362001)(4326008)(305945005)(50226002)(256004)(14444005)(6916009)(316002)(6346003)(66066001)(7736002)(575784001)(5660300001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4001;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-message-info: at9qjsWLQRypF7liX9Rbxea1SwBCO2hRBxaNwvLQSSuuUi1SSreT5RhhQRnG1e0CsZQ5rZnKcpU5sdY/PmhHCNyax5HUt9avmXOjEx5w+vpXWk52sY88yvRdVm34MXvaUl/W4grA6LndkwQRRzKHCavNrFNS+a9TY2crbP6oC/WQ+Eag/qgCVKC7JGa/x1ulVGz832y9iYjIIDwTa8/cVt0Kzb9P0a+hlWPGnC1Q/nEN6ITGBOJlFM1xUZPT27sTlYbiIUKpP+g0KJzjUui/IZXPN7s40TxAyyafoW8aUaFA2+tptUgj2gsx6CkSB2dAXTBPjmkkGVqmJ0toCwGGxIWwd57AtP5t4LCpbaY6hvQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edcb7682-8727-4b5b-cc92-08d6351a4d23
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 16:54:00.4341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4001
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add scu based clock gate.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v4->v5:
 * add lock for lpcg register write
 * Remove void __iomem * for LPCG physical address, use phys_addr_t instead
 * remove unnecessary debug info
 * remove unnecessary type cast
 * move scu clk files into imx top directory
v3->v4:
 * scu headfile path update
v2->v3:
 * structure names and api usage update
v1->v2:
 * move SCU clock API implementation into driver
---
 drivers/clk/imx/Makefile       |   3 +-
 drivers/clk/imx/clk-gate-scu.c | 228 +++++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-scu.h      |  23 +++++
 3 files changed, 253 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-gate-scu.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 5ffcb71..e311e28 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -16,7 +16,8 @@ obj-$(CONFIG_MXC_CLK) +=3D \
 obj-$(CONFIG_MXC_CLK_SCU) +=3D \
 	clk-scu.o \
 	clk-divider-scu.o \
-	clk-divider-gpr-scu.o
+	clk-divider-gpr-scu.o \
+	clk-gate-scu.o
=20
 obj-$(CONFIG_SOC_IMX1)   +=3D clk-imx1.o
 obj-$(CONFIG_SOC_IMX21)  +=3D clk-imx21.o
diff --git a/drivers/clk/imx/clk-gate-scu.c b/drivers/clk/imx/clk-gate-scu.=
c
new file mode 100644
index 0000000..759212e
--- /dev/null
+++ b/drivers/clk/imx/clk-gate-scu.c
@@ -0,0 +1,228 @@
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
+#include <linux/spinlock.h>
+
+#include "clk-scu.h"
+
+/*
+ * basic gatable clock which can gate and ungate it's output
+ *
+ * Traits of this clock:
+ * prepare - clk_(un)prepare only ensures parent is (un)prepared
+ * enable - clk_enable and clk_disable are functional & control gating
+ * rate - inherits rate from parent.  No clk_set_rate support
+ * parent - fixed parent.  No clk_set_parent support
+ */
+
+#define CLK_GATE_SCU_LPCG_MASK		0x3
+#define CLK_GATE_SCU_LPCG_HW_SEL	BIT(0)
+#define CLK_GATE_SCU_LPCG_SW_SEL	BIT(1)
+
+struct clk_gate_scu {
+	struct clk_hw hw;
+	void __iomem *reg;
+	u8 bit_idx;
+	bool hw_gate;
+	u32 rsrc_id;
+	u8 clk_type;
+};
+
+#define to_clk_gate_scu(_hw) container_of(_hw, struct clk_gate_scu, hw)
+
+/* SCU Clock Protocol definitions */
+struct imx_sc_msg_req_clock_enable {
+	struct imx_sc_rpc_msg hdr;
+	u16	resource;
+	u8	clk;
+	u8	enable;
+	u8	autog;
+} __packed;
+
+/* Write to the LPCG bits. */
+static int clk_gate_scu_enable(struct clk_hw *hw)
+{
+	struct clk_gate_scu *gate =3D to_clk_gate_scu(hw);
+	unsigned long flags =3D 0;
+	u32 reg;
+
+	spin_lock_irqsave(&imx_ccm_lock, flags);
+
+	if (gate->reg) {
+		reg =3D readl(gate->reg);
+		reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << gate->bit_idx);
+		if (gate->hw_gate)
+			reg |=3D (CLK_GATE_SCU_LPCG_HW_SEL |
+				CLK_GATE_SCU_LPCG_SW_SEL) << gate->bit_idx;
+		else
+			reg |=3D (CLK_GATE_SCU_LPCG_SW_SEL << gate->bit_idx);
+		writel(reg, gate->reg);
+	}
+
+	spin_unlock_irqrestore(&imx_ccm_lock, flags);
+
+	return 0;
+}
+
+static void clk_gate_scu_disable(struct clk_hw *hw)
+{
+	struct clk_gate_scu *gate =3D to_clk_gate_scu(hw);
+	unsigned long flags =3D 0;
+	u32 reg;
+
+	spin_lock_irqsave(&imx_ccm_lock, flags);
+
+	if (gate->reg) {
+		reg =3D readl(gate->reg);
+		reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << gate->bit_idx);
+		writel(reg, gate->reg);
+	}
+
+	spin_unlock_irqrestore(&imx_ccm_lock, flags);
+}
+
+static int sc_pm_clock_enable(struct imx_sc_ipc *ipc, u32 resource,
+				   u8 clk, bool enable, bool autog)
+{
+	struct imx_sc_msg_req_clock_enable msg;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D IMX_SC_RPC_SVC_PM;
+	hdr->func =3D IMX_SC_PM_FUNC_CLOCK_ENABLE;
+	hdr->size =3D 3;
+
+	msg.resource =3D resource;
+	msg.clk =3D clk;
+	msg.enable =3D enable;
+	msg.autog =3D autog;
+
+	return imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+}
+
+static int clk_gate_scu_prepare(struct clk_hw *hw)
+{
+	struct clk_gate_scu *gate =3D to_clk_gate_scu(hw);
+
+	/* Enable the clock at the DSC slice level */
+	return sc_pm_clock_enable(ccm_ipc_handle, gate->rsrc_id,
+				  gate->clk_type, true, gate->hw_gate);
+}
+
+static void clk_gate_scu_unprepare(struct clk_hw *hw)
+{
+	struct clk_gate_scu *gate =3D to_clk_gate_scu(hw);
+	int ret;
+
+	ret =3D sc_pm_clock_enable(ccm_ipc_handle, gate->rsrc_id,
+				     gate->clk_type, false, false);
+	if (ret)
+		pr_warn("%s: clk unprepare failed %d\n", clk_hw_get_name(hw),
+			ret);
+}
+
+static const struct clk_ops clk_gate_scu_ops =3D {
+	.prepare =3D clk_gate_scu_prepare,
+	.unprepare =3D clk_gate_scu_unprepare,
+	.enable =3D clk_gate_scu_enable,
+	.disable =3D clk_gate_scu_disable,
+};
+
+struct clk_hw *clk_register_gate_scu(const char *name, const char *parent_=
name,
+				     unsigned long flags, u32 rsrc_id,
+				     u8 clk_type, phys_addr_t reg,
+				     u8 bit_idx, bool hw_gate)
+{
+	struct clk_gate_scu *gate;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	gate->rsrc_id =3D rsrc_id;
+	gate->clk_type =3D clk_type;
+	if (reg) {
+		gate->reg =3D ioremap(reg, SZ_64K);
+		if (!gate->reg) {
+			kfree(gate);
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	gate->bit_idx =3D bit_idx;
+	gate->hw_gate =3D hw_gate;
+
+	init.name =3D name;
+	init.ops =3D &clk_gate_scu_ops;
+	init.flags =3D flags;
+	init.parent_names =3D parent_name ? &parent_name : NULL;
+	init.num_parents =3D parent_name ? 1 : 0;
+
+	gate->hw.init =3D &init;
+
+	hw =3D &gate->hw;
+	ret =3D clk_hw_register(NULL, hw);
+	if (ret) {
+		iounmap(gate->reg);
+		kfree(gate);
+		hw =3D ERR_PTR(ret);
+	}
+
+	return hw;
+}
+
+static const struct clk_ops clk_gate2_scu_ops =3D {
+	.enable =3D clk_gate_scu_enable,
+	.disable =3D clk_gate_scu_disable,
+};
+
+struct clk_hw *clk_register_gate2_scu(const char *name, const char *parent=
_name,
+				      unsigned long flags, phys_addr_t reg,
+				      u8 bit_idx, bool hw_gate)
+{
+	struct clk_gate_scu *gate;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	gate->reg =3D ioremap(reg, SZ_64K);
+	if (!gate->reg) {
+		kfree(gate);
+		return ERR_PTR(-ENOMEM);
+	}
+	gate->bit_idx =3D bit_idx;
+	gate->hw_gate =3D hw_gate;
+
+	init.name =3D name;
+	init.ops =3D &clk_gate2_scu_ops;
+	init.flags =3D flags;
+	init.parent_names =3D parent_name ? &parent_name : NULL;
+	init.num_parents =3D parent_name ? 1 : 0;
+
+	gate->hw.init =3D &init;
+
+	hw =3D &gate->hw;
+	ret =3D clk_hw_register(NULL, hw);
+	if (ret) {
+		iounmap(gate->reg);
+		kfree(gate);
+		hw =3D ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index f0796f3..3885884 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
@@ -36,4 +36,27 @@ static inline struct clk_hw *imx_clk_divider2_scu(const =
char *name,
 struct clk_hw *imx_clk_divider_gpr_scu(const char *name, const char *paren=
t_name,
 				u32 rsrc_id, u8 gpr_id);
=20
+struct clk_hw *clk_register_gate_scu(const char *name, const char *parent_=
name,
+				unsigned long flags, u32 rsrc_id,
+				u8 clk_type, phys_addr_t reg,
+				u8 bit_idx, bool hw_gate);
+
+struct clk_hw *clk_register_gate2_scu(const char *name, const char *parent=
_name,
+				unsigned long flags, phys_addr_t reg,
+				u8 bit_idx, bool hw_gate);
+
+static inline struct clk_hw *imx_clk_gate_scu(const char *name, const char=
 *parent,
+				u32 rsrc_id, u8 clk_type,
+				phys_addr_t reg, u8 bit_idx, bool hw_gate)
+{
+	return clk_register_gate_scu(name, parent, CLK_SET_RATE_PARENT,
+				     rsrc_id, clk_type, reg, bit_idx, hw_gate);
+}
+
+static inline struct clk_hw *imx_clk_gate2_scu(const char *name, const cha=
r *parent,
+				phys_addr_t reg, u8 bit_idx, bool hw_gate)
+{
+	return clk_register_gate2_scu(name, parent, 0, reg, bit_idx, hw_gate);
+}
+
 #endif
--=20
2.7.4


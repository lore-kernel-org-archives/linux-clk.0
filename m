Return-Path: <SRS0=5HZW=M2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF3AC6787C
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A36B20835
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="yFNfJzxe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A36B20835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbeJNPs3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Oct 2018 11:48:29 -0400
Received: from mail-eopbgr20064.outbound.protection.outlook.com ([40.107.2.64]:63156
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726124AbeJNPs3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Oct 2018 11:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bJ0u/kL4JqNjLTAr4HBv32KP8pl7Vp62PlbUwcfkVg=;
 b=yFNfJzxejs5WTVvpMOsbjqfViAGLZF7p5CUnPqFbm2bXA+k4pLrilTnOAwCMsh3FKDtF9z94kbi7z+qzSR+Ks765ntbBtJ6bMpkiyIaSRscK76UaWu2pqPtW6oq7jZdB4fqG9bCtnm1ZXhivlzDHZZbG1wtuRFriF3c0y/ebKqc=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4435.eurprd04.prod.outlook.com (52.135.148.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.26; Sun, 14 Oct 2018 08:07:56 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.027; Sun, 14 Oct 2018
 08:07:56 +0000
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
Subject: [PATCH V4 05/11] clk: imx: scu: add scu clock gate
Thread-Topic: [PATCH V4 05/11] clk: imx: scu: add scu clock gate
Thread-Index: AQHUY5UDa12Huho8BEyIYtM4b8PGaw==
Date:   Sun, 14 Oct 2018 08:07:56 +0000
Message-ID: <1539504194-28289-6-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4435;6:G7Vl+OxlAqRB6q+4yUmQYtm7BOfur/mpNDyEzmWT8zuDswhz7He3Qa2p3WkNkynBsAiyZe2eL+AE5wWIofF5Vc9ga1eUkH+hiXTu3zjeDsRlt2Q+vftk37E0VUTHLA99EXOXYc72P7nS8aVZjEwy+F3U7GRXekgMgBd+sV83tVs8LaQDXgqchVDj4s+KG8nEj2w2B+JHu/LrD2IkCYLz78TxM4d3Iac2XgqWeaXiXMnDmt2pNfwdohEGB4fX+6h46mcNKJnYWYCz9ScojYP6L57ntTCGS/EnE9GEzZOu8DWwaJego4sG4TcdSUHprlzONO+72hZgOJkqge8sWERbNbFNibsnUNh50Lik1y8/t/DwH/RB2Txg/7sQt6nY1PguUf3fBCA76zF+nbW/R44n4m0VqozJCeHZ/DyWSTlTxNy7pME0abg3kMG1IgkGLvFcma4Mcnc09isUM2UcPtMUag==;5:PGKiOEI4O/QIpu9wVx/HAXGU2/9mlLjTzWOt8zZAMgsqmj+FOxebM97uDHedf/bXmOLbjXut7YkEpIwYv6JnTpqUDqFh7wrEfAYlacc2OnAqwMAew4WAuVVVJEsjI7/5b7O8txFQxa/BelTMa3hIpUmsAIegDVlnGqEm4sVl820=;7:1kT5PAbAg1/ULYGXtlKW+YvFRCd6615CazfTBE6T/PpZlxcJ8Q5SNNOHXn99WgBJEYD7smKD/ST5NIXABLUCf7BMrvXmzAoDANnBk7TN78JbChzJBroeuC8Qn4jp/0qPcrxmyJsvIZrgFTuFyvsRCcVzoEp9ZM5GKRNeCVtpAZRhZtniBMBIITC0BkWKCx+uFhTONDpKhxVbzyzpHq+/7Rlx4H0emwGNJU+vwyRXe79CS2e5wtB1plDiSkj6vTeu
x-ms-office365-filtering-correlation-id: d1f05968-82c9-40d4-eadc-08d631ac25c3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4435;
x-ms-traffictypediagnostic: AM0PR04MB4435:
x-microsoft-antispam-prvs: <AM0PR04MB44358AF9047CB40910350A0580FC0@AM0PR04MB4435.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991067);SRVR:AM0PR04MB4435;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4435;
x-forefront-prvs: 08252193F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(396003)(39850400004)(366004)(54534003)(199004)(189003)(6436002)(186003)(76176011)(5640700003)(386003)(6506007)(316002)(36756003)(52116002)(2351001)(99286004)(6512007)(106356001)(6486002)(446003)(26005)(8936002)(11346002)(86362001)(575784001)(476003)(2616005)(8676002)(5660300001)(102836004)(486006)(81166006)(81156014)(6916009)(4326008)(54906003)(2906002)(66066001)(14444005)(71190400001)(71200400001)(256004)(305945005)(5250100002)(25786009)(2900100001)(97736004)(7736002)(50226002)(68736007)(478600001)(105586002)(3846002)(6116002)(53936002)(2501003)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4435;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: CEGvt2ZwAcMxYsJzLWUyJIdQ0OjNi4gnsh4y8ikXPleGQUr8uqSeXxqbWb54be7kV/mMWjkA7jyevBbM4aFoESrIvEwxbfy63Zq2+0ruqDtLdv683V450CQstqe7t4yUtRCWTSHDyDRlVxs7YI73cXWt5Lz6C0E8mg7hYqHrVgi3/iASmCPsIHrMJ4FKKYAWgwMTOi9ATzg6hkCrcH0IllSiy++KzaFMbdw2ZYUlIlykUwf1zEe6CYEw+rlur++ntdH1GvTVl0u/qPp4CoARKnTo0mF98LYa94jRb9NUY4qxhIa7qwsqFq8iLBg8YmuWN5VHJ5/yiSUWxwk7o2wILVeMBg+Gdw+VHyz1kgV95HQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f05968-82c9-40d4-eadc-08d631ac25c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2018 08:07:56.2199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4435
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
v3->v4:
 * scu headfile path update
v2->v3:
 * structure names and api usage update
v1->v2:
 * move SCU clock API implementation into driver
---
 drivers/clk/imx/scu/Makefile       |   3 +-
 drivers/clk/imx/scu/clk-gate-scu.c | 222 +++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/scu/clk-scu.h      |  23 ++++
 3 files changed, 247 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-gate-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index 9e7f4aa..2abed17 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -3,4 +3,5 @@
 obj-$(CONFIG_MXC_CLK_SCU) +=3D \
 	clk-scu.o \
 	clk-divider-scu.o \
-	clk-divider-gpr-scu.o
+	clk-divider-gpr-scu.o \
+	clk-gate-scu.o
diff --git a/drivers/clk/imx/scu/clk-gate-scu.c b/drivers/clk/imx/scu/clk-g=
ate-scu.c
new file mode 100644
index 0000000..d86d2ee
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-gate-scu.c
@@ -0,0 +1,222 @@
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
+	struct clk_hw	hw;
+	void __iomem	*reg;
+	u8	bit_idx;
+	bool	hw_gate;
+	u32	rsrc_id;
+	u8	clk_type;
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
+	u32 reg;
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
+	return 0;
+}
+
+static void clk_gate_scu_disable(struct clk_hw *hw)
+{
+	struct clk_gate_scu *gate =3D to_clk_gate_scu(hw);
+	u32 reg;
+
+	if (gate->reg) {
+		reg =3D readl(gate->reg);
+		reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << gate->bit_idx);
+		writel(reg, gate->reg);
+	}
+}
+
+static int sc_pm_clock_enable(struct imx_sc_ipc *ipc, u32 resource,
+				   u8 clk, bool enable, bool autog)
+{
+	struct imx_sc_msg_req_clock_enable msg;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D (uint8_t)IMX_SC_RPC_SVC_PM;
+	hdr->func =3D (uint8_t)IMX_SC_PM_FUNC_CLOCK_ENABLE;
+	hdr->size =3D 3;
+
+	msg.resource =3D resource;
+	msg.clk =3D clk;
+	msg.enable =3D (uint8_t)enable;
+	msg.autog =3D (uint8_t)autog;
+
+	return imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+}
+
+static int clk_gate_scu_prepare(struct clk_hw *hw)
+{
+	struct clk_gate_scu *gate =3D to_clk_gate_scu(hw);
+	int ret;
+
+	/* Enable the clock at the DSC slice level */
+	ret =3D sc_pm_clock_enable(ccm_ipc_handle, gate->rsrc_id,
+				 gate->clk_type, true, gate->hw_gate);
+	if (ret)
+		pr_err("%s: clk prepare failed %d\n", clk_hw_get_name(hw), ret);
+
+	return ret;
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
+		pr_err("%s: clk unprepare failed %d\n", clk_hw_get_name(hw),
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
+				     u8 clk_type, void __iomem *reg,
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
+		gate->reg =3D ioremap((phys_addr_t)reg, SZ_64K);
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
+				      unsigned long flags, void __iomem *reg,
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
+	gate->reg =3D ioremap((phys_addr_t)reg, SZ_64K);
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
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index f0796f3..4ff7837 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -36,4 +36,27 @@ static inline struct clk_hw *imx_clk_divider2_scu(const =
char *name,
 struct clk_hw *imx_clk_divider_gpr_scu(const char *name, const char *paren=
t_name,
 				u32 rsrc_id, u8 gpr_id);
=20
+struct clk_hw *clk_register_gate_scu(const char *name, const char *parent_=
name,
+				unsigned long flags, u32 rsrc_id,
+				u8 clk_type, void __iomem *reg,
+				u8 bit_idx, bool hw_gate);
+
+struct clk_hw *clk_register_gate2_scu(const char *name, const char *parent=
_name,
+				unsigned long flags, void __iomem *reg,
+				u8 bit_idx, bool hw_gate);
+
+static inline struct clk_hw *imx_clk_gate_scu(const char *name, const char=
 *parent,
+				u32 rsrc_id, u8 clk_type,
+				void __iomem *reg, u8 bit_idx, bool hw_gate)
+{
+	return clk_register_gate_scu(name, parent, CLK_SET_RATE_PARENT,
+				     rsrc_id, clk_type, reg, bit_idx, hw_gate);
+}
+
+static inline struct clk_hw *imx_clk_gate2_scu(const char *name, const cha=
r *parent,
+				void __iomem *reg, u8 bit_idx, bool hw_gate)
+{
+	return clk_register_gate2_scu(name, parent, 0, reg, bit_idx, hw_gate);
+}
+
 #endif
--=20
2.7.4


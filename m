Return-Path: <SRS0=kVDh=NV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEE8C43441
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 15:19:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 101EE20858
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 15:19:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="qaqlo9+f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 101EE20858
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbeKKBFP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Nov 2018 20:05:15 -0500
Received: from mail-db5eur01on0063.outbound.protection.outlook.com ([104.47.2.63]:6041
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726068AbeKKBFP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 10 Nov 2018 20:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZyXJH2QqUvtsJ6npSpgfmwNvhqwMP8Gtk5JRSgxCkI=;
 b=qaqlo9+fqe8/wvD/VdBVGzXAJJN26IZUDxYz0vpjws9LjsCK8D52JiaLp/urwsundYIYOg5WP7afErfejlNxb3KQlpRjHFgBGbRVBQVXxopc0jQ2bi4Y2amlVdMOAkW1AbeCEF53g2xhzk0FKL8241E0Frsfsuy3e7HWQFvIa/Y=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4067.eurprd04.prod.outlook.com (52.134.125.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Sat, 10 Nov 2018 15:19:50 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::797a:f972:9281:6d10%2]) with mapi id 15.20.1294.039; Sat, 10 Nov 2018
 15:19:50 +0000
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
Subject: [PATCH V6 1/6] clk: imx: add scu clock common part
Thread-Topic: [PATCH V6 1/6] clk: imx: add scu clock common part
Thread-Index: AQHUeQjSL+5Kz7cfm0+etm9/wrHEQw==
Date:   Sat, 10 Nov 2018 15:19:49 +0000
Message-ID: <1541862894-8209-2-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4067;6:nrNiWP7/9BRsdxdTZWGuhU6QTrBQ7+FfFAAJCOgoBKQwudtkpIql2WrQdwXYyDU1zdwTQVecBNmy5PY0WWDx4uAp9YykmalNo0HC5k29Gg/wYde7ZZJDXv5dutOLVEU5BaG2jPrmCBfxFYOI6p82vjzvgJ+g4fGjmEsNOWej1P6trOTRilF40lAQrARi5ZAqIhryShuNPZyFHFG5YBeos4FlIL8hTihwPJwq5/U97dW2QiUBvJfig5/XpZXpZzB7/dVXh2VSgK+JzHJq0Cc9D/Uzgw/qdieYnzySrUFLS+Agu6x4K91FgA3+S3Ll5K7pZVSBjfMSLt3hlk5hBl320sMXL/WhjfBVOdOsF/StGRQbrEiM2un3CD9pE5p8nVM1DFJzpehRn7ExxRs06/L9U3WPuE4E4c5wde6CuYpFaaEsHMeVyTEUMD1mD1/EHN5tEkBwtNGPceSLUmtzztG2HQ==;5:CTJddJ0rZ8hlFgsvDpD6rf60jYXpLuORaByYyU0Q1f3w11Sk7Ewsd/LKf16bUG87quGLfnea5/yuI7F4B6A6FJUpGwXfB1MmyoY7T1Xsw9eFq3wAhgp9dx2xNg0lA0qgKL/j/hNF4fu5AHoK96En8YoKxTnFQQWC9p1leQVLdEM=;7:dwKP7Wu0c/+5XMjegtnL5WCDQ8Yn2y3t/+YyluW2U4Yfdqb0CWDXomFDmMlViwUZHOTyoEOpUnGunj0RQKEeR8TRUBnaLs0DnMgLDVJu2lJrctRFl6c6FLwtIiVGCVnd/1GG18AG5Ql8PswuYK5JlA==
x-ms-office365-filtering-correlation-id: 8cdfb6dc-6f75-418e-217e-08d6471ff4c3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390040)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4067;
x-ms-traffictypediagnostic: AM0PR04MB4067:
x-microsoft-antispam-prvs: <AM0PR04MB4067B0C4E84FBEAC959B996C80C70@AM0PR04MB4067.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(269456686620040)(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4067;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4067;
x-forefront-prvs: 0852EB6797
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(396003)(366004)(39850400004)(136003)(54534003)(189003)(199004)(2501003)(25786009)(50226002)(71190400001)(4326008)(97736004)(2900100001)(14454004)(8676002)(99286004)(76176011)(186003)(8936002)(53936002)(52116002)(5660300001)(102836004)(81156014)(81166006)(68736007)(446003)(386003)(11346002)(26005)(71200400001)(486006)(6512007)(6506007)(66066001)(5640700003)(2616005)(476003)(7736002)(305945005)(86362001)(6116002)(6486002)(3846002)(36756003)(6436002)(316002)(54906003)(478600001)(105586002)(106356001)(256004)(6916009)(14444005)(2906002)(2351001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4067;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Oit/E5dRTCWN5sTH85021S3iX9HagGXZJbrcJAsYYdxZB5wRMeLVTlNwJgKHWjx8jT+BeEsLsLUiR9FRo8iraKHL/88YCYd2AAeTmTaMveOM6poKZuzBm2ZCCJm2U0LVZQvnsRtpzg0YFneUw3bzIczawdoPl1GNj557qUxe9B4IeG5n+LpeaXR8uj97oc4Z4ykYUPEfEUpiSo9dEcmzEj13tJuQvRakgQpg1ccpxdSAGA92A+980dzA0gFg823QFO+TGfMX09zbOIkA7xlJsgBjfqlhq8GlRKeSVlrc7ftcVd0YB1T2oUEYHbvbH7sh9ARtCeuQmg2I7V2f2E4Y+0MU3tXZFEucX105mfpPn6k=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdfb6dc-6f75-418e-217e-08d6471ff4c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2018 15:19:49.9763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4067
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add scu clock common part which will be used by client clock drivers.
SCU clocks are totally different from the legacy clocks (No much
legacy things can be reused). So a new configuration option
CONFIG_MXC_CLK_SCU is added.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v5->v6:
 * simply the whole clock driver a lot by re-orgnizing the driver into a
   few clock types:: scu clock (merge scu divider/gate/mux) and scu gpr loc=
k
   which accessing is through SCU protocol and LPCG clock which is directly
   accessible by CPU.
 * LPCG clock support will be added in next patch, gpr clock is still not u=
sed
   and will be added later.
 * remove old year license as the code is totally rewritten
 * scu mux support will be added later as it's also still not used.
v4->v5:
 * add more explanation in commit message on why put scu clocks
in a deeper folder.
 * move scu clk files into the top directory of imx folder
v3->v4:
 * scu headfile path change
v2->v3:
 * no changes
v1->v2:
 * update function call name
---
 drivers/clk/imx/Kconfig   |   4 +
 drivers/clk/imx/Makefile  |   3 +
 drivers/clk/imx/clk-scu.c | 237 ++++++++++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-scu.h |  21 ++++
 4 files changed, 265 insertions(+)
 create mode 100644 drivers/clk/imx/clk-scu.c
 create mode 100644 drivers/clk/imx/clk-scu.h

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index 43a3ecc..63e7b01 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -3,3 +3,7 @@
 config MXC_CLK
 	bool
 	depends on ARCH_MXC
+
+config MXC_CLK_SCU
+	bool
+	depends on ARCH_MXC && ARM64
diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index d447f8c..eec6d72 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -13,6 +13,9 @@ obj-$(CONFIG_MXC_CLK) +=3D \
 	clk-pllv3.o \
 	clk-pfd.o
=20
+obj-$(CONFIG_MXC_CLK_SCU) +=3D \
+	clk-scu.o
+
 obj-$(CONFIG_SOC_IMX1)   +=3D clk-imx1.o
 obj-$(CONFIG_SOC_IMX21)  +=3D clk-imx21.o
 obj-$(CONFIG_SOC_IMX25)  +=3D clk-imx25.o
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
new file mode 100644
index 0000000..9fec574
--- /dev/null
+++ b/drivers/clk/imx/clk-scu.c
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2018 NXP
+ *   Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+
+#include "clk-scu.h"
+
+struct imx_sc_ipc *ccm_ipc_handle;
+
+struct clk_scu {
+	struct clk_hw hw;
+	u32 rsrc_id;
+	u8 clk_type;
+};
+
+/* SCU Clock Protocol definitions */
+
+/* rate */
+struct imx_sc_msg_req_set_clock_rate {
+	struct imx_sc_rpc_msg hdr;
+	u32 rate;
+	u16 resource;
+	u8 clk;
+} __packed;
+
+struct req_get_clock_rate {
+	u16 resource;
+	u8 clk;
+} __packed;
+
+struct resp_get_clock_rate {
+	u32 rate;
+};
+
+struct imx_sc_msg_get_clock_rate {
+	struct imx_sc_rpc_msg hdr;
+	union {
+		struct req_get_clock_rate req;
+		struct resp_get_clock_rate resp;
+	} data;
+} __packed;
+
+/* gate */
+struct imx_sc_msg_req_clock_enable {
+	struct imx_sc_rpc_msg hdr;
+	u16 resource;
+	u8 clk;
+	u8 enable;
+	u8 autog;
+} __packed;
+
+static inline struct clk_scu *to_clk_scu(struct clk_hw *hw)
+{
+	return container_of(hw, struct clk_scu, hw);
+}
+
+/*
+ * clk_scu_recalc_rate - Get clock rate for a SCU clock
+ * @hw: clock to get rate for
+ * @parent_rate: parent rate provided by common clock framework, not used
+ *
+ * Gets the current clock rate of a SCU clock. Returns the current
+ * clock rate, or zero in failure.
+ */
+static unsigned long clk_scu_recalc_rate(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct clk_scu *clk =3D to_clk_scu(hw);
+	struct imx_sc_msg_get_clock_rate msg;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+	int ret;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D IMX_SC_RPC_SVC_PM;
+	hdr->func =3D IMX_SC_PM_FUNC_GET_CLOCK_RATE;
+	hdr->size =3D 2;
+
+	msg.data.req.resource =3D clk->rsrc_id;
+	msg.data.req.clk =3D clk->clk_type;
+
+	ret =3D imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret) {
+		pr_err("%s: failed to get clock rate %d\n",
+			clk_hw_get_name(hw), ret);
+		return 0;
+	}
+
+	return msg.data.resp.rate;
+}
+
+/*
+ * clk_scu_round_rate - Round clock rate for a SCU clock
+ * @hw: clock to round rate for
+ * @rate: rate to round
+ * @parent_rate: parent rate provided by common clock framework, not used
+ *
+ * Gets the current clock rate of a SCU clock. Returns the current
+ * clock rate, or zero in failure.
+ */
+static long clk_scu_round_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long *parent_rate)
+{
+	/*
+	 * Assume we support all the requested rate and let the SCU firmware
+	 * to handle the left work
+	 */
+	return rate;
+}
+
+/*
+ * clk_scu_set_rate - Set rate for a SCU clock
+ * @hw: clock to change rate for
+ * @rate: target rate for the clock
+ * @parent_rate: rate of the clock parent, not used for SCU clocks
+ *
+ * Sets a clock frequency for a SCU clock. Returns the SCU
+ * protocol status.
+ */
+static int clk_scu_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	struct clk_scu *clk =3D to_clk_scu(hw);
+	struct imx_sc_msg_req_set_clock_rate msg;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D IMX_SC_RPC_SVC_PM;
+	hdr->func =3D IMX_SC_PM_FUNC_SET_CLOCK_RATE;
+	hdr->size =3D 3;
+
+	msg.rate =3D rate;
+	msg.resource =3D clk->rsrc_id;
+	msg.clk =3D clk->clk_type;
+
+	return imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
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
+/*
+ * clk_scu_prepare - Enable a SCU clock
+ * @hw: clock to enable
+ *
+ * Enable the clock at the DSC slice level
+ */
+static int clk_scu_prepare(struct clk_hw *hw)
+{
+	struct clk_scu *clk =3D to_clk_scu(hw);
+
+	return sc_pm_clock_enable(ccm_ipc_handle, clk->rsrc_id,
+				  clk->clk_type, true, false);
+}
+
+/*
+ * clk_scu_unprepare - Disable a SCU clock
+ * @hw: clock to enable
+ *
+ * Disable the clock at the DSC slice level
+ */
+static void clk_scu_unprepare(struct clk_hw *hw)
+{
+	struct clk_scu *clk =3D to_clk_scu(hw);
+	int ret;
+
+	ret =3D sc_pm_clock_enable(ccm_ipc_handle, clk->rsrc_id,
+				 clk->clk_type, false, false);
+	if (ret)
+		pr_warn("%s: clk unprepare failed %d\n", clk_hw_get_name(hw),
+			ret);
+}
+
+static const struct clk_ops clk_scu_ops =3D {
+	.recalc_rate =3D clk_scu_recalc_rate,
+	.round_rate =3D clk_scu_round_rate,
+	.set_rate =3D clk_scu_set_rate,
+	.prepare =3D clk_scu_prepare,
+	.unprepare =3D clk_scu_unprepare,
+};
+
+struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id, u8 clk_type)
+{
+	struct clk_init_data init;
+	struct clk_scu *clk;
+	struct clk_hw *hw;
+	int ret;
+
+	clk =3D kzalloc(sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	clk->rsrc_id =3D rsrc_id;
+	clk->clk_type =3D clk_type;
+
+	init.name =3D name;
+	init.ops =3D &clk_scu_ops;
+	init.num_parents =3D 0;
+	/*
+	 * Note on MX8, the clocks are tightly coupled with power domain
+	 * that once the power domain is off, the clock status may be
+	 * lost. So we make it NOCACHE to let user to retrieve the real
+	 * clock status from HW instead of using the possible invalid
+	 * cached rate.
+	 */
+	init.flags =3D CLK_GET_RATE_NOCACHE;
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
new file mode 100644
index 0000000..09f381b
--- /dev/null
+++ b/drivers/clk/imx/clk-scu.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2018 NXP
+ *   Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#ifndef __IMX_CLK_SCU_H
+#define __IMX_CLK_SCU_H
+
+#include <linux/firmware/imx/sci.h>
+
+extern struct imx_sc_ipc *ccm_ipc_handle;
+
+static inline int imx_clk_scu_init(void)
+{
+	return imx_scu_get_handle(&ccm_ipc_handle);
+}
+
+struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id, u8 clk_type);
+
+#endif
--=20
2.7.4


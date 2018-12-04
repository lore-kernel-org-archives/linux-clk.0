Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BB5C04EBF
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 14:39:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C524020672
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 14:39:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="MCw13d1k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C524020672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbeLDOjf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 09:39:35 -0500
Received: from mail-eopbgr80048.outbound.protection.outlook.com ([40.107.8.48]:62432
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725955AbeLDOjf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 4 Dec 2018 09:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpFM9pXVeqv91aENE52waJnH1hSQewUXxe8UaIlkgwE=;
 b=MCw13d1kaToxiS3CpBRhJGyZSEyMWZahze7NZM+RNpqE6l8HVJ0u7QaD1sb1NJZtoLxfKhB//AsIdrbXysgoUI1x3fi4m7DMY8Ce8ClI/6VhPyCfLCkcm2GS9JrhdLYnL3xFvllJoq1xEjyr6voPOXKBE2M2UnFyVdAU+Ya8ol0=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4546.eurprd04.prod.outlook.com (52.135.148.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.22; Tue, 4 Dec 2018 14:39:26 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1382.023; Tue, 4 Dec 2018
 14:39:26 +0000
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
Subject: [PATCH V9 2/7] clk: imx: add scu clock common part
Thread-Topic: [PATCH V9 2/7] clk: imx: add scu clock common part
Thread-Index: AQHUi98nS3QbsFuE9k65NTuug/+jZQ==
Date:   Tue, 4 Dec 2018 14:39:25 +0000
Message-ID: <1543934041-12572-3-git-send-email-aisheng.dong@nxp.com>
References: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1543934041-12572-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::27) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4546;6:evQBbxQ0BJCFHkC65PUuTFARw+zhDGmWoJs50mYK6nzW3uTIqVbhTV70DV3Cw6f355GsVBN0ZdxUcgWfpT6pRNpEkRPKqxeh5P2NigC70vwxYfjp7ftNLEn4HOUYJtxcFUrpz3Hx5AToadgn8y3Ruhvii4SnFFpA+86glCw+rtZ8rxNOEZdBdJlT6/ZYOadHkLDqZWNxAJt6YHxQertXWGZdYLsFcnVLOYpiqK+gFk7ydqT0ZCIOzkve1CaElvAMBUYGpVLZZdFJTcZrWrc0bZ9AHEjXzWgwfzi7Cdtwi4M2UclhPo8eD98jiy2K9kuM4q6UTowKHnd+lcazN3Povz16DSTHm3Glw09saeky2knq6FS0pVS4KWNQU3LEj7mhhDWnkVOWrDc8t/4+yS6Z5lU+AH3XUKZITiL8rIjN20Mr2Qjn5k0K07RrWVV4JZMfLeqlk+fBhOFkaGvtg8QbTg==;5:uYF5guQ7jnbq4vWuL8k4qq6rkP4DNVwflUgLPO8i8K4oRNN9Snvv/nDaUMS1Vi58luF9hNAtM+NJTlJjMikJdi5+iBSBt7wXUn3ZBajzevx6ORRmZtwCyQbbIznVQ0ig5MWESOmS5PmJWgihBzlF8oTDlsbW4yqNAyFG/RGaeUU=;7:PIYqFhT61dNA6yHVhr7+gKK3qDyfGaUXPfg4sXDM74VMqWxNvJjiEcwevWwHn5IZQihw1tIm1Xz5pMZ2WeYCKtdIsOHsx0Eo2+sYjvCrn6+cjiZRKFpa3st97q4NMKDdxHMXIzNctgmshk5CAaYkqw==
x-ms-office365-filtering-correlation-id: d2155a36-0bbd-4e6b-f80b-08d659f649d6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4546;
x-ms-traffictypediagnostic: AM0PR04MB4546:
x-microsoft-antispam-prvs: <AM0PR04MB45461DE4D0BAB9503D8634C080AF0@AM0PR04MB4546.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231455)(999002)(944501493)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4546;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4546;
x-forefront-prvs: 0876988AF0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(396003)(39860400002)(346002)(366004)(189003)(199004)(68736007)(36756003)(66066001)(316002)(2501003)(6486002)(6916009)(97736004)(71200400001)(71190400001)(81156014)(50226002)(81166006)(5660300001)(8936002)(8676002)(4326008)(3846002)(6512007)(386003)(6116002)(26005)(186003)(102836004)(2351001)(2906002)(99286004)(52116002)(6506007)(76176011)(106356001)(53936002)(305945005)(105586002)(5640700003)(256004)(14444005)(2616005)(86362001)(478600001)(486006)(476003)(25786009)(7736002)(446003)(6436002)(54906003)(11346002)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4546;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: ++cCdMzWDObKsJhM8W8zUU4PEWvyomXMyaIhJ1z34+M2M/vybO00pjO+mjzIwqLdvEQG1yF8TCGsu7Lr/CYCCYlrsmTbuoXTYrNBnP9JLJ82A/Fp0+9GjMi1+N20L4vwQl5iLrW3e+MUkJ/FfTjGqjpK1FyPSzPBsaZ6Wd4+aYwR4WzFLFyyeDeLBGoRRHWUlT3uFoX23Q9IhMnWyBFd5ZhFRM5BS5P3s0m3TbG4MPuJAygzLvqBOseZm/0oY1cQT0BVB40BCnmPJHggWwPtCaE1li1ohipHffixfUUuFaR57OAd1qR3xYILxBhUdu1sf4m5NJDpi25t4S1/wvzp7wzvfuPP6Xpgm9GXRWfodPg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2155a36-0bbd-4e6b-f80b-08d659f649d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2018 14:39:26.0039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4546
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add SCU clock common part which will be used by client clock drivers.
SCU clocks are totally different from the legacy clocks (No much
legacy things can be reused), it's using a firmware interface now based
on SCU protocol. So a new configuration option CONFIG_MXC_CLK_SCU is added.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/Kconfig   |   4 +
 drivers/clk/imx/Makefile  |   3 +
 drivers/clk/imx/clk-scu.c | 265 ++++++++++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-scu.h |  21 ++++
 4 files changed, 293 insertions(+)
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
index f850424..4abed37 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -20,6 +20,9 @@ obj-$(CONFIG_MXC_CLK) +=3D \
 	clk-pllv4.o \
 	clk-sccg-pll.o
=20
+obj-$(CONFIG_MXC_CLK_SCU) +=3D \
+	clk-scu.o
+
 obj-$(CONFIG_SOC_IMX1)   +=3D clk-imx1.o
 obj-$(CONFIG_SOC_IMX21)  +=3D clk-imx21.o
 obj-$(CONFIG_SOC_IMX25)  +=3D clk-imx25.o
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
new file mode 100644
index 0000000..ec8a471
--- /dev/null
+++ b/drivers/clk/imx/clk-scu.c
@@ -0,0 +1,265 @@
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
+/*
+ * struct clk_scu - Description of one SCU clock
+ * @hw: the common clk_hw
+ * @rsrc_id: resource ID of this SCU clock
+ * @clk_type: type of this clock resource
+ */
+struct clk_scu {
+	struct clk_hw hw;
+	u16 rsrc_id;
+	u8 clk_type;
+};
+
+/*
+ * struct imx_sc_msg_req_set_clock_rate - clock set rate protocol
+ * @hdr: SCU protocol header
+ * @rate: rate to set
+ * @resource: clock resource to set rate
+ * @clk: clk type of this resource
+ *
+ * This structure describes the SCU protocol of clock rate set
+ */
+struct imx_sc_msg_req_set_clock_rate {
+	struct imx_sc_rpc_msg hdr;
+	__le32 rate;
+	__le16 resource;
+	u8 clk;
+} __packed;
+
+struct req_get_clock_rate {
+	__le16 resource;
+	u8 clk;
+} __packed;
+
+struct resp_get_clock_rate {
+	__le32 rate;
+};
+
+/*
+ * struct imx_sc_msg_get_clock_rate - clock get rate protocol
+ * @hdr: SCU protocol header
+ * @req: get rate request protocol
+ * @resp: get rate response protocol
+ *
+ * This structure describes the SCU protocol of clock rate get
+ */
+struct imx_sc_msg_get_clock_rate {
+	struct imx_sc_rpc_msg hdr;
+	union {
+		struct req_get_clock_rate req;
+		struct resp_get_clock_rate resp;
+	} data;
+};
+
+/*
+ * struct imx_sc_msg_req_clock_enable - clock gate protocol
+ * @hdr: SCU protocol header
+ * @resource: clock resource to gate
+ * @clk: clk type of this resource
+ * @enable: whether gate off the clock
+ * @autog: HW auto gate enable
+ *
+ * This structure describes the SCU protocol of clock gate
+ */
+struct imx_sc_msg_req_clock_enable {
+	struct imx_sc_rpc_msg hdr;
+	__le16 resource;
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
+					 unsigned long parent_rate)
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
+	msg.data.req.resource =3D cpu_to_le16(clk->rsrc_id);
+	msg.data.req.clk =3D clk->clk_type;
+
+	ret =3D imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret) {
+		pr_err("%s: failed to get clock rate %d\n",
+		       clk_hw_get_name(hw), ret);
+		return 0;
+	}
+
+	return le32_to_cpu(msg.data.resp.rate);
+}
+
+/*
+ * clk_scu_round_rate - Round clock rate for a SCU clock
+ * @hw: clock to round rate for
+ * @rate: rate to round
+ * @parent_rate: parent rate provided by common clock framework, not used
+ *
+ * Returns the current clock rate, or zero in failure.
+ */
+static long clk_scu_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *parent_rate)
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
+			    unsigned long parent_rate)
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
+	msg.rate =3D cpu_to_le32(rate);
+	msg.resource =3D cpu_to_le16(clk->rsrc_id);
+	msg.clk =3D clk->clk_type;
+
+	return imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+}
+
+static int sc_pm_clock_enable(struct imx_sc_ipc *ipc, u16 resource,
+			      u8 clk, bool enable, bool autog)
+{
+	struct imx_sc_msg_req_clock_enable msg;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D IMX_SC_RPC_SVC_PM;
+	hdr->func =3D IMX_SC_PM_FUNC_CLOCK_ENABLE;
+	hdr->size =3D 3;
+
+	msg.resource =3D cpu_to_le16(resource);
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


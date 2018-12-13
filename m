Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DB1C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 15:43:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88C5820879
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 15:43:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="SRKQ9f07"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88C5820879
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbeLMPn1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 10:43:27 -0500
Received: from mail-eopbgr70070.outbound.protection.outlook.com ([40.107.7.70]:35800
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728744AbeLMPn1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 Dec 2018 10:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QR5IgsKDy6zubbw+lEB85iQHXejoDpXnwgs5RvU8O2s=;
 b=SRKQ9f07W/feAklrmjDN09HkpF3cWS5nZr8ydpQzaTGwX87vK8Mixl9JXhxbz6bgS7jmxZ/EmriM6kFIYFGdiz9+P/6/rooBaDP4io4mAIlMrH7eNb68S1QHUitd9zQ/UrDv+M/q2soYbM0OKXccGV898kxYr69eJ/sbpAn9at8=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5843.eurprd04.prod.outlook.com (20.178.118.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.18; Thu, 13 Dec 2018 15:42:54 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::31e3:2aa6:8d93:9927%2]) with mapi id 15.20.1404.026; Thu, 13 Dec 2018
 15:42:54 +0000
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
Subject: [PATCH V12 2/5] clk: imx: add scu clock common part
Thread-Topic: [PATCH V12 2/5] clk: imx: add scu clock common part
Thread-Index: AQHUkvqDyzfTEDZvfkyN2LXXDCkJ4g==
Date:   Thu, 13 Dec 2018 15:42:54 +0000
Message-ID: <1544715442-8902-3-git-send-email-aisheng.dong@nxp.com>
References: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR04CA0086.apcprd04.prod.outlook.com
 (2603:1096:202:15::30) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5843;6:OSgJykMFSkbN/kAKzbOFr5YrQtDWPPJmBqdO5sjKIC0VRiVcLJtnPpGUEzJN/WLKZKKGtsHA75OS2hfqEXxevLkmjX30ZKb8d7I0cTM/iDzF8pgDPNMTk8jNrvu0/0m5C040uPnUMOprGPyTaUcNbIkahDUs3WNs3vOoJy96XgVeZXD/3XK6WyX3GriST24NHau+SPUToR7q2j7pm1WJXmONlnzNuRGwkT0odMEVUiZJ7wMrsRH5jOmlcT3zPZAw3UVsIalJHsx4QOLYrxzbLwgqR+0xBMabU+cW5m9iZPbIpUvvqI11jEQr39BSKqUrI+VXeby+E0I2d4WHE2fPSOIT4s8y4dD3uiccs2kfagSc3i+a6tSCSceHvTHJdNHRxQOmXkqCuPTCO4ta7hoaMzIGXGPvArr5wTGLjW/+nOsp2HD5GY90CFRAXPdeotkbohkweKUDIJhkqkMDvt3OIA==;5:7z3v3EZVzlHMh0imbC/j83Ay4eJRgERRJWcsVTjrElwvwvYcCJoK8CWWKBRmaqlIzoFfVvFAVzMQ/Ehj4bAI8oAQApEH7YGAexFIovA4rjENuCBNzU/JXc4x+fLiGoCEqYUTy2aHB849taLl7IHdK1Cry3mO5jo4RbdUVEWjziU=;7:xd470gJnYqzCZE0pGs0AeVbTMLbx6VMARc54FMfiCfQOIW/ruYgQlQbmo1BJ6zsT2YR8hVaGyjFun7WYb4SMk8kjXAtOY9gT+SO58AcWoCBJwRKLLEdUzTQEI/Ffv6KlFBib5/bRma6XkfCuyUAN6A==
x-ms-office365-filtering-correlation-id: 5a1fd7f5-2ad1-4a78-aee8-08d66111a56d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5843;
x-ms-traffictypediagnostic: AM0PR04MB5843:
x-microsoft-antispam-prvs: <AM0PR04MB58435A3ECEFFDAF758648F7980A00@AM0PR04MB5843.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231475)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB5843;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB5843;
x-forefront-prvs: 088552DE73
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(396003)(376002)(136003)(346002)(366004)(199004)(189003)(71190400001)(71200400001)(6916009)(6436002)(6486002)(97736004)(478600001)(14454004)(54906003)(4326008)(256004)(44832011)(14444005)(5640700003)(8676002)(106356001)(105586002)(2351001)(25786009)(8936002)(316002)(36756003)(81166006)(81156014)(2616005)(11346002)(53936002)(476003)(486006)(446003)(2906002)(50226002)(68736007)(7736002)(99286004)(76176011)(2501003)(305945005)(5660300001)(52116002)(3846002)(6116002)(186003)(86362001)(6512007)(102836004)(66066001)(386003)(26005)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5843;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 8/J4f5jI3tjgVgTiMlr91p9CRmVNew5bR9VHNt22xNwolsyHUvvDqSYrQoX4WD8u+mBmp+ay/g3J4JBaMj8vb+mpoGUMhohIv35aSvcfZXuV+MudDx7HtIR33kQTA7ZXVA+CavWNFm+wdSOFZcD5lutEyQQt66kgU1P//JrJesG8vnT+VFvqjizyrNRwUhPI+TTk/m0OlTAkv9DRSnPeiQmgvqmtY7emJY6YcA45x4jeCON/FHnPsH4p3BBMKK80aWhCGFndITsdyONm8MrE/vQqiVTgNCEClnQC9itctZEZJeznyQXMYpdBPFUTXrRl
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1fd7f5-2ad1-4a78-aee8-08d66111a56d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2018 15:42:54.2924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5843
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
v11->v12:
 * sill keep MXC_CLK_SCU hide which will be selected by SoC clock configura=
tion
   option
v10->v11:
 * break dependency on the arch Kconfig
v9->v10:
 * remove ccm_ipc_handle from headfile as no other users need it now
   and move imx_clk_scu_init() implementation into driver accordingly.
v8->v9:
 * improve commit message to detail the SCU clock difference from legecy cl=
ock
 * add __le32 and __le16 for SCU message structure members as it's little e=
ndian
v7->v8:
 * add kernel doc for scu protocol structures
v7:
 * no changes
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
 drivers/clk/imx/clk-scu.c | 270 ++++++++++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-scu.h |  15 +++
 4 files changed, 292 insertions(+)
 create mode 100644 drivers/clk/imx/clk-scu.c
 create mode 100644 drivers/clk/imx/clk-scu.h

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index bdd85b89..2a3b58d 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -3,3 +3,7 @@
 config MXC_CLK
 	bool
 	def_bool ARCH_MXC
+
+config MXC_CLK_SCU
+	bool
+	depends on IMX_SCU
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
index 0000000..2987deb
--- /dev/null
+++ b/drivers/clk/imx/clk-scu.c
@@ -0,0 +1,270 @@
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
+int imx_clk_scu_init(void)
+{
+	return imx_scu_get_handle(&ccm_ipc_handle);
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
index 0000000..309b4de
--- /dev/null
+++ b/drivers/clk/imx/clk-scu.h
@@ -0,0 +1,15 @@
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
+int imx_clk_scu_init(void);
+struct clk_hw *imx_clk_scu(const char *name, u32 rsrc_id, u8 clk_type);
+
+#endif
--=20
2.7.4


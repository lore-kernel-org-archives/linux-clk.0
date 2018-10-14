Return-Path: <SRS0=5HZW=M2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3F7C6787C
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08F6820835
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="kq/X2RW9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08F6820835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbeJNPsX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Oct 2018 11:48:23 -0400
Received: from mail-eopbgr20064.outbound.protection.outlook.com ([40.107.2.64]:63156
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726124AbeJNPsX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Oct 2018 11:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=af0IoBgdJoIJh3hgznEnEZsfw/NbrFq3l4HPsJteh94=;
 b=kq/X2RW93HWWbUK/QnqgBBNTEJgV/V/J1RJ87gODFEECPxW46miTIXSOHMO5FXX8BeEQBUbRE+znRmL6xo6oRTC3JwMrYCTun3FCnQLhQdzFe8jicvRj65yLlA8pKF3GjXJJ+juNBvHzfh47s2DQMx/ZckOnFhFISCvdIYBJDog=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4435.eurprd04.prod.outlook.com (52.135.148.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.26; Sun, 14 Oct 2018 08:07:49 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.027; Sun, 14 Oct 2018
 08:07:49 +0000
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
Subject: [PATCH V4 03/11] clk: imx: scu: add scu clock divider
Thread-Topic: [PATCH V4 03/11] clk: imx: scu: add scu clock divider
Thread-Index: AQHUY5T/CGJq5NUmM068EllqdgynWw==
Date:   Sun, 14 Oct 2018 08:07:49 +0000
Message-ID: <1539504194-28289-4-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4435;6:cOTkiO9KTXfT2Ko+EHleNHxd25HCqeXpKvczKDo/CHLhEamOzsIX2k9xdoi/VJdKxwmMGq4uS8ePnHE2+J/5esUQrmTJJYXiaTzxf5uaei/R0biEahpQKe8s7iAY+cp9ILBptI/Im34nyoKBMEQCoaxt5x0pVZlYA/V90OZQUjoh7ZFSJoBsvg+XKj2LOnUzr1dGM8rJAZvWAc02KHyPbEjTie/rUbFd99GAMZDpUw6kaoo/a+Vd5h6uS6O1TBTDoWFdpWDjrgb91xzO+p9NVQJue+JiEhRwPV/HTwwyS/qav22ggXicCraNJYlPglsaqcmAL5XnCGZM0p27qsOoNTnAkvT0rQkk4NDtD4Q2qR2+JUdDD76suZFpcHdSKuQ4Dmbtoaklz6PzFNafHBUrx0AhQO/WNO5+hH6Q1Tn4oVUuewykvc7St6ObBq3qzsUAeyCH935oxatUaNSvlaA6vA==;5:sV7J42rRNwtMuBKpwyCG9sKavutaOOA/R7LTeCUkZI5OQUmi2d7iXOPBREbXRgO6aJYa1lrjJH2lYvIdTT0ZGUL7OL6oUEqdcs5zQykPUTPB7RAcC6UMRVQb9CO3wbiFQe5KFgoFkVgC1hoHyeRdpn+FIrTVgkR2jMocwUiqklA=;7:cfdgx+K1BgRGeWYbf35uL8JcD9JVGhKmLbbCtnhh3S8q92kRRUjPekCh3Bg4AMzi9JT9tXmEZPB+5UaYqn6U0WXlRgF9jiA/+/56Zen3GGjqAScbkmrewEijVR3c6QOMORsQKWBPnmeImafxMv+vEe1FoZV70xDI7hgsTVf8xA/UaJC4uOtcIY1vHEzQYDTC6EBsleEhZfHCaz8Rpyza7Wh2y+DUaznMcTBOBaMqW0WMgCwK+2Y6v1KzV/BS73PP
x-ms-office365-filtering-correlation-id: b1f26bd7-1597-41f3-77b8-08d631ac219d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4435;
x-ms-traffictypediagnostic: AM0PR04MB4435:
x-microsoft-antispam-prvs: <AM0PR04MB44354131C1827616EB85E43D80FC0@AM0PR04MB4435.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991067);SRVR:AM0PR04MB4435;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4435;
x-forefront-prvs: 08252193F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(396003)(39850400004)(366004)(54534003)(199004)(189003)(6436002)(186003)(76176011)(5640700003)(386003)(6506007)(316002)(36756003)(52116002)(2351001)(99286004)(6512007)(106356001)(6486002)(446003)(26005)(8936002)(11346002)(86362001)(476003)(2616005)(8676002)(5660300001)(102836004)(486006)(81166006)(81156014)(6916009)(4326008)(54906003)(2906002)(66066001)(14444005)(71190400001)(71200400001)(256004)(305945005)(5250100002)(25786009)(2900100001)(97736004)(7736002)(50226002)(68736007)(478600001)(105586002)(3846002)(6116002)(53936002)(2501003)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4435;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: XF9SzqBWcPvYx+PyT8GyguQaDCFblmBeLMlRV2F6ve2SM+q5OAV1xl7Y27W2uDqlhp8Z+0vnEiHjaSqyFtWgYmWPhrI3yy3PNXHd1vssC2P6wCh6iRynbAlAvWAoetcB/DE+oH7e4ZjbZem0lRX6/jKVGAeca00szNLR9SKhFcxlf/ooQo6Dv8j0lyfzBM/hjimu3JUHuRLLYP6vF9xfkzIQZ8CqO8GZp7SOl0NKZLawegTbgGakWE9d1ny535qI01krJna7wo3/vLeQno/KUDNxc4egyG86fzlz3pAAj8JwqZH6uUDGmCYpfsUhZD24FQLMntKxMqcHpcYcEQdzVZJqvfv5m7Ci3X0wWozU0HU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f26bd7-1597-41f3-77b8-08d631ac219d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2018 08:07:49.2381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4435
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add scu based clock divider.

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
 * structures/enums name update with imx_sc prefix
v1->v2:
 * move SCU clock API implementation into driver
---
 drivers/clk/imx/scu/Makefile          |   3 +-
 drivers/clk/imx/scu/clk-divider-scu.c | 176 ++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/scu/clk-scu.h         |  18 ++++
 3 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-divider-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index 7dead13..7e360e2 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
=20
 obj-$(CONFIG_MXC_CLK_SCU) +=3D \
-	clk-scu.o
+	clk-scu.o \
+	clk-divider-scu.o
diff --git a/drivers/clk/imx/scu/clk-divider-scu.c b/drivers/clk/imx/scu/cl=
k-divider-scu.c
new file mode 100644
index 0000000..51cb816
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-divider-scu.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017~2018 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ *
+ */
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/slab.h>
+
+#include "clk-scu.h"
+
+struct clk_divider_scu {
+	struct clk_hw	hw;
+	u32 rsrc_id;
+	u8 clk_type;
+};
+
+/* SCU Clock Protocol definitions */
+struct imx_sc_msg_req_set_clock_rate {
+	struct imx_sc_rpc_msg hdr;
+	u32 rate;
+	u16 resource;
+	u8 clk;
+} __packed;
+
+struct imx_sc_msg_req_get_clock_rate {
+	struct imx_sc_rpc_msg hdr;
+	u16 resource;
+	u8 clk;
+} __packed;
+
+struct imx_sc_msg_resp_get_clock_rate {
+	struct imx_sc_rpc_msg hdr;
+	u32 rate;
+} __packed;
+
+
+static inline struct clk_divider_scu *to_clk_divider_scu(struct clk_hw *hw=
)
+{
+	return container_of(hw, struct clk_divider_scu, hw);
+}
+
+/*
+ * clk_divider_scu_recalc_rate - Get clock rate for a SCU clock
+ * @hw: clock to get rate for
+ * @parent_rate: parent rate provided by common clock framework, not used
+ *
+ * Gets the current clock rate of a SCU clock. Returns the current
+ * clock rate, or zero in failure.
+ */
+static unsigned long clk_divider_scu_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct clk_divider_scu *div =3D to_clk_divider_scu(hw);
+	struct imx_sc_msg_req_get_clock_rate msg;
+	struct imx_sc_msg_resp_get_clock_rate *resp;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+	int ret;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D (uint8_t)IMX_SC_RPC_SVC_PM;
+	hdr->func =3D (uint8_t)IMX_SC_PM_FUNC_GET_CLOCK_RATE;
+	hdr->size =3D 2;
+
+	msg.resource =3D div->rsrc_id;
+	msg.clk =3D div->clk_type;
+
+	ret =3D imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret) {
+		pr_err("%s: failed to get clock rate %d\n",
+			clk_hw_get_name(hw), ret);
+		return 0;
+	}
+
+	resp =3D (struct imx_sc_msg_resp_get_clock_rate *)&msg;
+
+	return resp->rate;
+}
+
+/*
+ * clk_divider_scu_round_rate - Round clock rate for a SCU clock
+ * @hw: clock to round rate for
+ * @rate: rate to round
+ * @parent_rate: parent rate provided by common clock framework, not used
+ *
+ * Gets the current clock rate of a SCU clock. Returns the current
+ * clock rate, or zero in failure.
+ */
+static long clk_divider_scu_round_rate(struct clk_hw *hw, unsigned long ra=
te,
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
+ * clk_divider_scu_set_rate - Set rate for a SCU clock
+ * @hw: clock to change rate for
+ * @rate: target rate for the clock
+ * @parent_rate: rate of the clock parent, not used for SCU clocks
+ *
+ * Sets a clock frequency for a SCU clock. Returns the SCU
+ * protocol status.
+ */
+static int clk_divider_scu_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	struct clk_divider_scu *div =3D to_clk_divider_scu(hw);
+	struct imx_sc_msg_req_set_clock_rate msg;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+	int ret;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D (uint8_t)IMX_SC_RPC_SVC_PM;
+	hdr->func =3D (uint8_t)IMX_SC_PM_FUNC_SET_CLOCK_RATE;
+	hdr->size =3D 3;
+
+	msg.rate =3D rate;
+	msg.resource =3D div->rsrc_id;
+	msg.clk =3D div->clk_type;
+
+	ret =3D imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret)
+		pr_err("%s: failed to set clock rate %ld : ret %d\n",
+			clk_hw_get_name(hw), rate, ret);
+
+	return 0;
+}
+
+static const struct clk_ops clk_divider_scu_ops =3D {
+	.recalc_rate =3D clk_divider_scu_recalc_rate,
+	.round_rate =3D clk_divider_scu_round_rate,
+	.set_rate =3D clk_divider_scu_set_rate,
+};
+
+struct clk_hw *imx_clk_register_divider_scu(const char *name,
+					    const char *parent_name,
+					    u32 rsrc_id,
+					    u8 clk_type)
+{
+	struct clk_divider_scu *div;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	div =3D kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	div->rsrc_id =3D rsrc_id;
+	div->clk_type =3D clk_type;
+
+	init.name =3D name;
+	init.ops =3D &clk_divider_scu_ops;
+	init.flags =3D CLK_GET_RATE_NOCACHE;
+	init.parent_names =3D parent_name ? &parent_name : NULL;
+	init.num_parents =3D parent_name ? 1 : 0;
+	div->hw.init =3D &init;
+
+	hw =3D &div->hw;
+	ret =3D clk_hw_register(NULL, hw);
+	if (ret) {
+		kfree(div);
+		hw =3D ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index b964f35..e99af63 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -7,6 +7,7 @@
 #ifndef __IMX_CLK_SCU_H
 #define __IMX_CLK_SCU_H
=20
+#include <linux/clk-provider.h>
 #include <linux/firmware/imx/sci.h>
 #include <linux/spinlock.h>
=20
@@ -15,4 +16,21 @@ extern struct imx_sc_ipc *ccm_ipc_handle;
=20
 int imx_clk_scu_init(void);
=20
+struct clk_hw *imx_clk_register_divider_scu(const char *name,
+				const char *parent_name, u32 rsrc_id,
+				u8 clk_type);
+
+static inline struct clk_hw *imx_clk_divider_scu(const char *name,
+				u32 rsrc_id, u8 clk_type)
+{
+	return imx_clk_register_divider_scu(name, NULL, rsrc_id, clk_type);
+}
+
+static inline struct clk_hw *imx_clk_divider2_scu(const char *name,
+				const char *parent_name,
+				u32 rsrc_id, u8 clk_type)
+{
+	return imx_clk_register_divider_scu(name, parent_name, rsrc_id, clk_type)=
;
+}
+
 #endif
--=20
2.7.4


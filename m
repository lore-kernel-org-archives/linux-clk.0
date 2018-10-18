Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5332CC5ACCC
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:53:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C5DD2086E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:53:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Xz39XWDY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C5DD2086E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbeJSAzr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 20:55:47 -0400
Received: from mail-eopbgr20040.outbound.protection.outlook.com ([40.107.2.40]:56870
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727294AbeJSAzr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 20:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYAfKztTazO0jGPjl6fp7KkUux2V+kMxaFXoMJlVDqo=;
 b=Xz39XWDYh6l2Frk6NKVQ23v0aD4pU4z0/3/+9QodwzhNz+Ur4DBkH9d4MPI59rOj60b+utzc8/nPvahInNwPEt1sff3YAfgcsjaUI0oW3XKWJciyMvoZWNoIW0T5xaxKO+d60SX7tteqwMdEaRGingbA1dNAMxkV6ZiFGp7URuc=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4001.eurprd04.prod.outlook.com (52.134.90.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Thu, 18 Oct 2018 16:53:53 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.033; Thu, 18 Oct 2018
 16:53:53 +0000
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
Subject: [PATCH V5 3/9] clk: imx: scu: add scu clock divider
Thread-Topic: [PATCH V5 3/9] clk: imx: scu: add scu clock divider
Thread-Index: AQHUZwMmLBHGE351dkm/ZNUVIbE+Cw==
Date:   Thu, 18 Oct 2018 16:53:52 +0000
Message-ID: <1539881347-20871-4-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4001;6:0KkbeyBJFDAO6ohvYxTFrHhy6gfxRLG7/0Gseqo6S4en9NUf959oM+AwabYJBWRcSmMbc45RyxyvVunAvuS8IOamRyEm1iBSrdVjERUKoY8bDW1ChpZpW0OgaWVQSJKatGNnI0e0t7GEmkHhD43f2chQZ4WLYQOLS0K88irew9bgD5wbTcPi752DgzoyMYOBaTmJyaotPKT0vswnyC5p5rr4KlWAyO6jEDQBAF8ifRA411DcB3tzpB7r3wI209JFBqCdxFYdIqG47ecgH/SxzkFzRbOob/DAm1m8TuIi6XqZaAel0pQLxUDKu2uswdB0Gj0gFsZWotFC8Z2NdP5uJQeQW6/C6B3Bn8IA5YZHVhWhK/Je77a8mkuAULR2Xe9zK6aNc39Z4M/f+ItRk0bLKh2YaPvmHkBJZ77umUqnEoyEXqDpV15VEK6zGO31kaoWAPPzcQnjcp5/uZ9GP6PgCA==;5:6EqD1eIAzmbP+/rBzqbVfY8IiVM9s7lQIYvtwIzcn5BKN7AI+AX0AeXaski7NJBJPLBYfUf9ZhK03Gkxzoe6tSxOjk33iiyH5su1wKhS6goo9WJ0ve4Dvf3cB0CLO3//BSph93xiO+IRhNT/CAWP77Xs7jS+9H57qfJj9NALI5Y=;7:dtMv1Vr6nVQTy4Hzr3u1ePFTtffcLwVHeR0Pq99UFhiyXtXvtno4SdbMgwXWSxEok/XCFZ4ymD5SI4z1Exhkr9F/oOe8w0P/UlDlzwHsXC7VJiDAAWi6Uu+ZUVHgTRwfN0EsvjmXKUlQuzju0AJMsBV914Gn7LjKZV6qozhH1DbJKWJ6QCteKqb/asigNkjikDB/xqb0twxMiLSlIiPTjLWTF3Cre6lF5ZUai7X40hxbP4Qg/uTt6jM/t2mXco9n
x-ms-office365-filtering-correlation-id: b7899da5-e8d2-41cb-1061-08d6351a48d1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4001;
x-ms-traffictypediagnostic: AM0PR04MB4001:
x-microsoft-antispam-prvs: <AM0PR04MB400167200AF5CF4C14A519C880F80@AM0PR04MB4001.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(269456686620040)(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4001;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4001;
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(54534003)(14454004)(6486002)(54906003)(53936002)(26005)(5640700003)(2906002)(102836004)(99286004)(2900100001)(97736004)(105586002)(52116002)(106356001)(76176011)(2501003)(6116002)(386003)(6512007)(5250100002)(3846002)(71200400001)(6436002)(71190400001)(2351001)(6506007)(486006)(11346002)(8936002)(36756003)(476003)(81156014)(8676002)(2616005)(446003)(508600001)(81166006)(25786009)(186003)(68736007)(86362001)(4326008)(305945005)(50226002)(256004)(14444005)(6916009)(316002)(6346003)(66066001)(7736002)(5660300001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4001;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-message-info: RC39lvRuytMjdmD7IQim/S6iaOGDxa7PgqpCNBc7u8aqE20u5h3/akDLyDA6lF2i/riO7NotEe36b0cfDX1JACyfb0kY7VkFHJPpzGTu0Na0GqbovLRd8ZRdMKpPvfLgaNoFoKcFc/Yzo4CUWgmY1MQx9oM9d2BCNgDG2n3Fo0lKfWAc8mb3FbGcw53opDhWo4o+Qu0W4RZZN/j6kFTKciuOLhchqX6FvX+gV7oCYWFeUX0+4dTsRljSw713HGhC1Jlu6uO4h8lKjKWdWGVX3w6sMkRUevHQLpPnI5Mpj+JSamTYfis8PulQRH0hFS5LdzkNeMqC8gy199tWi+diZnOdT9ZOQEidi1UPWqelpVw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7899da5-e8d2-41cb-1061-08d6351a48d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 16:53:52.9828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4001
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add scu based clock divider. Note on MX8, the clocks are tightly
coupled with power domain that once the power domain is off, the clock
status will be lost. SO we make it NOCACHE to help user to retrieve the rea=
l
clock status from HW instead of using the possible invalid cached rate.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v4->v5:
 * remove unneeded jiffies.h headfile
 * use union for scu protocol structure to avoid cast
 * remove unnecessary cast
 * add more explanation about the NOCACHE flag in commit message
 * move scu clk files into imx top directory
v3->v4:
 * scu headfile path update
v2->v3:
 * structures/enums name update with imx_sc prefix
v1->v2:
 * move SCU clock API implementation into driver
---
 drivers/clk/imx/Makefile          |   3 +-
 drivers/clk/imx/clk-divider-scu.c | 171 ++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-scu.h         |  18 ++++
 3 files changed, 191 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-divider-scu.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index eec6d72..b01f433 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -14,7 +14,8 @@ obj-$(CONFIG_MXC_CLK) +=3D \
 	clk-pfd.o
=20
 obj-$(CONFIG_MXC_CLK_SCU) +=3D \
-	clk-scu.o
+	clk-scu.o \
+	clk-divider-scu.o
=20
 obj-$(CONFIG_SOC_IMX1)   +=3D clk-imx1.o
 obj-$(CONFIG_SOC_IMX21)  +=3D clk-imx21.o
diff --git a/drivers/clk/imx/clk-divider-scu.c b/drivers/clk/imx/clk-divide=
r-scu.c
new file mode 100644
index 0000000..95d5bd6
--- /dev/null
+++ b/drivers/clk/imx/clk-divider-scu.c
@@ -0,0 +1,171 @@
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
+#include <linux/slab.h>
+
+#include "clk-scu.h"
+
+struct clk_divider_scu {
+	struct clk_hw hw;
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
+struct req_get_clock_rate {
+	u16 resource;
+	u8 clk;
+} __packed;
+
+struct resp_get_clock_rate {
+	u32 rate;
+} __packed;
+
+struct imx_sc_msg_get_clock_rate {
+	struct imx_sc_rpc_msg hdr;
+	union {
+		struct req_get_clock_rate req;
+		struct resp_get_clock_rate resp;
+	} data;
+} __packed;
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
+						 unsigned long parent_rate)
+{
+	struct clk_divider_scu *div =3D to_clk_divider_scu(hw);
+	struct imx_sc_msg_get_clock_rate msg;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+	int ret;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D IMX_SC_RPC_SVC_PM;
+	hdr->func =3D IMX_SC_PM_FUNC_GET_CLOCK_RATE;
+	hdr->size =3D 2;
+
+	msg.data.req.resource =3D div->rsrc_id;
+	msg.data.req.clk =3D div->clk_type;
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
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D IMX_SC_RPC_SVC_PM;
+	hdr->func =3D IMX_SC_PM_FUNC_SET_CLOCK_RATE;
+	hdr->size =3D 3;
+
+	msg.rate =3D rate;
+	msg.resource =3D div->rsrc_id;
+	msg.clk =3D div->clk_type;
+
+	return imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
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
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index b964f35..e99af63 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
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


Return-Path: <SRS0=5HZW=M2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D89CC6787C
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF32B20835
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="XROruGfr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF32B20835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbeJNPsZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Oct 2018 11:48:25 -0400
Received: from mail-eopbgr20064.outbound.protection.outlook.com ([40.107.2.64]:63156
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726124AbeJNPsZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Oct 2018 11:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xovy84/TCIQ9mE9jmnrFA60G59tggLdb+LAA2efctx8=;
 b=XROruGfrGgbWc17ICktKH2YzfC1XQceTkXMnG3FfNRg1zGaig2L0Dtz+ms/yVlGKS0G6co73GfMkA/snOR3kfdI8qiJFRfGOVHCGbj0Ea1HzXXPIfF9ine2dqIMuDcn+D1oTu880xAzM8bxgK2WDdQJ/dwsr6syDW/xF35/SGa8=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4435.eurprd04.prod.outlook.com (52.135.148.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.26; Sun, 14 Oct 2018 08:07:52 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.027; Sun, 14 Oct 2018
 08:07:52 +0000
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
Subject: [PATCH V4 04/11] clk: imx: scu: add scu clock gpr divider
Thread-Topic: [PATCH V4 04/11] clk: imx: scu: add scu clock gpr divider
Thread-Index: AQHUY5UBs3glyi5ii0OPEdutN8EQcg==
Date:   Sun, 14 Oct 2018 08:07:52 +0000
Message-ID: <1539504194-28289-5-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4435;6:FHonSfy9342dSG9JUN5aKnA/9frb+cuGFptxegWLlYT6uKZjEtRE/R7bUXeHJ4xe/k8ypY68yB86btcOqVaEqUW29/ODnDSiWSgQ04D1sxQjKrdD4bqTUVcIDlsWznW1OkOtkTRG94t8r5sr1G5aNCfCE9ReWr42Pw5ces1hYjIupGCVXTnyH1Ael9owHso/SHIMH1Grc10WQ75RDlPsSDWBChq4hcczg7iU3fkWWpkEze87mm/0AxbWismB4/w/z1e8yN521VWIlWiht17yWWIqsGe5lGmIPf9GJH4BT1SH5WXYs5aDgOyodZV8NAhAs5wsi3cEo6HECEWzKfjPe7VIz50CB4Vhcdfz70v0SAunrOTxlL3JUiE7R+VWIUhcQPLTYcU0V4elV3eKjb+LZ3rnkL2MzMyPS/Zb2x5kFSDVHkKS65R8MhLVo0br7W9p6O+6gBeAuRim7WM/ozriPQ==;5:At1OJvQ4JQQd7JfJkTrWnbRyHY2Yp9XQBa/l8C8JdhBJt/Nw5QK8bX3WccKbTLQesCmFXZM6MPVWz4Rd+tWbV6U0qhT5vLrgrJbg+xRYp80kbwM/KwQj46BIiubNH74Bl98ylim2tIlCrK11tei9zyWoSar22HJubwayVtZGPPI=;7:c2my9G+Whg9SbuTuZMQLFluHERFWJHiniiI4ip6hlOQ+UGRxY6sgxqjqs2VjoE7BaQY0I/2g/ipACboGUbV4rjsRHYCMgrNitPumEUmriu3LCQb7v4Zu9sy5b0tyO6y2LWuzIJbr4xvpx10t20mV1pC1CsY+i5y6vi10HkZObGqs9DUOfo3fnAG+8+DLLIVIACbxToeVP6uota9EU7kXk94fiTSf7p4INVAGXulZVF00W3+s3qCPJ6ea1mM8gYCX
x-ms-office365-filtering-correlation-id: 4772b645-0b3e-4851-bb3d-08d631ac23b5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4435;
x-ms-traffictypediagnostic: AM0PR04MB4435:
x-microsoft-antispam-prvs: <AM0PR04MB44352117EC34FCF71D5A366680FC0@AM0PR04MB4435.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991067);SRVR:AM0PR04MB4435;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4435;
x-forefront-prvs: 08252193F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(396003)(39850400004)(366004)(54534003)(199004)(189003)(6436002)(186003)(76176011)(5640700003)(386003)(6506007)(316002)(36756003)(52116002)(2351001)(99286004)(6512007)(106356001)(6486002)(446003)(26005)(8936002)(11346002)(86362001)(476003)(2616005)(8676002)(5660300001)(102836004)(486006)(81166006)(81156014)(6916009)(4326008)(54906003)(2906002)(66066001)(14444005)(71190400001)(71200400001)(256004)(305945005)(5250100002)(25786009)(2900100001)(97736004)(7736002)(50226002)(68736007)(478600001)(105586002)(3846002)(6116002)(53936002)(2501003)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4435;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: lszvkdBse6qJdAce0tc/aGuP3FKpH/L8RZNMReZLFEtsdepRkyast+yzSNlstU7altPfypQutLYeQlKZ3tcDbE/PqccCO7JjBcvtDpUD5YmdsHG025bIpSlt7aRDvEbwh50hs0TzT77Ls+rktqoocBy/Mi0WUblOuwCUX7cVAQFIzVsPOBWDxNJDYduMSO/umtg3BBLpsQAK+Elaxtatc4Xg8FF2HiQDCsUBD3wvdSo3IqdChCrzAHI6aMtcr7i+I6gw04AXEGcnh9kYd20WeTid2Hd1dJ60ZkE6Bup3U3qABI/uoJOKQ+9it4vNC+onQe73OySYcAGbQG9MY/2D7+KAHLJ/0jogFuxEyVNFuMA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4772b645-0b3e-4851-bb3d-08d631ac23b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2018 08:07:52.6404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4435
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add scu based clock gpr divider. Unlike the normal scu divider, such
dividers are controlled by GPR bits through SCU sc_misc_set_control
API.

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
 * structures name and api use update
v1->v2:
 * no changes except update headfile name
---
 drivers/clk/imx/scu/Makefile              |   3 +-
 drivers/clk/imx/scu/clk-divider-gpr-scu.c | 129 ++++++++++++++++++++++++++=
++++
 drivers/clk/imx/scu/clk-scu.h             |   3 +
 3 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-divider-gpr-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index 7e360e2..9e7f4aa 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -2,4 +2,5 @@
=20
 obj-$(CONFIG_MXC_CLK_SCU) +=3D \
 	clk-scu.o \
-	clk-divider-scu.o
+	clk-divider-scu.o \
+	clk-divider-gpr-scu.o
diff --git a/drivers/clk/imx/scu/clk-divider-gpr-scu.c b/drivers/clk/imx/sc=
u/clk-divider-gpr-scu.c
new file mode 100644
index 0000000..95c76dc
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-divider-gpr-scu.c
@@ -0,0 +1,129 @@
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
+struct clk_divider_gpr_scu {
+	struct clk_hw	hw;
+	u32	rsrc_id;
+	u8	gpr_id;
+};
+
+static inline struct clk_divider_gpr_scu *to_clk_divider_gpr_scu(struct cl=
k_hw *hw)
+{
+	return container_of(hw, struct clk_divider_gpr_scu, hw);
+}
+
+/*
+ * clk_divider_scu_recalc_rate - Get clock rate for a SCU clock
+ * @hw: clock to get rate for
+ * @parent_rate: parent rate provided by common clock framework
+ *
+ * Gets the current clock rate of a SCU clock. Returns the current
+ * clock rate, or zero in failure.
+ */
+static unsigned long clk_divider_gpr_scu_recalc_rate(struct clk_hw *hw,
+						     unsigned long parent_rate)
+{
+	struct clk_divider_gpr_scu *clk =3D to_clk_divider_gpr_scu(hw);
+	u32 val;
+	int ret;
+
+	ret =3D imx_sc_misc_get_control(ccm_ipc_handle, clk->rsrc_id,
+				      clk->gpr_id, &val);
+	if (ret) {
+		pr_err("%s: failed to get clock rate %d\n",
+			clk_hw_get_name(hw), ret);
+		return 0;
+	}
+
+	return val ? parent_rate / 2 : parent_rate;
+}
+
+/*
+ * clk_divider_scu_round_rate - Round clock rate for a SCU clock
+ * @hw: clock to round rate for
+ * @rate: rate to round
+ * @parent_rate: parent rate provided by common clock framework
+ *
+ * Round clock rate for a SCU clock according to parent rate
+ */
+static long clk_divider_gpr_scu_round_rate(struct clk_hw *hw, unsigned lon=
g rate,
+					   unsigned long *prate)
+{
+	if (rate < *prate)
+		rate =3D *prate / 2;
+	else
+		rate =3D *prate;
+
+	return rate;
+}
+
+/*
+ * clk_divider_scu_set_rate - Set rate for a SCU clock
+ * @hw: clock to change rate for
+ * @rate: target rate for the clock
+ * @parent_rate: rate of the clock parent
+ *
+ * Sets a clock frequency for a SCU clock. Returns the SCU
+ * protocol status.
+ */
+static int clk_divider_gpr_scu_set_rate(struct clk_hw *hw, unsigned long r=
ate,
+					unsigned long parent_rate)
+{
+	struct clk_divider_gpr_scu *clk =3D to_clk_divider_gpr_scu(hw);
+	uint32_t val;
+
+	val =3D (rate < parent_rate) ? 1 : 0;
+
+	return imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
+				       clk->gpr_id, val);
+}
+
+static const struct clk_ops clk_divider_gpr_scu_ops =3D {
+	.recalc_rate =3D clk_divider_gpr_scu_recalc_rate,
+	.round_rate =3D clk_divider_gpr_scu_round_rate,
+	.set_rate =3D clk_divider_gpr_scu_set_rate,
+};
+
+struct clk_hw *imx_clk_divider_gpr_scu(const char *name, const char *paren=
t_name,
+				       u32 rsrc_id, u8 gpr_id)
+{
+	struct clk_divider_gpr_scu *div;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	div =3D kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	div->rsrc_id =3D rsrc_id;
+	div->gpr_id =3D gpr_id;
+
+	init.name =3D name;
+	init.ops =3D &clk_divider_gpr_scu_ops;
+	init.flags =3D CLK_GET_RATE_NOCACHE;
+	init.parent_names =3D parent_name ? &parent_name : NULL;
+	init.num_parents =3D parent_name ? 1 : 0;
+
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
index e99af63..f0796f3 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -33,4 +33,7 @@ static inline struct clk_hw *imx_clk_divider2_scu(const c=
har *name,
 	return imx_clk_register_divider_scu(name, parent_name, rsrc_id, clk_type)=
;
 }
=20
+struct clk_hw *imx_clk_divider_gpr_scu(const char *name, const char *paren=
t_name,
+				u32 rsrc_id, u8 gpr_id);
+
 #endif
--=20
2.7.4


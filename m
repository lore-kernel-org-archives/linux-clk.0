Return-Path: <SRS0=5HZW=M2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6291CC71122
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2079320835
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="La9pG8R7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2079320835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbeJNPso (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Oct 2018 11:48:44 -0400
Received: from mail-eopbgr20064.outbound.protection.outlook.com ([40.107.2.64]:63156
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726124AbeJNPso (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Oct 2018 11:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zner4AddoSUF1199oTPuquNUkOyiGPKQguWLNqvXfU=;
 b=La9pG8R7LYMN5zqu93/zi5pbxLtjeFVf/jIryTFQNmRhrCXqj5kyjLXcMoCZz9O/mGNYnA8ejYbSQQCyrjHmTRIw2Vb1Ml7jeZL8knvXMVuA40j0PEOgCHuZHrXwWATMRKR3Ry8wJ0SGC3nMWBjMAmV2fLVyXbqtgGMDMw/Qvqk=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4435.eurprd04.prod.outlook.com (52.135.148.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.26; Sun, 14 Oct 2018 08:07:59 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.027; Sun, 14 Oct 2018
 08:07:59 +0000
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
Subject: [PATCH V4 06/11] clk: imx: scu: add scu clock gpr gate
Thread-Topic: [PATCH V4 06/11] clk: imx: scu: add scu clock gpr gate
Thread-Index: AQHUY5UFNI02uV99xUesGHgakyLafg==
Date:   Sun, 14 Oct 2018 08:07:59 +0000
Message-ID: <1539504194-28289-7-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4435;6:NNvKtflKGVniXYoV/U1I5iqY+2CXYp855L4N6Ijyd8o+fNgBQg9WKHfM9Brzh3SNcnO17yMfyPrv0c48V3PtlCgK9TBeKRq1beJh/68JlDh/XR4VeXObvDnnUJ2TIEJ4oaRwFtwTFd45W4+CPjab4LXSopShhz23v5H1AXQJU4duHRdyf9vdL3mlJomfNXVAAjhs43W7k8osAgxqolZWMSzzMls0p0V2PuTZcmFpur8K7XjcV4T8ahO1ICcFOKwLtEf0U1GFFDFe+fEQwYA5+cf3h6s8+2L1Yw35XmpjMgADEWt5bNXX5W5JwmQnsOiGDXlw+RMXtpw/1rIT8E4VX4wE+56iGCwx6ygnM/ZPXqwKgO2di22YzfDSOtv+X4swCZ6qiNOFa7Rke53nNn1PYURdEkMI+WXvUkwxs9EcIqtk7X8jf9vfyeReQALHkRNHYTUmPMn1Retr7PpP1e/w9g==;5:zofhlqJzlSU4xpH2VAeTQvrfKAt8ZqTZqcPQ62q6IKy3C0PXZzI/sDfveSZDstGJlliGAXcjwpPynw7SwRIuReK+SouQsoWsQfyoZ5o5XEbaGUuVRcGmyEZ2RblN7GH2bVUol4Ahp66l+pgk7pzLC6bUe8Qe8BsYjqMJIbRiwKM=;7:01RZI9jWo56a9j36NVPFz1zE0S5rm3osgveLeMtyw3SZYkkOZRZBhFkEXNwQ/DEW6JTmY7aZhZVyyOmgU10IzZNGiRmoER5VOYrcW1Ume/c+hYDG0WfSxysdyne6xLsvzDQLcXCOnAnZCy44JhXio7gxuJhMaC1flrxUG8u9TDHtaheDRdYf0swIfB5aQbX8mFmeigHpWGX+mnaDyEpct50VtnjqE4EsL+QNHkLn2yQeHwLc858REMHlO0cIPpUa
x-ms-office365-filtering-correlation-id: ea5f1725-5678-4c34-74f2-08d631ac27e0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4435;
x-ms-traffictypediagnostic: AM0PR04MB4435:
x-microsoft-antispam-prvs: <AM0PR04MB4435D19522DEB8A1B29E447D80FC0@AM0PR04MB4435.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991067);SRVR:AM0PR04MB4435;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4435;
x-forefront-prvs: 08252193F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(396003)(39850400004)(366004)(54534003)(199004)(189003)(6436002)(186003)(76176011)(5640700003)(386003)(6506007)(316002)(36756003)(52116002)(2351001)(99286004)(6512007)(106356001)(6486002)(446003)(26005)(8936002)(11346002)(86362001)(476003)(2616005)(8676002)(5660300001)(102836004)(486006)(81166006)(81156014)(6916009)(4326008)(54906003)(2906002)(66066001)(14444005)(71190400001)(71200400001)(256004)(305945005)(5250100002)(25786009)(2900100001)(97736004)(7736002)(50226002)(68736007)(478600001)(105586002)(3846002)(6116002)(53936002)(2501003)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4435;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 3qNnYVfdhvr0MkLRCtWLYNE0Yn3uemjh294WPmqJg/zAajgloiuOpAcZ60CMTXsv36CpXWF7keEx1YHgoXz994HDYUa5D4QzNBXO97jiWJ3ZkgmBCgodLnM51czj/aAdG7RFQiYWAqGPMuaIBfavOUyYpDZuJbY33s42w5VnveFWZB92gW/M5MQW292V6+5CyzB133J5HHldzybx5yIMRuLbIhbb2o3KBh1G6NoTL/NctkUuxeiXcz4uGddwXTIsw1qANn9rl7LoOqUdcthCd/ST3ImLoZ/9lqIrhTEZiktBlTS3ILUficZxMjfiAQFxeTdjCPZQhQ9SIQ+5IBq78ZQVxvaPOhWjE34/ZCiuTr4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5f1725-5678-4c34-74f2-08d631ac27e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2018 08:07:59.5763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4435
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add scu based clock gpr gate. Unlike the normal scu gate, such
gates are controlled by GPR bits through SCU sc_misc_set_control
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
 * structure name and api usage update
v1->v2:
 * no changes except update headfile name
---
 drivers/clk/imx/scu/Makefile           |  3 +-
 drivers/clk/imx/scu/clk-gate-gpr-scu.c | 87 ++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/scu/clk-scu.h          |  9 ++++
 3 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-gate-gpr-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index 2abed17..25d3511 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -4,4 +4,5 @@ obj-$(CONFIG_MXC_CLK_SCU) +=3D \
 	clk-scu.o \
 	clk-divider-scu.o \
 	clk-divider-gpr-scu.o \
-	clk-gate-scu.o
+	clk-gate-scu.o \
+	clk-gate-gpr-scu.o
diff --git a/drivers/clk/imx/scu/clk-gate-gpr-scu.c b/drivers/clk/imx/scu/c=
lk-gate-gpr-scu.c
new file mode 100644
index 0000000..fd2700e
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-gate-gpr-scu.c
@@ -0,0 +1,87 @@
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
+struct clk_gate_gpr_scu {
+	struct clk_hw hw;
+	u32	rsrc_id;
+	u8	gpr_id;
+
+	/* default: enable 1 disable 0 */
+	bool	invert;
+};
+
+#define to_clk_gate_gpr_scu(_hw) container_of(_hw, struct clk_gate_gpr_scu=
, hw)
+
+static int clk_gate_gpr_scu_enable(struct clk_hw *hw)
+{
+	struct clk_gate_gpr_scu *gate =3D to_clk_gate_gpr_scu(hw);
+	int ret;
+
+	ret =3D imx_sc_misc_set_control(ccm_ipc_handle, gate->rsrc_id,
+				      gate->gpr_id, !gate->invert);
+	if (ret)
+		pr_err("%s: clk enable failed %d\n", clk_hw_get_name(hw), ret);
+
+	return ret;
+}
+
+static void clk_gate_gpr_scu_disable(struct clk_hw *hw)
+{
+	struct clk_gate_gpr_scu *gate =3D to_clk_gate_gpr_scu(hw);
+	int ret;
+
+	ret  =3D imx_sc_misc_set_control(ccm_ipc_handle, gate->rsrc_id,
+				       gate->gpr_id, gate->invert);
+	if (ret)
+		pr_err("%s: clk disable failed %d\n", clk_hw_get_name(hw), ret);
+}
+
+static const struct clk_ops clk_gate_gpr_scu_ops =3D {
+	.enable =3D clk_gate_gpr_scu_enable,
+	.disable =3D clk_gate_gpr_scu_disable,
+};
+
+struct clk_hw *clk_register_gate_gpr_scu(const char *name, const char *par=
ent_name,
+					 u32 rsrc_id, u8 gpr_id,
+					 bool invert_flag)
+{
+	struct clk_gate_gpr_scu *gate;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	gate->rsrc_id =3D rsrc_id;
+	gate->gpr_id =3D gpr_id;
+	gate->invert =3D invert_flag;
+
+	init.name =3D name;
+	init.ops =3D &clk_gate_gpr_scu_ops;
+	init.parent_names =3D parent_name ? &parent_name : NULL;
+	init.num_parents =3D parent_name ? 1 : 0;
+
+	gate->hw.init =3D &init;
+
+	hw =3D &gate->hw;
+	ret =3D clk_hw_register(NULL, hw);
+	if (ret) {
+		kfree(gate);
+		hw =3D ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index 4ff7837..56338ca 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -59,4 +59,13 @@ static inline struct clk_hw *imx_clk_gate2_scu(const cha=
r *name, const char *par
 	return clk_register_gate2_scu(name, parent, 0, reg, bit_idx, hw_gate);
 }
=20
+struct clk_hw *clk_register_gate_gpr_scu(const char *name, const char *par=
ent_name,
+				u32 rsrc_id, u8 gpr_id, bool invert_flag);
+
+static inline struct clk_hw *imx_clk_gate_gpr_scu(const char *name, const =
char *parent,
+				u32 rsrc_id, u8 gpr_id, bool invert_flag)
+{
+	return clk_register_gate_gpr_scu(name, parent, rsrc_id, gpr_id, invert_fl=
ag);
+}
+
 #endif
--=20
2.7.4


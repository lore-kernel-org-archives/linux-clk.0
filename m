Return-Path: <SRS0=Y0Ip=M6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D2BECDE43
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:54:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 393382086E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Oct 2018 16:54:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="RJ1ZHZQ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 393382086E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727294AbeJSAzv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 20:55:51 -0400
Received: from mail-eopbgr20040.outbound.protection.outlook.com ([40.107.2.40]:56870
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728474AbeJSAzv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 20:55:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kv8o4bTQcJvtIOQhUtPIdg70u3IXXOhrUlIvvQwEAkY=;
 b=RJ1ZHZQ2RK4HmFydNvc8T3o0PdH8gNlGXJNQ0G0WeHwelSG/KuCKaeJlouhz5EP3VgX3uyelW+LScaxJJWhiqizgfZuN25N1NGv3cyoEqd9Un7lage/oQpcbWbi46Jzz6k2HMkKbmmN1VtQx5X1wXcoxIIhaR/eLOdQFa07MKk8=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4001.eurprd04.prod.outlook.com (52.134.90.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Thu, 18 Oct 2018 16:53:56 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.033; Thu, 18 Oct 2018
 16:53:56 +0000
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
Subject: [PATCH V5 4/9] clk: imx: scu: add scu clock gpr divider
Thread-Topic: [PATCH V5 4/9] clk: imx: scu: add scu clock gpr divider
Thread-Index: AQHUZwMo/a6f+M35yEmXKGoj68CimA==
Date:   Thu, 18 Oct 2018 16:53:56 +0000
Message-ID: <1539881347-20871-5-git-send-email-aisheng.dong@nxp.com>
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
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4001;6:BbsANweKHI8excHy0ZVpL3HPwqMBPaaT8KzwdzCUezem8bUVmpvQk7LPuIAhOkNgQ0hjJppgOefPXE8gaK/mhW3xgZISuFTGLEmsocmYWLTbPFs8VEwi/X6ynl4XF0uClXQx1d1liXYD/X/XYvvEZc/4ijO0J/mKnM07/WOqpCNvEB46nZ5L/XulHmxRR93NuWZx/CIDk3Hl6Bu1/4CnluGgWjnl93/I9o3vJwg/HTBNbQ/8j8RZQfcNsbv3foh0OG/+kFeaoebrzNftr644Zw76fJCBw95H7eGZw/39AvzIC5VUP/2Dvi1z8AwKuP1Lm/eHRh1RyTPDdN9c1U8zDSkOAoRkMpLCLJPnNfsJPNIyUmrPL/XiM5aeQ3sch2+FNH0OFAQSkQ9FBkjBfVtq8nucVCfbUznx9wdjOfZSNIMpeByfa+N0L+Bn8Voq2boyQS8eUfAUWG1n8B2TyPYcRA==;5:Z61AeSQO+ytLnHjyvY+eyjrmOMduE+8+XBXt0okE8UZ4VTSb2UYQubgKmX9RhHPgysoskU5G697HVkBvYvN4uBxXj+dYRZWeDyDGDe909m3ZZztEeQ71AGmq543mtLsItOe2uzfItu5SL+tWNpHW4mCScvT0T2vGdT50sCPXfTg=;7:e+DwyL9rAPeau84ITwlT7y1wxwQdOT0Ga5KUjD1MTO0eG21+1mnlqBfwhFYv8mZiZonCo12QpvYxoIYa7r0Y1PoVa4VcoBIqGBt47hktUX5HbnFpqaJYYpPhnwahfdvfZ/5UyX+FEnK/d1zvf/VpggCWlhnu7sHycly46jkAGAFIAWWSIsVlpZjjqHmXHsorEdwx7WVssVi0kFrtbmtOyXEQweSns6Pbaik3IXQYm8zMY2kWenMHSUmoh60Whh4n
x-ms-office365-filtering-correlation-id: 088a87b0-80c6-422a-eb75-08d6351a4af6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4001;
x-ms-traffictypediagnostic: AM0PR04MB4001:
x-microsoft-antispam-prvs: <AM0PR04MB40010523417490B8CBF989AB80F80@AM0PR04MB4001.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:AM0PR04MB4001;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4001;
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(54534003)(14454004)(6486002)(54906003)(53936002)(26005)(5640700003)(2906002)(102836004)(99286004)(2900100001)(97736004)(105586002)(52116002)(106356001)(76176011)(2501003)(6116002)(386003)(6512007)(5250100002)(3846002)(71200400001)(6436002)(71190400001)(2351001)(6506007)(486006)(11346002)(8936002)(36756003)(476003)(81156014)(8676002)(2616005)(446003)(508600001)(81166006)(25786009)(186003)(68736007)(86362001)(4326008)(305945005)(50226002)(256004)(14444005)(6916009)(316002)(6346003)(66066001)(7736002)(5660300001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4001;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-message-info: HVjE0rjaDF27ngKy4FTozIDjv11j4XMakIlkxJH7fQ1LKD8dsVKPoNPYfhiv3b6e201gcSoHe6ljlphO54/jJgunNZZHPAR9xGOXJc9H6P2kG6ATuyN5q/aSmPQgwod21VfDRgwKcfjIdUUIaU5mUbF78ekDMzOvv5SffropY4P2xqoNIeqFSmw2tr06Cy8b3ebl9MNzY+2NOnWfLFYnxP2FcTQp9UaeUd4Ftbkdg2ev2GUhL/tCVP8VbPximaySMKPCagWP65qY/evb+rgpZR9qFZyvdajPy5UyJNpRSTcRdStni9sbEU8mf3TQli0idz/MMSk0nYq6m++dvwdhBlFQhCpdSMQRn6US1STohsY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088a87b0-80c6-422a-eb75-08d6351a4af6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 16:53:56.5854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4001
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
v4->v5:
 * a few minor improvements suggested by Stephen
 * move scu clk files into imx top directory
v3->v4:
 * scu headfile path update
v2->v3:
 * structures name and api use update
v1->v2:
 * no changes except update headfile name
---
 drivers/clk/imx/Makefile              |   3 +-
 drivers/clk/imx/clk-divider-gpr-scu.c | 130 ++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk-scu.h             |   3 +
 3 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-divider-gpr-scu.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index b01f433..5ffcb71 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -15,7 +15,8 @@ obj-$(CONFIG_MXC_CLK) +=3D \
=20
 obj-$(CONFIG_MXC_CLK_SCU) +=3D \
 	clk-scu.o \
-	clk-divider-scu.o
+	clk-divider-scu.o \
+	clk-divider-gpr-scu.o
=20
 obj-$(CONFIG_SOC_IMX1)   +=3D clk-imx1.o
 obj-$(CONFIG_SOC_IMX21)  +=3D clk-imx21.o
diff --git a/drivers/clk/imx/clk-divider-gpr-scu.c b/drivers/clk/imx/clk-di=
vider-gpr-scu.c
new file mode 100644
index 0000000..2fc5c25
--- /dev/null
+++ b/drivers/clk/imx/clk-divider-gpr-scu.c
@@ -0,0 +1,130 @@
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
+	struct clk_hw hw;
+	u32 rsrc_id;
+	u8 gpr_id;
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
+	u32 val =3D 0;
+
+	if (rate < parent_rate)
+		val =3D 1;
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
diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
index e99af63..f0796f3 100644
--- a/drivers/clk/imx/clk-scu.h
+++ b/drivers/clk/imx/clk-scu.h
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


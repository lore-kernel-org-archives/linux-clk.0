Return-Path: <SRS0=Ml2J=PQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47D3C43387
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 09:00:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E6D3206B6
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 09:00:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="LoZYt8BL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbfAHJAx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Jan 2019 04:00:53 -0500
Received: from mail-eopbgr60047.outbound.protection.outlook.com ([40.107.6.47]:37293
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726333AbfAHJAw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 8 Jan 2019 04:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydjK6s2UOqVGxfXhn7QweNsjdu7dwKVS+eJJaY/ydHY=;
 b=LoZYt8BLrmhQVywNi/CN/b6wRQwSsmXUtLA9qBSUZjyncU5Q/xA9BhTsfP++wxu2odx0bsIPwGg1Y3vtmk9ve/iXQ1c1H95z5ld8vqAtVATzKacSQacDxEXFQKm0KFWoSRBqQyyzb5DoZ++OxcBP0WYm1aCBJmhaSR+dJX2RbCE=
Received: from VI1PR0402MB3519.eurprd04.prod.outlook.com (52.134.4.24) by
 VI1PR0402MB2736.eurprd04.prod.outlook.com (10.175.22.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.6; Tue, 8 Jan 2019 09:00:45 +0000
Received: from VI1PR0402MB3519.eurprd04.prod.outlook.com
 ([fe80::5d51:a6f6:df78:87e]) by VI1PR0402MB3519.eurprd04.prod.outlook.com
 ([fe80::5d51:a6f6:df78:87e%5]) with mapi id 15.20.1495.011; Tue, 8 Jan 2019
 09:00:45 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     Fabio Estevam <fabio.estevam@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH 1/3] clk: imx: Add PLLs driver for imx8mm soc
Thread-Topic: [PATCH 1/3] clk: imx: Add PLLs driver for imx8mm soc
Thread-Index: AQHUpzCk4T8BTNGyR0q6Q1fWz83NOQ==
Date:   Tue, 8 Jan 2019 09:00:45 +0000
Message-ID: <1546938317-23203-1-git-send-email-ping.bai@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 1.9.1
x-clientproxiedby: HK2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:202:16::12) To VI1PR0402MB3519.eurprd04.prod.outlook.com
 (2603:10a6:803:8::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ping.bai@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;VI1PR0402MB2736;6:eZb+vkhL1bDtIRMSNmiPRCjQ71CC1q1qEmdgsnbFK6VQkunyQtySatrU2iy0aTd9BStctlvxyM0d1NtEvWcrD/cdwu6Fzo7bNPvxtmtxdzKwFi9Vo5/jL34zjERYLf0Hyc+4mFuOLY5QMkrr7RUhm7aPwn/J4fDgrgJSqFR2OGYBjztdeysZzC5YurSBr6mV1q+WmHlrIfsl86Nl5LVLO8ppZFxUoRpsYK65jxwwZOInXu37/G+OPT1L1M739D939SFQbL5pl3zWlHL6T1ob9gDlxccyozWSQdGOBQ7DV8ZrsjeW9VxzPKOGKdeejTqlyElFRWE7/uuVPv0O3R/KY/eH0vxA9xHb8gsYRzbp5Wu0kxqChtBNrkGVe+0cGbzwJaQ6y77Y4XZhC+WU6sTf9IYMinK4HK7asAErje3zY8lVG1D6X4jfOqZqWx4ilAtVMh0Xwtf6adbJYoSq43UrGQ==;5:uq4GDepm0qIW/06Ya36GDnWekXjX9/u3bp1nBCvOgzoCDxyDbO7tep+ba2jrvMYjdn2kELjfUk9Q5EI5xVc5U8GG0WT5A0vg8yjaBCmSWsyITkEMjLDHYTRwT3w2s4nlrUZi9ID+kQLW1fShE5Kp6NDV7iPHBeNhJVr/bp1CUos75DoJTcearldX6TnBBygORM3nm/fJRlg2cZMKS5u4IQ==;7:jbXpglBkmSepNbqHlp5j4PD3TbbSE2imTkA05HoTyBrTh4/ZloJ4qqoMcFuoihJ0O48+3HhELkLs6jgEut3IggsDE89LdNrj7vDPThX1wNkLvrCqMwxbekdoGvbUxIXBD0Tuq/LKYsxT2oBsydekBQ==
x-ms-office365-filtering-correlation-id: 338062fd-22b2-4f71-7448-08d67547c637
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR0402MB2736;
x-ms-traffictypediagnostic: VI1PR0402MB2736:
x-microsoft-antispam-prvs: <VI1PR0402MB2736F6C813A1C6C2F359615A878A0@VI1PR0402MB2736.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(93006095)(93001095)(3231475)(944501520)(52105112)(3002001)(10201501046)(6055026)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:VI1PR0402MB2736;BCL:0;PCL:0;RULEID:;SRVR:VI1PR0402MB2736;
x-forefront-prvs: 0911D5CE78
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(376002)(136003)(346002)(39860400002)(199004)(189003)(66066001)(50226002)(14444005)(186003)(256004)(476003)(2616005)(2501003)(5660300001)(486006)(575784001)(4744004)(478600001)(36756003)(102836004)(86362001)(25786009)(8936002)(71190400001)(71200400001)(81166006)(81156014)(26005)(8676002)(2906002)(68736007)(106356001)(6486002)(6436002)(4326008)(97736004)(14454004)(54906003)(53936002)(110136005)(52116002)(305945005)(6512007)(7736002)(3846002)(6116002)(316002)(105586002)(99286004)(386003)(6506007)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB2736;H:VI1PR0402MB3519.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e4oHhFsKk1S+llwA/jFMffcPSzC5Xvp/dgioXgF3OznafHyOlnbW06M/EoZMLT/vHKhaePUmoJPGhlS45OmU5r/VTtHfbMkzSB23A4YBkKd0+bc5AsQMnTQzGqehbXdLQhJU1JEyzKz/ta3NNuFtRyxPFWhsE2TQXreDc1ESNPAOLiiDHY+RwQFyAYPivKgVoJMcwc3VhGGJ/+esCspxx95ZBL1tSRrScHYfvFUPKicV/rUc/ThGUOkJ+9nIRg5IIr0CmTncBjZYhCd0uTz6WqOqEhe1/z+5Qtu5xG52gH9yDTQIivnUUAPqA6rldQ7A
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 338062fd-22b2-4f71-7448-08d67547c637
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2019 09:00:41.3900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2736
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

New PLLs are introduced on i.MX8M Mini SOC.
PLL1416X is Integer PLL, PLL1443X is a Frac PLL.

Signed-off-by: Bai Ping <ping.bai@nxp.com>
---
 drivers/clk/imx/Makefile      |   3 +-
 drivers/clk/imx/clk-pll14xx.c | 409 ++++++++++++++++++++++++++++++++++++++=
++++
 drivers/clk/imx/clk.h         |  23 +++
 3 files changed, 434 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/clk-pll14xx.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 73119fb..ff74287 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -18,7 +18,8 @@ obj-$(CONFIG_MXC_CLK) +=3D \
 	clk-pllv2.o \
 	clk-pllv3.o \
 	clk-pllv4.o \
-	clk-sccg-pll.o
+	clk-sccg-pll.o \
+	clk-pll14xx.o
=20
 obj-$(CONFIG_MXC_CLK_SCU) +=3D \
 	clk-scu.o \
diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
new file mode 100644
index 0000000..c9f83fd
--- /dev/null
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -0,0 +1,409 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2017-2018 NXP.
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/jiffies.h>
+
+#include "clk.h"
+
+#define GNRL_CTL	0x0
+#define DIV_CTL		0x4
+#define LOCK_STATUS	BIT(31)
+#define LOCK_SEL_MASK	BIT(29)
+#define CLKE_MASK	BIT(11)
+#define RST_MASK	BIT(9)
+#define BYPASS_MASK	BIT(4)
+#define MDIV_SHIFT	12
+#define MDIV_MASK	GENMASK(21, 12)
+#define PDIV_SHIFT	4
+#define PDIV_MASK	GENMASK(9, 4)
+#define SDIV_SHIFT	0
+#define SDIV_MASK	GENMASK(2, 0)
+#define KDIV_SHIFT	0
+#define KDIV_MASK	GENMASK(15, 0)
+
+struct clk_pll14xx {
+	struct clk_hw			hw;
+	void __iomem			*base;
+	enum imx_pll14xx_type		type;
+	struct imx_pll14xx_rate_table	*rate_table;
+	int rate_count;
+};
+
+#define to_clk_pll14xx(_hw) container_of(_hw, struct clk_pll14xx, hw)
+
+static const struct imx_pll14xx_rate_table *imx_get_pll_settings(
+		struct clk_pll14xx *pll, unsigned long rate)
+{
+	const struct imx_pll14xx_rate_table *rate_table =3D pll->rate_table;
+	int i;
+
+	for (i =3D 0; i < pll->rate_count; i++) {
+		if (rate =3D=3D rate_table[i].rate)
+			return &rate_table[i];
+	}
+
+	return NULL;
+}
+
+static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
+			unsigned long *prate)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	const struct imx_pll14xx_rate_table *rate_table =3D pll->rate_table;
+	int i;
+
+	/* Assumming rate_table is in descending order */
+	for (i =3D 0; i < pll->rate_count; i++) {
+		if (rate >=3D rate_table[i].rate)
+			return rate_table[i].rate;
+	}
+	/* return minimum supported value */
+	return rate_table[i - 1].rate;
+}
+
+static unsigned long clk_pll1416x_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	u32 mdiv, pdiv, sdiv, pll_gnrl, pll_div;
+	u64 fvco =3D parent_rate;
+
+	pll_gnrl =3D readl_relaxed(pll->base);
+	pll_div =3D readl_relaxed(pll->base + 4);
+	mdiv =3D (pll_div & MDIV_MASK) >> MDIV_SHIFT;
+	pdiv =3D (pll_div & PDIV_MASK) >> PDIV_SHIFT;
+	sdiv =3D (pll_div & SDIV_MASK) >> SDIV_SHIFT;
+
+	fvco *=3D mdiv;
+	do_div(fvco, pdiv << sdiv);
+
+	return (unsigned long)fvco;
+}
+
+static unsigned long clk_pll1443x_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	u32 mdiv, pdiv, sdiv, pll_gnrl, pll_div_ctl0, pll_div_ctl1;
+	short int kdiv;
+	u64 fvco =3D parent_rate;
+
+	pll_gnrl =3D readl_relaxed(pll->base);
+	pll_div_ctl0 =3D readl_relaxed(pll->base + 4);
+	pll_div_ctl1 =3D readl_relaxed(pll->base + 8);
+	mdiv =3D (pll_div_ctl0 & MDIV_MASK) >> MDIV_SHIFT;
+	pdiv =3D (pll_div_ctl0 & PDIV_MASK) >> PDIV_SHIFT;
+	sdiv =3D (pll_div_ctl0 & SDIV_MASK) >> SDIV_SHIFT;
+	kdiv =3D pll_div_ctl1 & KDIV_MASK;
+
+	/* fvco =3D (m * 65536 + k) * Fin / (p * 65536) */
+	fvco *=3D (mdiv * 65536 + kdiv);
+	pdiv *=3D 65536;
+
+	do_div(fvco, pdiv << sdiv);
+
+	return (unsigned long)fvco;
+}
+
+static inline bool clk_pll1416x_mp_change(const struct imx_pll14xx_rate_ta=
ble *rate,
+					  u32 pll_div)
+{
+	u32 old_mdiv, old_pdiv;
+
+	old_mdiv =3D (pll_div >> MDIV_SHIFT) & MDIV_MASK;
+	old_pdiv =3D (pll_div >> PDIV_SHIFT) & PDIV_MASK;
+
+	return (rate->mdiv !=3D old_mdiv || rate->pdiv !=3D old_pdiv);
+}
+
+static inline bool clk_pll1443x_mpk_change(const struct imx_pll14xx_rate_t=
able *rate,
+					  u32 pll_div_ctl0, u32 pll_div_ctl1)
+{
+	u32 old_mdiv, old_pdiv, old_kdiv;
+
+	old_mdiv =3D (pll_div_ctl0 >> MDIV_SHIFT) & MDIV_MASK;
+	old_pdiv =3D (pll_div_ctl0 >> PDIV_SHIFT) & PDIV_MASK;
+	old_kdiv =3D (pll_div_ctl1 >> KDIV_SHIFT) & KDIV_MASK;
+
+	return (rate->mdiv !=3D old_mdiv || rate->pdiv !=3D old_pdiv ||
+		rate->kdiv !=3D old_kdiv);
+}
+
+static inline bool clk_pll1443x_mp_change(const struct imx_pll14xx_rate_ta=
ble *rate,
+					  u32 pll_div_ctl0, u32 pll_div_ctl1)
+{
+	u32 old_mdiv, old_pdiv, old_kdiv;
+
+	old_mdiv =3D (pll_div_ctl0 >> MDIV_SHIFT) & MDIV_MASK;
+	old_pdiv =3D (pll_div_ctl0 >> PDIV_SHIFT) & PDIV_MASK;
+	old_kdiv =3D (pll_div_ctl1 >> KDIV_SHIFT) & KDIV_MASK;
+
+	return (rate->mdiv !=3D old_mdiv || rate->pdiv !=3D old_pdiv ||
+		rate->kdiv !=3D old_kdiv);
+}
+
+static int clk_pll14xx_wait_lock(struct clk_pll14xx *pll)
+{
+	unsigned long timeout =3D jiffies + msecs_to_jiffies(10);
+
+	/* Wait for PLL to lock */
+	do {
+		if (readl_relaxed(pll->base) & LOCK_STATUS)
+			break;
+		if (time_after(jiffies, timeout))
+			break;
+	} while (1);
+
+	return readl_relaxed(pll->base) & LOCK_STATUS ? 0 : -ETIMEDOUT;
+}
+
+static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
+				 unsigned long prate)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	const struct imx_pll14xx_rate_table *rate;
+	u32 tmp, div_val;
+	int ret;
+
+	rate =3D imx_get_pll_settings(pll, drate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+		       drate, clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	tmp =3D readl_relaxed(pll->base + 4);
+
+	if (!clk_pll1416x_mp_change(rate, tmp)) {
+		tmp &=3D ~(SDIV_MASK) << SDIV_SHIFT;
+		tmp |=3D rate->sdiv << SDIV_SHIFT;
+		writel_relaxed(tmp, pll->base + 4);
+
+		return 0;
+	}
+
+	/* Bypass clock and set lock to pll output lock */
+	tmp =3D readl_relaxed(pll->base);
+	tmp |=3D LOCK_SEL_MASK;
+	writel_relaxed(tmp, pll->base);
+
+	/* Enable RST */
+	tmp &=3D ~RST_MASK;
+	writel_relaxed(tmp, pll->base);
+
+	div_val =3D (rate->mdiv << MDIV_SHIFT) | (rate->pdiv << PDIV_SHIFT) |
+		(rate->sdiv << SDIV_SHIFT);
+	writel_relaxed(div_val, pll->base + 0x4);
+
+	/*
+	 * According to SPEC, t3 - t2 need to be greater than
+	 * 1us and 1/FREF, respectively.
+	 * FREF is FIN / Prediv, the prediv is [1, 63], so choose
+	 * 3us.
+	 */
+	udelay(3);
+
+	/* Disable RST */
+	tmp |=3D RST_MASK;
+	writel_relaxed(tmp, pll->base);
+
+	/* Wait Lock */
+	ret =3D clk_pll14xx_wait_lock(pll);
+	if (ret)
+		return ret;
+
+	/* Bypass */
+	tmp &=3D ~BYPASS_MASK;
+	writel_relaxed(tmp, pll->base);
+
+	return 0;
+}
+
+static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
+				 unsigned long prate)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	const struct imx_pll14xx_rate_table *rate;
+	u32 tmp, div_val;
+	int ret;
+
+	rate =3D imx_get_pll_settings(pll, drate);
+	if (!rate) {
+		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
+			drate, clk_hw_get_name(hw));
+		return -EINVAL;
+	}
+
+	tmp =3D readl_relaxed(pll->base + 4);
+	div_val =3D readl_relaxed(pll->base + 8);
+
+	if (!clk_pll1443x_mpk_change(rate, tmp, div_val)) {
+		tmp &=3D ~(SDIV_MASK) << SDIV_SHIFT;
+		tmp |=3D rate->sdiv << SDIV_SHIFT;
+		writel_relaxed(tmp, pll->base + 4);
+
+		return 0;
+	}
+
+	/* Enable RST */
+	tmp =3D readl_relaxed(pll->base);
+	tmp &=3D ~RST_MASK;
+	writel_relaxed(tmp, pll->base);
+
+	div_val =3D (rate->mdiv << MDIV_SHIFT) | (rate->pdiv << PDIV_SHIFT) |
+		(rate->sdiv << SDIV_SHIFT);
+	writel_relaxed(div_val, pll->base + 0x4);
+	writel_relaxed(rate->kdiv << KDIV_SHIFT, pll->base + 0x8);
+
+	/*
+	 * According to SPEC, t3 - t2 need to be greater than
+	 * 1us and 1/FREF, respectively.
+	 * FREF is FIN / Prediv, the prediv is [1, 63], so choose
+	 * 3us.
+	 */
+	udelay(3);
+
+	/* Disable RST */
+	tmp |=3D RST_MASK;
+	writel_relaxed(tmp, pll->base);
+
+	/* Wait Lock*/
+	ret =3D clk_pll14xx_wait_lock(pll);
+	if (ret)
+		return ret;
+
+	/* Bypass */
+	tmp &=3D ~BYPASS_MASK;
+	writel_relaxed(tmp, pll->base);
+
+	return 0;
+}
+
+static int clk_pll14xx_prepare(struct clk_hw *hw)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	u32 val;
+
+	/*
+	 * RESETB =3D 1 from 0, PLL starts its normal
+	 * operation after lock time
+	 */
+	val =3D readl_relaxed(pll->base + GNRL_CTL);
+	val |=3D RST_MASK;
+	writel_relaxed(val, pll->base + GNRL_CTL);
+
+	return clk_pll14xx_wait_lock(pll);
+}
+
+static int clk_pll14xx_is_prepared(struct clk_hw *hw)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	u32 val;
+
+	val =3D readl_relaxed(pll->base + GNRL_CTL);
+
+	return (val & RST_MASK) ? 1 : 0;
+}
+
+static void clk_pll14xx_unprepare(struct clk_hw *hw)
+{
+	struct clk_pll14xx *pll =3D to_clk_pll14xx(hw);
+	u32 val;
+
+	/*
+	 * Set RST to 0, power down mode is enabled and
+	 * every digital block is reset
+	 */
+	val =3D readl_relaxed(pll->base + GNRL_CTL);
+	val &=3D ~RST_MASK;
+	writel_relaxed(val, pll->base + GNRL_CTL);
+}
+
+static const struct clk_ops clk_pll1416x_ops =3D {
+	.prepare	=3D clk_pll14xx_prepare,
+	.unprepare	=3D clk_pll14xx_unprepare,
+	.is_prepared	=3D clk_pll14xx_is_prepared,
+	.recalc_rate	=3D clk_pll1416x_recalc_rate,
+	.round_rate	=3D clk_pll14xx_round_rate,
+	.set_rate	=3D clk_pll1416x_set_rate,
+};
+
+static const struct clk_ops clk_pll1416x_min_ops =3D {
+	.recalc_rate	=3D clk_pll1416x_recalc_rate,
+};
+
+static const struct clk_ops clk_pll1443x_ops =3D {
+	.prepare	=3D clk_pll14xx_prepare,
+	.unprepare	=3D clk_pll14xx_unprepare,
+	.is_prepared	=3D clk_pll14xx_is_prepared,
+	.recalc_rate	=3D clk_pll1443x_recalc_rate,
+	.round_rate	=3D clk_pll14xx_round_rate,
+	.set_rate	=3D clk_pll1443x_set_rate,
+};
+
+struct clk *imx_clk_pll14xx(const char *name, const char *parent_name,
+			    void __iomem *base,
+			    const struct imx_pll14xx_clk *pll_clk)
+{
+	struct clk_pll14xx *pll;
+	struct clk *clk;
+	struct clk_init_data init;
+	int len;
+
+	pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
+	init.name =3D name;
+	init.flags =3D pll_clk->flags;
+	init.parent_names =3D &parent_name;
+	init.num_parents =3D 1;
+
+	if (pll_clk->rate_table) {
+		for (len =3D 0; pll_clk->rate_table[len].rate !=3D 0; )
+			len++;
+
+		pll->rate_count =3D len;
+		pll->rate_table =3D kmemdup(pll_clk->rate_table,
+					  pll->rate_count *
+					  sizeof(struct imx_pll14xx_rate_table),
+					  GFP_KERNEL);
+		WARN(!pll->rate_table, "%s : could not alloc rate table\n", __func__);
+	}
+
+	switch (pll_clk->type) {
+	case PLL_1416X:
+		if (!pll->rate_table)
+			init.ops =3D &clk_pll1416x_min_ops;
+		else
+			init.ops =3D &clk_pll1416x_ops;
+		break;
+	case PLL_1443X:
+		init.ops =3D &clk_pll1443x_ops;
+		break;
+	default:
+		pr_err("%s: Unknown pll type for pll clk %s\n",
+		       __func__, name);
+	};
+
+	pll->base =3D base;
+	pll->hw.init =3D &init;
+	pll->type =3D pll_clk->type;
+
+	clk =3D clk_register(NULL, &pll->hw);
+	if (IS_ERR(clk)) {
+		pr_err("%s: failed to register pll %s %lu\n",
+			__func__, name, PTR_ERR(clk));
+		kfree(pll);
+	}
+
+	return clk;
+}
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 028312d..27372f7 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -27,6 +27,29 @@ enum imx_sccg_pll_type {
 	SCCG_PLL2,
 };
=20
+enum imx_pll14xx_type {
+	PLL_1416X,
+	PLL_1443X,
+};
+
+/* NOTE: Rate table should be kept sorted in descending order. */
+struct imx_pll14xx_rate_table {
+	unsigned int rate;
+	unsigned int pdiv;
+	unsigned int mdiv;
+	unsigned int sdiv;
+	unsigned int kdiv;
+};
+
+struct imx_pll14xx_clk {
+	enum imx_pll14xx_type type;
+	const struct imx_pll14xx_rate_table *rate_table;
+	int flags;
+};
+
+struct clk *imx_clk_pll14xx(const char *name, const char *parent_name,
+		 void __iomem *base, const struct imx_pll14xx_clk *pll_clk);
+
 struct clk *imx_clk_pllv1(enum imx_pllv1_type type, const char *name,
 		const char *parent, void __iomem *base);
=20
--=20
1.9.1


Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D966FC4360F
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 18:04:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E62C20836
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 18:04:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="LUvZB0TS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728554AbfBUSEf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 13:04:35 -0500
Received: from mail-eopbgr40082.outbound.protection.outlook.com ([40.107.4.82]:38912
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726146AbfBUSEe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 13:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dG/Lu3lEcktBKnjcHI2oMO7uD9T1zCup8IkgEFOJvWU=;
 b=LUvZB0TSNpex/Fzcgtpz8xLEHENIN5Lb6eAwDi2zm1yw3SUnppypMu95U2j+/FRTphLh6G2RX7R4x5GOCQ7mFhog9nVpsxwRvVKcbJCsf2vJq4DKgRnL8UUs41LavysKwLjSleP10WoWutOHEVorQ15U1va4T/4DBwrsnEdMQrY=
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (52.134.31.21) by
 VI1PR04MB1663.eurprd04.prod.outlook.com (10.164.85.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.18; Thu, 21 Feb 2019 18:03:54 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::b1cb:82a5:aacb:238d]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::b1cb:82a5:aacb:238d%6]) with mapi id 15.20.1643.014; Thu, 21 Feb 2019
 18:03:54 +0000
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
Subject: [PATCH 4/4] clk: imx: imx8qxp-lpcg: add parsing clocks from device
 tree
Thread-Topic: [PATCH 4/4] clk: imx: imx8qxp-lpcg: add parsing clocks from
 device tree
Thread-Index: AQHUyg/OXauWfdVZQ0K2EXeEbwi2Cg==
Date:   Thu, 21 Feb 2019 18:03:54 +0000
Message-ID: <1550771836-10014-5-git-send-email-aisheng.dong@nxp.com>
References: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR04CA0044.apcprd04.prod.outlook.com
 (2603:1096:202:14::12) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:3e::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a685bf21-8b64-4987-2763-08d69826f139
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR04MB1663;
x-ms-traffictypediagnostic: VI1PR04MB1663:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1;VI1PR04MB1663;23:J/dRCsgaxWLtgVG/bQV5bjFpCGIKYM9HUaRN29p?=
 =?iso-8859-1?Q?2eWzOpF0ogkEHo9wUCLP8SkD+yTNbbOKh1lN8s+cyjrpIwlVg8iSELsSOT?=
 =?iso-8859-1?Q?2Z72TfwJKn9037twF6K7cVlxqXFlA/5/4cxsCnejjp7q+Ad0DdAYkojLD6?=
 =?iso-8859-1?Q?sJEAwS72Nx9do5MdITvBlNYHC7GEi9Og3z+uCnryTsz7k2aSSsycPy5mlZ?=
 =?iso-8859-1?Q?xH26rP/+EoMtz5VvaJfgP3FRtfh0iYz4ERSjL0Cu9d6o0ACo2U/zSLslbd?=
 =?iso-8859-1?Q?HtV1wikXrI/DcD4fSnmx0UgFqWhrnIqEOFp7ZbUy7oJ/gD/Oy73lTfDhSF?=
 =?iso-8859-1?Q?JxsuqzC1ewQbntbhnVMqe3Ww7lYSbNGcAo+ozMr5gtmxEJgJhgLoboFnb1?=
 =?iso-8859-1?Q?nG2Z+ua7ls3i7/RDfy/xOsmO0qkrsHaix9J897L7sYi4VtKWkHxLD0zfZZ?=
 =?iso-8859-1?Q?lImJnnEc27eyca+DJUlzco0FbJQ40YhA3aEYP7c1NVX9Oi5h1biD+4WfNA?=
 =?iso-8859-1?Q?w4v3HN/dlj2RHJxtTLVRfqMiIie1Ra2GcGUTVMi5FthXCBcEEXEh0Apd9R?=
 =?iso-8859-1?Q?RS+/NBEMNFeCT+RkMUunAJdNJCuQUlz01/T1QZxEha9tWil2HGbzJ/SRuM?=
 =?iso-8859-1?Q?kTsa1+2X6CS0w2AS0oe2wUuq9jmRrSabIVC1V2WotRx30AsNVKLkFN7vfK?=
 =?iso-8859-1?Q?gIEe8BWkesyVAEB63HmXTYk4Z6NcYkX2AH86FvEKCYGUTWe+ZABranTo9y?=
 =?iso-8859-1?Q?1l0Un71gWmTahwkLteD30lZm0QQrpnLT63+SH/V5EUUuqj4Sd0MNnECTSx?=
 =?iso-8859-1?Q?uGsEbIc6rLvKgYT8qCB/JkUwu1A8LH/ek/LVCsfStIwf8Sy81wterOp0LH?=
 =?iso-8859-1?Q?WGBSaW53sbD7C/6AhE7CSkaTYKzy+G5UyEHz98r+HX4GheNG50NynRHx9h?=
 =?iso-8859-1?Q?C7JQ7dDb7q+zY9t2ogSRkD9tjAElTXiWDNdTfrfPRL0aaytK7Fx51rNYYy?=
 =?iso-8859-1?Q?7atgOcoLRCsAVrkHMg2xgTRBBro29dyDPRshqJuvS2a3QMmMQLvFURIAJI?=
 =?iso-8859-1?Q?YxWbLJoF2S+jcTTlin8Tm9fsQ9X35qLUFaPHiIRsyWgJwcRCkQULwN47NV?=
 =?iso-8859-1?Q?BJhNB2NCtIrS2o5PjirO1ThoJYloaC0b5TgXz8+9IE1+fDpJvm5zlH5+4q?=
 =?iso-8859-1?Q?NL94O7qNEd+yVN8Crs1nXUNxIBRXCWzIkZeGvc8W6DNPuxfGryamqYsENK?=
 =?iso-8859-1?Q?cMREyG6T8XoGPqDvpitmLV2Xc6fXY7tHJa5bnXBjW2tvupAcE6EcuzB4gD?=
 =?iso-8859-1?Q?YcoYJPRx4eecnBurpk++VmkjsiLtPbX6b6lpUWSxdsQFQ=3D=3D?=
x-microsoft-antispam-prvs: <VI1PR04MB1663D9FE04A6098966D1A6A2807E0@VI1PR04MB1663.eurprd04.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(366004)(39860400002)(346002)(189003)(199004)(2906002)(8936002)(186003)(81156014)(4326008)(71200400001)(71190400001)(6506007)(97736004)(99286004)(102836004)(26005)(50226002)(2351001)(6512007)(68736007)(81166006)(386003)(3846002)(14454004)(6116002)(476003)(316002)(8676002)(5660300002)(478600001)(54906003)(2616005)(25786009)(44832011)(36756003)(305945005)(446003)(105586002)(106356001)(6486002)(486006)(76176011)(7736002)(53936002)(66066001)(52116002)(256004)(2501003)(6436002)(5640700003)(11346002)(6916009)(86362001)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB1663;H:VI1PR04MB4222.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eJatJiyyfYfCQEGnq2xniWLbV2m8e/m9JZ5TsfemwjrcRWzq2yT9dZsFN3Y2XZRH4Oru+pAYLLbpNARWa804Vcl7AzFFNx3Qc8hK1ZHOpVs22+z5BzoqWVKLr7Woi5WKONfyR4/AJR3fGfA/xquaPKiJ3BdklpvDHry53bk8kzIEaMN+L7grlSlNl0x666FgPIyHrYvwOkjYy2y3YFcXv4JkLwEMUu+kV34fX3tt1EZTPq7aotnaX/pMLYcCBar7Z1k+0zBXKLlVqVn1dKb/cB2JAF1/JPEgGqjl/b2GEz8asjeQ/PZx+FQ00+iUP5zle8DrnanPPKQ7bYQq9rt0palYyDnRQ2PnxJ5tv5oRaGCcxWex3GgvTIyOKFkkaZZTkzke/jPfl2fw4hzKp0+UxVeOx77kCswWr8tD6kdSa3A=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a685bf21-8b64-4987-2763-08d69826f139
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 18:03:51.4147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB1663
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add parsing clocks from device tree.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 90 ++++++++++++++++++++++++++++++++++=
++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8q=
xp-lpcg.c
index 99c2508..dbbd3bd 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -152,6 +153,88 @@ static const struct imx8qxp_ss_lpcg imx8qxp_ss_lsio =
=3D {
 	.num_max =3D IMX_LSIO_LPCG_CLK_END,
 };
=20
+#define IMX_LPCG_MAX_CLKS	8
+
+static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
+				       struct device_node *np)
+{
+	const char *output_names[IMX_LPCG_MAX_CLKS];
+	const char *parent_names[IMX_LPCG_MAX_CLKS];
+	unsigned int bit_offset[IMX_LPCG_MAX_CLKS];
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **clk_hws;
+	struct resource *res;
+	void __iomem *base;
+	bool autogate;
+	int count;
+	int ret;
+	int i;
+
+	if (!of_device_is_compatible(np, "fsl,imx8qxp-lpcg"))
+		return -EINVAL;
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base =3D devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	count =3D of_property_count_u32_elems(np, "bit-offset");
+	if (count < 0) {
+		dev_err(&pdev->dev, "failed to count clocks\n");
+		return -EINVAL;
+	}
+
+	clk_data =3D devm_kzalloc(&pdev->dev, struct_size(clk_data, hws, count),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num =3D count;
+	clk_hws =3D clk_data->hws;
+
+	ret =3D of_property_read_u32_array(np, "bit-offset", bit_offset,
+					 clk_data->num);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to read clocks bit-offset\n");
+		return -EINVAL;
+	}
+
+	ret =3D of_clk_parent_fill(np, parent_names, clk_data->num);
+	if (ret !=3D clk_data->num) {
+		dev_err(&pdev->dev, "failed to get clock parent names\n");
+		return -EINVAL;
+	}
+
+	ret =3D of_property_read_string_array(np, "clock-output-names",
+					    output_names, clk_data->num);
+	if (ret !=3D clk_data->num) {
+		dev_err(&pdev->dev, "failed to read clock-output-names\n");
+		return -EINVAL;
+	}
+
+	autogate =3D of_property_read_bool(np, "hw-autogate");
+
+	for (i =3D 0; i < clk_data->num; i++) {
+		if (bit_offset[i] > 31) {
+			dev_warn(&pdev->dev, "invalid bit offset of clock %d\n",
+				 i);
+			return -EINVAL;
+		}
+
+		clk_hws[i] =3D imx_clk_lpcg_scu(output_names[i],
+					      parent_names[i], 0, base,
+					      bit_offset[i], autogate);
+		if (IS_ERR(clk_hws[i])) {
+			dev_warn(&pdev->dev, "failed to register clock %d\n",
+				 i);
+			return -EINVAL;
+		}
+	}
+
+	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
+					   clk_data);
+}
+
 static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
@@ -162,8 +245,14 @@ static int imx8qxp_lpcg_clk_probe(struct platform_devi=
ce *pdev)
 	struct resource *res;
 	struct clk_hw **clks;
 	void __iomem *base;
+	int ret;
 	int i;
=20
+	/* try new binding to parse clocks from device tree first */
+	ret =3D imx_lpcg_parse_clks_from_dt(pdev, np);
+	if (!ret)
+		return 0;
+
 	ss_lpcg =3D of_device_get_match_data(dev);
 	if (!ss_lpcg)
 		return -ENODEV;
@@ -201,6 +290,7 @@ static const struct of_device_id imx8qxp_lpcg_match[] =
=3D {
 	{ .compatible =3D "fsl,imx8qxp-lpcg-adma", &imx8qxp_ss_adma, },
 	{ .compatible =3D "fsl,imx8qxp-lpcg-conn", &imx8qxp_ss_conn, },
 	{ .compatible =3D "fsl,imx8qxp-lpcg-lsio", &imx8qxp_ss_lsio, },
+	{ .compatible =3D "fsl,imx8qxp-lpcg", NULL },
 	{ /* sentinel */ }
 };
=20
--=20
2.7.4


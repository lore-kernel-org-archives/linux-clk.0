Return-Path: <SRS0=NIgS=TN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFD2C04AB1
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 05:32:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95123208C3
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 05:32:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="kD5ShDb2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbfEMFcQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 May 2019 01:32:16 -0400
Received: from mail-eopbgr80087.outbound.protection.outlook.com ([40.107.8.87]:3281
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725866AbfEMFcQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 13 May 2019 01:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCZ8G6FbufbpIKnO1l02nwILKMKEOrFdWZIhW8t31wI=;
 b=kD5ShDb2v4SAKE8nNEpsB9aKXusxPcbDuyXEJBhU9wUmGMo6cMYJirliF4JesBmo+kMqeF74ErGiMD77rT3JL2rwYruVqYKnRUov7KlBodr/c3feMaHEFLju/X3UzSKEAw8siRuTruVtKjCSAA0bQdHRRC++NOVfnJGnWzVyllI=
Received: from AM0PR04MB6434.eurprd04.prod.outlook.com (20.179.252.215) by
 AM0PR04MB4881.eurprd04.prod.outlook.com (20.177.40.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Mon, 13 May 2019 05:32:09 +0000
Received: from AM0PR04MB6434.eurprd04.prod.outlook.com
 ([fe80::19be:75a:9fe:7cec]) by AM0PR04MB6434.eurprd04.prod.outlook.com
 ([fe80::19be:75a:9fe:7cec%7]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 05:32:09 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Jacky Bai <ping.bai@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
CC:     Anson Huang <anson.huang@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/2] clk: imx8mm: Add gic clk
Thread-Topic: [PATCH 2/2] clk: imx8mm: Add gic clk
Thread-Index: AQHVCU01EyZHs5LfbkitpXnJBrxJyw==
Date:   Mon, 13 May 2019 05:32:09 +0000
Message-ID: <7e1ffa50b8e2e95ec415c7b46b5ef83b0ec46e2d.1557725494.git.leonard.crestez@nxp.com>
References: <61a5cad23ad56a2aed96f3bdbf7c67df25e0bd6b.1557725494.git.leonard.crestez@nxp.com>
In-Reply-To: <61a5cad23ad56a2aed96f3bdbf7c67df25e0bd6b.1557725494.git.leonard.crestez@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [89.37.124.34]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: LO2P265CA0125.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::17) To AM0PR04MB6434.eurprd04.prod.outlook.com
 (2603:10a6:208:16c::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7f3c492-33de-4fcf-bc54-08d6d7645796
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4881;
x-ms-traffictypediagnostic: AM0PR04MB4881:
x-microsoft-antispam-prvs: <AM0PR04MB488121FED3295E149BCE1C84EE0F0@AM0PR04MB4881.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(136003)(366004)(396003)(199004)(189003)(305945005)(6436002)(66066001)(14444005)(256004)(2906002)(52116002)(71190400001)(25786009)(76176011)(71200400001)(102836004)(54906003)(6486002)(110136005)(53936002)(386003)(316002)(86362001)(68736007)(4326008)(6512007)(478600001)(5660300002)(6506007)(99286004)(7736002)(26005)(118296001)(186003)(446003)(50226002)(6116002)(8936002)(3846002)(486006)(476003)(11346002)(2616005)(8676002)(73956011)(14454004)(36756003)(44832011)(64756008)(66476007)(66556008)(81156014)(81166006)(66446008)(66946007)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4881;H:AM0PR04MB6434.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Nb1D7lMlHNbwlNYPx2lhh4UhtNszmnSe6RuSnlLYjyiyKbc3vOi03vmsJ+qy97htDKL5HcbRT/mwcCEcFAebxHnZ8BtBgXbFNTQwEUlTEVPUUY1044y1uzWNdY1/EGUYNRoDTSFsFY2I5vcrHdXTEeJnL1oq8lcFjWHLQTJWhxB8YsW1EJeygQYbJ34O3HN9T7Iu4C5FPEJDnWAI7mzk6OtfwI61OBM89ytLKJNVquezAEX2KIndUJuZMkXNijS3chSHEc3LHFCiU2LfXehy0IXqMLEPDKhFadJGGtCRAkpO+BsVUafp9r+inkm2/f+mNIaeHZDmn9anocurc+rwN8PcEDxllGkCLzmUNDgvaaWp7UnRkQ8U+9zvNJmVseO3cpsvAwE1qGhQerQPsT0Zu/DpmbMsM0QqQsLfl2oO2Pw=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <25D0B71250424A46B273E04CB5A4658A@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f3c492-33de-4fcf-bc54-08d6d7645796
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 05:32:09.3687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4881
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is documented in the reference manual as GIC_CLK_ROOT.

In some out-of-tree DVFS the gic clock can end up as the only user of
sys_pll2 so if we don't define the gic clk explicitly it might be turned
off.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

---
I'm not sure adding clks from the reference manual needs justification.
---
 drivers/clk/imx/clk-imx8mm.c             | 4 ++++
 include/dt-bindings/clock/imx8mm-clock.h | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index fbb61c2f12d0..8b2f0013639d 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -286,10 +286,13 @@ static const char *imx8mm_usb_core_sels[] =3D {"osc_2=
4m", "sys_pll1_100m", "sys_pl
 					     "sys_pll2_200m", "clk_ext2", "clk_ext3", "audio_pll2_out", };
=20
 static const char *imx8mm_usb_phy_sels[] =3D {"osc_24m", "sys_pll1_100m", =
"sys_pll1_40m", "sys_pll2_100m",
 					     "sys_pll2_200m", "clk_ext2", "clk_ext3", "audio_pll2_out", };
=20
+static const char *imx8mm_gic_sels[] =3D {"osc_24m", "sys_pll2_200m", "sys=
_pll1_40m", "sys_pll2_100m",
+					     "sys_pll1_800m", "clk_ext2", "clk_ext4", "audio_pll2_out" };
+
 static const char *imx8mm_ecspi1_sels[] =3D {"osc_24m", "sys_pll2_200m", "=
sys_pll1_40m", "sys_pll1_160m",
 					   "sys_pll1_800m", "sys_pll3_out", "sys_pll2_250m", "audio_pll2_out"=
, };
=20
 static const char *imx8mm_ecspi2_sels[] =3D {"osc_24m", "sys_pll2_200m", "=
sys_pll1_40m", "sys_pll1_160m",
 					   "sys_pll1_800m", "sys_pll3_out", "sys_pll2_250m", "audio_pll2_out"=
, };
@@ -556,10 +559,11 @@ static int __init imx8mm_clocks_init(struct device_no=
de *ccm_node)
 	clks[IMX8MM_CLK_UART2] =3D imx8m_clk_composite("uart2", imx8mm_uart2_sels=
, base + 0xaf80);
 	clks[IMX8MM_CLK_UART3] =3D imx8m_clk_composite("uart3", imx8mm_uart3_sels=
, base + 0xb000);
 	clks[IMX8MM_CLK_UART4] =3D imx8m_clk_composite("uart4", imx8mm_uart4_sels=
, base + 0xb080);
 	clks[IMX8MM_CLK_USB_CORE_REF] =3D imx8m_clk_composite("usb_core_ref", imx=
8mm_usb_core_sels, base + 0xb100);
 	clks[IMX8MM_CLK_USB_PHY_REF] =3D imx8m_clk_composite("usb_phy_ref", imx8m=
m_usb_phy_sels, base + 0xb180);
+	clks[IMX8MM_CLK_GIC] =3D imx8m_clk_composite_critical("gic", imx8mm_gic_s=
els, base + 0xb200);
 	clks[IMX8MM_CLK_ECSPI1] =3D imx8m_clk_composite("ecspi1", imx8mm_ecspi1_s=
els, base + 0xb280);
 	clks[IMX8MM_CLK_ECSPI2] =3D imx8m_clk_composite("ecspi2", imx8mm_ecspi2_s=
els, base + 0xb300);
 	clks[IMX8MM_CLK_PWM1] =3D imx8m_clk_composite("pwm1", imx8mm_pwm1_sels, b=
ase + 0xb380);
 	clks[IMX8MM_CLK_PWM2] =3D imx8m_clk_composite("pwm2", imx8mm_pwm2_sels, b=
ase + 0xb400);
 	clks[IMX8MM_CLK_PWM3] =3D imx8m_clk_composite("pwm3", imx8mm_pwm3_sels, b=
ase + 0xb480);
diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings=
/clock/imx8mm-clock.h
index 1b4353e7b486..26f3ad3fbf5d 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -236,9 +236,10 @@
=20
 #define IMX8MM_CLK_DRAM_CORE			220
 #define IMX8MM_CLK_DRAM_ALT_ROOT		221
=20
 #define IMX8MM_CLK_NAND_USDHC_BUS_RAWNAND_CLK	222
+#define IMX8MM_CLK_GIC				223
=20
-#define IMX8MM_CLK_END				223
+#define IMX8MM_CLK_END				224
=20
 #endif
--=20
2.17.1


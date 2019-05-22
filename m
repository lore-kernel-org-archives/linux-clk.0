Return-Path: <SRS0=a4ME=TW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67164C18E7D
	for <linux-clk@archiver.kernel.org>; Wed, 22 May 2019 09:48:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C27E217D9
	for <linux-clk@archiver.kernel.org>; Wed, 22 May 2019 09:48:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="XSmZDZus"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbfEVJsg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 May 2019 05:48:36 -0400
Received: from mail-eopbgr40064.outbound.protection.outlook.com ([40.107.4.64]:5782
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728602AbfEVJsf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 22 May 2019 05:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/WcK1QGJEMvW2AFJdc7EszLqs9w8c+FBMsOQMPfTU8=;
 b=XSmZDZusruFcHhc93RYt5jJte3dfznJKP8Gn4LDd0fNbYQ00hMDYOBDvPBOvuu+GUkDxUNCL7NYfRroVh1w+SKb0Ein/qlg4ffwGltLlnETQlVLicE1cLNnrroOGbFCXeN7S/rXxrXTknJmyYrnHAmh5sjzq8iDa0inbNUEk5fc=
Received: from AM0PR04MB6434.eurprd04.prod.outlook.com (20.179.252.215) by
 AM0PR04MB4897.eurprd04.prod.outlook.com (20.177.40.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Wed, 22 May 2019 09:48:30 +0000
Received: from AM0PR04MB6434.eurprd04.prod.outlook.com
 ([fe80::19be:75a:9fe:7cec]) by AM0PR04MB6434.eurprd04.prod.outlook.com
 ([fe80::19be:75a:9fe:7cec%7]) with mapi id 15.20.1922.016; Wed, 22 May 2019
 09:48:30 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/2] clk: imx8m: Add GIC clock
Thread-Topic: [PATCH v2 2/2] clk: imx8m: Add GIC clock
Thread-Index: AQHVEIODCAGP73HXoU2yWffcO3Luag==
Date:   Wed, 22 May 2019 09:48:30 +0000
Message-ID: <df8f9219a975050cc1bfcfd604c8389044319578.1558518323.git.leonard.crestez@nxp.com>
References: <cover.1558518323.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1558518323.git.leonard.crestez@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [89.37.124.34]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: LO2P265CA0441.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::21) To AM0PR04MB6434.eurprd04.prod.outlook.com
 (2603:10a6:208:16c::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3549353-6daf-42a9-a7ce-08d6de9aa59d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4897;
x-ms-traffictypediagnostic: AM0PR04MB4897:
x-microsoft-antispam-prvs: <AM0PR04MB4897ECFAC1635DDB22DCE25DEE000@AM0PR04MB4897.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(189003)(199004)(71190400001)(52116002)(71200400001)(498600001)(53936002)(256004)(118296001)(76176011)(73956011)(86362001)(3846002)(6116002)(99286004)(36756003)(66066001)(66556008)(64756008)(5660300002)(66946007)(66446008)(66476007)(14454004)(2906002)(50226002)(25786009)(6486002)(6436002)(54906003)(11346002)(44832011)(486006)(476003)(2616005)(110136005)(386003)(26005)(6506007)(305945005)(68736007)(446003)(186003)(7736002)(8936002)(4326008)(102836004)(6512007)(8676002)(81166006)(81156014)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4897;H:AM0PR04MB6434.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pCr2KdZeHuyyqS/UofBm4SGB/7pfl/LTMvNZRgTXp7PPqSuaoJGD6IGLwsm/QWml2JI3+mGaasir233mysFxRvsqt3wCIam5PGTZCHD0MgwJNk5h7NZ4bemicP+XRmNkvHxQDy7FWxyeMN2bQHUXJ6DuhOEGYA40y3v5M9ki+aaaxPbt9maFWT2HCM4NBFjCwZmWCSezFjKsouwKX3yo65YZEnFugAphSMuJ5z3u2YAy5o4zfqtzraqeUKs1O/ON9To0iyhPjDF2WTRlUPX3kTQSkQI5Fh5eUvmqyVSCXDbV/HpZfdWxKaJYylhjmuF4cEv8rlOVp+QI1iI1A1ui75ViRGQei+LQhsJNswCCjSH2Ratmkox2S2wm7BUI7LO2E1IZuLirGYQeROMzQd6lNPiHCdeauGEmziiRdFBTa1A=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1A54C618F49D0B4C8FBA9ED229C18A99@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3549353-6daf-42a9-a7ce-08d6de9aa59d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 09:48:30.7624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4897
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is documented in the reference manuals as GIC_CLK_ROOT.

In some out-of-tree DVFS scenarios the gic clock can end up as the only
user of sys_pll2 so if we don't define the gic clk explicitly it might
be turned off.

This applies to both 8mq and 8mm: same clk register but diffferent
parents.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/imx/clk-imx8mm.c | 4 ++++
 drivers/clk/imx/clk-imx8mq.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 2e2f8c210432..74112d3ef5bf 100644
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
+					"sys_pll1_800m", "clk_ext2", "clk_ext4", "audio_pll2_out" };
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
diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index daf1841b2adb..b2b2c8956cb7 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -190,10 +190,13 @@ static const char * const imx8mq_usb_core_sels[] =3D =
{"osc_25m", "sys1_pll_100m",
 					     "sys2_pll_200m", "clk_ext2", "clk_ext3", "audio_pll2_out", };
=20
 static const char * const imx8mq_usb_phy_sels[] =3D {"osc_25m", "sys1_pll_=
100m", "sys1_pll_40m", "sys2_pll_100m",
 					     "sys2_pll_200m", "clk_ext2", "clk_ext3", "audio_pll2_out", };
=20
+static const char * const imx8mq_gic_sels[] =3D {"osc_25m", "sys2_pll_200m=
", "sys1_pll_40m", "sys2_pll_100m",
+					       "sys2_pll_200m", "clk_ext2", "clk_ext3", "audio_pll2_out" };
+
 static const char * const imx8mq_ecspi1_sels[] =3D {"osc_25m", "sys2_pll_2=
00m", "sys1_pll_40m", "sys1_pll_160m",
 					   "sys1_pll_800m", "sys3_pll2_out", "sys2_pll_250m", "audio_pll2_out=
", };
=20
 static const char * const imx8mq_ecspi2_sels[] =3D {"osc_25m", "sys2_pll_2=
00m", "sys1_pll_40m", "sys1_pll_160m",
 					   "sys1_pll_800m", "sys3_pll2_out", "sys2_pll_250m", "audio_pll2_out=
", };
@@ -440,10 +443,11 @@ static int imx8mq_clocks_probe(struct platform_device=
 *pdev)
 	clks[IMX8MQ_CLK_UART2] =3D imx8m_clk_composite("uart2", imx8mq_uart2_sels=
, base + 0xaf80);
 	clks[IMX8MQ_CLK_UART3] =3D imx8m_clk_composite("uart3", imx8mq_uart3_sels=
, base + 0xb000);
 	clks[IMX8MQ_CLK_UART4] =3D imx8m_clk_composite("uart4", imx8mq_uart4_sels=
, base + 0xb080);
 	clks[IMX8MQ_CLK_USB_CORE_REF] =3D imx8m_clk_composite("usb_core_ref", imx=
8mq_usb_core_sels, base + 0xb100);
 	clks[IMX8MQ_CLK_USB_PHY_REF] =3D imx8m_clk_composite("usb_phy_ref", imx8m=
q_usb_phy_sels, base + 0xb180);
+	clks[IMX8MQ_CLK_GIC] =3D imx8m_clk_composite_critical("gic", imx8mq_gic_s=
els, base + 0xb200);
 	clks[IMX8MQ_CLK_ECSPI1] =3D imx8m_clk_composite("ecspi1", imx8mq_ecspi1_s=
els, base + 0xb280);
 	clks[IMX8MQ_CLK_ECSPI2] =3D imx8m_clk_composite("ecspi2", imx8mq_ecspi2_s=
els, base + 0xb300);
 	clks[IMX8MQ_CLK_PWM1] =3D imx8m_clk_composite("pwm1", imx8mq_pwm1_sels, b=
ase + 0xb380);
 	clks[IMX8MQ_CLK_PWM2] =3D imx8m_clk_composite("pwm2", imx8mq_pwm2_sels, b=
ase + 0xb400);
 	clks[IMX8MQ_CLK_PWM3] =3D imx8m_clk_composite("pwm3", imx8mq_pwm3_sels, b=
ase + 0xb480);
--=20
2.17.1


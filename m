Return-Path: <SRS0=g6IF=TU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65382C04AAF
	for <linux-clk@archiver.kernel.org>; Mon, 20 May 2019 07:54:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B6CB206B6
	for <linux-clk@archiver.kernel.org>; Mon, 20 May 2019 07:54:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="pznIK3Uw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730388AbfETHyz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 May 2019 03:54:55 -0400
Received: from mail-eopbgr00061.outbound.protection.outlook.com ([40.107.0.61]:65409
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727319AbfETHyz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 May 2019 03:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTEq0Rlmj+O/Zw2wJCGP+ZfJO48khPwKv3dEP3RicaE=;
 b=pznIK3Uwa0DES3LJP2mHfxrPbsba7YqebWmQqJvoR01vnWnRrB3RtRc9IQFBrC87SWr3oHh9WOV7E11AWJd1hBVIj/yWQ6QLQceFDmZsbMv3D/itB6iH4/uhBBCgP39ei/frky/Dsi/MGRURNnEhdDcQlBT1x6qonhJaj4r+Ko0=
Received: from VI1PR0402MB3519.eurprd04.prod.outlook.com (52.134.4.24) by
 VI1PR0402MB2797.eurprd04.prod.outlook.com (10.172.255.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Mon, 20 May 2019 07:54:51 +0000
Received: from VI1PR0402MB3519.eurprd04.prod.outlook.com
 ([fe80::2417:67da:c1aa:29f3]) by VI1PR0402MB3519.eurprd04.prod.outlook.com
 ([fe80::2417:67da:c1aa:29f3%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 07:54:51 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: [PATCH RESEND] clk: imx: keep the mmdc p1 ipg clock always on on
 6sx/ul/ull/sll
Thread-Topic: [PATCH RESEND] clk: imx: keep the mmdc p1 ipg clock always on on
 6sx/ul/ull/sll
Thread-Index: AQHVDuFNUl8CS/7zv0u0Ca3LZjy8mg==
Date:   Mon, 20 May 2019 07:54:51 +0000
Message-ID: <20190520075959.29069-1-ping.bai@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To VI1PR0402MB3519.eurprd04.prod.outlook.com
 (2603:10a6:803:8::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ping.bai@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de6a0fd0-68f8-4546-beef-08d6dcf87016
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR0402MB2797;
x-ms-traffictypediagnostic: VI1PR0402MB2797:
x-microsoft-antispam-prvs: <VI1PR0402MB2797289A921337720C6D53B287060@VI1PR0402MB2797.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(366004)(396003)(136003)(39860400002)(189003)(199004)(6436002)(52116002)(54906003)(81166006)(8936002)(6486002)(53936002)(486006)(2616005)(476003)(66446008)(64756008)(66556008)(66476007)(8676002)(110136005)(478600001)(316002)(36756003)(186003)(81156014)(26005)(66946007)(73956011)(66066001)(25786009)(2501003)(6512007)(386003)(14454004)(102836004)(5660300002)(6506007)(2906002)(7736002)(3846002)(1076003)(86362001)(256004)(4326008)(50226002)(99286004)(68736007)(6116002)(305945005)(71190400001)(71200400001)(2201001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB2797;H:VI1PR0402MB3519.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nj2qDNt+JdQblr12Yghv1cgAKIqgukshtQyIshiGeHqjDr2dW3qCpo446Clcwqb1X/RVG2swyeXvh7YrxhIgQ1fhQ6X7hH3BE9c2115jw9qAyTSppENVgEX2AZEDpVgjsJI2XEZJkCl5BA6Aer0RHPrqyxrD4qFcUrdFascdzAbUxJt04hczhW19tVv6U9qxQHX3d46CcGpGV4TPOznFC+q9d5SxU5vHL9zqCgHQbtxFNy2SkMuLKsBYURRy1Juaj6/k7IUdATWAu2JLIz/Cl3bIGQ8RR2Dmh+HESgbgfC8V5VdxLo7O2WBNtiAK1/7ODpnTwvfT3o3ZuYpZYg3gD88uUsmRv2ACRvvBFsux60KRkCui3Zt9OZJxwqwiEqJzo7CqBAmOYugKaAUjfrvI2vF4XeiTNHw65X9qgKx2pPU=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <ACB1D3881347614DBA794CCDA8587C6F@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de6a0fd0-68f8-4546-beef-08d6dcf87016
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 07:54:51.2861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2797
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MMDC_P1_IPG clock need to be on always on to make sure
the MMDC register can be accessed successfully.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-imx6sll.c | 2 +-
 drivers/clk/imx/clk-imx6sx.c  | 2 +-
 drivers/clk/imx/clk-imx6ul.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sll.c b/drivers/clk/imx/clk-imx6sll.c
index 7eea448cb9a9..4d91e48e5918 100644
--- a/drivers/clk/imx/clk-imx6sll.c
+++ b/drivers/clk/imx/clk-imx6sll.c
@@ -307,7 +307,7 @@ static void __init imx6sll_clocks_init(struct device_no=
de *ccm_node)
 	clks[IMX6SLL_CLK_WDOG1]		=3D imx_clk_gate2("wdog1",	"ipg",		base + 0x74, =
16);
 	clks[IMX6SLL_CLK_MMDC_P0_FAST]	=3D imx_clk_gate_flags("mmdc_p0_fast", "mm=
dc_podf",  base + 0x74,	20, CLK_IS_CRITICAL);
 	clks[IMX6SLL_CLK_MMDC_P0_IPG]	=3D imx_clk_gate2_flags("mmdc_p0_ipg", "ipg=
",	   base + 0x74,	24, CLK_IS_CRITICAL);
-	clks[IMX6SLL_CLK_MMDC_P1_IPG]	=3D imx_clk_gate2("mmdc_p1_ipg", "ipg",	   =
base + 0x74,	26);
+	clks[IMX6SLL_CLK_MMDC_P1_IPG]	=3D imx_clk_gate2_flags("mmdc_p1_ipg", "ipg=
",	   base + 0x74,	26, CLK_IS_CRITICAL);
 	clks[IMX6SLL_CLK_OCRAM]		=3D imx_clk_gate_flags("ocram","ahb",		   base +=
 0x74,	28, CLK_IS_CRITICAL);
=20
 	/* CCGR4 */
diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
index 91558b09bf9e..86f3053c37f6 100644
--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -432,7 +432,7 @@ static void __init imx6sx_clocks_init(struct device_nod=
e *ccm_node)
 	clks[IMX6SX_CLK_MLB]          =3D imx_clk_gate2("mlb",           "ahb",  =
             base + 0x74, 18);
 	clks[IMX6SX_CLK_MMDC_P0_FAST] =3D imx_clk_gate2_flags("mmdc_p0_fast", "mm=
dc_podf", base + 0x74, 20, CLK_IS_CRITICAL);
 	clks[IMX6SX_CLK_MMDC_P0_IPG]  =3D imx_clk_gate2_flags("mmdc_p0_ipg", "ipg=
", base + 0x74, 24, CLK_IS_CRITICAL);
-	clks[IMX6SX_CLK_MMDC_P1_IPG]  =3D imx_clk_gate2("mmdc_p1_ipg", "ipg", bas=
e + 0x74, 26);
+	clks[IMX6SX_CLK_MMDC_P1_IPG]  =3D imx_clk_gate2_flags("mmdc_p1_ipg", "ipg=
", base + 0x74, 26, CLK_IS_CRITICAL);
 	clks[IMX6SX_CLK_OCRAM]        =3D imx_clk_gate2_flags("ocram", "ocram_pod=
f", base + 0x74, 28, CLK_IS_CRITICAL);
=20
 	/* CCGR4 */
diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index fd60d1549f71..35377c6b50b8 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -408,7 +408,7 @@ static void __init imx6ul_clocks_init(struct device_nod=
e *ccm_node)
 	clks[IMX6UL_CLK_WDOG1]		=3D imx_clk_gate2("wdog1",	"ipg",		base + 0x74,	1=
6);
 	clks[IMX6UL_CLK_MMDC_P0_FAST]	=3D imx_clk_gate_flags("mmdc_p0_fast", "mmd=
c_podf", base + 0x74,	20, CLK_IS_CRITICAL);
 	clks[IMX6UL_CLK_MMDC_P0_IPG]	=3D imx_clk_gate2_flags("mmdc_p0_ipg",	"ipg"=
,		base + 0x74,	24, CLK_IS_CRITICAL);
-	clks[IMX6UL_CLK_MMDC_P1_IPG]	=3D imx_clk_gate2("mmdc_p1_ipg",	"ipg",		bas=
e + 0x74,	26);
+	clks[IMX6UL_CLK_MMDC_P1_IPG]	=3D imx_clk_gate2_flags("mmdc_p1_ipg",	"ipg"=
,		base + 0x74,	26, CLK_IS_CRITICAL);
 	clks[IMX6UL_CLK_AXI]		=3D imx_clk_gate_flags("axi",	"axi_podf",	base + 0x=
74,	28, CLK_IS_CRITICAL);
=20
 	/* CCGR4 */
--=20
2.21.0


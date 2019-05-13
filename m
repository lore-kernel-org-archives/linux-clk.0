Return-Path: <SRS0=NIgS=TN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60AFC04AB1
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 05:32:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A72F20C01
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 05:32:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="WEwiHFWM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfEMFcM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 May 2019 01:32:12 -0400
Received: from mail-eopbgr80087.outbound.protection.outlook.com ([40.107.8.87]:3281
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725866AbfEMFcM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 13 May 2019 01:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObFyiP1qiiCBXrAk80o80SkGnTFgkA8Z/9BPbwfEPug=;
 b=WEwiHFWMqQfu9X0Nu6JW+wapW599T9SAycq8pMlxLeMZL5dsQGZl8q9URBWekTqqTukci1jDPn+QKmA0LP45k930Em4KDOqt0X8oEMH319rwRoQSmoksM78wQEg6r7E4R6mMy8Uqs53uIdbRTn/DQ0TXtfHseBOfpzqxbCyEVCk=
Received: from AM0PR04MB6434.eurprd04.prod.outlook.com (20.179.252.215) by
 AM0PR04MB4881.eurprd04.prod.outlook.com (20.177.40.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Mon, 13 May 2019 05:32:07 +0000
Received: from AM0PR04MB6434.eurprd04.prod.outlook.com
 ([fe80::19be:75a:9fe:7cec]) by AM0PR04MB6434.eurprd04.prod.outlook.com
 ([fe80::19be:75a:9fe:7cec%7]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 05:32:07 +0000
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
Subject: [PATCH 1/2] clk: imx8mm: Mark dram_apb critical
Thread-Topic: [PATCH 1/2] clk: imx8mm: Mark dram_apb critical
Thread-Index: AQHVCU00unSS8OoySUuU9eBOMvjcrw==
Date:   Mon, 13 May 2019 05:32:07 +0000
Message-ID: <61a5cad23ad56a2aed96f3bdbf7c67df25e0bd6b.1557725494.git.leonard.crestez@nxp.com>
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
x-ms-office365-filtering-correlation-id: c1d2eb8c-8f30-47aa-4c17-08d6d76456cb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4881;
x-ms-traffictypediagnostic: AM0PR04MB4881:
x-microsoft-antispam-prvs: <AM0PR04MB4881198C0EE65C56E9E6AFB6EE0F0@AM0PR04MB4881.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(136003)(366004)(396003)(199004)(189003)(305945005)(6436002)(66066001)(14444005)(256004)(2906002)(52116002)(71190400001)(25786009)(71200400001)(102836004)(54906003)(6486002)(110136005)(53936002)(386003)(316002)(86362001)(68736007)(4326008)(6512007)(478600001)(5660300002)(6506007)(99286004)(7736002)(26005)(118296001)(186003)(50226002)(6116002)(8936002)(3846002)(486006)(476003)(2616005)(8676002)(73956011)(14454004)(36756003)(44832011)(64756008)(66476007)(66556008)(81156014)(81166006)(66446008)(66946007)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4881;H:AM0PR04MB6434.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nt5MvoyMigCMFswL0/ROWyZOHxSESFYtngjgavnySGKn93x48hAQeB53FwketjHFsHQTUi/SsSuovFksNtJJNGm2F48xsSPvedAzyb9tFWHbpanXVO4tuMRGLKewMi3NlM+WLAMDo72YRHndlANVI43PuQ+Cc59j2n8NwgK+XBIWJP4nKlTyDFxclHUcm+y0gXQfRs3TC0bxwYz9rpsxcrG/1Duoeuu7p2SASWY7Ov9ZmcrXkNdlexObfXfHHRNJyTYNrh1GMoGtRHfDl3X93AKJQ4jfzir2nwQN4gKDl6qlDn30o7tk38MQFQU07RHZaq9XqAYZZH3PL9y8ui8L2sF8i9XljmX6Tpgb8tPpjinbhaevziwUosqYjt4wq+Nza+CR5Ld8hM0wzmwhKBjab1yRNfQqGwZbmYW/4vE5lok=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BE2849F329DEDF4B849E611DD86696BE@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d2eb8c-8f30-47aa-4c17-08d6d76456cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 05:32:07.7636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4881
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This clock is used for dram operations inside TF-A and must be kept
enabled for features such as suspend/resume dram retention and busfreq
to work.

This is required for imx8mm suspend to work with NXP branch of TF-A.
There is an equivalent clk on imx8mq and it's always been marked as
critical in upstream.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/imx/clk-imx8mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 1ef8438e3d6d..fbb61c2f12d0 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -521,11 +521,11 @@ static int __init imx8mm_clocks_init(struct device_no=
de *ccm_node)
 	clks[IMX8MM_CLK_IPG_ROOT] =3D imx_clk_divider2("ipg_root", "ahb", base + =
0x9080, 0, 1);
 	clks[IMX8MM_CLK_IPG_AUDIO_ROOT] =3D imx_clk_divider2("ipg_audio_root", "a=
udio_ahb", base + 0x9180, 0, 1);
=20
 	/* IP */
 	clks[IMX8MM_CLK_DRAM_ALT] =3D imx8m_clk_composite("dram_alt", imx8mm_dram=
_alt_sels, base + 0xa000);
-	clks[IMX8MM_CLK_DRAM_APB] =3D imx8m_clk_composite("dram_apb", imx8mm_dram=
_apb_sels, base + 0xa080);
+	clks[IMX8MM_CLK_DRAM_APB] =3D imx8m_clk_composite_critical("dram_apb", im=
x8mm_dram_apb_sels, base + 0xa080);
 	clks[IMX8MM_CLK_VPU_G1] =3D imx8m_clk_composite("vpu_g1", imx8mm_vpu_g1_s=
els, base + 0xa100);
 	clks[IMX8MM_CLK_VPU_G2] =3D imx8m_clk_composite("vpu_g2", imx8mm_vpu_g2_s=
els, base + 0xa180);
 	clks[IMX8MM_CLK_DISP_DTRC] =3D imx8m_clk_composite("disp_dtrc", imx8mm_di=
sp_dtrc_sels, base + 0xa200);
 	clks[IMX8MM_CLK_DISP_DC8000] =3D imx8m_clk_composite("disp_dc8000", imx8m=
m_disp_dc8000_sels, base + 0xa280);
 	clks[IMX8MM_CLK_PCIE1_CTRL] =3D imx8m_clk_composite("pcie1_ctrl", imx8mm_=
pcie1_ctrl_sels, base + 0xa300);
--=20
2.17.1


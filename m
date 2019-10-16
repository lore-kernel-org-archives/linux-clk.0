Return-Path: <SRS0=uqeP=YJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECC3FA372A
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 11:57:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB73B20854
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 11:57:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ckyC3FQA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbfJPL5n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Oct 2019 07:57:43 -0400
Received: from mail-eopbgr10044.outbound.protection.outlook.com ([40.107.1.44]:62173
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726372AbfJPL5n (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Oct 2019 07:57:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgL81boV01tgwaTC21dYI4BdXFfq80qhdimjhabtwtpYvoASOqejeAlEag45QChgUD6i0puhvjzBmt8Yd9R3QwRFGJEiwQr96mq2a2jlFHCPf9V1hmvCQodcp62sPf55fcAveUhaStEn5RmB+343GFSpL+ScDxXxusksKh6zW7V6ScsYCWcreQscVylih9pfXHqKdzT7C/7TQl9QqqDtRmFIM3G93gTu7Z01STOOu9MeDtkCbcI/GLctRfnfcRttTybrMmTE2EzuAvHORlxmTPMwLu8hctd2tLf12/X/PwB14HhHcQ3pf76aRHbvBpOWr4rsHsSKJKnvT/igwgueOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+7tK9UIIUC3QJYfn7PegbpnO5CI8um2ogA7kbNN+lM=;
 b=YECWQPsDTooPOy7aTwtDJ3g3pSG1C4FHKhNoDucmsNBKRxG/c5m7Zbo7Y/ECxtH4P2wrp84S+++2W5XTphI2aMCnCDBgALUvmOs52Bsrw58sM/avpP/cnut8fmiSP8ynV6eAgqEwaNip/aAuERBcu9vof+aLM3HGaBPn7mpAiacOgqWtK0PPMzpRmpGoS88Qt0kIkJFFF95cuw29ZHc7Xr3D2rq30cEXL6SQv1Oz5JsdwgQ007zQ0r3DWt0hKKa9sQFzHiAg3nzKARVumYDXge/1eJkmKsVRK7XiTsH8YZfSrMBnDWy8RM5v2oc+q2nVBKW7ZgCfxoO4wG03MQpyPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+7tK9UIIUC3QJYfn7PegbpnO5CI8um2ogA7kbNN+lM=;
 b=ckyC3FQAoZ5yhWXHqiAL6hpzzLTZS2Fh4q5ZhGqItXpe0m3UipU4gQZuyjZNy0qXQgGbwaO9WmeVFfz1EdvxtiY9jGsQ51ryLrnRDCr6MVxuAs2X+jh3uK5lO+pVi0c1XOZ2jvRtTFPeJ1qKLu42ixPyvUdFqkGLJ1u+azcTZ5s=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB7136.eurprd04.prod.outlook.com (10.186.156.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.23; Wed, 16 Oct 2019 11:57:38 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58d9:b0f7:b31:c05a]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58d9:b0f7:b31:c05a%7]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 11:57:38 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>
CC:     Jacky Bai <ping.bai@nxp.com>, Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 1/3] clk: imx8mq: Define gates for pll1/2 fixed dividers
Thread-Topic: [PATCH v3 1/3] clk: imx8mq: Define gates for pll1/2 fixed
 dividers
Thread-Index: AQHVhBjnjkAMKFkIvUi93L7MeG6LOQ==
Date:   Wed, 16 Oct 2019 11:57:37 +0000
Message-ID: <5c4a575ae74a75e5fc4a7277f26e750b1d2d87a0.1571226979.git.leonard.crestez@nxp.com>
References: <cover.1571226979.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1571226979.git.leonard.crestez@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [89.37.124.34]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::19) To VI1PR04MB7023.eurprd04.prod.outlook.com
 (2603:10a6:800:12f::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 045bbf6d-7322-4fde-cf73-08d752300a10
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR04MB7136:|VI1PR04MB7136:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB713689842CB71F30FF36BDCCEE920@VI1PR04MB7136.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(189003)(199004)(50226002)(305945005)(26005)(446003)(110136005)(476003)(66066001)(71190400001)(71200400001)(2616005)(186003)(25786009)(11346002)(8936002)(3846002)(6116002)(6506007)(86362001)(386003)(5660300002)(44832011)(316002)(99286004)(36756003)(76176011)(7736002)(478600001)(52116002)(54906003)(486006)(102836004)(8676002)(81156014)(81166006)(118296001)(6436002)(66476007)(66946007)(4326008)(256004)(6512007)(6486002)(14454004)(2906002)(66446008)(64756008)(66556008)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB7136;H:VI1PR04MB7023.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F1NwUBo2jKJam0uH2LT4fNz8zRgxgnofXnTIUHlANZezgLNtmE+AkmVi7o7NdpRJkFdbPgbk9cL5fDgai1tAR/9GCqdXiSCgLNO06P/KfxTqazZk2waCcrKhLC7aIe8iAqVreTVEW+a0v2nK8P4scqy1qghC6pspbJf4UVgCViiLd5VnAqT0HP0usuLc8JMQW+9L2ucjyS/6lGXo8UMnHOPBpAxlSJ55drvPuImVH0Gj15AYscn+WhheDRdImkHZRGvMuAMxK8YgBkKtX/WNL6Rvgc/g9fdPiZxXLuAp/FD1ppBuaKR9eMIIEQ/jUnd5aSD5rX50e8xIGfQpMgwIosD4Sl30/nWIkMr+z9zjF4ujbJPY5nL25ENMIjvwE73UBIRVbteWIvBiBGOfWkrThkkfKZwNpGrpRO+Yh6SJIrE=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <46619CCD7863624FB8220B3E7821996B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 045bbf6d-7322-4fde-cf73-08d752300a10
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 11:57:37.8897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nDMO6lptjtMCPXnAdHhY6Vx99oJAEbMU7dx0nk2/7CKxfsF3jh3obyq2NLRjX1TumqkP76zSw9PbveTuO6wNUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7136
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On imx8mq there are 9 fixed-factor dividers for SYS_PLL1 and SYS_PLL2
each with their own gate but these gates are not currently defined in
the clock tree.

Add them between sys1/2_pll_out and the fixed dividers.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/imx/clk-imx8mq.c             | 61 ++++++++++++++++--------
 include/dt-bindings/clock/imx8mq-clock.h | 22 ++++++++-
 2 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 05ece7b5da54..43af92525efb 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -348,30 +348,51 @@ static int imx8mq_clocks_probe(struct platform_device=
 *pdev)
 	clks[IMX8MQ_SYS2_PLL_OUT] =3D imx_clk_sccg_pll("sys2_pll_out", sys2_pll_o=
ut_sels, ARRAY_SIZE(sys2_pll_out_sels), 0, 0, 1, base + 0x3c, CLK_IS_CRITIC=
AL);
 	clks[IMX8MQ_SYS3_PLL_OUT] =3D imx_clk_sccg_pll("sys3_pll_out", sys3_pll_o=
ut_sels, ARRAY_SIZE(sys3_pll_out_sels), 0, 0, 1, base + 0x48, CLK_IS_CRITIC=
AL);
 	clks[IMX8MQ_DRAM_PLL_OUT] =3D imx_clk_sccg_pll("dram_pll_out", dram_pll_o=
ut_sels, ARRAY_SIZE(dram_pll_out_sels), 0, 0, 0, base + 0x60, CLK_IS_CRITIC=
AL);
 	clks[IMX8MQ_VIDEO2_PLL_OUT] =3D imx_clk_sccg_pll("video2_pll_out", video2=
_pll_out_sels, ARRAY_SIZE(video2_pll_out_sels), 0, 0, 0, base + 0x54, 0);
=20
-	/* SYS PLL fixed output */
-	clks[IMX8MQ_SYS1_PLL_40M] =3D imx_clk_fixed_factor("sys1_pll_40m", "sys1_=
pll_out", 1, 20);
-	clks[IMX8MQ_SYS1_PLL_80M] =3D imx_clk_fixed_factor("sys1_pll_80m", "sys1_=
pll_out", 1, 10);
-	clks[IMX8MQ_SYS1_PLL_100M] =3D imx_clk_fixed_factor("sys1_pll_100m", "sys=
1_pll_out", 1, 8);
-	clks[IMX8MQ_SYS1_PLL_133M] =3D imx_clk_fixed_factor("sys1_pll_133m", "sys=
1_pll_out", 1, 6);
-	clks[IMX8MQ_SYS1_PLL_160M] =3D imx_clk_fixed_factor("sys1_pll_160m", "sys=
1_pll_out", 1, 5);
-	clks[IMX8MQ_SYS1_PLL_200M] =3D imx_clk_fixed_factor("sys1_pll_200m", "sys=
1_pll_out", 1, 4);
-	clks[IMX8MQ_SYS1_PLL_266M] =3D imx_clk_fixed_factor("sys1_pll_266m", "sys=
1_pll_out", 1, 3);
-	clks[IMX8MQ_SYS1_PLL_400M] =3D imx_clk_fixed_factor("sys1_pll_400m", "sys=
1_pll_out", 1, 2);
-	clks[IMX8MQ_SYS1_PLL_800M] =3D imx_clk_fixed_factor("sys1_pll_800m", "sys=
1_pll_out", 1, 1);
-
-	clks[IMX8MQ_SYS2_PLL_50M] =3D imx_clk_fixed_factor("sys2_pll_50m", "sys2_=
pll_out", 1, 20);
-	clks[IMX8MQ_SYS2_PLL_100M] =3D imx_clk_fixed_factor("sys2_pll_100m", "sys=
2_pll_out", 1, 10);
-	clks[IMX8MQ_SYS2_PLL_125M] =3D imx_clk_fixed_factor("sys2_pll_125m", "sys=
2_pll_out", 1, 8);
-	clks[IMX8MQ_SYS2_PLL_166M] =3D imx_clk_fixed_factor("sys2_pll_166m", "sys=
2_pll_out", 1, 6);
-	clks[IMX8MQ_SYS2_PLL_200M] =3D imx_clk_fixed_factor("sys2_pll_200m", "sys=
2_pll_out", 1, 5);
-	clks[IMX8MQ_SYS2_PLL_250M] =3D imx_clk_fixed_factor("sys2_pll_250m", "sys=
2_pll_out", 1, 4);
-	clks[IMX8MQ_SYS2_PLL_333M] =3D imx_clk_fixed_factor("sys2_pll_333m", "sys=
2_pll_out", 1, 3);
-	clks[IMX8MQ_SYS2_PLL_500M] =3D imx_clk_fixed_factor("sys2_pll_500m", "sys=
2_pll_out", 1, 2);
-	clks[IMX8MQ_SYS2_PLL_1000M] =3D imx_clk_fixed_factor("sys2_pll_1000m", "s=
ys2_pll_out", 1, 1);
+	/* SYS PLL1 fixed output */
+	clks[IMX8MQ_SYS1_PLL_40M_CG] =3D imx_clk_gate("sys1_pll_40m_cg", "sys1_pl=
l_out", base + 0x30, 9);
+	clks[IMX8MQ_SYS1_PLL_80M_CG] =3D imx_clk_gate("sys1_pll_80m_cg", "sys1_pl=
l_out", base + 0x30, 11);
+	clks[IMX8MQ_SYS1_PLL_100M_CG] =3D imx_clk_gate("sys1_pll_100m_cg", "sys1_=
pll_out", base + 0x30, 13);
+	clks[IMX8MQ_SYS1_PLL_133M_CG] =3D imx_clk_gate("sys1_pll_133m_cg", "sys1_=
pll_out", base + 0x30, 15);
+	clks[IMX8MQ_SYS1_PLL_160M_CG] =3D imx_clk_gate("sys1_pll_160m_cg", "sys1_=
pll_out", base + 0x30, 17);
+	clks[IMX8MQ_SYS1_PLL_200M_CG] =3D imx_clk_gate("sys1_pll_200m_cg", "sys1_=
pll_out", base + 0x30, 19);
+	clks[IMX8MQ_SYS1_PLL_266M_CG] =3D imx_clk_gate("sys1_pll_266m_cg", "sys1_=
pll_out", base + 0x30, 21);
+	clks[IMX8MQ_SYS1_PLL_400M_CG] =3D imx_clk_gate("sys1_pll_400m_cg", "sys1_=
pll_out", base + 0x30, 23);
+	clks[IMX8MQ_SYS1_PLL_800M_CG] =3D imx_clk_gate("sys1_pll_800m_cg", "sys1_=
pll_out", base + 0x30, 25);
+
+	clks[IMX8MQ_SYS1_PLL_40M] =3D imx_clk_fixed_factor("sys1_pll_40m", "sys1_=
pll_40m_cg", 1, 20);
+	clks[IMX8MQ_SYS1_PLL_80M] =3D imx_clk_fixed_factor("sys1_pll_80m", "sys1_=
pll_80m_cg", 1, 10);
+	clks[IMX8MQ_SYS1_PLL_100M] =3D imx_clk_fixed_factor("sys1_pll_100m", "sys=
1_pll_100m_cg", 1, 8);
+	clks[IMX8MQ_SYS1_PLL_133M] =3D imx_clk_fixed_factor("sys1_pll_133m", "sys=
1_pll_133m_cg", 1, 6);
+	clks[IMX8MQ_SYS1_PLL_160M] =3D imx_clk_fixed_factor("sys1_pll_160m", "sys=
1_pll_160m_cg", 1, 5);
+	clks[IMX8MQ_SYS1_PLL_200M] =3D imx_clk_fixed_factor("sys1_pll_200m", "sys=
1_pll_200m_cg", 1, 4);
+	clks[IMX8MQ_SYS1_PLL_266M] =3D imx_clk_fixed_factor("sys1_pll_266m", "sys=
1_pll_266m_cg", 1, 3);
+	clks[IMX8MQ_SYS1_PLL_400M] =3D imx_clk_fixed_factor("sys1_pll_400m", "sys=
1_pll_400m_cg", 1, 2);
+	clks[IMX8MQ_SYS1_PLL_800M] =3D imx_clk_fixed_factor("sys1_pll_800m", "sys=
1_pll_800m_cg", 1, 1);
+
+	/* SYS PLL2 fixed output */
+	clks[IMX8MQ_SYS2_PLL_50M_CG] =3D imx_clk_gate("sys2_pll_50m_cg", "sys2_pl=
l_out", base + 0x3c, 9);
+	clks[IMX8MQ_SYS2_PLL_100M_CG] =3D imx_clk_gate("sys2_pll_100m_cg", "sys2_=
pll_out", base + 0x3c, 11);
+	clks[IMX8MQ_SYS2_PLL_125M_CG] =3D imx_clk_gate("sys2_pll_125m_cg", "sys2_=
pll_out", base + 0x3c, 13);
+	clks[IMX8MQ_SYS2_PLL_166M_CG] =3D imx_clk_gate("sys2_pll_166m_cg", "sys2_=
pll_out", base + 0x3c, 15);
+	clks[IMX8MQ_SYS2_PLL_200M_CG] =3D imx_clk_gate("sys2_pll_200m_cg", "sys2_=
pll_out", base + 0x3c, 17);
+	clks[IMX8MQ_SYS2_PLL_250M_CG] =3D imx_clk_gate("sys2_pll_250m_cg", "sys2_=
pll_out", base + 0x3c, 19);
+	clks[IMX8MQ_SYS2_PLL_333M_CG] =3D imx_clk_gate("sys2_pll_333m_cg", "sys2_=
pll_out", base + 0x3c, 21);
+	clks[IMX8MQ_SYS2_PLL_500M_CG] =3D imx_clk_gate("sys2_pll_500m_cg", "sys2_=
pll_out", base + 0x3c, 23);
+	clks[IMX8MQ_SYS2_PLL_1000M_CG] =3D imx_clk_gate("sys2_pll_1000m_cg", "sys=
2_pll_out", base + 0x3c, 25);
+
+	clks[IMX8MQ_SYS2_PLL_50M] =3D imx_clk_fixed_factor("sys2_pll_50m", "sys2_=
pll_50m_cg", 1, 20);
+	clks[IMX8MQ_SYS2_PLL_100M] =3D imx_clk_fixed_factor("sys2_pll_100m", "sys=
2_pll_100m_cg", 1, 10);
+	clks[IMX8MQ_SYS2_PLL_125M] =3D imx_clk_fixed_factor("sys2_pll_125m", "sys=
2_pll_125m_cg", 1, 8);
+	clks[IMX8MQ_SYS2_PLL_166M] =3D imx_clk_fixed_factor("sys2_pll_166m", "sys=
2_pll_166m_cg", 1, 6);
+	clks[IMX8MQ_SYS2_PLL_200M] =3D imx_clk_fixed_factor("sys2_pll_200m", "sys=
2_pll_200m_cg", 1, 5);
+	clks[IMX8MQ_SYS2_PLL_250M] =3D imx_clk_fixed_factor("sys2_pll_250m", "sys=
2_pll_250m_cg", 1, 4);
+	clks[IMX8MQ_SYS2_PLL_333M] =3D imx_clk_fixed_factor("sys2_pll_333m", "sys=
2_pll_333m_cg", 1, 3);
+	clks[IMX8MQ_SYS2_PLL_500M] =3D imx_clk_fixed_factor("sys2_pll_500m", "sys=
2_pll_500m_cg", 1, 2);
+	clks[IMX8MQ_SYS2_PLL_1000M] =3D imx_clk_fixed_factor("sys2_pll_1000m", "s=
ys2_pll_1000m_cg", 1, 1);
=20
 	np =3D dev->of_node;
 	base =3D devm_platform_ioremap_resource(pdev, 0);
 	if (WARN_ON(IS_ERR(base)))
 		return PTR_ERR(base);
diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindings=
/clock/imx8mq-clock.h
index 35b9ed9d62d8..3bab9b21c8d7 100644
--- a/include/dt-bindings/clock/imx8mq-clock.h
+++ b/include/dt-bindings/clock/imx8mq-clock.h
@@ -403,7 +403,27 @@
 #define IMX8MQ_CLK_SNVS_ROOT			264
 #define IMX8MQ_CLK_GIC				265
=20
 #define IMX8MQ_VIDEO2_PLL1_REF_SEL		266
=20
-#define IMX8MQ_CLK_END				267
+#define IMX8MQ_SYS1_PLL_40M_CG			267
+#define IMX8MQ_SYS1_PLL_80M_CG			268
+#define IMX8MQ_SYS1_PLL_100M_CG			269
+#define IMX8MQ_SYS1_PLL_133M_CG			270
+#define IMX8MQ_SYS1_PLL_160M_CG			271
+#define IMX8MQ_SYS1_PLL_200M_CG			272
+#define IMX8MQ_SYS1_PLL_266M_CG			273
+#define IMX8MQ_SYS1_PLL_400M_CG			274
+#define IMX8MQ_SYS1_PLL_800M_CG			275
+#define IMX8MQ_SYS2_PLL_50M_CG			276
+#define IMX8MQ_SYS2_PLL_100M_CG			277
+#define IMX8MQ_SYS2_PLL_125M_CG			278
+#define IMX8MQ_SYS2_PLL_166M_CG			279
+#define IMX8MQ_SYS2_PLL_200M_CG			280
+#define IMX8MQ_SYS2_PLL_250M_CG			281
+#define IMX8MQ_SYS2_PLL_333M_CG			282
+#define IMX8MQ_SYS2_PLL_500M_CG			283
+#define IMX8MQ_SYS2_PLL_1000M_CG		284
+
+#define IMX8MQ_CLK_END				285
+
 #endif /* __DT_BINDINGS_CLOCK_IMX8MQ_H */
--=20
2.17.1


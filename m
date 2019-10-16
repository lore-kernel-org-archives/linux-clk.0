Return-Path: <SRS0=uqeP=YJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1B2FA372A
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 11:57:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 561CB218DE
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 11:57:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ly32fzeM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729459AbfJPL5t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Oct 2019 07:57:49 -0400
Received: from mail-eopbgr10044.outbound.protection.outlook.com ([40.107.1.44]:62173
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726372AbfJPL5s (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Oct 2019 07:57:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P83e88GKsozsaiNf1cQb3q40309AusmVD8dr6evtFZdSvUQXBzrd8R5B4XNLmYIuy5Uz5+GrQ+MybGJG1b0pbqDfECfFmzgoMfRDKqq2iORH9tn+4c+PQftdlW1I9cIs2T3RHobGTnFcpgRz8IrnBvGIGZvdvhrV1p/a12jOhagV0sFhEVPfEOpmHW622tgpvn9gJ2NMh5Vbma2y8F8HtMrlxvYDyTn9yh3/eaig4urwvB+jsF/GXg61R6vwoTJb72BUoU6sBwtWjuW2rK+ZYJqFq7K7Q0NB3U/6FbFU1LF8njdBlKh4D8+dSyiEU3DxQhlIz5pWi8TAAnfNvD3mIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPlqa7Q+84QVVVe/sKjJBU8i0BO0D+92m2HbtA45WQQ=;
 b=GjGaXRhwxpc32gwj3MXcB10T4BHakV0zzQ7/QPqQJrkmijGHW1gfmOob5ZQLm39b5dkqxHOUAKKXXxd1JJOf40uZnpHA4SIAt1n0IOMkXRHnzv6s0LgWIFLLYYC+IFzFruTaNeTyXhh3dGqhUAtVLij6gNVbyjXiFixyvrcdGzat/DsvlJTvXc5sQ0trhBJiIpma2ElnA8YjNYTZhRRc3plws5VeGjgM7mp2Fl6DzOKbDL/ZlGDG6/JGdmCHq+nBfKePjN6xHn0Bh6e7HzPMnVa0DKlVHHCpbs30R+anOI06AFv2sJJBJfFVPw2T18t5WrW4oFAtJHdssPeQ/bvmaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPlqa7Q+84QVVVe/sKjJBU8i0BO0D+92m2HbtA45WQQ=;
 b=ly32fzeMIklnOy6v0myUPm5kpo86ivNlwlXKPXEn5RmjZ2j6a57pcepWhx26af3nC4d1iQSQqsBFQNSDhU6v+ve6KSfsWydpvwFXFKt/3pxWmwjyaV1GX4niZJtJB8A+x8ahMYdbG4uwXJD8nSGB2JhaqMOOIo9F89/vbq7zGyA=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB7136.eurprd04.prod.outlook.com (10.186.156.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.23; Wed, 16 Oct 2019 11:57:39 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58d9:b0f7:b31:c05a]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58d9:b0f7:b31:c05a%7]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 11:57:39 +0000
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
Subject: [PATCH v3 2/3] clk: imx8mm: Define gates for pll1/2 fixed dividers
Thread-Topic: [PATCH v3 2/3] clk: imx8mm: Define gates for pll1/2 fixed
 dividers
Thread-Index: AQHVhBjoYYGHUEjdSECmNWpB5WoUXQ==
Date:   Wed, 16 Oct 2019 11:57:39 +0000
Message-ID: <819c24f74647bcf7e254425aa42089864e170ce3.1571226979.git.leonard.crestez@nxp.com>
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
x-ms-office365-filtering-correlation-id: 6b7aa3fc-6dc7-4d73-c9c3-08d752300ad4
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR04MB7136:|VI1PR04MB7136:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB713601C47CF9EA0987572582EE920@VI1PR04MB7136.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(199004)(189003)(66946007)(66476007)(6436002)(4326008)(81166006)(81156014)(118296001)(2906002)(66556008)(64756008)(66446008)(6512007)(256004)(6486002)(14454004)(71190400001)(71200400001)(186003)(3846002)(11346002)(8936002)(25786009)(2616005)(305945005)(50226002)(476003)(446003)(110136005)(66066001)(26005)(478600001)(52116002)(7736002)(76176011)(36756003)(102836004)(8676002)(486006)(54906003)(386003)(6506007)(6116002)(5660300002)(86362001)(316002)(99286004)(44832011)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB7136;H:VI1PR04MB7023.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2gk0H2JIo5UNB7mcOIeCku8GrOOeFlXRMdWvBXiBb8oiswogjViXnoYav2HEsD6BEfVWWKX6IVdARVXzAMIqQCPqVCUU76128+gpPxuKKQ4cCrS85nRR5ySP+ug5ccGj9UGZ3/AEuNsWlXxumlvLVjymngzcCfrUfvG+k42MD/oMQnSGszIvNjq9/6Z0EJertmgIMt0wjd9ARYWnATVljtt7QFx4zqekwzncBqw2cCpWE35jxjB7JX4HRf/giKEDurEabsRFYV0VUaV/RaHZeHGsNJKERdHMDfEa0SJfZcTB0eKG7cnLL92MHux3mY5FVRZUH0tHYkFMvYuGy0vZDXgnNmTvhTXhxas1ycQZo8sf/ITI9YncjUyrVRpLr8LqucaUsatklpWJIq8+t3KWosBqIC2NcM4g98jtDeDyF40=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <477B960D9DD82945B0702742F249D8A4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7aa3fc-6dc7-4d73-c9c3-08d752300ad4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 11:57:39.1602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8d8NKBsX1soKolYdxtke+UY42/CrXBbSv9rWZ+zNHN/HWQUjcQFPW+i7jSUpN9Ulxrm/p1ZA9tQorzIUEujOeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7136
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On imx8mm there are 9 fixed-factor dividers for SYS_PLL1 and SYS_PLL2
each with their own gate. Only one of these gates (the one "dividing" by
one) is currently defined and it's incorrectly set as the parent of all
the fixed-factor dividers.

Add the other 8 gates to the clock tree between sys_pll1/2_bypass and
the fixed dividers.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/imx/clk-imx8mm.c             | 57 ++++++++++++++++--------
 include/dt-bindings/clock/imx8mm-clock.h | 19 +++++++-
 2 files changed, 56 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 04876ec66127..bbd212eb904e 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -358,33 +358,52 @@ static int imx8mm_clocks_probe(struct platform_device=
 *pdev)
 	clks[IMX8MM_VIDEO_PLL1_OUT] =3D imx_clk_gate("video_pll1_out", "video_pll=
1_bypass", base + 0x28, 13);
 	clks[IMX8MM_DRAM_PLL_OUT] =3D imx_clk_gate("dram_pll_out", "dram_pll_bypa=
ss", base + 0x50, 13);
 	clks[IMX8MM_GPU_PLL_OUT] =3D imx_clk_gate("gpu_pll_out", "gpu_pll_bypass"=
, base + 0x64, 11);
 	clks[IMX8MM_VPU_PLL_OUT] =3D imx_clk_gate("vpu_pll_out", "vpu_pll_bypass"=
, base + 0x74, 11);
 	clks[IMX8MM_ARM_PLL_OUT] =3D imx_clk_gate("arm_pll_out", "arm_pll_bypass"=
, base + 0x84, 11);
-	clks[IMX8MM_SYS_PLL1_OUT] =3D imx_clk_gate("sys_pll1_out", "sys_pll1_bypa=
ss", base + 0x94, 11);
-	clks[IMX8MM_SYS_PLL2_OUT] =3D imx_clk_gate("sys_pll2_out", "sys_pll2_bypa=
ss", base + 0x104, 11);
 	clks[IMX8MM_SYS_PLL3_OUT] =3D imx_clk_gate("sys_pll3_out", "sys_pll3_bypa=
ss", base + 0x114, 11);
=20
-	/* SYS PLL fixed output */
-	clks[IMX8MM_SYS_PLL1_40M] =3D imx_clk_fixed_factor("sys_pll1_40m", "sys_p=
ll1_out", 1, 20);
-	clks[IMX8MM_SYS_PLL1_80M] =3D imx_clk_fixed_factor("sys_pll1_80m", "sys_p=
ll1_out", 1, 10);
-	clks[IMX8MM_SYS_PLL1_100M] =3D imx_clk_fixed_factor("sys_pll1_100m", "sys=
_pll1_out", 1, 8);
-	clks[IMX8MM_SYS_PLL1_133M] =3D imx_clk_fixed_factor("sys_pll1_133m", "sys=
_pll1_out", 1, 6);
-	clks[IMX8MM_SYS_PLL1_160M] =3D imx_clk_fixed_factor("sys_pll1_160m", "sys=
_pll1_out", 1, 5);
-	clks[IMX8MM_SYS_PLL1_200M] =3D imx_clk_fixed_factor("sys_pll1_200m", "sys=
_pll1_out", 1, 4);
-	clks[IMX8MM_SYS_PLL1_266M] =3D imx_clk_fixed_factor("sys_pll1_266m", "sys=
_pll1_out", 1, 3);
-	clks[IMX8MM_SYS_PLL1_400M] =3D imx_clk_fixed_factor("sys_pll1_400m", "sys=
_pll1_out", 1, 2);
+	/* SYS PLL1 fixed output */
+	clks[IMX8MM_SYS_PLL1_40M_CG] =3D imx_clk_gate("sys_pll1_40m_cg", "sys_pll=
1_bypass", base + 0x94, 27);
+	clks[IMX8MM_SYS_PLL1_80M_CG] =3D imx_clk_gate("sys_pll1_80m_cg", "sys_pll=
1_bypass", base + 0x94, 25);
+	clks[IMX8MM_SYS_PLL1_100M_CG] =3D imx_clk_gate("sys_pll1_100m_cg", "sys_p=
ll1_bypass", base + 0x94, 23);
+	clks[IMX8MM_SYS_PLL1_133M_CG] =3D imx_clk_gate("sys_pll1_133m_cg", "sys_p=
ll1_bypass", base + 0x94, 21);
+	clks[IMX8MM_SYS_PLL1_160M_CG] =3D imx_clk_gate("sys_pll1_160m_cg", "sys_p=
ll1_bypass", base + 0x94, 19);
+	clks[IMX8MM_SYS_PLL1_200M_CG] =3D imx_clk_gate("sys_pll1_200m_cg", "sys_p=
ll1_bypass", base + 0x94, 17);
+	clks[IMX8MM_SYS_PLL1_266M_CG] =3D imx_clk_gate("sys_pll1_266m_cg", "sys_p=
ll1_bypass", base + 0x94, 15);
+	clks[IMX8MM_SYS_PLL1_400M_CG] =3D imx_clk_gate("sys_pll1_400m_cg", "sys_p=
ll1_bypass", base + 0x94, 13);
+	clks[IMX8MM_SYS_PLL1_OUT] =3D imx_clk_gate("sys_pll1_out", "sys_pll1_bypa=
ss", base + 0x94, 11);
+
+	clks[IMX8MM_SYS_PLL1_40M] =3D imx_clk_fixed_factor("sys_pll1_40m", "sys_p=
ll1_40m_cg", 1, 20);
+	clks[IMX8MM_SYS_PLL1_80M] =3D imx_clk_fixed_factor("sys_pll1_80m", "sys_p=
ll1_80m_cg", 1, 10);
+	clks[IMX8MM_SYS_PLL1_100M] =3D imx_clk_fixed_factor("sys_pll1_100m", "sys=
_pll1_100m_cg", 1, 8);
+	clks[IMX8MM_SYS_PLL1_133M] =3D imx_clk_fixed_factor("sys_pll1_133m", "sys=
_pll1_133m_cg", 1, 6);
+	clks[IMX8MM_SYS_PLL1_160M] =3D imx_clk_fixed_factor("sys_pll1_160m", "sys=
_pll1_160m_cg", 1, 5);
+	clks[IMX8MM_SYS_PLL1_200M] =3D imx_clk_fixed_factor("sys_pll1_200m", "sys=
_pll1_200m_cg", 1, 4);
+	clks[IMX8MM_SYS_PLL1_266M] =3D imx_clk_fixed_factor("sys_pll1_266m", "sys=
_pll1_266m_cg", 1, 3);
+	clks[IMX8MM_SYS_PLL1_400M] =3D imx_clk_fixed_factor("sys_pll1_400m", "sys=
_pll1_400m_cg", 1, 2);
 	clks[IMX8MM_SYS_PLL1_800M] =3D imx_clk_fixed_factor("sys_pll1_800m", "sys=
_pll1_out", 1, 1);
=20
-	clks[IMX8MM_SYS_PLL2_50M] =3D imx_clk_fixed_factor("sys_pll2_50m", "sys_p=
ll2_out", 1, 20);
-	clks[IMX8MM_SYS_PLL2_100M] =3D imx_clk_fixed_factor("sys_pll2_100m", "sys=
_pll2_out", 1, 10);
-	clks[IMX8MM_SYS_PLL2_125M] =3D imx_clk_fixed_factor("sys_pll2_125m", "sys=
_pll2_out", 1, 8);
-	clks[IMX8MM_SYS_PLL2_166M] =3D imx_clk_fixed_factor("sys_pll2_166m", "sys=
_pll2_out", 1, 6);
-	clks[IMX8MM_SYS_PLL2_200M] =3D imx_clk_fixed_factor("sys_pll2_200m", "sys=
_pll2_out", 1, 5);
-	clks[IMX8MM_SYS_PLL2_250M] =3D imx_clk_fixed_factor("sys_pll2_250m", "sys=
_pll2_out", 1, 4);
-	clks[IMX8MM_SYS_PLL2_333M] =3D imx_clk_fixed_factor("sys_pll2_333m", "sys=
_pll2_out", 1, 3);
-	clks[IMX8MM_SYS_PLL2_500M] =3D imx_clk_fixed_factor("sys_pll2_500m", "sys=
_pll2_out", 1, 2);
+	/* SYS PLL2 fixed output */
+	clks[IMX8MM_SYS_PLL2_50M_CG] =3D imx_clk_gate("sys_pll2_50m_cg", "sys_pll=
2_bypass", base + 0x104, 27);
+	clks[IMX8MM_SYS_PLL2_100M_CG] =3D imx_clk_gate("sys_pll2_100m_cg", "sys_p=
ll2_bypass", base + 0x104, 25);
+	clks[IMX8MM_SYS_PLL2_125M_CG] =3D imx_clk_gate("sys_pll2_125m_cg", "sys_p=
ll2_bypass", base + 0x104, 23);
+	clks[IMX8MM_SYS_PLL2_166M_CG] =3D imx_clk_gate("sys_pll2_166m_cg", "sys_p=
ll2_bypass", base + 0x104, 21);
+	clks[IMX8MM_SYS_PLL2_200M_CG] =3D imx_clk_gate("sys_pll2_200m_cg", "sys_p=
ll2_bypass", base + 0x104, 19);
+	clks[IMX8MM_SYS_PLL2_250M_CG] =3D imx_clk_gate("sys_pll2_250m_cg", "sys_p=
ll2_bypass", base + 0x104, 17);
+	clks[IMX8MM_SYS_PLL2_333M_CG] =3D imx_clk_gate("sys_pll2_333m_cg", "sys_p=
ll2_bypass", base + 0x104, 15);
+	clks[IMX8MM_SYS_PLL2_500M_CG] =3D imx_clk_gate("sys_pll2_500m_cg", "sys_p=
ll2_bypass", base + 0x104, 13);
+	clks[IMX8MM_SYS_PLL2_OUT] =3D imx_clk_gate("sys_pll2_out", "sys_pll2_bypa=
ss", base + 0x104, 11);
+
+	clks[IMX8MM_SYS_PLL2_50M] =3D imx_clk_fixed_factor("sys_pll2_50m", "sys_p=
ll2_50m_cg", 1, 20);
+	clks[IMX8MM_SYS_PLL2_100M] =3D imx_clk_fixed_factor("sys_pll2_100m", "sys=
_pll2_100m_cg", 1, 10);
+	clks[IMX8MM_SYS_PLL2_125M] =3D imx_clk_fixed_factor("sys_pll2_125m", "sys=
_pll2_125m_cg", 1, 8);
+	clks[IMX8MM_SYS_PLL2_166M] =3D imx_clk_fixed_factor("sys_pll2_166m", "sys=
_pll2_166m_cg", 1, 6);
+	clks[IMX8MM_SYS_PLL2_200M] =3D imx_clk_fixed_factor("sys_pll2_200m", "sys=
_pll2_200m_cg", 1, 5);
+	clks[IMX8MM_SYS_PLL2_250M] =3D imx_clk_fixed_factor("sys_pll2_250m", "sys=
_pll2_250m_cg", 1, 4);
+	clks[IMX8MM_SYS_PLL2_333M] =3D imx_clk_fixed_factor("sys_pll2_333m", "sys=
_pll2_333m_cg", 1, 3);
+	clks[IMX8MM_SYS_PLL2_500M] =3D imx_clk_fixed_factor("sys_pll2_500m", "sys=
_pll2_500m_cg", 1, 2);
 	clks[IMX8MM_SYS_PLL2_1000M] =3D imx_clk_fixed_factor("sys_pll2_1000m", "s=
ys_pll2_out", 1, 1);
=20
 	np =3D dev->of_node;
 	base =3D devm_platform_ioremap_resource(pdev, 0);
 	if (WARN_ON(IS_ERR(base)))
diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings=
/clock/imx8mm-clock.h
index 07e6c686f3ef..edeece2289f0 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -246,8 +246,25 @@
 #define IMX8MM_CLK_GPIO5_ROOT			227
=20
 #define IMX8MM_CLK_SNVS_ROOT			228
 #define IMX8MM_CLK_GIC				229
=20
-#define IMX8MM_CLK_END				230
+#define IMX8MM_SYS_PLL1_40M_CG			230
+#define IMX8MM_SYS_PLL1_80M_CG			231
+#define IMX8MM_SYS_PLL1_100M_CG			232
+#define IMX8MM_SYS_PLL1_133M_CG			233
+#define IMX8MM_SYS_PLL1_160M_CG			234
+#define IMX8MM_SYS_PLL1_200M_CG			235
+#define IMX8MM_SYS_PLL1_266M_CG			236
+#define IMX8MM_SYS_PLL1_400M_CG			237
+#define IMX8MM_SYS_PLL2_50M_CG			238
+#define IMX8MM_SYS_PLL2_100M_CG			239
+#define IMX8MM_SYS_PLL2_125M_CG			240
+#define IMX8MM_SYS_PLL2_166M_CG			241
+#define IMX8MM_SYS_PLL2_200M_CG			242
+#define IMX8MM_SYS_PLL2_250M_CG			243
+#define IMX8MM_SYS_PLL2_333M_CG			244
+#define IMX8MM_SYS_PLL2_500M_CG			245
+
+#define IMX8MM_CLK_END				246
=20
 #endif
--=20
2.17.1


Return-Path: <SRS0=gnDx=WJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAC5C32750
	for <linux-clk@archiver.kernel.org>; Tue, 13 Aug 2019 17:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49A8B2067D
	for <linux-clk@archiver.kernel.org>; Tue, 13 Aug 2019 17:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbfHMRFj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Aug 2019 13:05:39 -0400
Received: from inva020.nxp.com ([92.121.34.13]:55102 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725923AbfHMRFi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Aug 2019 13:05:38 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4A5BC1A07B2;
        Tue, 13 Aug 2019 19:05:36 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3C7041A07B8;
        Tue, 13 Aug 2019 19:05:36 +0200 (CEST)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id B03A02060E;
        Tue, 13 Aug 2019 19:05:35 +0200 (CEST)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Jacky Bai <ping.bai@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Anson Huang <Anson.Huang@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] clk: imx8mm: Fix incorrect parents
Date:   Tue, 13 Aug 2019 20:05:29 +0300
Message-Id: <921e55812ed074d663db7cbfb53f326ae38617f7.1565715590.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1565715590.git.leonard.crestez@nxp.com>
References: <cover.1565715590.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1565715590.git.leonard.crestez@nxp.com>
References: <cover.1565715590.git.leonard.crestez@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

* There is no video_pll2 on imx8mm, replace with dummy
* Replace reference to sys_pll3_clk with sys_pll3_out
* qspi parent[2] is sys_pll2_333m not sys_pll1_800m

Fixes: ba5625c3e272 ("clk: imx: Add clock driver support for imx8mm")
Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/imx/clk-imx8mm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 69ec274d4974..2758e3f0d15d 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -173,14 +173,14 @@ static const char *imx8mm_vpu_g1_sels[] = {"osc_24m", "vpu_pll_out", "sys_pll1_8
 					   "sys_pll1_100m", "sys_pll2_125m", "sys_pll3_out", "audio_pll1_out", };
 
 static const char *imx8mm_vpu_g2_sels[] = {"osc_24m", "vpu_pll_out", "sys_pll1_800m", "sys_pll2_1000m",
 					   "sys_pll1_100m", "sys_pll2_125m", "sys_pll3_out", "audio_pll1_out", };
 
-static const char *imx8mm_disp_dtrc_sels[] = {"osc_24m", "video_pll2_out", "sys_pll1_800m", "sys_pll2_1000m",
+static const char *imx8mm_disp_dtrc_sels[] = {"osc_24m", "dummy", "sys_pll1_800m", "sys_pll2_1000m",
 					      "sys_pll1_160m", "video_pll1_out", "sys_pll3_out", "audio_pll2_out", };
 
-static const char *imx8mm_disp_dc8000_sels[] = {"osc_24m", "video_pll2_out", "sys_pll1_800m", "sys_pll2_1000m",
+static const char *imx8mm_disp_dc8000_sels[] = {"osc_24m", "dummy", "sys_pll1_800m", "sys_pll2_1000m",
 						"sys_pll1_160m", "video_pll1_out", "sys_pll3_out", "audio_pll2_out", };
 
 static const char *imx8mm_pcie1_ctrl_sels[] = {"osc_24m", "sys_pll2_250m", "sys_pll2_200m", "sys_pll1_266m",
 					       "sys_pll1_800m", "sys_pll2_500m", "sys_pll2_333m", "sys_pll3_out", };
 
@@ -230,11 +230,11 @@ static const char *imx8mm_enet_phy_sels[] = {"osc_24m", "sys_pll2_50m", "sys_pll
 					     "sys_pll2_500m", "video_pll1_out", "audio_pll2_out", };
 
 static const char *imx8mm_nand_sels[] = {"osc_24m", "sys_pll2_500m", "audio_pll1_out", "sys_pll1_400m",
 					 "audio_pll2_out", "sys_pll3_out", "sys_pll2_250m", "video_pll1_out", };
 
-static const char *imx8mm_qspi_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll1_800m", "sys_pll2_500m",
+static const char *imx8mm_qspi_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll2_333m", "sys_pll2_500m",
 					 "audio_pll2_out", "sys_pll1_266m", "sys_pll3_out", "sys_pll1_100m", };
 
 static const char *imx8mm_usdhc1_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll1_800m", "sys_pll2_500m",
 					   "sys_pll3_out", "sys_pll1_266m", "audio_pll2_out", "sys_pll1_100m", };
 
@@ -345,11 +345,11 @@ static const char *imx8mm_ecspi3_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1
 
 static const char *imx8mm_pdm_sels[] = {"osc_24m", "sys_pll2_100m", "audio_pll1_out", "sys_pll1_800m",
 					"sys_pll2_1000m", "sys_pll3_out", "clk_ext3", "audio_pll2_out", };
 
 static const char *imx8mm_vpu_h1_sels[] = {"osc_24m", "vpu_pll_out", "sys_pll1_800m", "sys_pll2_1000m",
-					   "audio_pll2_out", "sys_pll2_125m", "sys_pll3_clk", "audio_pll1_out", };
+					   "audio_pll2_out", "sys_pll2_125m", "sys_pll3_out", "audio_pll1_out", };
 
 static const char *imx8mm_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", };
 
 static const char *imx8mm_clko1_sels[] = {"osc_24m", "sys_pll1_800m", "osc_27m", "sys_pll1_200m", "audio_pll2_out",
 					 "vpu_pll", "sys_pll1_80m", };
-- 
2.17.1


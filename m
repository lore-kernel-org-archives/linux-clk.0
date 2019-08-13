Return-Path: <SRS0=gnDx=WJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923C0C433FF
	for <linux-clk@archiver.kernel.org>; Tue, 13 Aug 2019 17:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71A052067D
	for <linux-clk@archiver.kernel.org>; Tue, 13 Aug 2019 17:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbfHMRFj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Aug 2019 13:05:39 -0400
Received: from inva021.nxp.com ([92.121.34.21]:57734 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726354AbfHMRFj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Aug 2019 13:05:39 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DA97B2007B0;
        Tue, 13 Aug 2019 19:05:36 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CCC272000A4;
        Tue, 13 Aug 2019 19:05:36 +0200 (CEST)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 4C3832060E;
        Tue, 13 Aug 2019 19:05:36 +0200 (CEST)
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
Subject: [PATCH 3/4] clk: imx8mn: Fix incorrect parents
Date:   Tue, 13 Aug 2019 20:05:30 +0300
Message-Id: <d0dd4c7f60c430e9f5d3bdc6b51efa8837851e01.1565715590.git.leonard.crestez@nxp.com>
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

* Replace to audio_pll2_clk with audio_pll2_out
* Replace sys3_pll2_out with sys_pll3_out
* Replace sys1_pll_40m with sys_pll1_40m
* qspi parent[2] is sys_pll2_333m not sys_pll1_800m

Fixes: 96d6392b54db ("clk: imx: Add support for i.MX8MN clock driver")
Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/imx/clk-imx8mn.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index ecd1062f6847..106cc417c19b 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -138,11 +138,11 @@ static const char * const imx8mn_nand_usdhc_sels[] = {"osc_24m", "sys_pll1_266m"
 static const char * const imx8mn_disp_axi_sels[] = {"osc_24m", "sys_pll2_1000m", "sys_pll1_800m",
 						    "sys_pll3_out", "sys_pll1_40m", "audio_pll2_out",
 						    "clk_ext1", "clk_ext4", };
 
 static const char * const imx8mn_disp_apb_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pll1_800m",
-						    "sys_pll3_out", "sys1_pll_40m", "audio_pll2_out",
+						    "sys_pll3_out", "sys_pll1_40m", "audio_pll2_out",
 						    "clk_ext1", "clk_ext3", };
 
 static const char * const imx8mn_usb_bus_sels[] = {"osc_24m", "sys_pll2_500m", "sys_pll1_800m",
 						   "sys_pll2_100m", "sys_pll2_200m", "clk_ext2",
 						   "clk_ext4", "audio_pll2_out", };
@@ -217,13 +217,13 @@ static const char * const imx8mn_enet_phy_sels[] = {"osc_24m", "sys_pll2_50m", "
 
 static const char * const imx8mn_nand_sels[] = {"osc_24m", "sys_pll2_500m", "audio_pll1_out",
 						"sys_pll1_400m", "audio_pll2_out", "sys_pll3_out",
 						"sys_pll2_250m", "video_pll1_out", };
 
-static const char * const imx8mn_qspi_sels[] = {"osc_24m", "sys1_pll_400m", "sys_pll1_800m",
-						"sys2_pll_500m", "audio_pll2_out", "sys1_pll_266m",
-						"sys3_pll2_out", "sys1_pll_100m", };
+static const char * const imx8mn_qspi_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll2_333m",
+						"sys_pll2_500m", "audio_pll2_out", "sys_pll1_266m",
+						"sys_pll3_out", "sys_pll1_100m", };
 
 static const char * const imx8mn_usdhc1_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll1_800m",
 						  "sys_pll2_500m", "sys_pll3_out", "sys_pll1_266m",
 						  "audio_pll2_out", "sys_pll1_100m", };
 
@@ -286,11 +286,11 @@ static const char * const imx8mn_pwm1_sels[] = {"osc_24m", "sys_pll2_100m", "sys
 static const char * const imx8mn_pwm2_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m",
 						"sys_pll1_40m", "sys_pll3_out", "clk_ext1",
 						"sys_pll1_80m", "video_pll1_out", };
 
 static const char * const imx8mn_pwm3_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m",
-						"sys_pll1_40m", "sys3_pll2_out", "clk_ext2",
+						"sys_pll1_40m", "sys_pll3_out", "clk_ext2",
 						"sys_pll1_80m", "video_pll1_out", };
 
 static const char * const imx8mn_pwm4_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m",
 						"sys_pll1_40m", "sys_pll3_out", "clk_ext2",
 						"sys_pll1_80m", "video_pll1_out", };
@@ -315,11 +315,11 @@ static const char * const imx8mn_dsi_dbi_sels[] = {"osc_24m", "sys_pll1_266m", "
 						   "sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out",
 						   "audio_pll2_out", "video_pll1_out", };
 
 static const char * const imx8mn_usdhc3_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll1_800m",
 						  "sys_pll2_500m", "sys_pll3_out", "sys_pll1_266m",
-						  "audio_pll2_clk", "sys_pll1_100m", };
+						  "audio_pll2_out", "sys_pll1_100m", };
 
 static const char * const imx8mn_camera_pixel_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m",
 							"sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out",
 							"audio_pll2_out", "video_pll1_out", };
 
@@ -344,11 +344,11 @@ static const char * const imx8mn_pdm_sels[] = {"osc_24m", "sys_pll2_100m", "audi
 					       "clk_ext3", "audio_pll2_out", };
 
 static const char * const imx8mn_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", };
 
 static const char * const imx8mn_clko1_sels[] = {"osc_24m", "sys_pll1_800m", "osc_27m",
-						 "sys_pll1_200m", "audio_pll2_clk", "vpu_pll",
+						 "sys_pll1_200m", "audio_pll2_out", "vpu_pll",
 						 "sys_pll1_80m", };
 static const char * const imx8mn_clko2_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1_400m",
 						 "sys_pll2_166m", "sys_pll3_out", "audio_pll1_out",
 						 "video_pll1_out", "osc_32k", };
 
-- 
2.17.1


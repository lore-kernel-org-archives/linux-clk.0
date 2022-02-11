Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D18C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 11 Feb 2022 09:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiBKJNW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Feb 2022 04:13:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343598AbiBKJNW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Feb 2022 04:13:22 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DF11029
        for <linux-clk@vger.kernel.org>; Fri, 11 Feb 2022 01:13:22 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35F0B48A;
        Fri, 11 Feb 2022 10:13:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644570799;
        bh=lL/97hITDnvwgNXyyRZRC0cz2oGmNGp15khoT5iIlT8=;
        h=From:To:Cc:Subject:Date:From;
        b=T+VFu074JSwb0oIB8Lo5MctMPyglQ/Dse1fj7k2RsDr73olTzxCtAiHsphBL99Lua
         Zz1lU6FTq+8hUyr1Hx7W68BeMHm7URemC+Txbd9x8jahGMytEGa/bHQKn++2Gwnisq
         l4ikyQXP7b0Fu+LaAMEAVvMwhLzaMTK7q4abPcUk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-clk@vger.kernel.org
Cc:     Abel Vesa <abel.vesa@nxp.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH] clk: imx8mp: Add missing IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT clock
Date:   Fri, 11 Feb 2022 11:13:11 +0200
Message-Id: <20220211091311.28146-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT clock derives from the
media_mipi_phy1_ref clock and is gated by the shared media clock gate.
Its identifier is defined in dt-bindings/clock/imx8mp-clock.h but its
definition is missing from the driver. Add it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/clk/imx/clk-imx8mp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index c990ad37882b..f23b92906d3b 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -694,6 +694,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_cam2_pix_root_clk", "media_cam2_pix", ccm_base + 0x45d0, 0, &share_count_media);
 	hws[IMX8MP_CLK_MEDIA_DISP1_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp1_pix_root_clk", "media_disp1_pix", ccm_base + 0x45d0, 0, &share_count_media);
 	hws[IMX8MP_CLK_MEDIA_DISP2_PIX_ROOT] = imx_clk_hw_gate2_shared2("media_disp2_pix_root_clk", "media_disp2_pix", ccm_base + 0x45d0, 0, &share_count_media);
+	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT] = imx_clk_hw_gate2_shared2("media_mipi_phy1_ref_root", "media_mipi_phy1_ref", ccm_base + 0x45d0, 0, &share_count_media);
 	hws[IMX8MP_CLK_MEDIA_ISP_ROOT] = imx_clk_hw_gate2_shared2("media_isp_root_clk", "media_isp", ccm_base + 0x45d0, 0, &share_count_media);
 
 	hws[IMX8MP_CLK_USDHC3_ROOT] = imx_clk_hw_gate4("usdhc3_root_clk", "usdhc3", ccm_base + 0x45e0, 0);
-- 
Regards,

Laurent Pinchart


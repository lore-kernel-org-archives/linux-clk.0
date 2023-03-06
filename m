Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61753C6FA99
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 14:07:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjCFOHD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 09:07:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbjCFOGw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 09:06:52 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2422311B;
        Mon,  6 Mar 2023 06:06:26 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 715CD6602FCA;
        Mon,  6 Mar 2023 14:06:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1678111568;
        bh=Iu6k+PbPBvtvaUy/uF3aIBmcGMGBX1+Dm5St8Qyg5Gw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R4qqneoElKXoJ445Wso7GY3Kt8+zaRaluYrNFvvXqH5F0QeJ3gQ+rfgFsDgeTd7EK
         KAtxMDCsClrJepYX7Tiwz9bvBUjMicSUNBMJPEG0DmpunF3lbRr+6nsiu1fp/g/3zj
         uRCJrXU8qbf0VwglKIcO4rYpc88VzExQOA0rNCGmena20xSXwDJieKTnHVHtjan1jc
         1EJuGRt201r2X2V6k1QcCoc6uHPDwKTz2Qn07mNmFrQprbKfKDLQufNJyQ5zCdTyyb
         f8YIqg+VyyJi24rW2D6IG4Vc1VCjsO3T8FUy2jESPNinbvCoz9iwb+hbxQVp4T5GQB
         woaWj3Xt9CZug==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, wenst@chromium.org,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: [PATCH v6 13/54] clk: mediatek: mt8365: Join top_misc_mux_gates and top_misc_muxes arrays
Date:   Mon,  6 Mar 2023 15:05:02 +0100
Message-Id: <20230306140543.1813621-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
References: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In preparation for migrating this driver to the simple probe mechanism,
join the audio gates to the top_misc_mux_gates array of mtk_composite
clocks in one top_misc_muxes array.

While at it, since the `apll_i2s0_parents` array is for all i2s clocks,
rename that to `apll_i2s_parents`.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8365.c | 46 ++++++++++---------------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
index 85fe7586a69b..fef6c653c9ce 100644
--- a/drivers/clk/mediatek/clk-mt8365.c
+++ b/drivers/clk/mediatek/clk-mt8365.c
@@ -384,25 +384,23 @@ static const char * const mbist_diag_parents[] = {
 	"univpll2_d8"
 };
 
-static const char * const apll_i2s0_parents[] = {
+static const char * const apll_i2s_parents[] = {
 	"aud_1_sel",
 	"aud_2_sel"
 };
 
-static struct mtk_composite top_misc_mux_gates[] = {
+static struct mtk_composite top_misc_muxes[] = {
 	/* CLK_CFG_11 */
 	MUX_GATE(CLK_TOP_MBIST_DIAG_SEL, "mbist_diag_sel", mbist_diag_parents,
 		 0x0ec, 0, 2, 7),
-};
-
-static struct mt8365_clk_audio_mux top_misc_muxes[] = {
-	{ CLK_TOP_APLL_I2S0_SEL, "apll_i2s0_sel", 11},
-	{ CLK_TOP_APLL_I2S1_SEL, "apll_i2s1_sel", 12},
-	{ CLK_TOP_APLL_I2S2_SEL, "apll_i2s2_sel", 13},
-	{ CLK_TOP_APLL_I2S3_SEL, "apll_i2s3_sel", 14},
-	{ CLK_TOP_APLL_TDMOUT_SEL, "apll_tdmout_sel", 15},
-	{ CLK_TOP_APLL_TDMIN_SEL, "apll_tdmin_sel", 16},
-	{ CLK_TOP_APLL_SPDIF_SEL, "apll_spdif_sel", 17},
+	/* Audio MUX */
+	MUX(CLK_TOP_APLL_I2S0_SEL, "apll_i2s0_sel", apll_i2s_parents, 0x0320, 11, 1),
+	MUX(CLK_TOP_APLL_I2S1_SEL, "apll_i2s1_sel", apll_i2s_parents, 0x0320, 12, 1),
+	MUX(CLK_TOP_APLL_I2S2_SEL, "apll_i2s2_sel", apll_i2s_parents, 0x0320, 13, 1),
+	MUX(CLK_TOP_APLL_I2S3_SEL, "apll_i2s3_sel", apll_i2s_parents, 0x0320, 14, 1),
+	MUX(CLK_TOP_APLL_TDMOUT_SEL, "apll_tdmout_sel", apll_i2s_parents, 0x0320, 15, 1),
+	MUX(CLK_TOP_APLL_TDMIN_SEL, "apll_tdmin_sel", apll_i2s_parents, 0x0320, 16, 1),
+	MUX(CLK_TOP_APLL_SPDIF_SEL, "apll_spdif_sel", apll_i2s_parents, 0x0320, 17, 1),
 };
 
 #define CLK_CFG_UPDATE 0x004
@@ -787,28 +785,12 @@ static int clk_mt8365_top_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_factors;
 
-	ret = mtk_clk_register_composites(&pdev->dev, top_misc_mux_gates,
-					  ARRAY_SIZE(top_misc_mux_gates), base,
+	ret = mtk_clk_register_composites(&pdev->dev, top_misc_muxes,
+					  ARRAY_SIZE(top_misc_muxes), base,
 					  &mt8365_clk_lock, clk_data);
 	if (ret)
 		goto unregister_muxes;
 
-	for (i = 0; i != ARRAY_SIZE(top_misc_muxes); ++i) {
-		struct mt8365_clk_audio_mux *mux = &top_misc_muxes[i];
-		struct clk_hw *hw;
-
-		hw = devm_clk_hw_register_mux(dev, mux->name, apll_i2s0_parents,
-					      ARRAY_SIZE(apll_i2s0_parents),
-					      CLK_SET_RATE_PARENT, base + 0x320,
-					      mux->shift, 1, 0, NULL);
-		if (IS_ERR(hw)) {
-			ret = PTR_ERR(hw);
-			goto unregister_composites;
-		}
-
-		clk_data->hws[mux->id] = hw;
-	}
-
 	ret = mtk_clk_register_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs),
 					base, &mt8365_clk_lock, clk_data);
 	if (ret)
@@ -830,8 +812,8 @@ static int clk_mt8365_top_probe(struct platform_device *pdev)
 	mtk_clk_unregister_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs),
 				    clk_data);
 unregister_composites:
-	mtk_clk_unregister_composites(top_misc_mux_gates,
-				      ARRAY_SIZE(top_misc_mux_gates), clk_data);
+	mtk_clk_unregister_composites(top_misc_muxes,
+				      ARRAY_SIZE(top_misc_muxes), clk_data);
 unregister_muxes:
 	mtk_clk_unregister_muxes(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
 unregister_factors:
-- 
2.39.2


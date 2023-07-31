Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83921C00528
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 19:21:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbjGaTVu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 15:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbjGaTVq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 15:21:46 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6C1171C
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 12:21:40 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe3e88bd5fso799934e87.3
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 12:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690831299; x=1691436099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PH18c6fQCGlXIcWcVtPWcBFP7H4EemWa9GS7wznpGb8=;
        b=UXRqATWltySUPqaR1HiGQaOLF9a471W0U00WWaBgT7YrHR8eNU9tpiGnEFCxZrChh1
         9WGmsAGMbvHA62gNGcpEGQTo51vfgNHa9ofsSskkmnN0vFt/OindKHQ2F+txl9AvhUfc
         1ih4ReqvagvwRDz49/AkMzYG5G/WmGHFkAArJaQyCXYNMmpzOUbfxbTQvqyI2T4SJqlb
         uxE0wLBQyctkO5ylRyPYIt4euNiMj/IJMsrwfKYFu0+p7xn3uJz0pDotltqZ6UHG5Lv3
         sRChh/ME3Vb3x1zTK+TutY95x4Vz0pXaFOPyoEIL9c1OhpV1xSoB3YW9L3MAHA5NWEkf
         XHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690831299; x=1691436099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PH18c6fQCGlXIcWcVtPWcBFP7H4EemWa9GS7wznpGb8=;
        b=OF6iiGKhMy/Nptvxzl6UI51XXWn9bu85KP/M5WqpRyT6fuXdAhVGidujvIzJagOlxx
         sCcpwu17fSV6RhQuFSTQ+t2K3TwxA5k+590rZ6fTWoiWvXlHKx45uPWh/XkbjpyfYZl/
         4cRZ4e3I8fr7apKXicZ35BPeuufS9QpWe3/Wgbonjtq1WLGYWSHf5RSyEOC0PI3IRE1r
         G7oxjRRetsY1DjiqXmMmppWSC/0p3LvgIDZz4DJ5X4py04rxtSqwLY6ivhyGIniRY75k
         aOU6WTFpmrEz05acjfsLF7V5+KScdQWGWA9x4mknP6sFyXpFQfYhqOPW8w7viCxRyJ6l
         5ZHA==
X-Gm-Message-State: ABy/qLZPTeg/9TVVHnBZU8l7+0EE87L/Xjx7WbYedLGSXyarnghujnUH
        Q/0AHdswRTxaEKkAKGfxj84dlg==
X-Google-Smtp-Source: APBJJlG6VXtLarcsIVyYIR1fVvdn+qR2nYOLYfz3zVMaRj/0h6A3heIh/jX8GFK6xJuti9UDU42Vpg==
X-Received: by 2002:a05:6512:1591:b0:4f8:752f:df48 with SMTP id bp17-20020a056512159100b004f8752fdf48mr653255lfb.29.1690831299247;
        Mon, 31 Jul 2023 12:21:39 -0700 (PDT)
Received: from [192.168.1.101] (abyk53.neoplus.adsl.tpnet.pl. [83.9.30.53])
        by smtp.gmail.com with ESMTPSA id ep28-20020a056512485c00b004fe1bac4080sm2024882lfb.222.2023.07.31.12.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 12:21:38 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 31 Jul 2023 21:21:33 +0200
Subject: [PATCH v2 2/2] clk: qcom: videocc-sm8350: Add SC8280XP support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-topic-8280_videocc-v2-2-c88269806269@linaro.org>
References: <20230703-topic-8280_videocc-v2-0-c88269806269@linaro.org>
In-Reply-To: <20230703-topic-8280_videocc-v2-0-c88269806269@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690831295; l=3984;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=o5bVSx2gpTMciO9+T8/74+UVoyE1JD3fP/a+IZWVKbg=;
 b=ZGbEbtkrYDpuq6H+9Oj/I0FpRhjvMeWlMmYt6iYbz989Pu2/4tIBrqVbdfNoqgOrlcN3n0E5R
 GpYndhxqGTAAsstEIWon11A/mBN5nw3FnYGKP6gRbJRfDik2GABlMFM
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SC8280XP, being a partial derivative of SM8350, shares almost the exact
same videocc block. Extend the 8350 driver to support the bigger brother.

The only notable changes are higher possible frequencies on some clocks
and some switcheroo within the XO/sleep registers (probably due to some
different board crystal configuration).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/videocc-sm8350.c | 42 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc-sm8350.c
index b148877fc73d..7246f3c99492 100644
--- a/drivers/clk/qcom/videocc-sm8350.c
+++ b/drivers/clk/qcom/videocc-sm8350.c
@@ -41,6 +41,10 @@ static const struct pll_vco lucid_5lpe_vco[] = {
 	{ 249600000, 1750000000, 0 },
 };
 
+static const struct pll_vco lucid_5lpe_vco_8280xp[] = {
+	{ 249600000, 1800000000, 0 },
+};
+
 static const struct alpha_pll_config video_pll0_config = {
 	.l = 0x25,
 	.alpha = 0x8000,
@@ -159,6 +163,16 @@ static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src_8280xp[] = {
+	F(720000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1599000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1680000000, P_VIDEO_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 video_cc_mvs0_clk_src = {
 	.cmd_rcgr = 0xb94,
 	.mnd_width = 0,
@@ -181,6 +195,15 @@ static const struct freq_tbl ftbl_video_cc_mvs1_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_video_cc_mvs1_clk_src_8280xp[] = {
+	F(840000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1600000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1800000000, P_VIDEO_PLL1_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 video_cc_mvs1_clk_src = {
 	.cmd_rcgr = 0xbb4,
 	.mnd_width = 0,
@@ -499,6 +522,7 @@ static struct qcom_cc_desc video_cc_sm8350_desc = {
 
 static int video_cc_sm8350_probe(struct platform_device *pdev)
 {
+	u32 video_cc_xo_clk_cbcr = 0xeec;
 	struct regmap *regmap;
 	int ret;
 
@@ -510,6 +534,21 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sc8280xp-videocc")) {
+		video_cc_sleep_clk_src.cmd_rcgr = 0xf38;
+		video_cc_sleep_clk.halt_reg = 0xf58;
+		video_cc_sleep_clk.clkr.enable_reg = 0xf58;
+		video_cc_xo_clk_src.cmd_rcgr = 0xf14;
+		video_cc_xo_clk_cbcr = 0xf34;
+
+		video_pll0.vco_table = video_pll1.vco_table = lucid_5lpe_vco_8280xp;
+		/* No change, but assign it for completeness */
+		video_pll0.num_vco = video_pll1.num_vco = ARRAY_SIZE(lucid_5lpe_vco_8280xp);
+
+		video_cc_mvs0_clk_src.freq_tbl = ftbl_video_cc_mvs0_clk_src_8280xp;
+		video_cc_mvs1_clk_src.freq_tbl = ftbl_video_cc_mvs1_clk_src_8280xp;
+	}
+
 	regmap = qcom_cc_map(pdev, &video_cc_sm8350_desc);
 	if (IS_ERR(regmap)) {
 		pm_runtime_put(&pdev->dev);
@@ -525,7 +564,7 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 	 *      video_cc_xo_clk
 	 */
 	regmap_update_bits(regmap, 0xe58, BIT(0), BIT(0));
-	regmap_update_bits(regmap, 0xeec, BIT(0), BIT(0));
+	regmap_update_bits(regmap, video_cc_xo_clk_cbcr, BIT(0), BIT(0));
 
 	ret = qcom_cc_really_probe(pdev, &video_cc_sm8350_desc, regmap);
 	pm_runtime_put(&pdev->dev);
@@ -534,6 +573,7 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id video_cc_sm8350_match_table[] = {
+	{ .compatible = "qcom,sc8280xp-videocc" },
 	{ .compatible = "qcom,sm8350-videocc" },
 	{ }
 };

-- 
2.41.0


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3605BC4332F
	for <linux-clk@archiver.kernel.org>; Tue, 13 Dec 2022 10:43:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiLMKnk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Dec 2022 05:43:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234027AbiLMKnj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Dec 2022 05:43:39 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90FB55F8A
        for <linux-clk@vger.kernel.org>; Tue, 13 Dec 2022 02:43:38 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id n1so2875039ljg.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Dec 2022 02:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2E0qygprK2sYZwkFh7NifzS8fG2xh0C3icv9H7MjHJ4=;
        b=QVnF+cvC6zmbGOTJI32I36lh9wzNKQDbFyTniN84PEYjPl3xg2sOD+Pnf/emQEwrMD
         U/b0By/yq6DO+TW4izGWB3tLbMFNjg/ta6MmEcoNCSPcTk7FeP75H7SoUI8FmV9/8wzv
         ijIoWxHG0KB0tepNQtXtpn1+6u6H5jhbFEK26n+MRROL98sLxb8lxdw8luYRv8fwbYDH
         TXYotuOEKe8NKwP92dsQ/JOb5mPe6RCdvY+FS3ofxmQGMVSNLYz2SzWTI7DAOcTjKvbK
         bOuwVYqvVosWPuNpP6sAv7zCaDQc5NSTwsMaZutuSLA4R+Q/14CZoetu0Oqfdo+ONe+k
         MFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2E0qygprK2sYZwkFh7NifzS8fG2xh0C3icv9H7MjHJ4=;
        b=XtyeZNmvTOrj2a7N0EvG3GTACbMpZZpZWrX8/k8ilE/cpVJ7oTB6BE6dj56tJq1r4S
         Izp1i2d06URmF9l0ElUSGK7epmBVK2wXGt7Ej9Dikk8Fdn3/yEim74Bxw1OaltszuZYM
         9KjAbc6Y9hZIm/BFBWukeZdnOVtbOqpHTv3EOtoxxjM9++kH1djuF+9BlMnr1nW+bh1x
         VknpA+QM87RSqb6/3UNHxHr9Sr9ih4Ry2dD462zCuE8PNbeZjMWIbkyEXmXnS2Y1VGyr
         c/vVVFenFmo77HkA2/UhzH8VMTrUaiFAwvliCxIoSD/3sCNKaGcHkFV3NYrHT8RP4IYo
         Btqw==
X-Gm-Message-State: ANoB5pmoH3mR9vwR1HVkpz/9atLc3jnPbqjja/BHbRZwSUb6gbsWIPdi
        vJ3qRmAQiGJThuWtLsizSN4xiQ==
X-Google-Smtp-Source: AA0mqf45LGu9EHSkKKj759y7PxRYEKh1u1LPxFrm0B4KuUGx2TX0/dMsdxVzld6XCjYGf6Hfp7xbbA==
X-Received: by 2002:a2e:7e0c:0:b0:27b:65aa:db22 with SMTP id z12-20020a2e7e0c000000b0027b65aadb22mr196657ljc.20.1670928216956;
        Tue, 13 Dec 2022 02:43:36 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id u14-20020a2e91ce000000b00279a7266874sm213830ljg.98.2022.12.13.02.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 02:43:36 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: dispcc-sm6115: Shrink single-parent definitions
Date:   Tue, 13 Dec 2022 11:43:33 +0100
Message-Id: <20221213104333.27548-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There's no need to provide both a parent map and a parent data struct when
there's precisely a single parent. Collapse this to save a few bytes.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/dispcc-sm6115.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 818bb8f4637c..a6105033ff7e 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -103,14 +103,6 @@ static const struct clk_parent_data disp_cc_parent_data_0[] = {
 	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
 };
 
-static const struct parent_map disp_cc_parent_map_1[] = {
-	{ P_BI_TCXO, 0 },
-};
-
-static const struct clk_parent_data disp_cc_parent_data_1[] = {
-	{ .index = DT_BI_TCXO },
-};
-
 static const struct parent_map disp_cc_parent_map_2[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 4 },
@@ -141,14 +133,6 @@ static const struct clk_parent_data disp_cc_parent_data_4[] = {
 	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
 };
 
-static const struct parent_map disp_cc_parent_map_5[] = {
-	{ P_SLEEP_CLK, 0 },
-};
-
-static const struct clk_parent_data disp_cc_parent_data_5[] = {
-	{ .index = DT_SLEEP_CLK, },
-};
-
 static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
 	.cmd_rcgr = 0x20bc,
 	.mnd_width = 0,
@@ -284,12 +268,13 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 	.cmd_rcgr = 0x20a4,
 	.mnd_width = 0,
 	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_1,
 	.freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_vsync_clk_src",
-		.parent_data = disp_cc_parent_data_1,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -304,12 +289,13 @@ static struct clk_rcg2 disp_cc_sleep_clk_src = {
 	.cmd_rcgr = 0x6050,
 	.mnd_width = 0,
 	.hid_width = 5,
-	.parent_map = disp_cc_parent_map_5,
 	.freq_tbl = ftbl_disp_cc_sleep_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_sleep_clk_src",
-		.parent_data = disp_cc_parent_data_5,
-		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_SLEEP_CLK,
+		},
+		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.39.0


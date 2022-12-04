Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F046C636F8
	for <linux-clk@archiver.kernel.org>; Sun,  4 Dec 2022 12:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiLDMpW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Dec 2022 07:45:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbiLDMpT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Dec 2022 07:45:19 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5F215FF1
        for <linux-clk@vger.kernel.org>; Sun,  4 Dec 2022 04:45:17 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id d6so14547919lfs.10
        for <linux-clk@vger.kernel.org>; Sun, 04 Dec 2022 04:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5Lir2jT4Hjo6W/uHBN8nH+BdjcQ6nj7U6BcqfzqLdI=;
        b=M2wRYbQLyYkEn6Rb5Z99hC+uoJ0ZMejvM1VjFHuVmeEERlAhGYgkbpI7XXLPQKVcBo
         7ojC5Km2yVSB0aifAsS5grulQTz3dklpJFnDDR7FGfTau2ANl0cZuvZZJKpRMn2tpYfm
         gBF75ThexVmaDlFb1Lym3finIxRW/OYlf453g2h2qaeZkTETheNS1y4+Wm+KD1kdxxWY
         FRIbs0ABPaRJknFx1+Pzayb2oQijvP/utUCETdArHh4Z8MrZ3EMdleu4qcs3COL3OMDb
         B9aTfw5zqp9+0piNH8jophs3i3c+E1HpwVQ9q1CSiF0WzfLj7kNl2j/V6r2aFzPLi56K
         Jlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5Lir2jT4Hjo6W/uHBN8nH+BdjcQ6nj7U6BcqfzqLdI=;
        b=QU4SgZk4eHCFmqmo/s4ugj4hew3V58w/ukc8lnKtwOsH3zcYyIrepO7hMBjz2mS30f
         4fBVEK1dP5bAo5nnTGf5v37FEyUb613B1980qYQaYmkNanSB4xlffkt/fTiqNfZOcfGL
         tb87N3NYyiDBfyXslov9TA6xWeTX+Ww+ZUDXv8xoiZjkpJtkXcyFY5O+Qa0jjWIlsdWa
         z2DKoZNZPKSqcl92jr1I+F0bUV861P0+iyQ54WpeZKvoDdZlxMA2gjNBe05PRBfDjsDY
         uBcvXxBc+65tm4xXCJBfK4ClYc6QBhVIPOAPd7Z+AWCSqBkWJAmq7zhHrCZl1Ojqe1MP
         CmRQ==
X-Gm-Message-State: ANoB5pljuO95a+8cUv77UU2kFojmG6aMnsVPjB8I+hpHn+QjZH/TUtqi
        alb4QoD3ATsx76nc4IVjHiQUyw==
X-Google-Smtp-Source: AA0mqf5CPW9LCqHU8zHTyEyDsej4L1w8yhkQBMf6ov3IurxqJDQFb8pWGtJbqIRHRCTYZasRM7ODwA==
X-Received: by 2002:a05:6512:5d3:b0:4a4:1cfd:c4ef with SMTP id o19-20020a05651205d300b004a41cfdc4efmr27561340lfo.678.1670157915655;
        Sun, 04 Dec 2022 04:45:15 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k18-20020a05651239d200b0049771081b10sm1763006lfu.31.2022.12.04.04.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 04:45:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v4 07/11] clk: qcom: mmcc-msm8974: move clock parent tables down
Date:   Sun,  4 Dec 2022 14:45:04 +0200
Message-Id: <20221204124508.1415713-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
References: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move clock parent tables down, after the PLL declarataions, so that we
can use pll hw clock fields in the next commit.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8974.c | 170 ++++++++++++++++----------------
 1 file changed, 85 insertions(+), 85 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 9008df2305df..57f1a351c8f6 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -42,6 +42,91 @@ enum {
 	P_DSI1PLL_BYTE,
 };
 
+static struct clk_pll mmpll0 = {
+	.l_reg = 0x0004,
+	.m_reg = 0x0008,
+	.n_reg = 0x000c,
+	.config_reg = 0x0014,
+	.mode_reg = 0x0000,
+	.status_reg = 0x001c,
+	.status_bit = 17,
+        .clkr.hw.init = &(struct clk_init_data){
+                .name = "mmpll0",
+                .parent_names = (const char *[]){ "xo" },
+                .num_parents = 1,
+                .ops = &clk_pll_ops,
+        },
+};
+
+static struct clk_regmap mmpll0_vote = {
+	.enable_reg = 0x0100,
+	.enable_mask = BIT(0),
+	.hw.init = &(struct clk_init_data){
+		.name = "mmpll0_vote",
+		.parent_names = (const char *[]){ "mmpll0" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll mmpll1 = {
+	.l_reg = 0x0044,
+	.m_reg = 0x0048,
+	.n_reg = 0x004c,
+	.config_reg = 0x0050,
+	.mode_reg = 0x0040,
+	.status_reg = 0x005c,
+	.status_bit = 17,
+        .clkr.hw.init = &(struct clk_init_data){
+                .name = "mmpll1",
+                .parent_names = (const char *[]){ "xo" },
+                .num_parents = 1,
+                .ops = &clk_pll_ops,
+        },
+};
+
+static struct clk_regmap mmpll1_vote = {
+	.enable_reg = 0x0100,
+	.enable_mask = BIT(1),
+	.hw.init = &(struct clk_init_data){
+		.name = "mmpll1_vote",
+		.parent_names = (const char *[]){ "mmpll1" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll mmpll2 = {
+	.l_reg = 0x4104,
+	.m_reg = 0x4108,
+	.n_reg = 0x410c,
+	.config_reg = 0x4110,
+	.mode_reg = 0x4100,
+	.status_reg = 0x411c,
+        .clkr.hw.init = &(struct clk_init_data){
+                .name = "mmpll2",
+                .parent_names = (const char *[]){ "xo" },
+                .num_parents = 1,
+                .ops = &clk_pll_ops,
+        },
+};
+
+static struct clk_pll mmpll3 = {
+	.l_reg = 0x0084,
+	.m_reg = 0x0088,
+	.n_reg = 0x008c,
+	.config_reg = 0x0090,
+	.mode_reg = 0x0080,
+	.status_reg = 0x009c,
+	.status_bit = 17,
+        .clkr.hw.init = &(struct clk_init_data){
+                .name = "mmpll3",
+                .parent_names = (const char *[]){ "xo" },
+                .num_parents = 1,
+                .ops = &clk_pll_ops,
+        },
+};
+
 static const struct parent_map mmcc_xo_mmpll0_mmpll1_gpll0_map[] = {
 	{ P_XO, 0 },
 	{ P_MMPLL0, 1 },
@@ -160,91 +245,6 @@ static const char * const mmcc_xo_dsibyte_hdmi_edp_gpll0[] = {
 	"dsi1pllbyte",
 };
 
-static struct clk_pll mmpll0 = {
-	.l_reg = 0x0004,
-	.m_reg = 0x0008,
-	.n_reg = 0x000c,
-	.config_reg = 0x0014,
-	.mode_reg = 0x0000,
-	.status_reg = 0x001c,
-	.status_bit = 17,
-        .clkr.hw.init = &(struct clk_init_data){
-                .name = "mmpll0",
-                .parent_names = (const char *[]){ "xo" },
-                .num_parents = 1,
-                .ops = &clk_pll_ops,
-        },
-};
-
-static struct clk_regmap mmpll0_vote = {
-	.enable_reg = 0x0100,
-	.enable_mask = BIT(0),
-	.hw.init = &(struct clk_init_data){
-		.name = "mmpll0_vote",
-		.parent_names = (const char *[]){ "mmpll0" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static struct clk_pll mmpll1 = {
-	.l_reg = 0x0044,
-	.m_reg = 0x0048,
-	.n_reg = 0x004c,
-	.config_reg = 0x0050,
-	.mode_reg = 0x0040,
-	.status_reg = 0x005c,
-	.status_bit = 17,
-        .clkr.hw.init = &(struct clk_init_data){
-                .name = "mmpll1",
-                .parent_names = (const char *[]){ "xo" },
-                .num_parents = 1,
-                .ops = &clk_pll_ops,
-        },
-};
-
-static struct clk_regmap mmpll1_vote = {
-	.enable_reg = 0x0100,
-	.enable_mask = BIT(1),
-	.hw.init = &(struct clk_init_data){
-		.name = "mmpll1_vote",
-		.parent_names = (const char *[]){ "mmpll1" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static struct clk_pll mmpll2 = {
-	.l_reg = 0x4104,
-	.m_reg = 0x4108,
-	.n_reg = 0x410c,
-	.config_reg = 0x4110,
-	.mode_reg = 0x4100,
-	.status_reg = 0x411c,
-        .clkr.hw.init = &(struct clk_init_data){
-                .name = "mmpll2",
-                .parent_names = (const char *[]){ "xo" },
-                .num_parents = 1,
-                .ops = &clk_pll_ops,
-        },
-};
-
-static struct clk_pll mmpll3 = {
-	.l_reg = 0x0084,
-	.m_reg = 0x0088,
-	.n_reg = 0x008c,
-	.config_reg = 0x0090,
-	.mode_reg = 0x0080,
-	.status_reg = 0x009c,
-	.status_bit = 17,
-        .clkr.hw.init = &(struct clk_init_data){
-                .name = "mmpll3",
-                .parent_names = (const char *[]){ "xo" },
-                .num_parents = 1,
-                .ops = &clk_pll_ops,
-        },
-};
-
 static struct clk_rcg2 mmss_ahb_clk_src = {
 	.cmd_rcgr = 0x5000,
 	.hid_width = 5,
-- 
2.35.1


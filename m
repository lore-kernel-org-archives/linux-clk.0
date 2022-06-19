Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37CFCCA487
	for <linux-clk@archiver.kernel.org>; Sun, 19 Jun 2022 21:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236347AbiFSV0B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Jun 2022 17:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236352AbiFSVZ6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 17:25:58 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FD9A457
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 14:25:57 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id c30so9940336ljr.9
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1XfJMqbTrvbGcMadqMaMwRzo8TXWgiYVxdNJ7Eqss70=;
        b=CbtILTZF6dTmisXfA1a16lZSofY1OkzuGs8v0V9ofFzMLbo/ZERy+f3TZGcg/sUv3V
         wncCTAacvcHYcUrgnGvDrqLzGbzxX3LOHeTmt9TDYo097d9zkiw29NFMziJ8MbyhkqaV
         SSYQWOfwOmS2BR/UDZIEbXB5ZEhQ5l0UtRCtaiDgbGZFSWUtBjlSnC6dp5E11Jr7MB0n
         Tsec9/VBnhsxnli7HnYvHYZnjkTIn5vQZdqk3o71dg4VVhtAc5ZoJ+tPmb4fg0qCI9Wl
         YLoWO2EWbiwcO/eXzVIYh6r1zY9LbDaHC1vsnWHHv/ytr+IwqzoDz1Sd3DpTWIIoMnbl
         Hrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1XfJMqbTrvbGcMadqMaMwRzo8TXWgiYVxdNJ7Eqss70=;
        b=2qY5WnWFCvKUmHuPceYelaJMkZhUBAJL4CIjxEO86IBJvIUG82u6WODMDezaDoc1yn
         2TMiYWG/cMorAbnq1PP1Z2ordJ26RkwM7YR470BK80GzpPv1vQFE2p5LmhMzuIa1v3v/
         ok9lnRDKTEGrH9kmNmCM5pSjGmuuof/knU7X+liyyDtu3RGqvdxtZeNtc/mGDzWd0ke9
         0olFdL+pgh5UeyFuyFhyO8AfNAO3ikMSdqyf6dx3a5pxajnsGrmHRAaHPbIVgO6Yb4Ds
         IX+O51ls6iLL6iF4eqkr9eI/vWmzl080rghpTJaGabEarPBDQASa/cnJsfh0d9WYiNdF
         6pLQ==
X-Gm-Message-State: AJIora+jGjUGcAKwqyOQxtdcj+HNh1Gf6v/fwP5181sb1f65W3I9/qzf
        MM3gKOAhBshWpbQWYFmrpbff13u396DAmOk6
X-Google-Smtp-Source: AGRyM1tYZ0WAJjcvUNSHlDb9frFXs0f3/Ggxsnof5ZA1OICtLvok8UmxpHW6ZG+ZK+8tsqd8oW63CQ==
X-Received: by 2002:a2e:b048:0:b0:25a:6dc9:dcd0 with SMTP id d8-20020a2eb048000000b0025a6dc9dcd0mr1664923ljl.402.1655673955408;
        Sun, 19 Jun 2022 14:25:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u3-20020ac258c3000000b00478de10cf5esm626866lfo.247.2022.06.19.14.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 14:25:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v2 4/7] clk: qcom: gcc-msm8916: move clock parent tables down
Date:   Mon, 20 Jun 2022 00:25:46 +0300
Message-Id: <20220619212549.1240891-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619212549.1240891-1-dmitry.baryshkov@linaro.org>
References: <20220619212549.1240891-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move clock parent tables down, after the GPLL declrataions, so that we
can use gpll hw clock fields in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 216 ++++++++++++++++-----------------
 1 file changed, 108 insertions(+), 108 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 40c27ba6286f..7962edbdbcf6 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -42,6 +42,114 @@ enum {
 	P_EXT_MCLK,
 };
 
+static struct clk_pll gpll0 = {
+	.l_reg = 0x21004,
+	.m_reg = 0x21008,
+	.n_reg = 0x2100c,
+	.config_reg = 0x21010,
+	.mode_reg = 0x21000,
+	.status_reg = 0x2101c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll0",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll0_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(0),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll0_vote",
+		.parent_names = (const char *[]){ "gpll0" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll gpll1 = {
+	.l_reg = 0x20004,
+	.m_reg = 0x20008,
+	.n_reg = 0x2000c,
+	.config_reg = 0x20010,
+	.mode_reg = 0x20000,
+	.status_reg = 0x2001c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll1",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll1_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(1),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll1_vote",
+		.parent_names = (const char *[]){ "gpll1" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll gpll2 = {
+	.l_reg = 0x4a004,
+	.m_reg = 0x4a008,
+	.n_reg = 0x4a00c,
+	.config_reg = 0x4a010,
+	.mode_reg = 0x4a000,
+	.status_reg = 0x4a01c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll2",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll2_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(2),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll2_vote",
+		.parent_names = (const char *[]){ "gpll2" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll bimc_pll = {
+	.l_reg = 0x23004,
+	.m_reg = 0x23008,
+	.n_reg = 0x2300c,
+	.config_reg = 0x23010,
+	.mode_reg = 0x23000,
+	.status_reg = 0x2301c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "bimc_pll",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap bimc_pll_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(3),
+	.hw.init = &(struct clk_init_data){
+		.name = "bimc_pll_vote",
+		.parent_names = (const char *[]){ "bimc_pll" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
 static const struct parent_map gcc_xo_gpll0_map[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0, 1 },
@@ -256,114 +364,6 @@ static const char * const gcc_xo_gpll1_emclk_sleep[] = {
 	"sleep_clk",
 };
 
-static struct clk_pll gpll0 = {
-	.l_reg = 0x21004,
-	.m_reg = 0x21008,
-	.n_reg = 0x2100c,
-	.config_reg = 0x21010,
-	.mode_reg = 0x21000,
-	.status_reg = 0x2101c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gpll0",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap gpll0_vote = {
-	.enable_reg = 0x45000,
-	.enable_mask = BIT(0),
-	.hw.init = &(struct clk_init_data){
-		.name = "gpll0_vote",
-		.parent_names = (const char *[]){ "gpll0" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static struct clk_pll gpll1 = {
-	.l_reg = 0x20004,
-	.m_reg = 0x20008,
-	.n_reg = 0x2000c,
-	.config_reg = 0x20010,
-	.mode_reg = 0x20000,
-	.status_reg = 0x2001c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gpll1",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap gpll1_vote = {
-	.enable_reg = 0x45000,
-	.enable_mask = BIT(1),
-	.hw.init = &(struct clk_init_data){
-		.name = "gpll1_vote",
-		.parent_names = (const char *[]){ "gpll1" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static struct clk_pll gpll2 = {
-	.l_reg = 0x4a004,
-	.m_reg = 0x4a008,
-	.n_reg = 0x4a00c,
-	.config_reg = 0x4a010,
-	.mode_reg = 0x4a000,
-	.status_reg = 0x4a01c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gpll2",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap gpll2_vote = {
-	.enable_reg = 0x45000,
-	.enable_mask = BIT(2),
-	.hw.init = &(struct clk_init_data){
-		.name = "gpll2_vote",
-		.parent_names = (const char *[]){ "gpll2" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static struct clk_pll bimc_pll = {
-	.l_reg = 0x23004,
-	.m_reg = 0x23008,
-	.n_reg = 0x2300c,
-	.config_reg = 0x23010,
-	.mode_reg = 0x23000,
-	.status_reg = 0x2301c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "bimc_pll",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap bimc_pll_vote = {
-	.enable_reg = 0x45000,
-	.enable_mask = BIT(3),
-	.hw.init = &(struct clk_init_data){
-		.name = "bimc_pll_vote",
-		.parent_names = (const char *[]){ "bimc_pll" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
 static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
 	.cmd_rcgr = 0x27000,
 	.hid_width = 5,
-- 
2.35.1


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED92CCA480
	for <linux-clk@archiver.kernel.org>; Sun, 19 Jun 2022 21:27:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237344AbiFSV1o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Jun 2022 17:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235010AbiFSV1n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 17:27:43 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B563AE4E
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 14:27:42 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g4so2028310lfv.9
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 14:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1XfJMqbTrvbGcMadqMaMwRzo8TXWgiYVxdNJ7Eqss70=;
        b=qkzhAUYadtYwUojxmgrY3L01StY+sqqSZG4EUl4QcYQ9TVyml9RW4/UpRoe0V0xAaA
         UojUyLHAlNmXCw+lVjFRKBKj4RE0Y6PLjvewF8L/DzKFbwnMcFALVNQK6+JjzhUuqQ7F
         uWqlQ5o0trz1DLFu5sPgqeVBXUrCNuBMvWzat7GJ015u7WZaWHZxvjofDKJD/WA3+cxv
         UsJtV4TL7uXTNzN1HlQfErAaduTq66SFkr9yUMbwrgP6HbINW696Npp69WUQ7MeopAqi
         0otZYoKib/FYDnmOmoneXIe+wsXe5qrr+36jLUN7AWET7vOKH9pRtX2DkNF6caZDHPXF
         8LOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1XfJMqbTrvbGcMadqMaMwRzo8TXWgiYVxdNJ7Eqss70=;
        b=xd5k2ulFdpvJC/D22pOjp4PQ15rsm51HyDe4jDsArArlhqkcdx8WRqJqH0RtS47Jms
         eF6XmcIx5VaobEAw8dcSbX0etJjzjox6YWhM3DI07Pgo8zLR8ttSt2pnDQykvrqMI/9a
         1UBgpeE68FOUEaVxWDH79omP+N5Zn4+yOjCCrslyhg4AmGcJHSVTmKHhTlHV5mJcnO4N
         RzwarWE48k8WHHpPFGfC4fW9/oeUX4q4eEdkRc4Ubn2EnsCQaBWSDAgc7rwSARBuvSOz
         s/293FJtdj1P8TKZS8LJQlFzq8O8UoHrPGSrMelahxWGX5nVSdxapwMQpRypAdX8aY0m
         WkTw==
X-Gm-Message-State: AJIora+u8Rw4S1Io1bpAVR9GuRrMuTB3D7STga3mzvvqZBt0IqoaO0pc
        7QT7mVRBS6IkQv5x5nQfy5tcaQ==
X-Google-Smtp-Source: AGRyM1vd+PY0A2xqd09kEcPEJu/P4wecqkftGzOE9HcxRikZqaFJ6anIkcHHpEj1W//jkTSeOMQWfw==
X-Received: by 2002:a05:6512:686:b0:47d:b7f3:e6a4 with SMTP id t6-20020a056512068600b0047db7f3e6a4mr11832595lfe.138.1655674060508;
        Sun, 19 Jun 2022 14:27:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s19-20020a056512215300b004796a17246esm649078lfr.252.2022.06.19.14.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 14:27:39 -0700 (PDT)
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
Subject: [PATCH v3 4/7] clk: qcom: gcc-msm8916: move clock parent tables down
Date:   Mon, 20 Jun 2022 00:27:32 +0300
Message-Id: <20220619212735.1244953-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
References: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
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


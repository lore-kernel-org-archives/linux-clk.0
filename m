Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F26C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Dec 2022 01:32:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbiL0Bcf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Dec 2022 20:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbiL0Bcd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Dec 2022 20:32:33 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A873C2BCA
        for <linux-clk@vger.kernel.org>; Mon, 26 Dec 2022 17:32:31 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id g13so17819540lfv.7
        for <linux-clk@vger.kernel.org>; Mon, 26 Dec 2022 17:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOYABWuzYKvXAxgUza8GsXopcK4zvysy/ceJfHX8Vtk=;
        b=vIwynzSxCFoINbNDNjW2WCpqo8Ru+Z+gY3mId6Tqd6bWxXMkZU4wG9qv7VQpQThbvI
         QJhdHld34xE24R5TwDrMJUGcwgIgxe7CvHVmifAuK9459BY9UdCV6yGgQ+6Un1PU4ggo
         /i3lg4p10FwrBFR7GMNWBvDffqB4IQX9G6W42TeuiFbhjUAh1Hxto1LcM92rg2cFhWDY
         VJb6EgapKJc2e0Fafc+vwBpoaD1OqreRrfb7iJeYyMpvaXZGH1kR93grdCbxMVepwE2m
         pNlB9vllr0w7iZJlyLkh+aSOuLUeJIl6B10cQfVLDILa0phmxPgFPf/lqqABjNZfrkVG
         PW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOYABWuzYKvXAxgUza8GsXopcK4zvysy/ceJfHX8Vtk=;
        b=IPcLdlSLqOxaqebcmLd3LCV3AgXQpmtrwV5KEISSrxlgcXsx5Y3Or6uzvvR8Esvw4/
         /eaEsOPV9w6uF2tZu0EJ0IMsmZUpiRWNoR3Kb/ctT2CWMDlPROFmpkH7BMSE7995bNOJ
         nl4czX1ecoR1xFXMXcmsZFJoh1yVsXu7b6eSTmwglSqdp4QiWA/g+52N071XzTqz68el
         qhtEkL5x14ibrTCOQs3s6+IJev2UTewDG5cltK5HS+jBlUDW30ItOygae2PdW+tsDPPc
         JEBlIZDKAhG20M8eD3Kxz5MgI+x7OjjT+Y8sHuUbgU9A7sU4ICeWNCRxFbHh6ccaZeoq
         f1Fg==
X-Gm-Message-State: AFqh2koAMqjCmo/8os2XqO993RbZLVkNJ4h1imcbQQA+9TlxhmYyFBH8
        cFKLiy0d9fB3GEObxSloEPgrog==
X-Google-Smtp-Source: AMrXdXvM1thQ+IOUm66pV2/evPG9okKGial5ith5SUgPJDL/WvCSvg+kF7DG+4FxQlW5U5oI58b7SA==
X-Received: by 2002:a05:6512:3b9:b0:4b5:59fd:816c with SMTP id v25-20020a05651203b900b004b559fd816cmr5021973lfp.39.1672104750024;
        Mon, 26 Dec 2022 17:32:30 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v6-20020a2e87c6000000b0027fbb12aa53sm674752ljj.20.2022.12.26.17.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:32:29 -0800 (PST)
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
        devicetree@vger.kernel.org
Subject: [RFC PATCH 05/12] clk: qcom: gcc-apq8084: move PLL clocks up
Date:   Tue, 27 Dec 2022 03:32:18 +0200
Message-Id: <20221227013225.2847382-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move PLL clock declarations up, before clock parent tables, so that we
can use pll hw clock fields in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-apq8084.c | 162 ++++++++++++++++-----------------
 1 file changed, 81 insertions(+), 81 deletions(-)

diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
index b41f55b289ae..05a68f645115 100644
--- a/drivers/clk/qcom/gcc-apq8084.c
+++ b/drivers/clk/qcom/gcc-apq8084.c
@@ -36,6 +36,87 @@ enum {
 	P_SLEEP_CLK,
 };
 
+static struct clk_pll gpll0 = {
+	.l_reg = 0x0004,
+	.m_reg = 0x0008,
+	.n_reg = 0x000c,
+	.config_reg = 0x0014,
+	.mode_reg = 0x0000,
+	.status_reg = 0x001c,
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
+	.enable_reg = 0x1480,
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
+	.l_reg = 0x0044,
+	.m_reg = 0x0048,
+	.n_reg = 0x004c,
+	.config_reg = 0x0054,
+	.mode_reg = 0x0040,
+	.status_reg = 0x005c,
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
+	.enable_reg = 0x1480,
+	.enable_mask = BIT(1),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll1_vote",
+		.parent_names = (const char *[]){ "gpll1" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll gpll4 = {
+	.l_reg = 0x1dc4,
+	.m_reg = 0x1dc8,
+	.n_reg = 0x1dcc,
+	.config_reg = 0x1dd4,
+	.mode_reg = 0x1dc0,
+	.status_reg = 0x1ddc,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll4",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll4_vote = {
+	.enable_reg = 0x1480,
+	.enable_mask = BIT(4),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll4_vote",
+		.parent_names = (const char *[]){ "gpll4" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
 static const struct parent_map gcc_xo_gpll0_map[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0, 1 }
@@ -98,33 +179,6 @@ static const char * const gcc_xo_pcie_sleep[] = {
 	"sleep_clk_src",
 };
 
-static struct clk_pll gpll0 = {
-	.l_reg = 0x0004,
-	.m_reg = 0x0008,
-	.n_reg = 0x000c,
-	.config_reg = 0x0014,
-	.mode_reg = 0x0000,
-	.status_reg = 0x001c,
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
-	.enable_reg = 0x1480,
-	.enable_mask = BIT(0),
-	.hw.init = &(struct clk_init_data){
-		.name = "gpll0_vote",
-		.parent_names = (const char *[]){ "gpll0" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
 static struct clk_rcg2 config_noc_clk_src = {
 	.cmd_rcgr = 0x0150,
 	.hid_width = 5,
@@ -161,60 +215,6 @@ static struct clk_rcg2 system_noc_clk_src = {
 	},
 };
 
-static struct clk_pll gpll1 = {
-	.l_reg = 0x0044,
-	.m_reg = 0x0048,
-	.n_reg = 0x004c,
-	.config_reg = 0x0054,
-	.mode_reg = 0x0040,
-	.status_reg = 0x005c,
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
-	.enable_reg = 0x1480,
-	.enable_mask = BIT(1),
-	.hw.init = &(struct clk_init_data){
-		.name = "gpll1_vote",
-		.parent_names = (const char *[]){ "gpll1" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static struct clk_pll gpll4 = {
-	.l_reg = 0x1dc4,
-	.m_reg = 0x1dc8,
-	.n_reg = 0x1dcc,
-	.config_reg = 0x1dd4,
-	.mode_reg = 0x1dc0,
-	.status_reg = 0x1ddc,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gpll4",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap gpll4_vote = {
-	.enable_reg = 0x1480,
-	.enable_mask = BIT(4),
-	.hw.init = &(struct clk_init_data){
-		.name = "gpll4_vote",
-		.parent_names = (const char *[]){ "gpll4" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_ufs_axi_clk[] = {
 	F(100000000, P_GPLL0, 6, 0, 0),
 	F(200000000, P_GPLL0, 3, 0, 0),
-- 
2.35.1


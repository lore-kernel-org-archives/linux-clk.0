Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580ACC47090
	for <linux-clk@archiver.kernel.org>; Sun,  4 Dec 2022 12:45:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbiLDMpR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Dec 2022 07:45:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiLDMpQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Dec 2022 07:45:16 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93F115FE0
        for <linux-clk@vger.kernel.org>; Sun,  4 Dec 2022 04:45:14 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id g7so14587551lfv.5
        for <linux-clk@vger.kernel.org>; Sun, 04 Dec 2022 04:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waDEA8uxNrP4025OcL/yX7LapkcyvqGI/OcJz3TbPaw=;
        b=SPwYbL3pgXzWQOHY+5VWD7vCjOX6Nf84MGr4jY8I/O8D0Nx18rTi96+WCTOguUC6dL
         4NTLltk+f7nLdAt4ciB47L9mAIJd1e+OqlkuebO4eb3NM76zPFm2yu9jSms212Ic+2Xd
         5YXjja82gAuWTWMQKgPf5hBs9las2/j4fL+2oXkf3Bht/95gpo/99iAVyHQkp7BIVx4a
         zQiyCb6yaOiI1TCes6WBSJ5RMWneXaBxLLiwvGrnI3N6HNQu6mThRwTUN1iA6GhnOzWH
         5UW+QRm5Wj5kMChFahvZvFPLVimoYsHoSQoGGbpBdFK2qwbpAHH0Wc+eJCDXNstcrtHt
         dl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waDEA8uxNrP4025OcL/yX7LapkcyvqGI/OcJz3TbPaw=;
        b=7mdSSRlP1iBXWr+2K79Yq6+39xHO69uvwbpZFF5gxlm3M5rX6ka4CbJqdVOlTeZHDc
         RcyhvZqOpS/Agd3NZTHBPPSLAdz/1jqbWDmEa8qNXvW/zo0H1fDbaKPrNYQGJIl6bxwI
         6ypiNwWNdUcXe/83WEgXaZnCEp+Jok0fQboPV4ybJQhdqH/pw98puNM+vLyWabzQrcbL
         kb5+rZaw1PqzdZdzHUyCYy9TMEBffo96EVqfc0qBM1X5QyvZPWcrOZKBpSE0MvMeU2uT
         /XcwrUvjxu6meNquFxgNUSZErEH+wmrEDBCdsusUta6FMYoDFjWVwv8IIznssbLIyQ/3
         aW2A==
X-Gm-Message-State: ANoB5plYcrZsqq+JkNUBlx9poiJKtC0NiTj/bTwbWWPgWV+bs5ACVvBg
        z4x7+LP+myNd6m6BNfyNjq10zG53d17/z930
X-Google-Smtp-Source: AA0mqf4Pyy+o/Q69J9jk+U/mO6gNnRLuVqL2iT/HvuN9o2daCtFJqwY5zEd1ycknMpO51PPDSHerjw==
X-Received: by 2002:a05:6512:2591:b0:4ae:c2b5:29c4 with SMTP id bf17-20020a056512259100b004aec2b529c4mr22254218lfb.614.1670157913264;
        Sun, 04 Dec 2022 04:45:13 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k18-20020a05651239d200b0049771081b10sm1763006lfu.31.2022.12.04.04.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 04:45:12 -0800 (PST)
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
Subject: [PATCH v4 04/11] clk: qcom: gcc-msm8974: move clock parent tables down
Date:   Sun,  4 Dec 2022 14:45:01 +0200
Message-Id: <20221204124508.1415713-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
References: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rearrage clock parent tables and PLL declarations (pull parents down
and gpll4 up), so that we can use pll hw clock fields in the next
commit.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8974.c | 98 +++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index b847ce852ef8..77f3497265a0 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -32,28 +32,6 @@ enum {
 	P_GPLL4,
 };
 
-static const struct parent_map gcc_xo_gpll0_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 }
-};
-
-static const char * const gcc_xo_gpll0[] = {
-	"xo",
-	"gpll0_vote",
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL4, 5 }
-};
-
-static const char * const gcc_xo_gpll0_gpll4[] = {
-	"xo",
-	"gpll0_vote",
-	"gpll4_vote",
-};
-
 static struct clk_pll gpll0 = {
 	.l_reg = 0x0004,
 	.m_reg = 0x0008,
@@ -81,6 +59,55 @@ static struct clk_regmap gpll0_vote = {
 	},
 };
 
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
+static const struct parent_map gcc_xo_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 }
+};
+
+static const char * const gcc_xo_gpll0[] = {
+	"xo",
+	"gpll0_vote",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 5 }
+};
+
+static const char * const gcc_xo_gpll0_gpll4[] = {
+	"xo",
+	"gpll0_vote",
+	"gpll4_vote",
+};
+
 static struct clk_rcg2 config_noc_clk_src = {
 	.cmd_rcgr = 0x0150,
 	.hid_width = 5,
@@ -144,33 +171,6 @@ static struct clk_regmap gpll1_vote = {
 	},
 };
 
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
 static const struct freq_tbl ftbl_gcc_usb30_master_clk[] = {
 	F(125000000, P_GPLL0, 1, 5, 24),
 	{ }
-- 
2.35.1


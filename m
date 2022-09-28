Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAF5C54EE9
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 15:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234668AbiI1PAi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 11:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234614AbiI1PAQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 11:00:16 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A390133408
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:00:05 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id h3so14681461lja.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rvkYwwXNz2RtbX8bEFgVafW/TqrLIdtASWYdL878aho=;
        b=OuC/T5e+XXTBa97Pq6H+Qtlxnn5uEKP9bv8POHCv4c8o8E41lXQEZYrMEG+br/Xt/5
         jot9olxvi4OM9JaRVlRSzPiSBEi0RT2IHV9iGGlZGA8bSxqyM31ON+lPiFBch2e//U5R
         GunGB6g6XFDrM2pA/0wd3RBmkh4ltI/Odr1wZXwW8U6PDut7t36frzBniYTRv3HChRAA
         WmwRohD1jMIiuGWVpxwKMnStkw4X4sRTgd5kh0RHoGrEFAc8PBQJdiW+SymVaNFp5Wa7
         c9nGUcfpZYKxOgw8fUW3UoRdInVA602NCRV+Jqv2oKwjLpxLqTWrJaOcNBNfktbeocVK
         73jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rvkYwwXNz2RtbX8bEFgVafW/TqrLIdtASWYdL878aho=;
        b=1uoRIji9cP7gdDyylGGS8VbUZMmynzmkCxdbSVnDncrjkRmsA1MIyhB8zi5dGJBuiU
         2SssTFAf38rSOWoa97imN49Lqhb3HjzmG0YGkhm90n3/qgMvRT2kUNt+xjxrD7C6OgI5
         DNlZSqeBM5s1g0vN/9ugCQFyP6RqnDeZtySlz2IRlsPmoiaL5nR3/JTP3+LGRzOir74k
         iMhftBOfrE2MjgSvpYAMyA9ARRqc8hlNFxhWdMH7scPKaYdjDOku8MEcoXzJIozVAO+U
         LwPg+lw+7zWBEkupC3WqeCCDz7veDq6mbcOsff8MNpkscvn/8qXp6CqdpJCjw6snnuJ3
         4Tkw==
X-Gm-Message-State: ACrzQf27gS55GwVUhRK45m2UWvlJ6K/5TmG1unzNHqaslE1G6bsUhKmG
        vLukgCTiS5jCesD3PQAwpZcSKg==
X-Google-Smtp-Source: AMsMyM6/4NNhkvMUVhUNP+gjiceRZ1wl8M3ZN8oDWDeHGxn/4wdDMcsGvZgukXDWZYcgaxxyhohW8Q==
X-Received: by 2002:a2e:958f:0:b0:26c:fd2:80b4 with SMTP id w15-20020a2e958f000000b0026c0fd280b4mr11203358ljh.147.1664377202947;
        Wed, 28 Sep 2022 08:00:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id be36-20020a056512252400b00492c017de43sm494996lfb.127.2022.09.28.08.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:00:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 04/11] clk: qcom: gcc-msm8974: move clock parent tables down
Date:   Wed, 28 Sep 2022 17:59:51 +0300
Message-Id: <20220928145958.376288-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move clock parent tables down, after the PLL declrataions, so that we
can use pll hw clock fields in the next commit.

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


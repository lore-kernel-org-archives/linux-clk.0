Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605EDC54EBE
	for <linux-clk@archiver.kernel.org>; Wed,  4 Jan 2023 09:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238969AbjADJfy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Jan 2023 04:35:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239151AbjADJfb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Jan 2023 04:35:31 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672B117E39
        for <linux-clk@vger.kernel.org>; Wed,  4 Jan 2023 01:35:08 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id ja17so25111473wmb.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Jan 2023 01:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaSJH6qwzBFLaleOV9/RDtj1DHcWd7lA30T3AWhdsIk=;
        b=X8+85RcbN5sDqvdgAWKgOnciIf/y1+lcIImyDQZyWDRqYWKWlG4icuvcXHq9XMRGIn
         6QmI5F8BuAlqNm0tQNenOM4tZPzJo6zKVFD1hbElv7ex2ykenBHtIgdjsXaCJAESKKnF
         j0DZqT35KarFGOZpwlLvwAPm08PoQ77hdeq1GOB9NFzBH41P9jgbNRy3kowXIxyCbqJN
         +duRYwvT4RQ7HUCsfWLs/EWTefzOHINX8cNj8Css/j1bdB74+l+8xMA98j5m3Gll75S7
         O+1+mLhT03UxS6mrQ7tYp4HY2340sc0rGab79JT1XGo0QAh9vH50J008PD5i5aYRB3lQ
         PMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DaSJH6qwzBFLaleOV9/RDtj1DHcWd7lA30T3AWhdsIk=;
        b=Ofao/wl1SFEMG2vjuVRtQrwsfyrkTuveDcBwLbFMWOeA3tRURSkQ+oH/4NPx1H9TYa
         0WArbMV332Byyu+rWaEo+MDfNfCeTFa9rYo44ZE4XqCHTdP6vOBZEcI4WHBuyCvEaWPY
         gHTFsKyHJaDaUo6OJiFrVNCR5lSSSziPcVL7x40YlyvUagxdmxF4LkYdQzPqu1wI4m0S
         mX+5fQjiTHH1K/f+Ci+jMOcnoYN/zovkaSZq9jMM8OlndEIs5IV9Er7jRX7faY0UrxiO
         kl0k/Z50YaP8fCGYQKtR8jjVr2UrM3WlQV4FhmujKBDBRC6JAr67wzd6uDyOxyBiaKoc
         SYmQ==
X-Gm-Message-State: AFqh2ko22CQiorr2eaalfwH28YMzj9U2SeBFtWfG5Bbbr28fo952uFGm
        Y7MgbJd/pat6KUbTxkKx332zNw==
X-Google-Smtp-Source: AMrXdXuK2BMgvVHAHUv1tVmvXR/j2ccSmtZj61x/kF5vdlWdAPRGkn9fzfpbJWwioLdnarYHK7k4hg==
X-Received: by 2002:a05:600c:3d11:b0:3cf:8b22:76b3 with SMTP id bh17-20020a05600c3d1100b003cf8b2276b3mr33648776wmb.0.1672824906856;
        Wed, 04 Jan 2023 01:35:06 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id b22-20020a05600c4e1600b003c6d21a19a0sm45561452wmq.29.2023.01.04.01.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 01:35:06 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v8 3/4] clk: qcom: rpmh: Add support for SM8550 rpmh clocks
Date:   Wed,  4 Jan 2023 11:34:49 +0200
Message-Id: <20230104093450.3150578-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230104093450.3150578-1-abel.vesa@linaro.org>
References: <20230104093450.3150578-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Adds the RPMH clocks present in SM8550 SoC.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 586a810c682c..7db5a53d73f0 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -366,6 +366,16 @@ DEFINE_CLK_RPMH_VRM(rf_clk2, _d, "rfclkd2", 1);
 DEFINE_CLK_RPMH_VRM(rf_clk3, _d, "rfclkd3", 1);
 DEFINE_CLK_RPMH_VRM(rf_clk4, _d, "rfclkd4", 1);
 
+DEFINE_CLK_RPMH_VRM(clk1, _a1, "clka1", 1);
+DEFINE_CLK_RPMH_VRM(clk2, _a1, "clka2", 1);
+DEFINE_CLK_RPMH_VRM(clk3, _a1, "clka3", 1);
+DEFINE_CLK_RPMH_VRM(clk4, _a1, "clka4", 1);
+DEFINE_CLK_RPMH_VRM(clk5, _a1, "clka5", 1);
+
+DEFINE_CLK_RPMH_VRM(clk6, _a2, "clka6", 2);
+DEFINE_CLK_RPMH_VRM(clk7, _a2, "clka7", 2);
+DEFINE_CLK_RPMH_VRM(clk8, _a2, "clka8", 2);
+
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
@@ -576,6 +586,31 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
 	.num_clks = ARRAY_SIZE(sm8450_rpmh_clocks),
 };
 
+static struct clk_hw *sm8550_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a1.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a1_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a1.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a1_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sm8550 = {
+	.clks = sm8550_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sm8550_rpmh_clocks),
+};
+
 static struct clk_hw *sc7280_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div4.hw,
 	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_div4_ao.hw,
@@ -742,6 +777,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
 	{ .compatible = "qcom,sm8450-rpmh-clk", .data = &clk_rpmh_sm8450},
+	{ .compatible = "qcom,sm8550-rpmh-clk", .data = &clk_rpmh_sm8550},
 	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
 	{ }
 };
-- 
2.34.1


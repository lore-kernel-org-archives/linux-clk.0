Return-Path: <SRS0=O9me=ED=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC32C4363A
	for <linux-clk@archiver.kernel.org>; Wed, 28 Oct 2020 23:28:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C592207BC
	for <linux-clk@archiver.kernel.org>; Wed, 28 Oct 2020 23:28:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v23DjL4B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390419AbgJ1X21 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Oct 2020 19:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390573AbgJ1X2U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Oct 2020 19:28:20 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41670C0613CF
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2020 16:28:19 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t6so382132plq.11
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2020 16:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aD/m2VgCYiafD5XJrexC8xG2hc+36DzQpHElqK1SRuE=;
        b=v23DjL4BqoRVxPR9GiRf0kU1JhgymDI0xiYjXnCz4Q785C1+xKWhpKU6Km8WPOp58w
         xGur69N7GeI8fwXXwA+kVV+RcFy4HsedaSVvKdI47qTsXih/LGVM3DGC0btx4VoxTYxJ
         cLSx2YmlYZW9A8eUFhVGuOquAzmHZ8jND6vyejb2sKUqdSR/CFagLZUEYBVJKs/2kDc6
         JGC5vPGT+PpvhNxJJFT4rYUlvHhjTjPn8MOkZc/uu565J5yhEcMDFCxPX6kKim6nGVzT
         NCdS4ntm1tBymmjYUg6XJ53cjrMCeKuIT63npvN/BqgJ9tqRhjtf3+wNAzJBxOxVCa+y
         0RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aD/m2VgCYiafD5XJrexC8xG2hc+36DzQpHElqK1SRuE=;
        b=kw7Sj5sZhjF/ECQ2RpfeFmHb2cZiS/50ASazvkbnBiIZeSG5otWhKh+Y75GPnluXpF
         BE1xk8Qi0QChFJfzx7d2d888EiRlox6I0/n5T7Uni++W/DqVBcsGHYIhdykQLE3xl9NM
         9tMqGviM0tM4XyGmM5zCwKD3+uRc3+GuQBWeNa91Qs3d1G5LNLWZztX/1VSPwLBvvHRh
         rjeA4E5h8vXyyM8hfHnzqVEHsZt9udcXABc6wVjTvNYpXPbigby5H9QMj9YaDzpcjM1E
         5SfxYvVqQLi4s+meaYrboKdf8lE5ayJ5QRZfEmy1YTBedQH4f/31/AspWPD6bLVpHRcx
         ACZQ==
X-Gm-Message-State: AOAM533n32MR/ngNcA3cS+y9MR2L+GVAdGs6J7XXMTq+pqStl7jHmRBp
        fAiF4/hPSmF6prvn82F/TvxhouhEzzNX
X-Google-Smtp-Source: ABdhPJz8bqfzm3rNPe2a2hytHwPw1HH8gsns4sap2sQtA7nMk9rNUILQwS2zVPM5K3yckVKsL3p6JQ==
X-Received: by 2002:aa7:911a:0:b029:155:8521:ba6c with SMTP id 26-20020aa7911a0000b02901558521ba6cmr5161777pfh.8.1603870995286;
        Wed, 28 Oct 2020 00:43:15 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id e7sm4289579pgj.19.2020.10.28.00.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 00:43:14 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/4] clk: qcom: Add support for SDX55 RPMh clocks
Date:   Wed, 28 Oct 2020 13:12:32 +0530
Message-Id: <20201028074232.22922-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
References: <20201028074232.22922-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for clocks maintained by RPMh in SDX55 SoCs.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index e2c669b08aff..88d010178b59 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -432,6 +432,25 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
 	.num_clks = ARRAY_SIZE(sm8250_rpmh_clocks),
 };
 
+DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
+DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
+DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
+
+static struct clk_hw *sdx55_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
+	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_RF_CLK1]		= &sdx55_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &sdx55_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]		= &sdx55_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]	= &sdx55_rf_clk2_ao.hw,
+	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
+	.clks = sdx55_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sdx55_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -519,6 +538,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
+	{ .compatible = "qcom,sdx55-rpmh-clk", .data = &clk_rpmh_sdx55},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
-- 
2.17.1


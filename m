Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2323C00A89
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 10:48:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 935D320BED
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 10:48:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wQgCAtJ6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730139AbgKEKsq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Nov 2020 05:48:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730126AbgKEKsp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Nov 2020 05:48:45 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439F1C0613D3
        for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2020 02:48:45 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id v12so1159243pfm.13
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2020 02:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7xzfNtr8zKEQZfWNHzcQs/QsPT8QqrsuV/2rOop0v6k=;
        b=wQgCAtJ6Q49Q+La3x2z2UBeraTneHOAXQAE/VXhC4pQsD12ZdJlsDiJCJ+AG+GFBqZ
         5TOdRmCvecQ9SsYRy/q4hQARGEficCt0wj/zpxBH9vRHNRhEtHER3qxiUgAx0VmLZAOQ
         DnwewfuS4JYU0KbGGzeU4sVfqyFFSow/t+RIndwBm5ARnXj5g6e+r3Mhkcx032Nys0LF
         F9UYynewR1f7oUL5IxBUbF18onqzgxIyzmszOYKN9nBam6UIqJtQiCGKEQYMS5fflfOf
         bkcM3KTC2RpO+D0yYLjTPmQaZ1ZunvzahPo6cItmSULdjdTEdGZ2LxInb9+WQxXu+VmA
         7zsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7xzfNtr8zKEQZfWNHzcQs/QsPT8QqrsuV/2rOop0v6k=;
        b=BZ8RxH2qeOHyxJ+MsFJGp4hlAxGnZZ1bZQ6r+RRhM8R5UI1E5XBxeLgN6VQeLosJDW
         vEYT6CN2SvRByXN+alY141Pt89Z1Zzdz+DF77NBxJ9K3HKJMRDcdPwmwFfXY6jnhJY7i
         9BFu15jWFAWCJp7xm5dwswnOrTLn2qHEMYLSB7C7EJ0RmCwho71R/PwcSAGHNbemsQul
         Y1vt4oTXyJSrVo4kv6eZ6U5srQKRgGRjtCKH3xj7RDLCHRGSHLOhtGgwRBUFIq817yK6
         inM6HKvvekL1HE1oLdLQJsHd8MmdiGlnv9D5oSsPkDtaRjOER8BMQ6ApGZRozv+mZYK7
         P9UQ==
X-Gm-Message-State: AOAM5332VcImKD3ZjnXvVolz1z60w+RoFYH5oyjWtrP6cxZ/EI5/yt7Q
        pAtfHY+K9eCexABWa/zrq8Hd
X-Google-Smtp-Source: ABdhPJx7Qx4kh0Toh5x92fRdTSbRuCWL47WKUW9nN5k2iziqtsRg/FpiqrUEDpopUCzaScF8NBEhCw==
X-Received: by 2002:a05:6a00:88d:b029:164:5a00:29b8 with SMTP id q13-20020a056a00088db02901645a0029b8mr2154062pfj.10.1604573324779;
        Thu, 05 Nov 2020 02:48:44 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id a84sm2131234pfa.53.2020.11.05.02.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 02:48:44 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 4/4] clk: qcom: Add support for SDX55 RPMh clocks
Date:   Thu,  5 Nov 2020 16:18:17 +0530
Message-Id: <20201105104817.15715-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
References: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for following clocks maintained by RPMh in SDX55 SoCs.

* BI TCXO
* RF_CLK1
* RF_CLK1_AO
* RF_CLK2
* RF_CLK2_AO
* QPIC (Qualcomm Technologies, Inc. Parallel Interface Controller)

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index e2c669b08aff..fb72db957721 100644
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
@@ -517,6 +536,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
+	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ }
-- 
2.17.1


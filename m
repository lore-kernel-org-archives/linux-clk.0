Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A032BC433ED
	for <linux-clk@archiver.kernel.org>; Tue, 11 May 2021 04:17:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C32861921
	for <linux-clk@archiver.kernel.org>; Tue, 11 May 2021 04:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhEKESe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 May 2021 00:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhEKESa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 May 2021 00:18:30 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBC6C061574
        for <linux-clk@vger.kernel.org>; Mon, 10 May 2021 21:17:23 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id u16so17882278oiu.7
        for <linux-clk@vger.kernel.org>; Mon, 10 May 2021 21:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YvC5nf7k+zrK5xWC4RDKTwoK+EY80CWdjHtrEnmOMoE=;
        b=q0tsCRjFghXORwNbjdqUGRBvoO1woiRrfKvI4/Ex5IY3XtemQkhdq1cpeNwWTwstpd
         00aUKnOGwv7hqL+3gphyC6GOCvBtHwrj5+EqQqWfd6FXkjc/4luFzX7AQ9X0mxOwDarP
         FynZp5vkMRK/EJ3PNtXuAqco/Hu/aXdpWtBB+MmfmseXv1cX2RXCN/DPYSykv9GYaT6e
         REw8tsQ5XoaS1DAqxx13m06kE01EKKxdM3pKa0+6TiZqxZD9hgAT5I6Uv7tEtcmetsCE
         yyiyaqz9XPaMOQNVHZXvaVb407CjWE4FYRcRrlR/8iPdQVrnOaJYcY5jFVqo5qgI0JPo
         Chng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YvC5nf7k+zrK5xWC4RDKTwoK+EY80CWdjHtrEnmOMoE=;
        b=nlSvLsbOtOJCeQUe/VID6lpdbZSNCC1bL4r5JzJb5WpP6CV2XZ0wMzJKrNOBaSRNO1
         1Dm+M1/Pq57WcjhxmOo9m9i2fLr8Hy2ChLWp8Wb/JYFTlAfB7XcUSsa7fgcZt4NydqTu
         vpGIbMgN03zVJrzsBz+L3SHF5vsriGIQ9lmw8dLgt/1swsVP2sWQcBxUmjqnUxd+V14n
         s7PUUqJaixWocnhTrpTbXnd3F8ahET4wGsXuPYZrgfOTg9a52J4g+2tA2hs9mqAfS++V
         xHNZ54UyPrtn2hYTMDA/dIAtZo9ebvJ77M4fjr5/vzVTX3J7G90A1YY2LindFDpEPkcD
         sN2Q==
X-Gm-Message-State: AOAM5301JzNmS09HfP/pupHIeBH0qCBkETjq8NrhY6zSfyPUmuGMonpO
        PjemuvZM4xO6031UzYZ8S9F1HQ==
X-Google-Smtp-Source: ABdhPJx6KSP5d9a5oHmEKCqxtRP1plW7IDaQtDhXQyrc537PKVx8NrelBd+Suas4TNYEuITlIshdUA==
X-Received: by 2002:aca:da04:: with SMTP id r4mr1974968oig.123.1620706642271;
        Mon, 10 May 2021 21:17:22 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
        by smtp.gmail.com with ESMTPSA id v79sm1367168oia.14.2021.05.10.21.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 21:17:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: dispcc-sm8250: Add sc8180x support
Date:   Mon, 10 May 2021 23:17:18 -0500
Message-Id: <20210511041719.591969-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The display clock controller in SC8180x is reused from SM8150, so add
the necessary compatible and wire up the driver to enable this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml         | 1 +
 drivers/clk/qcom/dispcc-sm8250.c                              | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 0cdf53f41f84..6667261dc665 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sc8180x-dispcc
       - qcom,sm8150-dispcc
       - qcom,sm8250-dispcc
 
diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index de09cd5c209f..12ef6f1d5c62 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1037,6 +1037,7 @@ static const struct qcom_cc_desc disp_cc_sm8250_desc = {
 };
 
 static const struct of_device_id disp_cc_sm8250_match_table[] = {
+	{ .compatible = "qcom,sc8180x-dispcc" },
 	{ .compatible = "qcom,sm8150-dispcc" },
 	{ .compatible = "qcom,sm8250-dispcc" },
 	{ }
@@ -1053,7 +1054,8 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 
 	/* note: trion == lucid, except for the prepare() op */
 	BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
-	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sc8180x-dispcc") ||
+	    of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {
 		disp_cc_pll0_config.config_ctl_hi_val = 0x00002267;
 		disp_cc_pll0_config.config_ctl_hi1_val = 0x00000024;
 		disp_cc_pll0_config.user_ctl_hi1_val = 0x000000D0;
-- 
2.29.2


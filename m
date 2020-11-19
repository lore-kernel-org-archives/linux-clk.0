Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F43DC64E90
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 07:28:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20BDB24709
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 07:28:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i07saqU5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgKSH1t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 02:27:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgKSH1s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 02:27:48 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB841C0617A7
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2020 23:27:48 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id t21so3441907pgl.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2020 23:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u5W6INqg2Zpl99fZRNl1fAgbWBqyZfbuE4X8ZoNAf8o=;
        b=i07saqU5+eNp08WFeDZuxfBIwgK2EE/UqyJVMmRevU8OXoD+b6rUppmRHE4GnszIjP
         HXsPokwsXJ8+8J0PuajCtM+FbRlDdwuy6E4HFtRsBCCu1QzuaUe6m0tysKscJToq7Y5C
         Hw2cwkMC1l4VmEaqvptS0dAOti4+EMYdGybSlsI8h+48AEickIPKzme69Ym7VdQps/uq
         Kw0abvemofIVstOfMxHHgbS9NNFK2LJfvWvz9xZH6Oy15GcGQRcp3tZmHb/Chagn30Uo
         Tmu0nFgu/hEPG6AcRc/ORXn6n5YB15Tf7OQeCSn4KVhT1+fi20o7g2eO18MLg6gn3qob
         YI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u5W6INqg2Zpl99fZRNl1fAgbWBqyZfbuE4X8ZoNAf8o=;
        b=tQFUjn9aFoeIZKXIDRHyAe6Yg1gzzD4Xgoawwdc1qZjGw2M1hFSbXbqeK/eQmwqHJg
         Wycb4RiHzNOJwfDXK0cPB1kgVUO+zmwHgzIfdxwQgMB0TLDEzxrtroOf9E9lUZJYc63u
         NznBl9pdQ5P+vp39V7F4kbtrHYn9EpBPB/Fkf4yawfr1MGFjGlpasND/OnQqzPXxqkNX
         dhaJnHVS8a5FnufnArCmcX2G9dJv3GF4BSPouT1RZJKgd4qA9A+/uw2/OFV/agUKjXFz
         zlXc+GbHDsR3bddkpoYIN4SRY6M9JSm4cnEFp4YlkGg0TkSWNhbFAwfBpvS50QtUMVhb
         rDLg==
X-Gm-Message-State: AOAM5319/iagQSaufjv6sConx3gj2Bf3xrPJV7HbYB2fWJCQH6er5Sxg
        QJA4K2E/D4Up7hXVafV23Ultl4dZxFD/
X-Google-Smtp-Source: ABdhPJxRM9PQHBXXdV5DkxBGYt5j2yngr3PZYdVthkQadxzerS6KDef4fkH7pUHSRCfTzqoz/pMDkg==
X-Received: by 2002:a17:90a:de0c:: with SMTP id m12mr2362619pjv.224.1605770868240;
        Wed, 18 Nov 2020 23:27:48 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id a8sm26802923pfa.132.2020.11.18.23.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 23:27:47 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 4/4] clk: qcom: Add support for SDX55 RPMh clocks
Date:   Thu, 19 Nov 2020 12:57:14 +0530
Message-Id: <20201119072714.14460-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119072714.14460-1-manivannan.sadhasivam@linaro.org>
References: <20201119072714.14460-1-manivannan.sadhasivam@linaro.org>
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
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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


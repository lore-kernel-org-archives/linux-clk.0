Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601BBC35273
	for <linux-clk@archiver.kernel.org>; Fri,  4 Feb 2022 14:46:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359425AbiBDOq5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Feb 2022 09:46:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359448AbiBDOq4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Feb 2022 09:46:56 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967B9C061755
        for <linux-clk@vger.kernel.org>; Fri,  4 Feb 2022 06:46:55 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id o12so13029512lfg.12
        for <linux-clk@vger.kernel.org>; Fri, 04 Feb 2022 06:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=834ZeSQv8JRt/AoDg49+kb7R02sAA8A0g9Z5La4Rnzg=;
        b=CyhYJKOVMc1esvIiUcWVd5WK2YZuhualCB6ZHsuAHJ6f8hAcxs6mnd16A964xpcIbm
         LM8xCIn5QyLW2g0AO9oHQbC+jZazXm8TIgY7hz6cw9SPfKas77V6DDaelGfFLVGqr4O5
         MXsJDqW7mGhsYquwva0a69p4p5wKQt0LjG2rPRmUHCBDeVxX8I5QvTWQqg49rYJcWOGN
         j0WXI4D8ChzJnrxRD51XNZk3DTkFlHA2hEHE+DCB/7e0W5aHS1+kOFPkfA9XdRvOL92W
         VP73gg8kQDnQIExZEH8cY++tvXzdSr8og/TWM4REA/Y3Oqfc178iE1eI1Jt9+iAHkYpA
         AGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=834ZeSQv8JRt/AoDg49+kb7R02sAA8A0g9Z5La4Rnzg=;
        b=LGAWoHkC1HpNQOUJO8VWTnYhssYgIyE9LyLSszgxr29eTyudiY3VDv/5I3dxkho6vH
         RWlQcDO7zb1az5rqBdqyPse4OK7DyHQYgodL3eeACg7L0olOwX4wVbmBCaZ0kG8BV1Tk
         0uy+z1WeZg3dQXiyrQOR3SJSnYdUWW2s+3OWl2r3c1P4744NeTWSJMIL52VscwXQDmjk
         urW4+tFvqy/Ex7LGlwitM5yBNYU5qWLnE8t9GbBVxZcrxuRDp0DrAMV6Ub/b/fNffMeA
         fDYOg/mbNkLRrMoA+X3PcS+7WgjRH2fI1hPDtblpYjZgk6w3sQfGyOPZCypK7N+jEqbK
         0K3A==
X-Gm-Message-State: AOAM530ToWI9lCXV7jMa9wK3h8bck2RMluzCund9APHzc9oygCX3/nDi
        A8kzdgHh7AUaK/Y/QxcbWudTHg==
X-Google-Smtp-Source: ABdhPJx4sRd11IQeo9M/dqAxTE76YJ5x7QE8Rs6t0Opx5T30kV8t1z5SL1VMXhhmPmB12DTQgQm11Q==
X-Received: by 2002:a05:6512:2215:: with SMTP id h21mr2514037lfu.570.1643986013961;
        Fri, 04 Feb 2022 06:46:53 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y23sm348222lfb.2.2022.02.04.06.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 06:46:53 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 08/11] PCI: qcom: Remove pipe_clk_src reparenting
Date:   Fri,  4 Feb 2022 17:46:42 +0300
Message-Id: <20220204144645.3016603-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204144645.3016603-1-dmitry.baryshkov@linaro.org>
References: <20220204144645.3016603-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SC7280 platform has switched to using GDSC wrapper for setting
pipe_clk_src parent clock. Remove supporting code from the pcie-qcom
driver.

Cc: Prasad Malisetty <pmaliset@codeaurora.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 38 --------------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 85e84b621dbc..7df8632a21a8 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -164,9 +164,6 @@ struct qcom_pcie_resources_2_7_0 {
 	int num_clks;
 	struct regulator_bulk_data supplies[2];
 	struct reset_control *pci_reset;
-	struct clk *pipe_clk_src;
-	struct clk *phy_pipe_clk;
-	struct clk *ref_clk_src;
 };
 
 union qcom_pcie_resources {
@@ -192,7 +189,6 @@ struct qcom_pcie_ops {
 
 struct qcom_pcie_cfg {
 	const struct qcom_pcie_ops *ops;
-	unsigned int pipe_clk_need_muxing:1;
 };
 
 struct qcom_pcie {
@@ -203,7 +199,6 @@ struct qcom_pcie {
 	struct phy *phy;
 	struct gpio_desc *reset;
 	const struct qcom_pcie_ops *ops;
-	unsigned int pipe_clk_need_muxing:1;
 };
 
 #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
@@ -1147,20 +1142,6 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	if (ret < 0)
 		return ret;
 
-	if (pcie->pipe_clk_need_muxing) {
-		res->pipe_clk_src = devm_clk_get(dev, "pipe_mux");
-		if (IS_ERR(res->pipe_clk_src))
-			return PTR_ERR(res->pipe_clk_src);
-
-		res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
-		if (IS_ERR(res->phy_pipe_clk))
-			return PTR_ERR(res->phy_pipe_clk);
-
-		res->ref_clk_src = devm_clk_get(dev, "ref");
-		if (IS_ERR(res->ref_clk_src))
-			return PTR_ERR(res->ref_clk_src);
-	}
-
 	return 0;
 }
 
@@ -1178,10 +1159,6 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 		return ret;
 	}
 
-	/* Set TCXO as clock source for pcie_pipe_clk_src */
-	if (pcie->pipe_clk_need_muxing)
-		clk_set_parent(res->pipe_clk_src, res->ref_clk_src);
-
 	ret = clk_bulk_prepare_enable(res->num_clks, res->clks);
 	if (ret < 0)
 		goto err_disable_regulators;
@@ -1243,17 +1220,6 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
 	regulator_bulk_disable(ARRAY_SIZE(res->supplies), res->supplies);
 }
 
-static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
-{
-	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
-
-	/* Set pipe clock as clock source for pcie_pipe_clk_src */
-	if (pcie->pipe_clk_need_muxing)
-		clk_set_parent(res->pipe_clk_src, res->phy_pipe_clk);
-
-	return 0;
-}
-
 static int qcom_pcie_link_up(struct dw_pcie *pci)
 {
 	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
@@ -1427,7 +1393,6 @@ static const struct qcom_pcie_ops ops_2_7_0 = {
 	.init = qcom_pcie_init_2_7_0,
 	.deinit = qcom_pcie_deinit_2_7_0,
 	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
-	.post_init = qcom_pcie_post_init_2_7_0,
 };
 
 /* Qcom IP rev.: 1.9.0 */
@@ -1436,7 +1401,6 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
 	.init = qcom_pcie_init_2_7_0,
 	.deinit = qcom_pcie_deinit_2_7_0,
 	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
-	.post_init = qcom_pcie_post_init_2_7_0,
 	.config_sid = qcom_pcie_config_sid_sm8250,
 };
 
@@ -1470,7 +1434,6 @@ static const struct qcom_pcie_cfg sm8250_cfg = {
 
 static const struct qcom_pcie_cfg sc7280_cfg = {
 	.ops = &ops_1_9_0,
-	.pipe_clk_need_muxing = true,
 };
 
 static const struct dw_pcie_ops dw_pcie_ops = {
@@ -1513,7 +1476,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	pcie->pci = pci;
 
 	pcie->ops = pcie_cfg->ops;
-	pcie->pipe_clk_need_muxing = pcie_cfg->pipe_clk_need_muxing;
 
 	pcie->reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
 	if (IS_ERR(pcie->reset)) {
-- 
2.34.1


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A24C4363C
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0882D613C4
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242871AbhDEWsJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242877AbhDEWsI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:48:08 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0949C061793
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:48:00 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id r8so2139957lfp.10
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CPHSEXWMemsmMJX2Gw26WQkGrNnD1BPJIVEttMsMJJc=;
        b=qvClOTWOqzqeGkeic/GTHDHR6IGXzYqhlrKoX7cVP7cVKelOnlP5AH7w0zgZ9uuwxg
         y0Kb61Pt8t59icU8yDbL6n2vRAqCDeS/+CRb+zFuYR4YaYJFFVhYEp/VXtLArzG6v3E3
         RDYw/DciYzz3GQ8R/EPnxtVGjYzuzeJ2EfNmDpewWbG5Azb+j+x4kRbllgvImUjWDBxn
         Uadn389UadO6XVfrZCTbrb3zRJUOadJSrFoHhNpBM7xajNxAedcR4pYNRF3vatgDe3f5
         TpEUbE0tp4ES34qxshmC7OQxKLgVTybrBlTyV72RISTQsPIwbPsv44kObe58XvhLjZQW
         dbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CPHSEXWMemsmMJX2Gw26WQkGrNnD1BPJIVEttMsMJJc=;
        b=lEM0OuvN3btuPCwiscVpKhu0hHcExZaPgZyVLOgDHG/Zt7+8Y/puCmUIWKCLZfliWR
         dF1DI+V/dCeakK8jafc37O+Q4YkSrWXtee4G7TeS3bDDFbRXZoV56a2bv8YSK+D5iqH7
         XEvCEVzABgNm7cXDELLGoBRKvjidghSuq8fi6APR6uK4Ww5HWOZJ0iLzZAg2Asced3q3
         lLp9qA1t2QsKfYe0Drf7Ra9bUWpmpe2LkbSpcmJT3r7rhlqTVZEow3dD83LUosJ2p/iL
         bdoAJG3CqAB8UWw/6Y+2JDj59yRmNsi5Iu50Z9XbF52PfID87F9+HDaDxvFppak6X2Ve
         gDgw==
X-Gm-Message-State: AOAM5307xw+SSUuVYoY8gy/GNvcV+dE/1Lv7Vx4t4m7YU6unxUTXYo5E
        MAzuxFDr109hMpp376+iwHQ4Zw==
X-Google-Smtp-Source: ABdhPJzIhfkCWePsV1EazSZv3VlF/PjqhhCNHXoougR1r/jdyc6Gxumj6dM09OvJdyI0GRg7VQhgaQ==
X-Received: by 2002:ac2:5feb:: with SMTP id s11mr18344562lfg.558.1617662879312;
        Mon, 05 Apr 2021 15:47:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 20/33] clk: qcom: gcc-sc7280: use parent_hws where possible
Date:   Tue,  6 Apr 2021 01:47:30 +0300
Message-Id: <20210405224743.590029-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch to using parent_hws instead of parent_data when parents are
defined in this driver and so accessible using clk_hw.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sc7280.c | 248 +++++++++++++++++-----------------
 1 file changed, 124 insertions(+), 124 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 22736c16ed16..ef734db316df 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -70,8 +70,8 @@ static struct clk_alpha_pll_postdiv gcc_gpll0_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gpll0_out_even",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gcc_gpll0.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gcc_gpll0.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_lucid_ops,
@@ -92,8 +92,8 @@ static struct clk_alpha_pll_postdiv gcc_gpll0_out_odd = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gpll0_out_odd",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gcc_gpll0.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gcc_gpll0.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_lucid_ops,
@@ -175,8 +175,8 @@ static struct clk_branch gcc_mss_gpll0_main_div_clk_src = {
 		.enable_mask = BIT(17),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_gpll0_main_div_clk_src",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gpll0_out_even.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_gpll0_out_even.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1244,8 +1244,8 @@ static struct clk_regmap_div gcc_cpuss_ahb_postdiv_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "gcc_cpuss_ahb_postdiv_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gcc_cpuss_ahb_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gcc_cpuss_ahb_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1259,8 +1259,8 @@ static struct clk_regmap_div gcc_usb30_prim_mock_utmi_postdiv_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "gcc_usb30_prim_mock_utmi_postdiv_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gcc_usb30_prim_mock_utmi_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gcc_usb30_prim_mock_utmi_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1274,8 +1274,8 @@ static struct clk_regmap_div gcc_usb30_sec_mock_utmi_postdiv_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "gcc_usb30_sec_mock_utmi_postdiv_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gcc_usb30_sec_mock_utmi_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gcc_usb30_sec_mock_utmi_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1379,8 +1379,8 @@ static struct clk_branch gcc_aggre_ufs_phy_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre_ufs_phy_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1399,8 +1399,8 @@ static struct clk_branch gcc_aggre_usb3_prim_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre_usb3_prim_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1419,8 +1419,8 @@ static struct clk_branch gcc_aggre_usb3_sec_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre_usb3_sec_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_sec_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_sec_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1469,8 +1469,8 @@ static struct clk_branch gcc_cfg_noc_usb3_prim_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_cfg_noc_usb3_prim_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1489,8 +1489,8 @@ static struct clk_branch gcc_cfg_noc_usb3_sec_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_cfg_noc_usb3_sec_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_sec_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_sec_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1510,8 +1510,8 @@ static struct clk_branch gcc_cpuss_ahb_clk = {
 		.enable_mask = BIT(21),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_cpuss_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_cpuss_ahb_postdiv_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_cpuss_ahb_postdiv_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
@@ -1557,8 +1557,8 @@ static struct clk_branch gcc_disp_gpll0_clk_src = {
 		.enable_mask = BIT(7),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_disp_gpll0_clk_src",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gpll0.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_gpll0.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1605,8 +1605,8 @@ static struct clk_branch gcc_gp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gp1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_gp1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1623,8 +1623,8 @@ static struct clk_branch gcc_gp2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gp2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_gp2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1641,8 +1641,8 @@ static struct clk_branch gcc_gp3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gp3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_gp3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1658,8 +1658,8 @@ static struct clk_branch gcc_gpu_gpll0_clk_src = {
 		.enable_mask = BIT(15),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_gpll0_clk_src",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gpll0.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_gpll0.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1675,8 +1675,8 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
 		.enable_mask = BIT(16),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_gpll0_div_clk_src",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_gpll0_out_even.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_gpll0_out_even.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1734,8 +1734,8 @@ static struct clk_branch gcc_pcie0_phy_rchng_clk = {
 		.enable_mask = BIT(22),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie0_phy_rchng_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_0_phy_rchng_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_0_phy_rchng_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1752,8 +1752,8 @@ static struct clk_branch gcc_pcie1_phy_rchng_clk = {
 		.enable_mask = BIT(23),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie1_phy_rchng_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_1_phy_rchng_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_1_phy_rchng_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1770,8 +1770,8 @@ static struct clk_branch gcc_pcie_0_aux_clk = {
 		.enable_mask = BIT(3),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_0_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_0_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1816,8 +1816,8 @@ static struct clk_branch gcc_pcie_0_pipe_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_0_pipe_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_0_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1860,8 +1860,8 @@ static struct clk_branch gcc_pcie_1_aux_clk = {
 		.enable_mask = BIT(29),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_1_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_1_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1906,8 +1906,8 @@ static struct clk_branch gcc_pcie_1_pipe_clk = {
 		.enable_mask = BIT(30),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pcie_1_pipe_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pcie_1_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1965,8 +1965,8 @@ static struct clk_branch gcc_pdm2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_pdm2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_pdm2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2084,8 +2084,8 @@ static struct clk_branch gcc_qspi_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qspi_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qspi_core_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qspi_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2128,8 +2128,8 @@ static struct clk_branch gcc_qupv3_wrap0_s0_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2146,8 +2146,8 @@ static struct clk_branch gcc_qupv3_wrap0_s1_clk = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2164,8 +2164,8 @@ static struct clk_branch gcc_qupv3_wrap0_s2_clk = {
 		.enable_mask = BIT(12),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2182,8 +2182,8 @@ static struct clk_branch gcc_qupv3_wrap0_s3_clk = {
 		.enable_mask = BIT(13),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2200,8 +2200,8 @@ static struct clk_branch gcc_qupv3_wrap0_s4_clk = {
 		.enable_mask = BIT(14),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s4_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s4_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s4_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2218,8 +2218,8 @@ static struct clk_branch gcc_qupv3_wrap0_s5_clk = {
 		.enable_mask = BIT(15),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s5_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2236,8 +2236,8 @@ static struct clk_branch gcc_qupv3_wrap0_s6_clk = {
 		.enable_mask = BIT(16),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s6_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s6_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s6_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2254,8 +2254,8 @@ static struct clk_branch gcc_qupv3_wrap0_s7_clk = {
 		.enable_mask = BIT(17),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap0_s7_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap0_s7_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap0_s7_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2298,8 +2298,8 @@ static struct clk_branch gcc_qupv3_wrap1_s0_clk = {
 		.enable_mask = BIT(22),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2316,8 +2316,8 @@ static struct clk_branch gcc_qupv3_wrap1_s1_clk = {
 		.enable_mask = BIT(23),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2334,8 +2334,8 @@ static struct clk_branch gcc_qupv3_wrap1_s2_clk = {
 		.enable_mask = BIT(24),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s2_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2352,8 +2352,8 @@ static struct clk_branch gcc_qupv3_wrap1_s3_clk = {
 		.enable_mask = BIT(25),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s3_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2370,8 +2370,8 @@ static struct clk_branch gcc_qupv3_wrap1_s4_clk = {
 		.enable_mask = BIT(26),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s4_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2388,8 +2388,8 @@ static struct clk_branch gcc_qupv3_wrap1_s5_clk = {
 		.enable_mask = BIT(27),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s5_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2406,8 +2406,8 @@ static struct clk_branch gcc_qupv3_wrap1_s6_clk = {
 		.enable_mask = BIT(13),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s6_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s6_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s6_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2424,8 +2424,8 @@ static struct clk_branch gcc_qupv3_wrap1_s7_clk = {
 		.enable_mask = BIT(14),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_qupv3_wrap1_s7_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_qupv3_wrap1_s7_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_qupv3_wrap1_s7_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2515,8 +2515,8 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_sdcc1_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_sdcc1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2535,8 +2535,8 @@ static struct clk_branch gcc_sdcc1_ice_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_ice_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_sdcc1_ice_core_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_sdcc1_ice_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2566,8 +2566,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_sdcc2_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_sdcc2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2597,8 +2597,8 @@ static struct clk_branch gcc_sdcc4_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc4_apps_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_sdcc4_apps_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_sdcc4_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2618,8 +2618,8 @@ static struct clk_branch gcc_sys_noc_cpuss_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sys_noc_cpuss_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_cpuss_ahb_postdiv_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_cpuss_ahb_postdiv_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
@@ -2709,8 +2709,8 @@ static struct clk_branch gcc_ufs_phy_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_axi_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2729,8 +2729,8 @@ static struct clk_branch gcc_ufs_phy_ice_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_ice_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_ice_core_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_ice_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2749,8 +2749,8 @@ static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_phy_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2767,8 +2767,8 @@ static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_rx_symbol_0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_rx_symbol_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_rx_symbol_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2785,8 +2785,8 @@ static struct clk_branch gcc_ufs_phy_rx_symbol_1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_rx_symbol_1_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_rx_symbol_1_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_rx_symbol_1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2803,8 +2803,8 @@ static struct clk_branch gcc_ufs_phy_tx_symbol_0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_tx_symbol_0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_tx_symbol_0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_tx_symbol_0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2823,8 +2823,8 @@ static struct clk_branch gcc_ufs_phy_unipro_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_phy_unipro_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2841,8 +2841,8 @@ static struct clk_branch gcc_usb30_prim_master_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_prim_master_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_prim_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2891,8 +2891,8 @@ static struct clk_branch gcc_usb30_sec_master_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_sec_master_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb30_sec_master_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb30_sec_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2941,8 +2941,8 @@ static struct clk_branch gcc_usb3_prim_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_prim_phy_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2959,8 +2959,8 @@ static struct clk_branch gcc_usb3_prim_phy_com_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_prim_phy_com_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2979,8 +2979,8 @@ static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_prim_phy_pipe_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_prim_phy_pipe_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb3_prim_phy_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3076,8 +3076,8 @@ static struct clk_branch gcc_usb3_sec_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_sec_phy_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_sec_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb3_sec_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3094,8 +3094,8 @@ static struct clk_branch gcc_usb3_sec_phy_com_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_sec_phy_com_aux_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_sec_phy_aux_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb3_sec_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3114,8 +3114,8 @@ static struct clk_branch gcc_usb3_sec_phy_pipe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_sec_phy_pipe_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &gcc_usb3_sec_phy_pipe_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&gcc_usb3_sec_phy_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218C5C77B6E
	for <linux-clk@archiver.kernel.org>; Wed, 12 Apr 2023 13:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbjDLNsf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Apr 2023 09:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbjDLNsd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Apr 2023 09:48:33 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19B3BDF
        for <linux-clk@vger.kernel.org>; Wed, 12 Apr 2023 06:48:32 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t20so14764487lfd.5
        for <linux-clk@vger.kernel.org>; Wed, 12 Apr 2023 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681307310; x=1683899310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jNb3jf5do6Pf7/ddJtHqf5nErsfSQQLAXRfF2LVEfMU=;
        b=Bk82oYg9WhaRQ2eOeibpHMzLxPlEF07a809UIg434bDvvp2LHNNcCjnBXD3gthuyCm
         eC+1wlNxbfTMwGMU0GppjB187Cs0aPWNkWEVWF2Nr7viGqgVHqc34OkIchOQxfN6GLqa
         /dy0sd+nx8EX5CK7ySieHqBpIHDeIZsfKxDIF7w713KmoEk13KNhTd1fXUre1IqeKp0m
         viZBQQzKAXoxyNpp7ZYHcqznuNcOxbl8pefHqBKwfP0IF/X0Tp1XxgGiZsZz4lSd8vlp
         qWaTeqjTRj2e8qNo7nXiiNfk/xMSOSBdENfAIEd7/M5y/d4wq03pqwEYY45e+OcBhy1a
         ZRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681307310; x=1683899310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNb3jf5do6Pf7/ddJtHqf5nErsfSQQLAXRfF2LVEfMU=;
        b=ZKZXfr1oUObjI+nJwNAd14QV4DJLg56pIpt1DcgU9u3KFZhkzAfLPsQGpE6w3Id5gm
         k9gfowViEVIGDvuF+q9bPSX5CtComhFFJ0yWi8x6PXsCmkk1jqBqBqPe/LMxm1Nn1xIR
         8QR0ZmVuEh1C4boMxs5pJRlXF30k2uytcAkKDggjF+IjACmxcToBtRp6lvTkz4QsQAc7
         Qi5WhFnL+qwlA9DgtQtzPzQ1NLvLBrI+bAckMfWvA7vbdPjb1TveNhpNvFT83pVku3ez
         pWbnizFq1UyYvy0/vtkEr7YTyLcfdvC0BVSFPAFvl7KeGsC0E4haFDGtoaauVOKW3l2v
         uDKA==
X-Gm-Message-State: AAQBX9fWluJ3W89WfLKY9p0SGNvZuub5cGWtBlmWdV8TIpbkAZnlu1UQ
        2j6ShFbDFlHyiPd/HeNN5yQI8w==
X-Google-Smtp-Source: AKy350Z22vjrT34MpRi/BpIiXZ7TRt4U48aULgVikXbth1LsmOTouq/OLzD+uIYq9N/a6du3imzkCw==
X-Received: by 2002:ac2:5390:0:b0:4cd:afbf:c206 with SMTP id g16-20020ac25390000000b004cdafbfc206mr5435813lfh.22.1681307310301;
        Wed, 12 Apr 2023 06:48:30 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z18-20020ac25df2000000b004e8497a5604sm3010490lfq.108.2023.04.12.06.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 06:48:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sm8350: fix PCIe PIPE clocks handling
Date:   Wed, 12 Apr 2023 16:48:29 +0300
Message-Id: <20230412134829.3686467-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On SM8350 platform the PCIe PIPE clocks require additional handling to
function correclty. They are to be switched to the tcxo source before
turning PCIe GDSCs off and should be switched to PHY PIPE source once
they are working. Swithc PCIe PHY clocks to use clk_regmap_phy_mux_ops,
which provide support for this dance.

Fixes: 44c20c9ed37f ("clk: qcom: gcc: Add clock driver for SM8350")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8350.c | 47 ++++++++++-------------------------
 1 file changed, 13 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index af4a1ea28421..1385a98eb3bb 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -17,6 +17,7 @@
 #include "clk-regmap.h"
 #include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
+#include "clk-regmap-phy-mux.h"
 #include "gdsc.h"
 #include "reset.h"
 
@@ -158,26 +159,6 @@ static const struct clk_parent_data gcc_parent_data_3[] = {
 	{ .fw_name = "bi_tcxo" },
 };
 
-static const struct parent_map gcc_parent_map_4[] = {
-	{ P_PCIE_0_PIPE_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_4[] = {
-	{ .fw_name = "pcie_0_pipe_clk", },
-	{ .fw_name = "bi_tcxo" },
-};
-
-static const struct parent_map gcc_parent_map_5[] = {
-	{ P_PCIE_1_PIPE_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_5[] = {
-	{ .fw_name = "pcie_1_pipe_clk" },
-	{ .fw_name = "bi_tcxo" },
-};
-
 static const struct parent_map gcc_parent_map_6[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GCC_GPLL0_OUT_MAIN, 1 },
@@ -274,32 +255,30 @@ static const struct clk_parent_data gcc_parent_data_14[] = {
 	{ .fw_name = "bi_tcxo" },
 };
 
-static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
+static struct clk_regmap_phy_mux gcc_pcie_0_pipe_clk_src = {
 	.reg = 0x6b054,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_4,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk_src",
-			.parent_data = gcc_parent_data_4,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_4),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "pcie_0_pipe_clk",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
 
-static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
+static struct clk_regmap_phy_mux gcc_pcie_1_pipe_clk_src = {
 	.reg = 0x8d054,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_5,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk_src",
-			.parent_data = gcc_parent_data_5,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_5),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "pcie_1_pipe_clk",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
-- 
2.39.2


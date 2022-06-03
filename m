Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1C8CCA482
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jun 2022 08:45:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242859AbiFCIpD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Jun 2022 04:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242875AbiFCIpB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jun 2022 04:45:01 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3496736E1C
        for <linux-clk@vger.kernel.org>; Fri,  3 Jun 2022 01:45:00 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id m25so4436116lji.11
        for <linux-clk@vger.kernel.org>; Fri, 03 Jun 2022 01:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eYsPjIQLdGu+da0DjBzUf+P1QJZsLnLxgUjaqZ6pn7o=;
        b=ArK/8BQf4Q0tC9Kl39zRIr23LvwOqxcgppsJfpwenvWu5y/DucMEZTaI1+dDCRI9gC
         TdAlq3c47Lz9yoXDiDZ8OiFdIUPkmy5Ezwz9cbLDKGv7Ebgm1S43mQhqLXvy69CeAJVH
         ltUhnbf3UNyRnSIOLVucIp+vXxs0isxLWNbbU/xtxdp7l8+9ehVb9m3sNUK+eH9sNsS9
         ztmKi0qjNG5sM0pScLcV17ecmUblUI1kiZwF1CMnrlCHLRrNxvcSzgotk7pvwpySJUsZ
         hphvEq8ECXu5RZNXZ1VNQx0puJHG+V5DSAcZ/N5nSVPK748snP/50aDkIkuc+WTpQacY
         PSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eYsPjIQLdGu+da0DjBzUf+P1QJZsLnLxgUjaqZ6pn7o=;
        b=BwXDhNhVsZFNXqRhlypJYfLMfhwJaJnFdo43/2Lrp7OP76frc0+WH38mVrWMPg0huu
         PBR5SjO4wGRPQ+LNouvstUMVMrNZODQOC4ceeQLZQfzPDL2yHojVmuziP1cDAY5tgm02
         udn88d1rYbhe9OwULj+PJ8Q+7JlkPPFFVNLkEtUAU2JIn7Sql7OEHbVhDQKQlL7udDQW
         PWpXylB8340jfh6z/xbc1+I8lNPRPeQLWfk+c+TzRW1iCadfv7VhPb6/EnNxw2drtmqj
         Bd/4JIg37kea9+4mVrep+kebLhnFDaRYbkEsDlN05xvsvhrM0IKxY6GHuCrOpRcr/6XF
         7Z1Q==
X-Gm-Message-State: AOAM531xYnxkK5bzzfaGMiwlYgRIwOpu+eJOIE2DKl6A/cbl1Hki3pIg
        S08c7YxB96SuOpyPFkh+Yx8doQ==
X-Google-Smtp-Source: ABdhPJwQvyLD8+110DdpXMkZFskALkO4YJq/C805VEHR33NKF+lolH0Mbk5chXr29CT7Xafereubng==
X-Received: by 2002:a05:651c:4c9:b0:253:fc0b:5038 with SMTP id e9-20020a05651c04c900b00253fc0b5038mr29246733lji.278.1654245898383;
        Fri, 03 Jun 2022 01:44:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b7-20020a0565120b8700b00478f8c9d402sm1474817lfv.20.2022.06.03.01.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 01:44:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v10 3/5] clk: qcom: gcc-sc7280: use new clk_regmap_phy_mux_ops for PCIe pipe clocks
Date:   Fri,  3 Jun 2022 11:44:52 +0300
Message-Id: <20220603084454.1861142-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220603084454.1861142-1-dmitry.baryshkov@linaro.org>
References: <20220603084454.1861142-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use newly defined clk_regmap_phy_mux_ops for PCIe pipe clocks to let
the clock framework automatically park the clock when the clock is
switched off and restore the parent when the clock is switched on.

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sc7280.c | 47 ++++++++++-------------------------
 1 file changed, 13 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 423627d49719..5a853497d211 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -17,6 +17,7 @@
 #include "clk-rcg.h"
 #include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
+#include "clk-regmap-phy-mux.h"
 #include "common.h"
 #include "gdsc.h"
 #include "reset.h"
@@ -255,26 +256,6 @@ static const struct clk_parent_data gcc_parent_data_5[] = {
 	{ .hw = &gcc_gpll0_out_even.clkr.hw },
 };
 
-static const struct parent_map gcc_parent_map_6[] = {
-	{ P_PCIE_0_PIPE_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_6[] = {
-	{ .fw_name = "pcie_0_pipe_clk", .name = "pcie_0_pipe_clk" },
-	{ .fw_name = "bi_tcxo" },
-};
-
-static const struct parent_map gcc_parent_map_7[] = {
-	{ P_PCIE_1_PIPE_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_7[] = {
-	{ .fw_name = "pcie_1_pipe_clk", .name = "pcie_1_pipe_clk" },
-	{ .fw_name = "bi_tcxo" },
-};
-
 static const struct parent_map gcc_parent_map_8[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GCC_GPLL0_OUT_MAIN, 1 },
@@ -369,32 +350,30 @@ static const struct clk_parent_data gcc_parent_data_15[] = {
 	{ .hw = &gcc_mss_gpll0_main_div_clk_src.clkr.hw },
 };
 
-static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
+static struct clk_regmap_phy_mux gcc_pcie_0_pipe_clk_src = {
 	.reg = 0x6b054,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_6,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk_src",
-			.parent_data = gcc_parent_data_6,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_6),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "pcie_0_pipe_clk", .name = "pcie_0_pipe_clk",
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
-	.parent_map = gcc_parent_map_7,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk_src",
-			.parent_data = gcc_parent_data_7,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_7),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "pcie_1_pipe_clk", .name = "pcie_1_pipe_clk",
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
-- 
2.35.1


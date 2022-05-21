Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D27C433FE
	for <linux-clk@archiver.kernel.org>; Sat, 21 May 2022 00:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354263AbiEUAyA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 20:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354277AbiEUAx7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 20:53:59 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3A81AEC67
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 17:53:58 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id v9so2024923lja.12
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 17:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qPKCacZXKzUg/s9zuubTZYIAk2vKFy9+9ffdACuxYk8=;
        b=Hhm0BDplfhLsyU0nLOiNPzraxPgxGrpg8ZAEIVmdLKrmZqE3FUqmmKfUX5Zy7eZlfe
         ElW2yPyztGaNTJV0yP4ycYPnGu1RQjxVlJPfJJidFBiQ+xCy9NYIT6oGD1RxOWI2A8z/
         9Y9baDIAgsR8VSO40IT32FfFcXLYav9THhryQdX351JGrQCDPgf3I8ireJfkQBgOw1EE
         yU4jKao64z3uOrLXMTfdg0hxFAj7QxRRQZQmPnv4vXtp4U8qqWZq/CKHPmZRewfsIAaJ
         Xz9asdHBBdWeXSjEZzrfVI28xAIAi4jayDopnNUz4UDkgJZs5Aw934DoWgawIW1X2Ueg
         IrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qPKCacZXKzUg/s9zuubTZYIAk2vKFy9+9ffdACuxYk8=;
        b=de9pIOPjd4VHfelLCGpOdRytxoP3S5vqrieW/d2aaQ6Et0nBwp/RBgV3jnUu4qpn/9
         XxSk/1Qd/uNsD/G9Lnjqpk6Iem1P3tQd9BCgdomqX+CI2xsuWXgwCv9Q7lsWy/VTnrYA
         J8EUiZF/l7vQsonkrysMOmXx/b4qzzFaHDtn58I6I0x42Di0a+g7vynkX0hYPRqI+XyR
         /I/2bab6wK/bA658B7Na4Qt7P93u7Pegk5RWgqvVCY/CTO03Nta6Fm6mDudAGasdvSNJ
         NU182rdTi/onYVw/svCF9vzdjj1GHrLQbhh5wtKbOnkH7w9hqnVfXpIibLaKs3008tRv
         ckaw==
X-Gm-Message-State: AOAM533uSDjChGAjvruSslO0b97mVq3F6an2n/Ofp9uRcl/MR2Gws+Ku
        ZeJ8+5qIKygkb+ND0IKDlqqw0A==
X-Google-Smtp-Source: ABdhPJy49tSvmQ0RZUfBs1a9EoR3lljW4+q4DpWx9oPGJ0WalGnWZ2eiTXp3cfySuBvc8iwpXeeP+w==
X-Received: by 2002:a2e:83c9:0:b0:24d:a95d:7b7a with SMTP id s9-20020a2e83c9000000b0024da95d7b7amr6952022ljh.254.1653094437850;
        Fri, 20 May 2022 17:53:57 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id u14-20020a056512094e00b0047255d21187sm844559lft.182.2022.05.20.17.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 17:53:57 -0700 (PDT)
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
Subject: [PATCH v7 6/8] clk: qcom: gcc-sc7280: use new clk_regmap_phy_mux_ops for PCIe pipe clocks
Date:   Sat, 21 May 2022 03:53:41 +0300
Message-Id: <20220521005343.1429642-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521005343.1429642-1-dmitry.baryshkov@linaro.org>
References: <20220521005343.1429642-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use newly defined clk_regmap_phy_mux_ops for PCIe pipe clocks to let
the clock framework automatically park the clock when the clock is
switched off and restore the parent when the clock is switched on.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sc7280.c | 47 ++++++++++-------------------------
 1 file changed, 13 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 423627d49719..45a98b01d0f7 100644
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
-	.parent_map = gcc_parent_map_7,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk_src",
-			.parent_data = gcc_parent_data_7,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_7),
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
2.35.1


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D51C3525B
	for <linux-clk@archiver.kernel.org>; Tue, 12 Apr 2022 19:39:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352214AbiDLTlP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Apr 2022 15:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351182AbiDLTlE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Apr 2022 15:41:04 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2232A3B2A1
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 12:38:45 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 15so10559448ljw.8
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 12:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3m7sD5DReLGuXAEizIRitWnlXHp9Kn3L0qq2hxmokpc=;
        b=yyW+dOnPrRJyXxXjq0M/Pf0vDwHy1Hp3MjxkLBE3/zl+eZQDNhpNvK5B/o0zFUifq0
         uHfnWzeBLZ2IrveN8Dpnm2Vg9+ppSfVUav65BoQvzKfipdEEkqIyiwGEWPuVHwkCjTP+
         8C8B7ZF5PUnDWFSkNsX0yIM6Pzi9tJX2Y0Fa0lDHILYHwUaVxSE+YwchGrQjoggIhIgE
         UR1J9shENZT2jhWqeeEAYi2/ZSvroaTMs/yJBUAmsXE2CZd3Me+kDmYL+mQPl1pNv1v4
         Pi9MAc0i1LTj95Y4zGwrLlrjPQ2MOV9HRqyGi74XrU429HxKB3vbF6+ea3p2QLYD3ecj
         Q5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3m7sD5DReLGuXAEizIRitWnlXHp9Kn3L0qq2hxmokpc=;
        b=O7mPpu/v9MoMoPpC8TxYW7ctn+5Rw0DNmK4YmGr6cR3YzbUsSYZdy21/qmmFnhGzZ1
         SIhPaiRdHjX2XJj1tH/nIQ+GHPEkmlY3WJPV0yRdrqbkhDVkYCfpEsrAKwk17A5z9VvQ
         1x9M8eUcnR8Cv8AWG2DEWCa7ERbQn0p/3wqHYYbsapYgh1zKmf0oRB8y5opkc6r5QqxC
         CiHDfCWf7o46xolejOiwrp8LLQ4WI6EVtm8bS9SHVzGZi6mEVme/ChxHqwei4lPiLeJW
         MrEuHajbaWYPA/7UUpbWX+xydhFq9k9oy2RzfzwsdHY4512jSglx9p8eRxFiRFPSiHs8
         aiiA==
X-Gm-Message-State: AOAM532dtFVYFjzUJxwL3BuHoNz7UHox35wcqTIYc0lKFsn8VsGtQ3EK
        ffXHOsihCFL7c54sp11v/DCVFQ==
X-Google-Smtp-Source: ABdhPJxk41WXmv7SEUBUYZPOMe0q5NwIRxJxzIsCkRozc97NDnkVkiPeCo75AI7qkodLAclNiGyDbQ==
X-Received: by 2002:a2e:a783:0:b0:24b:6927:7460 with SMTP id c3-20020a2ea783000000b0024b69277460mr5167989ljf.104.1649792323315;
        Tue, 12 Apr 2022 12:38:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a0565120a8400b00450abeb42b3sm2731641lfu.235.2022.04.12.12.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 12:38:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v2 2/5] clk: qcom: gcc-sm8450: use new clk_regmap_mux_safe_ops for PCIe pipe clocks
Date:   Tue, 12 Apr 2022 22:38:36 +0300
Message-Id: <20220412193839.2545814-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412193839.2545814-1-dmitry.baryshkov@linaro.org>
References: <20220412193839.2545814-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use newly defined clk_regmap_mux_safe_ops for PCIe pipe clocks to let
the clock framework automatically park the clock when the clock is
switched off and restore the parent when the clock is switched on.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8450.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 593a195467ff..fb6decd3df49 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -243,13 +243,14 @@ static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
 	.reg = 0x7b060,
 	.shift = 0,
 	.width = 2,
+	.safe_src_parent = P_BI_TCXO,
 	.parent_map = gcc_parent_map_4,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk_src",
 			.parent_data = gcc_parent_data_4,
 			.num_parents = ARRAY_SIZE(gcc_parent_data_4),
-			.ops = &clk_regmap_mux_closest_ops,
+			.ops = &clk_regmap_mux_safe_ops,
 		},
 	},
 };
@@ -273,13 +274,14 @@ static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
 	.reg = 0x9d064,
 	.shift = 0,
 	.width = 2,
+	.safe_src_parent = P_BI_TCXO,
 	.parent_map = gcc_parent_map_6,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk_src",
 			.parent_data = gcc_parent_data_6,
 			.num_parents = ARRAY_SIZE(gcc_parent_data_6),
-			.ops = &clk_regmap_mux_closest_ops,
+			.ops = &clk_regmap_mux_safe_ops,
 		},
 	},
 };
-- 
2.35.1


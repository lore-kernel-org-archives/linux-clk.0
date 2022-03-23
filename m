Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE365C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Mar 2022 08:50:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242942AbiCWIvy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Mar 2022 04:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242906AbiCWIvs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Mar 2022 04:51:48 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AD175624
        for <linux-clk@vger.kernel.org>; Wed, 23 Mar 2022 01:50:16 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 25so874797ljv.10
        for <linux-clk@vger.kernel.org>; Wed, 23 Mar 2022 01:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7AIHmdlMdzmULilg6qWLqJ5/9CAU4VNtUbygox8IGUI=;
        b=XNyUyEwMUh62jEe0Pn/MWDdtye+jGSz3CouiHuVJzS+nEOLdXWh3b25XaMuknEpzSz
         72k8mvxHUOD4U2i8CoQOGrMU4FshojddsEDRe6ggJ/2HmumYhon3FKIcOhy//Fk7IIq5
         B5u3tsukxVdjJ19SS2zRP6P8AcVGq9hhZ/RIN6ioPnVKLM9fIX/LXNeix8/WZVcSzZxV
         Ep3rEUi2TaxO7Zez3fxRXLZ8dNdAts5OaXLS8ich5Slp4e1MywrU7Ff3FOeHntCWDJtq
         RXewW5//WDPWm0hfnht7gP/H564oOP2rfc0w6tFtjpfH95QeSYWATkmbyPP8v5Kqg/u8
         Ohbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7AIHmdlMdzmULilg6qWLqJ5/9CAU4VNtUbygox8IGUI=;
        b=Kpf4A0V14jMV9iiLCajXtlnk5Y2khEfphsnyqx10McDUaE+xbTKARIsbXEEVkQbn8E
         QFJyF0H2prHkVxZrSTJDTSmLmdhTRIWgOGYajmBi/ZykMKD/mR5ccjZI53nLxN09hSeB
         yvNXC1FXQxF8eATAc35vYct8Ff+UmOkF/xbMeSaUMSSVFA4hP7O/bhyoo/Bcc4sqV9xN
         qSENPPc87tuyJuTkexbLIJwSb3zbNhJjQqP4WtYCuKHeS7TFFlytAHAPfY3r2k52bz5r
         GVF2uYqAIfBYOp7Rspmvcy1ipU3przYbbWRF68v91/ic5lFh5MnqMPpCjWzZT9FWecb9
         F1Cg==
X-Gm-Message-State: AOAM531jasBmOollzdwRwh9ayAxK+3e90oePQViTAJAfbp631QMjRZ0o
        NCafdtFAGwWGHrZGT4s6ezGomA==
X-Google-Smtp-Source: ABdhPJxn7ck6/VN+5W2bmvjXzEoUox1WI0toEkIsA/0PcbdXUp41W6ysCi31A3OmtH8w+9/mk1ie9Q==
X-Received: by 2002:a2e:a266:0:b0:249:8463:7d71 with SMTP id k6-20020a2ea266000000b0024984637d71mr10118413ljm.107.1648025414338;
        Wed, 23 Mar 2022 01:50:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c40-20020a05651223a800b0044a1edf823dsm1376140lfv.150.2022.03.23.01.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 01:50:13 -0700 (PDT)
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
Subject: [PATCH v1 3/5] clk: qcom: gcc-sc7280: use new clk_regmap_mux_safe_ops for PCIe pipe clocks
Date:   Wed, 23 Mar 2022 11:50:08 +0300
Message-Id: <20220323085010.1753493-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323085010.1753493-1-dmitry.baryshkov@linaro.org>
References: <20220323085010.1753493-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gcc-sc7280.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 423627d49719..dafbbc8f3bf4 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -373,13 +373,14 @@ static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
 	.reg = 0x6b054,
 	.shift = 0,
 	.width = 2,
+	.safe_src_parent = P_BI_TCXO,
 	.parent_map = gcc_parent_map_6,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk_src",
 			.parent_data = gcc_parent_data_6,
 			.num_parents = ARRAY_SIZE(gcc_parent_data_6),
-			.ops = &clk_regmap_mux_closest_ops,
+			.ops = &clk_regmap_mux_safe_ops,
 		},
 	},
 };
@@ -388,13 +389,14 @@ static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
 	.reg = 0x8d054,
 	.shift = 0,
 	.width = 2,
+	.safe_src_parent = P_BI_TCXO,
 	.parent_map = gcc_parent_map_7,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk_src",
 			.parent_data = gcc_parent_data_7,
 			.num_parents = ARRAY_SIZE(gcc_parent_data_7),
-			.ops = &clk_regmap_mux_closest_ops,
+			.ops = &clk_regmap_mux_safe_ops,
 		},
 	},
 };
-- 
2.35.1


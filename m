Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682CAC7EE22
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 15:33:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbjEHPd1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 May 2023 11:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233694AbjEHPd1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 11:33:27 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91B2C7EC7
        for <linux-clk@vger.kernel.org>; Mon,  8 May 2023 08:33:22 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f13a72ff53so5174143e87.0
        for <linux-clk@vger.kernel.org>; Mon, 08 May 2023 08:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683560001; x=1686152001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JN0718Ijf0M8e5M4RHFLxUvS5jCN6cHoZ+1J4Zo+39Q=;
        b=QTAI+QeH2IytZzpIW3YFpxyjExDJuWCTc2IxRar4kGuqfqRg7J5qL8EOjK/Zg4HpXg
         6nC5Fmn/Kfi1W7+6g4pAnY8HBYf4s/p0k5JrF5eAtPgptds94knTDuv7Lg4JUVmYkuid
         DxgkAuVv4g5TWTMwn6qLYR4RJZAofqR7VTJZq7VlgCTv11znqnKI+CR+jofFIEevWiIv
         EpNLOpeRXREW0iSwJjSdMi8ZG9/Xzb3/B8FwUAKo32WwOPFOqxs8PhsYd/KQMq8h0kDq
         wdL7ToXSGL4z3bSe5oKACupRfWvQlFM/elf8VwQV/v+LZZydQHBMGRkVtT52FnTh0JPI
         b80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683560001; x=1686152001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JN0718Ijf0M8e5M4RHFLxUvS5jCN6cHoZ+1J4Zo+39Q=;
        b=aOoZScfhQMsbXOztC891L5puT80/T7BItUVA2xbxcFzfY1/SsBXdHawdyCvxqWwEI+
         6tt59pLKQE7TGTPCPsvJtl9kmFgBvGiZW7Ztm6yNqpTNtXY8wbu/gYw9WIV5Q78vm3dI
         xMeZ05qkdk/Cu2vZ4XuF+aqji+PRxC/KNn9+wFfghvoZF8fb8hK1moDutKpwpx7qON49
         GGpBqvYEDqUzHG43NmHRLuV2glibgtr3zPcTiKDJGgwubRX2xRKnP3pD2SPZnORFZice
         YhUigHLU06R8fNXqZLUdt82JIPKYnDHMgA76g8l0Hn51mg5zlr7+ZCIR0X8cY0h0W8hd
         YDLA==
X-Gm-Message-State: AC+VfDxgvEeewVTOPCWdzFDsDMzHAhdp3hBi0qO8NTdneWJe3SZ8kUPl
        3nWOcDEyHHtRluhSEaQVMd9mQg==
X-Google-Smtp-Source: ACHHUZ51jtBedf/4Ly0u2A7Cr0CAmGLtF6X3iM4jqyXZ+SvM4TZfs1nhabZO7A1q2cVrWvPx7XMUGw==
X-Received: by 2002:ac2:55a5:0:b0:4ed:b15d:467d with SMTP id y5-20020ac255a5000000b004edb15d467dmr2895247lfg.53.1683560000828;
        Mon, 08 May 2023 08:33:20 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id o17-20020a056512051100b004eff70e321bsm21865lfb.237.2023.05.08.08.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 08:33:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: mmcc-msm8974: remove oxili_ocmemgx_clk
Date:   Mon,  8 May 2023 18:33:19 +0300
Message-Id: <20230508153319.2371645-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

After the internal discussions, it looks like this clock is managed by
RPM itself. Linux kernel should not touch it on its own, as this causes
disagreement with RPM. Shutting down this clock causes the OCMEM<->GPU
interface to stop working, resulting in GPU hangchecks/timeouts.

Fixes: d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia clock controller (MMCC)")
Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8974.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 277ef0065aae..82f6bad144a9 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -2204,23 +2204,6 @@ static struct clk_branch ocmemcx_ocmemnoc_clk = {
 	},
 };
 
-static struct clk_branch oxili_ocmemgx_clk = {
-	.halt_reg = 0x402c,
-	.clkr = {
-		.enable_reg = 0x402c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "oxili_ocmemgx_clk",
-			.parent_data = (const struct clk_parent_data[]){
-				{ .fw_name = "gfx3d_clk_src", .name = "gfx3d_clk_src" },
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch ocmemnoc_clk = {
 	.halt_reg = 0x50b4,
 	.clkr = {
@@ -2512,7 +2495,6 @@ static struct clk_regmap *mmcc_msm8226_clocks[] = {
 	[MMSS_MMSSNOC_AXI_CLK] = &mmss_mmssnoc_axi_clk.clkr,
 	[MMSS_S0_AXI_CLK] = &mmss_s0_axi_clk.clkr,
 	[OCMEMCX_AHB_CLK] = &ocmemcx_ahb_clk.clkr,
-	[OXILI_OCMEMGX_CLK] = &oxili_ocmemgx_clk.clkr,
 	[OXILI_GFX3D_CLK] = &oxili_gfx3d_clk.clkr,
 	[OXILICX_AHB_CLK] = &oxilicx_ahb_clk.clkr,
 	[OXILICX_AXI_CLK] = &oxilicx_axi_clk.clkr,
@@ -2670,7 +2652,6 @@ static struct clk_regmap *mmcc_msm8974_clocks[] = {
 	[MMSS_S0_AXI_CLK] = &mmss_s0_axi_clk.clkr,
 	[OCMEMCX_AHB_CLK] = &ocmemcx_ahb_clk.clkr,
 	[OCMEMCX_OCMEMNOC_CLK] = &ocmemcx_ocmemnoc_clk.clkr,
-	[OXILI_OCMEMGX_CLK] = &oxili_ocmemgx_clk.clkr,
 	[OCMEMNOC_CLK] = &ocmemnoc_clk.clkr,
 	[OXILI_GFX3D_CLK] = &oxili_gfx3d_clk.clkr,
 	[OXILICX_AHB_CLK] = &oxilicx_ahb_clk.clkr,
-- 
2.39.2


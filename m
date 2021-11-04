Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC18C433FE
	for <linux-clk@archiver.kernel.org>; Thu,  4 Nov 2021 01:12:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1A9B611CA
	for <linux-clk@archiver.kernel.org>; Thu,  4 Nov 2021 01:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhKDBOm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Nov 2021 21:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbhKDBOg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Nov 2021 21:14:36 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C93FC06127A
        for <linux-clk@vger.kernel.org>; Wed,  3 Nov 2021 18:11:58 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id j2so8744984lfg.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Nov 2021 18:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/aMvXOBVuDxAsSJ0JiTU0X5S+yUEp0VuD/6iPiLDe4w=;
        b=Re/Kn8ZRQceQD3lgrGLsdcnRKNWGejLBWLOVh2KpBESephsqO+IJvUNZAoITWmxOgc
         /bChYz7ljvGzO+x+RuobAdBSQgEOC1GSyT2yeO4YuIma3GjXanDFBEPiIwRRdxDWOqLO
         eDo+3YFXCbGGLMsBAYXjiAQpkswYp2RfXBiUo6H73foMbgnn+7vvw2BHoD9oqlrUJ9oi
         6xLvyLlah6leLj40VZbf6Ly04PbSrXmVYwLr2JF6K1co9c2//E1VrOuL4R+KM8aH2tT2
         s84ARyMPZNlfZAct4r9qudwv6oxEhuiZqGmUMwVWxUB5Qv72S1oOeZewOfkVhX4720b6
         E7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/aMvXOBVuDxAsSJ0JiTU0X5S+yUEp0VuD/6iPiLDe4w=;
        b=IscMGZsKIrXjWr7kxMCMyibQxmhDwHsPca7IUgCK9zYuvihWDC41DSuk09amTdW2KM
         jihFdlKReR4vhoL/mdqvbhQU2Jo99Tbz2KXYKeWksJ4uVdDYLa/27yEdRucY6NF5mR89
         WsHJDMvM1JG4+5hLBwywdQsCvc1pqQNcWII+3azcmOU3escAW8/MZiEKCcu9H+K4u+mV
         tLwyyEYFSD394TTzm1uE4YzYQ2xTSWskDQ+YeBTVlLPhiuH0ipbCaRIWv6zWQ77rXlx6
         po2WWhWZjoC4rzAdy5mm/ALnVLvHX6cI4/7hkfeX0jR/TXs3wRG5YBsBS3/1h7+gOT+5
         c2SA==
X-Gm-Message-State: AOAM533frQjFJMqpkJr6zGCxQGUgG7j0sW4Slj68xlyVdQcAXRKKmK39
        Wii9XVGxTGn9mJpOdpGDpi2Hag==
X-Google-Smtp-Source: ABdhPJxOyVv31u/8yJ/9LNK/9Lz94ZxKKOOgNfeX9MWjDS4qA9c3zCclKxfQLaqk0mTaDrKm2RXaJA==
X-Received: by 2002:a05:6512:3401:: with SMTP id i1mr46815780lfr.336.1635988316671;
        Wed, 03 Nov 2021 18:11:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b10sm28681ljj.112.2021.11.03.18.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 18:11:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH] clk: qcom: gcc-msm8996: Drop (again) gcc_aggre1_pnoc_ahb_clk
Date:   Thu,  4 Nov 2021 04:11:55 +0300
Message-Id: <20211104011155.2209654-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gcc_aggre1_pnoc_ahb_clk is crucial for the proper MSM8996/APQ8096
functioning. If it gets disabled, several subsytems will stop working
(including eMMC/SDCC and USB). There are no in-kernel users of this
clock, so it is much simpler to remove from the kernel.

The clock was first removed in the commit 9e60de1cf270 ("clk: qcom:
Remove gcc_aggre1_pnoc_ahb_clk from msm8996") by Stephen Boyd, but got
added back in the commit b567752144e3 ("clk: qcom: Add some missing gcc
clks for msm8996") by Rajendra Nayak.

Let's remove it again in hope that nobody adds it back.

Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Fixes: b567752144e3 ("clk: qcom: Add some missing gcc clks for msm8996")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 3c3a7ff04562..9b1674b28d45 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -2937,20 +2937,6 @@ static struct clk_branch gcc_smmu_aggre0_ahb_clk = {
 	},
 };
 
-static struct clk_branch gcc_aggre1_pnoc_ahb_clk = {
-	.halt_reg = 0x82014,
-	.clkr = {
-		.enable_reg = 0x82014,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_aggre1_pnoc_ahb_clk",
-			.parent_names = (const char *[]){ "periph_noc_clk_src" },
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_aggre2_ufs_axi_clk = {
 	.halt_reg = 0x83014,
 	.clkr = {
@@ -3474,7 +3460,6 @@ static struct clk_regmap *gcc_msm8996_clocks[] = {
 	[GCC_AGGRE0_CNOC_AHB_CLK] = &gcc_aggre0_cnoc_ahb_clk.clkr,
 	[GCC_SMMU_AGGRE0_AXI_CLK] = &gcc_smmu_aggre0_axi_clk.clkr,
 	[GCC_SMMU_AGGRE0_AHB_CLK] = &gcc_smmu_aggre0_ahb_clk.clkr,
-	[GCC_AGGRE1_PNOC_AHB_CLK] = &gcc_aggre1_pnoc_ahb_clk.clkr,
 	[GCC_AGGRE2_UFS_AXI_CLK] = &gcc_aggre2_ufs_axi_clk.clkr,
 	[GCC_AGGRE2_USB3_AXI_CLK] = &gcc_aggre2_usb3_axi_clk.clkr,
 	[GCC_QSPI_AHB_CLK] = &gcc_qspi_ahb_clk.clkr,
-- 
2.33.0


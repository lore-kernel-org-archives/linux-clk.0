Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E29C04EBF
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 18:35:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 53EC020848
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 18:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dh5+uG6g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53EC020848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbeLCSfi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 13:35:38 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46599 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbeLCSfh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Dec 2018 13:35:37 -0500
Received: by mail-pl1-f195.google.com with SMTP id t13so6880596ply.13
        for <linux-clk@vger.kernel.org>; Mon, 03 Dec 2018 10:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZyX8tNHK5VOts8os4OSbi/JxaS4IFqhRIvTt1egsXfY=;
        b=Dh5+uG6gTjaiKou/ckwADwGhLsaTDPo5Y0F5CVwftykKWHHOfcK5iOkHqCcG3a117s
         wQWCss/Tr9r6pNC6XupWCOCe7F/ouVWIkkfPljr5VISrl3M2SpkfM5uwg2BDPlMLYCgP
         ExZOrH0iZznFqgNVBUkVZ8IdjRS+pzx0/dbwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZyX8tNHK5VOts8os4OSbi/JxaS4IFqhRIvTt1egsXfY=;
        b=Q28wopxG/mhFLvKodz4PtKEMpXs82D3YeEmMvQESzjIRp9hzPKWPJ5aLW796HNLm95
         A/wJgcg8ewKPu5srZrqN82Bdhl5J9gPVvjE6QQn2avUClJY7P3IyQMwooLfGvV3NUmHP
         IMBKpucLJlH3ciMLjk1z7Bn6SYdxoz/zhgSmjJsvvkEg0LyZLc2MqZGktKQCSomyuC9C
         CYwSdmIxjJZSEGT7XOCnb652/3463TUAKgJR5qN1KNbmblX8m0tAjgD97LDtxmItmY2k
         qrf2AjaW1HhvtOMXSBln9gWlnCpvLpDIOJNNvaGuPIojOzh4xioCaOgJ5RTs3T4wQtto
         T/wQ==
X-Gm-Message-State: AA+aEWa69D/nTNCAeQiV5u3IaGspbNMo9uY0JMnq0+iFx5+Mu334l0mo
        tU/O2kNNYewK/nGSUJ+80qYY7g==
X-Google-Smtp-Source: AFSGD/WKK2DoX7M6iq46vOR/9ZL+RxxviwZPprMUnSvwxAHh5SMdgxtzJkzI1gQ8VRB0JpnFyoQkiQ==
X-Received: by 2002:a17:902:33c1:: with SMTP id b59mr16825863plc.220.1543862134494;
        Mon, 03 Dec 2018 10:35:34 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f6sm20180969pfg.188.2018.12.03.10.35.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Dec 2018 10:35:33 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 1/3] clk: qcom: gcc-msm8998: Drop hmss_dvm and lpass_at
Date:   Mon,  3 Dec 2018 10:33:28 -0800
Message-Id: <20181203183330.2073-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181203183330.2073-1-bjorn.andersson@linaro.org>
References: <20181203183330.2073-1-bjorn.andersson@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Disabling gcc_hmss_dvm_bus_clk and gcc_lpass_at_clk causes the board to
lock up, and by that preventing the kernel to boot without
clk_ignore_unused.

gcc_hmss_dvm_bus_clk is marked always-on downstream, but not referenced,
and gcc_lpass_at_clk isn't mentioned. So let's remove them until they
are needed by some client.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Drop the clocks, rather than marking them critical.

 drivers/clk/qcom/gcc-msm8998.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 9f0ae403d5f5..aed7f1f92614 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -1964,19 +1964,6 @@ static struct clk_branch gcc_hmss_at_clk = {
 	},
 };
 
-static struct clk_branch gcc_hmss_dvm_bus_clk = {
-	.halt_reg = 0x4808c,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x4808c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_hmss_dvm_bus_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_hmss_rbcpr_clk = {
 	.halt_reg = 0x48008,
 	.halt_check = BRANCH_HALT,
@@ -2007,19 +1994,6 @@ static struct clk_branch gcc_hmss_trig_clk = {
 	},
 };
 
-static struct clk_branch gcc_lpass_at_clk = {
-	.halt_reg = 0x47020,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x47020,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_lpass_at_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_lpass_trig_clk = {
 	.halt_reg = 0x4701c,
 	.halt_check = BRANCH_HALT,
@@ -2653,10 +2627,8 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
 	[GCC_GPU_SNOC_DVM_GFX_CLK] = &gcc_gpu_snoc_dvm_gfx_clk.clkr,
 	[GCC_HMSS_AHB_CLK] = &gcc_hmss_ahb_clk.clkr,
 	[GCC_HMSS_AT_CLK] = &gcc_hmss_at_clk.clkr,
-	[GCC_HMSS_DVM_BUS_CLK] = &gcc_hmss_dvm_bus_clk.clkr,
 	[GCC_HMSS_RBCPR_CLK] = &gcc_hmss_rbcpr_clk.clkr,
 	[GCC_HMSS_TRIG_CLK] = &gcc_hmss_trig_clk.clkr,
-	[GCC_LPASS_AT_CLK] = &gcc_lpass_at_clk.clkr,
 	[GCC_LPASS_TRIG_CLK] = &gcc_lpass_trig_clk.clkr,
 	[GCC_MMSS_NOC_CFG_AHB_CLK] = &gcc_mmss_noc_cfg_ahb_clk.clkr,
 	[GCC_MMSS_QM_AHB_CLK] = &gcc_mmss_qm_ahb_clk.clkr,
-- 
2.18.0


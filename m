Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771A0C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 20:37:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbiL1Uha (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 15:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiL1Uh3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 15:37:29 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D4D165BF
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 12:37:28 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bf43so25054895lfb.6
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 12:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vOB2BNWwETzT/PWHCgK09Lr+xKNMr+FYMdGX1/NYIf4=;
        b=ITwWd+cnVms/1qZLMTx0e8qwcxdLBnaYhvApgSSaqOdG0yEXQZWcKVw3+gAgDpVLOv
         kBoSlf2UJL8MqHlIwdVBrqjMS92UoxR44lWdnK2ymUlcRfxIJZ35t+xAg8QNfVFLCoPO
         SJQv3ZqXEjCK6G09tV0UGtB5XZEvHv9Er2e5s8sn3Z2KBjwRmsPSN6DlOUKyZdL2yoNA
         pmUKPyCUIuR7UEz/4QQieTP8NsqT5Mt2AJt6A0HwrbXZCFoXQ8f6bZE49MpJ5v58z7LQ
         MtymHSxAS1TsC34DKXthdu32az4JsoHbe6chqghxrY641o1VPH8yqKjv1j7+2eFN0BqV
         qQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vOB2BNWwETzT/PWHCgK09Lr+xKNMr+FYMdGX1/NYIf4=;
        b=3AFRiI/dberiEC6xjtbhr49VVQ191lM6WysDpGCwo+zMVW+kRmKSb/L0soYwup2ynm
         TUN7WFFoAqeDE4DdT1MfSt2Tlk1nZpZ1w+yZjeir6grv00bE6IhdNXEex1ZkfZaGfNzU
         axC+kpl9wVLF9yHL3HaQNJBWSkztUs33+UG8/Wpby0HLVMXkuAhJxZnT4yPIVYJP2PRn
         7YBydNzvBMqCPaJQug4yfnJhkEhVecyVRnJVHKxphqf+yOtUl2ou3Lco1E6XHHo/sMVt
         dosEHU2rGNQiCNtsWuBxb9MiQ8j8FijynrbtpRdw+ljGb8CtcX3Q/t9G3ffs573vdOnu
         lyLw==
X-Gm-Message-State: AFqh2kqFBL/X/+8NifdF/2aaubudhbGmjSNgmtYtGikxW2b434Si+Unp
        umXxbMxmyX7NM5Fkn/4QiU0DSQ==
X-Google-Smtp-Source: AMrXdXuS/KatGX8neuVw/gQsgIFmzTYk8oxfx2PTno/VuDgQ2BFGZAMdbHV4mxJY5LkrOH4qID9SOw==
X-Received: by 2002:a19:7513:0:b0:4b0:38f1:1266 with SMTP id y19-20020a197513000000b004b038f11266mr9797142lfe.34.1672259846766;
        Wed, 28 Dec 2022 12:37:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j4-20020a056512344400b004cb0dfe4993sm943001lfr.65.2022.12.28.12.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 12:37:26 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-msm8974: switch from sleep_clk_src to sleep_clk
Date:   Wed, 28 Dec 2022 22:37:25 +0200
Message-Id: <20221228203725.3131237-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

gcc-msm8974 uses the registered sleep_clk_src clock, which is just a 1:1
fixed factor clock register on top of the board's sleep_clk. Switch the
driver to use the board sleep_clk directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8974.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index 025cc9a20dbb..0231c1efd286 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -2110,7 +2110,7 @@ static struct clk_branch gcc_sdcc1_cdccal_sleep_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_cdccal_sleep_clk",
 			.parent_data = (const struct clk_parent_data[]){
-				{ .fw_name = "sleep_clk", .name = "sleep_clk_src" }
+				{ .fw_name = "sleep_clk", .name = "sleep_clk" }
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2275,7 +2275,7 @@ static struct clk_branch gcc_usb2a_phy_sleep_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb2a_phy_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "sleep_clk", .name = "sleep_clk_src",
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2291,7 +2291,7 @@ static struct clk_branch gcc_usb2b_phy_sleep_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb2b_phy_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "sleep_clk", .name = "sleep_clk_src",
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2341,7 +2341,7 @@ static struct clk_branch gcc_usb30_sleep_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "sleep_clk", .name = "sleep_clk_src",
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2440,7 +2440,7 @@ static struct clk_branch gcc_usb_hsic_io_cal_sleep_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hsic_io_cal_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "sleep_clk", .name = "sleep_clk_src",
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
-- 
2.39.0


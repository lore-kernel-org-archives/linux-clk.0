Return-Path: <SRS0=5xJ2=AK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C503C433E1
	for <linux-clk@archiver.kernel.org>; Mon, 29 Jun 2020 21:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD39320720
	for <linux-clk@archiver.kernel.org>; Mon, 29 Jun 2020 21:19:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="AanS3XjB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbgF2VT6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Jun 2020 17:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390508AbgF2VSh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Jun 2020 17:18:37 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D179C08C5DB
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2020 14:18:37 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id h18so8355199qvl.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2020 14:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NKjRYvSAJqWIMQCbW26UX9pAyMFbyr2ycBY9k4qgOjc=;
        b=AanS3XjBFVvZhERGSYMHPqip2OE/GKUgQZew83gSLNDTPelKlayFH5CvtU4PLHC9WZ
         6+1fJakggROPnITVmvkQHNeZ8cWokGpG1ooxDNBXKtLWZRjNX8/uuV9jTOYAm71exxkM
         /iW1b6gjaVpFwPq7M4VJAcXrJ32h6vm1kaLxZqx2rm2XSF90hltwNZA1NhjoY2UJYo+6
         vCQ1Q/KN2Ai9Pov8IwlwtS9K9P3k/wLfy+uR7SX9ANRMnhuCfKRjcuCSI9PcMlFBklbt
         nfo2avGZhrLjgSFICY64ZwRwIdd92tZFCGdhLDz41ova2Kpmpwqfgtu+FkUIUELkbxs4
         jdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NKjRYvSAJqWIMQCbW26UX9pAyMFbyr2ycBY9k4qgOjc=;
        b=mwDF61fmPkBVcBz/XCNhCMIFVE8ABfaIFwbNKNrN7zeL/q0Q5mV5H/1bE8NK2ifPPl
         CESXGia3j1IEZ/0nRq+5MMTln9Tze/Cv3hJqtT3c9bi65f2h1TyuLVBoBZgLcP2BvPb/
         KsO2Y6shPUky7HWHyA+sPYRckRbeW4kXdmtjP4Pfqdo5H/hITq8iNlhUsvG729aFjvrq
         DWXuXjflsS982ZL8IoVoUKzfA3gsM6gpA4/NtkOWi2zpYtkLk/6isliNnMHwmIHmuYL5
         ZQjysTg9NY6j3V86IqeEBX1rj+O9hJJyROsPLV+gD/Y2nQK2CpJm6cN5Y/jOtfF+7Tei
         yx4g==
X-Gm-Message-State: AOAM531ycEit+U2AbcB5V9RmbmwieiLKQK8qUxiYt7HtFbNOFs1Y7QQA
        871VsHA/LhSizdzCz2Nj+vbbBg==
X-Google-Smtp-Source: ABdhPJyD8cfPh+iEnnTUKmGkLuaQfR2EA4VVnwMebrGdkzOFb2snHc0LTGO8Ex3ued7dqgVphbIUBg==
X-Received: by 2002:a05:6214:328:: with SMTP id j8mr2923727qvu.75.1593465516657;
        Mon, 29 Jun 2020 14:18:36 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id b196sm1169078qkg.11.2020.06.29.14.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:18:36 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v2 01/13] clk: qcom: gcc: fix sm8150 GPU and NPU clocks
Date:   Mon, 29 Jun 2020 17:17:07 -0400
Message-Id: <20200629211725.2592-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629211725.2592-1-jonathan@marek.ca>
References: <20200629211725.2592-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix the parents and set BRANCH_HALT_SKIP. From the downstream driver it
should be a 500us delay and not skip, however this matches what was done
for other clocks that had 500us delay in downstream.

Fixes: f73a4230d5bb ("clk: qcom: gcc: Add GPU and NPU clocks for SM8150")

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/gcc-sm8150.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index 72524cf11048..55e9d6d75a0c 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -1617,6 +1617,7 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk = {
 };
 
 static struct clk_branch gcc_gpu_gpll0_clk_src = {
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52004,
 		.enable_mask = BIT(15),
@@ -1632,13 +1633,14 @@ static struct clk_branch gcc_gpu_gpll0_clk_src = {
 };
 
 static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52004,
 		.enable_mask = BIT(16),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_gpll0_div_clk_src",
 			.parent_hws = (const struct clk_hw *[]){
-				&gcc_gpu_gpll0_clk_src.clkr.hw },
+				&gpll0_out_even.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1729,6 +1731,7 @@ static struct clk_branch gcc_npu_cfg_ahb_clk = {
 };
 
 static struct clk_branch gcc_npu_gpll0_clk_src = {
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52004,
 		.enable_mask = BIT(18),
@@ -1744,13 +1747,14 @@ static struct clk_branch gcc_npu_gpll0_clk_src = {
 };
 
 static struct clk_branch gcc_npu_gpll0_div_clk_src = {
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x52004,
 		.enable_mask = BIT(19),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_npu_gpll0_div_clk_src",
 			.parent_hws = (const struct clk_hw *[]){
-				&gcc_npu_gpll0_clk_src.clkr.hw },
+				&gpll0_out_even.clkr.hw },
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
-- 
2.26.1


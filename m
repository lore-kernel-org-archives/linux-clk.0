Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEA8C41603
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF247613FD
	for <linux-clk@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242898AbhDEWsP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Apr 2021 18:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242891AbhDEWsN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:48:13 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A67C061797
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:48:05 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id o126so19731871lfa.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N9jP1HbxvOEYKDETWz122ME/zZrHyGt+qqgjkSKdZWA=;
        b=dRwSPioVqwQZNY8bx9yuwAY6QPsrbKIjwYOitx6V3U6bx4ug40OkHPHOLoFUm0wzKu
         9WvypAH9OeAaQjjKHsM7IgiPUP4mz4nHkUMVZnebG+ul9B8TeUz+cQq/ykHA1RBPaHJA
         bqoRaDNMdlhgvgI2Ze7q64pZF8ZED2FywfLmKpm0Pmnw/mDjalCTmNf+7si4gO4a8qzA
         uo76WeLAZN2h3jTOqPjdKnYWhnOBlWJC7FzfZu8SE0K38e4JXrqi0IHEb5Q/JIrfxw3F
         /5sTWYqqMqy+qk8+ibSYQq0PcYjoQ8lGCJ89yjd0565fU30NHx6V0xkxuRGoU1YpjTqF
         P8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N9jP1HbxvOEYKDETWz122ME/zZrHyGt+qqgjkSKdZWA=;
        b=Aczmn0QZBJX4xJKuQAbgqUb37BvbqRybC5Y5WalpKsyB1RwyaFaPeCwMrH+20j3AhW
         fHJXUJzIg9uRlqfSAW/edCUMn0hsY4yxy4BHNhjlqiB/G5gF7F67BI3h2HTGJ6iD4Pdx
         Ei3CavTVgVT9yE3QyP2TSzYSgvZmQstcsATAbRaDtq3Qia+yHn5jy6UuvRbb77IOlW8e
         FPoiLLj7H9cf2c6gR/ZxMP7dOfMCmcixTpDfsgNBoXTa+pIf1HXuKFGa3QdgNginQf0+
         ehYB77k7DE4qf13sF1yEeLaEduBmy0FzKygUp9fsIIk9viAduts1v5+VTfkbua7cHYJQ
         C1eg==
X-Gm-Message-State: AOAM532yB9PC/Oy9pvA+FgYfgEP3aI88DnGhOPNbqFYBAQ+Mt+ed0RDR
        969WvNyijEFQSISIe7I8xSOh5g==
X-Google-Smtp-Source: ABdhPJwkwS+CXlP0VgBzfAPW6EnKs7NZOfwy8NG8QVllkPxy+SkYV/CifXEl6LUmj4PVOKjbGRQnig==
X-Received: by 2002:a05:6512:ce:: with SMTP id c14mr19155360lfp.64.1617662884400;
        Mon, 05 Apr 2021 15:48:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:48:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 27/33] clk: qcom: videocc-sm8150: use parent_hws where possible
Date:   Tue,  6 Apr 2021 01:47:37 +0300
Message-Id: <20210405224743.590029-28-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch to using parent_hws instead of parent_data when parents are
defined in this driver and so accessible using clk_hw.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8150.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
index 85b0bbc2b151..1afdbe4a249d 100644
--- a/drivers/clk/qcom/videocc-sm8150.c
+++ b/drivers/clk/qcom/videocc-sm8150.c
@@ -99,8 +99,8 @@ static struct clk_branch video_cc_iris_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_iris_ahb_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_iris_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_iris_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -117,8 +117,8 @@ static struct clk_branch video_cc_mvs0_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_mvs0_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_iris_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_iris_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -135,8 +135,8 @@ static struct clk_branch video_cc_mvs1_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_mvs1_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_iris_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_iris_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -153,8 +153,8 @@ static struct clk_branch video_cc_mvsc_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_mvsc_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_iris_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_iris_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2


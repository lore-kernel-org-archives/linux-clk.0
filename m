Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54ECAC43217
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 00:55:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238692AbhLOAzD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 19:55:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238681AbhLOAzD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 19:55:03 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9A2C06173E
        for <linux-clk@vger.kernel.org>; Tue, 14 Dec 2021 16:55:02 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id l7so30910797lja.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Dec 2021 16:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0qxzUI1bMJ1leNljdsV9Ai6m1pYm9LuHUA4SWG9Ci20=;
        b=iFclhMpIm0CCcWzdUZgfH9U5r9f2uaHZ9PjfzA28N7EBQC231wbB/CZX/3+2GvnLvL
         aDpZQZ+AT2RmblDo4wVlvin0Pyp9a5VKntyarM1OWzEwtVWwrAf2R2WEV/UmmmqTbI83
         ZEVQ6bwHhuzBmU4r9WO8xjv0bemLMFo4p6b+4kyDVEsqodMkBhYTnTZEBkkXFKhJXYt3
         NPexGyiTaRAXjWAQ2RfJnr4XmppL940F/Rra3cbBr1RJRigA6dMvJk4SsuF/niOKHCYD
         R7SDkejPGsZXrWs5MM4M6DNGbZK2cW8oLtDG7w/4B9jzBuiIWYgK29t7Oz1P24+xE6Sf
         7lSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0qxzUI1bMJ1leNljdsV9Ai6m1pYm9LuHUA4SWG9Ci20=;
        b=KVyEiQK1MbinVnRnQ9cMhQD3sOoWjdBAJEW85Ji1hnPo0sYiUeUd8+i7SI/amGMKg/
         h0gQ1m02BArbFKv8lvlTjY9gmY5BPVR95r54XB6CyQ/ppgX0F3lZhHJBwXmldrjbk479
         jYo4guLP6mg3seujotth/dulcoBMA2m3CkzlooZkyqGrWP0xSd4hwHx10O3YZUD/itYd
         eKoq/eT3nTtMvRPvxU86lNulJqQYEEFwlHmhgcO2JOukgdl+gKY+3CInkEAwa36hnQ5h
         7SkLaTBfVHiaZ8frVkoNcL/HP/rHITJiQN0Wtb1sR1LTz3eXzOTci0qhby9tiUl1g2uy
         8Agw==
X-Gm-Message-State: AOAM533GPDN7mULmNT+kunqUwyFJByULDNESiuLNgcimLiMWqDh9ruMJ
        QyQ7zIEe0QQy6yL69Iu5tIdy8g==
X-Google-Smtp-Source: ABdhPJyc3X+DrcbAGBF7RZF110Sn0FFLLg4CEgyCMAN+uKn5KYcggC9w480EmjdQ9c20ZAFNHC9zLA==
X-Received: by 2002:a2e:b528:: with SMTP id z8mr8044791ljm.178.1639529701219;
        Tue, 14 Dec 2021 16:55:01 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id b12sm53022lfb.146.2021.12.14.16.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:55:00 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 11/15] clk: qcom: videocc-sc7180: use parent_hws instead of parent_data
Date:   Wed, 15 Dec 2021 03:54:19 +0300
Message-Id: <20211215005423.2114261-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If all parents are specified as clk_hw, we can use parent_hws instead of
parent_data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/videocc-sc7180.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index ed57bbb19f88..5b9b54f616b8 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -99,8 +99,8 @@ static struct clk_branch video_cc_vcodec0_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_vcodec0_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_venus_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -143,8 +143,8 @@ static struct clk_branch video_cc_venus_ctl_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_cc_venus_ctl_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &video_cc_venus_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]){
+				&video_cc_venus_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.33.0


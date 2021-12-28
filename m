Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDFDC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 28 Dec 2021 04:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234791AbhL1Ey3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Dec 2021 23:54:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234797AbhL1Ey3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 23:54:29 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938A1C061757
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 20:54:28 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id h21so16887434ljh.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 20:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dRlw5VRanssi4XlT/sJNwgpytCpilC/6xz6TuoSRXJE=;
        b=iMos9y7XCDD6lHpyMFqIg7bN9Nlkd48KpU8Gk4CE4RUrTnovMBNVLzNltm+T+e9Dq1
         8hG2Q/CB0hjXlWuiR/TLaQshyuj7HP9T5UWaz0X0QYrfEj9gQ2I38qsTt5g8Hh+LB95A
         EJkV/CaQtsb7q7YmXnTvLaC2yS5mt1uHgzvOAMyvIrZCkZnangF/JIjA2fHv3+SK5Cnt
         63zCComZrmcYtftByIW3B8UJBbpzZ1Gq7eVSDTC9dUka0FJpApFidyrfQAhZN++QS6d2
         WOkkUvgmZ3WdER8SwSGjYewhvU+PFI4tkhffHzbe8U1prHNsaQxSdn3H3zxrUPiFPkS1
         X9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dRlw5VRanssi4XlT/sJNwgpytCpilC/6xz6TuoSRXJE=;
        b=DIIk/thmoru5IlDZPokB60us+V9JY7ZDhcbwc59uoK11K/8UTvGM8vIFrKaiZ43LAd
         AXZrPjLeGa4z0m5vp6fbgKLGHEyoWZtAmnOpaK4YxT2no5bGV+l4WYyLmFBciKKxxqnO
         7AF8k4+VTb3tflUREpsgn3wQ3zgX/TCSQrQBwFZtZTXGdEsQKZ3NigWRR1lTIFSWQ75T
         nCHdZXMQXbvanP6WZgkQ+qXpl4ELbogOOtXVYu6rBe3ybi9Pc6sziGmQy5HAmHmUtORJ
         yZ55UTJNP5yAsk/Wd20KVlHd4s29Usm+AIcq2GxU9bQ/M5vNbEWRkoH73Zpdcr+izj5+
         pgcQ==
X-Gm-Message-State: AOAM531XJcab3e2CDC6OodcCBTuNynyOExeiTyBoBZ4RGnnG1xClxn7E
        nYYbgIgWqbgJgmwVAcjEf1F8Jw==
X-Google-Smtp-Source: ABdhPJwW9OCOfhI9bA0kxMfvq0YZuq8j+Q+KPY517P8mnIWNmsDe/pFSvkxr9lBrZb2eqdeSZXC55A==
X-Received: by 2002:a2e:5354:: with SMTP id t20mr16587931ljd.263.1640667266810;
        Mon, 27 Dec 2021 20:54:26 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:26 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 11/16] clk: qcom: videocc-sc7180: use parent_hws instead of parent_data
Date:   Tue, 28 Dec 2021 07:54:10 +0300
Message-Id: <20211228045415.20543-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
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
2.34.1


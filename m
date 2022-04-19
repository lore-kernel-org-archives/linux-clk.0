Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73EAC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 19 Apr 2022 23:55:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358539AbiDSX5t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Apr 2022 19:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358517AbiDSX5f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Apr 2022 19:57:35 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63842E23
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 16:54:50 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g19so9301lfv.2
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 16:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bvNMSN3pjje8DO8VKt+U/tOaBPxKcUXo89mN7XSq4VA=;
        b=nWz2J/9FyHAu9c4LAOFJi56mLrG3hncYMeMG7WQmK9BCcR48yGQnhsD7fmJsGOSF2+
         Z/91Q1S5n+B9GILgoq1zRZZkO2ZNEolOvDS1XWOx5nPGoYaGpHZgppET/Mt5pjLExr1V
         h+CvRplZpiGqBAtFiXPT4WhhBcDCj/PwbKpMb25AwQhBIvYhvB7GhawJEATPnszn0pWu
         DmtB7PI5umXOsFnGgvTAtPoQ5IPBqwdR2S1FwsNag9INcST/lgFInL/xDqzdfdRBWlCF
         zqRs6hVI9E7U/YQakjfz93ExlevzIU/mQb6SGe8gVTsHWUnDPNQxB5YymcgcrvFKCMvq
         VwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bvNMSN3pjje8DO8VKt+U/tOaBPxKcUXo89mN7XSq4VA=;
        b=qtmKpaT1lZSHf54DWsjCHWmbcoHAXpPzADTmzyI2yk73sh6OFzfU1cBXOHfdD+YJae
         jJhJd8NFx6tCQINGTaXo7nxrzSzkbF8IXBr8LrRoSStLxK80iP90BYU5ZVsBkdbWaVr1
         M+BpYhK/KP+VLSIqaTY5X/Z9tlFRkEY1xQ7BKx0dWXkpE3aPZwjYBZI8yhsJvk8gV2tG
         lOA6ey/gfO3tHwck7m+053kyJJvZnBxxVmQXh9y1SrCZOuYEuy1SkwW/61KMuyd/fW5z
         3K3T4kFGoYmU/LhZLXShnnuZhwYwuakjtP0J8g0sLA7SMAzp3Z3IRzlXwbZ7i/CF5SZm
         7t3Q==
X-Gm-Message-State: AOAM533+te+m4oyBI4FZatCWir9ny1XkcssqNBVZLPQPV+RkLfpyr/w+
        5pBFWFWnBZxJhwbMzRx2HTH80Q==
X-Google-Smtp-Source: ABdhPJx7XT4j1TOlMM92aT+5eWOjZGo3AhiUgM2QzsVkznUoE4H9dn+nAStfZOGFuIvdIa0nYUngsA==
X-Received: by 2002:a05:6512:e87:b0:44a:5117:2b2b with SMTP id bi7-20020a0565120e8700b0044a51172b2bmr13043804lfb.275.1650412488676;
        Tue, 19 Apr 2022 16:54:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v9-20020a2e7a09000000b0024dbdd8e297sm647725ljc.19.2022.04.19.16.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 16:54:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        freedreno@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] clk: qcom: clk-rcg2: fix gfx3d frequency calculation
Date:   Wed, 20 Apr 2022 02:54:47 +0300
Message-Id: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Since the commit 948fb0969eae ("clk: Always clamp the rounded rate"),
the clk_core_determine_round_nolock() would clamp the requested rate
between min and max rates from the rate request. Normally these fields
would be filled by clk_core_get_boundaries() called from
clk_round_rate().

However clk_gfx3d_determine_rate() uses a manually crafted rate request,
which did not have these fields filled. Thus the requested frequency
would be clamped to 0, resulting in weird frequencies being requested
from the hardware.

Fix this by filling min_rate and max_rate to the values valid for the
respective PLLs (0 and ULONG_MAX).

Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rcg2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index f675fd969c4d..e9c357309fd9 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -818,7 +818,7 @@ EXPORT_SYMBOL_GPL(clk_pixel_ops);
 static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 				    struct clk_rate_request *req)
 {
-	struct clk_rate_request parent_req = { };
+	struct clk_rate_request parent_req = { .min_rate = 0, .max_rate = ULONG_MAX };
 	struct clk_rcg2_gfx3d *cgfx = to_clk_rcg2_gfx3d(hw);
 	struct clk_hw *xo, *p0, *p1, *p2;
 	unsigned long p0_rate;
-- 
2.35.1


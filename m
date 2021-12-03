Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BEAC433FE
	for <linux-clk@archiver.kernel.org>; Fri,  3 Dec 2021 03:53:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378399AbhLCD4a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Dec 2021 22:56:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344703AbhLCD43 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Dec 2021 22:56:29 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8A4C06174A
        for <linux-clk@vger.kernel.org>; Thu,  2 Dec 2021 19:53:06 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id bk14so3321735oib.7
        for <linux-clk@vger.kernel.org>; Thu, 02 Dec 2021 19:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dpqixTWiVGWiYabOu0I3C2VDh8fb1TU9B4bmnLjn4lA=;
        b=o+BhrVJxDAkpC90IBFmsSrYrMll1yp0WFYoS+zHO4hhkitrPYWteyZabjTlib+Xtw8
         MjsiSOBbOGYsEKyUJmbn31CUXjTSq+LkvH7r7dDsg/gr2VAf47lRM6lgWXS4SXWbv0D8
         dLtLQnwrIBANVRZ8AkNGgb0V0utqz+EwdS4BXxkTxGVqfth7ZWJMgQxNQfgED7o9zXIM
         2RwS3Nt6HhbTNxWygP9aHgR9HhHOfznsmAlssKGYdob2KFZ7bZ/M4th//sLKiloMZGk2
         5Vdg6OTF47JDVruu8y0r0prDmH5Mkl7q9PCd1a72aXEZQixVCz1o4U6QP1DpCeYOspaw
         4/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dpqixTWiVGWiYabOu0I3C2VDh8fb1TU9B4bmnLjn4lA=;
        b=DlAVBR9dqeAIKJZ70mX9tV08M4phQd6sDiLlYvbfNS+giS4Z/NWPISDUxAW9oR7Mcf
         Ekhuh/k39E6FfJa8z80EvW9LLvudIXeeWKAtZYM/63t8uRsgSCmPx4QicAOGsmM5b9nu
         mW23aaOAmTGU4654lEuI0IS+9fxsA0Szu4GD+/ng7GAUd7aU9Q7E2qOSaQ6gdL6xQ9OB
         8WnBEyb66Y+nMZTWyCpDf2mAL5kyT9p6r4uuA+MeblXpKJpP0bXvuYQUfmI+fqvzDq0Z
         /iQXBd0b2xKr8zsMhDkT1up08vmp7J4eM2X8jQAUBmyQCwvlmlLlbiyUx/5RoNry3r7i
         V6HQ==
X-Gm-Message-State: AOAM532UOuPc9QURBqFIGnv3W1h1kruRqJHPG4AvRWkYuqp/ztgbZusW
        /Cine591/YItjdVAa5JxJBzCpw==
X-Google-Smtp-Source: ABdhPJxkCYrayZNm047DAM5zj3R3twVzowyhkuuyL1K2DLsOqgr76f47R/XUYjnLdY6TAJxn+sZgEQ==
X-Received: by 2002:a05:6808:238e:: with SMTP id bp14mr7832547oib.130.1638503586042;
        Thu, 02 Dec 2021 19:53:06 -0800 (PST)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm418006otr.23.2021.12.02.19.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 19:53:05 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dmitry.baryshkov@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: sm8250-dispcc: Flag shared RCGs as assumed enable
Date:   Thu,  2 Dec 2021 19:54:36 -0800
Message-Id: <20211203035436.3505743-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203035436.3505743-1-bjorn.andersson@linaro.org>
References: <20211203035436.3505743-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The state of the shared RCGs found in the SM8250 dispcc can't reliably
be queried and hence doesn't implement the is_enabled() callback.

Mark the shared RCGs as CLK_ASSUME_ENABLED_WHEN_UNUSED, to ensure that
clk_disable_unused() will issue a disable and park the RCGs before it
turns off the parent PLLs - which will lock up these RCGs in any system
with continuous splash enabled.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 2842e2b6f4a4..f7c7c829553e 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -218,7 +218,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 		.name = "disp_cc_mdss_ahb_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_ASSUME_ENABLED_WHEN_UNUSED,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -550,7 +550,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.name = "disp_cc_mdss_mdp_clk_src",
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_ASSUME_ENABLED_WHEN_UNUSED,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -602,7 +602,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 		.name = "disp_cc_mdss_rot_clk_src",
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_ASSUME_ENABLED_WHEN_UNUSED,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
-- 
2.33.1


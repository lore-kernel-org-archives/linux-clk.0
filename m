Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF8FC61DA4
	for <linux-clk@archiver.kernel.org>; Wed, 15 Mar 2023 13:24:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232186AbjCONX6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Mar 2023 09:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbjCONXp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Mar 2023 09:23:45 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC74A3B64
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 06:23:42 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id r11so23837694edd.5
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678886621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6Q5mnwZerUqt0rPDmFb5WgXIlQQvBuhlqFXmv7x/E8=;
        b=v8CeUBfci+2vyzQEs4Rv2vSs3xgOflEwBGX290bxPufp8u8LNIOMlkwcnVzAd/JHTS
         fKtlg1yp861KIf8/L1MJwZILV+rQXo66j3Yxt9GK2ezkucnxv+S+0i/EnOuoYDUhJOV3
         B6JpC0fqm3lrN2erdD+046lrlomd/a16+nW2JchX0Jb24U9w1cd/ZJNtpLSUYRhQsIlu
         j0VP1QxVb20iygWUI9vh2kc1KeznBSrLdSCryvv3cS+hgbtWk5/gbaQj/AD3vNkuqYPU
         A/IWUl2UBUfC+Ob8tJcCN4OaDEuUsJbZqVAv+jnL6QKj1HEuwp2mjGfX7wCJLSZMrfzW
         EfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678886621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6Q5mnwZerUqt0rPDmFb5WgXIlQQvBuhlqFXmv7x/E8=;
        b=2gU9fiT8yqZz7kob6Ddh11mdTbh2WK+4dNWSVyI3GlsouEZzbRZSzCvgzsNfx0VsaK
         vNT3/KrjWsG9oKP/01d29FQLy0sTE7V8Cl2Xv6WWwGAUkqzguVbxiA1zvd1HbJJIKJ/+
         wxKEqY3R2zCdUv3gDYCvCAwpuDu435qiN93YPolTaPOE/rtuekZpt+6qgRsYNsJUFVve
         tw+ZdjpSkESSApKWtOevgNAlO5Hgg4t4b/2H0hAcwPeIqy2KMr0Eq8kypoxWK/qWYU5I
         cwi0IzfaxEM+prIplkDty6doCOkcJQq+DdIJTWIkcGnx/l15+ff3JznnsFPwpubGHFMq
         dqxg==
X-Gm-Message-State: AO0yUKUy4gvL8Fhp9rCFZaj5KDiS2wCWSLFZ2p4mdwwESWUw8y8GkAnC
        rkj8bvFraH4AmpVqnvHitwD3aA==
X-Google-Smtp-Source: AK7set80lwILGeMEjE90/hXf2KxCex24k3hIxwK6a87YWNsiAs3RYf8jzg8Y/7RnlkbsWjydDWh7+g==
X-Received: by 2002:a17:907:7f8e:b0:92f:1418:27f0 with SMTP id qk14-20020a1709077f8e00b0092f141827f0mr2127459ejc.34.1678886620990;
        Wed, 15 Mar 2023 06:23:40 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id pj18-20020a170906d79200b008b133f9b33dsm2497365ejb.169.2023.03.15.06.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 06:23:40 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [RFC PATCH 4/5] clk: qcom: Add sync state callback to all SC8280XP providers
Date:   Wed, 15 Mar 2023 15:23:29 +0200
Message-Id: <20230315132330.450877-5-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315132330.450877-1-abel.vesa@linaro.org>
References: <20230315132330.450877-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now that we have support for sync state delayed disabling of unused
power domains and a provided generic gdsc sync state callback, add it to
all the providers related to the SC8280XP platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/dispcc-sc8280xp.c | 1 +
 drivers/clk/qcom/gcc-sc8280xp.c    | 1 +
 drivers/clk/qcom/gpucc-sc8280xp.c  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index 167470beb369..f97bda6c7e3a 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -3199,6 +3199,7 @@ static struct platform_driver disp_cc_sc8280xp_driver = {
 	.driver = {
 		.name = "disp_cc-sc8280xp",
 		.of_match_table = disp_cc_sc8280xp_match_table,
+		.sync_state = gdsc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index b3198784e1c3..222bca0f8093 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -7441,6 +7441,7 @@ static struct platform_driver gcc_sc8280xp_driver = {
 	.driver = {
 		.name = "gcc-sc8280xp",
 		.of_match_table = gcc_sc8280xp_match_table,
+		.sync_state = gdsc_sync_state,
 	},
 };
 
diff --git a/drivers/clk/qcom/gpucc-sc8280xp.c b/drivers/clk/qcom/gpucc-sc8280xp.c
index ea1e9505c335..a9f0e7bbacce 100644
--- a/drivers/clk/qcom/gpucc-sc8280xp.c
+++ b/drivers/clk/qcom/gpucc-sc8280xp.c
@@ -453,6 +453,7 @@ static struct platform_driver gpu_cc_sc8280xp_driver = {
 	.driver = {
 		.name = "gpu_cc-sc8280xp",
 		.of_match_table = gpu_cc_sc8280xp_match_table,
+		.sync_state = gdsc_sync_state,
 	},
 };
 module_platform_driver(gpu_cc_sc8280xp_driver);
-- 
2.34.1


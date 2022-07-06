Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E288ACCA47F
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jul 2022 15:04:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbiGFPEn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jul 2022 11:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232688AbiGFPEm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 11:04:42 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6862415717
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 08:04:41 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id f2so17110286wrr.6
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zUHjRI1jr+Yrh9dUueZjZWr58/iaqkxDRzBkA9rclyI=;
        b=Yl8J/2mhUuzM78REsuhuyap1UbHG6jdWDrIww75VUghGmOO1FjKfKNKXB/9Jp/9baS
         XXISx1pqBW+IX9dbVVg4tYE1JTNlP7PEE0HUQN7dN7emEZchaX/5dz/gcvFy9Px1w/Jf
         ofxWJej6Yn+VNo7jevmxhUvjmrWPZAX7Eayn/M9MNecMAKCFbcyPP0bWYTswl/wIZuMz
         oaAb+dLxOjW/phWNhUD5/2D0SqTFvt7/S3Q9ym15HCDID55+fCYiHs+sMyKjeHliWxD6
         DghaBfeRDY8lfxK+W6f72lWjdn6uZuGHNH16kWf0nZU4ubnNsRFto1uxHN9N762AOiLs
         cqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zUHjRI1jr+Yrh9dUueZjZWr58/iaqkxDRzBkA9rclyI=;
        b=UD10scRJ7mqzkN+c0PJcWUeMucmr3w7pJrE+LCaMbLl5RmBtB4sd4KyCwbmvlvCuKJ
         Th2q02FKl3G+QZSMAte6Ixcz5PPgqyUJt+NUawMsN4EXwzg2obWjbemYAExhxuBopa9K
         QdTNG5ls3WqFuoMCge+mm1MOX/wAcfG/AgWeEAh31Ns7KzlIJag1R31UtZtcgFNWE3c8
         Vth8c3ggwElDudJazY9p68Is49S/bBeI2kp3rvNm5iE11eTGitvYtows9wrby+DSNGVr
         P1AcRLGykz8UrZRfrufqISjc25dKUXI/9+Yj+Qhwqq0lzyyDb2gYhIairIliru5+LabU
         UE7w==
X-Gm-Message-State: AJIora+UUuD0NoTINbaT1cuaewH8YMHUFHCF/B/flIDcnSyos8iHpYlt
        IbYdUamI+wARmAH8j3044ZTh4A==
X-Google-Smtp-Source: AGRyM1sTX0EBykUUNSxnDmNCn71gGdN1WibbHuKtCzZndxVWdMyf1gXg/h9NxH+czj+cg9UVEO/qCQ==
X-Received: by 2002:a05:6000:1446:b0:21d:2245:ab65 with SMTP id v6-20020a056000144600b0021d2245ab65mr37797391wrx.315.1657119879727;
        Wed, 06 Jul 2022 08:04:39 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v7-20020a1cac07000000b003a04e6410e0sm22443420wme.33.2022.07.06.08.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 08:04:39 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: [RFC 2/2] clk: qcom: sdm845: Add clk_sync_state_disable_unused as sync_state
Date:   Wed,  6 Jul 2022 18:04:11 +0300
Message-Id: <20220706150411.708213-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220706150411.708213-1-abel.vesa@linaro.org>
References: <20220706150411.708213-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

By adding the newly added clk_sync_state_disable_unused as sync_state
callback to all sdm845 clock providers, we make sure that no clock
belonging to these providers gets disabled on clk_disable_unused,
but rather they are disabled on sync_state, when it is safe, since
all the consumers build as modules have their chance of enabling
their own clocks.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/camcc-sdm845.c  | 1 +
 drivers/clk/qcom/dispcc-sdm845.c | 1 +
 drivers/clk/qcom/gcc-sdm845.c    | 1 +
 drivers/clk/qcom/gpucc-sdm845.c  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index 27d44188a7ab..e5aeb832e47b 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -1743,6 +1743,7 @@ static struct platform_driver cam_cc_sdm845_driver = {
 	.driver	= {
 		.name = "sdm845-camcc",
 		.of_match_table = cam_cc_sdm845_match_table,
+		.sync_state = clk_sync_state_disable_unused,
 	},
 };
 
diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index 735adfefc379..1810d58bad09 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -869,6 +869,7 @@ static struct platform_driver disp_cc_sdm845_driver = {
 	.driver		= {
 		.name	= "disp_cc-sdm845",
 		.of_match_table = disp_cc_sdm845_match_table,
+		.sync_state = clk_sync_state_disable_unused,
 	},
 };
 
diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 58aa3ec9a7fc..5db75d5ba584 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3624,6 +3624,7 @@ static struct platform_driver gcc_sdm845_driver = {
 	.driver		= {
 		.name	= "gcc-sdm845",
 		.of_match_table = gcc_sdm845_match_table,
+		.sync_state = clk_sync_state_disable_unused,
 	},
 };
 
diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 110b54401bc6..622a54a67d32 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -205,6 +205,7 @@ static struct platform_driver gpu_cc_sdm845_driver = {
 	.driver = {
 		.name = "sdm845-gpucc",
 		.of_match_table = gpu_cc_sdm845_match_table,
+		.sync_state = clk_sync_state_disable_unused,
 	},
 };
 
-- 
2.34.3


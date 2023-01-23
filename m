Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5642DC05027
	for <linux-clk@archiver.kernel.org>; Mon, 23 Jan 2023 10:33:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbjAWKdo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Jan 2023 05:33:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbjAWKdo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Jan 2023 05:33:44 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65FE318157
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 02:33:42 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso8176562wms.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 02:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6MMnzFkFz/mA+K9jC0tf0KwwFVsDs5pFYEiKF65a6jE=;
        b=gLHLn+zgy5+aBJbyNbrlB1SUOwNJSWeV6qW3BCQVK/2aFAbyM35TO0xIVbnosTkodS
         VEJ5OeKl6RdPptAgoOPLRXAz38pZ1wrlW825jhk0abixWK5DmFgeW2NCmPFP3gq7gc+0
         TfpUseSfz9A5qSnE+3ylgvwG5jsXvxmIXcDcv+HxKQUj8XcBfbgleOHUKJksQgbphkDG
         wsnlVTwVYk36tr4sg9OTmCLZZi8PEmW/9MslnraY/MNM5QJGRxR84roNrfKlWrdFR63F
         KMA7Yz6qG7VGksOxVcROYiQ3qG7y8bdiMEb/Xfw33rKgE1hvTDg0IjXEOI84eaSShlD0
         dFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MMnzFkFz/mA+K9jC0tf0KwwFVsDs5pFYEiKF65a6jE=;
        b=EkDofyVCWz9K++vfIB9iDm3kR1gFSEA68/qti1l8uQQU6eNYQmJkcdEP09E9ytVkNs
         anLp4qRU5yE0aipYSQ1OW7WsXAiWp3XDVutngo79+IXmaeGjKvoUMrPSXHc8fNXKkfVb
         iMWMd0sizhBc0VO6Hwp1rGBamcmxtsnUQyVG9D3YVkOQoIWQII9OolFCv1fdhQj8Kas9
         swrJZgmz5e7q3ZfFi7drAmHPwpkbWeun2U8FHT2iqfU/CGhecnljauYzAxUoj+Efs45A
         BXy46nMJFHAm1/oI0KqNuKrnS1fqVMgES1jyfUyCdzt0IQ2UAdZYk0wb7H2d3VL/Xgrt
         o38g==
X-Gm-Message-State: AFqh2kqkSNU63zUPus972jkscp+6YsRQwDq/GrUVqFHNICy1jHSTV02V
        Gs+XeK7NkIns1u2NBrSIeUagkw==
X-Google-Smtp-Source: AMrXdXuDYCYMGkqt/MEynGbDbtb1dGFpk9V3tpifPrVph+TaLbutl5Zu1/1b19yME/c2FugXPQbxRw==
X-Received: by 2002:a05:600c:4e4b:b0:3db:2e6d:9f79 with SMTP id e11-20020a05600c4e4b00b003db2e6d9f79mr12081589wmq.39.1674470020959;
        Mon, 23 Jan 2023 02:33:40 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:30ed:611a:2bcc:ca68])
        by smtp.gmail.com with ESMTPSA id p19-20020a1c5453000000b003db09692364sm10222634wmi.11.2023.01.23.02.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:33:40 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: qcom: gcc-sa8775p: remove unused variables
Date:   Mon, 23 Jan 2023 11:33:38 +0100
Message-Id: <20230123103338.230320-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are four struct definitions in the driver that aren't used so
remove them.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: ed432b1ed00a ("clk: qcom: add the GCC driver for sa8775p")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/clk/qcom/gcc-sa8775p.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index b5da7e0b2eaf..d6e78de2c66f 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -310,16 +310,6 @@ static const struct clk_parent_data gcc_parent_data_9[] = {
 	{ .index = DT_BI_TCXO },
 };
 
-static const struct parent_map gcc_parent_map_10[] = {
-	{ P_PCIE_0_PIPE_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_10[] = {
-	{ .index = DT_PCIE_0_PIPE_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
 static const struct parent_map gcc_parent_map_11[] = {
 	{ P_PCIE_PHY_AUX_CLK, 1 },
 	{ P_BI_TCXO, 2 },
@@ -330,16 +320,6 @@ static const struct clk_parent_data gcc_parent_data_11[] = {
 	{ .index = DT_BI_TCXO },
 };
 
-static const struct parent_map gcc_parent_map_12[] = {
-	{ P_PCIE_1_PIPE_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_12[] = {
-	{ .index = DT_PCIE_1_PIPE_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
 static const struct parent_map gcc_parent_map_13[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GCC_GPLL0_OUT_MAIN, 1 },
-- 
2.37.2


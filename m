Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE39C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Oct 2022 14:08:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiJMOIK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Oct 2022 10:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbiJMOII (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Oct 2022 10:08:08 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2833B9BF
        for <linux-clk@vger.kernel.org>; Thu, 13 Oct 2022 07:07:56 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id g1so2634473lfu.12
        for <linux-clk@vger.kernel.org>; Thu, 13 Oct 2022 07:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a/9nHumm6XpsQ10fpRG0LtkxDofAzVRYhYfPVNzOqa4=;
        b=ErZQy9oJV5S3vGZ/tlAlj02GD9dlkHuaCbV6gTt/8H+LaO0o7HAQ29hUM+M36bvFC5
         3HuUBj/bppoNadjUFnkZ6fNNCL/F5ZbdkPyMT7K8TznUyyfaEhX8B4SXOZ7VgPwsoTYo
         GYjUt7UctrVX893Ndq9ATcjln47ISz3ZCCW6T71Lm1ypjRVJlV9rsGhCDq+zhNdbXVtz
         J2xA/c+hzEkG5CIAzYTeNcioxKm/qvEWUI0wyu4qNzHWXKx6twDbDFTy1NwOrG7cKGf6
         yPZCNIGK2Y3iiRlLG86sw9dIkW20lV1yMLKp+6T6OCCsoTDT72nZmLfq4iyEPBeLnKG0
         oO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/9nHumm6XpsQ10fpRG0LtkxDofAzVRYhYfPVNzOqa4=;
        b=yy6tJMLauUfdbTmf7PJg3A1TX/n7XDa7AG1NZXqNm+qjW9G6FIC4ku7iPcw1pn6+xT
         y2CrcJZFlhEVF3waaiaGYsdLqm8ZgXo9HMUyFtcB0tBUajMslfAgFICjUY5dMSRmtwsU
         c2hwjLlb8yztA3DS2mGj9Kr8sLf0SKCMxe8F41LGF5H8JqalL0isZ4VkAQzDh9D67QFp
         AzEIIqroAzsiroRotIFIL62vBvHkwNy9S3SpWGGPxhoVgyUJs0tDYbPQepIW5LNHHBGY
         fz/6Vud2krj145FAKF+avliS//NWL1UXaBVRpGXExOy/M7BR8P/WsFq10+nSTdtiWfC+
         aeaw==
X-Gm-Message-State: ACrzQf0QHoXUIfkW6MNCNazH/1YGYvpSwNsTd9Fa4HjrNm3bITCK9T1S
        dKLcsbau34mbT9e4QRqsTrd6CA==
X-Google-Smtp-Source: AMsMyM72miqV2jb9bZkj82ujgaSBinpvvzNQalv24ZxeOmhG5wGPs0sdTkeiG/smQ4tKZHydkrK3NQ==
X-Received: by 2002:ac2:4d46:0:b0:4a2:473f:1fb3 with SMTP id 6-20020ac24d46000000b004a2473f1fb3mr11588627lfp.408.1665670067779;
        Thu, 13 Oct 2022 07:07:47 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id u10-20020a05651220ca00b004a100c21eaesm416820lfr.97.2022.10.13.07.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 07:07:47 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] clk: qcom: gcc-msm8660: Drop hardcoded fixed board clocks
Date:   Thu, 13 Oct 2022 16:07:45 +0200
Message-Id: <20221013140745.7801-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These two clocks are now registered in the device tree as fixed clocks,
causing a regression in the driver as the clock already exists with
e.g. the name "pxo_board" as the MSM8660 GCC driver probes.

Fix this by just not hard-coding this anymore and everything works
like a charm.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: baecbda52933 ("ARM: dts: qcom: msm8660: fix node names for fixed clocks")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/clk/qcom/gcc-msm8660.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8660.c b/drivers/clk/qcom/gcc-msm8660.c
index 657e1154bb9b..a9eb6a9ac445 100644
--- a/drivers/clk/qcom/gcc-msm8660.c
+++ b/drivers/clk/qcom/gcc-msm8660.c
@@ -2767,17 +2767,6 @@ MODULE_DEVICE_TABLE(of, gcc_msm8660_match_table);
 
 static int gcc_msm8660_probe(struct platform_device *pdev)
 {
-	int ret;
-	struct device *dev = &pdev->dev;
-
-	ret = qcom_cc_register_board_clk(dev, "cxo_board", "cxo", 19200000);
-	if (ret)
-		return ret;
-
-	ret = qcom_cc_register_board_clk(dev, "pxo_board", "pxo", 27000000);
-	if (ret)
-		return ret;
-
 	return qcom_cc_probe(pdev, &gcc_msm8660_desc);
 }
 
-- 
2.34.1


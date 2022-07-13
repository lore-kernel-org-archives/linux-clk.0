Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB49C43334
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jul 2022 14:32:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236396AbiGMOcV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jul 2022 10:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236547AbiGMOcU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jul 2022 10:32:20 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D17937FA3
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 07:32:18 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id dn9so20179070ejc.7
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 07:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y0Ax0PdKtlmgzbmNbUhdLibkqTiXlSi4GkpYNg2JX4o=;
        b=bhIAzdm2Lk25zrx8rWtQxYw4bytPtsGCTma3ouKJDy/7t8d10zxSzPzBU7YT7y6ESl
         SvyXrn3ipOnWCcLZSw7FdJFIi05yKCQbBiiaGiA3YKk+Ajb7ZD7rmCh9RInO6LJrx91+
         23rmy9eZhM1BJleZZ0vBXMGbroTphk7SxXFUjss/bBbHQSwW6xXMswAQPOFJBn6VTwm8
         AkLc6D2VH0GOSV/N2EWaifCDu1MfS1eOBFUynvOdLz793srhlHVfYT0mkhqEAnU+IBtx
         c8vGg6fxbHfW++cGg+2BOdj7EQ0D3p0dXVBP6Cy8cG0kQzhp08I/CSas3N9TaOSBYC7B
         3PRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y0Ax0PdKtlmgzbmNbUhdLibkqTiXlSi4GkpYNg2JX4o=;
        b=2I52C4fiFFMDFG0XVUMJAxoft+fIt6AwVX4qJVYxrF4+9hg5K1C2MS+ZHkbS79ARku
         bxgmQHEwq4PISGq6/zI/lM0weGChYcuPuRuutK0RHhVDE6oX9BAmLzr7bQadbmvYRLEv
         k8oPJWftmP5/AplPoT1wjI0/qK6Ta/pj05Fmh8ojD7az0qtyy3K6SV4iZ912XeHtF8xX
         1uCUD1X4O/vJHFMK9dylBdX7rjj3DbUV/WKmCLZZdX83hRU2Va/tlXgJgQpuI+u5ItMV
         aDjXRYpQOOBqaKUBBQnOC48yAezab0LrwU6Z+kdzJzyia5oOekvM3nPLEFsjC8XNJGYm
         Hz/g==
X-Gm-Message-State: AJIora8BechVXwv/vq+H9MR9gn/6w1i0li2hcoqkFVyFyEkD9cP3zTFa
        1k2OvI4mTP/PHcYEIOO5SiXR7A==
X-Google-Smtp-Source: AGRyM1tNOcFC6J6ie9N0++h/j65gss5vtM22Su6a8LM5NN2uZQk4leASWHsI8kAvCVTfGMqZq5QJ0Q==
X-Received: by 2002:a17:907:7f24:b0:72b:8e8e:11e with SMTP id qf36-20020a1709077f2400b0072b8e8e011emr3590198ejc.429.1657722736681;
        Wed, 13 Jul 2022 07:32:16 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id o24-20020a170906769800b00726abf9a32bsm5034731ejm.138.2022.07.13.07.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 07:32:16 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH] clk: qcom: Drop mmcx gdsc supply for dispcc and videocc
Date:   Wed, 13 Jul 2022 17:32:00 +0300
Message-Id: <20220713143200.3686765-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Both dispcc and videocc use mmcx power domain now.
Lets drop the supply mmcx from every gdsc.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 266e5cf39a0f ("arm64: dts: qcom: sm8250: remove mmcx regulator")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c  | 1 -
 drivers/clk/qcom/videocc-sm8250.c | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 39b344ebb049..709076f0f9d7 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1138,7 +1138,6 @@ static struct gdsc mdss_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = HW_CTRL,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *disp_cc_sm8250_clocks[] = {
diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 8617454e4a77..f28f2cb051d7 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -277,7 +277,6 @@ static struct gdsc mvs0c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1c_gdsc = {
@@ -287,7 +286,6 @@ static struct gdsc mvs1c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs0_gdsc = {
@@ -297,7 +295,6 @@ static struct gdsc mvs0_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1_gdsc = {
@@ -307,7 +304,6 @@ static struct gdsc mvs1_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
-- 
2.34.3


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66609C07E99
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 01:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4334761468
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jul 2021 01:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbhGIBdu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jul 2021 21:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhGIBdi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jul 2021 21:33:38 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEDC8C061760
        for <linux-clk@vger.kernel.org>; Thu,  8 Jul 2021 18:30:54 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id z9so5394042ljm.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jul 2021 18:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OW6r9Ztak14Z94NLN85hpavnPWferFff+9qy6SUKk4g=;
        b=JC+1co9x/j+ssxCI+b1ed91TSXIs9SSXm9M04kPMKTty2jG2kt3NTohLWEdszrJp4d
         OWjYXBEqxswxPVRdX5oD8bvjermQG4xTqOsvtdmnRPRuUsqAxSGxhpxhzso8xFWxnasP
         Sqb7IkQzYU1yYKlpoCpIIaVj8QnuzQOtDu3+ABjl0d6FRKmhGHyk3IAJphS0InJR3csZ
         ZXrhWEXgym+/thivB1uxBvE97x5RoP3GK7VzLL3rZ3229L9G9zmcjqxFRfW5sDhUmmHz
         fbM5C10WwxdB2P3KgcQAPKrB9l9R8YMjwQtO69myRBsg5nKrbkPDS+7FzuyPRGmFmOnT
         9BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OW6r9Ztak14Z94NLN85hpavnPWferFff+9qy6SUKk4g=;
        b=ljQBlgP5iCBFPOJabEt1wyOhi6Kk92QvAqwp8kmRY/sErEg/KOzM3cUtZ29Gf6BgkZ
         ok3M6PWOttKJh5QndG5b+zzeeF/NaZW+LjAYDc0LsSBVS18IdGhpapzwjUyYMrTxWiba
         6GDGpoGsYzwEqOi7wq5NijDzbp5oCMPmFOORgZMFUsLwhT6ecDbolEeetexUbNfYO4CG
         uC+0WHl6X5Fu/49FVDOjNrsI4M7le8YDZM9ViYwRgbQrRs2DKSR8AYjTvx9BvyK8AWa+
         5MIftChD5tycwQsnnfSW4fYQa4b1OGLX1t+aOShEdkZzJ8tpLKozwvZ0CE91gqA5vawb
         vXBA==
X-Gm-Message-State: AOAM533VlxWNbT67JeRxjGO95LZmUn90DC7I/uQlBvhU1XdZ8KM+CbJp
        B9WtqD4z9zmLrtjEmjEPta1kaw==
X-Google-Smtp-Source: ABdhPJx6WXDWhJBZKd7QHCOxQwuu4v3iDZQQH1YLUxtdkVc6jIf8iadLgiyW6VaFmzWYsqE9wRVDQA==
X-Received: by 2002:a05:651c:1798:: with SMTP id bn24mr26944102ljb.72.1625794253278;
        Thu, 08 Jul 2021 18:30:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16sm405637ljj.113.2021.07.08.18.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 18:30:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] clk: qcom: videocc-sm8250: stop using mmcx regulator
Date:   Fri,  9 Jul 2021 04:30:43 +0300
Message-Id: <20210709013043.495233-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709013043.495233-1-dmitry.baryshkov@linaro.org>
References: <20210709013043.495233-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now as the common qcom clock controller code has been taught about power
domains, stop mentioning mmcx supply as a way to power up the clock
controller's gdscs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 7b435a1c2c4b..eedef85d90e5 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -276,7 +276,6 @@ static struct gdsc mvs0c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1c_gdsc = {
@@ -286,7 +285,6 @@ static struct gdsc mvs1c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs0_gdsc = {
@@ -296,7 +294,6 @@ static struct gdsc mvs0_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1_gdsc = {
@@ -306,7 +303,6 @@ static struct gdsc mvs1_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
-- 
2.30.2


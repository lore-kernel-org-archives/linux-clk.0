Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45ABC19F37
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 15:48:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9817661039
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 15:48:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235775AbhH2PtG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 11:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235711AbhH2PtD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Aug 2021 11:49:03 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59CEBC06129D
        for <linux-clk@vger.kernel.org>; Sun, 29 Aug 2021 08:48:07 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id h1so21243961ljl.9
        for <linux-clk@vger.kernel.org>; Sun, 29 Aug 2021 08:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4wYSAh/xvV+vEiBG5k8GPtuGmF+0aSivWDvc36iPGZQ=;
        b=oFewvCdk4g9bOv+QIjNC4zmNCCVpJ4x6cB+yCEq8i+MCSbhoAxNogz25a12Fa2ern7
         vSmqyT1gBDB8GsA1RXGMnoRls+STihl6OB+WdLz3pPPWXqvE02fx29faNqHZOAtRaihG
         aBzsLXRbMY+MKe1b7JYbV9xQF5V6xZPcTPLtpOjC263R9wFwAX9ZLl+iG3eemjAkGeS8
         fm5qziQqNdfLWxMMihIO1uxn2q8zcXRy+aPkUkKSfHyTZUHIt+L2UOMA0v0qZVPLSkQI
         nq3KCRtTjwKfw3PiNR8gDEPbnOMbSMnhsvsM4Pk4ctsiidrjjgjdiW/9/kzeyXOOWiE3
         naqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4wYSAh/xvV+vEiBG5k8GPtuGmF+0aSivWDvc36iPGZQ=;
        b=QY0oLgbs42Jnol7VEUsiTXLVcALQI/EqLYl4jwVdzgqXPuVVyVdCtpK8VMKfy9DkRp
         8MqHQawz1ciIdnHK/wqIxQOTZbgiCHI293t0cG51Ka9miuw6Tt6SoiXu+D39uMSakRmT
         19fxye8c2Fy18KnwCbiBu3xhaRaWaIbNxkT63dkVOGSQ92yYYc+sG6ejRhcBZIJPRJ/A
         /4xbXrd04VCCXFaCJO7MRRkeHZCiBnAAE/A3m1e8hjSkBlq9dH8T4LgU6OsJGGL0JW40
         My8ZRv9ofDh6cmLJcuGo5emiXgYGCddVuehZwegi81YUZjrEG0jN3+2DpD9hCXR/9TKr
         V8WQ==
X-Gm-Message-State: AOAM533BfjDQMdITw1yjLtrzIdjEu3Zrd8B4ksR3WFIUtq90b7JTLvB3
        u4VebyWH4HKrpMGFh2c8P+AY6w==
X-Google-Smtp-Source: ABdhPJxL8R3J3cKmcpKHszSldYyRqXI7vwDa9xFMUFMmsis2+4cgSK1YMVCfeLbNvBbhX3+2FDYC2Q==
X-Received: by 2002:a05:651c:2c6:: with SMTP id f6mr16922455ljo.7.1630252085602;
        Sun, 29 Aug 2021 08:48:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y5sm1481243ljd.38.2021.08.29.08.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 08:48:05 -0700 (PDT)
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
Subject: [PATCH v7 8/8] clk: qcom: videocc-sm8250: stop using mmcx regulator
Date:   Sun, 29 Aug 2021 18:47:57 +0300
Message-Id: <20210829154757.784699-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now as the common qcom clock controller code has been taught about power
domains, stop mentioning mmcx supply as a way to power up the clock
controller's gdscs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 4 ----
 1 file changed, 4 deletions(-)

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
2.33.0


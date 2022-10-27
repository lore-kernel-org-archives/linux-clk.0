Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C0FFA3749
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 12:35:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234608AbiJ0MfF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 08:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235682AbiJ0Me7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 08:34:59 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF202DA9C
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 05:34:57 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id f27so4161772eje.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcEVo6Z2/qPT9+/9Yb7zhm6sGgG565lVOHvBECCbpGE=;
        b=C49XxZlFTYcnQvGECbJgR6sqQErGlpnvl9MoLEC9Gi/QX6VcVT1N5vchIWUAL7S6vA
         I+uP4w6Pnz+a6sO8d087MKHOw04HxFb2+G6U20f6FAPKku//97yGCJUGrids71sGlP6K
         2NIGIhqjELSU7Es1gePzOlL7Tc86z+AcxxsbcCJOshwQKbZ6etPKox4b7ZXFz8MtsC+e
         SgvYkyOghP/pht4ZtoqBA0ymhCnaPmq+83+hyrrnLDBWIB7UV91WwfnEXS72lk84JO5O
         mTTbrFkySnOQw4nKJzZlYKFcg9hiWtr1wX+d6K8TQmw4AhSxqdyqK1JientWpHf0DAu9
         e1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcEVo6Z2/qPT9+/9Yb7zhm6sGgG565lVOHvBECCbpGE=;
        b=nTdu81BhX18weg5a2jZfLOwhfLzMOED5euBpNm4XEdMpaDQrzDPqJoiWrFN7+pacZA
         9PbkxUEelquO4nlX8AObM4dlaVNtw8EJuB/w+NJJrTqLsb73XIu4ZUKw6tPMggfM/DS8
         R43OsjeNOkBrp64nk3jrZSIkPUxCW8tD0vrvJQHbIKktaTwixHA7Vmau1JLlD0gH4Yee
         sjBLU2FYdOrQ2S3orBoqe5ddVauvGcwnUbiDXZbaR4VMN4eSA3Tuj4YV3k0IcefAXNMU
         Z7dJWzDP6/V6e23uADYFSVunp5F5I6f7GujVoRz6Fqe9ksGMZjGV6P7DeD6/SOJeV8+9
         s7Vw==
X-Gm-Message-State: ACrzQf3MivW52oXRmPUx092ILjmXvOCyBJj1GYd95DJZsLEvLhKTNPbM
        p/6dU/PwIw4HLmvAL0h25Yk7dw==
X-Google-Smtp-Source: AMsMyM5beE+Pn8wyGNJSTHZnazscU3w3YdlTA4dVfNrynbksR2HP0pOhjX6lRbKDF6Ng/EOsGEIcoA==
X-Received: by 2002:a17:906:846a:b0:7ad:84cd:f2a9 with SMTP id hx10-20020a170906846a00b007ad84cdf2a9mr5210255ejc.244.1666874095981;
        Thu, 27 Oct 2022 05:34:55 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id p22-20020aa7d316000000b00461c1804cdasm942868edq.3.2022.10.27.05.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 05:34:54 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        dmitry.baryshkov@linaro.org, Jonathan Marek <jonathan@marek.ca>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1 2/5] clk: qcom: dispcc-sm8250: Add RETAIN_FF_ENABLE flag for mdss_gdsc
Date:   Thu, 27 Oct 2022 14:34:29 +0200
Message-Id: <20221027123432.1818530-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027123432.1818530-1-robert.foss@linaro.org>
References: <20221027123432.1818530-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

All SoC supported by this driver supports the RETAIN_FF_ENABLE flag,
so it should be enabled here.

This feature enables registers to maintain their state after
dis/re-enabling the GDSC.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 180ac2726f7e..a7606580cf22 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1137,7 +1137,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL | RETAIN_FF_ENABLE,
 };
 
 static struct clk_regmap *disp_cc_sm8250_clocks[] = {
-- 
2.34.1


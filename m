Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C382AC001B3
	for <linux-clk@archiver.kernel.org>; Sun, 25 Jun 2023 20:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjFYU01 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Jun 2023 16:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbjFYU0X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Jun 2023 16:26:23 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540DA1BB
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:26:12 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso1302400e87.1
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724770; x=1690316770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfzmpqSD79x1GTEZoTIOiNSPZieOVWfrUJaJ2GmzOH4=;
        b=cJdy/4OhSwkUj1088CJn/xMbpEzqiyH1HAceqyqPlu9IMXUfIRh85iaU3X5XeKfaJ0
         aYdgAEvbWlsnGZSIwgiBE9tP4jSUZlxf+BkxUQmP8rGuZGZRSVS5rVggst3ZIXgsft6z
         HE1mmZRmp0BmmRVCjoHaVLifSR4tcsVFshd30MRs9Khpl3RkuGnqOEOHl5P5JsPgHR6a
         zrSldfT9jcFTsOtuHVhf1HF9EN72K0hY54R+f50vy1foDz7lrlrZioxXVHUsdeFlmg1F
         vPJgyBE7k90qOJ7qKW5g1lJmKs4r+ncm8YgAZL17qoaclmROhno0IDaXZJV0F5dXqkur
         vDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724770; x=1690316770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfzmpqSD79x1GTEZoTIOiNSPZieOVWfrUJaJ2GmzOH4=;
        b=er06Ua/afeIXrE7Rj9WLr2I6n8KbfwwPzKCQOwlgkldJ+k2W9B9YZX3DigpBpZ7WBL
         MuDSpfdH1mXJ21KF2NYrUV2/qpY9ZJaq0Cyts9PjULqFILgxi5/ojEKNbCsJZ8IqjtJ5
         JjGnSxvaROKak7beNm/f+SORGbTByjXaW3E9t5NXODnTv8e3Y/VqiLbDodKY4fbNElvn
         0F1CLpIYPJM33g6zcEd4HutfyojccVMvNs6M63Vq8gZG5YiwH0WP+rpd3rFkSqawBItp
         MZ1EyuLA9AVOSiydsge8F/05gjeOAE/LrsEqHfxAx6FeP2rqsJt07KSND1VUvPQbgLKS
         eDnQ==
X-Gm-Message-State: AC+VfDyUKkfiGaX2qyQfAVmEM1J8VzkqoyU7oMzmkpJ5YJbdWeAx+9xy
        rzDX9O8JKFj8uXpzwRb/Ey6hBw==
X-Google-Smtp-Source: ACHHUZ4/NpURkZggRD1r3X1/yZ+cy38Mw3jmI2h3kMbN+8ZTn/hu4CYQ61UXmDt5KaXY2sezTq5W7A==
X-Received: by 2002:a19:6457:0:b0:4f8:5604:4b50 with SMTP id b23-20020a196457000000b004f856044b50mr14983458lfj.64.1687724770571;
        Sun, 25 Jun 2023 13:26:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:26:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 24/26] ARM: dts: qcom: msm8974: drop 'regulator' property from SAW2 device
Date:   Sun, 25 Jun 2023 23:25:45 +0300
Message-Id: <20230625202547.174647-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SAW2 device should describe the regulator constraints rather than
just declaring that it has the regulator.

Drop the 'regulator' property. If/when CPU voltage scaling is
implemented for this platform, proper regulator node show be added
instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index aeca504918a0..dffab32c757d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -416,7 +416,6 @@ saw3: power-controller@f90b9000 {
 		saw_l2: power-controller@f9012000 {
 			compatible = "qcom,saw2";
 			reg = <0xf9012000 0x1000>;
-			regulator;
 		};
 
 		acc0: power-manager@f9088000 {
-- 
2.39.2


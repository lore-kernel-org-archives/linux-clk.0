Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E75C83F1E
	for <linux-clk@archiver.kernel.org>; Sun, 27 Aug 2023 11:51:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjH0LvP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Aug 2023 07:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbjH0Lux (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Aug 2023 07:50:53 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55EC41B7
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 04:50:44 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-500913779f5so3644822e87.2
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 04:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137042; x=1693741842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iML/la2X+kkzMiHXKswhvebGs/8rFNHbXwkoPnyizU0=;
        b=zHedpKE08DOphnZ3dBAqnF3+/QjYUrdjBKjx02aa8TUdhz9UBEnYcbMy4u4mcvK3xY
         0uvaNOBWY9EannduYGqF/X1zeGgrdygSpx92Tyu4WhrccRu8drWJ2BmG9xVqofVxa2XK
         REqIPfjLpzhhaQwO/x4tMBHDtf3wx1eFvyW/PObfW8cOO9EOskUc7tpa+PXwPLRHfoiE
         1Q5VKNHoilHThz9aAd/I9jMNV4627fFNDruE8TT3RaG82zVlaKtq2dZY6uxTsmLNfkkU
         wo9vWEGnT2aevysfv3o/MT4frL0RoIjO1z6aZ12Wu6bSVEBKEj3lNwykxtTNAVHJNElP
         JJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137042; x=1693741842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iML/la2X+kkzMiHXKswhvebGs/8rFNHbXwkoPnyizU0=;
        b=eJrfpe4ip3VYJM4jmN0g6AnZBreXZMAmyaYTk6Kv4XO8XqKQSiDhajnjcxFBdxRUOI
         HPtmIaVesavJ26mfnYqlgalzhpILZGk5xDylNI3TTj8pk0b/lxYiv24XSzE4ZDBUZ2xU
         cUAUouNuclEFVPirR2nRuNPrG9ryF7kFWkF4W2J0XRoz6rDtLlyrykP5MOOuLO/8EzCu
         NPRJS9mLoc2ZhQvNCT43mY7PuxFgElu+2Asheu6ONvl2NlNmVyR/HSBxMgVjkVQwLvSu
         b61zS32LZ8uSAcHi9IcCtfQ4ZfeievEqSd1unBcsyf2MS+sf/NidsFrY98Ve9j2vY0sn
         7RhA==
X-Gm-Message-State: AOJu0YzCAn7HCtaeLOJcBPwQWHonn+wcWav7CaSUe3oiuTJUP8AA2Xb3
        f73PzzZBO8KRNxq4Wp9kYNqsGA==
X-Google-Smtp-Source: AGHT+IEX9HUkd+8Z6mPlOaTYjGeOtq0HKM6sGOsdSkl43550d8ip7TdTRdaHJ9coGsTMZEm5V7t2gg==
X-Received: by 2002:a19:520b:0:b0:4f8:71cc:2b6e with SMTP id m11-20020a19520b000000b004f871cc2b6emr14940673lfb.33.1693137042640;
        Sun, 27 Aug 2023 04:50:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:42 -0700 (PDT)
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
Subject: [PATCH v4 09/23] ARM: dts: qcom: apq8064-asus-nexus7-flo: constraint cpufreq regulators
Date:   Sun, 27 Aug 2023 14:50:19 +0300
Message-Id: <20230827115033.935089-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add additional constraints to the CPUfreq-related regulators, it is
better be safe than sorry there.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index 329c2546aa0a..b60761290156 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -224,9 +224,9 @@ pm8921_s1: s1 {
 			bias-pull-down;
 		};
 
-		/* msm otg HSUSB_VDDCX */
+		/* msm otg HSUSB_VDDCX and VDD_DIG */
 		pm8921_s3: s3 {
-			regulator-min-microvolt = <500000>;
+			regulator-min-microvolt = <950000>;
 			regulator-max-microvolt = <1150000>;
 			qcom,switch-mode-frequency = <4800000>;
 		};
@@ -310,6 +310,12 @@ pm8921_l23: l23 {
 			bias-pull-down;
 		};
 
+		/* VDD_MEM */
+		pm8921_l24: l24 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1150000>;
+		};
+
 		/*
 		 * tabla2x-slim-CDC_VDDA_A_1P2V
 		 * tabla2x-slim-VDDD_CDC_D
@@ -338,8 +344,12 @@ pm8921_lvs6: lvs6 {
 		/*
 		 * mipi_dsi.1-dsi1_vddio
 		 * pil_riva-pll_vdd
+		 * HFPLL regulator
 		 */
 		pm8921_lvs7: lvs7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-boot-on;
 			bias-pull-down;
 		};
 	};
-- 
2.39.2


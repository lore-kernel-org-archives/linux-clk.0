Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51FCC4167B
	for <linux-clk@archiver.kernel.org>; Sat, 21 May 2022 15:14:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245003AbiEUPOu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 May 2022 11:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347551AbiEUPOs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 May 2022 11:14:48 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF72356229
        for <linux-clk@vger.kernel.org>; Sat, 21 May 2022 08:14:47 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id p22so18757796lfo.10
        for <linux-clk@vger.kernel.org>; Sat, 21 May 2022 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AvVifaO9p+JFw30NVykbo4mkyi37xpDmxYCbuCucK8M=;
        b=gJFk/utYk7tEDr3TiCLcmebSKUjrCeU+VIZ6I+wLtkFUise5ohQVyMMxkrUvbVVIwr
         E3ZcTVr90anB6NFLfq0bitQyQL7x0UnNTYKmeSbVuXYtomM7v3HFB2K8gon3+s/+n9i5
         OmwzJpXQDl5aCssHquJf56G+YdZmKsMS5g/eOVsexujdKrWyxNs7zzjLZq6M5RUmXIJ/
         s7KeJuwXhVeeX58ogd3cJIyLhvc1OK38/l/4Li/ovJk6vJbGXz0TgWRPxpYVZ25SqevJ
         +NZTK5cIWbjeR11e3RnppLBIRye0w6xjToTEUVNva9yvdmxvuv48QfU6zeytRrLrNdXI
         +0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AvVifaO9p+JFw30NVykbo4mkyi37xpDmxYCbuCucK8M=;
        b=gJE2ElU7edexNRk/9BTv/hL0bMvVjwHJf7YY6fub0SerB9Zp/K4vP6ZLbqjt8RzWCA
         IfYTfm92xSt3SKDWcNqqpNrWjH6cBA3dPZl2Koe8vkqIMLveR1V/G3Q6qhfn0iws9X4z
         XkGXm9x8N9gw8uS2paq/JcIvNvNwKkmaBTcAEx8de6oeS9+tO1/7Tx/lbwVzd5gf25Pk
         nCyXoQ0661pPwlqEj1b6OmTwp2zwZZ5gOgHxFVB5mV7p3BxaiyF6y3xi+E4sb/YF+Xws
         2KUfPE2OSuzoGXAqzjmHNC6PnwjdLzddEVHdB/R4G7HhHqjMT5ipIvONgAcojNUUhbOG
         huzw==
X-Gm-Message-State: AOAM532XNdrPHgwP19vlbB0hPanCPMKYpiOeYZa8USnjLOXyqrH7Jejt
        2K8ET7KLg71erEuZK9tb894wPQ==
X-Google-Smtp-Source: ABdhPJyEF/PmsCSZKm9rhGinAIjLGKp+WnOdtCw5Ykbhm++dVKLJfZ0m3F//cu2F69h8E9bJVeu4/g==
X-Received: by 2002:a05:6512:3502:b0:476:c68d:8b0d with SMTP id h2-20020a056512350200b00476c68d8b0dmr10868706lfs.113.1653146086058;
        Sat, 21 May 2022 08:14:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id v22-20020a2e7a16000000b0024f3d1daedfsm716849ljc.103.2022.05.21.08.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:14:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 4/4] arm: dts: qcom-apq8064: create tsens device node
Date:   Sat, 21 May 2022 18:14:37 +0300
Message-Id: <20220521151437.1489111-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
References: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Create separate device node for thermal sensors on apq8064 platform.
Move related properties to the newly created device tree node.
This harmonizes apq8064 and ipq8064 device trees and allows gcc device
to be probed earlier by removing dependency on QFPROM nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 34c0ba7fa358..0d323c208978 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -105,7 +105,7 @@ cpu0-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&gcc 7>;
+			thermal-sensors = <&tsens 7>;
 			coefficients = <1199 0>;
 
 			trips {
@@ -126,7 +126,7 @@ cpu1-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&gcc 8>;
+			thermal-sensors = <&tsens 8>;
 			coefficients = <1132 0>;
 
 			trips {
@@ -147,7 +147,7 @@ cpu2-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&gcc 9>;
+			thermal-sensors = <&tsens 9>;
 			coefficients = <1199 0>;
 
 			trips {
@@ -168,7 +168,7 @@ cpu3-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&gcc 10>;
+			thermal-sensors = <&tsens 10>;
 			coefficients = <1132 0>;
 
 			trips {
@@ -810,14 +810,23 @@ tsens_backup: backup_calib {
 		};
 
 		gcc: clock-controller@900000 {
-			compatible = "qcom,gcc-apq8064";
+			compatible = "qcom,gcc-apq8064", "syscon";
 			reg = <0x00900000 0x4000>;
-			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
-			nvmem-cell-names = "calib", "calib_backup";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-			#thermal-sensor-cells = <1>;
+
+			tsens: thermal-sensor {
+				compatible = "qcom,msm8960-tsens";
+
+				nvmem-cells = <&tsens_calib>, <&tsens_backup>;
+				nvmem-cell-names = "calib", "calib_backup";
+				interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "uplow";
+
+				#qcom,sensors = <11>;
+				#thermal-sensor-cells = <1>;
+			};
 		};
 
 		lcc: clock-controller@28000000 {
-- 
2.35.1


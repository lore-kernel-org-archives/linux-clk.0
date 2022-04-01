Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE79C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  1 Apr 2022 20:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351614AbiDAUMk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Apr 2022 16:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351715AbiDAUMj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Apr 2022 16:12:39 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FCA21A896
        for <linux-clk@vger.kernel.org>; Fri,  1 Apr 2022 13:10:48 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id b15so4244645edn.4
        for <linux-clk@vger.kernel.org>; Fri, 01 Apr 2022 13:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yLz7aILXGbmCujlTI/g4EfDEC7wYnFYansE6wl1+BpI=;
        b=PxHyDvJR26H9mDD/PwV4JiYvxj7YL0fkB7i5YMP1Gf2xT7q1GpkA/Sm0jVGd19n3FY
         WUU+Zo9FwAAqqwN/cQN6MRC9XqY1PmcZ0kDsCkdSOPceSM2d27c8HqHjHZ68GSedte6h
         wwDhzr16zY5wnQ1pp+IrwTzagBcaEq7a9qurEf3wGnL+Tz/JrTCWAXzjH00mVt/OfRGV
         QJMLDSbFmkmIwk6Q1r4nplyUOjldlccOsJHdUcCbV3P8uRNiBNBEiziDi7UBdTG4ne1N
         oofhk2pIaQV/9lZnjc6xLEa6wP1LVKmNf5ozhLU3BnmWoVrJV8vvO6GQcQVV+P09QSyT
         kr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yLz7aILXGbmCujlTI/g4EfDEC7wYnFYansE6wl1+BpI=;
        b=TT60kwMAj+mfE5uVKjYB9HLmSi2098S6yUTILYtNaIgns9sifefQxSd7cQxoZ4LoF1
         J1MbSRC8esUvq0VLmUK/ceSVdK4GMjPBEgOoz1pokGonNp5xEWmKoX88XdvbQvrjOC1Y
         T+RHW+57aJTYCuwHSt+BSk8qFpj0eMNqEjpFKfvq7ewHSEM1544cs+pa/1xqn1UJY1vR
         8Xc+OY3l/S+llnzNZnWY95m0kjs3qdk2/09Fk3musLoR9n40aMvzqIuFw45RnwwTDGAR
         vFlVXxpQjka39ymkIKTVsqqCZn4iiYjaRWgHGB0XsanAbhyZ2YFMBGTqa7igHPdPBeL2
         wZOQ==
X-Gm-Message-State: AOAM531HxLOQIeHWmdzj+lKypAIOn85jglUSu0Ua27zVL/G9ZY0/5R17
        XgtL3DLkktgmg+b8uuLrxrTZqQ==
X-Google-Smtp-Source: ABdhPJzw259othySLhLy7RggcO11QlDizMLjwIjmeo/ASWp80QmrYaKNi/O++Se0nG6Wx35SN2iAwg==
X-Received: by 2002:a05:6402:6da:b0:3fd:cacb:f4b2 with SMTP id n26-20020a05640206da00b003fdcacbf4b2mr22483918edy.332.1648843847292;
        Fri, 01 Apr 2022 13:10:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id bx5-20020a0564020b4500b00418fca53406sm1509041edb.27.2022.04.01.13.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 13:10:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 04/10] ARM: dts: qcom: msm8974-lge-nexus5: move gpio-keys out of soc
Date:   Fri,  1 Apr 2022 22:10:29 +0200
Message-Id: <20220401201035.189106-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220401201035.189106-1-krzysztof.kozlowski@linaro.org>
References: <20220401201035.189106-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GPIO keys are not part of SoC and they should be defined inside of
the root node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 42 +++++++++----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index 069136170198..6d5fb60e798f 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -19,6 +19,27 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_pin_a>;
+
+		volume-up {
+			label = "volume_up";
+			gpios = <&pm8941_gpios 2 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		volume-down {
+			label = "volume_down";
+			gpios = <&pm8941_gpios 3 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEDOWN>;
+		};
+	};
+
 	smd {
 		rpm {
 			rpm_requests {
@@ -448,27 +469,6 @@ bcrmf@1 {
 		};
 	};
 
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&gpio_keys_pin_a>;
-
-		volume-up {
-			label = "volume_up";
-			gpios = <&pm8941_gpios 2 GPIO_ACTIVE_LOW>;
-			linux,input-type = <1>;
-			linux,code = <KEY_VOLUMEUP>;
-		};
-
-		volume-down {
-			label = "volume_down";
-			gpios = <&pm8941_gpios 3 GPIO_ACTIVE_LOW>;
-			linux,input-type = <1>;
-			linux,code = <KEY_VOLUMEDOWN>;
-		};
-	};
-
 	serial@f9960000 {
 		status = "okay";
 
-- 
2.32.0


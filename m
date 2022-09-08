Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411F5C6FA8A
	for <linux-clk@archiver.kernel.org>; Thu,  8 Sep 2022 19:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbiIHTKy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Sep 2022 15:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbiIHTKw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2022 15:10:52 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4835EEB2F9
        for <linux-clk@vger.kernel.org>; Thu,  8 Sep 2022 12:10:50 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id f11so15351977lfa.6
        for <linux-clk@vger.kernel.org>; Thu, 08 Sep 2022 12:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ncF6xJEmvKoJZyCXKGKehRon/gM8MA4X4LW/slRHPU8=;
        b=c6yKqLCBUv9/alBNA59ePgbiHfAodIty5Qw21UloFMLs8zN1Bt2Up9jxKpwW7sB3U9
         QJ3dVijGFYoSMBNjGYACtu2sG9pZbpbYUjopmkvr6xYZ8rItJD+lBdKEa/FplGf6Z5oC
         THSNk4nJM27oBi5xlGckEx3Z9pggObbb/nUCFXMOPc8WGxbOLkqea0f+R/VyoGN5LLC1
         QWQ2ouWoChjBey4rjI9WIFiXoQ6oQtKnpZ/82CU8s8F5Ra9bsmOzgJuyzXeukBGtmE+4
         rRzflOtnmNGsCNPXK2y7jj/VCDE2rBIHBKGs8kSyDNA8oLXZU4uYwoVI+/SYBbugUU81
         y63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ncF6xJEmvKoJZyCXKGKehRon/gM8MA4X4LW/slRHPU8=;
        b=uQJT9xM/jBggd3dECIqgbOW0lUqCX5Mr5afVQvXZc6f+sDBNG5c3DzUo8cFpo0OneY
         BkJe9n0QCx5OsGXH6srbH3uk9EvB02yaQfqS0dHU6dN8S2BdP3G058cAlN5+rEe/wV0U
         C2CTubS4DKadDzxCU4vO+ayoe28/4xtzYUCQlShdvhR+idGBHyzoghGoWH0iIE5uQDpI
         00vtpIjdJ5lMH3XPoWOhNEQI7C91go8rv5fvSw0SzHMhtMO93dqDoScWk706xvTENyRn
         gS7LfhvngOP7Cxf7QdrcUFWZOSlsqTutxo7xFh+/RNuAfgLzL/2JlkPJ8rkg9HsjYr1T
         tztA==
X-Gm-Message-State: ACgBeo1L73xnqyq3haYcD38+f8domfVZVB/yWAk8fEcgPfyy/3WvCax5
        VxC1CAIAYhZsqHDS7xdlNqfiCjzLg0vtSQ==
X-Google-Smtp-Source: AA6agR5ivfJClo/Au3PvSsUZJ8UQr+XFcQiDEMa/S6a+aGFCzA3iTFe1fjI0mHwNehHFnWpc9eHGgA==
X-Received: by 2002:a05:6512:1293:b0:48c:e870:b00f with SMTP id u19-20020a056512129300b0048ce870b00fmr2980517lfs.61.1662664248650;
        Thu, 08 Sep 2022 12:10:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v17-20020a2e4811000000b0026ad316375esm634904lja.38.2022.09.08.12.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 12:10:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8450: add display clock controller
Date:   Thu,  8 Sep 2022 22:10:44 +0300
Message-Id: <20220908191044.3538823-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220908191044.3538823-1-dmitry.baryshkov@linaro.org>
References: <20220908191044.3538823-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device node for display clock controller on Qualcomm SM8450 platform

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 4978c5ba5dd0..9062ac4afbca 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,gcc-sm8450.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8450-camcc.h>
+#include <dt-bindings/clock/qcom,sm8450-dispcc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -2317,6 +2318,33 @@ camcc: clock-controller@ade0000 {
 			status = "disabled";
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8450-dispcc";
+			reg = <0 0x0af00000 0 0x20000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&gcc GCC_DISP_AHB_CLK>,
+				 <&sleep_clk>,
+				 <0>, /* dsi0 */
+				 <0>,
+				 <0>, /* dsi1 */
+				 <0>,
+				 <0>, /* dp0 */
+				 <0>,
+				 <0>, /* dp1 */
+				 <0>,
+				 <0>, /* dp2 */
+				 <0>,
+				 <0>, /* dp3 */
+				 <0>;
+			power-domains = <&rpmhpd SM8450_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			status = "disabled";
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8450-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
-- 
2.35.1


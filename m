Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015B1CCA486
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 11:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbiFWLrp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 07:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbiFWLro (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 07:47:44 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4EA44CD64
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 04:47:42 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id b7so22996477ljr.6
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 04:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SSyFlktoMly7Jg0ytEXb/jyKP3wx8JQVn60KuiJv8EE=;
        b=Up6slqYurRrYu8oM2ZeUYWJzvUDXx6GyJKgd92nApQj4+j9eAiQwpAmupo5HbnOfAZ
         IYrXhLz+gNld1IRJd8Azz4LEBj8mh1RaiOfpDCEf96/zY6yPhHaF7Bf4NtWmlSqsJbEk
         J13OmHJkCZ5c9aMq8oApCreFvF6+l5oTs+PqcX09Fxozi95DQiXTK1Zbr8aaCrx7hSYk
         axzt97w6u+zup9s0d4zKufjP7QeEjOvTS36JzwG2UzxcKklCG38rPQ/Jwu5wCNFhAkDx
         9N/dT3ivVDsf1ia3/S/3J0TWax/7PJWSqEgV4oArC//0No3uLlUknotcwKzN53xKpvZx
         4vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SSyFlktoMly7Jg0ytEXb/jyKP3wx8JQVn60KuiJv8EE=;
        b=uJywzR/IXuff7kJarwsYSFD7chvKGuYUzkdu5wYfqZcZFCvzY9AJJJBxiuI4WVDb4m
         7AH882U1Y2tr61gwqdaIZhivputA63hxD2OXIzxfwVzUqvzsEhTTDzylJnS2WVCXhEW9
         nAzWrw3DruuCYw+8lJIXQhOz24i6mfhc7TL7bLcRnm3IpMiaaKzm7KEZPW+Eb7vok7Fr
         DsW30y5WkzpUYKUhFq5HsaWbaibUQmLXEU3oYpag2A/GVULQjXs504wMZ2aNiIBr+iMl
         lP+O2kZIPTmgMywM+PUafNCRYJ/g3h2f+Dh9N7989ZW8Ap2q3576Tio4GRh31rextHhx
         iiww==
X-Gm-Message-State: AJIora+tkBHldtLVVY/xErlgHecau9ht9F19U0RAWyhh7wxCHzzP0+/8
        itzYSmY5grV4qQvOv03RGV7NDg==
X-Google-Smtp-Source: AGRyM1v0O0BZ/afpQeBcvJSUFyjFI/GQAvD0oLozXC0MCAijH1ls4BuQu9pJ8HzxG2h4QKbqNGaNSw==
X-Received: by 2002:a05:651c:54b:b0:25a:6336:eb6c with SMTP id q11-20020a05651c054b00b0025a6336eb6cmr4661134ljp.315.1655984861205;
        Thu, 23 Jun 2022 04:47:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x5-20020a056512078500b0047f77729723sm1369968lfr.43.2022.06.23.04.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 04:47:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 4/4] arm64: dts: qcom: sm8450: add display clock controller
Date:   Thu, 23 Jun 2022 14:47:37 +0300
Message-Id: <20220623114737.247703-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623114737.247703-1-dmitry.baryshkov@linaro.org>
References: <20220623114737.247703-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device node for display clock controller on Qualcomm SM8450 platform

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 7d08fad76371..4fb60aef77f4 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dispcc-sm8450.h>
 #include <dt-bindings/clock/qcom,gcc-sm8450.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -2288,6 +2289,40 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8450-dispcc";
+			reg = <0 0x0af00000 0 0x20000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <0>, <0>,
+				 <0>, <0>,
+				 <0>, <0>,
+				 <0>, <0>,
+				 <0>, <0>,
+				 <0>, <0>,
+				 <&sleep_clk>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp0_phy_pll_link_clk",
+				      "dp0_phy_pll_vco_div_clk",
+				      "dp1_phy_pll_link_clk",
+				      "dp1_phy_pll_vco_div_clk",
+				      "dp2_phy_pll_link_clk",
+				      "dp2_phy_pll_vco_div_clk",
+				      "dp3_phy_pll_link_clk",
+				      "dp3_phy_pll_vco_div_clk",
+				      "sleep_clk";
+			power-domains = <&rpmhpd SM8450_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8450-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
-- 
2.35.1


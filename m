Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1558C25B48
	for <linux-clk@archiver.kernel.org>; Thu, 26 Oct 2023 10:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234875AbjJZKOG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Oct 2023 06:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234338AbjJZKOD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Oct 2023 06:14:03 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD7D19A
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 03:13:57 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32003aae100so1133065f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 03:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698315236; x=1698920036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/dkqG7TFqhS22WCtOJCYFAnzbujpg+JGXvYF9Z8Jtw=;
        b=wxo3Nz9qGHFv2wfl3bZHnL2oQUbsRc0bL9RBbjsMPdAz/V2Zc+q+rEqsPB1a0bwUnD
         ac9XQ6wAX+v2yolYmlxfqcwtKSxJ4QKUYXsGU6GnBitUsYYM8c5kam6qpmnXsSK6j8PY
         Jn1KfbLfXiUvGw69CIUv/B6mJuAfHw+eY5PuDEJBLMjueB8jl1ycS0m4qZM1tcRR0LKF
         DJfvtmoFnx7V7FwQ6jgXSwEI9PnBIjf/YiBdaLxub+g3mwNli3SzsSaCckUNf2eyh3US
         uuA6vn2G337Mn1+8wKyiDfYwDRlYoMmHkPjpZmon/E50rrT5gh9bdaQsYw1ADEGBD0bY
         hf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698315236; x=1698920036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/dkqG7TFqhS22WCtOJCYFAnzbujpg+JGXvYF9Z8Jtw=;
        b=ry2k8/NhKnzyJ+i+cjAw1oBMR1vFLlO4AKOgtF7ndjWjN9O5hIMf4fjO0tWIlIOQAX
         WJFxKBSaq8ADV4EG5WCG/OA0lRueBzXu7yT79VLwdIt8LI5jam3ZF6FrjcPX84c0BPSm
         EZwEH0L3DAaMWziiV+Nag/CeUC6iKUkF+MPGwTQjqI6ibp9pAUmfDAzmQiB4lPmD6/h+
         tEwTnGroScYsdQva79ioUEMKgaaObKyhSNbCnp8aP/yd4xSFPHwmtZvmnNRE9txW1vNF
         ejy+6XYeveImOydzZQf+mZHERk61Bg/pYivkD3JpX4jYRlMnzlpLyNAPSnJ3my5bAVSe
         0Wpw==
X-Gm-Message-State: AOJu0YzfsMKKrswy4NdIqyCA0rD3J9IX3YtliJtC7d0z5nykJmVlhkaM
        ul41NS/fvwhB0+HQqKH+1Fa7Qg==
X-Google-Smtp-Source: AGHT+IEdZ6ESjD0Z2C0Mu+lrmY/QFkZ9eAlkOPa3rC2Wzc8rz47SBBD7chahDPKAxFfXfv3/PBCbyA==
X-Received: by 2002:a05:6000:118b:b0:32d:a431:9045 with SMTP id g11-20020a056000118b00b0032da4319045mr1983752wrx.30.1698315236442;
        Thu, 26 Oct 2023 03:13:56 -0700 (PDT)
Received: from x13s-linux.nxsw.local ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id m21-20020a056000181500b003271be8440csm13913103wrh.101.2023.10.26.03.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:13:55 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 4/4] arm64: dts: qcom: sc8280xp: Add in CAMCC for sc8280xp
Date:   Thu, 26 Oct 2023 11:13:43 +0100
Message-Id: <20231026101343.3300-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231026101343.3300-1-bryan.odonoghue@linaro.org>
References: <aef93a48cf270d5078ccdc39d95113a4.sboyd@kernel.org>
 <20231026101343.3300-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add in CAMCC for sc8280xp. The sc8280xp Camera Clock Controller looks
similar to most of the sdmX, smX and now scX controllers.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index cad59af7ccef..fafea0f34fd9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
 #include <dt-bindings/clock/qcom,gpucc-sc8280xp.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
@@ -3450,6 +3451,20 @@ usb_1_role_switch: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sc8280xp-camcc";
+			reg = <0 0x0ad00000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss0: display-subsystem@ae00000 {
 			compatible = "qcom,sc8280xp-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.40.1


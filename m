Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F25E7C4E6
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 16:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243315AbjJDQTK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 12:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243321AbjJDQTJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 12:19:09 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A990C4
        for <linux-clk@vger.kernel.org>; Wed,  4 Oct 2023 09:19:05 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3231d67aff2so49963f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Oct 2023 09:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696436344; x=1697041144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82Kqf0UBYM8c+UzHOY9T7/SD0aaAr6GxwSoS4++hAHg=;
        b=QYDaGEd3WfsgX7TJQl50NXCLncJBjlKKTJ+ujjmdK2IfG/T/DPKjiIT29icMI2JyRY
         i5I2q2iZfPwiHZM98pgrOPJurlKni2Pd7SW6BryuiEFpUfV7ivre+tgYbnHr+/XPkB5C
         NMtgLAX+3KXBqh/bQO7E9P3CA7AyPMDMFJv68tgqGEN9mEy/LyUMt4sjIr7djxDO63Xl
         reOwG8hKZV+gSpzYTQd4xAL6lWSEg2wM0/JhgLJCIkwICghPjzvRbTAgfnmt3tTfsrhL
         wGEJn8Vsnjd5LiE1uD61WvAd24j97qPO9/AYpZigPxuKcQB9P7l4PiLjyK7yE5Yu8xYi
         npdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696436344; x=1697041144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82Kqf0UBYM8c+UzHOY9T7/SD0aaAr6GxwSoS4++hAHg=;
        b=DPo6P0CwcYcHYPTXwdy/2xStiok45Adx1Ffhj/KGliOvvjSXIIEKVYKAp1km/oihpn
         N924Dc7Ecu1E3n9r8bAxGe2S2cWma6KQAZIhbL7nopoacP2OslJdTwA9bCWnxzlUlXLQ
         P0KZ+XTPut6twNqGIP3kG+j0UHQM7zceUCx5y3HH+9Fd6CxgFLuGkEOgYNahtnU3l3qe
         A+ZU1BjQr40I/E27TLXyy6mBIaDoQzqq64w26Dp0T12nrL329NM1CC/dCzWrXA4Cxnyf
         Pb/sqLPwz3H3tmcKxWkHpcpUg61Atc/D7edn7xmjosLLwlk0ZxV5zKwnQqSUPC2uohKX
         EJVA==
X-Gm-Message-State: AOJu0Yz13ZTO9+YjWyShps8o7PuAPh1dwwzLjP4jJ5ebK+OrhxMPkafs
        gpwgOUHqUs05sGxpqvgH9+Pabw==
X-Google-Smtp-Source: AGHT+IFa1rWD3baL3/9Ijia/7woW5DnTT/YbsOYvzWFQwZJQV05JfqyFkvNVdnjk3aYh0sMwZJ91+g==
X-Received: by 2002:adf:f48e:0:b0:324:8239:2873 with SMTP id l14-20020adff48e000000b0032482392873mr2587437wro.37.1696436344039;
        Wed, 04 Oct 2023 09:19:04 -0700 (PDT)
Received: from x13s-linux.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r5-20020adfe685000000b003177074f830sm4366940wrm.59.2023.10.04.09.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 09:19:03 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp: Add in CAMCC for sc8280xp
Date:   Wed,  4 Oct 2023 17:18:53 +0100
Message-Id: <20231004161853.86382-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004161853.86382-1-bryan.odonoghue@linaro.org>
References: <20231004161853.86382-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add in CAMCC for sc8280xp. The sc8280xp Camera Clock Controller looks
similar to most of the sdmX, smX and now scX controllers.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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


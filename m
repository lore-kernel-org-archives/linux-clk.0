Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666FAC04FE2
	for <linux-clk@archiver.kernel.org>; Sun, 25 Jun 2023 20:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjFYU0M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Jun 2023 16:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbjFYU0L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Jun 2023 16:26:11 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61FDE7B
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:26:05 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f9fdb0ef35so1295979e87.0
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724764; x=1690316764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7H4gfmiVKhRklk1FA6KTDQbQYJQQYujXQM62+zAj3hY=;
        b=MDC/ONeIcfezrE/OusI5lHeb8A/X2/wJJZoZdQmgfHH6pAqJNm6q8ZAxsPrUmgyQzU
         Yh+cpkW+uDYA1EHKx6ZQgo8Mq/Yb+9hjOL9PlXZo5BBubl4VuA1w9GDg28AFRNSCJfys
         YTYrOMNhVhOsamDMAKkknjl2pVni55jEP0lV1f6RHIpOd8LjV7DZ4NeJ2By0SOQP+3Y0
         1M0GBzUSN0utfTY3AT/N3ZgO8M6Z7EGlpY/+17+HTH9O+IQVpQXBdUiaEXCzh8kQKjjt
         G/V3omEa1o2YmkIjgaertKzybqCR+AxezGXrN3OdEDzXCsAEDuRnHYynkqvn/siQwh1s
         tNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724764; x=1690316764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7H4gfmiVKhRklk1FA6KTDQbQYJQQYujXQM62+zAj3hY=;
        b=O7fYvrceLg+7itgn9rZnowuG+syU5ShY8TwAZy8Wwfshlr30tMBzWVx/87jvmubyVj
         Bnxh2Tz0ZBJr1HBWLALgfbWSP89cFPthvwPj5lzSkkVDad6MndgcNF5q12slHMB/OvIH
         IFasSyGgbykrgZpqPg6+vcH198vFYTGDVu5LAwnuh689xhx07bKfMj+sppjkXO13Xulu
         KDEfGhuU10eWellg5k+TlB8ww00I2dpoZBJ/XgRsBfjyBDHTcAGPsowvj3AQDSEdtZpl
         sJZCiXPPNN8fvIPEd827EsoY5G1aFu+WCU4RFCzIyEMR4+ewt34HyhW94/bRcsaRhtk2
         DCIg==
X-Gm-Message-State: AC+VfDxkRe6IFhDWy7S5VT5snqy9tpQHFY/yvaDz3WvUrkgtXsqVieAK
        ON4DHdcPO7Lwohsgi5qOMOOSyA==
X-Google-Smtp-Source: ACHHUZ5xt3r2nB5CFen5CIj6Off17gXUBLeLX32uJ8VPJvJGExuqqUXKOAZFTkMV7XHmwWp/MzY+aA==
X-Received: by 2002:a05:6512:3d8e:b0:4fb:73d1:58e5 with SMTP id k14-20020a0565123d8e00b004fb73d158e5mr557018lfv.53.1687724764006;
        Sun, 25 Jun 2023 13:26:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:26:03 -0700 (PDT)
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
Subject: [PATCH v2 16/26] ARM: dts: qcom: apq8064: add L2 cache scaling
Date:   Sun, 25 Jun 2023 23:25:37 +0300
Message-Id: <20230625202547.174647-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Populate L2 cache node with clock, supplies and OPP information to
facilitate scaling L2 frequency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 101 ++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 1eb6d752ebae..ac07170c702f 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -81,9 +81,108 @@ CPU3: cpu@3 {
 		};
 
 		L2: l2-cache {
-			compatible = "cache";
+			compatible = "qcom,krait-l2-cache", "cache";
 			cache-level = <2>;
 			cache-unified;
+			vdd-mem-supply = <&pm8921_l24>;
+			vdd-dig-supply = <&pm8921_s3>;
+			clocks = <&kraitcc KRAIT_L2>;
+			#interconnect-cells = <1>;
+			operating-points-v2 = <&l2_opp_table>;
+
+			l2_opp_table: opp-table-l2 {
+				compatible = "operating-points-v2";
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					opp-microvolt = <1050000 1050000 1150000>,
+							<950000 950000 1150000>;
+				};
+
+				opp-432000000 {
+					opp-hz = /bits/ 64 <432000000>;
+					opp-microvolt = <1050000 1050000 1150000>,
+							<1050000 1050000 1150000>;
+				};
+
+				opp-486000000 {
+					opp-hz = /bits/ 64 <486000000>;
+					opp-microvolt = <1050000 1050000 1150000>,
+							<1050000 1050000 1150000>;
+				};
+
+				opp-540000000 {
+					opp-hz = /bits/ 64 <540000000>;
+					opp-microvolt = <1050000 1050000 1150000>,
+							<1050000 1050000 1150000>;
+				};
+
+				opp-594000000 {
+					opp-hz = /bits/ 64 <594000000>;
+					opp-microvolt = <1050000 1050000 1150000>,
+							<1050000 1050000 1150000>;
+				};
+
+				opp-648000000 {
+					opp-hz = /bits/ 64 <648000000>;
+					opp-microvolt = <1050000 1050000 1150000>,
+							<1050000 1050000 1150000>;
+				};
+
+				opp-702000000 {
+					opp-hz = /bits/ 64 <702000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-756000000 {
+					opp-hz = /bits/ 64 <756000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-810000000 {
+					opp-hz = /bits/ 64 <810000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-864000000 {
+					opp-hz = /bits/ 64 <864000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-918000000 {
+					opp-hz = /bits/ 64 <918000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-972000000 {
+					opp-hz = /bits/ 64 <972000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-1026000000 {
+					opp-hz = /bits/ 64 <1026000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-1080000000 {
+					opp-hz = /bits/ 64 <1080000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-1134000000 {
+					opp-hz = /bits/ 64 <1134000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+			};
 		};
 
 		idle-states {
-- 
2.39.2


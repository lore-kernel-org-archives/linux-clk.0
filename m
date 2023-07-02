Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F19C04A94
	for <linux-clk@archiver.kernel.org>; Sun,  2 Jul 2023 17:51:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjGBRvA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Jul 2023 13:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjGBRu7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Jul 2023 13:50:59 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C483E69
        for <linux-clk@vger.kernel.org>; Sun,  2 Jul 2023 10:50:53 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f875b267d9so5662760e87.1
        for <linux-clk@vger.kernel.org>; Sun, 02 Jul 2023 10:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688320252; x=1690912252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2RgVgorpYxjC9AvaAjc78mFsqayussQmcq7fZZ+tBM=;
        b=sYGfR4+r1lMAFY4Kl5LURFj+wWYYKZFUHdFStyAa4BpHFk+XsQ7AqerM+36UguibjA
         O98WfrvLJzEAEdqcozgC+7URlDBXcfZyc6WfyZ0B+6ccu2mWcgtJRPMP0dfgA8yH2ziw
         FosAb0n6bCKWBh/4pUoe32X0JubtMXGZeRQtzriC4jeEXDkk3UWFa41zdZrEfsE/FpaB
         ia4vCvu2dl8P16UcFfZfChWD6VD+PfzTBzMcjGU/mV3ZSYZbGImGelXNIm/v6M5V1JZN
         XhqUsiBf8LZlr/Fj5nH1wGDNKPMXsD2V8V0v7Xl0kEOFOyZh00DMug6CRLvTxEynMuHM
         FRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688320252; x=1690912252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2RgVgorpYxjC9AvaAjc78mFsqayussQmcq7fZZ+tBM=;
        b=S/eMY+FsYtG5YCmwtwoaUPzyXPpRQ1VlZUuz13rv3IPY+aRUwOxf+6JMhSDSrbhRcc
         AcGbFi8Br6lc2RBNwwP5yD/6mzZ5MxrXk7LeMBuVVAME5Zpsnr2JAfZfGnG0UiebuXzl
         U5V8G8snGUaKbRwrEZr+zN4/5w0+L9P27Lgl1L2jQcxM6EM3fbFkAYuoUQvJouE6XUT8
         BoCz5Zi9bjKzEEc9NVRNYsMzIqQYfmB9PobraXZ2W9KYBI826YddeCOGSYmBNQiokQdV
         M6L+ueZWDpnTtanxsf5ox+xJy1vPZGqTaUrOh59nnbsDN3l2xWYBwgUvu1mIsTCbSYJZ
         V4jQ==
X-Gm-Message-State: ABy/qLaF/EucFCg3q4dX6KaHBSODSL7EUfc1OaldosQB9oVmTHpdCtUa
        9wD71SkZELVdwXuUxQ7cYrgAhQ==
X-Google-Smtp-Source: APBJJlFG5aKzKDMSAGCx1p6Dn6e5WC1BjdJFPcpT+06se0Bm7uOX5iWizs4xSKzI2Vzjnu89YQVK/g==
X-Received: by 2002:a05:6512:2022:b0:4f8:767d:9b98 with SMTP id s2-20020a056512202200b004f8767d9b98mr4847041lfs.37.1688320251983;
        Sun, 02 Jul 2023 10:50:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020ac24c81000000b004fb759964a9sm3354130lfl.168.2023.07.02.10.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:50:51 -0700 (PDT)
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
Subject: [RFC PATCH 7/8] ARM: dts: qcom: msm8960: add L2 cache scaling
Date:   Sun,  2 Jul 2023 20:50:44 +0300
Message-Id: <20230702175045.122041-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
References: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Populate L2 cache node with clock, supplies and OPP information to
facilitate scaling L2 frequency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts   |   5 +
 .../qcom/qcom-msm8960-samsung-expressatt.dts  |   5 +
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi      | 124 +++++++++++++++++-
 3 files changed, 133 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index cba0d1e460a1..2f73f058d855 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -336,6 +336,11 @@ pm8921_ncp: ncp {
 	};
 };
 
+&L2 {
+	vdd-mem-supply = <&pm8921_l24>;
+	vdd-dig-supply = <&pm8921_s3>;
+};
+
 /* eMMC */
 &sdcc1 {
 	status = "okay";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 6bc02bf25120..7132255c7003 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -321,6 +321,11 @@ pm8921_ncp: ncp {
 	};
 };
 
+&L2 {
+	vdd-mem-supply = <&pm8921_l24>;
+	vdd-dig-supply = <&pm8921_s3>;
+};
+
 &usb_hs1_phy {
 	v3p3-supply = <&pm8921_l3>;
 	v1p8-supply = <&pm8921_l4>;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 65065276c885..48b3962dd4fb 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -2,6 +2,7 @@
 /dts-v1/;
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,krait-cc.h>
 #include <dt-bindings/clock/qcom,gcc-msm8960.h>
 #include <dt-bindings/reset/qcom,gcc-msm8960.h>
 #include <dt-bindings/clock/qcom,lcc-msm8960.h>
@@ -41,9 +42,130 @@ cpu@1 {
 		};
 
 		L2: l2-cache {
-			compatible = "cache";
+			compatible = "qcom,krait-l2-cache", "cache";
 			cache-level = <2>;
 			cache-unified;
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
+							<1050000 1050000 1150000>;
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
+					opp-microvolt = <1050000 1050000 1050000>,
+							<1050000 1050000 1050000>;
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
+
+				opp-1188000000 {
+					opp-hz = /bits/ 64 <1188000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-1242000000 {
+					opp-hz = /bits/ 64 <1242000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-1296000000 {
+					opp-hz = /bits/ 64 <1296000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+
+				opp-1350000000 {
+					opp-hz = /bits/ 64 <1350000000>;
+					opp-microvolt = <1150000 1150000 1150000>,
+							<1150000 1150000 1150000>;
+				};
+			};
 		};
 	};
 
-- 
2.39.2


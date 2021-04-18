Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B8FC43460
	for <linux-clk@archiver.kernel.org>; Sun, 18 Apr 2021 12:30:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1636D6120C
	for <linux-clk@archiver.kernel.org>; Sun, 18 Apr 2021 12:30:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236494AbhDRMaa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Apr 2021 08:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235024AbhDRMa0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Apr 2021 08:30:26 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22862C06138E
        for <linux-clk@vger.kernel.org>; Sun, 18 Apr 2021 05:29:57 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id w23so32940037ejb.9
        for <linux-clk@vger.kernel.org>; Sun, 18 Apr 2021 05:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b547BMu5kBL6tcIHKqqfN766JJR/oDzNkUNDuTs8X1E=;
        b=PtKAchkRz8X1YShNDUgeLiSFg3ykVZ7cCoPe6nFws+2xCQd79YLbzU2sXF1/EWiZJb
         Tx7S5q2D89adJzp4HSrDtC2xDS7Gv/+d57aaQXjxuGMO5IxJEdPzX1oxlxKx2OApeK0s
         1sERSz0cv3V68NP6tiutxa/WEzMnDyHBX/xCxW45I18RWO3cWckfT0QT8v3Q3DYopPyT
         /d7lW/7xgmOycM015DQ+l0pzTLjwf0v7VHpud+qevy7JYclxG2vxYV4SwrDefejU2V0R
         ExISYX3kquVgtZwTQz3UBZJyQHpux+ThguGB2BvbdZnP4u+BqaYMme1DIXYCwELfy4F8
         ROWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b547BMu5kBL6tcIHKqqfN766JJR/oDzNkUNDuTs8X1E=;
        b=KUbEYyZh+UiGYNkOQhSYazUVRrkk2NcKPltoCq+oE89pwXC8v/rjVWbYXFYV6OGMN8
         ucsOzNPDpWgU+KOe5oGZQ9R3ctzD+l8SFAAi/Jy2/801JEPvBEkwuZp1xjF3GLIxgzX6
         WvanByitT5MZlsh+8VehGzsUKnHNXyrZAXJaXp0ZwUCO/Gp56JGmLkwtp7jow/ySdXIC
         UGI5BaBMoHggmr3oJHhxcBwLH1gr+tsBAld2mVC2QXROfF22VppojA5Lw8soo8QhMb1M
         oKR0+WMoKFrrP3wPEmpkO8JtFNjVM9PNDXd7Ch7r6+Me/2cvFZTv4ubhMH1mebQc+NG5
         Nn4w==
X-Gm-Message-State: AOAM532MfV3e2IRT/ltxNnkYI+29kRATH8z+NjTOFuPr9VByxI52t8OS
        4EWPtJqOasxqKuMe5TYZEooqBQ==
X-Google-Smtp-Source: ABdhPJzrw+rTdBHOCVmv0QiVpumZPo2uog9Yi6cozEYLLPYDYcgMJ1xt2UR31oFR/ixoXyaha+7kbw==
X-Received: by 2002:a17:906:5056:: with SMTP id e22mr17086736ejk.289.1618748995837;
        Sun, 18 Apr 2021 05:29:55 -0700 (PDT)
Received: from PackardBell (87-49-44-144-mobile.dk.customer.tdc.net. [87.49.44.144])
        by smtp.googlemail.com with ESMTPSA id a27sm8213677ejk.80.2021.04.18.05.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 05:29:55 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 70967d3d;
        Sun, 18 Apr 2021 12:29:50 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH v2 3/5] arm: dts: qcom: Add support for MSM8226 SoC
Date:   Sun, 18 Apr 2021 14:29:07 +0200
Message-Id: <20210418122909.71434-4-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
References: <20210418122909.71434-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Implement basic device tree support for MSM8226 SoC which belongs to the
Snapdragon 400 family. For now, this file adds the basic nodes like gcc,
pinctrl and other required configuration for booting up to the serial
console.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 arch/arm/boot/dts/qcom-msm8226.dtsi | 147 ++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-msm8226.dtsi

diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
new file mode 100644
index 0000000000..2de69d5687
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-msm8974.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&intc>;
+
+	chosen { };
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		intc: interrupt-controller@f9000000 {
+			compatible = "qcom,msm-qgic2";
+			reg = <0xf9000000 0x1000>,
+			      <0xf9002000 0x1000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		gcc: clock-controller@fc400000 {
+			compatible = "qcom,gcc-msm8226";
+			reg = <0xfc400000 0x4000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		tlmm: pinctrl@fd510000 {
+			compatible = "qcom,msm8226-pinctrl";
+			reg = <0xfd510000 0x4000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 117>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		blsp1_uart3: serial@f991f000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0xf991f000 0x1000>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
+		restart@fc4ab000 {
+			compatible = "qcom,pshold";
+			reg = <0xfc4ab000 0x4>;
+		};
+
+		rng@f9bff000 {
+			compatible = "qcom,prng";
+			reg = <0xf9bff000 0x200>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
+		timer@f9020000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0xf9020000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			frame@f9021000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9021000 0x1000>,
+				      <0xf9022000 0x1000>;
+			};
+
+			frame@f9023000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9023000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9024000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9024000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9025000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9025000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9026000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9026000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9027000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9027000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9028000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9028000 0x1000>;
+				status = "disabled";
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 2
+				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 3
+				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 4
+				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 1
+				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
-- 
2.25.1


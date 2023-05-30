Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A94EC7EE23
	for <linux-clk@archiver.kernel.org>; Tue, 30 May 2023 07:40:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbjE3HkK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 May 2023 03:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbjE3HjE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 03:39:04 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C286127
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 00:38:30 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f603ff9c02so27646055e9.2
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 00:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432310; x=1688024310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FE2GzTAQAamADs2IkId4bbtx4jEKIzlUpXDBW+Z7PSk=;
        b=cpT8kqGq/1CXoyY8S/D93smDoMCY7pfI5803gHEomPNLv1JW2Ymvl0BI5FFqWdx1QO
         JB+3UUVOJsBeSTvppDUijNszyNs3lCsGJZF+qSGoJobJ7WKM3DOTE7YPvXYlXZguPlTr
         OF/VyYpiUdinJEX65ZOz9I7YbtNcCG7HXraLvI0YsQiFJVLkQThIg4TW/cAqv50eLDIK
         15iWI4Lpfu0EcVDgPIFg4CNA3bZLdAp3Rn7EFdkX0vDP1fM6WZsOFEAw1T453F6ZZV4y
         Av+STk3U7c3TzGeOVji4AKLKpNHPEqjbkXVsgK5hYq6dkYsPlxtUXR5hTFjLLmT5S6y+
         Vdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432310; x=1688024310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FE2GzTAQAamADs2IkId4bbtx4jEKIzlUpXDBW+Z7PSk=;
        b=Neb4vOH+tfzHpvgZLyfyepdu0UvpXCNDhgcFvPwT65AZ/2NOW2KMOPbBohZZ8wOG2g
         BZhzuduDdiXTXbX14M98HO9RLaYvj8IrvRltbOdgsbHul7Q3zbIEKZXxFc8eatnvOQfJ
         IvZX/i7C70FdNLOTJ0lH2aJ98T6zVOYa8lJjBvJXGOkYg7OEsQ66Bc1o6QAE8n/E4Sx7
         xITyilIA0/R+pHqPtQckZ67dX+xHiPwt3JF6DvoKHova+FtKyUt3CI3EcUZg2uxDZTH7
         Lc2qRed2Ev/Ww176f85u9Y9GcExnHRYJhje9UpAY/EtKz/8ytrLB3nunlRrYZIbK644w
         oJug==
X-Gm-Message-State: AC+VfDxXPYgSgDujRq5e7S1S9tWsiNzC28vTBvlKbooUOAqvEkCiRn3Q
        YhqUR5chc+rDxh3PznMYNbhmtw==
X-Google-Smtp-Source: ACHHUZ5twmldHpBlAi32g5KLdl0EhTqocg7KERT++T1cs5k8vLrKMExWYTOkQxBURLYBPI0dLoxsoQ==
X-Received: by 2002:a5d:4acb:0:b0:309:3b8d:16a8 with SMTP id y11-20020a5d4acb000000b003093b8d16a8mr920169wrs.50.1685432310077;
        Tue, 30 May 2023 00:38:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:38:29 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 30 May 2023 09:38:15 +0200
Subject: [PATCH v5 14/17] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-14-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     "Lukas F. Hartmann" <lukas@mntre.com>,
        Nicolas Belin <nbelin@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3033;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/UfTcMxSgIsvwzBMxXSJJlgFXjkzr+CK8wUoWlj1xNI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafiT0we+6CO6c5N6Xq5y8TagHAvuLqF8e9bm7tN
 VnQONMWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn4gAKCRB33NvayMhJ0eqLEA
 CEhldpVtcYRcSTem9eNv+vOccezhv5jI/pVsuhGNLCY7YLCBhJFOtTHhJwa+d5lk9fbChK2KFX9QdR
 AOhbwa+ns+l1xn9eO7lcLQnepjWJX+yfOTqic4o/Mbxa3Zz+nD1Iijx65UXlk1XiCkCQ1fR7xNZrqs
 WA1bKaQfSrHtGjJChg7cDnTfrgKv/cSwvTG1SHw7Z9F3V5uzxEEuIi9mIlxuZhpqksBxlFm0PlML4j
 8ASQtdVxQXYveD9H/r5B8EPcuQgOJteUqLgiHNCMp1pB418cp5YYxHcB/G9WWvoBVYCl6rLD9OZ9Wr
 FjCJ2bKqeOZEX3ioAGa3Qvz5TXpSi2JsDwTvovO8xPJBmSXPYJmax5KiLjHlZGWZsqW/AwzvNreR7S
 HpUzLXSRCSwqOOyrwcvvGgbKi/5PLZQXuM4JYQ2+9aPuXtm43lQq8fq4swjKBjTjEzukO2zG1DVjva
 8T0ZQKqINz0LZXfnpL74b9UDvh68nZumkWC3x9JQoKU/69Qaywlt+Hm3RaFIYVJLpe/3ll83tcln7O
 OgZ7qqchqw91xhUYVPmZ/vfUYmjd/wqFSfeshPn0zusexxL1ntdfFce1bgPMU6l70ENs2iOLauOO+G
 Jslbls3Kwq9GEVcnbVRq15oKM9Vq1AhOB3PuSTfCrwU63uvgiIWuyMeaYZxQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the MIPI DSI Analog & Digital PHY nodes and the DSI control
nodes with proper port endpoint to the VPU.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 0c49655cc90c..e2d890e72940 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1662,9 +1662,28 @@ pwrc: power-controller {
 								       <250000000>,
 								       <0>; /* Do Nothing */
 					};
+
+					mipi_analog_dphy: phy {
+						compatible = "amlogic,g12a-mipi-dphy-analog";
+						#phy-cells = <0>;
+						status = "disabled";
+					};
 				};
 			};
 
+			mipi_dphy: phy@44000 {
+				compatible = "amlogic,axg-mipi-dphy";
+				reg = <0x0 0x44000 0x0 0x2000>;
+				clocks = <&clkc CLKID_MIPI_DSI_PHY>;
+				clock-names = "pclk";
+				resets = <&reset RESET_MIPI_DSI_PHY>;
+				reset-names = "phy";
+				phys = <&mipi_analog_dphy>;
+				phy-names = "analog";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
 			usb3_pcie_phy: phy@46000 {
 				compatible = "amlogic,g12a-usb3-pcie-phy";
 				reg = <0x0 0x46000 0x0 0x2000>;
@@ -2151,6 +2170,15 @@ hdmi_tx_out: endpoint {
 					remote-endpoint = <&hdmi_tx_in>;
 				};
 			};
+
+			/* DPI output port */
+			dpi_port: port@2 {
+				reg = <2>;
+
+				dpi_out: endpoint {
+					remote-endpoint = <&mipi_dsi_in>;
+				};
+			};
 		};
 
 		gic: interrupt-controller@ffc01000 {
@@ -2188,6 +2216,48 @@ gpio_intc: interrupt-controller@f080 {
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
+			mipi_dsi: mipi-dsi@7000 {
+				compatible = "amlogic,meson-g12a-dw-mipi-dsi";
+				reg = <0x0 0x7000 0x0 0x1000>;
+				resets = <&reset RESET_MIPI_DSI_HOST>;
+				reset-names = "top";
+				clocks = <&clkc CLKID_MIPI_DSI_HOST>,
+					 <&clkc CLKID_MIPI_DSI_PXCLK>,
+					 <&clkc CLKID_CTS_ENCL>;
+				clock-names = "pclk", "bit", "px";
+				phys = <&mipi_dphy>;
+				phy-names = "dphy";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+
+				assigned-clocks = <&clkc CLKID_MIPI_DSI_PXCLK_SEL>,
+					 <&clkc CLKID_CTS_ENCL_SEL>,
+					 <&clkc CLKID_VCLK2_SEL>;
+				assigned-clock-parents = <&clkc CLKID_GP0_PLL>,
+					 <&clkc CLKID_VCLK2_DIV1>,
+					 <&clkc CLKID_GP0_PLL>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					/* VPU VENC Input */
+					mipi_dsi_venc_port: port@0 {
+						reg = <0>;
+
+						mipi_dsi_in: endpoint {
+							remote-endpoint = <&dpi_out>;
+						};
+					};
+
+					/* DSI Output */
+					mipi_dsi_panel_port: port@1 {
+						reg = <1>;
+					};
+				};
+			};
+
 			watchdog: watchdog@f0d0 {
 				compatible = "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0xf0d0 0x0 0x10>;

-- 
2.34.1


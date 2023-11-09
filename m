Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AE510953
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lYOhOpEC"
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C1730D0
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 01:00:27 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507a62d4788so797628e87.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Nov 2023 01:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520426; x=1700125226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
        b=lYOhOpECaAJ68a1gxUGyCAClBnbLRWF29PnW3EgVn0bwb7MWfrZbu386UOIj8amulz
         MBG3kpgGYi+bgGSPy00Pj4v/H9Ow3Yp9W+UiCUmzShIcTwwSbHt4HIHlsJvBrbNv04f5
         8XB50YESHpeDclM+bvTXalgbDb4ECMZfbIGjCNpZDMvBjFmo/fxVLOaSuk/x0W60mXNf
         94OTtN7L4ECO8fVzQAUzp36Bc55H/dx2SrLNi9dW6EA8rcxAtT1cUdQ/OK+Ursk3zpJc
         8Z+VXPlx4nijS1rVk71I04ehY5oh12X/Qed3/KfKdwtfvH/mEj0R7TsQB9TQq4VATvff
         PoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520426; x=1700125226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
        b=QxuFKEj+xi5EAx/XBXZXjH2zlVledOm6tIgqyxOe/DnDENMcj6oRF4O54HF+xJdoi+
         OzX09QVW94FeCxIEKKPi3g3brvjPouA5g1w/h432qNfZ8DcaW3Hi8b4Xb6E8RHLqATBA
         wsdIRvcEATSqLB+anSKMUmUjzevEHkXQ1UNk8XRotvfSTlwRPmo40i298Golz5EZHsZS
         4SQx2Zce5Q3Hr4ysSQ/q3IuVM0ZDpIxSE6/lDV1owqUXcEicLWG7i2s/h4WQ8Z5IMkoL
         5NUXny1ezPBlgy098FWSXF3dy3bOh1b0XhsdKYQ8tTv0t01NyX/tygr0RS7d08bng8m3
         tf8w==
X-Gm-Message-State: AOJu0Yx+o9pFXwwrP22FzLVzf7z0cL5P3u5T3N7UiQ0GF+DYjBKx++rI
	5Z75kGL+odGH/AMOpjARgaxJuNu46lS+e1cHPnicC+jw
X-Google-Smtp-Source: AGHT+IFp6a7B+08Qs7kzVjwz5xE/v2ASX3jMKbrYx5nFLBXZBjgW+CvtIZunwhDWGP4a8erXu/q34g==
X-Received: by 2002:a05:6512:911:b0:507:f0f2:57bd with SMTP id e17-20020a056512091100b00507f0f257bdmr755918lft.66.1699520426132;
        Thu, 09 Nov 2023 01:00:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:11 +0100
Subject: [PATCH v8 10/12] arm64: meson: g12-common: add the MIPI DSI nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-10-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xeZV8gmIC9/2/oObVVqqYZ0sOhta5dqkacXris9lM8k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+ZCu6htgUtFxFaXFAKQp1sZxpR7+IzNQz6TU6c
 bVMpqCaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyfmQAKCRB33NvayMhJ0dbQD/
 9jQPYUo+YgcSZCmVFq6YmWrr0+Kkyas8OumKOcdeD3c0ym2NBiqCdKuAzkZ2V4+n2xhsTtSetTgXVs
 N67M8YGG8ZLEeTFicfNF1EcFgZeleWg8hoDnLQkSt4XUkTwREnBcFFy3QhCFhJDDU//OvvrA3CK9hC
 UHlbtR3s3qrRhPfgSpiLgvOLt/bnZIXlbe8OEfnjt4/FjgFIcZFjf+Li5y7Js2GG4GP0Y48uivqyKY
 V7vMXV+wFLbXkzHbn2lhoAhc2Xc23wIDPa3fL+VEp9fIFMwOt3dXeiFx+gmWmPB49Q7NCHxSUopXVo
 1+qpWPC3AfaWIEorcrnTiTu4fn32pxFQQNDozadRAb90jELPM7bwMKdJAc6WWKHt6fmR6j2cQAE351
 43dhzroLc9BQGz8wWt1kiKy8tKnmP3/zbTHFBdOi0gftwtDiqNKCYcSrbHupbSLDXttpUqHUd97LwS
 oE0nugHWLLZmqLAIhJJmce+XXrdupLYJrxduf/d/BPFYYoN85gPc7hB3ZDvXCWT9nYpIXzrQQ3G6Lf
 Tk+w5oteJ9HgbzOBX0eIGC1J9UpqjsDo/YVBgSqS99JYkRpTVp0htzv65jnKRB0Guy/Npmtxq6PGxV
 hUnf45HtzEj9BKucV52ykAekSH5w3RPphPUDNEsHfhyz8/dzMTzj4KRaykUA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the MIPI DSI Analog & Digital PHY nodes and the DSI control
nodes with proper port endpoint to the VPU.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index ff68b911b729..7300408262d5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1663,9 +1663,28 @@ pwrc: power-controller {
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
@@ -2152,6 +2171,15 @@ hdmi_tx_out: endpoint {
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
@@ -2189,6 +2217,48 @@ gpio_intc: interrupt-controller@f080 {
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
+			mipi_dsi: dsi@7000 {
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


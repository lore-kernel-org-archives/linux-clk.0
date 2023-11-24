Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VlbSWucM"
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C22791
	for <linux-clk@vger.kernel.org>; Fri, 24 Nov 2023 00:41:38 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40b27b498c3so12151595e9.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Nov 2023 00:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700815297; x=1701420097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
        b=VlbSWucMLCvNWAicDlJb5EbXGhpE3jfXDW5n8MPUYgVZxoaBbDY7oYSS7SzOZmidIb
         Q3bglJulZvY81kgGwHKq/MulIHGpoExqhyoMnzXelriF6UnF5ds0/BBgG2pf6T31kd9B
         btlLI6567NnzSQBP3ct0yYMIYhoxe4mhzv1Bw31Pm++sgmTlbjDoc6dOKT+lJvilmv01
         j58X8oc01PqgGNPobfl+Ba/0bh5c5NTT6tEiPrrOEZkrw+dvILWYP9alItce87OV40nu
         bhhXUP5Zt8p/vRGPKBgaEzpmpsURmZGJc3VWBfT4sWED7hzuAf2FpbS8ADDSOUYEL1h5
         MO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700815297; x=1701420097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
        b=hUwDiwzaRgkMzS7k/GnyPgIElWPbt40Qz20Xozco1aQ1SQ0ByLsX3XQ7tQwpXD5lAm
         RjTgaFHTEeulm3V5tfUDqgYgp8PkAr11C46GMyKptBqogKGrlUVHA1MvhQ1NAlqIk5UZ
         1VwRNittZJ/BUeWOVpyOobkVkgCGUNx2vTxmuEcpBFkYw7Asev9Dd/45z9UEcAi4rr55
         peuPO6aYwORSWZDAmVIlCgtnQX1v6+14uwAPeF5JWZF+ABKn4ZGajyQASTTONqfGd6l8
         wJfzAGs2h/fviJdJDVx3vAHJdeESjxMCFUAmfz20lu/PfZQbF6NAiToXXBbOlk//yHnV
         UrXg==
X-Gm-Message-State: AOJu0Yw7MRcT3JD2XpZXhILvpGHaPY4kLGjUfX3NBSGKrnjlV349KO7Y
	a2m7MmwcuDZK9SKHss9mWuYcRA==
X-Google-Smtp-Source: AGHT+IE2UZwrK/cWwh2rBEoUeFF98uKEtaA7VGpaEvV3hUAbSjxLyp4wCEN5Kmi6LYzxAyXCY0lmQg==
X-Received: by 2002:adf:fa85:0:b0:332:e650:dad8 with SMTP id h5-20020adffa85000000b00332e650dad8mr1476988wrr.17.1700815297315;
        Fri, 24 Nov 2023 00:41:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 00:41:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:21 +0100
Subject: [PATCH v9 10/12] arm64: meson: g12-common: add the MIPI DSI nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-10-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xeZV8gmIC9/2/oObVVqqYZ0sOhta5dqkacXris9lM8k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGxXEnizWSf7+B7ZodjJhE2lCrlnGpyxQU6g8T2
 sVrEwh2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhsQAKCRB33NvayMhJ0bhED/
 95+sFAipBUxjMeFLlGpWzaX+aaME314YyQy85iWqpiZSfTzIyk921PAf5/nQNjVMjWaMT9bcFyVmnC
 FYUT74aRBf8tx27OxN3+m40y2pVnIpPWDTcF0ekBk2Ii6SREBBVj0MXbgnlstPlamiGjK3CIUu0OU1
 FbuFRZazTjVe5x5FSc4h7zk6FwjemlqYl65SqHSCtdbCfOS1+vPHsb1pcSsKrWU59gbAw/5LivKxJ+
 NBv2BGqC3Em8uWoN6/XTIh+z3ToLktXvqE++ydJMjDTrdkxu1arhSfw32ZjafCMpCtCSwIl7WihPcX
 UxZj3JVxYfyrkgbVsYqnABrWZ/ixlYXKD6hCdBKZJFBs+GhGRnFZ/x3hMih6VUoovnrJTXZDzgCA+n
 /ru3vSAjKq2HXFlNWPAKZzGzBtkNUX5zwnBrO61/4s8Sy4lKNSX9rueZnAvNPRjL8BwhBtnvcG6Tvf
 2z2zzTC1oAFh1O4ZCe1Eut/J+I8JWsKg7UWdpavDsIz1tM4sTf76AQ/WLFze1cXHTr0lqhm8loXERC
 tdYnAsXCiHj5km2w7X+fj7Gg70xdzOe6zjiwdeBaSXvycF22X3dZvbD2l0HU+8fj3tTpORggJCNps4
 S4ASkJk+fCkHLMPIvP+zfyVCVk4d+lIdiJq21ZrA4X7InDu6EXUEvM+am9zQ==
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


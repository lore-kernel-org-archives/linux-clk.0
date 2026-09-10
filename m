Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236F84A014B;
	Thu, 10 Sep 2026 15:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053629; cv=none; b=IK/3rv4OvK4dSTFrWGNxkt0Uu/A/AMuSlO6cObShfdE9xc3IN0w/aYwq/L2xHvEkP+nmluxPsvVmW0lkPU3/2PH3RL1K7dLabhNtvJEV1JWLJLg9d++Z52pwObUSEn3otRIufJVwdDSUtoIqnBdNkryHBcpq8xDFEcWlvv8WcJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053629; c=relaxed/simple;
	bh=qaVLtP24eUQigpsXQ1uRih63mTqL4A2y+Pni/SWk3gs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZM0Fd16xlPxCAiTtQ0FefigtNPV6Mo88lotmqqmIPAbrltlHfkvFd4Dp/AKC3rursynupurPCm1J/sNVajHWM/cBda+nYczuOIu/9sjfvqmTBsDT1zNLUxaNtr23z0JPwo99T5n8aKMeNmAtmXdi5m9cMnoLkXKptVA6R6G67hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=zfxCzCRx; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="zfxCzCRx"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789053611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fMLzyvdCDhOp+LMAXMo33v6YgTadM1kq8Lfjv4tjsH8=;
	b=zfxCzCRxpsgEG1AjAnutkwMFKvd7iRH45PJsNk0Dy+mqADVvnFefwJquPyrOot9SkABRCM
	jaZjpQZyhKBCSAmcM4DFWZsU/eKXFfTy+ug9SVtC17DBjlg1YOPAgTGnUYXsyeL4b/teyt
	8+x/y3sOvq3TuFddB616qpGaR/nHDsXfkGsGAZhcuZ61sr5jJTY5Mein1r2oYriBa3ELyr
	7ucQ3fKNyXaApS43UrWsqVWYASv7DVvKMgme81/+gB8Hq15P5jCIrJOCOaFMezG4BHrQzr
	Vu438FaX8iHdStoMdMJq8tOgf5lOjJTkE6arpaHXnW+w23006731o1JJiivaog==
Date: Thu, 10 Sep 2026 17:19:07 +0200
Subject: [PATCH 2/2] arm64: dts: imx93-kontron: Add support for Kontron
 i.MX93 DL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-upstreaming-v7-3-imx93-displayline-v1-2-bb9446e6ed6e@kontron.de>
References: <20260910-upstreaming-v7-3-imx93-displayline-v1-0-bb9446e6ed6e@kontron.de>
In-Reply-To: <20260910-upstreaming-v7-3-imx93-displayline-v1-0-bb9446e6ed6e@kontron.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3435;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=2MoUiiYl7TgFn82k5cuGD2bvJWlqdJspTEKCJ86zaqY=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWvRqZViT9U8Lm1gjAv1zTzaq2L+omzz04+Oay1eTtrX0
 Lrs54RlHaUsDGJcDLJiiixS/Bavbc1ifeSPVUfBzGFlAhnCwMUpABM5vpbhn9K6RS5HtmU/M8g+
 4Ou1pKziTbfdhi1qm9flK6XoNz0Jnsjwv6DfLXTlaaY5McUpegY/WtZZB9XcCa2stFvmacx09PM
 NPgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Mikhail Vaniulin <mikhail.vaniulin@axians.rs>

This provides an overlay to enable the 7" LVDS panel on Kontron
i.MX93 DL devices.

Signed-off-by: Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../arm64/boot/dts/freescale/imx93-kontron-dl.dtso | 104 +++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf..2f0d3378c050 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -653,6 +653,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
+
+imx93-kontron-dl-dtbs += imx93-kontron-bl-osm-s.dtb imx93-kontron-dl.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-dl.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-dl.dtso b/arch/arm64/boot/dts/freescale/imx93-kontron-dl.dtso
new file mode 100644
index 000000000000..2d962823dfeb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-dl.dtso
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright (C) 2024 Kontron Electronics GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	model = "Kontron DL i.MX93 OSM-S";
+	compatible = "kontron,imx93-bl-osm-s", "kontron,imx93-osm-s", "fsl,imx93";
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&tpm3 3 50000 0>;
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <100>;
+	};
+
+	panel {
+		compatible = "jenson,bl-jt60050-01a", "panel-lvds";
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+		enable-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_vcc_panel>;
+		height-mm = <86>;
+		width-mm = <154>;
+
+		panel-timing {
+			clock-frequency = <50000000>;
+			hactive = <1024>;
+			hback-porch = <160>;
+			hfront-porch = <160>;
+			hsync-len = <1>;
+			vactive = <600>;
+			vback-porch = <23>;
+			vfront-porch = <12>;
+			vsync-len = <1>;
+		};
+
+		port {
+			panel_in_lvds0: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&gpio3 {
+	panel-rst-hog {
+		gpio-hog;
+		gpios = <26 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "panel-reset";
+	};
+
+	panel-stby-hog {
+		gpio-hog;
+		gpios = <27 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "panel-standby";
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_in_lvds0>;
+};
+
+&lpi2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	touchscreen@5d {
+		compatible = "goodix,gt928";
+		reg = <0x5d>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+		AVDD28-supply = <&reg_vcc_panel>;
+		VDDIO-supply = <&reg_vcc_panel>;
+		reset-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&media_blk_ctrl {
+	status = "okay";
+};
+
+&tpm3 {
+	status = "okay";
+};

-- 
2.55.0


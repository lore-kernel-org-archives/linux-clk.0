Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DE1CD80D7
	for <linux-clk@archiver.kernel.org>; Tue, 10 Oct 2023 13:27:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232287AbjJJN1U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Oct 2023 09:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbjJJN1S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Oct 2023 09:27:18 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D3EB7
        for <linux-clk@vger.kernel.org>; Tue, 10 Oct 2023 06:27:16 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9b275afb6abso1472544866b.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Oct 2023 06:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1696944435; x=1697549235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGLi6ZZ7hP8CWSEWm0V3dbJhp2/y5MlpYoiVN1v/31o=;
        b=G0/rVqXxwIE8cxASApycEOgZax435tWrG5/ASY092Ueb1n5qQqH+93FL7NFgNUEBfb
         zEfH6Ta6tEm45H/YYkPD97Ux/aARZh/DVG7G3Dzpe9dJVRpz4rNjpiMokPwDtU6Fk7n3
         gZC4FbmzySXZHuOJTu0Vp3JyzLenZXTLEZQcXLcM7r3aTHiE9OYjTjT/OZaW5J/8jn+n
         IZYhcxnW7YOem8I14ReHKLq8gpPKAs/FHayUFTJdYE/CKYnzcqLU9lOJEvZH+khWN55+
         WZ/ChejtBLEohDc9DSf/tNE/fpxOCscYsBEP81lvvszYxYXN+lz6L1PuUp5DAwdudkcT
         Qdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696944435; x=1697549235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGLi6ZZ7hP8CWSEWm0V3dbJhp2/y5MlpYoiVN1v/31o=;
        b=LSy/wY1TVP/X71mFbWKX6vhO+jZLaCj1822lshnpIQyli9hRZjYB/79Fec2erYFLj4
         wgN5UE+xNGlAX+0z+cXC620ydlOlIN7LTSGXv2vpsgG7H/5FGv5oscaMAO8om771H3i4
         7MCE06UD9rPpO/AGearvgXnjIH7YEPObQMTohLu21W1wKuRKMTgG34DmfLwhZdSO3H24
         4R5BQn9Xckg7Zs9yvPMXTA7dgbbNfK1U5L14m48J2AfOWlJYll4s5bmWje4f1EiP+dcM
         F00dc2gedDNHzBawBQy6ZHZ1LKEsmcBiUB+9OblsNksMAEtq8EmyWZtiEfjMU9Mrymbk
         k1dA==
X-Gm-Message-State: AOJu0YyFngK7bkrIa1vDiSHdr4sO3rBiSZM1oHZTR+VEuE2a+Z+9DqQN
        PEaYbWXM+aHwWKtbGEONUnqBQQ==
X-Google-Smtp-Source: AGHT+IFr74XPhv9uN8f/L3p77Agl9GMFi4mm0SUDWnrX4Ed7pMAHJnq65qYO02jiiFCU37DK+rwKYg==
X-Received: by 2002:a17:907:9491:b0:9a5:962c:cb6c with SMTP id dm17-20020a170907949100b009a5962ccb6cmr14152972ejc.31.1696944435109;
        Tue, 10 Oct 2023 06:27:15 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.152])
        by smtp.gmail.com with ESMTPSA id i16-20020a1709064ed000b0099bd0b5a2bcsm8526578ejv.101.2023.10.10.06.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 06:27:14 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 4/6] arm64: dts: renesas: rzg3s-smarc-som: Enable SDHI2
Date:   Tue, 10 Oct 2023 16:26:59 +0300
Message-Id: <20231010132701.1658737-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231010132701.1658737-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231010132701.1658737-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add SDHI2 to RZ/G3S Smarc SoM. SDHI2 pins are multiplexed with SCIF1, SSI3,
IRQ0. The selection b/w SDHI2 and SCIF1, SSI3, IRQ0 is done with a switch
button. To be able to select b/w these a compilation flag has been added
(SW_SD2_EN) at the moment being instantiated to select SDHI2.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 185ca8289a35..58a68356b9d7 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -13,14 +13,21 @@
  * @SW_SD0_DEV_SEL:
  *	0 - SD0 is connected to eMMC
  *	1 - SD0 is connected to uSD0 card
+ * @SW_SD2_EN:
+ *	0 - SCIF1, SSI3, IRQ0, IRQ1 connected to SoC
+ *	1 - SD2 is connected to SoC
  */
 #define SW_SD0_DEV_SEL	1
+#define SW_SD2_EN	1
 
 / {
 	compatible = "renesas,rzg3s-smarcm", "renesas,r9a08g045s33", "renesas,r9a08g045";
 
 	aliases {
 		mmc0 = &sdhi0;
+#if SW_SD2_EN
+		mmc2 = &sdhi2;
+#endif
 	};
 
 	chosen {
@@ -63,6 +70,24 @@ reg_1p8v: regulator1 {
 		regulator-always-on;
 	};
 #endif
+
+	vcc_sdhi2: regulator2 {
+		compatible = "regulator-fixed";
+		regulator-name = "SDHI2 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG2L_GPIO(8, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_3p3v: regulator3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &extal_clk {
@@ -100,6 +125,19 @@ &sdhi0 {
 };
 #endif
 
+#if SW_SD2_EN
+&sdhi2 {
+	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&vcc_sdhi2>;
+	vqmmc-supply = <&reg_3p3v>;
+	bus-width = <4>;
+	max-frequency = <50000000>;
+	status = "okay";
+};
+#endif
+
 &pinctrl {
 	sdhi0_pins: sd0 {
 		data {
@@ -139,4 +177,26 @@ sdhi0_emmc_pins: sd0-emmc {
 		       "SD0_CLK", "SD0_CMD", "SD0_RST#";
 		power-source = <1800>;
 	};
+
+	sdhi2_pins: sd2 {
+		data {
+			pins = "P11_2", "P11_3", "P12_0", "P12_1";
+			input-enable;
+		};
+
+		ctrl {
+			pins = "P11_1";
+			input-enable;
+		};
+
+		mux {
+			pinmux = <RZG2L_PORT_PINMUX(11, 0, 8)>, /* SD2_CLK */
+				 <RZG2L_PORT_PINMUX(11, 1, 8)>, /* SD2_CMD */
+				 <RZG2L_PORT_PINMUX(11, 2, 8)>, /* SD2_DATA0 */
+				 <RZG2L_PORT_PINMUX(11, 3, 8)>, /* SD2_DATA1 */
+				 <RZG2L_PORT_PINMUX(12, 0, 8)>, /* SD2_DATA2 */
+				 <RZG2L_PORT_PINMUX(12, 1, 8)>, /* SD2_DATA3 */
+				 <RZG2L_PORT_PINMUX(14, 1, 7)>; /* SD2_CD# */
+		};
+	};
 };
-- 
2.39.2


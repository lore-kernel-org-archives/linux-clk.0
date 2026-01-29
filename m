Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD03633CE85
	for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681821; cv=none; b=ITMo2MzdV5ZersyeZSlaS8EqEEm+A2U3xoKJeZkEBXG3ho9/1QrXdubfY/w7E3gJs90VbhIXA6i4em54x3IoDC+y2aK5Rrgk/la7SjgMQfIRQDguNLx/eCtjv3SQjMQCmP3nzdL+N7A+xbQk+NyZpAYxskCP7cKxXacIYLaEXQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681821; c=relaxed/simple;
	bh=pqS0iTnZy+TD7iR+ETY3i6A5U7dU6kE1UlBEw/91Vl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3j6I4x1+UucB+KlBNj7/e4F2ctOPI+B7CKFmu6GPlxKcF6wBy8q0U6Mze5sn/X8t0BOgq288Yo1gqDyudZrBU4GWF30fEPgd4Za4KiUVQvnQfF1GnixpWfP4xBW2nt4GAGvcs5J73kfyg1hEOtzs5TSpe2XTzbRTHsbAfrtqL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFpFXrpS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFpFXrpS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso6604835e9.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 02:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681817; x=1770286617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9LVqcaf1ijJnoQzqgdsz1n58Lr+Jp/HnhYJrE/7aVo=;
        b=iFpFXrpSa8KAf2guM8KgUqlm1ytElYjCvdI37uQ7u8sZs7K+yEt9uZwPVtLrXZVfox
         T7bta40U5Ksxk10svj3Q5d2wNyZIqyOBjXzuq7pVSaJO9aHJKiOYZ54tbZAI5GtNSh7Q
         c4XS6tSPj7D2XDcZV3sdjSuuDRA7b+DCx4H3aGMMxK+xs6eUBe8CCKYohpI4Lc3bdtVM
         7bNmkZn3I1Q0btDen6BVg4k4ATeA7TQceUGYHFyQ1yiDNMSWOydv8C5mGxeIKZ8BjEgE
         iBah2XQuuv1R1/Czhi2keTzwHuYZIgPSM1IeRv98pjx4xnJMoyQtTpaz6Dkkbjd3dBSL
         8zIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681817; x=1770286617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y9LVqcaf1ijJnoQzqgdsz1n58Lr+Jp/HnhYJrE/7aVo=;
        b=wJN0ZWH9wX5sypbF6rDihayakzGA+AquHIKhGqoFmqtKs6GQwMT61Xs6aDkepCB+/J
         8A/HJeLqYLbsIA8feeXZvZU5CwG1KSM3V46MbPJ1302cCYizYTIXheC47BakUJH5rbSc
         sGQ0JPxca5w514TXQF0hla/SrpPMRHBPRLpXHv/yC2unGDTBnQ1Ejytx7Vsz+nobPucp
         oVspyrYaMSHsoPbWHuKDmRBxD1zT6+MvjSv/eMjlADtjlK643yi4EyDX5dxj4L1S2i+v
         5LUhpBHY+0S7x2VLwPcJw+1KdlFub502FoKOUa2gG9y34G3Sic56B7dlY9Da8gvZ6eQK
         1G9w==
X-Forwarded-Encrypted: i=1; AJvYcCVBnoWcRyoyYfQ5eTw1Bn9gUm2jeaRnBzmsBwDFzVyjdFlwxqAx4CYfkAaH3R74wY/UwzrQhLjCI7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4MXINvXtPkWSueOKUxNuiOmbSOIlWudyrJgsqfR4J6fngyWP+
	eDAVjGRViuolXicnpquZXpBOKWnX/8Ig3T8KfyZke1tqZt/kWVeMzHAR
X-Gm-Gg: AZuq6aIgCvgAhei2dZxNi6D3XZESZ9ZlC7ZgingP4boQ3n7kYJ70afUMqdkuov8UkYR
	JT/LasxqQRq28+GdhhCGUerbZkp7BM+eewMNz8N1E602acWRIx+oY6EB/lQRl0cJDrJ+9SNN/z1
	ngtd1UXTtDtj8+zNRzbWaGX98yxkORFsO84mu11OkTa63i4Zwvytz73pbds5K4uYpFKlQFIIjLu
	lbBIxeCWSDzXYh2roL6O1pIoi8C+zSbF30EjXDoaPumd8ZlbzQxn3m2xZnh0tU/rIRo8b602fBB
	aZb5G+Vp+gDLlNhrIv9qQsDR2UQJfu4oVcRwp3AReTx7AEbchaAxgtxE2t+pLpLSsJKGev8FHhK
	x1jTJq/FjfG8795m+v5olHU+ohmclufnGaQhEClad3JfuxZZ+x9Yr7OclZlT+r7SdAN12vg90xZ
	xCaCruJKwU1gro2798
X-Received: by 2002:a05:600c:35cb:b0:471:700:f281 with SMTP id 5b1f17b1804b1-48069c7c492mr112018935e9.25.1769681816653;
        Thu, 29 Jan 2026 02:16:56 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:56 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 9/9] arm64: dts: renesas: rzg3l-smarc-som: Enable eth1 (GBETH1) interface
Date: Thu, 29 Jan 2026 10:16:44 +0000
Message-ID: <0d5ca20911357441cac914819da98b2a753f4f31.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable the Gigabit Ethernet Interface (GBETH1) populated on the RZ/G3L
SMARC EVK. Also add pincontrol definitions for GBETH{0,1}.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  1 +
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 2f918830b8f1..58733016b66b 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -14,6 +14,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
 #include "r9a08g046l48.dtsi"
 #include "rzg3l-smarc-som.dtsi"
 #include "renesas-smarc2.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index f52af01a7eff..0b9bb073c282 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -10,6 +10,7 @@ / {
 
 	aliases {
 		ethernet0 = &eth0;
+		ethernet1 = &eth1;
 	};
 
 	memory@48000000 {
@@ -23,6 +24,8 @@ &eth0 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
 
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -30,6 +33,19 @@ &eth0_rxc_rx_clk {
 	clock-frequency = <125000000>;
 };
 
+&eth1 {
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-0 = <&eth1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&eth1_rxc_rx_clk {
+	clock-frequency = <125000000>;
+};
+
 &extal_clk {
 	clock-frequency = <24000000>;
 };
@@ -53,3 +69,79 @@ phy0: ethernet-phy@7 {
 		txd3-skew-psec = <0>;
 	};
 };
+
+&mdio1 {
+	phy1: ethernet-phy@7 {
+		compatible = "ethernet-phy-id0022.1640",
+			     "ethernet-phy-ieee802.3-c22";
+		reg = <7>;
+		rxc-skew-psec = <1400>;
+		txc-skew-psec = <1400>;
+		rxdv-skew-psec = <0>;
+		txdv-skew-psec = <0>;
+		rxd0-skew-psec = <0>;
+		rxd1-skew-psec = <0>;
+		rxd2-skew-psec = <0>;
+		rxd3-skew-psec = <0>;
+		txd0-skew-psec = <0>;
+		txd1-skew-psec = <0>;
+		txd2-skew-psec = <0>;
+		txd3-skew-psec = <0>;
+	};
+};
+
+&pinctrl {
+	eth0_pins: eth0 {
+		txc {
+			pinmux = <RZG3L_PORT_PINMUX(B, 1, 1)>;  /* ETH0_TXC_REF_CLK */
+			power-source = <1800>;
+			output-enable;
+			drive-strength-microamp = <5200>;
+		};
+
+		ctrl {
+			pinmux = <RZG3L_PORT_PINMUX(A, 1, 1)>, /* MDC */
+				 <RZG3L_PORT_PINMUX(A, 0, 1)>, /* MDIO */
+				 <RZG3L_PORT_PINMUX(C, 2, 1)>, /* PHY_INTR */
+				 <RZG3L_PORT_PINMUX(C, 1, 1)>, /* RXD3 */
+				 <RZG3L_PORT_PINMUX(C, 0, 1)>, /* RXD2 */
+				 <RZG3L_PORT_PINMUX(B, 7, 1)>, /* RXD1 */
+				 <RZG3L_PORT_PINMUX(B, 6, 1)>, /* RXD0 */
+				 <RZG3L_PORT_PINMUX(B, 0, 1)>, /* RXC */
+				 <RZG3L_PORT_PINMUX(A, 2, 1)>, /* RX_CTL */
+				 <RZG3L_PORT_PINMUX(B, 5, 1)>, /* TXD3 */
+				 <RZG3L_PORT_PINMUX(B, 4, 1)>, /* TXD2 */
+				 <RZG3L_PORT_PINMUX(B, 3, 1)>, /* TXD1 */
+				 <RZG3L_PORT_PINMUX(B, 2, 1)>, /* TXD0 */
+				 <RZG3L_PORT_PINMUX(A, 3, 1)>; /* TX_CTL */
+				 power-source = <1800>;
+		};
+	};
+
+	eth1_pins: eth1 {
+		txc {
+			pinmux = <RZG3L_PORT_PINMUX(E, 1, 1)>;  /* ETH1_TXC_REF_CLK */
+			power-source = <1800>;
+			output-enable;
+			drive-strength-microamp = <5200>;
+		};
+
+		ctrl {
+			pinmux = <RZG3L_PORT_PINMUX(D, 1, 1)>, /* MDC */
+				 <RZG3L_PORT_PINMUX(D, 0, 1)>, /* MDIO */
+				 <RZG3L_PORT_PINMUX(F, 2, 1)>, /* PHY_INTR */
+				 <RZG3L_PORT_PINMUX(F, 1, 1)>, /* RXD3 */
+				 <RZG3L_PORT_PINMUX(F, 0, 1)>, /* RXD2 */
+				 <RZG3L_PORT_PINMUX(E, 7, 1)>, /* RXD1 */
+				 <RZG3L_PORT_PINMUX(E, 6, 1)>, /* RXD0 */
+				 <RZG3L_PORT_PINMUX(E, 0, 1)>, /* RXC */
+				 <RZG3L_PORT_PINMUX(D, 2, 1)>, /* RX_CTL */
+				 <RZG3L_PORT_PINMUX(E, 5, 1)>, /* TXD3 */
+				 <RZG3L_PORT_PINMUX(E, 4, 1)>, /* TXD2 */
+				 <RZG3L_PORT_PINMUX(E, 3, 1)>, /* TXD1 */
+				 <RZG3L_PORT_PINMUX(E, 2, 1)>, /* TXD0 */
+				 <RZG3L_PORT_PINMUX(D, 3, 1)>; /* TX_CTL */
+				 power-source = <1800>;
+		};
+	};
+};
-- 
2.43.0


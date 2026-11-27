Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795811;
	b=S60pVRbfTT6LfXv7x+siuKy0xMv0Rs8XUGckFmdXifaUrnhUFw4VBFKAf3wRLLcmsPsg
	 hPD+MUOLcyvSgxkCZFMNsJGAF1cFB7/PdtFd4uju06pjF65beCMqe/yY5mZ8LML7lH50g
	 uUe9hbB/fwwXptQhXi8mZLqbwgVjA32Hz1kPr14mC/FOSRUOFJ4wU5FudTszsE/lhmMPZ
	 E6HmVrsKyNKqQX/uLNmnRN+/VN0Up8yUaV61y194C7RnbTIoTbVyjEgQ4GFHSKu9HJiwC
	 h667cdeesq/gdLSfb6A1i4BatASEa5/nzYh+tPEzekWUVulyApvZoRuGuwo3I5Kmm3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795811;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=M2cfdir0g2ZOuv3RqeLC/CgMql5c3ZeNh/nVLiJgggg=;
	b=0pD3xvWuKnSvEu+N2PhTp++8Ece2KBLkFzDLQ4xRnwkoma/JKPhiz0B0UdFWpT6UPXN6
	 F2Hk1qnztf8EmPN6YW6hZ1lRmBpD0xF88m30yQLUZx6x0qZUTAAKFLUDPfumEa7bhbpsJ
	 mauNAui/jmhM0OY/bUnEeMzZ0y5xZZU7CQkj2y8i5LAshK1w4VCt5I9rM9GVnbQNLhhUy
	 lvD2o6FAw+Q5GlhCifaES5fT9fXouPsOaeP86zv10azaE5djCYQCP0mhvOTCIvOAyHJ6M
	 oHZvBYRcwmHhyJnNfkfsgSOS2te3HcP5lf/+iFRN2HAdZh21pGMDlTeeknh9l/wnRmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bdMMPKFA;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AD6606A31E;
	Fri, 27 Nov 2026 16:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40AD6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bdMMPKFA
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E6A224E417CA;
	Fri, 27 Nov 2026 16:10:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC26F6049C;
	Fri, 27 Nov 2026 16:10:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F03C111E90D06;
	Fri, 27 Nov 2026 17:10:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795795808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M2cfdir0g2ZOuv3RqeLC/CgMql5c3ZeNh/nVLiJgggg=;
	b=bdMMPKFA79XLnJCJBNPu4m+0WYvuy9pFGUgQKwWqGzp/CYYm21onyAyP1GbNT6nQQ49pKq
	m+7uqXoTaN0QUJ2WvH0yg/HeQrhzs/xXor6sixczZWQxY1wIW2yyCSFluOjYlP/ImUzlnH
	ceGTEeNDasTlfYRncjp3EkSdAJJCn3IenOLnB2/O+pkZalQ3cUv9x6DZWQaRygFD/bn3Wl
	WhH5sg3e1U7BLDlePRBAmTgQiS4HWlFExZnmMZtK5XtsKzpWgcsIpiMEqLqe6uRxFjAs7V
	bvBRyOwXVDpKAMZwe3paK03m24dKj8S5riNeDy1kVGBcmpSYR7pZ3WHIyMjfHw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 27 Nov 2026 17:09:52 +0100
Subject: [PATCH 4/4] MIPS: mobileye: dts: eyeq6h: add I2C controllers
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-b4-eyeq6h-i2c-v1-4-d3232984fe83@bootlin.com>
References: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
In-Reply-To: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add the four EyeQ6H I2C controllers. Enable I2C3 on the EPM6 board and
the on-board TMP101 sensor. It also allowed I2C testing.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts | 12 +++++
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi     | 68 +++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
index c0e1de2bb5a0e..f3448252d728c 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
+++ b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
@@ -20,3 +20,15 @@ memory@0 {
 		reg = <0x1 0x00000000 0x1 0x00000000>;
 	};
 };
+
+&i2c3 {
+	clock-frequency = <400000>;
+	i2c-transfer-timeout-us = <100000>;
+
+	status = "okay";
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp101";
+		reg = <0x48>;
+	};
+};
diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
index dd0f1c7483180..cc5ecd63df07c 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
@@ -13,6 +13,10 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
 	};
 
 	xtal: clock-30000000 {
@@ -79,6 +83,38 @@ uart0: serial@d3331000 {
 			clock-names = "uartclk", "apb_pclk";
 		};
 
+		i2c0: i2c@d3333000 {
+			compatible = "mobileye,eyeq6h-i2c", "arm,primecell";
+			reg = <0x0 0xd3333000 0x0 0x1000>;
+			interrupts = <GIC_SHARED 37 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&olb_west EQ6HC_WEST_I2C_SER>,
+				 <&olb_west EQ6HC_WEST_PER_OCC>;
+			clock-names = "i2cclk", "apb_pclk";
+			resets = <&olb_west 5>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+		};
+
+		i2c1: i2c@d3334000 {
+			compatible = "mobileye,eyeq6h-i2c", "arm,primecell";
+			reg = <0x0 0xd3334000 0x0 0x1000>;
+			interrupts = <GIC_SHARED 38 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&olb_west EQ6HC_WEST_I2C_SER>,
+				 <&olb_west EQ6HC_WEST_PER_OCC>;
+			clock-names = "i2cclk", "apb_pclk";
+			resets = <&olb_west 6>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+		};
+
 		pinctrl_west: pinctrl@d3337000 {
 			compatible = "pinctrl-single";
 			reg = <0x0 0xd3337000 0x0 0xb0>;
@@ -96,6 +132,38 @@ olb_west: system-controller@d3338000 {
 			clock-names = "ref";
 		};
 
+		i2c2: i2c@d3353000 {
+			compatible = "mobileye,eyeq6h-i2c", "arm,primecell";
+			reg = <0x0 0xd3353000 0x0 0x1000>;
+			interrupts = <GIC_SHARED 39 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&olb_east EQ6HC_EAST_I2C_SER>,
+				 <&olb_east EQ6HC_EAST_PER_OCC>;
+			clock-names = "i2cclk", "apb_pclk";
+			resets = <&olb_east 5>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+		};
+
+		i2c3: i2c@d3354000 {
+			compatible = "mobileye,eyeq6h-i2c", "arm,primecell";
+			reg = <0x0 0xd3354000 0x0 0x1000>;
+			interrupts = <GIC_SHARED 40 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&olb_east EQ6HC_EAST_I2C_SER>,
+				 <&olb_east EQ6HC_EAST_PER_OCC>;
+			clock-names = "i2cclk", "apb_pclk";
+			resets = <&olb_east 6>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+		};
+
 		pinctrl_east: pinctrl@d3357000 {
 			compatible = "pinctrl-single";
 			reg = <0x0 0xd3357000 0x0 0xb0>;

-- 
2.53.0


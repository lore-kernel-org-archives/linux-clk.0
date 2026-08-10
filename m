Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6493F1AB7;
	Mon, 10 Aug 2026 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364202; cv=none; b=Qh5qDPH2IEzqifhYq2pAZP7nCQx2bDtNPvIPk6+W8on5kY7hRWdb+LvGzRzH6x3G+hBwpu7Y+ul4m9zgZFoMk+zYHMLLcbyvpiijj2EzoBthtpHd2n1fNY3nSiGK4OzASc6KocBx46VC7Oe6y1q/mfhJgzsnpfQj0tzr8RNgKCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364202; c=relaxed/simple;
	bh=5T/RgXnHHK3myJWdBsYk4LYGHqbI09TkFKPeTwOpLGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjSfL7ttnbct7muU5MJFg1ROhw36EBvRECLw5ZY5Y0IOnhSIJPJ1xikS/AsdAOSId6pvSArkv+GxOQONaSJo9Fgvyfb4HJsly7gJ96PPou1GAK+f4+Do6wxHwMXI3V4xXelD/SBglGFGB7Jz2LSFGpfCsOod3aHYYy9N1aotNuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=a7PyVENF; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="a7PyVENF"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 820D4C0514;
	Mon, 10 Aug 2026 15:16:37 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364198; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kn221FDOcVW/vtJXVqj4m4sWcXwUTAwENBaWLbgbIbw=;
	b=a7PyVENFaH2HN71sVwO4XD1+ej1znLtCwGJIJojakVvCll3nvzOQzFGw5XPyzUocE1G7xS
	Vsa3FywK6Nfc4Ojh++/FUkWzRnwRKY4ttmOsSaG3DL+ngJkBJLLDXrRXh5kl8pBo1H8uhn
	5NsTevWZACBzA5RuT+8KxWA39nqTiClOdJDeTpd7qG+3nhZlBHHBMewjWq+l+5xNXO52IH
	EqT+AedNJO+ouxeVF01tIBSwyW+f6yCmx6auSqkjz2ZFTc2op7zoFIXjrkq+nlrlyJ+ccs
	NW4xVQ9sV3kP8BO3bQ0+A82cz8aU6HGCkG9cFc8ondVy/seoAQ+qbSi+EZhCqQ==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 25/25] ARM: dts: rockchip: Add PWM nodes for RV1106
Date: Mon, 10 Aug 2026 15:11:16 +0300
Message-ID: <20260810121121.210040-26-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add the 12 PWM controller nodes (pwm0-pwm11) for RV1106, along with
their aliases.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>

---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 159 +++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 12e87d25c72b..d7959158f8a0 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -30,6 +30,18 @@ aliases {
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
+		pwm0 = &pwm0;
+		pwm1 = &pwm1;
+		pwm2 = &pwm2;
+		pwm3 = &pwm3;
+		pwm4 = &pwm4;
+		pwm5 = &pwm5;
+		pwm6 = &pwm6;
+		pwm7 = &pwm7;
+		pwm8 = &pwm8;
+		pwm9 = &pwm9;
+		pwm10 = &pwm10;
+		pwm11 = &pwm11;
 		spi0 = &spi0;
 		spi1 = &spi1;
 	};
@@ -189,6 +201,104 @@ i2c1: i2c@ff320000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@ff350000 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff350000 0x10>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm0m0_pins>;
+			clocks = <&cru CLK_PWM0_PERI>, <&cru PCLK_PWM0_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm1: pwm@ff350010 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff350010 0x10>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm1m0_pins>;
+			clocks = <&cru CLK_PWM0_PERI>, <&cru PCLK_PWM0_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm2: pwm@ff350020 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff350020 0x10>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm2m0_pins>;
+			clocks = <&cru CLK_PWM0_PERI>, <&cru PCLK_PWM0_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm3: pwm@ff350030 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff350030 0x10>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm3m0_pins>;
+			clocks = <&cru CLK_PWM0_PERI>, <&cru PCLK_PWM0_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm4: pwm@ff360000 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff360000 0x10>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm4m0_pins>;
+			clocks = <&cru CLK_PWM1_PERI>, <&cru PCLK_PWM1_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm5: pwm@ff360010 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff360010 0x10>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm5m0_pins>;
+			clocks = <&cru CLK_PWM1_PERI>, <&cru PCLK_PWM1_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm6: pwm@ff360020 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff360020 0x10>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm6m0_pins>;
+			clocks = <&cru CLK_PWM1_PERI>, <&cru PCLK_PWM1_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm7: pwm@ff360030 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff360030 0x10>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm7m0_pins>;
+			clocks = <&cru CLK_PWM1_PERI>, <&cru PCLK_PWM1_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
 		gpio0_ioc: syscon@ff388000 {
 			compatible = "rockchip,rv1106-gpio0-ioc", "syscon";
 			reg = <0xff388000 0x8000>;
@@ -304,6 +414,55 @@ i2c4: i2c@ff470000 {
 			status = "disabled";
 		};
 
+		pwm8: pwm@ff490000 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff490000 0x10>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm8m0_pins>;
+			clocks = <&cru CLK_PWM2_PERI>, <&cru PCLK_PWM2_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm9: pwm@ff490010 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff490010 0x10>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm9m0_pins>;
+			clocks = <&cru CLK_PWM2_PERI>, <&cru PCLK_PWM2_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm10: pwm@ff490020 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff490020 0x10>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm10m0_pins>;
+			clocks = <&cru CLK_PWM2_PERI>, <&cru PCLK_PWM2_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
+		pwm11: pwm@ff490030 {
+			compatible = "rockchip,rv1106-pwm", "rockchip,rk3328-pwm";
+			reg = <0xff490030 0x10>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			#pwm-cells = <3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pwm11m0_pins>;
+			clocks = <&cru CLK_PWM2_PERI>, <&cru PCLK_PWM2_PERI>;
+			clock-names = "pwm", "pclk";
+			status = "disabled";
+		};
+
 		uart0: serial@ff4a0000 {
 			compatible = "rockchip,rv1106-uart", "snps,dw-apb-uart";
 			reg = <0xff4a0000 0x100>;
-- 
2.47.3


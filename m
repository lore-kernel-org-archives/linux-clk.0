Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88013E3166;
	Mon, 10 Aug 2026 12:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364170; cv=none; b=CKsF+Zcr7dvm8VrORBhAvha2D5rSTaEPyBNLsxdrU1Uhq5pYa5ON3fPEs8ki5ZAH7z0Y7mAFiAuP1jupLYnpUq4icEHMR4S5uCgP7innzY9P2BekQBcG9SCRRB3nScvmnsUjWWkSZfdMXWXK2qh7jVlAAW9MuGtPf7skuf3x25U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364170; c=relaxed/simple;
	bh=35jxSxXms7xlHnkMfDcTwH+OoyM5QeqxevVg1cD6bC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVMloBrojW3JzC9/kk6uC9Wxr8YdZ/U1slZJapx5hqUGAGV20l0LtqwjbQOd1j0ultHIUbzUTaNbLpVd+NiX+2e0vTJ4qK0/dAvoE5F8ITaBYO1kEP5j+bj004tJUN039+7EF+V1SqZYEgc+/yBQ8DdPdXKiJzjkWYIjCbO9A6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=ZiAL5w2U; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="ZiAL5w2U"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6506BC0519;
	Mon, 10 Aug 2026 15:16:05 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364166; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y9l5G6RkfJNGl6CnVwssyReWh7AHu+6IehUiBWk/o3A=;
	b=ZiAL5w2Ugmi20YSJg6mtqwFHgXOxL4/kYEDiVU/y3GghFCCs4p5DncpBLmVIRK4xA7Fohm
	vfho6lQLJJZqlTsZG4LkyEb8HvY/5sUttyFKPtr1ZTCLhEaaM4wk1nHM93xQ8TsmaYm9mc
	C8SfJUVp0lhWQ53GpKa5Ps8ai5SAbRS2dEc/AF3drcrHgcUKkHPXI42Z2m7J9mMOx+sd0R
	fvKiJejwy8YXO7ItjtjqL0dXDi+sfqs/XvcXo5zyH45gMvlBeFIxcRJENxnX3bL2bc65lr
	mnBdPfTFV0OzUlJbP1NDIUU5yZ3QsFSb+0Tvg88YP+DJlqjVNEDp03pENpR1Nw==
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
Subject: [PATCH 12/25] ARM: dts: rockchip: Add I2C nodes for RV1106
Date: Mon, 10 Aug 2026 15:11:03 +0300
Message-ID: <20260810121121.210040-13-vlad@zlab.su>
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

Rockchip RV1106 has five I2C controllers. Add the i2c0-i2c4 nodes
together with their aliases, using the m0 pinmux by default.

All nodes default to status = "disabled" and are enabled per-board.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 70 ++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 43db3b1dd4b8..43d992e3e2d6 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -25,6 +25,11 @@ aliases {
 		gpio2 = &gpio2;
 		gpio3 = &gpio3;
 		gpio4 = &gpio4;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
 	};
 
 	cpus {
@@ -155,6 +160,32 @@ gic: interrupt-controller@ff1f0000 {
 			#address-cells = <0>;
 		};
 
+		i2c0: i2c@ff310000 {
+			compatible = "rockchip,rv1106-i2c", "rockchip,rk3399-i2c";
+			reg = <0xff310000 0x1000>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cru CLK_I2C0>, <&cru PCLK_I2C0>;
+			clock-names = "i2c", "pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0m0_xfer>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@ff320000 {
+			compatible = "rockchip,rv1106-i2c", "rockchip,rk3399-i2c";
+			reg = <0xff320000 0x1000>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
+			clock-names = "i2c", "pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1m0_xfer>;
+			status = "disabled";
+		};
+
 		gpio0_ioc: syscon@ff388000 {
 			compatible = "rockchip,rv1106-gpio0-ioc", "syscon";
 			reg = <0xff388000 0x8000>;
@@ -204,6 +235,45 @@ u2phy_otg: otg-port {
 			};
 		};
 
+		i2c2: i2c@ff450000 {
+			compatible = "rockchip,rv1106-i2c", "rockchip,rk3399-i2c";
+			reg = <0xff450000 0x1000>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
+			clock-names = "i2c", "pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c2m0_xfer>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@ff460000 {
+			compatible = "rockchip,rv1106-i2c", "rockchip,rk3399-i2c";
+			reg = <0xff460000 0x1000>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
+			clock-names = "i2c", "pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3m0_xfer>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@ff470000 {
+			compatible = "rockchip,rv1106-i2c", "rockchip,rk3399-i2c";
+			reg = <0xff470000 0x1000>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cru CLK_I2C4>, <&cru PCLK_I2C4>;
+			clock-names = "i2c", "pclk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c4m0_xfer>;
+			status = "disabled";
+		};
+
 		uart0: serial@ff4a0000 {
 			compatible = "rockchip,rv1106-uart", "snps,dw-apb-uart";
 			reg = <0xff4a0000 0x100>;
-- 
2.47.3


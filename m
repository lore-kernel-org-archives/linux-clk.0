Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793876828;
	b=3UWVi+g3Lgj/vJjd4cHQ2d+TEqeAdLVdH7ZWdbdo9Oaol4NiwU3U7DrASBeVD5XN5koG
	 YsbAleikWoZt3mjhBF5ajsOZObeOzk5W5d9ez8ebVaPrRGZkZoqi/S0hkvEqo17Y8ojfX
	 5kjXNLQ2/pz74rnLMN7VBdHGQ0nafwjeXwvmNObjiYkPWl4Vgu4I9OTb73JWe/U8XhRo8
	 US7lJNPTDLRLoEUwSiDs9CeLIAi8YUaF0/rKmH9/wKE6m09zZ81JIHBnSe8vhyHw+j4H3
	 8/tl3ljWc9vYsU00vS5UjufSDHam9D9xI73wQuw5r7GoMywC8WrNVgaXh/EK+X4Ap8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876828;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ObLTUE4xToVrL76t6SQzh//oCgTM1txbp8jyCtXcgm8=;
	b=krezU4xkVkUoFyjR++wKq9FFU2Ix2dHmkfXWYAFOjBJzzoUc478ZKQgJJOqpAHOvQ3le
	 ngk23T/RX6mgFIAVQT2etmtXWmYV/dDwZ6f97l93cFlM7xnWZTVZk5LYcN30zOqvYuM0H
	 Qhs3jJ8OaQwr28SQfKY6YhwY6EvzIyg+ptiaeFA5p6ke/VlgkDlFHF2mGWQpU2HycNGzZ
	 HyCGxhItfIOylhIsg792g4pcJDl3r+can7n0thJlddhNOnkK7eUcIVX30NZobRJV+95QR
	 73npMu5Rt0bBJf8J6B6LanLsdiBSsj/044zc+bUhmBhbn53IbXsWKq5X09bPeMpEzoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nxBqbRfa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2420F606D802;
	Thu,  5 Nov 2026 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nxBqbRfa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793876827;
	b=gq5Zu8/ZIjDSzrqRDpr0WwfvgQ5mkUXZbh/JE62ArmaDWcU0LvXX74vj6/QtpJIQ1mUs
	 YOwDHqPeR603VXo1NTdg7IUVGezwrvyuO3tGOkAzGyIB2EQaXuIbHERyABZkqFZNNyr6a
	 oUGvlLK0Kd+Majq5gSzBJCr1SO4lpAhKkNhrO9X/l+8YHmQMfmf9QGTsHkB+xCJMzV+Cz
	 R45IP5sdk/DsIECg3JzXNhyrMjdxFwAR3t6DepZddozJVdyXKN6QaLVYMQ7yU7fIpgSm/
	 zeQxtnTZczHlbOvt014Vq21kn7EtByBPmxfTbnLNKgcT3zhjAPEavuZpe/gnaxsBchA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793876827;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ObLTUE4xToVrL76t6SQzh//oCgTM1txbp8jyCtXcgm8=;
	b=gXrqp6pLXMR13j76euetZMSdFirig5PGf5PmuB7PAdlSZZLbwaMv8o6NsKUlXePCAHbp
	 GxOQzSJRdM+YuH2odDuw+eICxgyHYhA4Z76EHZrdfuxX6NuCsDkW5Ac7120QQN4sB6Itp
	 +j6w/kgq4kjM3V2fIk8aKUakEzmtqBc4Tsx07n0sYMevh3cHwxRwAV00TRaTvjjUTT1oI
	 tmfOM4qT2J+qGe2gqe/Z5fo2BEFQH68tehD+6XuYTv+5qkwlnOuJ1C/t1zVIg90Xw2G2f
	 ETRjxn4nR1xx5jLoKzwoIOnZRLdavIhShwKitioUKtEEHIGdMkwrkPgvH/GrTRIDhOw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E71521F00A15;
	Thu,  5 Nov 2026 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793876827;
	bh=ObLTUE4xToVrL76t6SQzh//oCgTM1txbp8jyCtXcgm8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nxBqbRfatJkDVLLKevGBVnzw761oqNcLDVUN8XVAO/qfobvW3jjB3ZrSZXGm579ih
	 pzkdZ9OsQhzr4/TFNqakhteIhc0+K406zMycwOimTR1PVroirv+mBhhYzeYNR+PELF
	 S446rru1rPBIJyafRs3+3DsO1//t5EgLZP6EqPW2M8Tc8OCWzSFMWXum+fqyboEH8i
	 3S5izhF1Rt3zZuhE2T/zaa8YzTbbKirhzNT7rDrhyPLGe8Z/R1EHh2OsYQF+a0sTvZ
	 lOA6Vl9wTsm8a4tOgskzvNJo81qs0sFuxAVUY4ZAy4Tm+KUv2ZVmKlK3JLUFkeDusL
	 E5rR8cBHW89RA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 73BC44720F;
	Thu,  5 Nov 2026 11:07:05 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 05 Nov 2026 19:06:38 +0800
Subject: [PATCH v11 4/5] arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK
 DT
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
Message-Id: <20261105-cv75-soc-v11-4-aa6ee0b2380d@ambarella.com>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
In-Reply-To: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793876823; l=8107;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=DEAMc2vofaBUV896UxD87q9HiCotMrVdpC7L4SePgqQ=;
 b=RFqsiLUsoFkZG7dIrltmFex48Lli+4fBXlzQWfFYVCqxoJKAF1Owb9MeqlPjCqqqqIuvH1T8T
 tfYDYep+TV+CD14oeYyTVlFUjevRhRbmHT/koeoroT6Us3aquGTwybn
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Enable ARCH_AMBARELLA and add a minimal CV75 SoC / EVK device tree for
console bring-up with the RCT clocks, UART, pinctrl and GPIO banks.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 arch/arm64/Kconfig.platforms               |   6 +
 arch/arm64/boot/dts/Makefile               |   1 +
 arch/arm64/boot/dts/ambarella/Makefile     |   3 +
 arch/arm64/boot/dts/ambarella/cv75-evk.dts |  30 +++++
 arch/arm64/boot/dts/ambarella/cv75.dtsi    | 177 +++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig               |   1 +
 6 files changed, 218 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac73003..16d7e3a4c2d6 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -26,6 +26,12 @@ config ARCH_SUNXI
 	help
 	  This enables support for Allwinner sunxi based SoCs like the A64.
 
+config ARCH_AMBARELLA
+	bool "Ambarella SoC family"
+	select PINCTRL
+	help
+	  This enables support for the ARM64 based Ambarella SoCs like CV75.
+
 config ARCH_ALPINE
 	bool "Annapurna Labs Alpine platform"
 	select ALPINE_MSI if PCI
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index fc726b215f12..f1709eb5d915 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -4,6 +4,7 @@ subdir-y += airoha
 subdir-y += allwinner
 subdir-y += altera
 subdir-y += amazon
+subdir-y += ambarella
 subdir-y += amd
 subdir-y += amlogic
 subdir-y += apm
diff --git a/arch/arm64/boot/dts/ambarella/Makefile b/arch/arm64/boot/dts/ambarella/Makefile
new file mode 100644
index 000000000000..ddca3d7b18cc
--- /dev/null
+++ b/arch/arm64/boot/dts/ambarella/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_AMBARELLA) += cv75-evk.dtb
diff --git a/arch/arm64/boot/dts/ambarella/cv75-evk.dts b/arch/arm64/boot/dts/ambarella/cv75-evk.dts
new file mode 100644
index 000000000000..42a0fe24b83b
--- /dev/null
+++ b/arch/arm64/boot/dts/ambarella/cv75-evk.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Ambarella CV75 EVK board
+ */
+
+/dts-v1/;
+
+#include "cv75.dtsi"
+
+/ {
+	model = "Ambarella CV75 EVK Board";
+	compatible = "ambarella,cv75-evk", "ambarella,cv75";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = &uart0;
+	};
+
+	memory@200000 {
+		device_type = "memory";
+		reg = <0x0 0x00200000 0x0 0x07e00000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ambarella/cv75.dtsi b/arch/arm64/boot/dts/ambarella/cv75.dtsi
new file mode 100644
index 000000000000..c36b6af48237
--- /dev/null
+++ b/arch/arm64/boot/dts/ambarella/cv75.dtsi
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Ambarella CV75 SoC
+ *
+ * Boot peripheral: UART0 console.
+ * Clocks: a single ambarella,cv75-rct provider.
+ */
+
+#include <dt-bindings/clock/ambarella,cv75-rct.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "ambarella,cv75";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a76";
+			device_type = "cpu";
+			reg = <0x000>;
+			enable-method = "psci";
+		};
+
+		cpu@1 {
+			compatible = "arm,cortex-a76";
+			device_type = "cpu";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+	};
+
+	osc: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "osc";
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ahb@ffe0000000 {
+			compatible = "simple-bus";
+			reg = <0xff 0xe0000000 0x0 0x01000000>;
+			ranges = <0xe0000000 0xff 0xe0000000 0x01000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			s_scratchpad_syscon: scratchpad@e002e000 {
+				compatible = "ambarella,cv75-sec-scratchpad", "syscon";
+				reg = <0xe002e000 0x1000>;
+			};
+		};
+
+		apb@ffe4000000 {
+			compatible = "simple-bus";
+			reg = <0xff 0xe4000000 0x0 0x01000000>;
+			ranges = <0xe4000000 0xff 0xe4000000 0x01000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			uart0: serial@e4000000 {
+				compatible = "ambarella,cv75-uart", "snps,dw-apb-uart";
+				reg = <0xe4000000 0x1000>;
+				clocks = <&rct CV75_GCLK_UART0>;
+				interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart0_pins>;
+
+				status = "disabled";
+			};
+
+			pinctrl: pinctrl@e4010000 {
+				compatible = "ambarella,cv75-pinctrl";
+				reg = <0xe4010000 0x1000>;
+				ambarella,drive-strength-syscon = <&rct>;
+				ambarella,pull-syscon = <&s_scratchpad_syscon>;
+
+				uart0_pins: uart0-pins {
+					function = "uart0";
+					groups = "uart0";
+				};
+			};
+
+			gpio0: gpio@e4013000 {
+				compatible = "ambarella,cv75-gpio", "arm,primecell";
+				reg = <0xe4013000 0x1000>;
+				clocks = <&rct CV75_GCLK_APB>;
+				clock-names = "apb_pclk";
+				interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl 0 0 32>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				arm,primecell-periphid = <0x000e8061>;
+			};
+
+			gpio1: gpio@e4014000 {
+				compatible = "ambarella,cv75-gpio", "arm,primecell";
+				reg = <0xe4014000 0x1000>;
+				clocks = <&rct CV75_GCLK_APB>;
+				clock-names = "apb_pclk";
+				interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl 0 32 32>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				arm,primecell-periphid = <0x000e8061>;
+			};
+
+			gpio2: gpio@e4015000 {
+				compatible = "ambarella,cv75-gpio", "arm,primecell";
+				reg = <0xe4015000 0x1000>;
+				clocks = <&rct CV75_GCLK_APB>;
+				clock-names = "apb_pclk";
+				interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-ranges = <&pinctrl 0 64 32>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				arm,primecell-periphid = <0x000e8061>;
+			};
+		};
+
+		rct: clock-controller@ffed080000 {
+			compatible = "ambarella,cv75-rct", "syscon";
+			reg = <0xff 0xed080000 0x0 0x1000>;
+			clocks = <&osc>;
+			clock-names = "osc";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			assigned-clocks = <&rct CV75_GCLK_UART0>;
+			assigned-clock-parents = <&osc>;
+			assigned-clock-rates = <24000000>;
+		};
+
+		gic: interrupt-controller@fff0101000 {
+			compatible = "arm,gic-400";
+			reg = <0xff 0xf0101000 0x0 0x1000>,
+			      <0xff 0xf0102000 0x0 0x2000>,
+			      <0xff 0xf0104000 0x0 0x2000>,
+			      <0xff 0xf0106000 0x0 0x2000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupts = <GIC_PPI 9
+				      (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ad3bd3d9507b..454f07a6a6a6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -36,6 +36,7 @@ CONFIG_CRASH_DUMP=y
 CONFIG_ARCH_ACTIONS=y
 CONFIG_ARCH_AIROHA=y
 CONFIG_ARCH_SUNXI=y
+CONFIG_ARCH_AMBARELLA=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
 CONFIG_ARCH_ARTPEC=y

-- 
2.34.1



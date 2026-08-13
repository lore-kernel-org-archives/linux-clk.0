Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B970B446067;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615031; cv=none; b=UAeKzHuX2WDwGaEzacrEIivUWHnjbcT5yIigdH5Atf+y7QFMBP/oxIPKoS2jLpROtffZzKsgM/WypxwmF3JmXrypQCJhxEdXxfOV+JHv3f8l5GNBVudSosller4qnqk/7M7LdvU+qQOYli24lLnC9+ZAxPT7a5tmd2R7XiQAlf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615031; c=relaxed/simple;
	bh=MGxW8mqYV5zxZ2nhKGBjrsUB+IauzQp8VHtemLsvom8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qMu1MyCccfKwvlSn8Iqhn944bkobTCNfH598P1hKctSfv1sG0tzBF1EF1Zth3NYPcA7kMSx2h4nVNrcPYPElCmzeSCEHUgk08+u9s8JsoQ8zxXaEc8YNOZC9jYuVqk3PYHMRIY1JjnXBh7jT2/2f6fPcWHurV3LwZ4kPmjB8LqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWrb0wHi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWrb0wHi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FA51C2BCFF;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786615031;
	bh=MGxW8mqYV5zxZ2nhKGBjrsUB+IauzQp8VHtemLsvom8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BWrb0wHiEbAcCNJLBTLV+WkQmD4v3lQwr1M2Pyr1xpoSimS0OqPP7t6oN52LZtOrX
	 k/gZAE04FpxwvKxfaH3FFK6PAH4JVRvjbaIUTlXJ6pXQ4uummWnjldCDiWcxzgcba6
	 Yf4mA5PxSa8p/sTQ820bhecKeTtYXoEr25Tyqn4kTTm2GMk3NuCF2UZTuxXjU4P6mP
	 YC3LnBZ+I2HP5VX1ssm7K6rg3ttg2ZEz/QZ9pp4NiytZpQ+IInvxLr0LquPZzngrNH
	 /TuXraeR8VyXoYVlZ+8hg67kVzw9wtXWnn5xTvDiHgTCYqWSWYz+h5Sejv6obbiSed
	 EHadNVWmVbPvw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9C9C5DF67;
	Thu, 13 Aug 2026 09:57:11 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 13 Aug 2026 17:56:16 +0800
Subject: [PATCH v3 5/6] arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK
 DT
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-cv75-v3-a-v3-5-cfdd20b1b4dd@ambarella.com>
References: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
In-Reply-To: <20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 soc@lists.linux.dev, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786615029; l=8142;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=y0qjOUV7DPDfe9Di6LtDKb/6xCPt3g9z1X5V+Ta6i/0=;
 b=R1bPvbBR9xTj/hGMduj897ST/rvX8BW1QXg6GPmmq+IiqeNHC+pHFvcIP4cf4Fwk7zIj+iwCE
 NtgKzoKXkCJAvOytP99FmbNw/sNZEWVIJfukbWm+AfzIGY0kWNLA5sB
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Enable ARCH_AMBARELLA and add a minimal CV75 SoC / EVK device tree for
console bring-up with the RCT clocks, UART, pinctrl and GPIO banks.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 arch/arm64/Kconfig.platforms               |   9 ++
 arch/arm64/boot/dts/Makefile               |   1 +
 arch/arm64/boot/dts/ambarella/Makefile     |   3 +
 arch/arm64/boot/dts/ambarella/cv75-evk.dts |  30 +++++
 arch/arm64/boot/dts/ambarella/cv75.dtsi    | 178 +++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig               |   1 +
 6 files changed, 222 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac73003..166430ddb3c9 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -26,6 +26,15 @@ config ARCH_SUNXI
 	help
 	  This enables support for Allwinner sunxi based SoCs like the A64.
 
+config ARCH_AMBARELLA
+	bool "Ambarella SoC family"
+	select ARM_PSCI
+	select HAVE_ARM_ARCH_TIMER
+	select PINCTRL
+	select PINCTRL_AMB
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
index 000000000000..994eac6728ce
--- /dev/null
+++ b/arch/arm64/boot/dts/ambarella/cv75.dtsi
@@ -0,0 +1,178 @@
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
+				compatible = "ambarella,cv75-uart",
+					     "snps,dw-apb-uart";
+				reg = <0xe4000000 0x1000>;
+				clocks = <&rct CV75_GCLK_UART0>;
+				interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart0_pins>;
+				reg-io-width = <4>;
+				reg-shift = <2>;
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
+				arm,primecell-periphid = <0x00000061>;
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
+				arm,primecell-periphid = <0x00000061>;
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
+				arm,primecell-periphid = <0x00000061>;
+			};
+		};
+
+		rct: clock-controller@ffed080000 {
+			compatible = "ambarella,cv75-rct", "syscon";
+			reg = <0xff 0xed080000 0x0 0x1000>;
+			clocks = <&osc>;
+			clock-names = "osc";
+			#clock-cells = <1>;
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
+			#size-cells = <1>;
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



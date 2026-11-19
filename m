Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795083214;
	b=fJYisLOQ5/u7Ej4wiZ+9/SXffJQS97EVmhplnZn/uYfHrc1zOZa0nUwXSCCnu1NHL9XP
	 aEZOMGkl6Tnq4TZnXaO4E/L7eBJe36SLuEEa1WVh9PDP+GXzjpOBw6F3MtZOUzH8hN1lF
	 JZrREL4I4s/zYuC0pIESoea+A+v+rZiTx0aDukn9TBg97jTvqqOzqyW6JIZihAKWt1Skn
	 UUaz1QLCL7PPCVr4lILs4Z774q7lyJhivy2GcM69c6oLvbSyftEI8N0XmdVwsfm/BuaDL
	 Ex+yR6bkkgfgP6GWUEiWBHJ26wZfd4+p3m5OXvNDZduhk6xJAQTWTOWY5lHjJemVJLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083214;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nrKKan4fcwQqO2+IQHN8KIdhVM27xJklMd2gBP7DwN4=;
	b=MA9bdrrSFZ3yaTm2k1TQlhhLvilhE3CMeaBeNHW7N+DJlI8ENJSQxM6bfUbf0DwAWexD
	 PifackqWlQ6jkz1o58qfd9fHInPWqcnxqpFVC/aw0yQp9eTRysSwih8TI90IHLxpmq5PL
	 EcE0EFFKSVu32dxwNswOURBQf674jCdg+EcpOfP48GIr2tmu8oWNFrvxX5Fkg/fsDmYux
	 h3BhWVUjQC4ka6tko2Z4rPzUGU+cxfFn7AS9g8RHI4G6jMbfCFPBQXvQtB5IYyKMhLUff
	 Cx3B0RMYUxUUutf5Y365ZnihXhBsj9gpMFlPA2SPbCtO2cl4s+NyswHqcRVDNBhxRwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mauniMpq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758A160A261B;
	Thu, 19 Nov 2026 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mauniMpq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795083214;
	b=LItOd4vHrw7HsmyS/31pjIFwBWXu8W6LPqGMVMg5/1OZ2gLBHKm4JL9KW6uk7lCNpkTH
	 dRhuCJIPST8fmq17Zyq5t1dtki2BBuTX7FZ3BL4ASOgWOYZVDZz72YttW46sgCzv6fhYq
	 ny/R13c+Id/UBygR7XB1Oast+WDlGvRTkIyquB4stVrlmbGeol6WMwr3uKuCfEDY0y3Ic
	 ZAtTbR8JJmp8cgTZwU7hW0P11tDUcXwKMcnXPydL0/p5qz/FY28/jFrVi5+0qgPCNy//P
	 GMHpvjnW75tQx6s91WNVzBaSEoBArjNhcuAm0kry/ZJrEqSyZwU+NGlRVR4pKW/+REg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795083214;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nrKKan4fcwQqO2+IQHN8KIdhVM27xJklMd2gBP7DwN4=;
	b=Nb+2UiDoeztc5PI548UE1uQ03Pbbp6W2fzNbODeY0GpyABHgP1NbBIWWTRFEtzbz5utT
	 qASnj4/hcuCe05gnt/d+9oLI1jo6bERIrie4TIil9yGk5gBvhUiXDrgGPld/6WdXpTYcv
	 m/OEJzb3cOpRlmRv2ILoS3RnUIcRRRZPTW5FAyh/h6LQ25Cz/NtdiWQxOrLeRDRdUG8mY
	 rGUX+fQaHFm2BMdT99OK+0dK+wvzI3gTMLPFUehUPcGQs/8od8X5bIGS/j1fOKpfriJoX
	 AmH07RM33gkn7RxRCnj7giVAOWJ6M00vOrBpSEEUG6bqDgCprKErWyZp4obsdH7AxGQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6EC0D1F000C4;
	Thu, 19 Nov 2026 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083214;
	bh=nrKKan4fcwQqO2+IQHN8KIdhVM27xJklMd2gBP7DwN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mauniMpqkswQublGGMROV3GxMGf0JEkVvu+dwT+tH8jklQjjH3vn6w9cMAdHgMfDo
	 7JseutBs1FHrYAz5ZJ64Oa2w6Fe5pwdTl4ZIv/XzM0CkQh5yDTAWqbvXpjZQC2+6um
	 dhNcheXf+hT8wguBRtb1OzmQ2yDKA9ggfzChfZ3Ml2H+JUb8Hjn3s1SjCtBhmTRVqU
	 RQQwbxccWkPGMrAFs6wje1oGXbJt9HXlmP0Thc/6a91h/1lxj2kOcLmNd2BSpxr2Cw
	 D4Uh45qd+1sELHZelJAwtK7KY3xjmJzV0QwGaJqViav0pib4JA+X6pjYiUFyoIp23s
	 7JysjzUtB6PNg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 505FE4B23C;
	Thu, 19 Nov 2026 10:13:31 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 19 Nov 2026 18:13:23 +0800
Subject: [PATCH v12 5/6] arm64: dts: ambarella: add CV75 SoC and EVK
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
Message-Id: <20261119-cv75-soc-v12-5-e5a03cca8b05@ambarella.com>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
In-Reply-To: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795083209; l=7477;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=r8Z+RI7zn8FZlW5uvIfPNOKL1NMli07Z5kwhpKpkQj0=;
 b=+pRH8Z9CewJF4hlc2HOBriCfQOt1FMtf7ohnD1CdHeZ23gywp1PvWLNckRL+0fqcJZbTTjt+q
 iiAFpEqL4iLB/vATGtuLPwBr7t/hPqEj1gx+Lx4LqLD4jV1ip0Ji3RD
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Add a minimal CV75 SoC and EVK device tree for console bring-up with
the RCT clocks, UART, pinctrl and GPIO banks.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 arch/arm64/boot/dts/Makefile               |   1 +
 arch/arm64/boot/dts/ambarella/Makefile     |   3 +
 arch/arm64/boot/dts/ambarella/cv75-evk.dts |  30 +++++
 arch/arm64/boot/dts/ambarella/cv75.dtsi    | 177 +++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig               |   1 +
 5 files changed, 212 insertions(+)

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



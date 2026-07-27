Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5E343550F
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176791; cv=none; b=S6XZQjdDRn+773huIW8o6/gsjAbyw1LQVolxbeuz670fLnyCXljlIkLl6PaGkebjTghHPvQEnFJuMPZ5NSAznNXsg+YEhr2UM/bqx5rC3+TTiCy12x238sIpv3anRUs2rRlA3XBX8O2W1bm0lvplsXW3v7S9TmCdHLazsCJ7cfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176791; c=relaxed/simple;
	bh=9WNPKFjal9TFI7ztjsCWddsA0DdgrD8Tk7Zv4ZNs/pI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F76lZK9dxRsrcyfMCCNVcVe4jeNOJam6rQJcNdtqT1OLX2jcRhQgEl3Lggf3G9vRmLBwUAr/oXas8RzN3AtzjnIJXlJY+ovqgqzb148oyOFLzevjKqsgLIeKjw0alS40cXsOTrmBwJdl9hxOSRqZJip1JVAyOpFR5KXPxYZ41PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fx8IP6pO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fx8IP6pO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954dff6536so22197355e9.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 11:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176787; x=1785781587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qAtpWFpXBCB2TwlFP1ROJK7e4/4ihHdc0dQDuwgQXcs=;
        b=Fx8IP6pOXFvuCEcP4g5zmn4lJfivNF+jBo35tUwzKAhq6nVM76wQ5NczBknSWWXATl
         OAUMlc0VL73WGUerzmv0pcCI5QMuiazO9WlKoS9Pc8UH8pc2xDt0VZnkKCAvbbx4s7PY
         Sh7gS1m61zLkt7kCEgfv6J7VtvHJ4e0R9w+glWmQjnjxUeEQ5fL8ZhGKZz0MndsjxxXT
         GVCGC4lJP5v34DI+jXWPfT3vwnmgyDXA5eCJd9v7vEjRHiMGm4Zcch3KEGZvvhwV+ldZ
         6ny66cyDyfSH7nlMwFLMLjnUlyltSeNMQWHUULDhPaPRiuzsG5bIzvRP0209TWhJr3Cy
         eWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176787; x=1785781587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAtpWFpXBCB2TwlFP1ROJK7e4/4ihHdc0dQDuwgQXcs=;
        b=pqp8gMqk4idDzAu2qX0srOSw0A1yAkb2QYjUdu4Jq+nWis/nP4bfEgso+tVh44GrSL
         06TuNx0zv9U1KRjV9HRWAGOU3ditVmGnvtTm5Nzb9KtUIpMdlMmMnSj6+NuW0k/hAUyr
         rgXwZBDIAU2FmHtLhMCKhpteLEHcy/PdU4JMZxQ2XqXiKWPdvP0+R1pktl5+kvb4GhKk
         drPr2/lhKtsTY9kyviSjODmFpuFrNtp5LEvOPQcGup7B7en8bpPURgRzxuxdPumumDH3
         R1d26ZRX0avpgluZgOzguqONj1oO0Me054fd2ce3GL39sqY1pp0kuW4AERZouLhy3DEI
         i73Q==
X-Gm-Message-State: AOJu0Yzn7OFcuru/80uo07/ZKG6fRGGZwv5wCsAZxstNDJgWFijocVYd
	jfYJXQvXCSeUJqxy/xd6Qvc5BKpHUvHR+4/UMcFAZGR1+lPQXc0oCkAM
X-Gm-Gg: AR+sD127+c4q1kJ+En4cvEI6eKzhavx2IlKfGk1eCjVXEvDJCCi4qQ+AiMOGI+ltIi2
	ZOo1KJG4fQhA3IZujpUP+/fMbooI0gA9txQU/shCV0QZSy9kGFZIvwLx1U8jzNAyxfVmipd4pWw
	aueZbXcQbqNGDCxRv1+9BibVTEuEYlyBj/2ydQE9sxri1xiF6yOXoGJNW3j8NVA4qZrTtetxaQa
	scUzj7spEYXgu8SSF3ecEtAw44WbZRECiFQY01RuF2WDmQhKjnf4HrefS1OjbXuJ7ftVUw9twBl
	v1u1hTsMrtIevwNebahB/ntZMJU31Vju0wrOzNdnWzTGJu8bCVNwrcUJG/tQSwkKQprcMRf0M6y
	jMru7y9S/6NT7hwn1IA9YoVYjbdrweAWsIwJOU5IprSTm4RXyJ8wgkqb3viuOVMXUVsxRka57gx
	+ujmFnG329fpO+nkUxR1k2/co=
X-Received: by 2002:a05:600c:6986:b0:495:3f48:5df2 with SMTP id 5b1f17b1804b1-496b5722341mr144689655e9.29.1785176786691;
        Mon, 27 Jul 2026 11:26:26 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:26:26 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:27 +0300
Subject: [PATCH v8 12/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-12-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
In-Reply-To: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5268;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=9WNPKFjal9TFI7ztjsCWddsA0DdgrD8Tk7Zv4ZNs/pI=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J7FbZD2m/JMVFcXnBCdwNjgRof/lPXlFIYI
 Eof9rYGcc2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiexsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIpNg/8CjhYfS1jEJRHFiBgBHY94DxsbwC80LV
 FJ+iqaQIJn9SQuRM8mcsHnPvkhxHspQMK/XJoHvbxDakU6CLMUjEUC/UE23nvkXuFgYGRU/bm/K
 nM30erogA/6Ee87GbATgpz/U4rwxXmsnszROwKfVBppkIKxtV4+rGEuZNe4xaa94+Kft6zZgU3a
 V6G20JybDFvY0lxCpFFJlXMDsEMMUelTb+MkDUP2C5zVJRrgbnbgoXH01jvVZXRbQ2CB6I8DA8f
 UEm03N9S9rFjiivNza1972Ecx7uJQxjeIGgTLegxJdPk21AQZmdz9yggFPWh6aEbjRw828osEss
 NUQVKk18v7d92C2XIQQRUT+qpl4BIHR6qeMfnP6SpTq/m6SWKz/MiVLL2NWLgopShaX7HImgAVx
 /50BLdsMcVsUOsPTZJ/R78p75U2CJ5D9eAdc8WDLV6XYnHQfJmeuoDyFG/jEAayFsrLaPQEi75A
 ldzwsNiYqXbZAYmPVNnaTyB0ZiZTgpGRA/+r2OTLWullukCrBP+WcqVxH59ovKFr+Hn10RGFG1/
 +FVupuf6muERBXFswb3B5VDtNewieyxjenmfbinlRAnBLYtlOX9wL88glUI0pIMrDn1uAiv+hkh
 gxxePgHKcQ6WxmDfdh35grba3iONAhD6V3AuPNNWN5e9ErGqwK0g=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This makes use of the driver added in the previous patches. It wires up
the uart clocks and resets and allows getting rid of the placeholder
uartclk node.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 7:
Add phy nodes to topcrm
Remove syscon from matrixclk again
Adapt remove now-removed extra clk inputs from matrix
Add reset to LSP
osc26m -> clock-26m for the fixed rate clocks, likewise for 32k

Version 6:
Add syscon to matrixclk

Version 5:
Re-name from *clk to *crm
Add the syscon-reboot node here because the binding requires it
Re-add accidentally dropped uart2 IRQ
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 84 +++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..8d911795936b 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -4,6 +4,8 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
 
 / {
 	#address-cells = <1>;
@@ -20,13 +22,16 @@ cpu@0 {
 		};
 	};
 
-	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
-	 * been added.
-	 */
-	uartclk: uartclk-26000000 {
-		#clock-cells = <0>;
+	osc26m: clock-26m {
 		compatible = "fixed-clock";
 		clock-frequency = <26000000>;
+		#clock-cells = <0>;
+	};
+
+	osc32k: clock-32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	timer {
@@ -70,13 +75,74 @@ gic: interrupt-controller@f2000000 {
 			      <0xf2040000 0x20000>;
 		};
 
+		topcrm: clock-controller@13b000 {
+			compatible = "zte,zx297520v3-topcrm", "syscon";
+			reg = <0x0013b000 0x400>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+			interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "usb-up", "usb-down", "hsic-up", "hsic-down";
+			resets = <&topcrm ZX297520V3_USB_PHY_RESET>,
+				 <&topcrm ZX297520V3_HSIC_PHY_RESET>;
+			reset-names = "usb", "hsic";
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+			#reset-cells = <1>;
+
+			syscon-reboot {
+				compatible = "syscon-reboot";
+				offset = <0x0>;
+				value = <0x1>;
+				mask = <0x1>;
+			};
+		};
+
+		matrixcrm: clock-controller@1306000 {
+			compatible = "zte,zx297520v3-matrixcrm";
+			reg = <0x01306000 0x400>;
+			clocks = <&osc26m>, <&osc32k>,
+				 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D5>,
+				 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_GPLL>,
+				 <&topcrm ZX297520V3_GPLL_D2>, <&topcrm ZX297520V3_GATED_OSC26M>;
+			clock-names = "osc26m", "osc32k", "mpll", "mpll-d5", "dpll",
+				      "gpll", "gpll-d2", "wclk-osc26m";
+			#clock-cells = <1>;
+			#hwlock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		lspcrm: clock-controller@1400000 {
+			compatible = "zte,zx297520v3-lspcrm";
+			reg = <0x01400000 0x100>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+
+			clocks = <&matrixcrm ZX297520V3_LSP_MPLL_D5_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D4_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D6_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D8_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D12_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_OSC26M_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_OSC32K_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_PCLK>,
+				 <&matrixcrm ZX297520V3_LSP_TDM_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_DPLL_D4_WCLK>;
+			clock-names = "mpll-d5", "mpll-d4", "mpll-d6", "mpll-d8", "mpll-d12",
+				      "osc26m", "osc32k", "pclk", "tdm-wclk", "dpll-d4";
+			resets = <&matrixcrm ZX297520V3_LSP_RESET>;
+		};
+
 		uart0: serial@131000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x00131000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&topcrm ZX297520V3_UART0_WCLK>, <&topcrm ZX297520V3_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&topcrm ZX297520V3_UART0_RESET>;
 			status = "disabled";
 		};
 
@@ -85,8 +151,9 @@ uart1: serial@1408000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART1_WCLK>, <&lspcrm ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART1_RESET>;
 			status = "disabled";
 		};
 
@@ -95,8 +162,9 @@ uart2: serial@140d000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x0140d000 0x1000>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART2_WCLK>, <&lspcrm ZX297520V3_UART2_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART2_RESET>;
 			status = "disabled";
 		};
 	};

-- 
2.54.0


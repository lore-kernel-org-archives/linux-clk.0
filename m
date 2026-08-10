Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8DE39BFF8
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 07:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345403; cv=none; b=C8yIta/mldJB5CoU/LEme0XpiIt1AiSvUbRDnningfirCY95Y1jZG1nBQrRQAtFmLR5qO8o63UD3oaJzAam6wXvL8Sh6Qg43/UKY1cMeU1nyaiRSii5Ir3FWO+AH8W9NaehIETdu4tTzcQ3aamo8crSsAVXhwOis6mebxwDUJGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345403; c=relaxed/simple;
	bh=dod8uvxlM8AUHtOsxRFNJ1NEJgR2kBawaOyWvDTxkpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KdKXBViRDbbojTAMCfonDe6aZh3dKcC3TvRsRzeElW3BZ2NyCK1yHzFaJ7Dz2AvgTOe4bU5AybQpl4lj7rP2vcYCX4wy1xeECMvz443zp8EwoXkh41ZMFRhcVhpZL54+7ocA6kjrG0OSkMfNkLEd5BjlNPctPX3DyNgQbvI87bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1FeE4gs; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1FeE4gs"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1186036f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 00:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786345400; x=1786950200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UFqgR5GSvMOEuQrtPZNNyIXv51CHwIdUk1flHNLoxSo=;
        b=k1FeE4gs/rDn/5InHf5UvdivzhwEbOTg3MsgPaSz3k7CyS8IyWCQNy4kPNYvyK0X9W
         BqwAoj6Rm08r2lq9mLCmUO1tgCKrGOn9xBWLreShbKH3uOFvncV3XBj/qJzgWRP48aB0
         X7w+MLOQKYMer71HS4LlTPTL7Lp0FGdT4u6/G0TCHA7viC27dvYP9VfieQSHKx77DUQx
         rHa3aTcpJ6j2nUCGSwop4RBVtld9n776zQhfaqgFDhjXUjemSzScWvAm3N+XE42tzvwp
         dxWHq1XcpLQSYNboghXrlxcp2VohBBc02ehF3508Q5mntiWmYHxVhMn4wrmPwQBveckE
         M/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345400; x=1786950200;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFqgR5GSvMOEuQrtPZNNyIXv51CHwIdUk1flHNLoxSo=;
        b=F92Hu6SDqg4i2bgovD6ymFu7wf7sSwQ43qirBNBpfPzfLo1uSwvA1D5W/1GcM3MOss
         oCskog3XBgoENQVvk/x+6GvNGUp3yswbBimZ68MqLg3j7Gq2Yw/vA2P8iIHKUOirkVCl
         UzHhDLWw5q5l8Fu3m/IeJhThXZmCIZ0PIwMMdHpQ7ODppIdmWWTEFqIAyF/ork4HL3gP
         bVcUGSkICgyuubcdCYmMI3MiSdv190rJO/0fsqZOnR3tWYhX3Kq5Gi9dzQSAqmSVciOk
         D3NAfN5IfVzeig0yzuHwqfpyDUPAS/0qrIV83kmSb69Lb1svoomPy8YAgI5TPMJu0VdP
         RIeg==
X-Gm-Message-State: AOJu0YyNBurMg5lqn4iR/OUewWYWJTiELUVDO7Zk3QmZGxc6ET9Jjrzt
	K2j1C3+saZQWnn7ZOeJgDlusYuO9+WfV3TiSd4D4P9/+mcsYcWNXGxgW
X-Gm-Gg: AR+sD11cTtuJOTCMuXzDovInTVmtD+zoMLF53AHvqudg/NWaFNq++PNgoSOj0mwHHRM
	+uRdFerR9MA8XUvHgEn4HuezTlWX1LkpqPML4jq+F1J0vHXC0T6hibPX26zkCYxa4hOqWrTzUFM
	mYOrZQtoKKeOvNd4dpqehYJHwbBzvMeLbCsAVD63cn4nTkUNL6tMwWameouBmP2h5OkrS+kLp7c
	6iuA9+vC3p+UlBR9EFrHaDIxwin25eQU+t2+YeqdyzmXlV0oKlooo1kndaRMCmhzCV2RN7aoO5a
	dRkGGSHHI3R9cw9Z4UXp86TNasjFWZ/gEy9mGnvywTkwkCovf7N2RWbLMht2ttlThz+nUrLcHH3
	hat1cK8ESMiqYaL5slTaoK//Pln75l1WCfN1RBOVI1FtFcWVzntI/g+cfkJslONqO/KSpar83Mm
	IPXqyWeZg/JpBgM3soZhaG8rzK2oK+rLLwgdjBf/bfSuY4JOJUOcmCL//TKM5z0WPRBBLSl7K0U
	rmui3fwN7Y=
X-Received: by 2002:a05:600c:3b20:b0:499:4893:97d3 with SMTP id 5b1f17b1804b1-4994e7cb8ebmr498120745e9.13.1786345400094;
        Mon, 10 Aug 2026 00:03:20 -0700 (PDT)
Received: from strix.doe.home ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800215078asm30548038f8f.12.2026.08.10.00.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 00:03:19 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	bmasney@redhat.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	linux@armlinux.org.uk,
	lee@kernel.org
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	mfd@lists.linux.dev
Subject: [PATCH v10 12/12] ARM: dts: zte: Declare zx297520v3 CRM device nodes
Date: Mon, 10 Aug 2026 10:03:10 +0300
Message-ID: <20260810070311.1110849-1-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This makes use of the driver added in the previous patches. It wires up
the uart clocks and resets and allows getting rid of the placeholder
uartclk node.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 10: Fix issues with dt-check-style --mode=strict in newly added
code, but left issues in existing nodes alone.

Version 9:
Sort new nodes by mmio address
rename syscon-reboot to "reboot"
adjust to changes in bindings

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
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 101 +++++++++++++++++++++++---
 1 file changed, 89 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..ebac3cd137df 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -3,12 +3,26 @@
  * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
  */
 
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
 
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	osc26m: clock-26m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	osc32k: clock-32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -20,15 +34,6 @@ cpu@0 {
 		};
 	};
 
-	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
-	 * been added.
-	 */
-	uartclk: uartclk-26000000 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <26000000>;
-	};
-
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
@@ -75,18 +80,87 @@ uart0: serial@131000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x00131000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&topcrm ZX297520V3_UART0_WCLK>,
+				 <&topcrm ZX297520V3_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&topcrm ZX297520V3_UART0_RESET>;
+
 			status = "disabled";
 		};
 
+		topcrm: clock-controller@13b000 {
+			compatible = "zte,zx297520v3-topcrm", "syscon";
+			reg = <0x0013b000 0x400>;
+			#clock-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+			interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "usb-up", "usb-down",
+					  "hsic-up", "hsic-down";
+			#phy-cells = <1>;
+			#reset-cells = <1>;
+
+			reboot {
+				compatible = "syscon-reboot";
+				mask = <0x1>;
+				offset = <0x0>;
+				value = <0x1>;
+			};
+		};
+
+		matrixcrm: clock-controller@1306000 {
+			compatible = "zte,zx297520v3-matrixcrm";
+			reg = <0x01306000 0x400>;
+			#clock-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>,
+				 <&topcrm ZX297520V3_AHB_PCLK>,
+				 <&topcrm ZX297520V3_MPLL>,
+				 <&topcrm ZX297520V3_MPLL_D5>,
+				 <&topcrm ZX297520V3_DPLL>,
+				 <&topcrm ZX297520V3_GPLL>,
+				 <&topcrm ZX297520V3_GPLL_D2>,
+				 <&topcrm ZX297520V3_GATED_OSC26M>;
+			clock-names = "osc26m", "osc32k", "ahb", "mpll",
+				      "mpll-d5", "dpll", "gpll", "gpll-d2",
+				      "wclk-osc26m";
+			#hwlock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		lspcrm: clock-controller@1400000 {
+			compatible = "zte,zx297520v3-lspcrm";
+			reg = <0x01400000 0x100>;
+			#clock-cells = <1>;
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
+			clock-names = "mpll-d5", "mpll-d4", "mpll-d6",
+				      "mpll-d8", "mpll-d12", "osc26m", "osc32k",
+				      "pclk", "tdm-wclk", "dpll-d4";
+			#reset-cells = <1>;
+			resets = <&matrixcrm ZX297520V3_LSP_RESET>;
+		};
+
 		uart1: serial@1408000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART1_WCLK>,
+				 <&lspcrm ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART1_RESET>;
+
 			status = "disabled";
 		};
 
@@ -95,8 +169,11 @@ uart2: serial@140d000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x0140d000 0x1000>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART2_WCLK>,
+				 <&lspcrm ZX297520V3_UART2_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART2_RESET>;
+
 			status = "disabled";
 		};
 	};
-- 
2.54.0


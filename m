Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E602C31F9AF;
	Sat, 25 Apr 2026 09:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777109462; cv=pass; b=pD1bPH+1LuUig1ln0x3+osNn1CnDMQQ4zspVNiUtoBQ0n+cx1VpxVKHLKNZXL5t1LnQi+Dhbry5dfWiAp+igtcyZErZrZCGTUvD6gy/GfoeFvfv4U9y5V1nO3dlk0vilE964720VGEJ3yxKWDIrLhPCX7j0omy3egypbiOhPvkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777109462; c=relaxed/simple;
	bh=lDZ3Ho9oMIkHWBzDVtXd0C+HQofxzC1Uvf/koYFlGxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EBCWzIA/WSDAwxkWMnctvQvwgpqIo+M3kRUPEAzWVN88KCiImkrJjf84OVvRJbOgRODZpj202eIsuInQMtXh8G6LeiRWaYSjUw695rA7/JYd7n65gCQf7vTcgpo3DCP+w4ximhsUkLOB6S9D2qumxFdtLX7wvSyNgMZyDwuuQCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=RLe0l5ZM; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="RLe0l5ZM"
ARC-Seal: i=1; a=rsa-sha256; t=1777109432; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m1H1jpvq1FQlurYA6m6p8Wlv2r7hNZsPjTkDgT+xemyc6n/ltyi9M9AWH7bx4xvregjpkNqHaPkv5jLxxAcVmCZs5fZQ3X1vkeDIzkX33QA0NTFIsnbRaxC+aIUuLq22sfynbvTB/Jf3MbKbHhbFDOrA2VECWuE+M2BNYhe6+dM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777109432; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=icg+zCOgGoqr1TxrOB0l7vc+hZFfMR8PegZV77JDqKs=; 
	b=Nu7MEfCsYGDW9CXcQjvee8x7GJMF98B8FqLB3UzsEa10/vxzK4BG0+SG9ObUqVVK1L9DPSuZRSOWjeK10xR6aaA+xBjPYMnH90AQaH9kXVUiG8FfrC3+PRQeAImVxPGT0KV6kiBjp3Y5b3M0WiA+K7LRoy2P/hef6QAKHsPXFp4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777109431;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=icg+zCOgGoqr1TxrOB0l7vc+hZFfMR8PegZV77JDqKs=;
	b=RLe0l5ZMEjD2hV4oEmUEf7bVINWEyrPudkqyKS1qSUC9VuOxJdEPyA9sp7wqAAu+
	hwdYkeLeKAIxeLNSuMc2L+ClYO5TZ0SFu/XBT3q6WsUbaUXW/AzC1vGFF+DS6D7jp2j
	k2/ij2043POoYZaT31Pt2bQeGRAt4BWOckXElunA=
Received: by mx.zohomail.com with SMTPS id 1777109428882272.84944146229884;
	Sat, 25 Apr 2026 02:30:28 -0700 (PDT)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Sat, 25 Apr 2026 17:29:33 +0800
Subject: [PATCH v12 3/3] riscv: dts: canaan: Add clock definition for K230
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-b4-k230-clk-v12-3-7d5ced1f5da8@zohomail.com>
References: <20260425-b4-k230-clk-v12-0-7d5ced1f5da8@zohomail.com>
In-Reply-To: <20260425-b4-k230-clk-v12-0-7d5ced1f5da8@zohomail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xukai Wang <kingxukai@zohomail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.15.2
Feedback-ID: zu08011227ed961dfdf4047f1a93c59eac00007d59c0355a71ab111596e76c60db2d8aeaee65cb01968358be:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External

This patch describes the clock controller integrated in K230 SoC
and replace dummy clocks with the real ones for UARTs.

For k230-canmv and k230-evb, they provide an additional external
pulse input through a pin to serve as clock source.

Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 arch/riscv/boot/dts/canaan/k230-canmv.dts | 11 +++++++++++
 arch/riscv/boot/dts/canaan/k230-evb.dts   | 11 +++++++++++
 arch/riscv/boot/dts/canaan/k230.dtsi      | 26 ++++++++++++++++++--------
 3 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k230-canmv.dts b/arch/riscv/boot/dts/canaan/k230-canmv.dts
index 32ba53d17c00..2ba555f6de13 100644
--- a/arch/riscv/boot/dts/canaan/k230-canmv.dts
+++ b/arch/riscv/boot/dts/canaan/k230-canmv.dts
@@ -21,6 +21,12 @@ ddr: memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x20000000>;
 	};
+
+	timerx_pulse_in: clock-50000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <50000000>;
+	};
 };
 
 &uart0 {
@@ -330,3 +336,8 @@ mmc1-data-cfg {
 		};
 	};
 };
+
+&sysclk {
+	clocks = <&osc24m>, <&timerx_pulse_in>;
+	clock-names = "osc24m", "timer-pulse-in";
+};
diff --git a/arch/riscv/boot/dts/canaan/k230-evb.dts b/arch/riscv/boot/dts/canaan/k230-evb.dts
index bfa53f2e2403..4246e4bba6cc 100644
--- a/arch/riscv/boot/dts/canaan/k230-evb.dts
+++ b/arch/riscv/boot/dts/canaan/k230-evb.dts
@@ -21,8 +21,19 @@ ddr: memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x20000000>;
 	};
+
+	timerx_pulse_in: clock-50000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <50000000>;
+	};
 };
 
 &uart0 {
 	status = "okay";
 };
+
+&sysclk {
+	clocks = <&osc24m>, <&timerx_pulse_in>;
+	clock-names = "osc24m", "timer-pulse-in";
+};
diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index a73b1926ab93..6dcb628a960b 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
  */
 
+#include <dt-bindings/clock/canaan,k230-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/reset/canaan,k230-rst.h>
 #include "k230-pinctrl.h"
@@ -57,11 +58,11 @@ l2_cache: l2-cache {
 		};
 	};
 
-	apb_clk: apb-clk-clock {
+	osc24m: clock-24000000 {
 		compatible = "fixed-clock";
-		clock-frequency = <50000000>;
-		clock-output-names = "apb_clk";
 		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "osc24m";
 	};
 
 	soc {
@@ -99,10 +100,19 @@ pinctrl: pinctrl@91105000 {
 			reg = <0x0 0x91105000 0x0 0x100>;
 		};
 
+		sysclk: clock-controller@91102000 {
+			compatible = "canaan,k230-clk";
+			reg = <0x0 0x91102000 0x0 0x40>,
+			      <0x0 0x91100000 0x0 0x108>;
+			clocks = <&osc24m>;
+			clock-names = "osc24m";
+			#clock-cells = <1>;
+		};
+
 		uart0: serial@91400000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91400000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART0_RATE>;
 			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -113,7 +123,7 @@ uart0: serial@91400000 {
 		uart1: serial@91401000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91401000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART1_RATE>;
 			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -124,7 +134,7 @@ uart1: serial@91401000 {
 		uart2: serial@91402000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91402000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART2_RATE>;
 			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -135,7 +145,7 @@ uart2: serial@91402000 {
 		uart3: serial@91403000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91403000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART3_RATE>;
 			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -146,7 +156,7 @@ uart3: serial@91403000 {
 		uart4: serial@91404000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91404000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART4_RATE>;
 			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;

-- 
2.34.1


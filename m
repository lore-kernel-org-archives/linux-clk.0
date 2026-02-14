Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD9D30BF69;
	Sat, 14 Feb 2026 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771073927; cv=pass; b=l2ghPz1w8wJR/wXNZaD2LfzSRoH65hrkGsD3d0S9USDEItiOPj/LwgIVr1EbmMu6eDHcOcNWZx8d9LZGpLL/qYm3YwE4mt8jRRhDxJTp0qJvWGFtRx6zGboOUqXh8gGA0aH+MZEWQaL0smC0IYQRoCNAI/+TRSyjzIps1YqAyHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771073927; c=relaxed/simple;
	bh=3F+dI4MMRuBaolMMITF1/+22ID9f72p6dEq/e2d7ltY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jFJshiszUiB3oXiA0d56aa+AQPIz6s7ZmyeiNIrNbhI7rS1fSfy1ad/UVrX8mr4M4wz0Ifli9Wr9qr81abmT2GCW/o3wu1MrmuCabjovUQ/FQy03w4HxHdmXPg9A14kR6ENSHw4mZjkvh1a64e6KMqPWTyOBhompfycbQtjxW6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=JMFiWQSY; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="JMFiWQSY"
ARC-Seal: i=1; a=rsa-sha256; t=1771073884; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EFZa8obvZdsp9IY5pnFQ7RvlObQA97MxkO6M92oIuE7Wj5ZU1VH8pT4CkrSczu/8bNTrDbXYCKGlQiSqYBk8W0qzlaHErOjl0RmFlOd+6WlG3uTHXTToyRbBEmCOnrY2AkQry6rCSfk1a8Qkk4wIK72FCDwN9rLOHSMJIhRQC1o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771073884; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8Rp5Hww2ob9dr4bjhNKWXvgLWq6gmlUka9uKN6WtVPo=; 
	b=NRdAQaKrBM3dWCrWC+e5GEwxMGjhjNXzBOxhOaCx8Vh38Ll5CmXxbQucVys/lPildyC7khNfmbWknyyjFGwfcyhOteGSXu1oar3VOjpzYAZjhQz04NyoSu9oevwwxeWQNQZQolJ4uYyt3QLqpYU+ArtNSEpjGTHhRFofOPvk/DM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771073884;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=8Rp5Hww2ob9dr4bjhNKWXvgLWq6gmlUka9uKN6WtVPo=;
	b=JMFiWQSYJSRURoy5DYSbruccbg/Sq7YP5nOralGsAE6mxIRLkPR98f8Ixead/byk
	qOx5yynqSbvNrQ07+afh0secrXS4DLl1Y7k+18hXBmnjhwSPlit1LnH0MuiEzyEcrSZ
	RZBVepBOl+lhaj25bdUsdx6zN5s/KdtKNUk1R6JA=
Received: by mx.zohomail.com with SMTPS id 1771073881704551.7420160087022;
	Sat, 14 Feb 2026 04:58:01 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Sat, 14 Feb 2026 20:54:39 +0800
Subject: [PATCH v11 3/3] riscv: dts: canaan: Add clock definition for K230
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-b4-k230-clk-v11-3-6de365489b89@zohomail.com>
References: <20260214-b4-k230-clk-v11-0-6de365489b89@zohomail.com>
In-Reply-To: <20260214-b4-k230-clk-v11-0-6de365489b89@zohomail.com>
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
 Troy Mitchell <TroyMitchell988@gmail.com>, jiayu.riscv@isrc.iscas.ac.cn
X-Mailer: b4 0.14.2
Feedback-ID: rr080112276725751e768d2d5023020cae0000deaaa4797553921fbbf3320ea9b031fa982a1a4eab617b30d6:zu08011227a067aec1c8ebdec0af6391ea0000aacc3b2e52d957375c95d6d32978af63e930ab0fe56f6fda4c:rf0801122cc9dc982664869ce0c87aed23000043dc36565f0fbd71d2b9c6f6c6ebb9dae345e405bcbee5820a774c03d48f:ZohoMail
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
index 32ba53d17c0000ed00293d6834c631397548e6b9..2ba555f6de131f5b111cead31fef13579d42ac58 100644
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
index bfa53f2e240334b7442ab22d18ef7c309ca11b7e..4246e4bba6ccd9d0c53d9b926e40cd63fde46e75 100644
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
index a73b1926ab9342f757a70c9b857de32746e96389..6dcb628a960b05c3c9542fcd2e4205539211fb0d 100644
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


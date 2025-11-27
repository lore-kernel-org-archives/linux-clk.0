Received: from sender3-of-g92.zoho.com (sender3-of-g92.zoho.com [136.143.184.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C6B32E721;
	Thu, 27 Nov 2025 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764247628; cv=pass; b=GJMMc/rCGghyQBn0wKPUiW4pkSzuB/78ex008LGBmtPiqb/b8ulgVCifhlSetcbzpwqo60jInCRlOIsNHk4TR9mJAHSnlIWnvQqYsNgtYt7H+rCWh7WIohFhUFcFBqQa/oXo/lPoO6D+GBHn5HaEegcq1hofxaWW4/PmWNIcCOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764247628; c=relaxed/simple;
	bh=+jfpVhIQhTByohDJO+xAoBewgjlpm5J5XMktEz6dzw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GsN3gKUcPJIx3Ik5PLT+8z9rRR1R//wrP9MJhLUwVkMCOQpi0iCg/edQPSh5KYOOdexqONvCStbmNbtcgE6DoOeeB4UOqa1eTKJIrPHLfrqO9SKt5uUWlICIHRVVJ9jFXzu+RAEbUOxTJ5+QT3yaqU+DoKKbleReYfazD3pIOo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=NUJzg2x6; arc=pass smtp.client-ip=136.143.184.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="NUJzg2x6"
ARC-Seal: i=1; a=rsa-sha256; t=1764247595; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K/KuTZPUGXxLRAm94FZJe5TWKKtBlD0iOxEB7sfCOO04HFSFqhGEIaxRrp7WX2gcIqGkWaNgOMT+rESZFq7V+TtWns81Jdr3tnitP6OSvPzPBQaoDlOARG1tcREqeKORTenors/VY/NrgAtP9enEGLtVuMB0MnrarF4eVGfgHHE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764247595; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Uk8p9LgpPoAiawj3uNhnu3nSqrQyd8EhyLBL85bAStc=; 
	b=lYfM16RkkvePPKbE5y86epCRytsmMa7UIJdYc+gNggQhXjph28wrG4tY7TvO0BgTgYrQnMfgpUToeXaRTMl1+g+tyWYGah2tewO+t/d3xwT/PHfnxCTbNgxp6KK+4wI8WZxfUcIqWlSzQb9eJpiYKz2LgH/DnmSkA0ZldhSv588=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764247595;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=Uk8p9LgpPoAiawj3uNhnu3nSqrQyd8EhyLBL85bAStc=;
	b=NUJzg2x6Ywe9f7iu9S4/wFVkPmCiiJRWzgIr2MJk9BUIvEBKyw7JGwRRHrFzH48m
	SMnz72SkxqFkgcbzUfjYGYXBqPcDlei/vTgSWH0mfFb4XemqLqyf+3GKeWJvAiC07dJ
	IWD0+7Y605Co9jJG7DbQVaBCXJNLths+9P1ON1JI=
Received: by mx.zohomail.com with SMTPS id 1764247593154975.9506260730468;
	Thu, 27 Nov 2025 04:46:33 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Thu, 27 Nov 2025 20:45:14 +0800
Subject: [PATCH v9 3/3] riscv: dts: canaan: Add clock definition for K230
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-b4-k230-clk-v9-3-3aa09e17faf5@zohomail.com>
References: <20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com>
In-Reply-To: <20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com>
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
X-Mailer: b4 0.14.2
Feedback-ID: rr0801122734571273cfab92a4d0b5d2ce000019ece0c9857013a3952af54177a777664bcb1d8b9c3da11570:zu08011227bfbc3da15590c35381310a3e0000d4a068accd49835ab720fc4ae1755e3ae1073c1ad70a1e3437:rf0801122cc83acc86e681fc278a999b56000048a42f561c6034a28b3975bf377070f72447941adf3868707055cf987bbe:ZohoMail
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
index 9565915cead6ad2381ea8249b616e79575feb896..cf33a5df9ff520a0dbb408864e615f61a115b673 100644
--- a/arch/riscv/boot/dts/canaan/k230-canmv.dts
+++ b/arch/riscv/boot/dts/canaan/k230-canmv.dts
@@ -17,8 +17,19 @@ ddr: memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x20000000>;
 	};
+
+	timerx_pulse_in: clock-50m {
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
diff --git a/arch/riscv/boot/dts/canaan/k230-evb.dts b/arch/riscv/boot/dts/canaan/k230-evb.dts
index f898b8e62368c3740d6795fd1e3cb0b261a460ac..24dba44955690e01e53f11d6720e60a81a9f435d 100644
--- a/arch/riscv/boot/dts/canaan/k230-evb.dts
+++ b/arch/riscv/boot/dts/canaan/k230-evb.dts
@@ -17,8 +17,19 @@ ddr: memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x20000000>;
 	};
+
+	timerx_pulse_in: clock-50m {
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
index 95c1a3d8fb1192e30113d96d3e96329545bc6ae7..7868cd4c6c9e9d82c9271f8585a71b67738d1ca7 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
  */
 
+#include <dt-bindings/clock/canaan,k230-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /dts-v1/;
@@ -58,11 +59,11 @@ l2_cache: l2-cache {
 		};
 	};
 
-	apb_clk: apb-clk-clock {
+	osc24m: clock-24m {
 		compatible = "fixed-clock";
-		clock-frequency = <50000000>;
-		clock-output-names = "apb_clk";
 		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "osc24m";
 	};
 
 	soc {
@@ -89,10 +90,19 @@ clint: timer@f04000000 {
 			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
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
@@ -102,7 +112,7 @@ uart0: serial@91400000 {
 		uart1: serial@91401000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91401000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART1_RATE>;
 			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -112,7 +122,7 @@ uart1: serial@91401000 {
 		uart2: serial@91402000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91402000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART2_RATE>;
 			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -122,7 +132,7 @@ uart2: serial@91402000 {
 		uart3: serial@91403000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x91403000 0x0 0x1000>;
-			clocks = <&apb_clk>;
+			clocks = <&sysclk K230_LS_UART3_RATE>;
 			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -132,7 +142,7 @@ uart3: serial@91403000 {
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


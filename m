Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625B439734B;
	Thu, 14 May 2026 09:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750949; cv=pass; b=A6nSoZTmqUNVf7vAbZINnu9O/BE9NDk1JzmGLUpsGCJP7KmdZtdsjyJJge9lsQoOb5pFNUJZjXym8QtBmJD5hc/AOtZZitGMRdSS/nknnNahF/lVKnQRMHpnAm9lCidoZdSWDkOMyBfnpi1KqMemT/WgOC/+V9HxA/7FOIOkSvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750949; c=relaxed/simple;
	bh=eIpyAVYU/GO0Xd5JaTDqfJlrG1CSuXkafJ6v4JOY3TY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sbXmDiaqHwqsAHs3J2eBiu8KSGAX2z3Qr+32qjmh/8KEKeuyaf+0LiRoe6PxOP48n+sSnAidqT65zdeNP/VTU+0Qu0feRdIB7Fv95mTl4xw4inSFR4NulGjSOZj8aDxAfDX9xjsZErhXBEimxBROL/vkgddNiQNvg+BQBejszkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=o47Bvq77; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="o47Bvq77"
ARC-Seal: i=1; a=rsa-sha256; t=1778750932; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PRQ9IptQNpfrOWHz6AHa8/wWmrDMrn8X59lvw24cOyN+neQi/3G8zxWNJ3IILYfrFIydywEN1Yu/beyAfclUxh5pZJL5kQ4ea3e//VGms9Pn4x5ZKdDyzdSODEBYGANNTS3GpvX+u00KEOMRybhNEEaZ8Bv/ae6vbB81BTtnTqk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778750932; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8Eabchh9N0E1D/S0bkZCTAhPgOlaO6Vwf3F0+rWhR0Q=; 
	b=S8Izf4ELi4W6M4eurZmnz9mVBoDfrHhBXYr/jjyql/aG5i6OFbgc7h1Xdkibq7/XK342+76hOodDweNbJlXQRQDuxrGGVsNR2GlFK530bHX9DVdC6Uzsdkw3Mw+4jt9zgbkErkwYoqONSTCEXXYPe0tv6tNIbd2Q7ie/KLyLwRs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778750932;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=8Eabchh9N0E1D/S0bkZCTAhPgOlaO6Vwf3F0+rWhR0Q=;
	b=o47Bvq77cjZaeWzk72AL/GU7Vmdw3AMPhmys5I6dtzNhOrtrqC0n56AwpMWKG43n
	gT14793zrQpEFPFqpqNN8wk2xChbNc4gkj5cNSO4Ra93IVE2Ju4pD8cCkGCTmqPb3NP
	ByTqU7m6E4L59AXKKJDqp59vqXgy5fpQe2mVdRGQ=
Received: by mx.zohomail.com with SMTPS id 1778750931462697.6278371898064;
	Thu, 14 May 2026 02:28:51 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 14 May 2026 17:27:21 +0800
Subject: [PATCH v5 5/6] riscv: dts: anlogic: add clocks and CRU for DR1V90
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-dr1v90-cru-v5-5-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
In-Reply-To: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778750853; l=3292;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=eIpyAVYU/GO0Xd5JaTDqfJlrG1CSuXkafJ6v4JOY3TY=;
 b=Wes30KbXAJ5MR3vT+KB+6Vc5vOYzqJL/n2KiDUns/Kz7H1iLtpFd0yf9O80YatYCp/jWUJDwx
 8IQxH5Y9+zYCkKFkl1+x0ZBdrRUYehq9V1zFOIJ4xfntjb+p5KUm0iJ
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External

Add clocks and introduce the CRU (Clock and Reset) unit node
for Anlogic DR1V90 SoC, providing both clock and reset support.

The DR1V90 SoC uses three external clocks:
- A crystal oscillator as the main system clock.
- Two optional external clocks (via IO) for the CAN and WDT modules.

The main crystal oscillator frequency is board-dependent. For the
dr1v90-mlkpai-fs01 board, a 33.33 MHz oscillator is used and defined
accordingly.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts |  4 +++
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi            | 40 ++++++++++++++++++++--
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts b/arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts
index 597407655efd..af78f1a4eecc 100644
--- a/arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts
+++ b/arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts
@@ -23,6 +23,10 @@ memory@0 {
 	};
 };
 
+&osc {
+	clock-frequency = <33333333>;
+};
+
 &uart1 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
index 9fe183f5f5c8..574c6608aef0 100644
--- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
+++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
@@ -3,6 +3,9 @@
  * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
  */
 
+#include <dt-bindings/clock/anlogic,dr1v90-cru.h>
+#include <dt-bindings/reset/anlogic,dr1v90-cru.h>
+
 /dts-v1/;
 / {
 	#address-cells = <2>;
@@ -40,6 +43,26 @@ cpu0_intc: interrupt-controller {
 		};
 	};
 
+	clocks {
+		can_ext: clock-ext-can {
+			compatible = "fixed-clock";
+			clock-output-names = "can_ext";
+			#clock-cells = <0>;
+		};
+
+		osc: clock-osc {
+			compatible = "fixed-clock";
+			clock-output-names = "osc";
+			#clock-cells = <0>;
+		};
+
+		wdt_ext: clock-ext-wdt {
+			compatible = "fixed-clock";
+			clock-output-names = "wdt_ext";
+			#clock-cells = <0>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -81,21 +104,34 @@ plic: interrupt-controller@6c000000 {
 		uart0: serial@f8400000 {
 			compatible = "anlogic,dr1v90-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xf8400000 0x0 0x1000>;
-			clock-frequency = <50000000>;
+			clocks = <&cru CLK_IO_400M_DIV8>, <&cru CLK_CPU_1X>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <71>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
+			resets = <&cru RESET_UART0>;
 			status = "disabled";
 		};
 
 		uart1: serial@f8401000 {
 			compatible = "anlogic,dr1v90-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xf8401000 0x0 0x1000>;
-			clock-frequency = <50000000>;
+			clocks = <&cru CLK_IO_400M_DIV8>, <&cru CLK_CPU_1X>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <72>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
+			resets = <&cru RESET_UART1>;
 			status = "disabled";
 		};
+
+		cru: clock-controller@f8801000 {
+			compatible = "anlogic,dr1v90-cru";
+			reg = <0x0 0xf8801000 0 0x400>;
+			clocks = <&osc>, <&can_ext>, <&wdt_ext>;
+			clock-names = "osc", "can_ext", "wdt_ext";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
 	};
 };

-- 
2.54.0


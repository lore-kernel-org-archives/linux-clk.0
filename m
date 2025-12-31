Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4338331194C;
	Wed, 31 Dec 2025 06:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767163443; cv=pass; b=mIZWJ1i0+iQrMd9a02R4T/cP3MQoF2ip43ZXISsKxIgDiOtaOuFVFigsKcZEYLsZUuxaqOc2xyJqpFFioQo52oHuioqsKzt99kYPBjKEPm7NPjSUGlGrOe25MTpJWxjfd6LAOxTwhIDsNxtC7ycaGxkNAMRTYbdc+ppWvgMoE40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767163443; c=relaxed/simple;
	bh=7Z8Oyywf4lTy+Lf3caJtJQ00JSZ0EovWOTO+6O8u2Do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4Uuazogg2zTWI5L+vifFy/75rf+I2XBV3H1JWT95MEHhXeW+CfxzeN09awUfw4H+Sh4zxyAd0W9zZSY0PhoJTex/Fyy77PTBHrF+Z4dazF1iHlvLj5SxXcymiaQefUzBAqqdfYsSdBXreuRTSSnywmpB2WIpxXN/ZtGltSQpNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=NjFzGMMl; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="NjFzGMMl"
ARC-Seal: i=1; a=rsa-sha256; t=1767163428; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XTrNaxRDtdp7JDrrVOMWDPUPWM8b2OMEkCtP7+K7IwycHaxd38i0Vg44NLWHiefXt76fvOEy5DORTcmXm7QGylaAu6OyMtn6RXqlKEQl6cvwzPJ0o73a/LD1D32LlB7Vz4R8hELbOw4F7jy7MuS0BgD8dcpZdmPjsHAgY0BTPyA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767163428; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=O9ruwUrsJjqNt3jdYDDnHcKNR2Bix4VjMQh/33wsq9E=; 
	b=g+MwTl02IK2sNwO4gBU6KwEgiuRaKACaXrjBOlu9TI2X8ie8HNeKn1uRgfuojiXH/9QvVFczaVNmWu7xkTTXdQwqYnnT2ak7Hc8Z/L4dgm8IqRYhQFqVerSkqs4Eyoua1PCDVLP+DUSSNt01Nzn4gYYPN3ZOkjLCnkvgMXupWtU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767163428;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=O9ruwUrsJjqNt3jdYDDnHcKNR2Bix4VjMQh/33wsq9E=;
	b=NjFzGMMlqKpHoBJM4/7xtQ+8wgSW8kvqmEZHGp8C3dpF3He21Cd81KiKOJw9C6JO
	KiwlD2ukyV6nc0dnGEsTvUqDXOR6rRAdlEwA2zL5yxkJieaTnw+MJvWFDN594E1Nf2e
	t81M8snS+h+CE9Vemx/4gBXGOQYrYmNRIiXQBQxw=
Received: by mx.zohomail.com with SMTPS id 1767163426492522.9548214585175;
	Tue, 30 Dec 2025 22:43:46 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 31 Dec 2025 14:40:09 +0800
Subject: [PATCH v4 5/6] riscv: dts: anlogic: add clocks and CRU for DR1V90
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-dr1v90-cru-v4-5-1db8c877eb91@pigmoral.tech>
References: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
In-Reply-To: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767163372; l=2728;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=7Z8Oyywf4lTy+Lf3caJtJQ00JSZ0EovWOTO+6O8u2Do=;
 b=YSTuVg4V4pxUNMT9oDVTuQOaWFSGEHAIyU/3OM73J7iKzKqB0gzbROwdTROgiRU6pJQmA1bij
 lW+ib1NyYBADXflp/zx27Dgsw5py5N755kzgD3yppb4K6KzEN5iwgc7
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External

Add clocks and introduce the CRU (Clock and Reset) unit node
for Anlogic DR1V90 SoC, providing both clock and reset support.

The DR1V90 SoC uses three external clocks:
- A 33 MHz crystal oscillator as the main system clock.
- Two optional external clocks (via IO) for the CAN and WDT modules.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 41 +++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
index a5d0765ade32..dc8358b35751 100644
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
@@ -39,6 +42,27 @@ cpu0_intc: interrupt-controller {
 		};
 	};
 
+	clocks {
+		can_ext: clock-ext-can {
+			compatible = "fixed-clock";
+			clock-output-names = "can_ext";
+			#clock-cells = <0>;
+		};
+
+		osc_33m: clock-33m {
+			compatible = "fixed-clock";
+			clock-frequency = <33333333>;
+			clock-output-names = "osc_33m";
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
@@ -80,21 +104,34 @@ plic: interrupt-controller@6c000000 {
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
+			clocks = <&osc_33m>, <&can_ext>, <&wdt_ext>;
+			clock-names = "osc_33m", "can_ext", "wdt_ext";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
 	};
 };

-- 
2.52.0


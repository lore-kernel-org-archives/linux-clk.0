Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BD52F39A9;
	Tue, 16 Dec 2025 03:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765856821; cv=pass; b=RSKXoellerCN1NRTSnzXlV2//LkgQk9syEIBMVvXARIYURQLoOiLpT3lLOpPKHqRA1js5YZ5BY/08cVjUlZAdfEptMmKBbIz3j1WhUtmU3k4LokRWM/O7nv+fnx7egn99UV/Q9GNQAry4gH8VhzNOQGOhnIo7PCHPaiAjWrA7hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765856821; c=relaxed/simple;
	bh=Tc9wfJN4uUK4cpcgXU6HieZ4TYiHQqyYO+rTHJRnSfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYSAfuyTJSJYWh0BR362LMrDE10Yy/URb9zG3og8VfymROP8cL2a9Ek/ycdDt6Mlfqdfzo2SQWj35/hln3j70QCzXTQEniGjrIB9DbDd1EpsLBuOr5h2pks2wnAUXoH/1IWOObXkVScXXbmXWmjpJ+252lwhNDg7LBWrt/l8wRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=DRWXUoGV; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="DRWXUoGV"
ARC-Seal: i=1; a=rsa-sha256; t=1765856806; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QACyZTckW1aHY0tnYQsZOIc8xnmafWiKM38FPkwYwyPnX7218+9utofKVhwDBWFHiiq+nYCa+3eO2KzY0BMBwndrmKOD0r3KpUmEADOq5CHgtrQVjGBTUKzyt2A+McjodQtwLKcXBbTY0ClURrTcyBgCnJEB/EuIfo7f1k7SeKk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765856806; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QfvDgfQAhmcyG3FI0g9kzjBmrgM3l9ZEjOo7B7u/mNg=; 
	b=nJhWPNowN3koFA4n5RxJqEICs3xgeIoTRty8pPMvZBDJMLbgRTghcc9BCCcLlqDg6F+uK7N9mD8FXLQanmklSqtrB5mOXV1U4vNfMU6OaftmAo0r/HxuL5TrF3581UvjHg5xQTyeugkREeUd4WKRv9sXC5gJyOi4z3Nphk9ARxI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765856806;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=QfvDgfQAhmcyG3FI0g9kzjBmrgM3l9ZEjOo7B7u/mNg=;
	b=DRWXUoGVvpEhHSl+4XR0xfeeOAij3J31U/REfQhbU0kELjtIW/fiSEzqw+vvN6cx
	zXNCUWVNcq3G+f1ZLDccUjBJXkgekdoxDc6HJ3E4wedkoq6O5khO5X6et1aItMckkvs
	Zr/Wr8taow9npmrFpNCAROW1Tr4yaiJpK0YxspbY=
Received: by mx.zohomail.com with SMTPS id 1765856805836609.2640014637352;
	Mon, 15 Dec 2025 19:46:45 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 16 Dec 2025 11:39:45 +0800
Subject: [PATCH v3 5/6] riscv: dts: anlogic: add clocks and CRU for DR1V90
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-dr1v90-cru-v3-5-52cc938d1db0@pigmoral.tech>
References: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
In-Reply-To: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765856765; l=2784;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=Tc9wfJN4uUK4cpcgXU6HieZ4TYiHQqyYO+rTHJRnSfg=;
 b=ZG9rNNI7EugakE68kwueMMjJgKbCmtSNAKCLpsvLu1d9ktEI82/3Qe8WooLIjOtIqZNhlPYAb
 Oh+as+XptGKBM0OJUS/5JNdxgUAl79Eo/39EdL+XzXhvFkMGOz7Lpzt
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
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
index a5d0765ade3231ece0afbe8835d95cd918a44ad9..dc8358b3575124234f984c448547493d063e991f 100644
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


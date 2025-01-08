Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D251FA8C1;
	Wed,  8 Jan 2025 11:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736336855; cv=none; b=qQEB1tDr4VLc1vmS3B9NDdImFINbK9+iEfIIGTRj5fuxxPwtF4V82NJ4wxo9vBSEXukamxzm/O4NqHepIXRyA2Uxm1VeJHlyMKqQug38YxpoeS19qvtHhzuJplm4Ino58MHp+69OpaAkM3n/KE5HJCxeRrtSvdiKAY3+t/sVtfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736336855; c=relaxed/simple;
	bh=1pkpQsa+REF1tJCdkKoGqcXMk6p5YIj1+XA5lPxMgnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ogSs5SsPoszakOPLFYbVHDd1o/qBl5IFuDhaov0w914t1fFM5AibK8ehT2AmqKdr7kW/Em7Hs5DWpjxL6a/EMYA9/5s+giL6749yJQbJSs33/QoEDIZ0bxcuNXHYc9K453voaaVLXAGvHtLpy3SGMoyk5zBTW+vsJa87xs8Kedk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=I3WRS7ez; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="I3WRS7ez"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4BEF325BCB;
	Wed,  8 Jan 2025 12:47:32 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtPQKoG2eIOz; Wed,  8 Jan 2025 12:47:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1736336848; bh=1pkpQsa+REF1tJCdkKoGqcXMk6p5YIj1+XA5lPxMgnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I3WRS7ezJmFQ+xQ8t0So04riW667+GToWi2GIZFNUliGjBfBxGRNaJjwHoq+4Pq9w
	 Q264UquhenbnJhG73fwVWn9UyDlt0DDiqkp1OPio8AT0yyd/UyNwKKzOZYGBauGQlr
	 mn5v/ZgZKS3L0s0HvOdZ5YF5beXpEsmquYlyNYW0fRBQzBeDwrebJxLKlHyv7NS1E3
	 Iu+PV23r/ZbXAEcDJ7hvvEooXUy/sRfYI6fsdrYfVYnKys7C7OTUiTZAeP5HA9F1Ju
	 CN3MMjLrfLYzuoDR9hbXegQShRnqKtCRrbIuiMa1RepGMQT//+mYPUMj45sC01Sgld
	 PCGbILDHQyAFA==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 5/5] arm64: dts: rockchip: Add UART clocks for RK3528 SoC
Date: Wed,  8 Jan 2025 11:46:06 +0000
Message-ID: <20250108114605.1960-7-ziyao@disroot.org>
In-Reply-To: <20250108114605.1960-2-ziyao@disroot.org>
References: <20250108114605.1960-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing clocks in UART nodes for RK3528 SoC.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 37fd40377076..5b334690356a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -168,7 +168,8 @@ cru: clock-controller@ff4a0000 {
 		uart0: serial@ff9f0000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xff9f0000 0x0 0x100>;
-			clock-frequency = <24000000>;
+			clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -178,6 +179,8 @@ uart0: serial@ff9f0000 {
 		uart1: serial@ff9f8000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xff9f8000 0x0 0x100>;
+			clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -187,6 +190,8 @@ uart1: serial@ff9f8000 {
 		uart2: serial@ffa00000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xffa00000 0x0 0x100>;
+			clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -195,6 +200,8 @@ uart2: serial@ffa00000 {
 
 		uart3: serial@ffa08000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
+			clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
+			clock-names = "baudclk", "apb_pclk";
 			reg = <0x0 0xffa08000 0x0 0x100>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -204,6 +211,8 @@ uart3: serial@ffa08000 {
 		uart4: serial@ffa10000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xffa10000 0x0 0x100>;
+			clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -213,6 +222,8 @@ uart4: serial@ffa10000 {
 		uart5: serial@ffa18000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xffa18000 0x0 0x100>;
+			clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -222,6 +233,8 @@ uart5: serial@ffa18000 {
 		uart6: serial@ffa20000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xffa20000 0x0 0x100>;
+			clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
@@ -231,6 +244,8 @@ uart6: serial@ffa20000 {
 		uart7: serial@ffa28000 {
 			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
 			reg = <0x0 0xffa28000 0x0 0x100>;
+			clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
-- 
2.47.1


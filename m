Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827ED3D88F2;
	Mon, 10 Aug 2026 12:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364175; cv=none; b=eBNoouOOGgmLC/LOxw3eQRdWCNo9Q7YGU91ZCYwdtU6cgGZ8pgUGpgrbNQgtGjeKfN5ZKbtRLui4bMTixr++exdFtlAQOr03rUJya3xXDtmkUYWgtiwivr5vgaxiULAgjylk+A8ATjlBZRTlnmt0X+BnYTHpHjC2WTq567KuPdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364175; c=relaxed/simple;
	bh=hta0Pp4rfzoS/Aevnu0xZ0RRZRyH3gGeB9Rml6eHOVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqF6qnTJ4IH0Ei+t/hBbZHNNRStajKhnl05marXpeXQSH8lGAY5mPmfmCJGj4TF7hT5mkWQBR1CA49yJWD7L+32YtgOSoVL/d90V931285ZfnLb/UXkCzXxThLz8ad50VvhZ5e9X7ar3Nl4iCmRSWESFtKfw3ILfHpu+ftOF0H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=FEA1uvjJ; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="FEA1uvjJ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7956EC051C;
	Mon, 10 Aug 2026 15:16:10 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364171; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=y76GiRMrYgaa2B8p3vMOOGelYc4wcU4Ng2CgUWCP/+8=;
	b=FEA1uvjJ/gAdaqCdVA4iEr3nLxsWN3Y3LAraMdFZ4L0eCPIiHBAeALZMI7HcxZjdA3k9Co
	CttneTiVFmFUDc3VtV5PZwUFjQ0tasP4h4y7xtt7LrWZpBOpNI3CHW/p9rnlgYO1on6jTX
	ikFubHptQqlHkDovSK47DX+lWriCWk68cX719kqFWQOdjMdQ3Agk3fE3YG4k5uw2uonMed
	wyWoRJyBSHNTGmBdthldBZlvLPgFjS8pN3rRMSkYR/LDKqEXV8sk4SNgH9gobKQE2svOup
	ejL9N76BuRjN9eNS9kyj69hUWcLV8c6iuPRHfT7M53oJXNoX8yi1eJ3KUMIG3w==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 14/25] ARM: dts: rockchip: Add DMA support to UART nodes
Date: Mon, 10 Aug 2026 15:11:05 +0300
Message-ID: <20260810121121.210040-15-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add dmas/dma-names properties to uart0-uart5 so the dw-abp-uart
driver can use the RV1106 DMAC for TX/RX.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 4abc333ab370..58ac297e4d75 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -298,6 +298,8 @@ uart0: serial@ff4a0000 {
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			dmas = <&dmac 7>, <&dmac 6>;
+			dma-names = "tx", "rx";
 			clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
 			clock-names = "baudclk", "apb_pclk";
 			status = "disabled";
@@ -309,6 +311,8 @@ uart1: serial@ff4b0000 {
 			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			dmas = <&dmac 9>, <&dmac 8>;
+			dma-names = "tx", "rx";
 			clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
 			clock-names = "baudclk", "apb_pclk";
 			status = "disabled";
@@ -320,6 +324,8 @@ uart2: serial@ff4c0000 {
 			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			dmas = <&dmac 11>, <&dmac 10>;
+			dma-names = "tx", "rx";
 			clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
 			clock-names = "baudclk", "apb_pclk";
 			status = "disabled";
@@ -331,6 +337,8 @@ uart3: serial@ff4d0000 {
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			dmas = <&dmac 13>, <&dmac 12>;
+			dma-names = "tx", "rx";
 			clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
 			clock-names = "baudclk", "apb_pclk";
 			status = "disabled";
@@ -342,6 +350,8 @@ uart4: serial@ff4e0000 {
 			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			dmas = <&dmac 15>, <&dmac 14>;
+			dma-names = "tx", "rx";
 			clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
 			clock-names = "baudclk", "apb_pclk";
 			status = "disabled";
@@ -353,6 +363,8 @@ uart5: serial@ff4f0000 {
 			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			dmas = <&dmac 17>, <&dmac 16>;
+			dma-names = "tx", "rx";
 			clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
 			clock-names = "baudclk", "apb_pclk";
 			status = "disabled";
-- 
2.47.3


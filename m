Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2062F3EB0E2;
	Mon, 10 Aug 2026 12:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364186; cv=none; b=qc/twIwbV0bvF7A2JcPYsfGByuoWLbT5fjf/m0zaIiUKTNBhZGqRFteSBd2n4sjwZiqM9xZQGfpcWGneIGSFmQG4gA/gAjrzNtilVks7SVDZeUo35EnrPbCoWj4yJwXcSiat+/7f6Bq5o9u4RHr+NDVMoKyPcRrBGmDAMz5ABEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364186; c=relaxed/simple;
	bh=RoQUuHMRBOlUT6PMXmijPBzse7gY96zfByIiX3DLl2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qa5AQEurbSDMo1pq1N0gE2rT4qRbyBtYg7lz7+u7EEumjRfQ9ieItc3zFvoPZHEy79Ysf9/c8x4lnTkUnbYhzmZk/tjaWpYVhiI+j+NuCMJNBQokviAbxWeDJRJh3NRnhY+DaiS5P8xyuf3eo3zREqCbWB6MFvf7wE4GGukfsvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=gP+S9Yoa; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="gP+S9Yoa"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C870C0514;
	Mon, 10 Aug 2026 15:16:21 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364183; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PjpXsUWuH/r9E8s8lUfUdg5PLs7m5CliRJpnNLInJrI=;
	b=gP+S9Yoax+x4I/pvI/7/l8RziF3Wh1xJY/9F+IBe/aiziSieWgj1PjbSrlmdHgpINK9/ur
	ojW4UQ7TKnmZlPW6z9o7fSPuma/8WSnPdW0txTOI8ysyjVlMqfWLhmtRV7WFJhLZKURKYp
	z37wYXPacIYGb2jVFV1uNRfrHWJ8AVp9/VVqr5659ry8v+GYEoSGLExVvhde8y5gkddOIa
	mLsp73El1xT49aklCBSXtnQvGRQ/03i6W2w9zPzKJortrM4TYqFflsnrwqwxeaKm4xIbn9
	fk4HYtE4xKdp9g2M+165tMF/kv8aKieQYYVTDcXChVaMhiYlIyD7vrHi/97laA==
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
Subject: [PATCH 19/25] ARM: dts: rockchip: Add SPI nodes for RV1106
Date: Mon, 10 Aug 2026 15:11:10 +0300
Message-ID: <20260810121121.210040-20-vlad@zlab.su>
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

Rockchip RV1106 has two SPI controllers. Add the spi0 and spi1 nodes
together with their aliases, using the m0 pinmux and the DMA channels
of the single DMAC.

Compared to Rockchip BSP kernel add missing SCLK_IN_SPI1 to spi1 node.

Both nodes default to status = "disabled" and are enabled per-board.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 58ac297e4d75..ce2f169b1acd 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -30,6 +30,8 @@ aliases {
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
+		spi0 = &spi0;
+		spi1 = &spi1;
 	};
 
 	cpus {
@@ -370,6 +372,38 @@ uart5: serial@ff4f0000 {
 			status = "disabled";
 		};
 
+		spi0: spi@ff500000 {
+			compatible = "rockchip,rv1106-spi", "rockchip,rk3066-spi";
+			reg = <0xff500000 0x1000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cru CLK_SPI0>, <&cru PCLK_SPI0>, <&cru SCLK_IN_SPI0>;
+			clock-names = "spiclk", "apb_pclk", "sclk_in";
+			dmas = <&dmac 1>, <&dmac 0>;
+			dma-names = "tx", "rx";
+			num-cs = <2>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0m0_cs0 &spi0m0_cs1 &spi0m0_pins>;
+			status = "disabled";
+		};
+
+		spi1: spi@ff510000 {
+			compatible = "rockchip,rv1106-spi", "rockchip,rk3066-spi";
+			reg = <0xff510000 0x1000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cru CLK_SPI1>, <&cru PCLK_SPI1>, <&cru SCLK_IN_SPI1>;
+			clock-names = "spiclk", "apb_pclk", "sclk_in";
+			dmas = <&dmac 3>, <&dmac 2>;
+			dma-names = "tx", "rx";
+			num-cs = <2>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi1m0_cs0 &spi1m0_cs1 &spi1m0_pins>;
+			status = "disabled";
+		};
+
 		gpio1_ioc: syscon@ff538000 {
 			compatible = "rockchip,rv1106-gpio1-ioc", "syscon";
 			reg = <0xff538000 0x8000>;
-- 
2.47.3


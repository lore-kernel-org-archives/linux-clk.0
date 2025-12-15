Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB2432BF51;
	Mon, 15 Dec 2025 16:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816033; cv=none; b=IBZNBDsU1fD62Ae232mqOAR1oiRvBGcrXnbYFQinRTv2WGjkUo/9R2anHiE0isPANx6vPxLBOiS74DOss7kz+xzIEtNGivAgKbEaHhm5bQ0/XntERek+vEBHM3PKWYosx3X8+V212A48WcGJquj6O1cU9Tfrp3iBmMW59aAiyU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816033; c=relaxed/simple;
	bh=lv6WeHOLzN4/qsaLqmD30sEVGUM+jW6HmTJ9zT06aPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLHpUCUxhWLLi3l3QwHg+BqAKQ+HtZ0wgGWhhA6m3fo8R0MS0LVhy5LlJRSJvR8kOEjGZdKPG20/PB9cYLm4ugInT6VckV/NT6k334Er8EQLbjKnfplecbAuyeQOtD7fy9E1Ow572cGNdaS7q86wI96jDLO7N5WMTVH7fYFDTzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xvXizGIQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xvXizGIQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1BC541A21E8;
	Mon, 15 Dec 2025 16:27:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4B5A60664;
	Mon, 15 Dec 2025 16:27:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1AED119427CC;
	Mon, 15 Dec 2025 17:27:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765816027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j3DTItJWdi9LPxqF5IOPQvF/znTVfYmJgIlAc45vP7g=;
	b=xvXizGIQOp/xY/60TITOZkpz1O7Q7Z2JF65bPYluAuPI/TvTrTCpFwFdo4I8srQsnD/okC
	Mr+4Ywe1KxNnsWcf8LVyCj+MPOW6IgnaMqZPS8vSu/9EHtE3t48gtNBvMDQKPR4B2q7nwK
	Xir4W2DR3jWtf3RchXBbt1pGo74a0GK6rlrOaDL76wLKgSKGGuGlbsaMBDE4vHcypS0JmK
	q6TmbVZceQ1d31PyNDyQMMQHVC0kpFTp/QaaYK26Jq34A9CgqKSI0VjHh7U2ikKLmRRDFY
	aXYc0FNCw4fAD4X4xocM9ImzOBI5YZ16xR1lZAZTEHMm+PQRW6YDRVb9X9cseQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 15 Dec 2025 17:26:40 +0100
Subject: [PATCH v5 6/7] MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251215-macb-phy-v5-6-a9dfea39da34@bootlin.com>
References: <20251215-macb-phy-v5-0-a9dfea39da34@bootlin.com>
In-Reply-To: <20251215-macb-phy-v5-0-a9dfea39da34@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add both MACB/GEM instances found in the Mobileye EyeQ5 SoC.

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 45 ++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index 36a73e8a63a1..cec5ad875228 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -77,6 +77,8 @@ aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
+		ethernet0 = &macb0;
+		ethernet1 = &macb1;
 	};
 
 	cpu_intc: interrupt-controller {
@@ -231,6 +233,7 @@ olb: system-controller@e00000 {
 			#clock-cells = <1>;
 			clocks = <&xtal>;
 			clock-names = "ref";
+			#phy-cells = <1>;
 		};
 
 		gic: interrupt-controller@140000 {
@@ -305,6 +308,48 @@ gpio1: gpio@1500000 {
 			#interrupt-cells = <2>;
 			resets = <&olb 0 26>;
 		};
+
+		iocu-bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			dma-coherent;
+			dma-ranges = <0x10 0x00000000 0x0 0x0 0x10 0>;
+
+			macb0: ethernet@2a00000 {
+				compatible = "mobileye,eyeq5-gem";
+				reg = <0x0 0x02a00000 0x0 0x4000>;
+				interrupt-parent = <&gic>;
+				/* One interrupt per queue */
+				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "pclk", "hclk", "tsu_clk";
+				clocks = <&pclk>, <&pclk>, <&tsu_clk>;
+				nvmem-cells = <&eth0_mac>;
+				nvmem-cell-names = "mac-address";
+				phys = <&olb 0>;
+			};
+
+			macb1: ethernet@2b00000 {
+				compatible = "mobileye,eyeq5-gem";
+				reg = <0x0 0x02b00000 0x0 0x4000>;
+				interrupt-parent = <&gic>;
+				/* One interrupt per queue */
+				interrupts = <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "pclk", "hclk", "tsu_clk";
+				clocks = <&pclk>, <&pclk>, <&tsu_clk>;
+				nvmem-cells = <&eth1_mac>;
+				nvmem-cell-names = "mac-address";
+				phys = <&olb 1>;
+			};
+		};
+
 	};
 };
 

-- 
2.52.0


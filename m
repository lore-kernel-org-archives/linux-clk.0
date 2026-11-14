Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668121;
	b=YhiwnxaK6I5w7/yLXb+FWYMSNIH2r5Qf6Rip4yObQn0KAE5r1HdT/XJEqQXO1u03Zm9q
	 OxQraULh9BJYtQvTbcUiwnqHvZuINTePSqORnAaBRJmhDzU5UKov+OMsEVHhih65wvKOv
	 QNbpFYXr8Up0v9sqTh3iav+Md6pMy3/I4Eshs6CScXbYpOFTrwa/yfQS8HF8wdmrHMgiT
	 K18yqaTucFSLFH2x41c6vxqKQBoypftPWjo8kzxdew9x01W9+NOeu5Ks7yXQxMrkyVXD8
	 d+zBDQAhfSah9TJ+zH3xygfzIGP3qFkAx8jG5ONSZHz93MRt7hH8g9xdmXd2AZ0LKLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668121;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Me8Ddrl4qdedvCqBvHI/CaV+I9ZnUue9ZLooGkUz6FA=;
	b=NC2IMPKdrCGJhFxlN/toB32lwq5/Y1izhLwvpCojorEZIvAbVA0LoDBTxUzeR7suUvER
	 ekxycOkwmnq89NO82Y32mFgkka6t/mszqyvhDU8nIfxs+g3xqCozyTT0W8/Vm2GTPiGgg
	 XmPGoaU3z+PUReb1G8cO0ZNx5q0Nya385SRcMZaOyQ/sns5xB7FVvZbKdTAiPn0pvv6/S
	 BUGP9HlcM8/Zhnw2BsqGjnX9NcCNgJTp7dBj1y7qTaaBDGfGGc4lliUqa3tFoaW2NWzQ+
	 j62C1LKXdLu7VjBvMbBT0VIe3Yb7LQKU5A1duFT+qFA9eJfoSTDmEQa15CrCupGCtQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EAF606A881;
	Sat, 14 Nov 2026 14:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53EAF606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSF9t-000000005IO-1BVR;
	Sat, 14 Nov 2026 14:55:13 +0000
Date: Sat, 14 Nov 2026 14:55:09 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: nicolas.dufresne@collabora.com, detlev.casanova@collabora.com,
	paulk@sys-base.io, ezequiel@vanguardiasur.com.ar
Subject: [RFC PATCH 5/6] ARM: dts: rockchip: Add RKVENC encoder to RV1126
Message-ID: <7eb3e4d947b7f8a7b2ec068f15f02662b950f697.1794666330.git.daniel@makrotopia.org>
References: <cover.1794666330.git.daniel@makrotopia.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794666330.git.daniel@makrotopia.org>

Add the encoder with its IOMMU, the VEPU power domain and the three
QoS nodes of the encoder ports. The encoder AXI clock is set to
297 MHz and the core clock to 396 MHz.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm/boot/dts/rockchip/rv1126.dtsi | 54 ++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index 74f238e13533c..63705291dd3ce 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -139,6 +139,21 @@ qos_sdio: qos@fe86c000 {
 		reg = <0xfe86c000 0x20>;
 	};
 
+	qos_venc_rd_m0: qos@fe870000 {
+		compatible = "rockchip,rv1126-qos", "syscon";
+		reg = <0xfe870000 0x20>;
+	};
+
+	qos_venc_rd_m1: qos@fe870080 {
+		compatible = "rockchip,rv1126-qos", "syscon";
+		reg = <0xfe870080 0x20>;
+	};
+
+	qos_venc_wr: qos@fe870100 {
+		compatible = "rockchip,rv1126-qos", "syscon";
+		reg = <0xfe870100 0x20>;
+	};
+
 	qos_iep: qos@fe8a0000 {
 		compatible = "rockchip,rv1126-qos", "syscon";
 		reg = <0xfe8a0000 0x20>;
@@ -223,6 +238,17 @@ power-domain@RV1126_PD_VO {
 					 <&qos_iep>;
 				#power-domain-cells = <0>;
 			};
+
+			power-domain@RV1126_PD_VEPU {
+				reg = <RV1126_PD_VEPU>;
+				clocks = <&cru ACLK_VENC>,
+					 <&cru HCLK_VENC>,
+					 <&cru CLK_VENC_CORE>;
+				pm_qos = <&qos_venc_rd_m0>,
+					 <&qos_venc_rd_m1>,
+					 <&qos_venc_wr>;
+				#power-domain-cells = <0>;
+			};
 		};
 	};
 
@@ -630,6 +656,34 @@ vop_mmu: iommu@ffb00f00 {
 		status = "disabled";
 	};
 
+	venc: video-codec@ffbb0000 {
+		compatible = "rockchip,rv1126-rkvenc";
+		reg = <0xffbb0000 0xf00>;
+		interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VENC>, <&cru HCLK_VENC>,
+			 <&cru CLK_VENC_CORE>;
+		clock-names = "axi", "ahb", "core";
+		assigned-clocks = <&cru ACLK_VENC>, <&cru CLK_VENC_CORE>;
+		assigned-clock-rates = <297000000>, <396000000>;
+		resets = <&cru SRST_VENC_A>, <&cru SRST_VENC_H>,
+			 <&cru SRST_VENC_CORE>;
+		reset-names = "axi", "ahb", "core";
+		iommus = <&venc_mmu>;
+		power-domains = <&power RV1126_PD_VEPU>;
+	};
+
+	venc_mmu: iommu@ffbb0f00 {
+		compatible = "rockchip,iommu";
+		reg = <0xffbb0f00 0x40>, <0xffbb0f40 0x40>;
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VENC>, <&cru HCLK_VENC>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RV1126_PD_VEPU>;
+		rockchip,disable-mmu-reset;
+	};
+
 	gmac: ethernet@ffc40000 {
 		compatible = "rockchip,rv1126-gmac", "snps,dwmac-4.20a";
 		reg = <0xffc40000 0x4000>;
-- 
2.56.0

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774131;
	b=35Z34EXYj0nxu+3VMwX7NyXXlcFYJV0l9LENIw5mAXebZHbbXF3zEwg5sFwYPDSvG6tu
	 iqj9WdwooMWgkH+VuRtG7CnegTf+/H5/azTGndNuyOnoGE60SA8vvLaAPShlXcTxDKLDr
	 Z17U6llNEnKF+XmbJFs1ltnTNiEN3DTFrrltG4ck1G+UsxOUnX+WKs3VYKyIFgGHrJDy5
	 DkrZC6lV8otXZwtq6hEBCjoApRvbW88o8H6/sSieW8d+FK/huDH2h06LOOU01qWiT0ujL
	 Eq8nw+D4IAjkCswsb7BsiUgSDzZ+eNv2syeAUyT0EX9GB9/WHSMmN4MLj0jL+YHEDbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774131;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+nxyRoWCu7CfU2+fdWvrSr0XQ5l6/RharDIAbF7p6Tc=;
	b=nBp8N/LjIOE5/iK/gA3n900uqCBdJAjCVXUq1GdtWOtgOQd+qQ2HwKNDcp/Ywl89if0E
	 xvq7DthtAuxsOezTwvDbjwTt9uCkGs0JIlEx5TrTba6Rcdbp/MsuJAjXwP+4EWHYWKNF+
	 A9chqVi0htDSIBZo16kNVorYNddibLtXYkn0PuZv484vCzX1HpWKPMmUobRzQVC5ek7jf
	 LFHxWh9Uq42NQKybP8IhogKcp1Jk0KBmIFshQ8weSpS3Aesquy32dGPeu0zO0Gewf95H+
	 R0Y9TYtByaVveYoU8BWWCAcdbBH1Fj1jWO8UXHIiUrUbNxHXWVUDyAKcme5ZtpP8WVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=SOLCrig4;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678A0606A327;
	Fri, 27 Nov 2026 10:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 678A0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=SOLCrig4
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 4A20B4C98A;
	Fri, 27 Nov 2026 21:08:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795774122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+nxyRoWCu7CfU2+fdWvrSr0XQ5l6/RharDIAbF7p6Tc=;
	b=SOLCrig4Kwip2aPdJgn5t0w0qWhTb7mV9oa9Qlc6974hsy0uBqvEFK/SDo1PRqYJ8/HTzV
	u0Jr6Il56s4xfDCkJFqLOXM6UMaD2RqCXSxyWG+U+5wAD2erEWexzn/cTFICQbiZ5pCtNV
	QFO9sH4c2GzeB9m6QSTLThUtxr83GHaNu7NyOLW8hb/qJx4v5kTnV0mic1mWvOH7E3ujhR
	AQE2hyzCxfxRNQ79jSANv+bcKNOpA85BdoylyarkzGtwIuus/fKeosjZAea2jb9q3tPMaF
	g7EiLWwktC0+JHo+QXLbsyNxGFRl/Z+7QueDWQKt307ARZEmhbE5Kn/MA6W8Mw==
X-GPT-Reason: legitimate; this is a technical personal/business
	communication regarding a software patch (Linux kernel/device
	tree style), which aligns with the mailbox alastair@d-silva.org;
	the From domain (d-silva.org) matches the recipient domain perfectly;
	the content is a standard technical update with no signs of marketing,
	urgency, or phishing.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 5/6] arm64: dts: allwinner: sun60i-a733: Add USB 2.0 host nodes
Date: Fri, 27 Nov 2026 21:08:07 +1100
Message-ID: <20261127100808.2292229-6-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127100808.2292229-1-alastair@d-silva.org>
References: <20261127100808.2292229-1-alastair@d-silva.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the usbphy, ehci0, ohci0, ehci1, and ohci1 nodes for the Allwinner
A733 SoC.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index e062b08006da..96fe8c8c44ed 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -546,6 +546,88 @@ mmc2: mmc@4022000 {
 			status = "disabled";
 		};
 
+		usbphy: phy@4100400 {
+			compatible = "allwinner,sun60i-a733-usb-phy";
+			reg = <0x04100400 0x100>,
+			      <0x04101800 0x100>,
+			      <0x04200800 0x100>;
+			reg-names = "phy_ctrl",
+				    "pmu0",
+				    "pmu1";
+			clocks = <&ccu CLK_USB01_REF>,
+				 <&ccu CLK_USB01_REF>,
+				 <&ccu CLK_BUS_OTG>;
+			clock-names = "usb0_phy",
+				      "usb1_phy",
+				      "bus";
+			resets = <&ccu RST_USB_PHY0>,
+				 <&ccu RST_USB_PHY1>;
+			reset-names = "usb0_reset",
+				      "usb1_reset";
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
+		ehci0: usb@4101000 {
+			compatible = "allwinner,sun60i-a733-ehci",
+				     "generic-ehci";
+			reg = <0x04101000 0x100>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_AHB_USB_SYS>,
+				 <&ccu CLK_BUS_OHCI0>,
+				 <&ccu CLK_BUS_EHCI0>,
+				 <&ccu CLK_USB_OHCI0>;
+			resets = <&ccu RST_BUS_OHCI0>,
+				 <&ccu RST_BUS_EHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci0: usb@4101400 {
+			compatible = "allwinner,sun60i-a733-ohci",
+				     "generic-ohci";
+			reg = <0x04101400 0x100>;
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_AHB_USB_SYS>,
+				 <&ccu CLK_BUS_OHCI0>,
+				 <&ccu CLK_USB_OHCI0>;
+			resets = <&ccu RST_BUS_OHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ehci1: usb@4200000 {
+			compatible = "allwinner,sun60i-a733-ehci",
+				     "generic-ehci";
+			reg = <0x04200000 0x100>;
+			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_AHB_USB_SYS>,
+				 <&ccu CLK_BUS_OHCI1>,
+				 <&ccu CLK_BUS_EHCI1>,
+				 <&ccu CLK_USB_OHCI1>;
+			resets = <&ccu RST_BUS_OHCI1>,
+				 <&ccu RST_BUS_EHCI1>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
+		ohci1: usb@4200400 {
+			compatible = "allwinner,sun60i-a733-ohci",
+				     "generic-ohci";
+			reg = <0x04200400 0x100>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_AHB_USB_SYS>,
+				 <&ccu CLK_BUS_OHCI1>,
+				 <&ccu CLK_USB_OHCI1>;
+			resets = <&ccu RST_BUS_OHCI1>;
+			phys = <&usbphy 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		r_ccu: clock-controller@7010000 {
 			compatible = "allwinner,sun60i-a733-r-ccu";
 			reg = <0x07010000 0x250>;
-- 
2.53.0


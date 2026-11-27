Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764832;
	b=JOaPj+93xBoLSE+wa+c5VUmTdBsaLSEmGCdhcs0xlQmnJlr6pA+4eNC6kFfLSA6a2dVg
	 snAwNJz39ihbtecQYa4Mu4xRF119QgEhrJ2usP0wefmWDYoRdII1oeQkEJ5WLe0Hhxtus
	 YM5xW5FMMFXAlRPCklwvFzNdcUttjf8gIHxe2NW65tTi91qXu25A6ksyLarzfEnKohQ8e
	 Quq2/fnfhlovz7CPbPvJga7aIDokdJ6o/GKLpergHR2vdXV0utEjL1VWbJNUpagbnXECU
	 fdjk5G1KiDpIXWz99FOM+K9OnxXjE8yZjX77MqxWYw/LST3FjCPTgXILk7pHbV3FQHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764832;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8A8S1jWk34apBiXJlfAaqdzx6fd+5x02e35XFIlzQ5U=;
	b=5p1b+9nfSUUoEo9tg/KqrfGvD4eSGejIYu6NrCoflcSK0Pe/cOM9RufZzl5bqV1wv6ZY
	 xC0SlrZKxa/ijM9IkA5fN7Y6skpuIfuU1+aJYUQR3SKyjOYBClrp3uCisS5hUeNvqYx57
	 SENv+yc7FCr41m9Dkir8wUBsxvNmlP1DL8DErrGImq/Imv1RFTogJ5i3kbdJavEUX6dlI
	 fTnGnqgZdU0qaWTSzK9vGqiETXGRA1qLuQ7Ly69ZHfPKtG1rbsfESEC9jx/L1AY5127Zx
	 2S+mycFtvfuosVVY53k1hH92nuuHLBG/17VmDqcTYvDmsTcfQEeDmf2XbY1pYtVBvqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=pD8VRaij;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDCC606A327;
	Fri, 27 Nov 2026 07:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DDCC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=pD8VRaij
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id B0D1F4C96E;
	Fri, 27 Nov 2026 18:33:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8A8S1jWk34apBiXJlfAaqdzx6fd+5x02e35XFIlzQ5U=;
	b=pD8VRaijS6rf1TN42ht5h35+Z6Py/GT4mTiu1+2Fv5rF8FTqvrnbjo6XvG5eeG6N7YfbHY
	7P1MKFPHDvjtzmjexWZF998f5qtRbRVuN+QH4Svj7wdjAT534qb8NSCEJjgACdGxKlwfeY
	be3sS9F/FmrFD9HFvjeD8S9Z/kq3gZi7nmohkihc21zW1OBAdwBqsr6d7p+vkHB5j8RB0y
	I9Z1i5dlbGHTEKNDJfo3/i0Etowm9i5c5Klb7DogGmzQ6l7CQr5zkT9chj9dUaJaLrMbG4
	8KociYsJY0ravWm/wDf+08MiUBwePExc36GcFFks3ICTS5N0WdjhsyRBLTMRIQ==
X-GPT-Reason: This is a legitimate personal/technical correspondence.
	The mailbox (alastair@d-silva.org) perfectly matches the sender
	identity (alastair@d-silva.org) and the technical content of the
	message. There are no phishing indicators, urgency/fear tactics,
	or suspicious URL domains present. The content follows a standard
	Linux kernel patch format (DTS/arm64) consistent with a developer's
	workflow.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 10/11] arm64: dts: allwinner: sun60i-a733: Add USB 3.0 controller and PHYs
Date: Fri, 27 Nov 2026 18:32:30 +1100
Message-ID: <20261127073231.1776847-11-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
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

Add dwc3, u2phy, and combophy0 nodes to sun60i-a733.dtsi.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index 8ac2fcd11937..6999adfc246c 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/clock/allwinner,sun60i-a733-r-ccu.h>
 #include <dt-bindings/clock/sun6i-rtc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/allwinner,sun60i-a733-pck-600.h>
 #include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
 #include <dt-bindings/reset/allwinner,sun60i-a733-r-ccu.h>
@@ -547,12 +548,72 @@ mmc2: mmc@4022000 {
 			status = "disabled";
 		};
 
+		dwc3: usb@6a00000 {
+			compatible = "allwinner,sun60i-a733-dwc3";
+			reg = <0x06a00000 0x100000>;
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&ccu CLK_BUS_USB2>,
+				 <&ccu CLK_USB2_MF>,
+				 <&ccu CLK_USB2_SUSPEND>,
+				 <&ccu CLK_AHB_USB_SYS>,
+				 <&ccu CLK_USB2_U3_UTMI>,
+				 <&ccu CLK_USB2_U2_PIPE>,
+				 <&ccu CLK_USB2_SYS>;
+			clock-names = "bus_early", "ref", "suspend",
+				      "ahb", "utmi", "pipe", "sys";
+			assigned-clocks = <&ccu CLK_USB2_SUSPEND>,
+					  <&ccu CLK_USB2_MF>;
+			assigned-clock-parents = <&ccu CLK_SYS_24M>,
+						 <&ccu CLK_SYS_24M>;
+			assigned-clock-rates = <24000000>, <24000000>;
+			resets = <&ccu RST_BUS_USB2>;
+			power-domains = <&pck600 PD_USB2>;
+			phys = <&u2phy>, <&combophy0 PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			maximum-speed = "super-speed-plus";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			status = "disabled";
+		};
+
+		u2phy: phy@6b00000 {
+			compatible = "allwinner,sun60i-a733-u2phy";
+			reg = <0x06b00000 0x800>;
+			clocks = <&ccu CLK_BUS_OTG>, <&ccu CLK_AHB_USB_SYS>;
+			clock-names = "bus", "ahb";
+			resets = <&ccu RST_BUS_OTG>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		serdes_syscon: syscon@6c00000 {
 			compatible = "allwinner,sun60i-a733-serdes-syscon",
 				     "syscon";
 			reg = <0x06c00000 0x8000>;
 		};
 
+		combophy0: phy@6c80000 {
+			compatible = "allwinner,sun60i-a733-combophy0";
+			reg = <0x06c80000 0x20000>;
+			clocks = <&ccu CLK_SERDES_PHY>,
+				 <&ccu CLK_AHB_SERDES>,
+				 <&ccu CLK_MBUS_SERDES>,
+				 <&rtc CLK_HOSC_SERDES0>;
+			clock-names = "serdes", "ahb", "mbus", "ref";
+			assigned-clocks = <&ccu CLK_SERDES_PHY>;
+			assigned-clock-parents = <&ccu CLK_PLL_PERIPH0_600M>;
+			assigned-clock-rates = <100000000>;
+			resets = <&ccu RST_BUS_SERDES>;
+			power-domains = <&pck600 PD_PCIE>;
+			#phy-cells = <1>;
+			allwinner,serdes-syscon = <&serdes_syscon>;
+			status = "disabled";
+		};
+
 		r_ccu: clock-controller@7010000 {
 			compatible = "allwinner,sun60i-a733-r-ccu";
 			reg = <0x07010000 0x250>;
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461202;
	b=LBVcvLWrOMWbE2jOrXh1SSx3fd31d8O632VZDpLA6AGwCtI2H1XJWRfg194OtQSvCdvn
	 oQiLjmvLTxlwN5zFA6uzNhWOKfMltrqC5ydqYMYiXqVQo+vaYN6CzI5AU+GlS5BnHw8B2
	 8jV2R/BAluaRUv9UJt90D7e11wzQ/rAOtxhQ08JfzyRhfqbTrx0Ice38MsSf49bML0Tyo
	 KF2QoQZF8F9ctMQngogi0a7difUjO/oizOLy4aTSVcOtswviu+7QjsUWc/J2LR2HJNWys
	 bXn3InzNUXnSDgVCeEP+pi8hiYH+D96junQfEYfTbNtma0/AIxkqhKjZzAPFW0TBDOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461202;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=Ynod8qXmuhlfhApQcwxDirfilx/nYjgeDnwYlvGthvA=;
	b=PPwMd9WZy9hZztJpSj65aSj7N5wnRhnPULQEHJk9DgCTx5EjWz5o9O+paFvO/rJgguGH
	 IZoNXxhyWcWViMrI4BvWSO2qa+bGywaq6Zj+etSGywzXR4InwfPmzAs7v1pmSDHH9qH8L
	 VU/durdzRPY41CcFEQVUQRSJC3weSh1mJvJ9Q8SZgv4TbE4ANAPF2URt+G3r/U1gf5x0R
	 CbcdqhiArhRrqT/tgAuqt1QIHEVankaIVLWEW5x6fN1DgK2JwQoyC7VlEYXnxOMsBanoB
	 G+IESCBvBeVaK90fw4y/C3wGSy8AtDVHStp5p4EiyTaUYaXKsyJF9fmIETzDXTRYV/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SPxREyib;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ABE606A339;
	Thu, 12 Nov 2026 05:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72ABE606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=SPxREyib
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC5PmOlA3459368, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794461148; bh=Ynod8qXmuhlfhApQcwxDirfilx/nYjgeDnwYlvGthvA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=SPxREyibyBP66+PesrnHmFZOWwFOo4OnO7XgO78xyC3IOnq0DdRyk/pE5xtPI+u1q
	 LSR52obGj6jffHs2boPZisGRv2qCJSzso1fDDCSm9PShuu1WvTBiM2Zh2bbC/by/1/
	 ZDcP1if48ORQtkrJruNejBUarcsRyl3gx/gkadJp/fIUVHl9Nf7pUuGioeoSP+iNJU
	 h5UM6RUkhf+99lL0p3NAgumbuVIXD7DK3H4pJ6zTVaKH3LDVoOzveD/9m03Hdwl4L6
	 aqQ28tBPS/qd+xsq2xiDNGzIJdexGj0+bi7fNHc/lEBf6jM40BgmXBAg/C2rq922E9
	 +19QEs+arFjgQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC5PmOlA3459368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Nov 2026 13:25:48 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:48 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 13:25:48 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 13:25:47 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v16 9/9] arm64: dts: realtek: Add clock support for RTD1625
Date: Thu, 12 Nov 2026 13:25:44 +0800
Message-ID: <20261112052544.555563-10-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261112052544.555563-1-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
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
Content-Type: text/plain

Add the clock controller nodes and osc27m fixed clock for the
Realtek RTD1625 SoC.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v16:
- Add 'clock-names = "osc27m"' to the 'cc' and 'iso_s_cc' clock controller nodes.
- Explicitly wire up internal parent clocks from the 'cc' controller to the 'ic'
  clock controller, along with their corresponding 'clock-names'.
---
 arch/arm64/boot/dts/realtek/kent.dtsi | 41 +++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index df0d5ee3b1b9..fdb2bc2b3c79 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -5,6 +5,7 @@
  * Copyright (c) 2024 Realtek Semiconductor Corp.
  */
 
+#include <dt-bindings/clock/realtek,rtd1625-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
@@ -26,6 +27,15 @@ timer {
 			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	clocks {
+		osc27m: osc {
+			compatible = "fixed-clock";
+			clock-frequency = <27000000>;
+			clock-output-names = "osc27m";
+			#clock-cells = <0>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -141,6 +151,28 @@ rbus: bus@98000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			cc: clock-controller@0 {
+				compatible = "realtek,rtd1625-crt-clk";
+				reg = <0x0 0x900>;
+				clocks = <&osc27m>;
+				clock-names = "osc27m";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			ic: clock-controller@7088 {
+				compatible = "realtek,rtd1625-iso-clk";
+				reg = <0x7088 0x8>;
+				clocks = <&osc27m>, <&cc RTD1625_CRT_CLK_SYS>,
+					 <&cc RTD1625_CRT_CLK_SYSH>,
+					 <&cc RTD1625_CRT_CLK_DDSA_DIV4>,
+					 <&cc RTD1625_CRT_CLK_EN_MISC>;
+				clock-names = "osc27m", "clk_sys", "clk_sysh", "clk_ddsa_div4",
+					      "clk_en_misc";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
 			uart0: serial@7800 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x7800 0x100>;
@@ -205,6 +237,15 @@ isom_pinctrl: pinctrl@146200 {
 				reg = <0x146200 0x34>;
 			};
 
+			iso_s_cc: clock-controller@146310 {
+				compatible = "realtek,rtd1625-iso-s-clk";
+				reg = <0x146310 0x8>;
+				clocks = <&osc27m>;
+				clock-names = "osc27m";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
 			ve4_pinctrl: pinctrl@14e000 {
 				compatible = "realtek,rtd1625-ve4-pinctrl";
 				reg = <0x14e000 0x84>;
-- 
2.43.0


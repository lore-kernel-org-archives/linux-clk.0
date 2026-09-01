Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1254582FF;
	Tue,  1 Sep 2026 07:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247564; cv=none; b=r448zX7f3r2XGaj7RAgTGTen1ggv1GdGaaQ3wxlMFuE+hG5wUYSQBbPasg4p6MrIf/iO1hy7i4LqBvSeSQ0DDploi9BnWfxJq8RNxN/0BCdBV/BSzU7d6oLg/P9XPUNFdgpMdT/dvf0EQEshcVm79Tu19/neClTxIj6Vfr9yrN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247564; c=relaxed/simple;
	bh=dNgH3lyCtpA3V8cFO7FQPb8j7tFiqM5B/uLIVsRuLi4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oLHAldybGsu+eZrO+iQvl/WyogPnHOcKVqUl8qOj1O+j1ccjkI+9l0SRkASeMNO4B+mp9SqFaV5NCuFDPcDEa0e8wyPq8KW34Qju2kOLnpkczyDHvp3qs3Lc6Byc7LxkTxdn+SX6fB9AQu2FGDqHDX1wJdtbIgfQ5tdTJvdl3XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=dYg/47Tj; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="dYg/47Tj"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6817P5Et81484652, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788247506; bh=N4pHdGDaeXFOV19NNAycdrVRIPLXjkF9jML9EtWve2s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=dYg/47TjJHjrqIBmZ7qPjW4SlX57v+4PYO2jmQu9v4hgzSHsGhKXmZR5SIjhPk4qN
	 MQ/ESP9kZILMR4WhVdHBhskTbXeJsW6t6LTnVZ+h5allcvBnfaGQHT57eIVSh5dQW1
	 yF0JJ8pxWNGdO07J/P6sffgTnYcp5OxDThFCz+QLJWn9Szez3IW//66e35OCy+COIx
	 BHMKHoYADL9uNKJ35okUhWzKAEz2RMmfqL9UTzh6briQ2XxIwBae7vZudJnqH3yOdd
	 f8MOgX43Huj4fMCOKnCp0u6EVVRchCkRq449OTsNpmR5vEdY7j7hwr6Rws2Mljb+Lk
	 DFi5xTfzuLZkQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6817P5Et81484652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Sep 2026 15:25:06 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 1 Sep 2026 15:25:04 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.2562.43 via Frontend
 Transport; Tue, 1 Sep 2026 15:25:04 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<p.zabel@pengutronix.de>, <cylee12@realtek.com>, <afaerber@suse.com>,
	<jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v14 11/11] arm64: dts: realtek: Add clock support for RTD1625
Date: Tue, 1 Sep 2026 15:24:46 +0800
Message-ID: <20260901072446.2563145-12-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260901072446.2563145-1-eleanor.lin@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the clock controller nodes and osc27m fixed clock for the
Realtek RTD1625 SoC.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v14:
- None.
---
 arch/arm64/boot/dts/realtek/kent.dtsi | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index 8d4293cd4c03..409d46a73c91 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -26,6 +26,15 @@ timer {
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
@@ -141,6 +150,22 @@ rbus: bus@98000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			cc: clock-controller@0 {
+				compatible = "realtek,rtd1625-crt-clk";
+				reg = <0x0 0x900>;
+				clocks = <&osc27m>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
+			ic: clock-controller@7088 {
+				compatible = "realtek,rtd1625-iso-clk";
+				reg = <0x7088 0x8>;
+				clocks = <&osc27m>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
 			uart0: serial@7800 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x7800 0x100>;
@@ -166,6 +191,14 @@ isom_pinctrl: pinctrl@146200 {
 				reg = <0x146200 0x34>;
 			};
 
+			iso_s_cc: clock-controller@146310 {
+				compatible = "realtek,rtd1625-iso-s-clk";
+				reg = <0x146310 0x8>;
+				clocks = <&osc27m>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
 			ve4_pinctrl: pinctrl@14e000 {
 				compatible = "realtek,rtd1625-ve4-pinctrl";
 				reg = <0x14e000 0x84>;
-- 
2.43.0


Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADFF39A81B;
	Wed, 10 Jun 2026 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078962; cv=none; b=RJDExG3BHYTke0MFua4yly6ZIbA57IFD+qSbJd04hwvQCFZ/w11w+BSOnkm/RE2usVARwpvAeCmZVAgGMiTIJwRyJpXh6u46V7VU7EHD21aiMJQHmeHM6HYtjTWg+Uka0XWRrY95AVlbsjnuiYXZiJainQQd+iVu6PhfF5OYpcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078962; c=relaxed/simple;
	bh=Drmfv2iuX8OJ2zc57v+Qo28KTuR8okDg/P7LqKZ6rm0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z5/3L3WKuZYrKe7bjp5KYY8VG5Z65oDUnDEqOsCCKMUf9yDI+bTSEDxUKeYIVvvXf3LSkCDkAzUB9zat3CeIFlvfDvPQjR8oh5ZT2C1Cg2qfki4aYwPSvUaTJ364qYg7jLxg7yPBzJQ7p22T+Zdsxq7DNuBx9AJ7JhCQl1n396E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=kORu0yyf; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="kORu0yyf"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65A88S2g8983557, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1781078908; bh=2ywoUvqlZEreLMeVQokGqpBBvkH6ErtEfQBBvhpqDcs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=kORu0yyfcEbEbnEhxgeT0ghKWmviDyA3ZfrozxBfedUySHCr1ySOpf1MRqskcvKKI
	 unBnswwTt2LRykw7sJ/2XzEpo+x82uHR0fFY2STSkn09iGJSepJNISRY7MInK7G5Bq
	 THzqENWMk0AMt/00W9UQB+5WUvxYuL+cz6jeCyljs/TBUY6xfdUXxM5cjCIaRLSQJW
	 wETPGo/OcQ3QGDSGbqCsh2PFQ2HMh2iYJT6KM/bHk9viBecjRJCPoZwxYKLiBqqclg
	 wEZsamXMwZ5jOiLWj1NdgiJ6OEk7sgvQOghCL0ciE5mSMwdsh2eWDWs/v0MSwyxFIv
	 WsF+nsD7pmQ8g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65A88S2g8983557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Jun 2026 16:08:28 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Jun 2026 16:08:28 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Jun 2026 16:08:28 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <bmasney@redhat.com>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v8 10/10] arm64: dts: realtek: Add clock support for RTD1625
Date: Wed, 10 Jun 2026 16:08:24 +0800
Message-ID: <20260610080824.255063-11-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260610080824.255063-1-eleanor.lin@realtek.com>
References: <20260610080824.255063-1-eleanor.lin@realtek.com>
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
Changes in v8:
- Sort device nodes by unit address.
---
 arch/arm64/boot/dts/realtek/kent.dtsi | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index ae006ce24420..69f28cb35585 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -26,6 +26,15 @@ timer {
 			     <GIC_PPI  9 IRQ_TYPE_LEVEL_HIGH>;
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
@@ -150,6 +175,14 @@ uart0: serial@7800 {
 				reg-shift = <2>;
 				status = "disabled";
 			};
+
+			iso_s_cc: clock-controller@146310 {
+				compatible = "realtek,rtd1625-iso-s-clk";
+				reg = <0x146310 0x8>;
+				clocks = <&osc27m>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
 		};
 
 		gic: interrupt-controller@ff100000 {
-- 
2.43.0


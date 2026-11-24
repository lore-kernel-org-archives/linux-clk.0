Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487827;
	b=B3H+r8OKnRay6BgIImqAj5RFbrfz71K9ZUHrmFj6P9GB4/1F6MxTaBowy6DEt+2JIp9C
	 fFOKflSQlNdJJIAfo2srYTQNCgAIBeUXxC/5W9cTeSmU5mBHeK642F+wZKP/Ixc/6TY3G
	 NUkgvH+XUvvLjyF34AJPYSwhi1l6kzfBlNyhXe0PuZU/l+5g1HvPBmukj32R+oQJF4A6U
	 jxt627/YMr+jCqFOkqOc8MHKMhCXCtPmWe6F34B18kuEIQ0igfo+XnAWqDlENSTetGHSI
	 llm+xAqoc0a6l5R2wKh6xFejElhnN6ucFZdGjRQTsqxKec4CNz22QrQOjlT/Sm4zMkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487827;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=3Y2EnOAeIsHZsfowkV9FTJH+OT6UsIZrnKOE8UVhfp8=;
	b=iwAse80sMstraZhgbSdtZC8GwYdl3eMPOAzeF+V9BM0PEEMEAoVIn2YOGFgTqC/d2B/U
	 hrd4sg7H81859ALycd+6viFWbGFPtdrKHLx23MvH9ZHBX6BfZpbXu2LIL7O7KJde8NlbG
	 gEIxKtVpTpR3YQtgrpwwBJorpbX8GrQl8HHAfdulIxk1T7lzLNjQ6uA6qhKXYK0DXjhnc
	 wIZtyxYXvYpsQ+eWOFr1ipN6Y4evvCsewpvXGZ08cTgj3RPf2ZtaIbt+sEs+mPT8VsT+k
	 hlYu6O+k2hSkgp2aQcvVGmNvll9+lqYa5ARv+rJSu3sYTHmtGDqyVuBwhtp34sxjaCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=T4+l3AMX;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341F4606A31E;
	Tue, 24 Nov 2026 02:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 341F4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=T4+l3AMX
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AO2a1rsD2160567, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795487761; bh=3Y2EnOAeIsHZsfowkV9FTJH+OT6UsIZrnKOE8UVhfp8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=T4+l3AMXOEeo0bhZTqlYuhnBXEfNXSqKdeQFV+0En2l4EHjPcoulXJt78Vr2KDKp7
	 sivV8ylnDt3+9cK27EFn7C15JsJzpe2ReENqCUNRQGzXeeFWmWsRU8PqwGm2c9g+gE
	 ebxWX4sLetVRd5cMztmzASaI6q5LpGposvu1QxUPQ2apsH5P5FjNSPTXrh28Zx9obd
	 598vLFthU5OQsW6rG06Yg3jqudRp+k8RWNqaFPykg1zg3ZeABQqJ1U9ivslDwJc+qN
	 OklSHPEwPuSGwS2A13jZJkToL59F3WUhrr2QS6BKgwwkvo2LIjio5gA8VqaDb+tOZP
	 8M8PcdxvG0ufQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AO2a1rsD2160567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 10:36:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 10:36:00 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 10:36:00 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v17 9/9] arm64: dts: realtek: Add clock support for RTD1625
Date: Tue, 24 Nov 2026 10:35:57 +0800
Message-ID: <20261124023558.4088635-10-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124023558.4088635-1-eleanor.lin@realtek.com>
References: <20261124023558.4088635-1-eleanor.lin@realtek.com>
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
Changes in v17:
- None.
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


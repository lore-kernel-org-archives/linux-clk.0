Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FEF39446D;
	Fri,  8 May 2026 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239097; cv=none; b=c1qFW8wiqHnbVAUWePL/22TjuIuXgpAwTJ0DiezVoH6H+qQho8zOBP6pceHXZ7wgWyIgpI7ulkr9zchKqTAbx0KvmDrAYUi8zhmsiGXdKA8Du9tlYPkRI+dU7BZ7byYbi0EGn04x224p0dQzerD/oer7AvbQYZvEr0heKIKVrtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239097; c=relaxed/simple;
	bh=b+f8WVgxcfFVdLR15zIdkcFeIiFKCfqXS0EqIibTu/s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tdO9U3i0Us1Q1TMTZpV76Hn0Bpcr/ETaEy+m5g9ybofvXotHVDS1ibtkHxrHJp9ujCrKqKAFHunaizNBzu8exF/zZ4uroPMpV0F+YTlr4VoVpedYCyXStQLL5l6q2oIVA82S13K5PGx8gBkQcp4EyCL9tc2t9GbkUvFElcqbCvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=MbyCnffM; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="MbyCnffM"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 648BGhE523763959, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1778239003; bh=BJ0U5leuNpT+x7t9YPGO2C7AKeGOlIRyILg9lIOmw6A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=MbyCnffMMcUxDBQOnzRRVYvJ+NCWOpu2weKru55kuQABlsh4CtaUCIaRZl0+eWHFa
	 n4BgVD4q/vehIkbp8ZMThLm7MyDZO3Oa16wvo3cngYrBV7PgoZZ1fabD8Iy31o5YqM
	 4cizXzRYmeI30sO48hYaXs7pa3GWwHYlvNTj/6ySWXAmjrde4qMJP/PiRnX/JJBMT+
	 Qe0Fuyto/R5ETAGhg/c9EgBIggM8jxXZ1B/gv9RVpmMa2gt1arTw2Iq8+7HaeC/OT1
	 3dTl0Z6iY8LoaNHYk2baWLs+1lIi4PLVcTnLeccFSsO/q1L2ahzxRqXs77dldIb64n
	 OP6E5/xhRLB6g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 648BGhE523763959
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 May 2026 19:16:43 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 8 May 2026 19:16:43 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 8 May 2026 19:16:43 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 8 May 2026 19:16:43 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <bmasney@redhat.com>
Subject: [PATCH v7 10/10] arm64: dts: realtek: Add clock support for RTD1625
Date: Fri, 8 May 2026 19:16:41 +0800
Message-ID: <20260508111641.3192177-11-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260508111641.3192177-1-eleanor.lin@realtek.com>
References: <20260508111641.3192177-1-eleanor.lin@realtek.com>
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
 arch/arm64/boot/dts/realtek/kent.dtsi | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index ae006ce24420..4722337a143d 100644
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
@@ -141,6 +150,14 @@ rbus: bus@98000000 {
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
 			uart0: serial@7800 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x7800 0x100>;
@@ -150,6 +167,22 @@ uart0: serial@7800 {
 				reg-shift = <2>;
 				status = "disabled";
 			};
+
+			ic: clock-controller@7088 {
+				compatible = "realtek,rtd1625-iso-clk";
+				reg = <0x7088 0x8>;
+				clocks = <&osc27m>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
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
2.34.1


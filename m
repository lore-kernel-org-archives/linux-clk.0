Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634AA1993B6
	for <linux-clk@vger.kernel.org>; Mon, 25 Nov 2024 10:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732530827; cv=none; b=j/+mDoP4pMVCSN8KLU3zjwdyJ9+8Cr3Lz8b57vewj09X+GDEhSczZ87R1Cpll4IN3SHayt4AYfGtYJXYCq9sV0llo2mpBTQ9GaFMJoXioVvVJfHHlm0/u05K4kcPVOvOD+bdPKWKvVrgSjoe1D73PsT2bMV3kBrdYxTb2+jh844=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732530827; c=relaxed/simple;
	bh=7AN7KnYg4xrZ/VWYLA3GhcGWJkKWBkzUHxgeBRRx80s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F3oTgkiyt7+0LvPidNEc7Ls+5HA6EtXaGZ8QCFH31g5++P2dEXc89EAokEL+GGVsof/Xo7zcbYyyaXazdWO2wRUgBSowXTgYWkFgau/pJN3RU5zp/QJolkY25HFQwHtFRlH4RZpz3PwKrbC80jzRyjOOsPcOSab1kwFZkhE2jKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1tFWPP-0001Fo-CQ; Mon, 25 Nov 2024 11:33:35 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 25 Nov 2024 11:33:20 +0100
Subject: [PATCH v2 1/4] arm64: dts: agilex5: add gpio0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-v6-12-topic-socfpga-agilex5-v2-1-864256ecc7b2@pengutronix.de>
References: <20241125-v6-12-topic-socfpga-agilex5-v2-0-864256ecc7b2@pengutronix.de>
In-Reply-To: <20241125-v6-12-topic-socfpga-agilex5-v2-0-864256ecc7b2@pengutronix.de>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-clk@vger.kernel.org, kernel@pengutronix.de, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

gpio0 is the same as gpio1 with a different base address.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 1162978329c1637aa0fd9a4adef16a9ae5017ac3..b1debf0317d0576f7b00200e9593481671183faa 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -222,6 +222,25 @@ i3c1: i3c@10da1000 {
 			status = "disabled";
 		};
 
+		gpio0: gpio@10c03200 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x10c03200 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			resets = <&rst GPIO0_RESET>;
+
+			porta: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <24>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		gpio1: gpio@10c03300 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x10c03300 0x100>;

-- 
2.47.0


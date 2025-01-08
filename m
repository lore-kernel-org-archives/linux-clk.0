Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E2E1F9A9C;
	Wed,  8 Jan 2025 11:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337258; cv=pass; b=aDnosSOqt3xs9bYLvYwbuT6FffZzXX1AYBpGCnFZLav/NcFY4f5EyNrj1Ifz2zJccRfHWxe1qSTl/7JyyxdxjS/EloP8PWbFuH5JebZmEf+Xl0qgn9dq4i7gz/OMmcC1Rm+OKuVXrAqA5Mbig3fad3OjpX0qec830p7ZbEyz1QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337258; c=relaxed/simple;
	bh=ZqRrM1yZnQ1N5A78AqBZL3bbuLbEX8zJinAI2+vwIWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnCV3sUVxOQAl/9OpijKs9aOPfKD5auQrAVxLu3cu3KZdt8xf+Yh94ex+YCaomXVDiRjfFe+mFfd/+Oghg4ec8WsE2m5nfbMg7opdVWHOfukdjJGPC9lWzBurv/gIsdCvbL5ML1Li6S1ihR8m0q6gN9sNZY4U/FopLRdJkCEFI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=B/MA0g5l; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="B/MA0g5l"
ARC-Seal: i=1; a=rsa-sha256; t=1736337232; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l6U1q6x8U7EL6nF2EM9PGATKWn9Hn6g+G2PkOor6lhncGRFxKUv3Rea6/mE0BXJdbWosLuKoCgoFUGYO5NYwCDjHfCYVrR2ptwGvtAuB+vSrD6GmVowvzdJoE+GQR8vtIrT//3wqMb9TA8s8Khehpm3+9bMbVuH22ZhvOKflJZI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736337232; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9MOQQP/x77Ro5ASLfJZTxTTeYz6fqTSvvH80KDtJdi0=; 
	b=F9QEWUDAKA2219RVPlYRHhephbc7uURT6yXQ8XgBTxwGBI4YS2SBGVLDhPyHPJgpdkmrUhCKvP8tj/r1jRlMfgPfu/nrsArZ1gVoYl1nEqw7joV55oeQPkmCDIEt2+qZieV1tm1KIgvlDO/Qbf3+otVoYK1w4Ii2p1R9jY8UWj8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736337232;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=9MOQQP/x77Ro5ASLfJZTxTTeYz6fqTSvvH80KDtJdi0=;
	b=B/MA0g5ln5uMmjGF7E2gjbw/S89H7ykLsQsfWKbH4mOS/zbvcM8PdeB3jMeTT8hB
	iPnsHMZs+MtOeQQa4rElgp9cI/yUHwa1eVmG3onVsLEg4A8fAnXnk4Fzdz26SVfr1Nf
	WfiHDLpd9Tph2KQDUj5kMuy0BZDoAIhQcxLPICQk=
Received: by mx.zohomail.com with SMTPS id 1736337229252744.266655262139;
	Wed, 8 Jan 2025 03:53:49 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Wed, 08 Jan 2025 19:53:09 +0800
Subject: [PATCH v2 3/3] riscv: dts: canaan: Add clock initial support for
 K230
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-b4-k230-clk-v2-3-27b30a2ca52d@zohomail.com>
References: <20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com>
In-Reply-To: <20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
Feedback-ID: rr0801122729d553ffee6ecc653487f0c300001cfe0f65fe2f8bfc0304a76fbe9dfb9188971166a3ef3405d4:zu08011227396fd034eaf7abaafa2fed2f00007bab21554136d08197aee20d8d5a21bed38a865ac3a19bea0b:rf0801122db74e152dab4a477b9dbefb890000f5633fa80c33c0456521d4c8b41b9de48b2293072df2333d8a2855f56c38ee:ZohoMail
X-ZohoMailClient: External

This patch provides basic support for the K230 clock, which does not
cover all clocks.

The clock tree of the K230 SoC consists of OSC24M,
PLLs and sysclk.

Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 arch/riscv/boot/dts/canaan/k230.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index 95c1a3d8fb1192e30113d96d3e96329545bc6ae7..c407471af3daac154e0fbdd377d57ea3ff4698e1 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
  */
 
+#include <dt-bindings/clock/k230-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /dts-v1/;
@@ -65,6 +66,13 @@ apb_clk: apb-clk-clock {
 		#clock-cells = <0>;
 	};
 
+	osc24m: clock-24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "osc24m";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -138,5 +146,24 @@ uart4: serial@91404000 {
 			reg-shift = <2>;
 			status = "disabled";
 		};
+
+		sysclk: clock-controller@91100000 {
+			compatible = "canaan,k230-clk";
+			reg = <0x0 0x91102000 0x0 0x1000>, <0x0 0x91100000 0x0 0x1000>;
+			clocks = <&osc24m>;
+			#clock-cells = <1>;
+			clock-output-names =
+			"CPU0_ACLK", "CPU0_PLIC", "CPU0_NOC_DDRCP4", "CPU0_PCLK",
+			"PMU_PCLK", "HS_HCLK_HIGN_SRC", "HS_HCLK_HIGN_GATE",
+			"HS_HCLK_SRC", "HS_SD0_HS_AHB_GAT", "HS_SD1_HS_AHB_GAT",
+			"HS_SSI1_HS_AHB_GA", "HS_SSI2_HS_AHB_GA", "HS_USB0_HS_AHB_GA",
+			"HS_USB1_HS_AHB_GA", "HS_SSI0_AXI", "HS_SSI1", "HS_SSI2",
+			"HS_QSPI_AXI_SRC", "HS_SSI1_ACLK_GATE", "HS_SSI2_ACLK_GATE",
+			"HS_SD_CARD_SRC", "HS_SD0_CARD_TX", "HS_SD1_CARD_TX",
+			"HS_SD_AXI_SRC", "HS_SD0_AXI_GATE", "HS_SD1_AXI_GATE",
+			"HS_SD0_BASE_GATE", "HS_SD1_BASE_GATE", "HS_OSPI_SRC",
+			"HS_USB_REF_51M", "HS_SD_TIMER_SRC", "HS_SD0_TIMER_GATE",
+			"HS_SD1_TIMER_GATE", "HS_USB0_REFERENCE", "HS_USB1_REFERENCE";
+		};
 	};
 };

-- 
2.34.1


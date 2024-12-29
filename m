Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DA41662F1;
	Sun, 29 Dec 2024 13:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735478548; cv=pass; b=OIytLgrc5YLWYf6W+tG9L5/bMyScghnhv2kDG67Rvcs5T4NnR0nEUp1cmZc2jygK8d87XOsn1uuL4JBVVC9MOhn1pqEVeb3Dn8LQOHYQqBuLGsIAopvxf4kQxkNRAeA5OnfIroEfsdkF3dWqFV+kugIy/wteyFXJa4LHzn3+PoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735478548; c=relaxed/simple;
	bh=ZqRrM1yZnQ1N5A78AqBZL3bbuLbEX8zJinAI2+vwIWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mac5Jd6c7aiYvRUbvMPC1NKs7HvWdL4OFVRfrznkoSOBLD64x97k5ReovqRHcLJHmPq7FpGli1PxP829ncNdcybj1677i/y/XLmYCqIGUkJJdQvzWM0t/Zul0TpZpJGzgrSW8WTCxTjQUaQ2Flu2OpwMmVewTaNA6lZgarJK76o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=cRZw/jOg; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="cRZw/jOg"
ARC-Seal: i=1; a=rsa-sha256; t=1735478523; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=URRcrEhbU952+043VBLmv/qWSHJ5/tigs27jYmMX91ucN+6DuKihTMhofLdIwhFVDVObVkyBn++3mspEgHbQU33tGgydvVdP4TlYJfWCe+QSvGxsUyiHOq5tqzrcp0w2X+KUJOwtyI3Z3R2aW11YA1GrrggfDZ1WI5elfhIjrQo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735478523; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9MOQQP/x77Ro5ASLfJZTxTTeYz6fqTSvvH80KDtJdi0=; 
	b=Pnu7FcXntZp0wsUsM3nFhbMYjxBGu3I3UxpfPmcRp3wj97EPGvoOa1DIc5DejkGG8g9Z0zSwPSAkvi9tUTQGjyaNIX+naNTiglrTdwvEgKN9kDPurhPZq0QahQiKaDyMxPohZytv6GnhM2KncrhEpXOTSVQB7RAHS2pr6wZGq9g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735478523;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=9MOQQP/x77Ro5ASLfJZTxTTeYz6fqTSvvH80KDtJdi0=;
	b=cRZw/jOgRe0vO6s9R4BD+zo2RlgpGQnOBeZDN7KvUzCgqektJxD/VE+uX4B/9AGV
	3h7fin7eCgoWlh3jxSKHXgs8ImhXSpAUKY6uXYl5/KmApTYWSZ9Jzd2pV2YFxAaAs4B
	U1arPklCIC2nsClH9xVD2rZ5+Xktt/EeHbUCNF9Y=
Received: by mx.zohomail.com with SMTPS id 173547852017236.09863257523682;
	Sun, 29 Dec 2024 05:22:00 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Sun, 29 Dec 2024 21:21:10 +0800
Subject: [PATCH 3/3] riscv: dts: canaan: Add clock initial support for K230
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241229-b4-k230-clk-v1-3-221a917e80ed@zohomail.com>
References: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
In-Reply-To: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
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
Feedback-ID: rr0801122702ffcca89299b3078852e72a000005c72e0eace2615fcad8885e02fce6541bf0ba08c291f7dcf3:zu08011227d6d2d30888a3b43c703fd0c700003dbe33a86462bfcc434c9524a7bb3d4e7f14d2123ea28425d8:rf0801122d0c822b09e7e811d6dc6609fc00003dfde26ddcfc8442858b40cd9632b075de8e5875d239ee2e4004fca0c7646b:ZohoMail
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


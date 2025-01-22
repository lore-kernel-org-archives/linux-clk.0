Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD45210F45;
	Wed, 22 Jan 2025 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539840; cv=pass; b=jnjYWqZfMfSq18PU02wL+omDLYjDCFRT9A0WAI9nacwov3Nd/GVuXybFF6vMWHGacH0/y1LrAYoXDaONTKJ6y+FWaMcEmxwgZZXW+ZDFGAZ551XR5xbfijP27kMl9wCMxQbrVxT2UEFU/5vyp1dbFzsOHZtVZnVCC6LVeXeTQfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539840; c=relaxed/simple;
	bh=2kDeGFPRU5ySinR8BTj8CnBGsOS8PfC/VAHys1rOVcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JLit07ryQdWKwQIK9tso/EDnYfovM3rjDbDDVLJ2Z0/MtZA+wOCSf0tbre4OCXYzQ5XLZvU6rT0A5PtuJWVVZN0bZ3GUWmZUTst9Uj1np+dMHDONPpfxaJwTZSDIytkVCQErdpONW4z/pFiXT30r33F76f/8myuFQwg2cMfIe9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=SOkWeO44; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="SOkWeO44"
ARC-Seal: i=1; a=rsa-sha256; t=1737539805; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zpm3EIWmz+kHUp8QG9TUENfhiYlXqhhg5Ng9Fhz5b46Zn52mHzu8UJg/OQycM4osGdNmtbch69/ZXs6NfkZ/ZKOOxgRdpFRlSRP82xdwhiWBJHpFnirWcfMCX2Vac5+e2NkfEgHLJAXPNkHobL2rCt9xQmBOHU8byilkjGAjfP4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737539805; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Syb9XStZ74dZ9UjkC86uQY//S07l8lYvVVc6rFRliac=; 
	b=Fk8TpOqf6JDcjE98+WkKcDIgBSupFTLJWkzOXUWjphQLbR4CidV7M0eWI+xevZw1g23vuxMKJJ100wO8kx3laTuWphelqBOOeMk3Uls7PAMjb7rAmI4+YkUR2xjn/CobA8iRLQG/cu3ESfx24e0F6FNHJbfIjk9iXGnf+OGMJ/E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737539805;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=Syb9XStZ74dZ9UjkC86uQY//S07l8lYvVVc6rFRliac=;
	b=SOkWeO44kE2AW9l0Hh83lGQwokQ+k0A2oadXlA1biHJH7xm769I32zvZlFOIwuw+
	gOto9k7E/zCSkQs566lEduLVZAsKGbWdNXw9alD5Kfl51Dq1fvBivwm9G+6TfKV4w7M
	YVL5KzKtbQUzL182NC9TCh73UnTVKAqSRTFoBoMk=
Received: by mx.zohomail.com with SMTPS id 173753980464133.89882163947368;
	Wed, 22 Jan 2025 01:56:44 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Wed, 22 Jan 2025 17:55:57 +0800
Subject: [PATCH v3 3/3] riscv: dts: canaan: Add clock initial support for
 K230
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-b4-k230-clk-v3-3-bff755ac9cfc@zohomail.com>
References: <20250122-b4-k230-clk-v3-0-bff755ac9cfc@zohomail.com>
In-Reply-To: <20250122-b4-k230-clk-v3-0-bff755ac9cfc@zohomail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xukai Wang <kingxukai@zohomail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
Feedback-ID: rr080112277910a4d436f4fbce1f2f21ad0000e158bfd99fa6093e83b8bb5a6e3bb66d9b742312236b742c8b:zu08011227264464127912d748287f1789000049c465d702938ae78b4da75186aaf627a908fcaf844eb5427b:rf0801122da4a83bf7efbd56ad96b034730000d3694be2e4d4cc0e0f2f45f682cf5e28a58e886fc72eba43ed599f227f702b:ZohoMail
X-ZohoMailClient: External

This patch provides basic support for the K230 clock, which does not
cover all clocks.

The clock tree of the K230 SoC consists of OSC24M,
PLLs and sysclk.

Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 arch/riscv/boot/dts/canaan/k230.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index 95c1a3d8fb1192e30113d96d3e96329545bc6ae7..e50ba03c2c21597e5f7d04a652db08f84101cbfb 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
  */
 
+#include <dt-bindings/clock/canaan,k230-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /dts-v1/;
@@ -65,6 +66,13 @@ apb_clk: apb-clk-clock {
 		#clock-cells = <0>;
 	};
 
+	osc24m: clock-24m {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "osc24m";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -138,5 +146,29 @@ uart4: serial@91404000 {
 			reg-shift = <2>;
 			status = "disabled";
 		};
+
+		sysclk: clock-controller@91102000 {
+			compatible = "canaan,k230-clk";
+			reg = <0x0 0x91102000 0x0 0x1000>,
+			      <0x0 0x91100000 0x0 0x1000>;
+			clocks = <&osc24m>;
+			clock-output-names = "CPU0_ACLK", "CPU0_PLIC", "CPU0_NOC_DDRCP4",
+					     "CPU0_PCLK", "PMU_PCLK", "HS_HCLK_HIGH_SRC",
+					     "HS_HCLK_HIGH_GATE", "HS_HCLK_SRC",
+					     "HS_SD0_HS_AHB_GAT", "HS_SD1_HS_AHB_GAT",
+					     "HS_SSI1_HS_AHB_GA", "HS_SSI2_HS_AHB_GA",
+					     "HS_USB0_HS_AHB_GA", "HS_USB1_HS_AHB_GA",
+					     "HS_SSI0_AXI", "HS_SSI1", "HS_SSI2",
+					     "HS_QSPI_AXI_SRC", "HS_SSI1_ACLK_GATE",
+					     "HS_SSI2_ACLK_GATE", "HS_SD_CARD_SRC",
+					     "HS_SD0_CARD_TX", "HS_SD1_CARD_TX",
+					     "HS_SD_AXI_SRC", "HS_SD0_AXI_GATE",
+					     "HS_SD1_AXI_GATE", "HS_SD0_BASE_GATE",
+					     "HS_SD1_BASE_GATE", "HS_OSPI_SRC",
+					     "HS_USB_REF_51M", "HS_SD_TIMER_SRC",
+					     "HS_SD0_TIMER_GATE", "HS_SD1_TIMER_GATE",
+					     "HS_USB0_REFERENCE", "HS_USB1_REFERENCE";
+			#clock-cells = <1>;
+		};
 	};
 };

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795804;
	b=XYpiAPA8GyVIZ+p7a+zk1bv2Gj41i6ZGnuT267ynG4Sup7V+KPkvct4GJoM/HH0vEU4i
	 TgxE3ALdHCcEQzxXBwglc+16SohSUI4FnBngJTOs0kDB6g3HGzuoAJm+NRzyLdbjAxUAj
	 FkGYXzWkmku3+e6pDoieSwpFkab6aJ0daCVVMueuaYFHFkPzng8vV76CF8I8s3W/+y+Uk
	 DorGzq8J9v6fLUDUDjmbME4Cmv8NumuSdIfn1ld5LILBpA4c00cFoUnQ5qjQV+KGZ51ER
	 Foo8skXenYON+1mGFYVbxltt1IGKh2veW5WP0/Gmf84O67WV/jVh/AwqwB2SJm9sB5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795804;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=+z9lIGbJ9Utj5Ssuh2Y5ZEM1xMNrAcgaOBqBSUpINvA=;
	b=rC0YW4Bmwp+MxdrYgMEofwAEFNVdu9KIXavf3dRJphDC89L4FQMsScBIDLcTl9vp+v05
	 EhEY8trsDXyCj/PVCimt8+ztTOvBd1aWnyUdNHa5rRB7haWsOM2eHGp1OAmiCgNRlgW1R
	 VJY4el6xzt+d+MS4zTuhdlhCV6zj1CBy+4u1e583CIW/NeqToyR83wNYMl+IYaVgXo/BJ
	 mJ3P81/YeWlqvxJyFMVoV2M+SqYSOIVo3j98G6Eh/zBuYSP5eVE1pZ1PadMTs4+S1Jj0m
	 bM8Kv5cHnLWnpu6nqWJUGHaVTNJK40SmZgy89yasxrPEL3DWv9h3JXHinpu1LZwcCew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eS85E9vu;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99602606A33C;
	Fri, 27 Nov 2026 16:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99602606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eS85E9vu
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4C4274E417C7;
	Fri, 27 Nov 2026 16:10:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15F176049C;
	Fri, 27 Nov 2026 16:10:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E95D102F011A;
	Fri, 27 Nov 2026 17:09:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795795800; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+z9lIGbJ9Utj5Ssuh2Y5ZEM1xMNrAcgaOBqBSUpINvA=;
	b=eS85E9vu+I5zwPfhcHF41aE6cpYrkmk0lBkdFH105TOcwP5jGxgCLnO60hAx5UF3swOK9t
	6KTpJKDdNme/TmPQQnHcV0Oybwu89MFxAOrr2h3BqMnrj0yOg0OwYC8ylU0dTeJhX75Rs6
	7QwO4bmeTSENiBqEIEWBnzLgwmMkxAmTrlAwInkbX8nKR/PcB33GRou4G0lWRMaftLKexY
	Y0692EQig2Kr+81TQ80bYkF+nDmErTQ0fIOcKIE7CGx+1lNzNRLSR/8WWf5DUl55IxRznY
	pjI/6oH5VqjjA21E6DtMN2n238jScemNQdu94vrdlVqqMpUIXk5KGRYN5A0IuA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 27 Nov 2026 17:09:49 +0100
Subject: [PATCH 1/4] MIPS: mobileye: dts: eyeq6h: clean up to follow
 dt-check-style
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-b4-eyeq6h-i2c-v1-1-d3232984fe83@bootlin.com>
References: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
In-Reply-To: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Clean up the EyeQ6H device trees so they follow the rules encoded in
scripts/dtc/dt-check-style:

 - order the root child nodes and the soc properties as expected,
 - add the blank lines required before child nodes,
 - wrap the uart0 clocks line to 80 columns.

Also move interrupt-parent to the soc bus so its children inherit it,
instead of repeating it in every controller node.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts |  2 +-
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi     | 39 ++++++++++++++++-------------
 2 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
index 59a3e95050eb9..c0e1de2bb5a0e 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
+++ b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
@@ -8,8 +8,8 @@
 #include "eyeq6h.dtsi"
 
 / {
-	compatible = "mobileye,eyeq6h-epm6", "mobileye,eyeq6h";
 	model = "Mobile EyeQ6H MP6 Evaluation board";
+	compatible = "mobileye,eyeq6h-epm6", "mobileye,eyeq6h";
 
 	chosen {
 		stdout-path = "serial0:921600n8";
diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
index 5ae939d25ea87..dd0f1c7483180 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
@@ -10,9 +10,25 @@
 / {
 	#address-cells = <2>;
 	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	xtal: clock-30000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <30000000>;
+	};
+
+	coherency-manager {
+		compatible = "mobileye,eyeq6-cm";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+
 		cpu@0 {
 			device_type = "cpu";
 			compatible = "img,i6500";
@@ -21,10 +37,6 @@ cpu@0 {
 		};
 	};
 
-	aliases {
-		serial0 = &uart0;
-	};
-
 	cpu_intc: interrupt-controller {
 		compatible = "mti,cpu-interrupt-controller";
 		interrupt-controller;
@@ -32,21 +44,13 @@ cpu_intc: interrupt-controller {
 		#interrupt-cells = <1>;
 	};
 
-	coherency-manager {
-		compatible = "mobileye,eyeq6-cm";
-	};
-
-	xtal: clock-30000000 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <30000000>;
-	};
-
 	soc: soc {
 		compatible = "simple-bus";
+		ranges;
+
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
+		interrupt-parent = <&gic>;
 
 		olb_acc: system-controller@d2003000 {
 			compatible = "mobileye,eyeq6h-acc-olb", "syscon";
@@ -69,9 +73,9 @@ uart0: serial@d3331000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0 0xd3331000 0x0 0x1000>;
 			reg-io-width = <4>;
-			interrupt-parent = <&gic>;
 			interrupts = <GIC_SHARED 43 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&olb_west EQ6HC_WEST_PER_UART>, <&olb_west EQ6HC_WEST_PER_OCC>;
+			clocks = <&olb_west EQ6HC_WEST_PER_UART>,
+				 <&olb_west EQ6HC_WEST_PER_OCC>;
 			clock-names = "uartclk", "apb_pclk";
 		};
 
@@ -112,7 +116,6 @@ olb_east: system-controller@d3358000 {
 		emmc: mmc@d8010000 {
 			compatible = "mobileye,eyeq-sd4hc", "cdns,sd4hc";
 			reg = <0 0xd8010000 0x0 0x1000>;
-			interrupt-parent = <&gic>;
 			interrupts = <GIC_SHARED 91 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&olb_south EQ6HC_SOUTH_DIV_EMMC>;
 			bus-width = <8>;

-- 
2.53.0


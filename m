Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C13149013
	for <linux-clk@vger.kernel.org>; Fri, 14 Jun 2024 07:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349609; cv=none; b=Y4WU56LRHeYJHGLMTFZTRnrsIqWKHmwcB57tMr/EaYXD1qXJS4tCqX1fVMeIejztN0IlnNm5/AER8Twa0T2d12eKQ2YIsQCYSLmcBdqcunR02pLUnLk2GiMs2rXBgQ8WxPRJnL+0pyv+dvH+x59S2C0c38tWWZjC2MsVtZFrqz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349609; c=relaxed/simple;
	bh=StslRfIF9bjwc+yLkIUdqeGy286Yl+3QQGjH8oHwmbk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S0VVUOvQm6hYqhnkI52VeRZeUQSxgpMJBw09YvaS7t8lZFxcnkBj3mKA0REbYR0TfwXeMGJN3GQSHA6SsTqNUQc4AanWFli8bT4DCrAE+WPVfwZoLWW/+v/ehjzQnG9p7bavsBLxz6Fun9t1qGUgUs6voMPwwj+EJbbneyoDXAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OZ5Zep49; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OZ5Zep49"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-421798185f0so16072515e9.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Jun 2024 00:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349606; x=1718954406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXKVp/I1qd30TXm2YU7BrLpdhU1oFUuJMaRiNvsEfzg=;
        b=OZ5Zep49GffDOPDCQJOeZA6YHHvlYLqlrWNgO28HO++awN6z1djd9nhORDUJFFtdHd
         XH6tVaR7Gqpm3nxVC3IlYa774C6979TFGW6aJg59FO0+Du05dIN3NHiX+NopPV51fShI
         xr1jO8xFvqVKOHi1q3/KALhCvXckK+kmtYUCaqmZdIqF1fxkC3VAxLPXl5kyW7vc7iZm
         VardDrGftuX3D4rk0rcZLNilZ33Swsc45BYh8CZkeqoK92xxIAOGXVvNbdHqSeaMB/US
         leSp/N7iKeQ8K8lba8JfB0rD1jKiztf981RYXplwbDFoWN3j0fEsvVmxJc1/4APFcMcf
         ZMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349606; x=1718954406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXKVp/I1qd30TXm2YU7BrLpdhU1oFUuJMaRiNvsEfzg=;
        b=C0M+vdiqTZPVE/R+eS+rxygy4zQnbFqFWINusp3jJ3YydnYmmwpJ06llD+7PCm8ygN
         na/1V6fjbb94QVNuLZGZorIueR9F1IZjmR0pLAtb2ETsI2p/ou+9D4/94IwWQkYfbAFh
         U1DvarHTvkeB2p5gIrP72neIZ6bD46PE1V9YfsX+GQjmPUbbsEqiBNpAcV6IBBtAVQFq
         FPymMzK+zPK4+/fxOnWKYFwUJzHmnTkjL9J19+tvT96Cbga+az6xJIsk1+k5hAthk4G5
         vU8Rvf8WcYEstYU7eF1/B1FSZ8ht0HIoV+kRyHaowVTlNl6ap/0fgXyi3BI5SJFZM1zd
         ugSA==
X-Forwarded-Encrypted: i=1; AJvYcCW8ig7oSg4daRm4RWLw1l56THBHT6B5c/pTUEdAKiRvKSTHRFgX9n8FreeDqJlR981srKA1mMim49h5nfcX06QrHNczZEIUVVVH
X-Gm-Message-State: AOJu0Yzo4VPBSNcGEKJCx8FONQIyh1KokWm94ZpnCSlqUNr1iRzL5jlb
	lMAWFCpGHUhQC3azimCFkSWvA40csFr8qpCldQCIaEuycxCV58ceb5yNid9t7C4=
X-Google-Smtp-Source: AGHT+IELHWn4BzKIGJx3SJDAu+6lh0yAH4ZMV9I9BhoPMupkp0AFTyAryhX00A34g6cHm0AlspWEVA==
X-Received: by 2002:a05:600c:358d:b0:422:683b:df4d with SMTP id 5b1f17b1804b1-4230481a008mr16406855e9.8.1718349601911;
        Fri, 14 Jun 2024 00:20:01 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:20:01 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 07/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
Date: Fri, 14 Jun 2024 10:19:27 +0300
Message-Id: <20240614071932.1014067-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the VBATTB IP along with DT bindings for the clock
it provides.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 2162c247d6de..b7bd2e1f3462 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -72,6 +72,31 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		vbattb: vbattb@1005c000 {
+			compatible = "renesas,rzg3s-vbattb", "syscon", "simple-mfd";
+			reg = <0 0x1005c000 0 0x1000>;
+			ranges = <0 0 0 0x1005c000 0 0x1000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tampdi";
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>;
+			clock-names = "bclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			status = "disabled";
+
+			vbattclk: clock-controller@1c {
+				compatible = "renesas,rzg3s-vbattb-clk";
+				reg = <0 0x1c 0 0x10>;
+				clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
+				clock-names = "bclk", "vbattb_xtal";
+				#clock-cells = <0>;
+				power-domains = <&cpg>;
+				status = "disabled";
+			};
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a08g045-cpg";
 			reg = <0 0x11010000 0 0x10000>;
@@ -296,4 +321,11 @@ timer {
 				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	vbattb_xtal: vbattb-xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
 };
-- 
2.39.2


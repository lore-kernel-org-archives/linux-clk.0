Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40CD17A90F
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 11:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969020; cv=none; b=G+cNxJYpF9dr3xSAo3a/BtT4ldDs2dMO6SvHT7q/h93/VaF1C55bxdTweJ5wCaUh90rF2t1Gm4G8lOYpr5l1Zbj90HUw58Gf7PtMY73nVTyGXDa2sDKvoh0GWzuY9aOGNvbGV+jT7sVLAf4m1fXr1WiUNSnNXTFnlaVziEoejq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969020; c=relaxed/simple;
	bh=lNldhumSE6RINO7oqa+VZtuUTBaUdRaXgz5D33kBNAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hBiu7pX5Wo5zSmk0HBiNVMa01T8nAq473qbHhwlgxkqhqCw/n4+wNzCwlPAbjkfqTPDmsCmlfzI8Wqyc2ysJ6PBveaMSFmqdOS/P/nGDvY/vr+unWRaUvHX8smyn5e4qkncG0TL+JYE2rgeXL7wD98fyAJ1R/baNN6bYjJuc1A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bcFzA+EA; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bcFzA+EA"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57d1d45ba34so2107963a12.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 04:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718969017; x=1719573817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rP4+zuetuuIfhuOzhXeFAzrE549ps3331iDalIZrx6w=;
        b=bcFzA+EAsUy4SO6/cfglGOW42Yy0TzcyVBEJl1JTnRvaXaNchrVVgdQsvSpknXkhqC
         07rePusNlPT3B6Ae/vHfZOOZV7Hm0L/xKL6ResvzmkscXqNhLZ+zK1BM+T0GlmKBsYwP
         S/RpYudq4SRtfFlUffqHAqScjF6gfHZ3X4aZsV62vDukJW2YYFk9be3Wjrb0JxL71vs2
         zGHFY2QpHqQMXDfU40tg8e4tnlv3Xu+z9bgRyq7WQXEOwR+z3L32AmdonltmeQu1TpaZ
         M5NuTozDAb3d0rS4wBObPq1s/S0VMUnUbczSmfMnVtTK3W2cKacFkIGOkXT4NBcdrJKY
         hqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969017; x=1719573817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rP4+zuetuuIfhuOzhXeFAzrE549ps3331iDalIZrx6w=;
        b=m8s4PIr27jYkhhI2dk7sxDg1tZdqpF8MWMBQAefebwC9l3Vve1pTjiDsFO5lnH04FK
         iQAHQHmPAW/fvHynn/gWqfgRs3lnO33mslaw0x3Mgd3yUOA1vK4ZOzZ8uKzjYZmkg2n5
         EMgS5qx6+Ma6AC+zUmaVc1EZliJ/ydBR4/k1ez1tg8sj/5HXibO77M7melVVYaw6I+Qc
         onYkqJOmrpsQB6EtSJtLHC2os967pFXkOAGh+fJN3+xdRx2+BvZ44oCnihdPPRwLY/xu
         v0aB8OmoVcBjmO+sibDYxbzPhIeyz1DgOMdaWyAcIp5ts1KauOFNgQCl+OmVe93zq1Q0
         G7hg==
X-Forwarded-Encrypted: i=1; AJvYcCWDLANQ0W/rWvGSxPDo+Js5dFaB7AkKL0TkyC9v3l6PgyIROuc258n9xAtrxobRstXdzNwUr3m5kYDssK7JY6D1O5y6ZxE7h/Wk
X-Gm-Message-State: AOJu0Yx4z5eznWuLpzq99K9lDdtugHzQ+JyHF5/WEQ3XEAsDk9I75fvn
	/yjaG6iSHURROTCf9lSbpb74X9p3knhLvWJ7VU2glyvaRE9FfVq1MdROL3Ih8ww=
X-Google-Smtp-Source: AGHT+IFIq66bSlA38LAdExrJtWaTZlg6NozLGS4VPpVsqky9aYie4i5NKq+JpOklKvZ45RaWZgib2g==
X-Received: by 2002:a17:907:bc4:b0:a6f:4ef7:85bd with SMTP id a640c23a62f3a-a6fab77a648mr353123466b.47.1718969017264;
        Fri, 21 Jun 2024 04:23:37 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fd0838345sm64498466b.99.2024.06.21.04.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:23:36 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 10/12] arm64: dts: renesas: r9a08g045: Add I2C nodes
Date: Fri, 21 Jun 2024 14:23:01 +0300
Message-Id: <20240621112303.1607621-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S has 4 I2C channels. Add DT nodes for it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 2162c247d6de..cc5beed37ae8 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -72,6 +72,96 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@10090000 {
+			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
+			reg = <0 0x10090000 0 0x400>;
+			interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G045_I2C0_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G045_I2C0_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@10090400 {
+			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
+			reg = <0 0x10090400 0 0x400>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 272 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G045_I2C1_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G045_I2C1_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@10090800 {
+			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
+			reg = <0 0x10090800 0 0x400>;
+			interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 279 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 280 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G045_I2C2_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G045_I2C2_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			renesas,riic-no-fast-mode-plus;
+			status = "disabled";
+		};
+
+		i2c3: i2c@10090c00 {
+			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
+			reg = <0 0x10090c00 0 0x400>;
+			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 287 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 288 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G045_I2C3_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G045_I2C3_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			renesas,riic-no-fast-mode-plus;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a08g045-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.39.2


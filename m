Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5BF1993A3
	for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 17:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724693490; cv=none; b=hgdFygDtXX9tB0X9tChv/OB3riUVUKWVpFU4BbPAODy1JEP4Dlewgyrf5vORnLCBc8JZ1vRUuOeh4fcNe7YuRN5wTA9LSF9dxypofLpwgyA4+RNT2Yo0CLB5zcXmYCYmwaY0l598SdQWQRJsVNjvv6jVItQxas8G9tuyLxgYvWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724693490; c=relaxed/simple;
	bh=0dBxXMZA/aM1vT5tilEszeGIyh1nA8wtXz0deuhmGMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m3zHeE/+gIpQzF7WYAZrNDxfvN2UhATkrkqf1WbC3Jwgi3cj3iw/cpC5Et5Lz4V776Iwh2H5SD6es/9UGM+9e2FeoITr6hFPieFl5SbNbt3ObniU/ZVhOp3z/TNJXcsQjw29u6byW4AZciN7UN1tiif2KDZbYV/R2f2qS/QmrF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AIKAxsOt; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AIKAxsOt"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53346132365so5413284e87.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 10:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724693487; x=1725298287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T370sUu57dJFmbuCp0n0YvqcvgntixC3zniQ7Z2kajQ=;
        b=AIKAxsOtAPBdu3FMRztjMS3nBDnh0rn2jISHsCXqXONknU2JFOvn0mnVZvwDaWLU/F
         L8PzJDSmqoLmjIYarY8wx/L60uZTv6K5dDBNCeb+xsLhhOxS6rMMRmF++E6bcPT1HXdR
         /zBb0af5RlYNMNDu2c/GbjCbUvlnwxCviUAbXllu5y024wq9t4dHKoeJlIdiD0d4ymV+
         0Db7yNczfayOWUJF5xOi+nAzhe1yGASivHzr5jO9Zt1EZd3azVz/j8xCn0cfNU7zGk20
         QYKj44knzRtj76nfMyUhox9QFH8CC1vz+zM+RPxtRiXiWHdj1xGnKUZ327hgU/GDQkEs
         HFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724693487; x=1725298287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T370sUu57dJFmbuCp0n0YvqcvgntixC3zniQ7Z2kajQ=;
        b=BpWI8Qn+LYfemXrYMVoZ5jK2D8V/ZwB/PQo9IbA/OOrl6G1FDrfxCgg3DkBQSECZGD
         iOnXNJwQQy40r3NJ9zU9k6JMh/v3oKHgJsK17iAynrw3aDZ3jJ9TelgwBpwZ2kSZvupp
         a2e60izC9zw4KTKJ3UXb1CYlmgSzv2yFpMCiEzwxA19jWdTkFEGfhNy7P6bR6jaOxLbW
         tIja9vxf5jE5O9JwPXxGZ4cIx4kQ04tB6vG5jxPuuVnRA6J510W9rMMnsFzcbS4Vv5+Y
         lpXBGQVS1krebRIATLWP7lcaAodgVgdvO0HPlKjVUEslx3KSzsWPB0zR6fQj7FW4TSHf
         fFyg==
X-Forwarded-Encrypted: i=1; AJvYcCVvKTM5AbqgJZF37QUV7MqxyEaJtvJM5zN3aQAP0X2lMWkyGjvq4TgOqb9koL2Wik8t/l384tSMwDU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Or8e6/dUT2rsszwJS6e8uYfrKZuknzxIwblMYp/D9yAdkmJQ
	OcI+Mc7F100blrG6wn7di5sAmQUY9eCsefvDvaCN5rhFBuHXuKsTLovNxD/kEOA=
X-Google-Smtp-Source: AGHT+IHl5ECdva99iS8MGwyQOyjCeOAz2cu6VPsZOx2yoj1QvjX+04dStE1ffy8Es6Mq3ecn4kJkDQ==
X-Received: by 2002:a05:6512:2210:b0:52d:582e:4117 with SMTP id 2adb3069b0e04-5344e4fd009mr59543e87.54.1724693486663;
        Mon, 26 Aug 2024 10:31:26 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e548781csm446566b.28.2024.08.26.10.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 10:31:26 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 3/3] ARM: dts: microchip: Use SCKC_{TD, MD}_SLCK IDs for clk32k clocks
Date: Mon, 26 Aug 2024 20:31:16 +0300
Message-Id: <20240826173116.3628337-4-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826173116.3628337-1-claudiu.beznea@tuxon.dev>
References: <20240826173116.3628337-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the newly introduced macros instead of raw number. With this device
tree code is a bit easier to understand.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 arch/arm/boot/dts/microchip/sam9x60.dtsi | 18 +++++++++---------
 arch/arm/boot/dts/microchip/sama7g5.dtsi | 16 ++++++++--------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index 04a6d716ecaf..eeda277e684f 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -560,7 +560,7 @@ tcb0: timer@f8008000 {
 				#size-cells = <0>;
 				reg = <0xf8008000 0x100>;
 				interrupts = <17 IRQ_TYPE_LEVEL_HIGH 0>;
-				clocks = <&pmc PMC_TYPE_PERIPHERAL 17>, <&clk32k 0>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 17>, <&clk32k SCKC_MD_SLCK>;
 				clock-names = "t0_clk", "slow_clk";
 			};
 
@@ -570,7 +570,7 @@ tcb1: timer@f800c000 {
 				#size-cells = <0>;
 				reg = <0xf800c000 0x100>;
 				interrupts = <45 IRQ_TYPE_LEVEL_HIGH 0>;
-				clocks = <&pmc PMC_TYPE_PERIPHERAL 45>, <&clk32k 0>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 45>, <&clk32k SCKC_MD_SLCK>;
 				clock-names = "t0_clk", "slow_clk";
 			};
 
@@ -1038,7 +1038,7 @@ hlcdc: hlcdc@f8038000 {
 				compatible = "microchip,sam9x60-hlcdc";
 				reg = <0xf8038000 0x4000>;
 				interrupts = <25 IRQ_TYPE_LEVEL_HIGH 0>;
-				clocks = <&pmc PMC_TYPE_PERIPHERAL 25>, <&pmc PMC_TYPE_GCK 25>, <&clk32k 1>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 25>, <&pmc PMC_TYPE_GCK 25>, <&clk32k SCKC_TD_SLCK>;
 				clock-names = "periph_clk","sys_clk", "slow_clk";
 				assigned-clocks = <&pmc PMC_TYPE_GCK 25>;
 				assigned-clock-parents = <&pmc PMC_TYPE_CORE PMC_MCK>;
@@ -1313,20 +1313,20 @@ pmc: clock-controller@fffffc00 {
 				reg = <0xfffffc00 0x200>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
 				#clock-cells = <2>;
-				clocks = <&clk32k 1>, <&clk32k 0>, <&main_xtal>;
+				clocks = <&clk32k SCKC_TD_SLCK>, <&clk32k SCKC_MD_SLCK>, <&main_xtal>;
 				clock-names = "td_slck", "md_slck", "main_xtal";
 			};
 
 			reset_controller: reset-controller@fffffe00 {
 				compatible = "microchip,sam9x60-rstc";
 				reg = <0xfffffe00 0x10>;
-				clocks = <&clk32k 0>;
+				clocks = <&clk32k SCKC_MD_SLCK>;
 			};
 
 			shutdown_controller: poweroff@fffffe10 {
 				compatible = "microchip,sam9x60-shdwc";
 				reg = <0xfffffe10 0x10>;
-				clocks = <&clk32k 0>;
+				clocks = <&clk32k SCKC_MD_SLCK>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				atmel,wakeup-rtc-timer;
@@ -1338,7 +1338,7 @@ rtt: rtc@fffffe20 {
 				compatible = "microchip,sam9x60-rtt", "atmel,at91sam9260-rtt";
 				reg = <0xfffffe20 0x20>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-				clocks = <&clk32k 1>;
+				clocks = <&clk32k SCKC_TD_SLCK>;
 			};
 
 			pit: timer@fffffe40 {
@@ -1364,14 +1364,14 @@ rtc: rtc@fffffea8 {
 				compatible = "microchip,sam9x60-rtc", "atmel,at91sam9x5-rtc";
 				reg = <0xfffffea8 0x100>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-				clocks = <&clk32k 1>;
+				clocks = <&clk32k SCKC_TD_SLCK>;
 			};
 
 			watchdog: watchdog@ffffff80 {
 				compatible = "microchip,sam9x60-wdt";
 				reg = <0xffffff80 0x24>;
 				interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
-				clocks = <&clk32k 0>;
+				clocks = <&clk32k SCKC_MD_SLCK>;
 				status = "disabled";
 			};
 		};
diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 17bcdcf0cf4a..2efca9838d69 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -246,7 +246,7 @@ pmc: clock-controller@e0018000 {
 			reg = <0xe0018000 0x200>;
 			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 			#clock-cells = <2>;
-			clocks = <&clk32k 1>, <&clk32k 0>, <&main_xtal>;
+			clocks = <&clk32k SCKC_TD_SLCK>, <&clk32k SCKC_MD_SLCK>, <&main_xtal>;
 			clock-names = "td_slck", "md_slck", "main_xtal";
 		};
 
@@ -254,13 +254,13 @@ reset_controller: reset-controller@e001d000 {
 			compatible = "microchip,sama7g5-rstc";
 			reg = <0xe001d000 0xc>, <0xe001d0e4 0x4>;
 			#reset-cells = <1>;
-			clocks = <&clk32k 0>;
+			clocks = <&clk32k SCKC_MD_SLCK>;
 		};
 
 		shdwc: poweroff@e001d010 {
 			compatible = "microchip,sama7g5-shdwc", "syscon";
 			reg = <0xe001d010 0x10>;
-			clocks = <&clk32k 0>;
+			clocks = <&clk32k SCKC_MD_SLCK>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			atmel,wakeup-rtc-timer;
@@ -272,7 +272,7 @@ rtt: rtc@e001d020 {
 			compatible = "microchip,sama7g5-rtt", "microchip,sam9x60-rtt", "atmel,at91sam9260-rtt";
 			reg = <0xe001d020 0x30>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk32k 1>;
+			clocks = <&clk32k SCKC_TD_SLCK>;
 		};
 
 		clk32k: clock-controller@e001d050 {
@@ -291,14 +291,14 @@ rtc: rtc@e001d0a8 {
 			compatible = "microchip,sama7g5-rtc", "microchip,sam9x60-rtc";
 			reg = <0xe001d0a8 0x30>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk32k 1>;
+			clocks = <&clk32k SCKC_TD_SLCK>;
 		};
 
 		ps_wdt: watchdog@e001d180 {
 			compatible = "microchip,sama7g5-wdt";
 			reg = <0xe001d180 0x24>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk32k 0>;
+			clocks = <&clk32k SCKC_MD_SLCK>;
 		};
 
 		chipid@e0020000 {
@@ -312,7 +312,7 @@ tcb1: timer@e0800000 {
 			#size-cells = <0>;
 			reg = <0xe0800000 0x100>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&pmc PMC_TYPE_PERIPHERAL 91>, <&pmc PMC_TYPE_PERIPHERAL 92>, <&pmc PMC_TYPE_PERIPHERAL 93>, <&clk32k 1>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 91>, <&pmc PMC_TYPE_PERIPHERAL 92>, <&pmc PMC_TYPE_PERIPHERAL 93>, <&clk32k SCKC_TD_SLCK>;
 			clock-names = "t0_clk", "t1_clk", "t2_clk", "slow_clk";
 		};
 
@@ -906,7 +906,7 @@ tcb0: timer@e2814000 {
 			#size-cells = <0>;
 			reg = <0xe2814000 0x100>;
 			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&pmc PMC_TYPE_PERIPHERAL 88>, <&pmc PMC_TYPE_PERIPHERAL 89>, <&pmc PMC_TYPE_PERIPHERAL 90>, <&clk32k 1>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 88>, <&pmc PMC_TYPE_PERIPHERAL 89>, <&pmc PMC_TYPE_PERIPHERAL 90>, <&clk32k SCKC_TD_SLCK>;
 			clock-names = "t0_clk", "t1_clk", "t2_clk", "slow_clk";
 		};
 
-- 
2.39.2


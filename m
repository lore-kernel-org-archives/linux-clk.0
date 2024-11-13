Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DD6212F03
	for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 13:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504992; cv=none; b=BAyX1/myliN3PgzdloKjs7JipcDaw9H99ETzaqEJXi9HxbkUSEBmZX/oMq4WDFNGfCsNts67OE2qJqMhyBeCWwmqfTS0ki1fqbIElufqK15Elzz12PeTelP7E7CFPC48DMFU8nNTyz9ooxS9Kvsy9dRqPG25xYjGHukfCMzbu7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504992; c=relaxed/simple;
	bh=Lz3aoSUo6+0PF0wZUJ8U3vu3GObZqmPF9iuKY2yZJgU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OBUObl/greSCfStb7Hfb+xVMZL/ESHZ6DUBJioob9IkHP05y631K/FX1TjE7iSV3wrbajGMCfeLIBbA2qaT+me/lbgFlLTStVD2wAIteEgeZQethORH0d9vleHejOr9jkEat0kAE2O9vpfFBR65RvLRTiCoBBtHY8gE+weeSxag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lCs3eT2U; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lCs3eT2U"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so60027485e9.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 05:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731504989; x=1732109789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgXhv7pRczmNcx6HSYZsMHDnL3arPRRw+a6h6xJlA4k=;
        b=lCs3eT2UotIOr8yDeStXAzNnTfF2RhaD3YTnVmuj6T4Y6FMuDA32qf29UgB3APCg29
         necxDDe+9z420tijid7R8RI1w88Kx6tyyYpOX6LAtEbZQcpF8KAbxARRHgpXeWIon4b6
         nYZYC24+gfSKg0UEFkkHa60gMuD7ojjUFpwjJNZ6SA+7r0MirDUhmQTRXM+sKTcO9RJK
         livJPcd6KcastXZ68Xxpcdchs/j6q2TrF3izjPZ30SIzQ9kOstr2iabT36l/VkstCvMR
         /BjMsDzPci3kjoSYgtqiJs0rpBalvKL0ugliwbl0mnbGN51GRl/F4N8yhuuD72snHS+A
         ezbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504989; x=1732109789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgXhv7pRczmNcx6HSYZsMHDnL3arPRRw+a6h6xJlA4k=;
        b=dZpLzl9d7Y1qp6CgWJqfAi2tipp6ubGj9BxpORUJt3UpABOjqlPnmc1sINXPEQvfaY
         0UE9fXo3A1e6tvRRYKUEax11PHTyZDYqmDkPRrzGJczOUj23wtlVlSlQdgzCvnYcnxnc
         HMp46cNGEaZLVkVwHhntLMYhw5uYj6s2MdPdw9c2fQMSYo/+9ekYw3tIM/l4wrwcEagJ
         SGK4yFpz8r3yDzD/HdXlK3ejaQ8/FaVD1g8H6zlYYoMByz4mlcsUH3Ddl9FBRtacW8NL
         xddP+TH9SYhZczhsPX4e1UgANp/DqkfYq7ZlVNJwx1d2PriaqghIDKzHhzjxL7uvB0PV
         H/pw==
X-Forwarded-Encrypted: i=1; AJvYcCVLTxH2UU/mYPlx5ic/lm94U9QtoHUNCAyYn8TQxfOMssuBE9dgKxVieLOzXwDb5w6EAerT8KUvrm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY63jytU7cOZJcxR319PymXLA1xGYMDvaR5vQADkBPa7ycZ6bm
	hvj8E+S+Kc6CmQcOToiYsASQsPSOlNWQ/0lFMb2Aq/Mz6TXq3Lg2PkEWvAj2GWY=
X-Google-Smtp-Source: AGHT+IHn5cPSQcUztin4zy9dKdNFqeNDZ7RPNRJWoUAxSAY0cZ1T6lh8oLNCtmmCdp1ollguf9sC0g==
X-Received: by 2002:a05:600c:3c8b:b0:428:f0c2:ef4a with SMTP id 5b1f17b1804b1-432b75002a7mr173945815e9.13.1731504989219;
        Wed, 13 Nov 2024 05:36:29 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54e2f2esm25664165e9.1.2024.11.13.05.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:36:28 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 22/25] arm64: dts: renesas: rzg3s-smarc-som: Add versa3 clock generator node
Date: Wed, 13 Nov 2024 15:35:37 +0200
Message-Id: <20241113133540.2005850-23-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add versa3 clock generator node. It provides the clocks for the Ethernet
PHY, PCIe, audio devices.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 2ed01d391554..6e58d47d85b0 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -92,6 +92,12 @@ vcc_sdhi2: regulator2 {
 		gpios = <&pinctrl RZG2L_GPIO(8, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	x3_clk: x3-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
 };
 
 #if SW_CONFIG3 == SW_ON
@@ -152,6 +158,30 @@ &extal_clk {
 
 &i2c1 {
 	status = "okay";
+
+	versa3: clock-generator@68 {
+		compatible = "renesas,5l35023";
+		reg = <0x68>;
+		clocks = <&x3_clk>;
+		#clock-cells = <1>;
+		assigned-clocks = <&versa3 0>,
+				  <&versa3 1>,
+				  <&versa3 2>,
+				  <&versa3 3>,
+				  <&versa3 4>,
+				  <&versa3 5>;
+		assigned-clock-rates = <24000000>,
+				       <12288000>,
+				       <11289600>,
+				       <25000000>,
+				       <100000000>,
+				       <100000000>;
+		renesas,settings = [
+		  80 00 11 19 4c 42 dc 2f 06 7d 20 1a 5f 1e f2 27
+		  00 40 00 00 00 00 00 00 06 0c 19 02 3f f0 90 86
+		  a0 80 30 30 9c
+		];
+	};
 };
 
 #if SW_CONFIG2 == SW_ON
-- 
2.39.2


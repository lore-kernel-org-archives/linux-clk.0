Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BB71DFE0B
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 08:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730881220; cv=none; b=A/u56PjLKx5YyvMBuPX7orLoqJ8EvBCZNk3oFyzuy2OJapI0DgoqSM2QtoPmfZ1C3Xn++tBXDtJprkWRP8IACtRtC0ck6KEQ4cLr0EA9ca3GigfTFX5KqjFywJdPW81+t9Muq1W7cTjJr7hQGS4N7eARNLO1pYjtiSy7ZuWF/zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730881220; c=relaxed/simple;
	bh=AmQ9VjO7lv1oInRN+F47Jod2ymKziE+6QNjH+4sP+io=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iylgm8E1fdh0+bKbORjfij1cx2RM8r57YizggIWkqCAV+/7QZFPTOi5AWkGeY3TCVAh9Oum1H90ZTP+rmSor2mdRYGzhhUlZ7qGEELqy5c6n3MQ3+zLcVKB3CqqoW7Do6wY7wlmGUtJlTzWVnOfcLnSPK3InlAg8sqPFmS/m3g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NgVaLZ/B; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NgVaLZ/B"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso1099847566b.2
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 00:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730881216; x=1731486016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP8a/ac/GS/uy3/6XCttRayjfeh07Xpvr/y4hz/gpH8=;
        b=NgVaLZ/BAlxl2IsxLOgTA7+/qmjZEkVB0M1SF+x6PhYXPfD/2kRRr3Vk5sDhBOt0wl
         E/F1bLgBih30qux+hb4Rp9NGTNlhDvMJ02eE5XmZkmSt22UMc7qPEqxXpg/B2Yf59Ewp
         SBnxTIlGdGB42nHxBZPLofJ87KQxeRXZWEEA6ARpqr3dGxBR+9H/YxI0fFJQXBi/Lq2q
         58QaGVJLK1LRo9VwqBwYCA+JIPxVLgYEn3HRI4yGXp51pLcjPrKmiZx5uG/jYOU0g8Nm
         gg3mzZAIQilBncnEgDsMf+jfhQBVE4uLSH9n/t9+tI9KxmcnfCkgJMbmWIbIOimksf+x
         LKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881216; x=1731486016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OP8a/ac/GS/uy3/6XCttRayjfeh07Xpvr/y4hz/gpH8=;
        b=OqmTsUBiEDZ8BNgX4sxBFKG/p5PlL+hr04G63DpomwwjwqmSA9suNIjpyJkuv5G5s7
         +Xz2/k2iOr0ptSK6DOZ9EoHdBfqfdwqGG7dRiXKx6yqIW2xTaJstymMgEZAY0ze7M3ju
         2N0YYBsW2ZLDXcNhsV/bp1X/ozuYvoH8vptIcCvXIS9LiVW6J4zhD7v+LCj1F6kOQUKP
         jtH2hmUFlhrVNdxpoM+pFzXhLgZ2yjNjfX8z7rt5+NkXOXCisuvMKYtVLbP6mlSBzvuX
         NMWnNPLvSqb5xe94T9f4/Rp0P7m5Hdq9+LulLktVuI8RL5VBZrUu3872LMicKBFs+VV9
         6N1w==
X-Forwarded-Encrypted: i=1; AJvYcCVH/GFUxu9XvE3xCqHddTEb9Srd7Apfe98tdPrEO/hnlY+uKKSixYDbOaxyCPLEXeHomobKD2GlYjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Dl285kAEA3Os8EuixF/1iSP4H6Vf6TJaWN8SJq131vX69Tb8
	ojmbUl62vH1fC3ZvQQhYZST2P4/jldsh1qALneFOTNj8VzTszs53vVmRBOnmoIg=
X-Google-Smtp-Source: AGHT+IGJiZzESlntHvmDLzeM53IQCRK40t//hDLlFo21WKnp1qf5ws9XSkdc+uo5ygVV3pB54qSSUg==
X-Received: by 2002:a17:907:724c:b0:a99:fa01:2b72 with SMTP id a640c23a62f3a-a9de5ee15e8mr3705276366b.33.1730881216506;
        Wed, 06 Nov 2024 00:20:16 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a2dbcsm241369766b.40.2024.11.06.00.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:20:16 -0800 (PST)
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
	support.opensource@diasemi.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 28/31] arm64: dts: renesas: rzg3s-smarc-som: Add versa3 clock generator node
Date: Wed,  6 Nov 2024 10:18:23 +0200
Message-Id: <20241106081826.1211088-29-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
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


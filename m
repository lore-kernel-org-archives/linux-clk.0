Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208DA130AFD
	for <linux-clk@vger.kernel.org>; Thu,  7 Mar 2024 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820485; cv=none; b=GW9EG9uXLLyoRz+gk7XQRpDRzWajveuLpAdLe25kDQ4PgYywD6m8kHovoNma4UloyMbnDWTiAGjzLQwO9i5qLhH5I5xWz3OZt/6cma4CyBf9rhLLqziRNj5wRD57WKI+YAo5Noptm8F6AiHpE59gNdjSC+IL6jGL9zWe6DUF5Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820485; c=relaxed/simple;
	bh=PEMKuouqVKmmpKoVkq3vAFTw0XHIm6pIPcKox0E3AAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uOA4Q35e+RbJRMI2QMru5ILy+ZGFKw4abYzu3GpC0SxySkqRi+8rvjVjGHqddqhFbcgjcbXE60cZ+Sel/4zjtB13dnBMHw6JXhuAUNqYNuBfBopkrXMHrzD1D0B2B2hneEMHz0t15s/+guYPdOgKVwpzht+AwPTYmlRuO/JnIZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AGZkRS19; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AGZkRS19"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a45bdf6e9c2so120560466b.0
        for <linux-clk@vger.kernel.org>; Thu, 07 Mar 2024 06:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709820481; x=1710425281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpzyVLIzoJjoH1dmsrwx7exqYjIDge6ltNcGIu8yesY=;
        b=AGZkRS1994Q9dicDpXIxvRfNSOM0EKaWJbMEXvWxd2YuiZD8wCeUlBp7khSlEzJvBT
         LT8yQ/1in+Uyh4+2XesXpgmT2bwjVsXEEBUdPn0DU1YCPzOUU/ofUKiL7CyHBJQS4R8+
         ur/dZi6BDG3ne5LMjkNn4T/a7lhTGhmHFBwMlr+OWE+/RfYXSsi5/Us4bxMPGbWwbTBW
         +fxRyGrO/IFuwyh2XwCTVRVRsd72IqwbW9pobSQIyWZjkImgYtP9m+5UmwUN5gqpoW5i
         ub6AfwNsefprL1vcbzAUiXicnH+7rNXNAvefYt0hXPqL7eqIZpikR93TkJK+KBzs6Ege
         Og4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820481; x=1710425281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpzyVLIzoJjoH1dmsrwx7exqYjIDge6ltNcGIu8yesY=;
        b=ddAEQtLNS8psL48F1KQVa+m1aXUDfB+Tziqi2gtNXOYmL2/8l5zX/H3GRv1hN2bn4g
         NI5XSRzIE0ctS+E3oYcAl4Clgb/zgvF9N/T7o++zt8L6Np2oF3cUZXyoE4BZUHEXt9sn
         qx3scqdo0rsJCHJy6mdfILUT9YqSPBuTOmEAMXwbQSUuW5ZX3+WHAlye6T9xcwFRlHO5
         R3gvZB2NC3mNq6Ko883Z5KYsqUa45KotYigd8K/HnBNqCIZqggrOi1gSViuITIkWB/mi
         t7k2LAT43k90Eqp4rYqhqweNYQfNbMxd+ar0jaU/8XgSAZLyaWh++LT57h8HKwBegt/4
         Iqxg==
X-Forwarded-Encrypted: i=1; AJvYcCXYyQYjTvpvs0SVeVMyOkDMPaRdSh7zS5/J2tkhInOpldTEJX0I7mmXvN+BbIZ/BUDIuR7YHp1nPhMS/EV0sqOGNIv4ROuyeSSJ
X-Gm-Message-State: AOJu0YyeiFEitnr7u3vYIQbHRnjXXVdob4AO1tNSH5anlgbt1V7NCzwJ
	IOON/ss1nej9nOJ9dgnBT3oJ/tTSYjogDIOvi7n22r0rbjBOAl8kk6MJJs6DcKk=
X-Google-Smtp-Source: AGHT+IH383qSNmyroOVk8Z2J3JB8DfKL5t+7aDSA7RmXDdNZsBGBQvrJfyji96J2AnloEHn/Ij+c3Q==
X-Received: by 2002:a17:907:100a:b0:a44:4e9a:8cc2 with SMTP id ox10-20020a170907100a00b00a444e9a8cc2mr12771230ejb.58.1709820481472;
        Thu, 07 Mar 2024 06:08:01 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.38])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00a42ee62b634sm8200648ejo.106.2024.03.07.06.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:08:00 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 10/10] arm64: dts: renesas: r9a08g045: Update #power-domain-cells = <1>
Date: Thu,  7 Mar 2024 16:07:28 +0200
Message-Id: <20240307140728.190184-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Update CPG #power-domain-cells = <1> and move all the IPs to be part of the
IP specific power domain as the driver has been modified to support
multiple power domains.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- used proper domain ID for IA55 interrupt controller

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 19bbcae01d80..f7a45fca5406 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -67,7 +67,7 @@ scif0: serial@1004b800 {
 					  "bri", "dri", "tei";
 			clocks = <&cpg CPG_MOD R9A08G045_SCIF0_CLK_PCK>;
 			clock-names = "fck";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SCIF0>;
 			resets = <&cpg R9A08G045_SCIF0_RST_SYSTEM_N>;
 			status = "disabled";
 		};
@@ -79,7 +79,7 @@ cpg: clock-controller@11010000 {
 			clock-names = "extal";
 			#clock-cells = <2>;
 			#reset-cells = <1>;
-			#power-domain-cells = <0>;
+			#power-domain-cells = <1>;
 		};
 
 		sysc: system-controller@11020000 {
@@ -104,7 +104,7 @@ pinctrl: pinctrl@11030000 {
 			interrupt-parent = <&irqc>;
 			gpio-ranges = <&pinctrl 0 0 152>;
 			clocks = <&cpg CPG_MOD R9A08G045_GPIO_HCLK>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_ALWAYS_ON>;
 			resets = <&cpg R9A08G045_GPIO_RSTN>,
 				 <&cpg R9A08G045_GPIO_PORT_RESETN>,
 				 <&cpg R9A08G045_GPIO_SPARE_RESETN>;
@@ -173,7 +173,7 @@ irqc: interrupt-controller@11050000 {
 			clocks = <&cpg CPG_MOD R9A08G045_IA55_CLK>,
 				 <&cpg CPG_MOD R9A08G045_IA55_PCLK>;
 			clock-names = "clk", "pclk";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_IA55>;
 			resets = <&cpg R9A08G045_IA55_RESETN>;
 		};
 
@@ -188,7 +188,7 @@ sdhi0: mmc@11c00000  {
 				 <&cpg CPG_MOD R9A08G045_SDHI0_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A08G045_SDHI0_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SDHI0>;
 			status = "disabled";
 		};
 
@@ -203,7 +203,7 @@ sdhi1: mmc@11c10000 {
 				 <&cpg CPG_MOD R9A08G045_SDHI1_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A08G045_SDHI1_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SDHI1>;
 			status = "disabled";
 		};
 
@@ -218,7 +218,7 @@ sdhi2: mmc@11c20000 {
 				 <&cpg CPG_MOD R9A08G045_SDHI2_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A08G045_SDHI2_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SDHI2>;
 			status = "disabled";
 		};
 
@@ -235,7 +235,7 @@ eth0: ethernet@11c30000 {
 				 <&cpg CPG_MOD R9A08G045_ETH0_REFCLK>;
 			clock-names = "axi", "chi", "refclk";
 			resets = <&cpg R9A08G045_ETH0_RST_HW_N>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_ETHER0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -254,7 +254,7 @@ eth1: ethernet@11c40000 {
 				 <&cpg CPG_MOD R9A08G045_ETH1_REFCLK>;
 			clock-names = "axi", "chi", "refclk";
 			resets = <&cpg R9A08G045_ETH1_RST_HW_N>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_ETHER1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -280,7 +280,7 @@ wdt0: watchdog@12800800 {
 				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "wdt", "perrout";
 			resets = <&cpg R9A08G045_WDT0_PRESETN>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_WDT0>;
 			status = "disabled";
 		};
 	};
-- 
2.39.2


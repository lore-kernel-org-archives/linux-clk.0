Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A441B2512
	for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022971; cv=none; b=nV24ASDVylYaQzUSAyU3F7Q/4+FimQRO8ivfbRJoo8qBu8PI3dK1Vy65Bp6N6VtJPLNDSt1wVqbeRn2ClE8NEzeuk3DVUnyEpOayAmLbZGsIZh0M5lxNNWrQB4YXAuRNBRN0IVCq3JQdDSvvPtZesUTpC266OFL1swEO66EvV4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022971; c=relaxed/simple;
	bh=Kn8JY+f5fHXbVdAysJnh2gUAir0at5VP87GfCZJ8SYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K8ZmK4pNC3QCn7vMV8N01saSls4fBiljpmd72r+KF0/zpGVLytijW+FvnFd7Kif7LhTAoe6mpsZdeoLA+jPo4s0V4m9U7U1p3hIg3WZ+0PKkIMP77dRRzcC/37qmOcX9N6+1Pe0UodJwBWKk2GGOAYW/1DRwuSS1Tr/lkszPF64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Cr829d5Z; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Cr829d5Z"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-533488ffaebso2166476e87.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 06:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022967; x=1725627767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukqX5sC9LJpcoIMKohkjjIWRhtJZ817S3qSAcOa4kZM=;
        b=Cr829d5Zt41qpIs9ViBHVJeEeQFYIdWlS9cKMccjC6960HVWXZ1YpyXYmf3gjnhKoN
         n/BxzTPyaXTLy4HQsZ1R6jUUnutMsGbN6GQMQApm+h5hmz0ra4nANN6akw/2OwQJKhtI
         CHgsMET93HrYX5+pX7yggpmC12uECH/RcIurf0u2NFv1pChNz5GX6eynhslWC+rklUee
         IgYtFaBOldVIrkDT369zYdeq8hq0C3wQc1doN4mY5WdDkHij441V0JWHD1hn3jL7TpIJ
         4efGq6cA6srmfYbwtvRxOwjhQECe6p12oaVrH7ZRzbrEx6oq8dKI6OWDIN2tV6wQt+BQ
         ehMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022967; x=1725627767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukqX5sC9LJpcoIMKohkjjIWRhtJZ817S3qSAcOa4kZM=;
        b=kdQo10/bs7STLBxf1YTNCunm/sFhh37D4GEUmqIDJOWhfRgf0gF4PztXKOwQWsYxRm
         dFW4vBaKK5E0Nccty8hH3gEUepnLBXcdQCSrE3g6rJx7yJWVcv8SS23xMLJEVMnvXAfV
         TgHMr51waaNUxXsKbXR3rLgj7OwTPbVfqRuCZEfgLeoneYWAsGeJbL9WDKwc1M8u7jcv
         UbNOQeDo9d+Dz31kuhmfYfXP13LKc/seLJ+OD46fKX883AiwT1OI1mPH8oVbR9XZtK30
         aT9Fr73C/ulGUiXYEnnpn5DYqDb1RI0pn1ZmioxQ/I9HrxR/RLWY+y37qogueF+DEXpZ
         8Z9A==
X-Forwarded-Encrypted: i=1; AJvYcCXr8wjsjHnplrXof3n7mLhI9M2Kx5b7yOQ+Jm6NarYRzo95+JXHPKnZzLDVeRZr+SCODwDRiWrEUhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFeIagpVp2q8NMwAsK/TPMavctdwbpUdd/k5UmtrVB5JKpF5Ip
	O1tDB5ZWIxLjrMJktywozvxsxIZPIo0z4A+WZla6YiKHLoqpJU0ePNvryFktJWc=
X-Google-Smtp-Source: AGHT+IF9cc2jwjLzI4jgE1O9TLs1SvEtqqWHN58dUrodIH74E0JWxf1LOzmgmFTE6AuLu3nFrEl8sQ==
X-Received: by 2002:a05:6512:15a0:b0:530:ac0a:15e8 with SMTP id 2adb3069b0e04-53546af3fb5mr1440203e87.11.1725022965066;
        Fri, 30 Aug 2024 06:02:45 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:44 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 07/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
Date: Fri, 30 Aug 2024 16:02:13 +0300
Message-Id: <20240830130218.3377060-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v3:
- dropped the child nodes of vbattb; along with this dropped ranges,
  interrupt-names, #address-cells, #size-cells
- added vbattb_xtal as input clock for vbattb

Changes in v2:
- update compatibles
- updated clocks and clock-names for clock-controller node
- removed the power domain from the clock-controller as this is
  controlled by parent node in v2

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 067a26a66c24..247fa80a4f53 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -160,6 +160,18 @@ i2c3: i2c@10090c00 {
 			status = "disabled";
 		};
 
+		vbattb: vbattb@1005c000 {
+			compatible = "renesas,r9a08g045-vbattb";
+			reg = <0 0x1005c000 0 0x1000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
+			clock-names = "bclk", "rtx";
+			#clock-cells = <1>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a08g045-cpg";
 			reg = <0 0x11010000 0 0x10000>;
@@ -425,4 +437,11 @@ timer {
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
 				  "hyp-virt";
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


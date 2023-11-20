Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pOOKuEFp"
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0676010F7
	for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 03:18:44 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40839807e82so9670795e9.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 03:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700479122; x=1701083922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGvXvdztvnU1Noz3qGE9zeJXlVtwjcExrfXoSufIG6g=;
        b=pOOKuEFpUEgBmFpMI7RSjFsYDT8AECq+ge4189kqw49264Pci3accNK65X1Yf3aS/g
         I4nxjk57NyAcOHvIE6fYwJZJdH8OYdnqhwhoDssmwhb9ZGhW54/HSRkY2pI2WIC7ODg9
         2iMl2yVWw84bPANMe9c/KmT7g+QLk6fuTPKvQ8Z3V5vW78ia38oQB4mzk4UMx4jq/JyK
         bj2LMa/CIff+KipplMElmGK6yz9cy5X2mAe6hhcQFzDwBmYoDPlQVi8+6VHyYVL8F0TX
         lp6AfpK9LyGIXT2cRMe6vmLpw/ulYQ4xLuiygh1aKMC8Z8FiIS043M/6mtsd1c0zisbu
         +I4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700479122; x=1701083922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGvXvdztvnU1Noz3qGE9zeJXlVtwjcExrfXoSufIG6g=;
        b=UEW6ABc80GK2vQg3eY6ck/C1NUP/Iyu61rkRQcf8i+ytxWvhRse5Sj1la9KJWUUO2J
         BRfuf+WC+H4IO06EcmMdoqLpAhVTVugI5EtU/4ju2XpF0NaS0v6+DjiMX5kr9qb7CdZ+
         JveO1bM7e4JOImsWUPD3gOy6W25OSp6gxNSCEPg4NIwAEQ7jwtsAdZDGALkbAxnO8pSM
         5hcFGHDa2bHAZo5pofgQyomyzNhMoXonyTk7EEjTTOQ80jfi1Kth+nQkv7XjBmd9g5u/
         XSRStKuJcn7GLbuJbm8hiQORp6ZzKTJBEGrssvnzTjvDfjTcvleqA8+uyG6+T1/u618U
         lXsg==
X-Gm-Message-State: AOJu0YwhzloeNxH7EOf1M4rT7KIMSMzVp7z5JClQzo5EY7HZJviqD6v2
	ldPQneuELPmFGMT9e2kAKYO1dw==
X-Google-Smtp-Source: AGHT+IFiqC0hAoROkF8bGe1DWe/xZ03qtfGR9V52jRRdovggVx9Iq3wYl/7ufgUAj6kVUgCoo0FR1g==
X-Received: by 2002:a05:600c:358e:b0:409:6e0e:e95a with SMTP id p14-20020a05600c358e00b004096e0ee95amr5778715wmq.19.1700479122593;
        Mon, 20 Nov 2023 03:18:42 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c310600b0040651505684sm13142676wmo.29.2023.11.20.03.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 03:18:42 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: tglx@linutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 9/9] arm64: dts: renesas: r9108g045: Add IA55 interrupt controller node
Date: Mon, 20 Nov 2023 13:18:20 +0200
Message-Id: <20231120111820.87398-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add IA55 interrupt controller node and set it as interrupt parent for pin
controller.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 02a5dc9a0a3e..793512c4b31c 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -101,6 +101,7 @@ pinctrl: pinctrl@11030000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			interrupt-parent = <&irqc>;
 			gpio-ranges = <&pinctrl 0 0 152>;
 			clocks = <&cpg CPG_MOD R9A08G045_GPIO_HCLK>;
 			power-domains = <&cpg>;
@@ -109,6 +110,73 @@ pinctrl: pinctrl@11030000 {
 				 <&cpg R9A08G045_GPIO_SPARE_RESETN>;
 		};
 
+		irqc: interrupt-controller@11050000 {
+			compatible = "renesas,r9a08g045-irqc", "renesas,rzg2l-irqc";
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0 0x11050000 0 0x10000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "nmi",
+					  "irq0", "irq1", "irq2", "irq3",
+					  "irq4", "irq5", "irq6", "irq7",
+					  "tint0", "tint1", "tint2", "tint3",
+					  "tint4", "tint5", "tint6", "tint7",
+					  "tint8", "tint9", "tint10", "tint11",
+					  "tint12", "tint13", "tint14", "tint15",
+					  "tint16", "tint17", "tint18", "tint19",
+					  "tint20", "tint21", "tint22", "tint23",
+					  "tint24", "tint25", "tint26", "tint27",
+					  "tint28", "tint29", "tint30", "tint31",
+					  "bus-err";
+			clocks = <&cpg CPG_MOD R9A08G045_IA55_CLK>,
+				 <&cpg CPG_MOD R9A08G045_IA55_PCLK>;
+			clock-names = "clk", "pclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_IA55_RESETN>;
+		};
+
 		sdhi0: mmc@11c00000  {
 			compatible = "renesas,sdhi-r9a08g045", "renesas,rcar-gen3-sdhi";
 			reg = <0x0 0x11c00000 0 0x10000>;
-- 
2.39.2


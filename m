Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8022D7B1
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 14:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gjTXZ05H"
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82967D48
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 06:28:52 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso1014597966b.1
        for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 06:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700058530; x=1700663330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ph5VaXSR4iSREbqKDYWT0/681kulsNQBvjFb+K43E8=;
        b=gjTXZ05H0n49qYQ6oQwpvkqZQGIqCixrRazZYSMqD1j5FL6nHy97E0r2zAesmWTOeB
         xPB/ZKG6lqbvng8bXhy+ISAtDHUHDsi7OD70Nzxdhgx+UtsTTVDBg9UEOG/7lr+ouOwi
         PvoawdUy35CISyIow0UehnBF/5vW7uBJTZO6dnzGWX76MlRcpuDLm/6k/sDLadcfLQAV
         IIsmGVnWkODZh5e3cMz6uCk7+hj3/mu/vbWilUGsal0drLhjgcofq30XyS+/gz6qI0qc
         8cshDGPml1XSBwWKxN0A2d6QL5n/KVFSJMpQuaolhbLo+Yk20vUdHG1ZkNqXOBFNy/wD
         tUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058530; x=1700663330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ph5VaXSR4iSREbqKDYWT0/681kulsNQBvjFb+K43E8=;
        b=TfSE1ePpWiFOAIFIPeGppdfBokGzfEmFWQABY/VaQhQ+MPV+4bJT3+zkyArIvQrSWC
         gbnp0SOrsr34sMyo4fPz1BDoyqDgYr71pS+nYheqfLnD7TU2sEI+UkuqiGQhAQHFXSWf
         /3n4kvw1jTJBKVzSIEEPNdJPprkSHKok93PZuyQGGmbF6eZbaudNMrO35XJe+UiXDLAR
         /u8a0TXLPcS8i3UhQqduDT+McATVCbdhGJpKQcnOoiWuVFatzlAVIX3rW9yz3NR/RnYE
         WY8jAEXTgnn1c3Zd81IQWIQQ1O/WaJYzNSRTOa/MpMBWl+zs9K3sjLp6zhhUAu5Islnx
         ToCA==
X-Gm-Message-State: AOJu0YwcXDFiheQtwvL4XSeK/uIxmBhqeEmzoyp0mpaLso6cLrfOhzjm
	cTEKGpFemRxDTtmUfl3jtXHt6Q==
X-Google-Smtp-Source: AGHT+IEp5vJYHNiETPzIRzWKBALXwyA9+U9jlhj5d94+ulM6YmwXzNJG2E6ChuG2P3H6As4S5NnliQ==
X-Received: by 2002:a17:906:2608:b0:9e2:b250:98ca with SMTP id h8-20020a170906260800b009e2b25098camr10111867ejc.28.1700058530266;
        Wed, 15 Nov 2023 06:28:50 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.119])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906264b00b0099bd5d28dc4sm7186394ejc.195.2023.11.15.06.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:28:49 -0800 (PST)
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
Subject: [PATCH v2 9/9] arm64: dts: renesas: r9108g045: Add IA55 interrupt controller node
Date: Wed, 15 Nov 2023 16:27:49 +0200
Message-Id: <20231115142749.853106-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231115142749.853106-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231115142749.853106-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v2:
- none

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


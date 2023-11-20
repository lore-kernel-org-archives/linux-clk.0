Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BFOFMem4"
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB57198D
	for <linux-clk@vger.kernel.org>; Sun, 19 Nov 2023 23:01:34 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3316ad2bee5so1638035f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 19 Nov 2023 23:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700463692; x=1701068492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkcJv/n25yVcOiFtcSZqk6XZG7ziIP0OV/0d8NOsfDc=;
        b=BFOFMem4itbBhisA6WH4jN48nS0ZNRBh4t2Ptd7TZzo2t1IaLM4ZkLR/KdJ7J+6dtJ
         mLYKQ68WxQSsh9oRdyez6fXFQ4vLpSNpfWrv7LB5e5LEEYDu6dAqg3ZRk64QAKu8Tpf7
         OZbNPzLsSIWUzCQ9X3ySLxMGb71G/m6Auu6SGey0pmBBsdC+PRcTv4OZJfeyvrZmgS4G
         VbvLDHus6g4o2CQWPnHEa0inuwtU19h3NzPu96s3xVqupDaSRwjEXgoRPBAQbUStiHoG
         ieSey+YhM1+7rWs/f6mx6w2RJnWTD+3Mx5VuWceh6Q+WbfcjAHucjwnzZmmPEVkziNyj
         YODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700463692; x=1701068492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkcJv/n25yVcOiFtcSZqk6XZG7ziIP0OV/0d8NOsfDc=;
        b=prmuSlmHJJkuG1JSxSSv1tkJd52ddeFe3gTrlxTRmWpZQ97ck2vQdq7gXQp795RMYx
         ECSpAmzXFCcm17P8aINLm9UA1fAFoPCUpS3BzRBGHr+O56PqPn6x01TGm2uScrKbqx0N
         6Ecg41ztWiOfMpyC0xgNRk/NgjoT+ikFuq9tHznyL6Y7vIvUer0GthPezHUl/cOSFVPX
         YasDhFmD+J4O6XTssAit8VlvidtQBGFPHVWZ3p/Qikj4MrfbG0Ff70vOH3NyUNhY8j/8
         3Dh2zvfm8CZMTxdGsmcFEG5QYbs1Okms75mnyR+9unPKxuMDAzndjRdurFHVOtYPV3Oe
         qLAA==
X-Gm-Message-State: AOJu0YzUtdRx0awdXMDvB4cXgyQj92CwMvniEPHM+mAQKhUifwfeNP/b
	jMaZvHR7bgtXxIwiQ07hFyvn+Q==
X-Google-Smtp-Source: AGHT+IEBLuefbg1njE14kEGbqq0fRVMDaq5GwcjTSHn9CnqkZZMPo7YgEjo/NJi89a64TaVjABT6og==
X-Received: by 2002:adf:e98d:0:b0:31f:9838:dfc4 with SMTP id h13-20020adfe98d000000b0031f9838dfc4mr3893259wrm.33.1700463692126;
        Sun, 19 Nov 2023 23:01:32 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm8777667wrq.78.2023.11.19.23.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:01:31 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	p.zabel@pengutronix.de,
	arnd@arndb.de,
	m.szyprowski@samsung.com,
	alexandre.torgue@foss.st.com,
	afd@ti.com,
	broonie@kernel.org,
	alexander.stein@ew.tq-group.com,
	eugen.hristev@collabora.com,
	sergei.shtylyov@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 10/14] arm64: renesas: r9a08g045: Add Ethernet nodes
Date: Mon, 20 Nov 2023 09:00:20 +0200
Message-Id: <20231120070024.4079344-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add Ethernet nodes available on RZ/G3S (R9A08G045).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 6c7b29b69d0e..1caa0587fdd4 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -149,6 +149,38 @@ sdhi2: mmc@11c20000 {
 			status = "disabled";
 		};
 
+		eth0: ethernet@11c30000 {
+			compatible = "renesas,r9a08g045-gbeth", "renesas,rzg2l-gbeth";
+			reg = <0 0x11c30000 0 0x10000>;
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mux", "fil", "arp_ns";
+			clocks = <&cpg CPG_MOD R9A08G045_ETH0_CLK_AXI>,
+				 <&cpg CPG_MOD R9A08G045_ETH0_CLK_CHI>,
+				 <&cpg CPG_MOD R9A08G045_ETH0_REFCLK>;
+			clock-names = "axi", "chi", "refclk";
+			resets = <&cpg R9A08G045_ETH0_RST_HW_N>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		eth1: ethernet@11c40000 {
+			compatible = "renesas,r9a08g045-gbeth", "renesas,rzg2l-gbeth";
+			reg = <0 0x11c40000 0 0x10000>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mux", "fil", "arp_ns";
+			clocks = <&cpg CPG_MOD R9A08G045_ETH1_CLK_AXI>,
+				 <&cpg CPG_MOD R9A08G045_ETH1_CLK_CHI>,
+				 <&cpg CPG_MOD R9A08G045_ETH1_REFCLK>;
+			clock-names = "axi", "chi", "refclk";
+			resets = <&cpg R9A08G045_ETH1_RST_HW_N>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@12400000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.39.2


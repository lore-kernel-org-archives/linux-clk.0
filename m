Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51540390219
	for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521898; cv=none; b=NrlE375XVAA9b9ZhRZ0QC5SRW0ABoihyav+xra5gKMGhmUJvO1gFZK9QGTccapgOy/Erdnm8TfWJUQ+NPGpBzmjzShXF8n5/bsm8tz16g9WVZvmpFD6D6DeFzvBQKjTLvsiQ2COrHMNYvbJcoDXAdAY2RwMBY2Zc+7D9fmceN3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521898; c=relaxed/simple;
	bh=MrFw8HsYf1WGSbJh/2gG3na1ccwgspJiiKfTITG0GkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHdVLlcs6S55y5kSCY4iC0JhMqM5fvE4uv2ZkzhLCpKFP3yftqBXFKdfgB3g2xtSzKA3tqdgdOEGPvYmdb+zBE1ixiNTE3Se3dNJTigm+nmPeTXMMyAWsRkab+V7b8MmzbzOmOstEMghn5B4Fwaj6pshNi0L+B+P1AeIYcHuMsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6SIPGch; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6SIPGch"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-488615e6cfcso1628052f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521892; x=1791126692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HXbMRgIpW1xfL0vVAELOv8qR2MQ01942FUYAID9kA8=;
        b=M6SIPGchQxqsujZGi8+d1EtFG6B/ZEyNpHLDeC6dcck9fl0E5sBGVC3rVYnjpQ2rkl
         LtDhbZrUEiAn8AUUQoiHxNcHmytx+jMTTGyOxjMW/NF3hJoUftKAl9kzEZ2s078XDiCk
         UafmFhpFs6nsy8RT2OoxqwImCTfFPJkxMCXv2tUDoBrvZTsZ1h3ghmE7v5iX42uNs/zc
         eAttQcKIH58ryNiitUT3qiRA/Zts9YrSqEmBDIQmpYhY279kz5mHtT5brKbL0lzg32hN
         2INZYJWL0k6AirZ2w/N4VWkYx8yqSMcaE05K15C/XEkKvi/N9WAk0xNWpoXFsrsg/loB
         fLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521892; x=1791126692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HXbMRgIpW1xfL0vVAELOv8qR2MQ01942FUYAID9kA8=;
        b=ZKDKCi0xLm/ki33iJ+3Zynlv3Qegdvj2wx5KVUhGzThEzohO+/V0YiTwIz6IxuB18m
         bIpkK1RXY4EMg0ZwoUZSqlfsWCDOXUIyFm3vgNdcIvVfX0xx5iM4jCO/sHcVnGfYg0Vm
         jGT9ldmOeiZraYqNHPXAqB4lQNMRG30r0yc+OomWkgQ5X7723669GWqh4x+fuZHQf3Wf
         wAiPiLNS6Ki/BEF+Spjc0wnES+dxscUukYNtspbRDmd4ciK60AQbvK0YAi+V9GDB5tdG
         AmGX6Z8kY35tOT+DOUf1+1BpgHSZMb25+WdSKwdQZfONIypucWGrdGSrCuY9yRaeuGOc
         YoJg==
X-Forwarded-Encrypted: i=1; AKwUvBzxWyMtVEtr4OSzq1Ip+Jus/jo1D4+EZMqtjvb6Y59ofEHqoEfdPSzIrEmtZ4+iRNjUdrfMIQYZQQU=@vger.kernel.org
X-Gm-Message-State: AFuF++l0LwksTSo6iPjEfJNrMJ8xvoSFLhf6j63OlmqAPXFlgR1CP2sL
	jkN5UhT02WKoF7OqO/348Ii80CNz2okqpV5+BtixsnQQaLJNMsn+BLTM
X-Gm-Gg: AYBFou0gGyWodhNVTrwb6wb11E+LgiEKO0UNQmHDSNKPU85bhLKjuqgUNqwGY4DNkRU
	PBaygm/sJt4V9Ve51Kz/9lPg1GHKHczSY57p0R9+Vyx0raV6hJSq13P+b57i2H0lHdf9xET6TbO
	AFcEdPPwm7HvMSnOmT0xH3T5LvHve+ZkK6e+wWjD+A4GYnwP70xS2wsaLpyX09kyf+CkyxSjYE2
	XBO+G5lgq11sqHg56Vh+veM/jbEDVWoO0J4C9AzFttTIFrrqLqbmltNvl2G9aty2B4/rBm32KUe
	zSuUSqL90131TiK2DyCp+PSTBpTEdeKThQ99YApypCNKpxUJiA2fFmTXR9lFWoPgMBvrr9KFKnE
	SbLPgHnCYlCNOLexpdzP1VDjb2sxiCrBCovFlZB2xvs/oR0OqrmNWtftGQp1doCiScSORzVdSwN
	qxe9hbflBtL/cngGjy1VttgPpr1E4QgYgFtsWPLV0OZBv20WVbA0OHIv95/bV7TG1RZLe7OyBye
	ZRjxBKdReY3ZO5eO5dM8R+v/evnA/Ie
X-Received: by 2002:a7b:c314:0:b0:49f:bb49:9cca with SMTP id 5b1f17b1804b1-49fe66cf67amr152831735e9.5.1790521892183;
        Sun, 27 Sep 2026 08:11:32 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:11:31 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 01/11] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:06 +0100
Message-ID: <20260927151016.186493-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.
Its CCU needs only the two oscillator inputs, so it fits the existing
schema without changes.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../clock/allwinner,sun4i-a10-ccu.yaml        |  1 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    | 88 +++++++++++++++++++
 include/dt-bindings/reset/sun8i-b288-ccu.h    | 45 ++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
index 1690b9d99c3d..cc3f62d3554c 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
@@ -28,6 +28,7 @@ properties:
       - allwinner,sun8i-a33-ccu
       - allwinner,sun8i-a83t-ccu
       - allwinner,sun8i-a83t-r-ccu
+      - allwinner,sun8i-b288-ccu
       - allwinner,sun8i-h3-ccu
       - allwinner,sun8i-h3-r-ccu
       - allwinner,sun8i-r40-ccu
diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bindings/clock/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..8983c6d2f362
--- /dev/null
+++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_CLK_SUN8I_B288_H_
+#define _DT_BINDINGS_CLK_SUN8I_B288_H_
+
+#define CLK_PLL_CPUX	0
+#define CLK_PLL_AUDIO_BASE	1
+#define CLK_PLL_VIDEO0	2
+#define CLK_PLL_DDR0	3
+#define CLK_PLL_PERIPH0	4
+#define CLK_PLL_VIDEO1	5
+#define CLK_PLL_24M	6
+#define CLK_PLL_PERIPH1	7
+#define CLK_PLL_DE	8
+#define CLK_PLL_DDR1	9
+
+#define CLK_PLL_PERIPH0_2X	10
+#define CLK_PLL_PERIPH1_2X	11
+#define CLK_CPUX	12
+#define CLK_AXI	13
+#define CLK_CPUAPB	14
+#define CLK_AHB1	15
+#define CLK_APB1	16
+#define CLK_APB2	17
+
+#define CLK_NAND	18
+#define CLK_MMC0	19
+#define CLK_MMC1	20
+#define CLK_MMC2	21
+#define CLK_MMC3	22
+#define CLK_SPI0	23
+#define CLK_SPI1	24
+#define CLK_SPI2	25
+#define CLK_DRAM	26
+#define CLK_DE	27
+#define CLK_EE	28
+#define CLK_EDMA	29
+#define CLK_TCON0	30
+#define CLK_MBUS	31
+
+#define CLK_BUS_THS	32
+#define CLK_BUS_NAND	33
+#define CLK_BUS_SDMMC0_BUS	34
+#define CLK_BUS_SDMMC1_BUS	35
+#define CLK_BUS_SDMMC2_BUS	36
+#define CLK_BUS_SDMMC3_BUS	37
+#define CLK_BUS_SPI0	38
+#define CLK_BUS_SPI1	39
+#define CLK_BUS_SPI2	40
+#define CLK_BUS_I2S0	41
+#define CLK_BUS_I2S1	42
+#define CLK_BUS_SPDIF	43
+#define CLK_BUS_DSD	44
+#define CLK_BUS_DMIC	45
+#define CLK_BUS_USBOHCI0	46
+#define CLK_BUS_USBEHCI0	47
+#define CLK_BUS_USBOTG	48
+#define CLK_BUS_DE	49
+#define CLK_BUS_EE	50
+#define CLK_BUS_TCON0	51
+#define CLK_BUS_CSI	52
+#define CLK_BUS_ADDA	53
+#define CLK_BUS_SDRAM	54
+#define CLK_BUS_PSRAM	55
+#define CLK_BUS_DMA	56
+#define CLK_BUS_UART0	57
+#define CLK_BUS_UART1	58
+#define CLK_BUS_UART2	59
+#define CLK_BUS_UART3	60
+#define CLK_BUS_UART4	61
+#define CLK_BUS_UART5	62
+#define CLK_BUS_TWI0	63
+#define CLK_BUS_TWI1	64
+#define CLK_BUS_TWI2	65
+#define CLK_BUS_PIO	66
+#define CLK_BUS_GPADC	67
+#define CLK_BUS_KEYADC	68
+
+/*
+ * mmc0 and mmc1 are v4p1x controllers driven in the old timing mode, which
+ * needs the sample and output phase clocks. mmc2 and mmc3 are newer blocks
+ * that do their own delay calibration and have none.
+ */
+#define CLK_MMC0_SAMPLE	69
+#define CLK_MMC0_OUTPUT	70
+#define CLK_MMC1_SAMPLE	71
+#define CLK_MMC1_OUTPUT	72
+
+#endif
diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bindings/reset/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..675145654548
--- /dev/null
+++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_RST_SUN8I_B288_H_
+#define _DT_BINDINGS_RST_SUN8I_B288_H_
+
+#define RST_BUS_THS	0
+#define RST_BUS_NAND	1
+#define RST_BUS_MMC0	2
+#define RST_BUS_MMC1	3
+#define RST_BUS_MMC2	4
+#define RST_BUS_MMC3	5
+#define RST_BUS_SPI0	6
+#define RST_BUS_SPI1	7
+#define RST_BUS_SPI2	8
+#define RST_BUS_I2S0	9
+#define RST_BUS_I2S1	10
+#define RST_BUS_SPDIF	11
+#define RST_BUS_DSD	12
+#define RST_BUS_DMIC	13
+#define RST_USBPHY0	14
+#define RST_BUS_OHCI0	15
+#define RST_BUS_EHCI0	16
+#define RST_BUS_OTG	17
+#define RST_BUS_DE	18
+#define RST_BUS_EE	19
+#define RST_BUS_TCON0	20
+#define RST_BUS_CSI	21
+#define RST_BUS_ADDA	22
+#define RST_BUS_WLAN	23
+#define RST_MBUS	24
+#define RST_BUS_DRAM	25
+#define RST_BUS_PSRAM	26
+#define RST_BUS_DMA	27
+#define RST_BUS_UART0	28
+#define RST_BUS_UART1	29
+#define RST_BUS_UART2	30
+#define RST_BUS_UART3	31
+#define RST_BUS_UART4	32
+#define RST_BUS_UART5	33
+#define RST_BUS_I2C0	34
+#define RST_BUS_I2C1	35
+#define RST_BUS_I2C2	36
+#define RST_BUS_GPADC	37
+#define RST_BUS_KEYADC	38
+
+#endif
-- 
2.53.0


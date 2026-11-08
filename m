Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153497;
	b=O8LlN94MxYtaZMpL5HVViGoDY6wP+wcZ0NcyxWUMABJLTAUfL6W7wA9+r2WtSzojplI2
	 yucRx6nwX3BNCbaayLobOY3rKLE/O+sToIdYVCYjJo6rGRzVLCEKlZpthkZPg18UdBLmG
	 tBCU7rKaLmBJP4/JgqnAfx+2fUf+hBzbArfxiLbToVaZMgE6grs5AGt75LMDDVuS7BgrR
	 MeKei2z49xlI1afmpz3kyAs3xzapbXGQcyTl3F9h8KHFm6H6h7T/Yr29p7gCsi95AbqHX
	 Uz7YGVBXXC0tA2XYCEpzvay1Y6rDPDPARlc8f42ciyIan95zGTn7fhLM76cH+Jl+r0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i1WY2bokB2/Ue8Pd5z/j/FUW7ky8/bU+qddAvCVhc7E=;
	b=4wIDhIR+uWmVUf4H+xQq7qs2GKy1BWBmWL7rXqfoA6iHVbeSB4ZKfDb6AT3qvAUuQfHW
	 u8/+MYH2F7KqWilxWymIQp5OtbNM4t2F78J2aAi//08Agxwn9u5VkYo5U2QqDGOzQdSM2
	 Kf6BPe9DJsMhO7NFKngMNVal4HPM1lWELV+skdsQPC/+Iis1vLTf6gYXE1MZrCdFMOrb5
	 ighLOzh0se6BqpMfI0r3ceo9ly8d5s4LYmMZqrxIIDvF2652hOl4lp2/D1/3er4K+OESf
	 l5jQ+jbE8sR34uL6EX6VFs+Ka3OpaHslk4K8NPNEyB5nr5CMw0hzxMK1p2tI6TqC9DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CwoRs4oL;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A211606A336
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 15:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A211606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CwoRs4oL
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso73625f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 07:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153496; x=1794758296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1WY2bokB2/Ue8Pd5z/j/FUW7ky8/bU+qddAvCVhc7E=;
        b=CwoRs4oLWMe5R4pidBQdbIYJ2mj15XehI9uLwk+DUYoLnnUEeV1VIP+H895U0nRhwQ
         rZkjrpbjUXQhHzKYxTh13yMozmItutuQsP7AI1oVk+XCtHOo53hZKRtUQpfz/bod5zti
         +r6wk8+XAbamHXUbmKx15XtTBEZ0terS/3HphyDt1B/3kfpfEjB6YOWsObCO/kFcAs8N
         VfJK/UAmnPrrE6Clm/LCS9rFZnimb+vha/02OK7ImRrUlynJ4t3+6gLBS1NbNhH1wKHI
         dIY85GyZroCELHsEovcA4eR1dkO5Zy9sBVCrrzYiiSm+ig9fWGnfoqvQURrYp47KomiP
         dRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153496; x=1794758296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1WY2bokB2/Ue8Pd5z/j/FUW7ky8/bU+qddAvCVhc7E=;
        b=DotNrlFC46Rnb3IRy6Jz0sjc5AkbexLdXUcnyT8+rpePBMzKxgnMyfvCc1ryfCmrVa
         YwAPZcKyrZ77MYlm9PX/PLGYrGVU+F7rosmd9wfiDiAKFoe7W7dfLRIZzi6U2YvPmVIq
         mj2tSenkKG6PeWvXGTtkZrDenwiWe0VqoV14Mn/mQT75g2tZ3ojwlNfck/vkzJT3GQ7n
         qsi/Z1xVPCzGMrhWGwCFUheAfBdRCfJBmb9h8tdgxz9JnrTeLmvonltVzlk0zRS8IbWV
         ma24Q1y2HGzVV+S+y5gEjkQCTden3vHLdo3jSm76e+VL4waaqLOAASI3rrPZ3mOj4XcP
         /Arw==
X-Forwarded-Encrypted: i=1; AL+hErGEpdVgnK/9QVSeP2S/E18Z0IDCIxcvRrelHmc9RgGJogTTpyZx3C0PRfUCkbR1fguw3nWXLy5t6yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sCkrNGFG5PVfd+4DriyCNCpLNOgFX6bf9UZwdwRoi+yGAAXOC
	qGs6rop6nViVlLVdrhwOjrcJ/M2z1uqrsNfxiB+k+zeTLrV/PRB0n1fX
X-Gm-Gg: AYBFou1wXwhTmlrBpWR7HoX4VSDHAm/hP7GBnrIGLd1s+Y3kyNuCg2KnA/96uslGHiz
	OA4YU9UX3Sgviz8N/3bXWPZvHNjSuap0jIxSyVVGfSjfpxKaQbEXpk2SL+sM8iLUWeMOUD1WI09
	TB+OIrtfq7oRLfbB8f+IerXO1Ll5wXoMY/5DIIZyqKnz0aYxe9x8GgcxIqjyjzGDZ7t8LCxAYzq
	sCdp1jhiBk7szbpkOIX9bKqtHmQjcYL1iyuZE1tc1yoBjVQi9/EHun60C7YjAw61PR1isOo5mfi
	GGqmd3V2/Shlu0Em6Ozkz7uCp8lp6dJ2+tFMFdpNs6vYUgAjFNPZqZvvLW5XfdxxXin+kSBgSB+
	mQs39INCtbruRLwkGszCcZQibWO73WmDx8u2B8YPndP5YNGP9SPrmeMQ8tDIJG9lfP0KB8+6lRt
	ZDgDhoZXjJEtan7f7/D7A664r5SWa+3fbLAJ1h1lWY6y+qftja1jhVT3kyfOaVAsdB6S9sq9mMe
	0MrrV28vgkfpZUFCqbQfymEdyTUHH8G9Ejh/ZxxlAjzV0khTMZEgCWK5njb2nOHnlN5YArIYt64
	iH1sE4plDQr9qpBiTXz+5Hrg1QNU8xVdcYp4We1DNK5cx1cD2PBKQAUYj82JyI0=
X-Received: by 2002:adf:e199:0:b0:48e:84e8:88c3 with SMTP id ffacd0b85a97d-49580830930mr2975816f8f.5.1794153495753;
        Sun, 08 Nov 2026 07:58:15 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f316esm4753282f8f.17.2026.11.08.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:58:15 -0800 (PST)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
Date: Sun,  8 Nov 2026 15:56:59 +0000
Message-ID: <20261108155702.361022-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108155702.361022-1-pmazzini@gmail.com>
References: <20261108155702.361022-1-pmazzini@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.
Its CCU needs only the two oscillator inputs, so it fits the existing
schema without changes.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Moved unchanged from the B288 series v4.
---
 .../clock/allwinner,sun4i-a10-ccu.yaml        |  1 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    | 82 +++++++++++++++++++
 include/dt-bindings/reset/sun8i-b288-ccu.h    | 45 ++++++++++
 3 files changed, 128 insertions(+)
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
index 000000000000..c9b9eaf979ad
--- /dev/null
+++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
@@ -0,0 +1,82 @@
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
2.52.0


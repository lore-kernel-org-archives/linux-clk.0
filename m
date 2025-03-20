Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8A5229B0F
	for <linux-clk@vger.kernel.org>; Thu, 20 Mar 2025 19:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742499897; cv=none; b=WPNqvee0r3uhHqk/1XD9jvAiCwVBdOmuzXE4bvtylk5KLUdm1cFAgE6sDRosO005hv3v9IkCir0T3Fn2ArjyM9bkiESY2WYFKMG7LuRoCeDFBvQ5HdfD34L2/4aT/xDUJC4yudDveTaeoHSjs+hICBx+dPc4L9uRWpHib3d5HLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742499897; c=relaxed/simple;
	bh=geLdGDfDppztif7o0rQLveIfzRTCzSWPOzmxcCRsJxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1150XG3Cf7JQ8gdV5wze1J2Y/K1hcIAb5KcsWtg95ZyJwqkBxHo7+pCKGrq7en10xYd10Uu+XKnuhMiIcLVsCNt2fzZjUViPlUmZzVkyIr11hqj9UmxDkzJJ8UebFcwpjYyaYrs45qrb0uggWXu53tuHzZz+kH9X1OiEnVnjRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=nBvKIsma; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="nBvKIsma"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-854a682d2b6so79588439f.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Mar 2025 12:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742499895; x=1743104695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbvEkFGBoxFLcT+B9yfnDSBEgyYVKDqcuGRDBtDVFkg=;
        b=nBvKIsmanmUZVG5pq2lu3UeBtwPnzwpyhm54ifAq0dvdkUqTw5rKkir3ev9+hjOYwk
         H2R33pReXUmJCQiimK29FBb5S81fTReHI799PSYEJjDSeFhosS7IpUNsHZaoDFNBhjWY
         W/KyyFOuCCQCypHxeDj6OwkEo3pgJ3RICF/HAFRzqS0W4E0xEQAKw5NY4b3ckMjqiSoF
         VYKC7YmjEHsVe/HOklLnI2m6r8w/ip1wTCEzfsBWVblKcB4RY1Ca7tUud8571PyLuTC9
         1cL7jXsHp+xwwhwVGwwLu2Ygtk8n1ZtRnPk3+CwZ6egEKnKLNwHJI0eBTq2ZmIRfNWBd
         RruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499895; x=1743104695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbvEkFGBoxFLcT+B9yfnDSBEgyYVKDqcuGRDBtDVFkg=;
        b=JDwu/neMy/jn9NqDQDxcuQNfoE+XDU0Yz1pYYhlLfII1TB9GBD7MEjE0vdbL2q/gIv
         BvSFSpK/MrO1V2X9LS7SzKKShjqdm7ZUC0a8HvP8+UtXJQRKPc6zzb4u99NOuTGji3iI
         8Ib+GsiSnUtzXTls9dNS0UBRlIf8bPvCmOBPXuNVbp7PU4+kphPSg3oxvdeF/npqKCkv
         /GGgx/FHcd2Sl45mgztpK9bs4THNAC2iHW2qXzUh8kaWKXciJgmtlEqFeIbCqVQWWz15
         HuBcAoYUq4ohQx6SvUZm2cb6dgKelEsDnw6Bdy5fa8J01ozuVL6ViRhIjAF4KjooPgm0
         o47A==
X-Forwarded-Encrypted: i=1; AJvYcCW+fBv6ofSwTpycGnGw/kS7UWIVS7IzHSsrgU4A3VXZ9TxqqjKNXrXYJYqg7DLSFQZLQga+IOBP7v0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEdJXAHeR0/va0czVHC4vbjlyeJsBrT3ByytERbvtLD0Otxu9/
	baIdsx8u0iu1rTa6FukEOCzOzrK9mG6SfIItU2ahDU38pFzrkRHO4okJb+JU+Q0=
X-Gm-Gg: ASbGnctigRf5KH3nr7YqIqtD29WHPfBEVaIIujEF2IMH7RsqcLpHSZIH9L16jsG1nBB
	2HJoKOhSpxuiEzPohFBg8Us4ZRykta91qkH0phmVohFFS3UvSaNVkPLsjhI07rqwhcalOfKV6fV
	UYnn+jLlgFvUpv05Yql7dQA8eKXYzOemVzXdPiwGYwUd1hiwAUJa7uDPWBG5G2qEPyGM7RRJzjD
	O79+wajAaSB2lCEFG+NYKmzNJBTx2/G6FEPJOBSV4tUpAs9gGHD2Plo+O5NQbMtlUqJeaIM3gH8
	4lKQxOy8hs9H4t5ahkMm4qYwMKKlZA3IKgrisLFvdVaQP3zRW+DjCUT02oGy3d746IDHk/YQlZ1
	TQe+2GRPIbe+RL5TfzO6p/PI2
X-Google-Smtp-Source: AGHT+IGXXzCTsTYwrGMy/HMGyjbx5SoB+leLTzRU46Xkm9tGDSuRbtdCaZzESNwVAKlnXLoxpwPdHw==
X-Received: by 2002:a05:6602:36c4:b0:85b:5494:5519 with SMTP id ca18e2360f4ac-85e2ca6fff3mr65491239f.5.1742499895269;
        Thu, 20 Mar 2025 12:44:55 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bd8c40fsm8341439f.32.2025.03.20.12.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 12:44:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
Date: Thu, 20 Mar 2025 14:44:42 -0500
Message-ID: <20250320194449.510569-2-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320194449.510569-1-elder@riscstar.com>
References: <20250320194449.510569-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are additional SpacemiT syscon CCUs whose registers control both
clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
previously, these will initially support only resets.  They do not
incorporate power domain functionality.

Define the index values for resets associated with all SpacemiT K1
syscon nodes, including those with clocks already defined, as well as
the new ones (without clocks).

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
 include/dt-bindings/clock/spacemit,k1-ccu.h   | 134 ++++++++++++++++++
 2 files changed, 143 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index 07a6728e6f864..333c28e075b6c 100644
--- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
@@ -19,6 +19,9 @@ properties:
       - spacemit,k1-syscon-apbc
       - spacemit,k1-syscon-apmu
       - spacemit,k1-syscon-mpmu
+      - spacemit,k1-syscon-rcpu
+      - spacemit,k1-syscon-rcpu2
+      - spacemit,k1-syscon-apbc2
 
   reg:
     maxItems: 1
@@ -57,13 +60,15 @@ allOf:
       properties:
         compatible:
           contains:
-            const: spacemit,k1-syscon-apbc
+            enum:
+              - spacemit,k1-syscon-apmu
+              - spacemit,k1-syscon-mpmu
     then:
-      properties:
-        "#power-domain-cells": false
-    else:
       required:
         - "#power-domain-cells"
+    else:
+      properties:
+        "#power-domain-cells": false
 
 additionalProperties: false
 
diff --git a/include/dt-bindings/clock/spacemit,k1-ccu.h b/include/dt-bindings/clock/spacemit,k1-ccu.h
index 4a0c7163257e3..a1e1b1fe714ce 100644
--- a/include/dt-bindings/clock/spacemit,k1-ccu.h
+++ b/include/dt-bindings/clock/spacemit,k1-ccu.h
@@ -78,6 +78,9 @@
 #define CLK_APB			31
 #define CLK_WDT_BUS		32
 
+/*	MPMU resets	*/
+#define RST_WDT			0
+
 /*	APBC clocks	*/
 #define CLK_UART0		0
 #define CLK_UART2		1
@@ -109,6 +112,7 @@
 #define CLK_PWM17		27
 #define CLK_PWM18		28
 #define CLK_PWM19		29
+
 #define CLK_SSP3		30
 #define CLK_RTC			31
 #define CLK_TWSI0		32
@@ -180,6 +184,60 @@
 #define CLK_TSEN_BUS		98
 #define CLK_IPC_AP2AUD_BUS	99
 
+/*	APBC resets	*/
+
+#define RST_UART0		0
+#define RST_UART2		1
+#define RST_UART3		2
+#define RST_UART4		3
+#define RST_UART5		4
+#define RST_UART6		5
+#define RST_UART7		6
+#define RST_UART8		7
+#define RST_UART9		8
+#define RST_GPIO		9
+#define RST_PWM0		10
+#define RST_PWM1		11
+#define RST_PWM2		12
+#define RST_PWM3		13
+#define RST_PWM4		14
+#define RST_PWM5		15
+#define RST_PWM6		16
+#define RST_PWM7		17
+#define RST_PWM8		18
+#define RST_PWM9		19
+#define RST_PWM10		20
+#define RST_PWM11		21
+#define RST_PWM12		22
+#define RST_PWM13		23
+#define RST_PWM14		24
+#define RST_PWM15		25
+#define RST_PWM16		26
+#define RST_PWM17		27
+#define RST_PWM18		28
+#define RST_PWM19		29
+#define RST_SSP3		30
+#define RST_RTC			31
+#define RST_TWSI0		32
+#define RST_TWSI1		33
+#define RST_TWSI2		34
+#define RST_TWSI4		35
+#define RST_TWSI5		36
+#define RST_TWSI6		37
+#define RST_TWSI7		38
+#define RST_TWSI8		39
+#define RST_TIMERS1		40
+#define RST_TIMERS2		41
+#define RST_AIB			42
+#define RST_ONEWIRE		43
+#define RST_SSPA0		44
+#define RST_SSPA1		45
+#define RST_DRO			46
+#define RST_IR			47
+#define RST_TSEN		48
+#define RST_IPC_AP2AUD		49
+#define RST_CAN0		50
+
 /*	APMU clocks	*/
 #define CLK_CCI550		0
 #define CLK_CPU_C0_HI		1
@@ -244,4 +302,80 @@
 #define CLK_V2D			60
 #define CLK_EMMC_BUS		61
 
+/*	APMU resets	*/
+
+#define RST_CCIC_4X		0
+#define RST_CCIC1_PHY		1
+#define RST_SDH_AXI		2
+#define RST_SDH0		3
+#define RST_SDH1		4
+#define RST_SDH2		5
+#define RST_USBP1_AXI		6
+#define RST_USB_AXI		7
+#define RST_USB3_0		8
+#define RST_QSPI		9
+#define RST_QSPI_BUS		10
+#define RST_DMA			11
+#define RST_AES			12
+#define RST_VPU			13
+#define RST_GPU			14
+#define RST_EMMC		15
+#define RST_EMMC_X		16
+#define RST_AUDIO		17
+#define RST_HDMI		18
+#define RST_PCIE0		19
+#define RST_PCIE1		20
+#define RST_PCIE2		21
+#define RST_EMAC0		22
+#define RST_EMAC1		23
+#define RST_JPG			24
+#define RST_CCIC2PHY		25
+#define RST_CCIC3PHY		26
+#define RST_CSI			27
+#define RST_ISP_CPP		28
+#define RST_ISP_BUS		29
+#define RST_ISP			30
+#define RST_ISP_CI		31
+#define RST_DPU_MCLK		32
+#define RST_DPU_ESC		33
+#define RST_DPU_HCLK		34
+#define RST_DPU_SPIBUS		35
+#define RST_DPU_SPI_HBUS	36
+#define RST_V2D			37
+#define RST_MIPI		38
+#define RST_MC			39
+
+/*	RCPU resets	*/
+
+#define RST_RCPU_SSP0		0
+#define RST_RCPU_I2C0		1
+#define RST_RCPU_UART1		2
+#define RST_RCPU_IR		3
+#define RST_RCPU_CAN		4
+#define RST_RCPU_UART0		5
+#define RST_RCPU_HDMI_AUDIO	6
+
+/*	RCPU2 resets	*/
+
+#define RST_RCPU2_PWM0		0
+#define RST_RCPU2_PWM1		1
+#define RST_RCPU2_PWM2		2
+#define RST_RCPU2_PWM3		3
+#define RST_RCPU2_PWM4		4
+#define RST_RCPU2_PWM5		5
+#define RST_RCPU2_PWM6		6
+#define RST_RCPU2_PWM7		7
+#define RST_RCPU2_PWM8		8
+#define RST_RCPU2_PWM9		9
+
+/*	APBC2 resets	*/
+
+#define RST_APBC2_UART1		0
+#define RST_APBC2_SSP2		1
+#define RST_APBC2_TWSI3		2
+#define RST_APBC2_RTC		3
+#define RST_APBC2_TIMERS0	4
+#define RST_APBC2_KPC		5
+#define RST_APBC2_GPIO		6
+
 #endif /* _DT_BINDINGS_SPACEMIT_CCU_H_ */
-- 
2.43.0


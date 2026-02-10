Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65CC2D8DAF
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 02:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770690413; cv=none; b=kIpze9UEarqMBpRw/naOfKNg/0z1fh5eOj/oaVnbCcZaQp01Q1Doi4mxQstQF+srwK9ff9anOXo5t5qA4y6zqltiawXL8995fShhUPZiulNeNNYkiqc6y1d4VKbXdMr3+de0yTdRX1kCtLEOX3HeT9swi6oZXxkdbm2k+HO/Nr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770690413; c=relaxed/simple;
	bh=BTqAKC0i24IBiMoIcV7oMgsKbpIo3FeA7GOLul0Jkb4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=krinmpSLQbfjNgvvc8pQgJz+rFlT3TQh8RkEzFtrAP2vGGHm9bWZluX0jy6y4PzyE5AKgPMaJ1hLb307PJU3ncMQ7dWauaslWuyoUb+II6iXYjESW/GvOfQGUpGl+mJgWJURCBaxh9jZR+0Cfc8s1exzq/OT+q2UIhAVZJ4MWEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULLVu6Xs; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULLVu6Xs"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7950881727cso2044667b3.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Feb 2026 18:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770690410; x=1771295210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi7Nb4WPQaDqjjpzXE32MrRshp2IR4Mc/boqukgvkXs=;
        b=ULLVu6XsUmKxvsb+NeiCJii1y0A4dCxH0cXeJJHwDXHuOhwoD8+8ZWg1UPw9FmAPiO
         RhMarGrBBy80A2pzzzlMoimbRPg504YMRhsddlJB9Ukjkv8Uv07xsBMJv/jP4N/4iNPU
         HKBFRVIozHjllzCLYqd6UKO5uCEnQ7h+hpRToYD+ff7/GlwjHPNWRlhtzQ1DOG+foZ0l
         pkyWFyFaIzJRFsX7ziTeLQnjJavLTJ00Kl3rh0dNAXj3ixvcLCktCqIMepHSkTG062MM
         +wdO5gwW2dtwGwVewnzrVvisIZFd0rUr8aO4scViM3UkNQ/GMI7CNhTrxZMUGKSVqZKY
         22Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770690410; x=1771295210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi7Nb4WPQaDqjjpzXE32MrRshp2IR4Mc/boqukgvkXs=;
        b=ObouET4N2hlhnZW+0doDraIJnxns5zj6OHRZsh2GLSWBMHfe7Mfe5cFFqWqsIqG0or
         h1nMszcKfZ7X4jAbvOfOAsjOusbYBmsSioxMmmPnz6aC7AAzpjXKREkRABTC3VOR7Mv9
         ivBO/XyQhwOyPoPl+88FV7BgZJMmVldsLWk3LgZ2MvBOV3IqBcwbTPfmrMlGYyNLAWge
         RJkWp4ehyr1Ehr7gqCMxBhIfUUcCwesyAMKclN9eGhBvJZXGopGHC7GoOQdncqnnR4he
         amYJW+vXzsv/1rXapWFj7rqoa6ymdGQaZEMNBTsVLpejSW3xeNc9Wr9joC1ViEiJskOd
         U4eA==
X-Forwarded-Encrypted: i=1; AJvYcCWzCejf9hjfnZo4Rkjhp6ucfSg4C9sZ4z/v7dASKYlNV+vvQNMHRHZMbr4i23gkf/nae4ZUHfrjd7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdRfR9uIRlEEkxGZ6E5uYxwCLIZQtMgzIFn/FHJbCiPFjtJORy
	20Rq0ONAwv9Cx2oOwTPVmJdtGag1kDHiXmMmphY8Nb2xSOP4hnJVRMKd
X-Gm-Gg: AZuq6aJQLt/4PbCcafMKhpnilHYekgtqfc8qXatQBIQAnSETwUa03vkZRriTYbwaXb+
	fgyKNvr8vQgBYDBcS/FoqMbk1dw2I07pRCFlwD8rLdlbGznOAJ6IXCIIVYio3mDOplZMiPPIWyh
	WOrVM64mrV9ivq206W3gYjxJYtC+t/xkEbazDT5T0WXECFBaHeH0JbOUvyrzHMVQH3jd+PeN3W6
	TC5nqUy2YmaKRekGCcZca47bs7Fcc3r/FffdjMeMqdm4I3KjkMbwEEBQcLMMYs53DyjFc4OlSJ6
	IVlY5D7NRLKCiaorDl3V2en7AoooEqz7diHPcmqK6qhvGysPRKGJGOu6wY6mKJYOR+Rnk/5PJeH
	5ROkNt22yEVSMWSVoZ3hNKL+iRB68ZRoH2UDeSUfgjgplKnWrJ5myfZIgiPYMF+jjLEY0G8JI8B
	LXo/fsF6EgSt1gJWr2xTL9EBpuBiX29jkReIJi
X-Received: by 2002:a05:690c:88:b0:794:e08a:9196 with SMTP id 00721157ae682-7952ab249bbmr268145477b3.34.1770690409802;
        Mon, 09 Feb 2026 18:26:49 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f6a0:d6e1:b522:395a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79529e45621sm109858257b3.0.2026.02.09.18.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:26:49 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: sboyd@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-clk@vger.kernel.org,
	jonas@kwiboo.se,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: clock: rockchip: Add RV1103B CRU support
Date: Mon,  9 Feb 2026 23:26:19 -0300
Message-Id: <20260210022620.172570-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

Add support for the Rockchip RV1103B Clock and Reset Unit (CRU).

The RV1103B CRU is compatible with the existing RV1126B binding.
Add the compatible string to the schema and introduce the
corresponding clock ID definitions.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v2:
- None. Only added Krzysztof's RB tag.

 .../bindings/clock/rockchip,rv1126b-cru.yaml  |   1 +
 .../dt-bindings/clock/rockchip,rv1103b-cru.h  | 220 ++++++++++++++++++
 2 files changed, 221 insertions(+)
 create mode 100644 include/dt-bindings/clock/rockchip,rv1103b-cru.h

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml
index 04b0a5c51e4e..b6d3a04be8f1 100644
--- a/Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml
+++ b/Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
+      - rockchip,rv1103b-cru
       - rockchip,rv1126b-cru
 
   reg:
diff --git a/include/dt-bindings/clock/rockchip,rv1103b-cru.h b/include/dt-bindings/clock/rockchip,rv1103b-cru.h
new file mode 100644
index 000000000000..35afdee7e961
--- /dev/null
+++ b/include/dt-bindings/clock/rockchip,rv1103b-cru.h
@@ -0,0 +1,220 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Rockchip Electronics Co. Ltd.
+ * Author: Elaine Zhang <zhangqing@rock-chips.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RV1103B_H
+#define _DT_BINDINGS_CLK_ROCKCHIP_RV1103B_H
+
+#define PLL_GPLL		0
+#define ARMCLK			1
+#define PLL_DPLL		2
+#define XIN_OSC0_HALF		3
+#define CLK_GPLL_DIV24		4
+#define CLK_GPLL_DIV12		5
+#define CLK_GPLL_DIV6		6
+#define CLK_GPLL_DIV4		7
+#define CLK_GPLL_DIV3		8
+#define CLK_GPLL_DIV2P5		9
+#define CLK_GPLL_DIV2		10
+#define CLK_UART0_SRC		11
+#define CLK_UART1_SRC		12
+#define CLK_UART2_SRC		13
+#define CLK_UART0_FRAC		14
+#define CLK_UART1_FRAC		15
+#define CLK_UART2_FRAC		16
+#define CLK_SAI_SRC		17
+#define CLK_SAI_FRAC		18
+#define LSCLK_NPU_SRC		19
+#define CLK_NPU_SRC		20
+#define ACLK_VEPU_SRC		21
+#define CLK_VEPU_SRC		22
+#define ACLK_VI_SRC		23
+#define CLK_ISP_SRC		24
+#define DCLK_VICAP		25
+#define CCLK_EMMC		26
+#define CCLK_SDMMC0		27
+#define SCLK_SFC_2X		28
+#define LSCLK_PERI_SRC		29
+#define ACLK_PERI_SRC		30
+#define HCLK_HPMCU		31
+#define SCLK_UART0		32
+#define SCLK_UART1		33
+#define SCLK_UART2		34
+#define CLK_I2C_PMU		35
+#define CLK_I2C_PERI		36
+#define CLK_SPI0		37
+#define CLK_PWM0_SRC		38
+#define CLK_PWM1		39
+#define CLK_PWM2		40
+#define DCLK_DECOM_SRC		41
+#define CCLK_SDMMC1		42
+#define CLK_CORE_CRYPTO		43
+#define CLK_PKA_CRYPTO		44
+#define CLK_CORE_RGA		45
+#define MCLK_SAI_SRC		46
+#define CLK_FREQ_PWM0_SRC	47
+#define CLK_COUNTER_PWM0_SRC	48
+#define PCLK_TOP_ROOT		49
+#define CLK_REF_MIPI0		50
+#define CLK_MIPI0_OUT2IO	51
+#define CLK_REF_MIPI1		52
+#define CLK_MIPI1_OUT2IO	53
+#define MCLK_SAI_OUT2IO		54
+#define ACLK_NPU_ROOT		55
+#define HCLK_RKNN		56
+#define ACLK_RKNN		57
+#define LSCLK_VEPU_ROOT		58
+#define HCLK_VEPU		59
+#define ACLK_VEPU		60
+#define CLK_CORE_VEPU		61
+#define PCLK_IOC_VCCIO3		62
+#define PCLK_ACODEC		63
+#define PCLK_USBPHY		64
+#define LSCLK_VI_100M		65
+#define LSCLK_VI_ROOT		66
+#define HCLK_ISP		67
+#define ACLK_ISP		68
+#define CLK_CORE_ISP		69
+#define ACLK_VICAP		70
+#define HCLK_VICAP		71
+#define ISP0CLK_VICAP		72
+#define PCLK_CSI2HOST0		73
+#define PCLK_CSI2HOST1		74
+#define HCLK_EMMC		75
+#define HCLK_SFC		76
+#define HCLK_SFC_XIP		77
+#define HCLK_SDMMC0		78
+#define PCLK_CSIPHY		79
+#define PCLK_GPIO1		80
+#define DBCLK_GPIO1		81
+#define PCLK_IOC_VCCIO47	82
+#define LSCLK_DDR_ROOT		83
+#define CLK_TIMER_DDRMON	84
+#define LSCLK_PMU_ROOT		85
+#define PCLK_PMU		86
+#define XIN_RC_DIV		87
+#define CLK_32K			88
+#define PCLK_PMU_GPIO0		89
+#define DBCLK_PMU_GPIO0		90
+#define CLK_DDR_FAIL_SAFE	91
+#define PCLK_PMU_HP_TIMER	92
+#define CLK_PMU_32K_HP_TIMER	93
+#define PCLK_PWM0		94
+#define CLK_PWM0		95
+#define CLK_OSC_PWM0		96
+#define CLK_RC_PWM0		97
+#define CLK_FREQ_PWM0		98
+#define CLK_COUNTER_PWM0	99
+#define PCLK_I2C0		100
+#define CLK_I2C0		101
+#define PCLK_UART0		102
+#define PCLK_IOC_PMUIO0		103
+#define CLK_REFOUT		104
+#define CLK_PREROLL		105
+#define CLK_PREROLL_32K		106
+#define CLK_LPMCU_PMU		107
+#define PCLK_SPI2AHB		108
+#define HCLK_SPI2AHB		109
+#define SCLK_SPI2AHB		110
+#define PCLK_WDT_LPMCU		111
+#define TCLK_WDT_LPMCU		112
+#define HCLK_SFC_PMU1		113
+#define HCLK_SFC_XIP_PMU1	114
+#define SCLK_SFC_2X_PMU1	115
+#define CLK_LPMCU		116
+#define CLK_LPMCU_RTC		117
+#define PCLK_LPMCU_MAILBOX	118
+#define PCLK_IOC_PMUIO1		119
+#define PCLK_CRU_PMU1		120
+#define PCLK_PERI_ROOT		121
+#define PCLK_RTC_ROOT		122
+#define CLK_TIMER_ROOT		123
+#define PCLK_TIMER		124
+#define CLK_TIMER0		125
+#define CLK_TIMER1		126
+#define CLK_TIMER2		127
+#define CLK_TIMER3		128
+#define CLK_TIMER4		129
+#define CLK_TIMER5		130
+#define PCLK_STIMER		131
+#define CLK_STIMER0		132
+#define CLK_STIMER1		133
+#define PCLK_WDT_NS		134
+#define TCLK_WDT_NS		135
+#define PCLK_WDT_S		136
+#define TCLK_WDT_S		137
+#define PCLK_WDT_HPMCU		138
+#define TCLK_WDT_HPMCU		139
+#define PCLK_I2C1		140
+#define CLK_I2C1		141
+#define PCLK_I2C2		142
+#define CLK_I2C2		143
+#define PCLK_I2C3		144
+#define CLK_I2C3		145
+#define PCLK_I2C4		146
+#define CLK_I2C4		147
+#define PCLK_SPI0		148
+#define PCLK_PWM1		149
+#define CLK_OSC_PWM1		150
+#define PCLK_PWM2		151
+#define CLK_OSC_PWM2		152
+#define PCLK_UART2		153
+#define PCLK_UART1		154
+#define ACLK_RKDMA		155
+#define PCLK_TSADC		156
+#define CLK_TSADC		157
+#define CLK_TSADC_TSEN		158
+#define PCLK_SARADC		159
+#define CLK_SARADC		160
+#define PCLK_GPIO2		161
+#define DBCLK_GPIO2		162
+#define PCLK_IOC_VCCIO6		163
+#define ACLK_USBOTG		164
+#define CLK_REF_USBOTG		165
+#define HCLK_SDMMC1		166
+#define HCLK_SAI		167
+#define MCLK_SAI		168
+#define ACLK_CRYPTO		169
+#define HCLK_CRYPTO		170
+#define HCLK_RK_RNG_NS		171
+#define HCLK_RK_RNG_S		172
+#define PCLK_OTPC_NS		173
+#define CLK_OTPC_ROOT_NS	174
+#define CLK_SBPI_OTPC_NS	175
+#define CLK_USER_OTPC_NS	176
+#define PCLK_OTPC_S		177
+#define CLK_OTPC_ROOT_S		178
+#define CLK_SBPI_OTPC_S		179
+#define CLK_USER_OTPC_S		180
+#define CLK_OTPC_ARB		181
+#define PCLK_OTP_MASK		182
+#define HCLK_RGA		183
+#define ACLK_RGA		184
+#define ACLK_MAC		185
+#define PCLK_MAC		186
+#define CLK_MACPHY		187
+#define ACLK_SPINLOCK		188
+#define HCLK_CACHE		189
+#define PCLK_HPMCU_MAILBOX	190
+#define PCLK_HPMCU_INTMUX	191
+#define CLK_HPMCU		192
+#define CLK_HPMCU_RTC		193
+#define DCLK_DECOM		194
+#define ACLK_DECOM		195
+#define PCLK_DECOM		196
+#define ACLK_SYS_SRAM		197
+#define PCLK_DMA2DDR		198
+#define ACLK_DMA2DDR		199
+#define PCLK_DCF		200
+#define ACLK_DCF		201
+#define MCLK_ACODEC_TX		202
+#define SCLK_UART0_SRC		203
+#define SCLK_UART1_SRC		204
+#define SCLK_UART2_SRC		205
+#define XIN_RC_SRC		206
+#define CLK_UTMI_USBOTG		207
+#define CLK_REF_USBPHY		208
+
+#endif // _DT_BINDINGS_CLK_ROCKCHIP_RV1103B_H
-- 
2.34.1


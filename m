Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCC828727F;
	Fri, 26 Dec 2025 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766746998; cv=none; b=hwKmXG7PYSvLJaUofGQ3VaNZE6tKVXMZ7NQOZhHt7zDwtJOQLh1afjPPwJ9AQnSUboQKihxPcm5PkfIEWDwx0xV54lHe6DD3JHeoZhUd9UxQrxg/NEEGx8GkRKKgLN2UdXYWGDWvOTo7YnE5zN5m0/XUOdWiae7IPAUS6kPfUuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766746998; c=relaxed/simple;
	bh=O6Zz/gCh5aLQjY2QpyllpfRUA3rcDndSQARSjY1opps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddOMKeZtdXxIiWIFJWgEoOHtXPkPic4CqPoyZ2UvVSy8qxd2Ndc+IVwGhnbd3kaetkgrro0ROV4GwaASWAUnFtzUp2UXDNNC9uJ3/xi+4WgEYrvP5WrktZggXtFDze//zuXlbE1u96Cn9IQdRxXEpTU5MCeh5VnbKazFjsGGpU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 26407341F64;
	Fri, 26 Dec 2025 11:02:48 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 26 Dec 2025 19:01:19 +0800
Subject: [PATCH v3 4/5] clk: spacemit: k3: extract common header
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-k3-clk-v3-4-602ce93bb6c3@gentoo.org>
References: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
In-Reply-To: <20251226-k3-clk-v3-0-602ce93bb6c3@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Haylen Chu <heylenay@4d2.org>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9850; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=O6Zz/gCh5aLQjY2QpyllpfRUA3rcDndSQARSjY1opps=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpTmsmcVuRj0+8YWtjBcsEGq5stBYnP0TNYZ7oK
 HI6LkqO55KJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaU5rJhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1R7RAAg+7lMwHLrnvrtsOvmaZg0bFp0VQRPHiXLwa8sTMgk0sYsHHrnOzsB
 rCCIn9pnqvig84oNdTLFCV0aVldRizQIefthndFITm4t/B3c+PnW6LpctBP6DqanTXw4D1fGu4i
 bNXHyeIdQYAqZ2vU8biZ+30Y6ozguVDRjLEudYk96ZcqACVD7UMT2LJazJcqrdzCLDOjZS5busS
 GfkFBHYuW1PMaS91JM358JRYdfrI+sUx72wtBC4nSNp4t/f9kccL908vsarAwhoHLVZq43deinN
 3+GZAeb3v5lvNAM3p7To18+fBWuIWJ/i0hmUZZseZiwsiiKjiGuvOUfELSLa8Q8IPLUmoRgY3nd
 plRrhX6rUJC1Y7a4NdExBfGE1izWFkJz3/7DGixSxkmebzC+b1t/6ZQ3e+lyIah02cWdl17qjLB
 J6Oa30/IKT7SoN2ZiqO1Lwm0fbkx6wVy1W5hbUULAGMdAyQAghdC+7RQe0Kde5j1refzzCjXTvb
 qCpvXRlZzzISXnzrl8h7zrabtp04CMiEN4P5IWr13U70zm3jB0CpxFM5W17cS3aOUMh1sr78lkJ
 GYyNvcM/SsaIuJqjs1F3MXKDmIy1D8uY/5T4HJeiL70SPxiL6AONxd3yX0V+BfJ6HE8zTc0R0Ko
 b8HzMwVPwK8ltSaTI4c5TrVatUHN1k=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Extracting common header file, which will be shared by clock and reset
drivers. So will make it easy to add reset driver for K3 SoC later.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 include/soc/spacemit/k3-syscon.h | 276 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 276 insertions(+)

diff --git a/include/soc/spacemit/k3-syscon.h b/include/soc/spacemit/k3-syscon.h
new file mode 100644
index 000000000000..e244329dadaf
--- /dev/null
+++ b/include/soc/spacemit/k3-syscon.h
@@ -0,0 +1,276 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* SpacemiT clock and reset driver definitions for the K3 SoC */
+
+#ifndef __SOC_K3_SYSCON_H__
+#define __SOC_K3_SYSCON_H__
+
+#include "ccu.h"
+
+/* Reset name macro, should match in clock and reset */
+#define _K_RST(_unit)			"k3-" #_unit "-reset"
+
+/* APBS register offset */
+#define APBS_PLL1_SWCR1			0x100
+#define APBS_PLL1_SWCR2			0x104
+#define APBS_PLL1_SWCR3			0x108
+#define APBS_PLL2_SWCR1			0x118
+#define APBS_PLL2_SWCR2			0x11c
+#define APBS_PLL2_SWCR3			0x120
+#define APBS_PLL3_SWCR1			0x124
+#define APBS_PLL3_SWCR2			0x128
+#define APBS_PLL3_SWCR3			0x12c
+#define APBS_PLL4_SWCR1			0x130
+#define APBS_PLL4_SWCR2			0x134
+#define APBS_PLL4_SWCR3			0x138
+#define APBS_PLL5_SWCR1			0x13c
+#define APBS_PLL5_SWCR2			0x140
+#define APBS_PLL5_SWCR3			0x144
+#define APBS_PLL6_SWCR1			0x148
+#define APBS_PLL6_SWCR2			0x14c
+#define APBS_PLL6_SWCR3			0x150
+#define APBS_PLL7_SWCR1			0x158
+#define APBS_PLL7_SWCR2			0x15c
+#define APBS_PLL7_SWCR3			0x160
+#define APBS_PLL8_SWCR1			0x180
+#define APBS_PLL8_SWCR2			0x184
+#define APBS_PLL8_SWCR3			0x188
+
+/* MPMU register offset */
+#define MPMU_FCCR			0x0008
+#define MPMU_POSR			0x0010
+#define POSR_PLL1_LOCK			BIT(24)
+#define POSR_PLL2_LOCK			BIT(25)
+#define POSR_PLL3_LOCK			BIT(26)
+#define POSR_PLL4_LOCK			BIT(27)
+#define POSR_PLL5_LOCK			BIT(28)
+#define POSR_PLL6_LOCK			BIT(29)
+#define POSR_PLL7_LOCK			BIT(30)
+#define POSR_PLL8_LOCK			BIT(31)
+#define MPMU_SUCCR			0x0014
+#define MPMU_ISCCR			0x0044
+#define MPMU_WDTPCR			0x0200
+#define MPMU_RIPCCR			0x0210
+#define MPMU_ACGR			0x1024
+#define MPMU_APBCSCR			0x1050
+#define MPMU_SUCCR_1			0x10b0
+
+#define MPMU_I2S0_SYSCLK		0x1100
+#define MPMU_I2S2_SYSCLK		0x1104
+#define MPMU_I2S3_SYSCLK		0x1108
+#define MPMU_I2S4_SYSCLK		0x110c
+#define MPMU_I2S5_SYSCLK		0x1110
+#define MPMU_I2S_SYSCLK_CTRL		0x1114
+
+/* APBC register offset */
+#define APBC_UART0_CLK_RST		0x00
+#define APBC_UART2_CLK_RST		0x04
+#define APBC_GPIO_CLK_RST		0x08
+#define APBC_PWM0_CLK_RST		0x0c
+#define APBC_PWM1_CLK_RST		0x10
+#define APBC_PWM2_CLK_RST		0x14
+#define APBC_PWM3_CLK_RST		0x18
+#define APBC_TWSI8_CLK_RST		0x20
+#define APBC_UART3_CLK_RST		0x24
+#define APBC_RTC_CLK_RST		0x28
+#define APBC_TWSI0_CLK_RST		0x2c
+#define APBC_TWSI1_CLK_RST		0x30
+#define APBC_TIMERS0_CLK_RST		0x34
+#define APBC_TWSI2_CLK_RST		0x38
+#define APBC_AIB_CLK_RST		0x3c
+#define APBC_TWSI4_CLK_RST		0x40
+#define APBC_TIMERS1_CLK_RST		0x44
+#define APBC_ONEWIRE_CLK_RST		0x48
+#define APBC_TWSI5_CLK_RST		0x4c
+#define APBC_DRO_CLK_RST		0x58
+#define APBC_IR0_CLK_RST		0x5c
+#define APBC_IR1_CLK_RST		0x1c
+#define APBC_TWSI6_CLK_RST		0x60
+#define APBC_COUNTER_CLK_SEL		0x64
+#define APBC_TSEN_CLK_RST		0x6c
+#define APBC_UART4_CLK_RST		0x70
+#define APBC_UART5_CLK_RST		0x74
+#define APBC_UART6_CLK_RST		0x78
+#define APBC_SSP3_CLK_RST		0x7c
+#define APBC_SSPA0_CLK_RST		0x80
+#define APBC_SSPA1_CLK_RST		0x84
+#define APBC_SSPA2_CLK_RST		0x88
+#define APBC_SSPA3_CLK_RST		0x8c
+#define APBC_IPC_AP2AUD_CLK_RST		0x90
+#define APBC_UART7_CLK_RST		0x94
+#define APBC_UART8_CLK_RST		0x98
+#define APBC_UART9_CLK_RST		0x9c
+#define APBC_CAN0_CLK_RST		0xa0
+#define APBC_CAN1_CLK_RST		0xa4
+#define APBC_PWM4_CLK_RST		0xa8
+#define APBC_PWM5_CLK_RST		0xac
+#define APBC_PWM6_CLK_RST		0xb0
+#define APBC_PWM7_CLK_RST		0xb4
+#define APBC_PWM8_CLK_RST		0xb8
+#define APBC_PWM9_CLK_RST		0xbc
+#define APBC_PWM10_CLK_RST		0xc0
+#define APBC_PWM11_CLK_RST		0xc4
+#define APBC_PWM12_CLK_RST		0xc8
+#define APBC_PWM13_CLK_RST		0xcc
+#define APBC_PWM14_CLK_RST		0xd0
+#define APBC_PWM15_CLK_RST		0xd4
+#define APBC_PWM16_CLK_RST		0xd8
+#define APBC_PWM17_CLK_RST		0xdc
+#define APBC_PWM18_CLK_RST		0xe0
+#define APBC_PWM19_CLK_RST		0xe4
+#define APBC_TIMERS2_CLK_RST		0x11c
+#define APBC_TIMERS3_CLK_RST		0x120
+#define APBC_TIMERS4_CLK_RST		0x124
+#define APBC_TIMERS5_CLK_RST		0x128
+#define APBC_TIMERS6_CLK_RST		0x12c
+#define APBC_TIMERS7_CLK_RST		0x130
+
+#define APBC_CAN2_CLK_RST		0x148
+#define APBC_CAN3_CLK_RST		0x14c
+#define APBC_CAN4_CLK_RST		0x150
+#define APBC_UART10_CLK_RST		0x154
+#define APBC_SSP0_CLK_RST		0x158
+#define APBC_SSP1_CLK_RST		0x15c
+#define APBC_SSPA4_CLK_RST		0x160
+#define APBC_SSPA5_CLK_RST		0x164
+
+/* APMU register offset */
+#define APMU_CSI_CCIC2_CLK_RES_CTRL	0x024
+#define APMU_ISP_CLK_RES_CTRL		0x038
+#define APMU_PMU_CLK_GATE_CTRL		0x040
+#define APMU_LCD_CLK_RES_CTRL1		0x044
+#define APMU_LCD_SPI_CLK_RES_CTRL	0x048
+#define APMU_LCD_CLK_RES_CTRL2		0x04c
+#define APMU_CCIC_CLK_RES_CTRL		0x050
+#define APMU_SDH0_CLK_RES_CTRL		0x054
+#define APMU_SDH1_CLK_RES_CTRL		0x058
+#define APMU_USB_CLK_RES_CTRL		0x05c
+#define APMU_QSPI_CLK_RES_CTRL		0x060
+#define APMU_DMA_CLK_RES_CTRL		0x064
+#define APMU_AES_CLK_RES_CTRL		0x068
+#define APMU_MCB_CLK_RES_CTRL		0x06c
+#define APMU_VPU_CLK_RES_CTRL		0x0a4
+#define APMU_DTC_CLK_RES_CTRL		0x0ac
+#define APMU_GPU_CLK_RES_CTRL		0x0cc
+#define APMU_SDH2_CLK_RES_CTRL		0x0e0
+#define APMU_PMUA_MC_CTRL		0x0e8
+#define APMU_PMU_CC2_AP			0x100
+#define APMU_PMUA_EM_CLK_RES_CTRL	0x104
+#define APMU_UCIE_CTRL			0x11c
+#define APMU_RCPU_CLK_RES_CTRL		0x14c
+#define APMU_TOP_DCLK_CTRL		0x158
+#define APMU_LCD_EDP_CTRL		0x23c
+#define APMU_UFS_CLK_RES_CTRL		0x268
+#define APMU_LCD_CLK_RES_CTRL3		0x26c
+#define APMU_LCD_CLK_RES_CTRL4		0x270
+#define APMU_LCD_CLK_RES_CTRL5		0x274
+#define APMU_CCI550_CLK_CTRL		0x300
+#define APMU_ACLK_CLK_CTRL		0x388
+#define APMU_CPU_C0_CLK_CTRL		0x38C
+#define APMU_CPU_C1_CLK_CTRL		0x390
+#define APMU_CPU_C2_CLK_CTRL		0x394
+#define APMU_CPU_C3_CLK_CTRL		0x208
+#define APMU_PCIE_CLK_RES_CTRL_A	0x1f0
+#define APMU_PCIE_CLK_RES_CTRL_B	0x1c8
+#define APMU_PCIE_CLK_RES_CTRL_C	0x1d0
+#define APMU_PCIE_CLK_RES_CTRL_D	0x1e0
+#define APMU_PCIE_CLK_RES_CTRL_E	0x1e8
+#define APMU_EMAC0_CLK_RES_CTRL		0x3e4
+#define APMU_EMAC1_CLK_RES_CTRL		0x3ec
+#define APMU_EMAC2_CLK_RES_CTRL		0x248
+#define APMU_ESPI_CLK_RES_CTRL		0x240
+#define APMU_SNR_ISIM_VCLK_CTRL		0x3f8
+
+/* DCIU register offsets */
+#define DCIU_DMASYS_CLK_EN		0x234
+#define DCIU_DMASYS_SDMA_CLK_EN		0x238
+#define DCIU_C2_TCM_PIPE_CLK		0x244
+#define DCIU_C3_TCM_PIPE_CLK		0x248
+
+#define DCIU_DMASYS_S0_RSTN		0x204
+#define DCIU_DMASYS_S1_RSTN		0x208
+#define DCIU_DMASYS_A0_RSTN		0x20C
+#define DCIU_DMASYS_A1_RSTN		0x210
+#define DCIU_DMASYS_A2_RSTN		0x214
+#define DCIU_DMASYS_A3_RSTN		0x218
+#define DCIU_DMASYS_A4_RSTN		0x21C
+#define DCIU_DMASYS_A5_RSTN		0x220
+#define DCIU_DMASYS_A6_RSTN		0x224
+#define DCIU_DMASYS_A7_RSTN		0x228
+#define DCIU_DMASYS_RSTN		0x22C
+#define DCIU_DMASYS_SDMA_RSTN		0x230
+
+/* RCPU SYSCTRL register offsets */
+#define RCPU_CAN_CLK_RST		0x4c
+#define RCPU_CAN1_CLK_RST		0xF0
+#define RCPU_CAN2_CLK_RST		0xF4
+#define RCPU_CAN3_CLK_RST		0xF8
+#define RCPU_CAN4_CLK_RST		0xFC
+#define RCPU_IRC_CLK_RST		0x48
+#define RCPU_IRC1_CLK_RST		0xEC
+#define RCPU_GMAC_CLK_RST		0xE4
+#define RCPU_ESPI_CLK_RST		0xDC
+#define RCPU_AUDIO_I2S0_SYS_CLK_CTRL	0x70
+#define RCPU_AUDIO_I2S1_SYS_CLK_CTRL	0x44
+
+/* RCPU UARTCTRL register offsets */
+#define RCPU1_UART0_CLK_RST		0x00
+#define RCPU1_UART1_CLK_RST		0x04
+#define RCPU1_UART2_CLK_RST		0x08
+#define RCPU1_UART3_CLK_RST		0x0c
+#define RCPU1_UART4_CLK_RST		0x10
+#define RCPU1_UART5_CLK_RST		0x14
+
+/* RCPU I2SCTRL register offsets */
+#define RCPU2_AUDIO_I2S0_TX_RX_CLK_CTRL	0x60
+#define RCPU2_AUDIO_I2S1_TX_RX_CLK_CTRL	0x64
+#define RCPU2_AUDIO_I2S2_TX_RX_CLK_CTRL	0x68
+#define RCPU2_AUDIO_I2S3_TX_RX_CLK_CTRL	0x6C
+
+#define RCPU2_AUDIO_I2S2_SYS_CLK_CTRL	0x44
+#define RCPU2_AUDIO_I2S3_SYS_CLK_CTRL	0x54
+
+/* RCPU SPICTRL register offsets */
+#define RCPU3_SSP0_CLK_RST		0x00
+#define RCPU3_SSP1_CLK_RST		0x04
+#define RCPU3_PWR_SSP_CLK_RST		0x08
+
+/* RCPU I2CCTRL register offsets */
+#define RCPU4_I2C0_CLK_RST		0x00
+#define RCPU4_I2C1_CLK_RST		0x04
+#define RCPU4_PWR_I2C_CLK_RST		0x08
+
+/* RPMU register offsets */
+#define RCPU5_AON_PER_CLK_RST_CTRL	0x2C
+#define RCPU5_TIMER1_CLK_RST		0x4C
+#define RCPU5_TIMER2_CLK_RST		0x70
+#define RCPU5_TIMER3_CLK_RST		0x78
+#define RCPU5_TIMER4_CLK_RST		0x7C
+#define RCPU5_GPIO_AND_EDGE_CLK_RST	0x74
+#define RCPU5_RCPU_BUS_CLK_CTRL		0xC0
+#define RCPU5_RT24_CORE0_CLK_CTRL	0xC4
+#define RCPU5_RT24_CORE1_CLK_CTRL	0xC8
+#define RCPU5_RT24_CORE0_SW_RESET	0xCC
+#define RCPU5_RT24_CORE1_SW_RESET	0xD0
+
+/* RCPU PWMCTRL register offsets */
+#define RCPU6_PWM0_CLK_RST		0x00
+#define RCPU6_PWM1_CLK_RST		0x04
+#define RCPU6_PWM2_CLK_RST		0x08
+#define RCPU6_PWM3_CLK_RST		0x0c
+#define RCPU6_PWM4_CLK_RST		0x10
+#define RCPU6_PWM5_CLK_RST		0x14
+#define RCPU6_PWM6_CLK_RST		0x18
+#define RCPU6_PWM7_CLK_RST		0x1c
+#define RCPU6_PWM8_CLK_RST		0x20
+#define RCPU6_PWM9_CLK_RST		0x24
+
+/* APBC2 SEC register offsets */
+#define APBC2_UART1_CLK_RST		0x00
+#define APBC2_SSP2_CLK_RST		0x04
+#define APBC2_TWSI3_CLK_RST		0x08
+#define APBC2_RTC_CLK_RST		0x0c
+#define APBC2_TIMERS_CLK_RST		0x10
+#define APBC2_GPIO_CLK_RST		0x1c
+
+#endif /* __SOC_K3_SYSCON_H__ */

-- 
2.52.0


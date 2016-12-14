Return-Path: <gabriel.fernandez@st.com>
From: <gabriel.fernandez@st.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>,
        Arnd Bergmann
	<arnd@arndb.de>, <daniel.thompson@linaro.org>,
        <andrea.merello@gmail.com>, <radoslaw.pietrzyk@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <kernel@stlinux.com>, <gabriel.fernandez@st.com>,
        <ludovic.barre@st.com>, <olivier.bideau@st.com>,
        <amelie.delaunay@st.com>
Subject: [PATCH] dt-bindings: mfd: stm32f429: Add QSPI & DSI constants into DT include file
Date: Wed, 14 Dec 2016 15:23:17 +0100
Message-ID: <1481725397-941-1-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Gabriel Fernandez <gabriel.fernandez@st.com>

It will be used by clock and reset drivers, and DT bindings.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 include/dt-bindings/mfd/stm32f4-rcc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/mfd/stm32f4-rcc.h b/include/dt-bindings/mfd/stm32f4-rcc.h
index e98942d..315f6c3 100644
--- a/include/dt-bindings/mfd/stm32f4-rcc.h
+++ b/include/dt-bindings/mfd/stm32f4-rcc.h
@@ -40,6 +40,7 @@
 
 /* AHB3 */
 #define STM32F4_RCC_AHB3_FMC	0
+#define STM32F4_RCC_AHB3_QSPI	1
 
 #define STM32F4_AHB3_RESET(bit)	(STM32F4_RCC_AHB3_##bit + (0x18 * 8))
 #define STM32F4_AHB3_CLOCK(bit)	(STM32F4_RCC_AHB3_##bit + (0x38 * 8))
@@ -91,6 +92,7 @@
 #define STM32F4_RCC_APB2_SPI6	21
 #define STM32F4_RCC_APB2_SAI1	22
 #define STM32F4_RCC_APB2_LTDC	26
+#define STM32F4_RCC_APB2_DSI	27
 
 #define STM32F4_APB2_RESET(bit)	(STM32F4_RCC_APB2_##bit + (0x24 * 8))
 #define STM32F4_APB2_CLOCK(bit)	(STM32F4_RCC_APB2_##bit + (0x44 * 8))
-- 
1.9.1

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
Subject: [PATCH 0/4] Introduce STM32F7 Clocks
Date: Fri, 6 Jan 2017 14:59:21 +0100
Message-ID: <1483711165-17149-1-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Gabriel Fernandez <gabriel.fernandez@st.com>

This patch-set introduces STM32F7 clocks.
F7 Clocks are very similar as F4.

We  have some new clocks:
- hdmi-cec
- spdif-rx
- lptim1
- sai2

Uarts & I2cs can have different clock sources.



Gabriel Fernandez (4):
  clk: stm32f7: Add stm32f7 clock DT bindings for STM32F746 boards
  clk: stm32f7: Introduce stm32f7 clocks for STM32F746 boards
  ARM: dts: stm32: stm32f7: Enable clocks for STM32F746 boards
  dt-bindings: mfd: Add STM32F7 RCC numeric constants into DT include
    file

 .../devicetree/bindings/clock/st,stm32-rcc.txt     |  20 ++
 arch/arm/boot/dts/stm32f746.dtsi                   |  80 ++++--
 drivers/clk/clk-stm32f4.c                          | 277 ++++++++++++++++++++-
 include/dt-bindings/clock/stm32fx-clock.h          |  20 ++
 include/dt-bindings/mfd/stm32f7-rcc.h              | 112 +++++++++
 5 files changed, 476 insertions(+), 33 deletions(-)
 create mode 100644 include/dt-bindings/mfd/stm32f7-rcc.h

-- 
1.9.1

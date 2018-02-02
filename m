Return-Path: <gabriel.fernandez@st.com>
From: <gabriel.fernandez@st.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lee
 Jones <lee.jones@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Gabriel
 Fernandez <gabriel.fernandez@st.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <gabriel.fernandez.st@gmail.com>, <olivier.bideau@st.com>
Subject: [PATCH 00/14] Introduce STM32MP1 clock driver
Date: Fri, 2 Feb 2018 15:03:28 +0100
Message-ID: <1517580222-23301-1-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Gabriel Fernandez <gabriel.fernandez@st.com>

This patch-set introduces clock driver for STM32MP157 based on Arm Cortex-A7.
The driver patch is splitted in several patches (by kind of clock) to facilitate
code reviewing.

Gabriel Fernandez (14):
  dt-bindings: Document STM32MP1 Reset Clock Controller (RCC) bindings
  dt-bindings: clock: add STM32MP1 clocks
  clk: stm32mp1: Introduce STM32MP1 clock driver
  clk: stm32mp1: add MP1 gate for osc hse/hsi/csi oscillators
  clk: stm32mp1: add Source Clocks for PLLs
  clk: stm32mp1: add PLL clocks
  clk: stm32mp1: add Post-dividers for PLL
  clk: stm32mp1: add Sub System clocks
  clk: stm32mp1: add Kernel timers
  clk: stm32mp1: add Peripheral clocks
  clk: stm32mp1: add Kernel clocks
  clk: stm32mp1: add RTC clock
  clk: stm32mp1: add MCO clocks
  clk: stm32mp1: add Debug clocks

 .../devicetree/bindings/mfd/st,stm32-rcc.txt       |   85 +
 drivers/clk/Kconfig                                |    6 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-stm32mp1.c                         | 1705 ++++++++++++++++++++
 include/dt-bindings/clock/stm32mp1-clks.h          |  248 +++
 5 files changed, 2045 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/st,stm32-rcc.txt
 create mode 100644 drivers/clk/clk-stm32mp1.c
 create mode 100644 include/dt-bindings/clock/stm32mp1-clks.h

-- 
1.9.1

Return-Path: <gabriel.fernandez@st.com>
From: <gabriel.fernandez@st.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <gabriel.fernandez@st.com>, <ludovic.barre@st.com>,
        <olivier.bideau@st.com>, <amelie.delaunay@st.com>
Subject: [PATCH 0/6] STM32F4 Add RTC & QSPI clocks
Date: Fri, 30 Sep 2016 16:25:03 +0200
Message-ID: <1475245509-6487-1-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Gabriel Fernandez <gabriel.fernandez@st.com>

This patch-set introduce RTC and QSPI clocks for STM32F4 socs
RTC clock has 3 parents clock oscillators (lsi/lse/hse_rtc)

example to use rtc clock:

		rtc: rtc@40002800 {
			compatible = "st,stm32-rtc";
			reg = <0x40002800 0x400>;
			...
			clocks = <&rcc 1 CLK_RTC>;

			assigned-clocks =  <&rcc 1 CLK_RTC>;
			assigned-clock-parents = <&rcc 1 CLK_LSE>;
			...
		};

Gabriel Fernandez (6):
  clk: stm32f4: Add LSI & LSE clocks
  ARM: dts: stm32f429: add LSI and LSE clocks
  arm: stmf32: Enable SYSCON
  clk: stm32f4: Add RTC clock
  clk: stm32f469: Add QSPI clock
  ARM: dts: stm32f429: Add QSPI clock

 .../devicetree/bindings/clock/st,stm32-rcc.txt     |   4 +-
 arch/arm/boot/dts/stm32f429.dtsi                   |  18 +
 arch/arm/boot/dts/stm32f469-disco.dts              |   4 +
 arch/arm/configs/stm32_defconfig                   |   1 +
 drivers/clk/clk-stm32f4.c                          | 450 ++++++++++++++++++++-
 5 files changed, 455 insertions(+), 22 deletions(-)

-- 
1.9.1

Return-Path: <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/4] Introduce STM32F7 Clocks
To: <gabriel.fernandez@st.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland
	<mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>,
        Arnd
 Bergmann <arnd@arndb.de>, <daniel.thompson@linaro.org>,
        <andrea.merello@gmail.com>, <radoslaw.pietrzyk@gmail.com>
References: <1483711165-17149-1-git-send-email-gabriel.fernandez@st.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <kernel@stlinux.com>, <ludovic.barre@st.com>, <olivier.bideau@st.com>,
        <amelie.delaunay@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <c7042f7e-b4eb-1fcc-200c-b76b50e82424@st.com>
Date: Mon, 3 Apr 2017 16:42:44 +0200
MIME-Version: 1.0
In-Reply-To: <1483711165-17149-1-git-send-email-gabriel.fernandez@st.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

hi

On 01/06/2017 02:59 PM, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>
> This patch-set introduces STM32F7 clocks.
> F7 Clocks are very similar as F4.
>
> We  have some new clocks:
> - hdmi-cec
> - spdif-rx
> - lptim1
> - sai2
>
> Uarts & I2cs can have different clock sources.
>
>
>
> Gabriel Fernandez (4):
>   clk: stm32f7: Add stm32f7 clock DT bindings for STM32F746 boards
>   clk: stm32f7: Introduce stm32f7 clocks for STM32F746 boards
>   ARM: dts: stm32: stm32f7: Enable clocks for STM32F746 boards
>   dt-bindings: mfd: Add STM32F7 RCC numeric constants into DT include
>     file
>
>  .../devicetree/bindings/clock/st,stm32-rcc.txt     |  20 ++
>  arch/arm/boot/dts/stm32f746.dtsi                   |  80 ++++--
>  drivers/clk/clk-stm32f4.c                          | 277 ++++++++++++++++++++-
>  include/dt-bindings/clock/stm32fx-clock.h          |  20 ++
>  include/dt-bindings/mfd/stm32f7-rcc.h              | 112 +++++++++
>  5 files changed, 476 insertions(+), 33 deletions(-)
>  create mode 100644 include/dt-bindings/mfd/stm32f7-rcc.h
>

Patchs 3 & 4 applied on stm32-dt-for-v4.12

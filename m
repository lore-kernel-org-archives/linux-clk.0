Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 30 Nov 2016 14:48:59 -0600
From: Rob Herring <robh@kernel.org>
To: gabriel.fernandez@st.com
Cc: Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	daniel.thompson@linaro.org, andrea.merello@gmail.com,
	radoslaw.pietrzyk@gmail.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, kernel@stlinux.com, ludovic.barre@st.com,
	olivier.bideau@st.com, amelie.delaunay@st.com
Subject: Re: [PATCH v2 2/9] clk: stm32f4: Add PLL_I2S & PLL_SAI for
 STM32F429/469 boards
Message-ID: <20161130204859.gfqw6wdbq4repcje@rob-hp-laptop>
References: <1479998749-20358-1-git-send-email-gabriel.fernandez@st.com>
 <1479998749-20358-3-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1479998749-20358-3-git-send-email-gabriel.fernandez@st.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Nov 24, 2016 at 03:45:42PM +0100, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> This patch introduces PLL_I2S and PLL_SAI.
> Vco clock of these PLLs can be modify by DT (only n multiplicator,
> m divider is still fixed by the boot-loader).
> Each PLL has 3 dividers. PLL should be off when we modify the rate.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  .../devicetree/bindings/clock/st,stm32-rcc.txt     |   2 +
>  drivers/clk/clk-stm32f4.c                          | 342 ++++++++++++++++++++-
>  include/dt-bindings/clock/stm32f4-clock.h          |   4 +-
>  3 files changed, 332 insertions(+), 16 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>

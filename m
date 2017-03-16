Return-Path: <gabriel.fernandez@st.com>
From: <gabriel.fernandez@st.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
        <daniel.thompson@linaro.org>, <andrea.merello@gmail.com>,
        <radoslaw.pietrzyk@gmail.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <gabriel.fernandez@st.com>
Subject: [PATCH v2 0/2] STM32F4 clock fixes
Date: Thu, 16 Mar 2017 09:16:39 +0100
Message-ID: <1489652201-19889-1-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Gabriel Fernandez <gabriel.fernandez@st.com>

v2:
Just add "Fixes" tags.

This patch-set contains 2 fixes.
One concerning exclusion of wrong values for PLLQ (0 & 1)
Fixes: 83135ad3c517 ("clk: stm32f4: Add PLL_I2S & PLL_SAI for STM32F429/469 boards")

And the second is a fix about timeout management of PLL and LSE/LSI clocks.
Fixes: 861adc44d290 ("clk: stm32f4: Add LSI & LSE clocks")

Gabriel Fernandez (2):
  clk: stm32f4: fix: exclude values 0 and 1 for PLLQ
  clk: stm32f4: fix timeout management for pll and ready gate

 drivers/clk/clk-stm32f4.c | 56 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 17 deletions(-)

-- 
1.9.1

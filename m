Return-Path: <gabriel.fernandez@st.com>
From: <gabriel.fernandez@st.com>
To: <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland
	<mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>,
        Gabriel Fernandez <gabriel.fernandez@st.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <gabriel.fernandez.st@gmail.com>, <olivier.bideau@st.com>,
        Loic PALLARDY
	<loic.pallardy@st.com>,
        benjamin GAIGNARD <benjamin.gaignard@st.com>
Subject: [PATCH RESEND 0/2] Add dsi clock for stm32f469 board
Date: Fri, 9 Mar 2018 07:57:29 +0100
Message-ID: <1520578651-28849-1-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Gabriel Fernandez <gabriel.fernandez@st.com>

This patch-set adds the dsi clock for stm32f469 board.

Gabriel Fernandez (2):
  clk: stm32: END_PRIMARY_CLK should be declare after CLK_SYSCLK
  clk: stm32: Add DSI clock for STM32F469 Board

 drivers/clk/clk-stm32f4.c                 | 11 ++++++++++-
 include/dt-bindings/clock/stm32fx-clock.h |  7 ++++---
 2 files changed, 14 insertions(+), 4 deletions(-)

-- 
1.9.1

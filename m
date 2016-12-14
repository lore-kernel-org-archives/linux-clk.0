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
Subject: [PATCH] clk: stm32f4: Use CLK_OF_DECLARE_DRIVER initialization method
Date: Wed, 14 Dec 2016 15:22:28 +0100
Message-ID: <1481725348-860-1-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Gabriel Fernandez <gabriel.fernandez@st.com>

Clock and reset controller use same compatible strings (same IP).

Since commit 989eafd0b609 ("clk: core: Avoid double initialization of
clocks") the OF core flags clock controllers registered with the
CLK_OF_DECLARE() macro as OF_POPULATED, so platform devices with the same
compatible string will not be registered.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 drivers/clk/clk-stm32f4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 11174a5..0f5ab9b 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -1325,5 +1325,5 @@ static void __init stm32f4_rcc_init(struct device_node *np)
 	kfree(clks);
 	iounmap(base);
 }
-CLK_OF_DECLARE(stm32f42xx_rcc, "st,stm32f42xx-rcc", stm32f4_rcc_init);
-CLK_OF_DECLARE(stm32f46xx_rcc, "st,stm32f469-rcc", stm32f4_rcc_init);
+CLK_OF_DECLARE_DRIVER(stm32f42xx_rcc, "st,stm32f42xx-rcc", stm32f4_rcc_init);
+CLK_OF_DECLARE_DRIVER(stm32f46xx_rcc, "st,stm32f469-rcc", stm32f4_rcc_init);
-- 
1.9.1

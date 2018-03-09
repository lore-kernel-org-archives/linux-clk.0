Return-Path: <jeffy.chen@rock-chips.com>
From: Jeffy Chen <jeffy.chen@rock-chips.com>
To: linux-kernel@vger.kernel.org,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Joseph Lo <josephl@nvidia.com>,
	Rob Herring <robh+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Heiko Stuebner <heiko@sntech.de>,
	Brian Norris <briannorris@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	linux-rockchip@lists.infradead.org,
	Kate Stewart <kstewart@linuxfoundation.org>,
	linux-input@vger.kernel.org,
	Will Deacon <will.deacon@arm.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	devicetree@vger.kernel.org,
	stephen lu <lumotuwe@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arvind Yadav <arvind.yadav.cs@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sylvain Lemieux <slemieux.tyco@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@st.com>,
	linux-clk@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: [RESEND PATCH v4 3/4] clk: lpc32xx: Set name of regmap_config
Date: Fri,  9 Mar 2018 16:43:50 +0800
Message-Id: <20180309084351.32009-4-jeffy.chen@rock-chips.com>
In-Reply-To: <20180309084351.32009-1-jeffy.chen@rock-chips.com>
References: <20180309084351.32009-1-jeffy.chen@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

We are now allowing to register debugfs without a valid device, and not
having a valid name will end up using "dummy*" to create debugfs dir.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
---

Changes in v4: None
Changes in v3: None

 drivers/clk/nxp/clk-lpc32xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index f5d815f577e0..a2a0a7f3bc57 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -67,6 +67,7 @@
 #define LPC32XX_USB_CLK_STS		0xF8
 
 static struct regmap_config lpc32xx_scb_regmap_config = {
+	.name = "lpc32xx-scb",
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-- 
2.11.0

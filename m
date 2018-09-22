Return-Path: <gregory.clement@bootlin.com>
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Antoine Tenart <antoine.tenart@bootlin.com>,
	=?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH 5/6] arm64: marvell: enable the  Armada 7K/8K CPU clk driver
Date: Sat, 22 Sep 2018 20:17:08 +0200
Message-Id: <20180922181709.13007-6-gregory.clement@bootlin.com>
In-Reply-To: <20180922181709.13007-1-gregory.clement@bootlin.com>
References: <20180922181709.13007-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

This commit makes sure the driver for the Armada 7K/8K CPU clock is
enabled.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 393d2b524284..cf6888ecd9f4 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -119,6 +119,7 @@ config ARCH_MESON
 
 config ARCH_MVEBU
 	bool "Marvell EBU SoC Family"
+	select ARMADA_AP_CPU_CLK
 	select ARMADA_AP806_SYSCON
 	select ARMADA_CP110_SYSCON
 	select ARMADA_37XX_CLK
-- 
2.19.0

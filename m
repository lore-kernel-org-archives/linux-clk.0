Return-Path: <krzk@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Lee Jones <lee.jones@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rtc-linux@googlegroups.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/4] clk: Enable compile testing for s2mps11 and max77686
Date: Sun,  2 Oct 2016 22:58:14 +0200
Message-Id: <1475441897-15730-2-git-send-email-krzk@kernel.org>
In-Reply-To: <1475441897-15730-1-git-send-email-krzk@kernel.org>
References: <1475441897-15730-1-git-send-email-krzk@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

s2mps11 and max77686 clock drivers can be compile tested to increase
build coverage.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 6a8ac04bedeb..56c1998ced3e 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -33,7 +33,7 @@ source "drivers/clk/versatile/Kconfig"
 
 config COMMON_CLK_MAX77686
 	tristate "Clock driver for Maxim 77620/77686/77802 MFD"
-	depends on MFD_MAX77686 || MFD_MAX77620
+	depends on MFD_MAX77686 || MFD_MAX77620 || COMPILE_TEST
 	---help---
 	  This driver supports Maxim 77620/77686/77802 crystal oscillator
 	  clock.
@@ -119,7 +119,7 @@ config COMMON_CLK_CS2000_CP
 
 config COMMON_CLK_S2MPS11
 	tristate "Clock driver for S2MPS1X/S5M8767 MFD"
-	depends on MFD_SEC_CORE
+	depends on MFD_SEC_CORE || COMPILE_TEST
 	---help---
 	  This driver supports S2MPS11/S2MPS14/S5M8767 crystal oscillator
 	  clock. These multi-function devices have two (S2MPS14) or three
-- 
2.7.4

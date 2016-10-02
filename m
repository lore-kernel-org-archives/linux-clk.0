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
Subject: [PATCH 4/4] mfd: Enable compile testing for max77620 and max77686
Date: Sun,  2 Oct 2016 22:58:17 +0200
Message-Id: <1475441897-15730-5-git-send-email-krzk@kernel.org>
In-Reply-To: <1475441897-15730-1-git-send-email-krzk@kernel.org>
References: <1475441897-15730-1-git-send-email-krzk@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

The OF is not a strict build-time dependency so max77620 and max77686
can be compile tested to increase build coverage.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index c6df6442ba2b..ccea26943746 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -563,7 +563,7 @@ config MFD_MAX14577
 config MFD_MAX77620
 	bool "Maxim Semiconductor MAX77620 and MAX20024 PMIC Support"
 	depends on I2C=y
-	depends on OF
+	depends on OF || COMPILE_TEST
 	select MFD_CORE
 	select REGMAP_I2C
 	select REGMAP_IRQ
@@ -578,7 +578,7 @@ config MFD_MAX77620
 config MFD_MAX77686
 	tristate "Maxim Semiconductor MAX77686/802 PMIC Support"
 	depends on I2C
-	depends on OF
+	depends on OF || COMPILE_TEST
 	select MFD_CORE
 	select REGMAP_I2C
 	select REGMAP_IRQ
-- 
2.7.4

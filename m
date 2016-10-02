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
Subject: [PATCH 0/4] clk/mfd/regulator/rtc: Enable compile testing for some Maxim/Samsung drivers
Date: Sun,  2 Oct 2016 22:58:13 +0200
Message-Id: <1475441897-15730-1-git-send-email-krzk@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

Hi,

Some of the Maxim and Samsung PMIC/MUIC drivers can be safely
compile tested to increase build-test coverage.

Rebased on next-20160930.
Patches do not depend on each-other, please pick up as you wish.

I compile-tested it on ~10 architectures, but not on all of possibilities.
Please wait few days before applying so the 0-day robots could parse
it and find possible non-compilable issues.

Best regards,
Krzysztof


Krzysztof Kozlowski (4):
  clk: Enable compile testing for s2mps11 and max77686
  regulator: Enable compile testing for Maxim and Samsung PMIC drivers
  rtc: Enable compile testing for Maxim and Samsung drivers
  mfd: Enable compile testing for max77620 and max77686

 drivers/clk/Kconfig       |  4 ++--
 drivers/mfd/Kconfig       |  4 ++--
 drivers/regulator/Kconfig | 14 +++++++-------
 drivers/rtc/Kconfig       |  7 ++++---
 4 files changed, 15 insertions(+), 14 deletions(-)

-- 
2.7.4

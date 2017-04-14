Return-Path: <thomas.petazzoni@free-electrons.com>
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 0/2] ADC support for SPEAr600
Date: Fri, 14 Apr 2017 22:51:10 +0200
Message-Id: <1492203072-27771-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Hello,

This set of two patches add support for the ADC of the SPEAr600, using
the existing spear_adc driver. Only a Device Tree description and a
minor clock fix are needed to make the ADC work.

Thomas

Thomas Petazzoni (2):
  arm: spear6xx: add DT description of the ADC on SPEAr600
  clk: spear: fix ADC clock definition on SPEAr600

 arch/arm/boot/dts/spear600.dtsi    | 8 ++++++++
 drivers/clk/spear/spear6xx_clock.c | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.7.4

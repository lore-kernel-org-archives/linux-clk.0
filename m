Return-Path: <repk@triplefau.lt>
From: Remi Pommarel <repk@triplefau.lt>
To: Stephen Warren <swarren@wwwdotorg.org>,
	Eric Anholt <eric@anholt.net>,
	Lee Jones <lee@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH v3 0/4] Add PWM clock support for bcm2835
Date: Sun,  6 Dec 2015 17:22:45 +0100
Message-Id: <1449418969-5565-1-git-send-email-repk@triplefau.lt>
List-ID: <linux-clk.vger.kernel.org>

Hi,

This patchset adds support for pwm clock. At boot, this clock does not have a
default parent nor a default rate set. Thus we should be able to change its
parent to get this clock working. The current clock implementation is using a
mux to select the parent, but these clocks need to add a password (0x5a) in
higher register bits when changing parent. So a generic mux cannot be used
here.

The two first patches fix the clock parent selection, while the last ones are
actually adding the pwm clock registration.

Changes since v1:
	- determine_rate now based its parent selection upon divided rate
	  instead of the parent one
	- bcm2835_clock_choose_div has been modified to produce an avarage rate
	  lower or equal to the requested one
	- devicetree modifications have removed to be send in another patch

Changes since v2:
	- Remove useless variable and include
	- Make bcm2835_clock_choose_div() divisor round up ability optional
	- Set rate in bcm2835_determine_rate()
	- Add device tree modification in a separate patch


Remi Pommarel (4):
  clk: bcm2835: add a round up ability to the clock divisor
  clk: bcm2835: Support for clock parent selection
  clk: bcm2835: Add PWM clock support
  clk: bcm2835: Add PWM clock support to the device tree

 arch/arm/boot/dts/bcm2835-rpi.dtsi  |   4 +
 arch/arm/boot/dts/bcm2835.dtsi      |   9 +++
 drivers/clk/bcm/clk-bcm2835.c       | 155 +++++++++++++++++++++++-------------
 include/dt-bindings/clock/bcm2835.h |   3 +-
 4 files changed, 116 insertions(+), 55 deletions(-)

-- 
2.0.1

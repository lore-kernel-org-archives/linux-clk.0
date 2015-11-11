Return-Path: <repk@triplefau.lt>
From: Remi Pommarel <repk@triplefau.lt>
To: Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH v2 0/3] Add PWM clock support for bcm2835
Date: Wed, 11 Nov 2015 15:22:42 +0100
Message-Id: <1447251765-16297-1-git-send-email-repk@triplefau.lt>
List-ID: <linux-clk.vger.kernel.org>

Hi,

This patchset adds support for pwm clock. At boot, this clock does not have a
default parent nor a default rate set. Thus we should be able to change its
parent to get this clock working. The current clock implementation is using a
mux to select the parent, but these clocks need to add a password (0x5a) in
higher register bits when changing parent. So a generic mux cannot be used
here.

The two first patches fix the clock parent selection, while the second one is
actually adding the pwm clock registration.

Changes since v1:
	- determine_rate now based its parent selection upon divided rate
	  instead of the parent one
	- bcm2835_clock_choose_div has been modified to produce an avarage rate
	  lower or equal to the requested one
	- devicetree modifications have removed to be send in another patch

Remi Pommarel (3):
  clk: bcm2835: Always round up clock divisor
  clk: bcm2835: Support for clock parent selection
  clk: bcm2835: Add PWM clock support

 drivers/clk/bcm/clk-bcm2835.c       | 151 +++++++++++++++++++++++-------------
 include/dt-bindings/clock/bcm2835.h |   3 +-
 2 files changed, 101 insertions(+), 53 deletions(-)

-- 
2.0.1

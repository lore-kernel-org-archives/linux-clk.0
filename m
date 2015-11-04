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
Subject: [PATCH 0/2] Add PWM clock support for bcm2835
Date: Thu,  5 Nov 2015 00:08:20 +0100
Message-Id: <1446678502-16243-1-git-send-email-repk@triplefau.lt>
List-ID: <linux-clk.vger.kernel.org>

Hi,

This patchset add support for pwm clock. At boot, this clock does not have a
default parent nor a default rate set. Thus we should be able to change its
parent to get this clock working. The current clock implementation is using a
mux to select the parent, but these clocks need to add a password (0x5a) in
higher register bits when changing parent. So a generic mux cannot be used
here.

The first patch fix the clock parent selection, while the second one is actually
adding the pwm clock registration.

Remi Pommarel (2):
  clk: bcm2835: Support for clock parent selection
  clk: bcm2835: Add PWM clock support

 arch/arm/boot/dts/bcm2835.dtsi      |   8 ++
 drivers/clk/bcm/clk-bcm2835.c       | 144 ++++++++++++++++++++++++------------
 include/dt-bindings/clock/bcm2835.h |   3 +-
 3 files changed, 108 insertions(+), 47 deletions(-)

-- 
2.0.1

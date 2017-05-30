Return-Path: <phil@raspberrypi.org>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH 0/2] clk: bcm2835: PCM clock improvements
Message-ID: <4c11ad43-ef4e-3fbd-500a-02b2b46e0fbd@raspberrypi.org>
Date: Tue, 30 May 2017 17:27:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

The switch to using the upstream bcm2835_cprman clock driver caused a
few problems for users of PCM (I2S) peripherals. Audio applications
require accurate, stable clocks, and the cprman driver wasn't
conservative enough in its choice of clock sources.

These patches restrict the clock sources for the PCM peripheral in two
ways: the first causes all possible sources except OSC and PLLD_PER
to be ignored, while the second allows clocks to be specified as
"low_jitter", causing the effects of fractional divisors to be taken
into account when comparing potential clocks for accuracy. In practice,
the combined effect of the two patches is to choose OSC as a source if
an integer divisor can be used, otherwise PLLD_PER is chosen.

Phil Elwell (2):
  clk: bcm2835: Limit PCM clock to OSC and PLLD_PER
  clk: bcm2835: Minimise clock jitter for PCM clock

 drivers/clk/bcm/clk-bcm2835.c | 50 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 5 deletions(-)

-- 
1.9.1

Return-Path: <phil@raspberrypi.org>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v3 0/2] clk: bcm2835: PCM clock improvements
Message-ID: <c6708407-597a-0b08-d992-3bc4852118ec@raspberrypi.org>
Date: Thu, 1 Jun 2017 10:10:20 +0100
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

Changes in v3:
* Elimination of temporary variable from patch 2.

Changes in v2:
* Extended bcm2835_pcm_per_parents to cover the pllh_aux slot, and gave
  it a comment in patch 1.
* Added a REGISTER_PCM_CLK analagous to REGISTER_PER_CLK in patch 1.
* Renamed temporary variable idiv to int_div in patch 2.

Phil Elwell (2):
  clk: bcm2835: Limit PCM clock to OSC and PLLD_PER
  clk: bcm2835: Minimise clock jitter for PCM clock

 drivers/clk/bcm/clk-bcm2835.c | 50 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 5 deletions(-)

-- 
1.9.1

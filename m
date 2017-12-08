Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 0/3] clk: sunxi-ng: sun8i: a83t: Use sigma-delta modulation for audio PLL
Date: Fri,  8 Dec 2017 16:35:09 +0800
Message-Id: <20171208083512.24080-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

Hi,

This series follows previous improvements for the other Allwinner SoCs to
improve audio quality, in particular the speed and pitch of audio playback.
The audio PLLs in Allwinner SoCs cannot produce the correct frequency to
match the audio sample rate families through integer factors. As such
the audio is either too fast or too flow.

This is dealt with by using sigma-delta modulation, a form of fractional-N
synthesis, on the divider. The parameters used are copied from the BSP
kernel.

As these parameters assume that one of the untracked dividers is set to
2, we first add a fixed /2 post divider to the PLL, and force the
untracked divider to /2. Then we introduce the sigma-delta modulation
parameters.

This has been tested with SPDIF playback on the Cubietruck Plus, and an
external PCM5122 DAC from a PiFi DAC 2.0+, connected via I2S to the
Banana Pi M3. The I2C and I2S support used in this latter test will be
sent as a separate series later.

Please have a look.

Regards
ChenYu

Chen-Yu Tsai (3):
  clk: sunxi-ng: Support fixed post-dividers on NM style clocks
  clk: sunxi-ng: sun8i: a83t: Add /2 fixed post divider to audio PLL
  clk: sunxi-ng: sun8i: a83t: Use sigma-delta modulation for audio PLL

 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c | 18 ++++++++++---
 drivers/clk/sunxi-ng/ccu_nm.c         | 50 ++++++++++++++++++++++++++---------
 drivers/clk/sunxi-ng/ccu_nm.h         |  2 ++
 3 files changed, 54 insertions(+), 16 deletions(-)

-- 
2.15.0

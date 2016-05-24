Return-Path: <v1ron@mail.ru>
From: Roman Volkov <v1ron@mail.ru>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Roman Volkov <rvolkov@v1ros.org>,
	Tony Prisk <linux@prisktech.co.nz>
Subject: [PATCH 0/2] Rework clk/vt8500 wm8650_find_pll_bits()
Date: Tue, 24 May 2016 23:07:51 +0300
Message-Id: <1464120473-1808-1-git-send-email-v1ron@mail.ru>
List-ID: <linux-clk.vger.kernel.org>

From: Roman Volkov <rvolkov@v1ros.org>

Hi Arnd and others,

This patch finally removes the warnings from GCC about possibly uninitialized
variables 'best_div2', 'best_div1', and 'best_mul'. Also one of the functions
is reworked, so that the algorithm is much easier. This is to continue the
work started in [1].

This code is tested on WM8650. Also the testing app was used in user-mode to
check possible values and performance [2].

[1] https://lkml.org/lkml/2016/2/1/149
[2] https://github.com/v1ron/vt8500-clkrange

Thanks,
Roman Volkov (2):
  clk/vt8500: Rework wm8650_find_pll_bits()
  clk/vt8500: Fix compilation warnings

 drivers/clk/clk-vt8500.c | 81 +++++++++++++++++++++++-------------------------
 1 file changed, 39 insertions(+), 42 deletions(-)

-- 
2.8.0

Return-Path: <v1ron@mail.ru>
From: Roman Volkov <v1ron@mail.ru>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Roman Volkov <rvolkov@v1ros.org>,
	Tony Prisk <linux@prisktech.co.nz>
Subject: [PATCH v2 0/2] Rework clk/vt8500 wm8650_find_pll_bits()
Date: Wed,  8 Jun 2016 00:56:08 +0300
Message-Id: <20160607215610.8724-1-v1ron@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

From: Roman Volkov <rvolkov@v1ros.org>

Hi Arnd, Stephen,

This patch finally removes the warnings from GCC about possibly uninitialized
variables 'best_div2', 'best_div1', and 'best_mul'. Also one of the functions
is reworked, so that the algorithm is much easier. This is to continue the
work started in [1].

This code is tested on WM8650. Also the testing app was used in user-mode to
check possible values and performance [2].

Please schedule this for 4.8.

Changes in v2:
Apply WM8650 fix on top of changes by Arnd [3].

[1] https://lkml.org/lkml/2016/2/1/149
[2] https://github.com/v1ron/vt8500-clkrange
[3] https://lkml.org/lkml/2016/5/31/767

Thanks,
Roman

Arnd Bergmann (1):
  clk: vt8500: fix gcc-4.9 warnings

Roman Volkov (1):
  clk: vt8500: rework wm8650_find_pll_bits()

 drivers/clk/clk-vt8500.c | 99 +++++++++++++++++++++---------------------------
 1 file changed, 44 insertions(+), 55 deletions(-)

-- 
2.8.3

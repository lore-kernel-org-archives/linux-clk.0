Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: add unregister function for fixed factor clock and fixed rate clock
Date: Wed,  6 Jan 2016 13:25:08 +0900
Message-Id: <1452054310-12935-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>


clk-mux and clk-gate have an unregister function,
but clk-fixed-rate and clk-fixed-factor do not.

I want to register/unregister clk-fixed-factor and clk-fixed-rate
from my SoC clock provider.



Masahiro Yamada (2):
  clk: add clk_unregister_fixed_factor()
  clk: add clk_unregister_fixed_rate()

 drivers/clk/clk-fixed-factor.c | 13 +++++++++++++
 drivers/clk/clk-fixed-rate.c   | 13 +++++++++++++
 include/linux/clk-provider.h   |  3 ++-
 3 files changed, 28 insertions(+), 1 deletion(-)

-- 
1.9.1

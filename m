Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] clk: forbit multiple adding of clock providers and fix false positive EPROBE_DEFER
Date: Tue, 19 Jul 2016 18:21:33 +0900
Message-Id: <1468920098-8553-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>


I dropped a question mail around 10 days ago,
https://lkml.org/lkml/2016/7/8/627

but I did not get any reply.

At least, nobody stopped me from going with this fix,
so here is the series to fix it.



Masahiro Yamada (5):
  clk: add a helper function __of_clk_find_provider()
  clk: avoid adding clock provider multiple times for one node
  clk: refactor of_clk_del_provider()
  clk: fix false positive EPROBE_DEFER of
    __of_clk_get_hw_from_provider()
  clk: return -EINVAL if clock provider has no .get callback

 drivers/clk/clk.c | 77 ++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 26 deletions(-)

-- 
1.9.1

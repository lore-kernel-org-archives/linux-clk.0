Return-Path: <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/5] clk-mvebu: Fine-tuning for four function implementations
Message-ID: <8af5ccb0-f7c1-297c-2661-8ced61302c37@users.sourceforge.net>
Date: Wed, 19 Apr 2017 21:51:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Apr 2017 21:45:43 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Use kcalloc() in of_cpu_clk_setup()
  Adjust two checks for null pointers in of_cpu_clk_setup()
  Use kcalloc() in two functions
  Adjust two checks for null pointers in kirkwood_fix_sscg_deviation()
  Delete an unnecessary variable initialisation in kirkwood_fix_sscg_deviation()

 drivers/clk/mvebu/clk-cpu.c |  8 ++++----
 drivers/clk/mvebu/common.c  | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.12.2

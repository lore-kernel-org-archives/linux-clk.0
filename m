Return-Path: <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Chao Xie <chao.xie@marvell.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/3] MMP clock: Adjustments for seven function implementations
Message-ID: <051d7ba6-e3cc-8354-8315-93fe039dd2ce@users.sourceforge.net>
Date: Wed, 27 Sep 2017 09:23:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Sep 2017 09:21:23 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in three functions
  Use common error handling code in mmp_clk_register_mix()
  Adjust 12 checks for null pointers

 drivers/clk/mmp/clk-frac.c   |  4 +---
 drivers/clk/mmp/clk-gate.c   |  4 +---
 drivers/clk/mmp/clk-mix.c    | 27 +++++++++++----------------
 drivers/clk/mmp/clk-mmp2.c   |  6 +++---
 drivers/clk/mmp/clk-pxa168.c |  6 +++---
 drivers/clk/mmp/clk-pxa910.c |  8 ++++----
 6 files changed, 23 insertions(+), 32 deletions(-)

-- 
2.14.1

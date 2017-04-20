Return-Path: <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/8] clk: Fine-tuning for ten function implementations
Message-ID: <94b24eaa-c5fb-80ea-441a-883989d14ef5@users.sourceforge.net>
Date: Thu, 20 Apr 2017 10:20:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 10:12:34 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (8):
  Use devm_kcalloc() in si5351_i2c_probe()
  Delete an error message for a failed memory allocation in si5351_i2c_probe()
  Adjust a null pointer check in si5351_dt_parse()
  Replace four seq_printf() calls by seq_putc()
  Combine two seq_puts() calls into one call in clk_summary_show()
  Improve a size determination in two functions
  Use seq_puts() in nomadik_src_clk_show()
  Delete error messages for a failed memory allocation in two functions

 drivers/clk/clk-nomadik.c | 12 ++++--------
 drivers/clk/clk-si5351.c  | 10 ++++------
 drivers/clk/clk.c         | 19 +++++++++----------
 3 files changed, 17 insertions(+), 24 deletions(-)

-- 
2.12.2

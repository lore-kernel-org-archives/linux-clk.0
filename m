Return-Path: <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/4] U300 clock: Adjustments for three function
 implementations
Message-ID: <a81e53f2-53ee-cf2d-1a0a-f1e3e24a5b9d@users.sourceforge.net>
Date: Tue, 26 Sep 2017 20:20:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 20:15:30 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete an error message for a failed memory allocation in two functions
  Improve a size determination in two functions
  Add some spaces for better code readability
  Fix a typo in two comment lines

 drivers/clk/clk-u300.c | 84 ++++++++++++++++++++++++--------------------------
 1 file changed, 40 insertions(+), 44 deletions(-)

-- 
2.14.1

Return-Path: <elfring@users.sourceforge.net>
To: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/2] Ux500 clock: Adjustments for three function
 implementations
Message-ID: <d23a685d-f8a0-f4ca-078a-414d7b8674ca@users.sourceforge.net>
Date: Wed, 27 Sep 2017 20:45:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Sep 2017 20:40:20 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in three functions
  Improve a size determination in three functions

 drivers/clk/ux500/clk-prcc.c    | 6 ++----
 drivers/clk/ux500/clk-prcmu.c   | 6 ++----
 drivers/clk/ux500/clk-sysctrl.c | 6 ++----
 3 files changed, 6 insertions(+), 12 deletions(-)

-- 
2.14.2

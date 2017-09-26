Return-Path: <elfring@users.sourceforge.net>
To: linux-clk@vger.kernel.org, Loc Ho <lho@apm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/2] X-Gene clock: Adjustments for seven function
 implementations
Message-ID: <1440d17a-ae7d-0a9c-49b4-611824df5e87@users.sourceforge.net>
Date: Tue, 26 Sep 2017 21:40:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 21:36:54 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in two functions
  Adjust six checks for null pointers

 drivers/clk/clk-xgene.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

-- 
2.14.1

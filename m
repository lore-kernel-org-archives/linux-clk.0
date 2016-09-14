Return-Path: <elfring@users.sourceforge.net>
Subject: [PATCH 0/4] clk/Renesas-MSTP: Fine-tuning for two function
 implementations
References: <566ABCD9.1060404@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Julia Lawall <julia.lawall@lip6.fr>
To: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Simon Horman <horms+renesas@verge.net.au>,
 Stephen Boyd <sboyd@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
Date: Wed, 14 Sep 2016 21:56:40 +0200
MIME-Version: 1.0
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Sep 2016 21:48:48 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Use kmalloc_array() in cpg_mstp_clocks_init()
  Delete an error message for a failed memory allocation
  Less function calls in cpg_mstp_clocks_init() after error detection
  Rename jump labels in cpg_mstp_attach_dev()

 drivers/clk/renesas/clk-mstp.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

-- 
2.10.0

Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:60578 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750739AbdI0Ti6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 Sep 2017 15:38:58 -0400
To: linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/2] versatile clock: Adjustments for icst_clk_setup()
Message-ID: <66ff55fd-caae-9c98-197d-f6c3fe7a9c49@users.sourceforge.net>
Date: Wed, 27 Sep 2017 21:38:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Sep 2017 21:34:43 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete two error messages for a failed memory allocation
  Improve a size determination

 drivers/clk/versatile/clk-icst.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

-- 
2.14.2


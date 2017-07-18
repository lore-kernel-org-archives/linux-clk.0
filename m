Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37581 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751490AbdGRQoL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Jul 2017 12:44:11 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/2] clk: renesas: rcar-gen3-cpg: refactor accessing the SD div table
Date: Tue, 18 Jul 2017 18:44:05 +0200
Message-Id: <20170718164407.22998-1-wsa+renesas@sang-engineering.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Here is a patch series trying to implement the conclusions about accessing the
SD divider table, coming from this discussion [1]. Patch 1 is a tiny, yet
seperate cleanup. Patch 2 is the bulk of the work doing the checks only when needed.
I think the code looks much better now.

I tested this on a Salvator-X (R-Car M3-W) with highspeed and UHS SD cards. I
could access them and checksum files. I also did not notice any performance
regressions. There are also no WARNings in the boot log.

Please let me know if this is what you had in mind and if you can think of
other ways of testing this change.

Thanks,

   Wolfram

[1] https://patchwork.kernel.org/patch/9688509/

Wolfram Sang (2):
  clk: renesas: rcar-gen3-cpg: drop superfluous variable
  clk: renesas: rcar-gen3-cpg.c: refactor checks for accessing the div
    table

 drivers/clk/renesas/rcar-gen3-cpg.c | 47 ++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

-- 
2.11.0


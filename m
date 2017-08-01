Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56645 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751217AbdHAKsy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 1 Aug 2017 06:48:54 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] clk: renesas: rcar-gen3-cpg: document SD divider usage
Date: Tue,  1 Aug 2017 12:46:01 +0200
Message-Id: <20170801104603.10459-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20170801104603.10459-1-wsa+renesas@sang-engineering.com>
References: <20170801104603.10459-1-wsa+renesas@sang-engineering.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Document the intended use case for the SD dividers.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 3dee900522b703..81b7713afd694c 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -62,14 +62,16 @@ struct sd_clock {
 	unsigned int div_max;
 };
 
-/* SDn divider
+/*
+ * SDn dividers - recommended settings from HW engineers
+ *
  *                     sd_srcfc   sd_fc   div
  * stp_hck   stp_ck    (div)      (div)     = sd_srcfc x sd_fc
  *-------------------------------------------------------------------
- *  0         0         0 (1)      1 (4)      4
- *  0         0         1 (2)      1 (4)      8
- *  1         0         2 (4)      1 (4)     16
- *  1         0         3 (8)      1 (4)     32
+ *  0         0         0 (1)      1 (4)      4 -> SDR104 / HS200
+ *  0         0         1 (2)      1 (4)      8 -> SDR50
+ *  1         0         2 (4)      1 (4)     16 -> HS / SDR25
+ *  1         0         3 (8)      1 (4)     32 -> NS / SDR12
  *  1         0         4 (16)     1 (4)     64
  *  0         0         0 (1)      0 (2)      2
  *  0         0         1 (2)      0 (2)      4
-- 
2.11.0


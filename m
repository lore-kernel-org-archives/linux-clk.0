Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56637 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751352AbdHAKsy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 1 Aug 2017 06:48:54 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] clk: renesas: rcar-gen3-cpg: updates to SD divider table
Date: Tue,  1 Aug 2017 12:46:00 +0200
Message-Id: <20170801104603.10459-1-wsa+renesas@sang-engineering.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This small series updates the SD divider tables for Renesas R-Car Gen3 by
documenting the use case for the dividers, add the recommended value for the
still-to-be-implemented HS400 support, and removes unused entries. The
documented values are then in sync with the recommendations the HW engineers
gave to the BSP team.

Tested on a M3-W Salvator-X (r8a7796) with HS and SDR50/104 cards. clk_summary
shows the same frequency selections as before.

Morimoto-san, could you double check that these patches match with what we
discussed before? That would be very kind. Thanks!

   Wolfram


Wolfram Sang (3):
  clk: renesas: rcar-gen3-cpg: document SD divider usage
  clk: renesas: rcar-gen3-cpg: add setting for HS400
  clk: renesas: rcar-gen3-cpg: remove unused SD divider entries

 drivers/clk/renesas/rcar-gen3-cpg.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

-- 
2.11.0


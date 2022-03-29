Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0893AC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 29 Mar 2022 09:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233920AbiC2JqV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Mar 2022 05:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234779AbiC2JqT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2022 05:46:19 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C936131F44
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 02:44:32 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
        by xavier.telenet-ops.be with bizsmtp
        id C9kW2700G49QC44019kWu0; Tue, 29 Mar 2022 11:44:30 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZ8Or-007Em0-R5; Tue, 29 Mar 2022 11:44:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZ8Or-00CC88-3m; Tue, 29 Mar 2022 11:44:29 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] clk: renesas: r8a7799[05]: Add RPC clocks
Date:   Tue, 29 Mar 2022 11:44:24 +0200
Message-Id: <cover.1648546700.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

This patch series adds support for the various clocks used by the SPI
Multi I/O Bus Controller (RPC-IF) on the R-Car E3 and D3 SoCs.
It has been tested on the Ebisu-4D and Draak development boards.

I intend to queue this in renesas-clk for v5.19.

Thanks for your comments!

Geert Uytterhoeven (2):
  clk: renesas: r8a77990: Add RPC clocks
  clk: renesas: r8a77995: Add RPC clocks

 drivers/clk/renesas/r8a77990-cpg-mssr.c | 9 +++++++++
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 9 +++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h     | 3 +++
 3 files changed, 21 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB130C04E69
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 13:11:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjGQNLa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 09:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231432AbjGQNL2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 09:11:28 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833E2E9
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 06:11:26 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5803:2d6d:5bbc:e252])
        by albert.telenet-ops.be with bizsmtp
        id NDBP2A00V0ucMBo06DBPjh; Mon, 17 Jul 2023 15:11:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qLO0Q-001fnX-NF;
        Mon, 17 Jul 2023 15:11:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qLO0Z-007Qi3-Io;
        Mon, 17 Jul 2023 15:11:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] clk: renesas: r-car-h3/m3-w/m3-n: Add 3DGE and ZG support
Date:   Mon, 17 Jul 2023 15:11:19 +0200
Message-Id: <cover.1689599217.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi all,

This patch series adds support for the GPU clocks on the R-Car H3,
M3-W(+), and M-N SoCs.  It is based on a similar series for RZ/G2[HMN]
by Adam Ford.  Hopefully this series will aid in bootstrapping upstream
GPU support for R-Car Gen3.

I intend to queue this in renesas-clk-for-v6.6.

Thanks for your comments!

Geert Uytterhoeven (3):
  clk: renesas: r8a7795: Add 3DGE and ZG support
  clk: renesas: r8a7796: Add 3DGE and ZG support
  clk: renesas: r8a77965: Add 3DGE and ZG support

 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 2 ++
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 2 ++
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 2 ++
 3 files changed, 6 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

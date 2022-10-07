Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C976C4332F
	for <linux-clk@archiver.kernel.org>; Fri,  7 Oct 2022 13:10:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbiJGNKW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Oct 2022 09:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbiJGNKR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Oct 2022 09:10:17 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52D73EA6D
        for <linux-clk@vger.kernel.org>; Fri,  7 Oct 2022 06:10:09 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a4a4:fd15:fba:df3b])
        by laurent.telenet-ops.be with bizsmtp
        id V1A6280035Lh0ZK011A6AC; Fri, 07 Oct 2022 15:10:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogn77-000uNc-JS; Fri, 07 Oct 2022 15:10:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogn77-00CPMS-6D; Fri, 07 Oct 2022 15:10:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] clk: renesas: r8a779g0: Add SASYNCPER and derived clocks
Date:   Fri,  7 Oct 2022 15:09:59 +0200
Message-Id: <cover.1665147497.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

This patch series adds the various SASYNCPER clocks (used by modules
that must not be affected by Spread Spectrum and/or Fractional
Multiplication), and most of its derived module clocks (serial and PWM)
on the R-Car V4H (R8A7799G0) SoC.

As the second patch is a fix, and the first patch is a dependency (also
for a related DT fix), I plan to queue the first two patches in
renesas-clk-fixes for v6.1.
I plan to queue the last three patches in renesas-clk for v6.2.

Thanks for your comments!

Geert Uytterhoeven (5):
  clk: renesas: r8a779g0: Add SASYNCPER clocks
  clk: renesas: r8a779g0: Fix HSCIF parent clocks
  clk: renesas: r8a779g0: Add SCIF clocks
  clk: renesas: r8a779g0: Add PWM clock
  clk: renesas: r8a779g0: Add TPU clock

 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

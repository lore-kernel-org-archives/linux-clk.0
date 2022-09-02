Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE919C54EE9
	for <linux-clk@archiver.kernel.org>; Fri,  2 Sep 2022 09:50:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235835AbiIBJud (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Sep 2022 05:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235486AbiIBJuY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Sep 2022 05:50:24 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 123E727B30
        for <linux-clk@vger.kernel.org>; Fri,  2 Sep 2022 02:50:20 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id ExqJ2800E4C55Sk06xqJPF; Fri, 02 Sep 2022 11:50:18 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oU3JZ-003hgf-WB; Fri, 02 Sep 2022 11:50:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oU3JZ-007ej8-Am; Fri, 02 Sep 2022 11:50:17 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.1
Date:   Fri,  2 Sep 2022 11:50:16 +0200
Message-Id: <cover.1662111940.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.1-tag1

for you to fetch changes up to e312ae92077f90d6ccdca05fb6d640bd9624c37c:

  dt-bindings: clock: renesas,rzg2l: Document RZ/Five SoC (2022-09-02 10:47:30 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.1

  - Add SDHI, Timer (CMT/TMU), and SPI (MSIOF) clocks on R-Car S4-8,
  - Add I2C clocks and resets on RZ/V2M,
  - Document clock support for the RZ/Five SoC,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      clk: renesas: r9a07g044: Add conditional compilation for r9a07g044_cpg_info

Lad Prabhakar (1):
      dt-bindings: clock: renesas,rzg2l: Document RZ/Five SoC

Phil Edworthy (1):
      clk: renesas: r9a09g011: Add IIC clock and reset entries

Wolfram Sang (4):
      clk: renesas: r8a779f0: Add SDH0 clock
      clk: renesas: r8a779f0: Add CMT clocks
      clk: renesas: r8a779f0: Add TMU and parent SASYNC clocks
      clk: renesas: r8a779f0: Add MSIOF clocks

 .../bindings/clock/renesas,rzg2l-cpg.yaml           |  2 +-
 drivers/clk/renesas/r8a779f0-cpg-mssr.c             | 21 ++++++++++++++++++++-
 drivers/clk/renesas/r9a07g044-cpg.c                 |  2 ++
 drivers/clk/renesas/r9a09g011-cpg.c                 |  4 ++++
 4 files changed, 27 insertions(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

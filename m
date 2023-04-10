Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48ED9C77B61
	for <linux-clk@archiver.kernel.org>; Mon, 10 Apr 2023 08:01:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjDJIBb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Apr 2023 04:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjDJIBb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Apr 2023 04:01:31 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52C53593
        for <linux-clk@vger.kernel.org>; Mon, 10 Apr 2023 01:01:29 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by laurent.telenet-ops.be with bizsmtp
        id iw1T2900E1C8whw01w1TxY; Mon, 10 Apr 2023 10:01:28 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1plmS4-00GRuV-Vf;
        Mon, 10 Apr 2023 10:01:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1plmSt-0091oS-HC;
        Mon, 10 Apr 2023 10:01:27 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.4 (take two)
Date:   Mon, 10 Apr 2023 10:01:26 +0200
Message-Id: <cover.1681113399.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 72cd8436ece036294322fecf91567fef3ce3e868:

  clk: renesas: Convert to platform remove callback returning void (2023-03-16 16:54:21 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.4-tag2

for you to fetch changes up to 5e96c2e0e88d3617477313b071cf199bfc29d794:

  clk: renesas: r8a77980: Add I2C5 clock (2023-03-30 16:44:04 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.4 (take two)

  - Add I2C5 clock on R-Car V3H.

Thanks for pulling!

----------------------------------------------------------------
Nikita Yushchenko (1):
      clk: renesas: r8a77980: Add I2C5 clock

 drivers/clk/renesas/r8a77980-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

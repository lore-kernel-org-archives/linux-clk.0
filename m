Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89830C6FA8A
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 09:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231626AbiIIJ1N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 05:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbiIIJ0w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 05:26:52 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EFFCC12C0
        for <linux-clk@vger.kernel.org>; Fri,  9 Sep 2022 02:25:24 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:91db:705e:cfbc:a001])
        by michel.telenet-ops.be with bizsmtp
        id HlRN2800R0sKggw06lRN2k; Fri, 09 Sep 2022 11:25:22 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWaGH-004ber-RN; Fri, 09 Sep 2022 11:25:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWaGH-004Omz-1x; Fri, 09 Sep 2022 11:25:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] clk: renesas: Add more R-Car V4H clocks
Date:   Fri,  9 Sep 2022 11:25:11 +0200
Message-Id: <cover.1662714852.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

This patch series adds more clocks for the R-Car V4H SoC.
I plan to queue these in renesas-clk-for-v6.1, hopefully with the
minor issue in [PATCH 4/4] resolved.

Thanks!

Geert Uytterhoeven (4):
  clk: renesas: r8a779g0: Add watchdog clock
  clk: renesas: r8a779g0: Add I2C clocks
  clk: renesas: r8a779g0: Add PFC/GPIO clocks
  clk: renesas: r8a779g0: Add EtherAVB clocks

 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

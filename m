Return-Path: <SRS0=TP+b=D2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8396C388E6
	for <linux-clk@archiver.kernel.org>; Mon, 19 Oct 2020 12:06:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CA9822268
	for <linux-clk@archiver.kernel.org>; Mon, 19 Oct 2020 12:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgJSMGV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Oct 2020 08:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgJSMGU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Oct 2020 08:06:20 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91364C0613D6
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2020 05:06:19 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id ho6G2300U4C55Sk01o6GBr; Mon, 19 Oct 2020 14:06:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kUTvc-0000WJ-KH; Mon, 19 Oct 2020 14:06:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kUTvc-0005m5-IE; Mon, 19 Oct 2020 14:06:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/6] R-Car V3U GPIO support
Date:   Mon, 19 Oct 2020 14:06:08 +0200
Message-Id: <20201019120614.22149-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi all,

This RFC patch series adds support for the GPIO blocks on the R-Car V3U
(r8a77990) SoC.  This includes clock (incl. some drive-by fixes), DT
binding, driver, and DTS updates.

Due to lack of hardware, this is compile-tested only.

Thanks for your comments!

Geert Uytterhoeven (5):
  [RFC] clk: renesas: r8a779a0: Remove non-existent S2 clock
  [RFC] clk: renesas: r8a779a0: Fix parent of CBFUSA clock
  [RFC] clk: renesas: r8a779a0: Add PFC/GPIO clocks
  [RFC] dt-bindings: gpio: rcar: Add r8a779a0 support
  [RFC] arm64: dts: r8a779a0: Add GPIO nodes

Phong Hoang (1):
  [RFC] gpio: rcar: Add support for R-Car V3U

 .../bindings/gpio/renesas,rcar-gpio.yaml      |   3 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 140 ++++++++++++++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       |   8 +-
 drivers/gpio/gpio-rcar.c                      |  23 +++
 4 files changed, 172 insertions(+), 2 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

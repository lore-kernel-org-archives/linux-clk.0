Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:42268 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759025AbbKSScB (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2015 13:32:01 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sh@vger.kernel.org, linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] drivers: sh: clk: Cleanup clock API
Date: Thu, 19 Nov 2015 19:32:05 +0100
Message-Id: <1447957927-32738-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

	Hi Simon, Magnus,

This patch series cleans up the clock API on legacy SH, to make it more
similar with the Common Clock Framework.  This will avoid different
behavior in drivers shared between legacy and CCF-based platforms (e.g.
SCIF).

Thanks for applying!

Geert Uytterhoeven (2):
  drivers: sh: clk: Avoid crashes when passing NULL clocks
  drivers: sh: clk: Remove obsolete and unused clk_round_parent()

 drivers/sh/clk/core.c  | 100 ++++++-------------------------------------------
 include/linux/sh_clk.h |   4 --
 2 files changed, 12 insertions(+), 92 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

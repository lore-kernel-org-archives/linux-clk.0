Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:43629 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752786AbcC3O6q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 30 Mar 2016 10:58:46 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-clk@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/5] clk: renesas: r8a7795: add clocks for the watchdogs
Date: Wed, 30 Mar 2016 16:58:17 +0200
Message-Id: <1459349902-13243-1-git-send-email-wsa@the-dreams.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Okay, here is the again updated series. And rebased to latest renesas-drivers
(renesas-drivers-2016-03-29-v4.6-rc1). Tested with both parent clocks for R.
Still works fine.

Comments from Geert (Thanks!) have been addressed. Now or never ;)

Regards,

   Wolfram

Wolfram Sang (5):
  clk: renesas: cpg-mssr: add generic support for read-only DIV6 clocks
  clk: renesas: r8a7795: add OSC and RINT clocks
  clk: renesas: r8a7795: add R clk
  clk: renesas: r8a7795: add stop for R clk
  arm64: dts: salvator-x: populate EXTALR

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  4 ++++
 drivers/clk/renesas/r8a7795-cpg-mssr.c             | 22 ++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             | 18 ++++++++++++------
 drivers/clk/renesas/renesas-cpg-mssr.h             |  3 +++
 4 files changed, 41 insertions(+), 6 deletions(-)

-- 
2.7.0


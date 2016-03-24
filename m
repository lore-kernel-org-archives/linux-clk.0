Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:54124 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757445AbcCXNBG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 24 Mar 2016 09:01:06 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-clk@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] r8a7795: add clocks for the watchdogs
Date: Thu, 24 Mar 2016 14:00:37 +0100
Message-Id: <1458824442-20279-1-git-send-email-wsa@the-dreams.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Okay, here is the updated series. Rebased to latest renesas-drivers
(renesas-drivers-2016-03-15-v4.5) and actually tested with both parent clocks
for R. Works fine.

All FIXMEs and comments from Geert (Thanks!) have been addressed, I hope. It
can go in, I'd think.

I have still the open question if we can set a register in secure-mode somehow,
so I can test the SWDT which is based on OSCCLK?

Regards,

   Wolfram

Wolfram Sang (5):
  clk: shmobile: cpg-mssr: add generic support for read-only DIV6 clocks
  clk: shmobile: r8a7795: add OSC and RINT clocks
  clk: shmobile: r8a7795: add R clk
  clk: shmobile: r8a7795: add stop for R clk
  arm64: dts: salvator-x: populate EXTALR

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  4 ++++
 drivers/clk/renesas/r8a7795-cpg-mssr.c             | 27 ++++++++++++++++++----
 drivers/clk/renesas/renesas-cpg-mssr.c             | 18 ++++++++++-----
 drivers/clk/renesas/renesas-cpg-mssr.h             |  3 +++
 include/dt-bindings/clock/r8a7795-cpg-mssr.h       |  2 ++
 5 files changed, 44 insertions(+), 10 deletions(-)

-- 
2.7.0


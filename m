Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38497 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752342AbdHDNXQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Aug 2017 09:23:16 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 0/4] r8a7795: Add Z and Z2 clock support
Date: Fri,  4 Aug 2017 15:22:56 +0200
Message-Id: <1501852980-22733-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

this patch-set adds Z and Z2 clock support. It is a minor rework of BSP
patches that have been posted before. The main changes are:

* To divide the parent by an extra factor 2, as per the specification
* Minor cleanups

These are dependencies for supporting CPUFreq. The remainer of that
work is being posted separately and can be found at:

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/r8a7795-cpufreq

A description of steps taken to lightly exercise the above can be found here:

http://elinux.org/Tests:R-CAR-GEN3-CPUFreq

This series is based on clk-renesas-for-v4.14

Takeshi Kihara (4):
  clk: renesas: rcar-gen3: Add Z clock divider support
  clk: renesas: r8a7795: Add Z clock
  clk: renesas: rcar-gen3: Add Z2 clock divider support
  clk: renesas: r8a7795: Add Z2 clock

 drivers/clk/renesas/r8a7795-cpg-mssr.c |   2 +
 drivers/clk/renesas/rcar-gen3-cpg.c    | 204 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h    |   2 +
 3 files changed, 208 insertions(+)

-- 
2.1.4


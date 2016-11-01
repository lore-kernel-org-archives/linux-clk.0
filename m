Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:37745 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754324AbcKAUPO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Nov 2016 16:15:14 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] Add r8a7796 clocks to capture video
Date: Tue,  1 Nov 2016 21:12:23 +0100
Message-Id: <20161101201225.14810-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Geert and everyone else,

Add the clocks for VIN and CSI2 which are needed to be able to capture 
video on r8a7796. Tested by capturing video using the VIN and CSI2 IP 
cores on M3-W.

Niklas Söderlund (2):
  clk: renesas: r8a7796: Add CSI2 clocks
  clk: renesas: r8a7796: Add VIN clocks

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.10.2


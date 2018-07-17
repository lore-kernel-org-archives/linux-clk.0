Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42801 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728610AbeGQK2J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jul 2018 06:28:09 -0400
Received: by mail-wr1-f67.google.com with SMTP id e7-v6so597195wrs.9
        for <linux-clk@vger.kernel.org>; Tue, 17 Jul 2018 02:56:21 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/3] clk: meson: clk-pll driver update
Date: Tue, 17 Jul 2018 11:56:14 +0200
Message-Id: <20180717095617.12240-1-jbrunet@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patchset is yet another round of update to the amlogic pll driver.

 1) Enable bit is added so we don't rely on the bootloader or the init
    value to enable to pll device.
 2) OD post dividers are removed from the pll driver. This simplify the
    driver and let us provide the clocks which exist between those
    dividera. Some device are actually using these clocks.
 3) The rates hard coded in parameter tables are remove. Instead, we
    only rely on the parent rate and the parameters to calculate the
    output rate, which is a lot better.

This series has been tested on the gxl libretech cc and axg s400.
I did not test it on meson8b yet.

Jerome Brunet (3):
  clk: meson: clk-pll: add enable bit
  clk: meson: clk-pll: remove od parameters
  clk: meson: clk-pll: drop hard-coded rates from pll tables

 drivers/clk/meson/axg.c     | 320 ++++++++++++++++------------
 drivers/clk/meson/axg.h     |   8 +-
 drivers/clk/meson/clk-pll.c | 156 +++++++++-----
 drivers/clk/meson/clkc.h    |  16 +-
 drivers/clk/meson/gxbb.c    | 504 ++++++++++++++++++++++----------------------
 drivers/clk/meson/gxbb.h    |  10 +-
 drivers/clk/meson/meson8b.c | 167 ++++++++-------
 drivers/clk/meson/meson8b.h |   5 +-
 8 files changed, 648 insertions(+), 538 deletions(-)

-- 
2.14.4


Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:35001 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751149AbeEOQg7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 May 2018 12:36:59 -0400
Received: by mail-wr0-f193.google.com with SMTP id i14-v6so831996wre.2
        for <linux-clk@vger.kernel.org>; Tue, 15 May 2018 09:36:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] clk: meson: mpll: add round closest support
Date: Tue, 15 May 2018 18:36:50 +0200
Message-Id: <20180515163652.19980-1-jbrunet@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

ATM, the mpll driver can only round the requested rate down, even if
rounding up would have provided a better approximation of the requested
rate.

This patchset adds a flag to enable rounding to the closest rate possible,
even if it means rounding up.

The flag is then enabled on the axg platform to improve the rates provided
to the audio subsystem.

Changes since v1: [0]
 * Fix an error in calculation while rounding the rate down
   (Thanks Martin for reporting it)

[0]: https://lkml.kernel.org/r/20180420095603.29964-1-jbrunet@baylibre.com

Jerome Brunet (2):
  clk: meson: mpll: add round closest support
  clk: meson: axg: let mpll clocks round closest

 drivers/clk/meson/axg.c      |  4 ++++
 drivers/clk/meson/clk-mpll.c | 24 +++++++++++++++++++-----
 drivers/clk/meson/clkc.h     |  3 +++
 3 files changed, 26 insertions(+), 5 deletions(-)

-- 
2.14.3


Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:39144 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752790AbeFTKGU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jun 2018 06:06:20 -0400
Received: by mail-wm0-f67.google.com with SMTP id p11-v6so5710538wmc.4
        for <linux-clk@vger.kernel.org>; Wed, 20 Jun 2018 03:06:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: meson: drop clk-audio-divider
Date: Wed, 20 Jun 2018 12:06:08 +0200
Message-Id: <20180620100610.29010-1-jbrunet@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

As explained in the commit descriptions, clk-audio-divider was a poor
solution to make sure PLL rates would be high enough while using CCF
rate propagation to determine audio clock rates.

Stopping rate propagation before the PLLs is actually simpler and provides
better results. It also allow to get rid of clk-audio-divider.

Off tree sound cards using these clocks should add the following to the
sound card DT to properly setup the PLLs:

	assigned-clocks = <&clkc CLKID_MPLL2>,
	                  <&clkc CLKID_MPLL0>,
	                  <&clkc CLKID_MPLL1>;
	assigned-clock-parents = <0>, <0>, <0>;
	assigned-clock-rates = <294912000>,
	                       <270950400>,
	                       <393216000>;

* MPLL2: 294912000Hz: 192Khz * 32 * 24 * 2
  used 24, 48, 96, 192Khz

* MPLL0: 270950400Hz: 176.4Khz * 32 * 24 * 2
  used for 5.512, 10.025, 20.05, 44.1, 88.2 and 176,4Khz

* MPLL1: 393216000Hz: 64Khz * 32 * 24 * 8
  used for 8, 16, 32 and 64Khz

Jerome Brunet (2):
  clk: meson: stop rate propagation for audio clocks
  clk: meson: remove unused clk-audio-divider driver

 drivers/clk/meson/Makefile            |   2 +-
 drivers/clk/meson/clk-audio-divider.c | 110 ----------------------------------
 drivers/clk/meson/clkc.h              |   7 ---
 drivers/clk/meson/gxbb.c              |  16 +++--
 4 files changed, 8 insertions(+), 127 deletions(-)
 delete mode 100644 drivers/clk/meson/clk-audio-divider.c

-- 
2.14.3


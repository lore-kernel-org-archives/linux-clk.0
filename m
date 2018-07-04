Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:50353 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752897AbeGDQzH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Jul 2018 12:55:07 -0400
Received: by mail-wm0-f68.google.com with SMTP id v25-v6so6984557wmc.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Jul 2018 09:55:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] clk: meson: add gen_clk
Date: Wed,  4 Jul 2018 18:54:55 +0200
Message-Id: <20180704165458.24149-1-jbrunet@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patch adds GEN_CLK, which a very useful clock for debugging.
It allows to output most of the SoC plls through one of the SoC pad.

In the future, we could even use clk_measure with it to access the
vast majority of the SoC clocks.

Jerome Brunet (3):
  clk: meson: gxbb: remove HHI_GEN_CLK_CTNL duplicate definition
  clk: meson: expose GEN_CLK clkid
  clk: meson: add gen_clk

 drivers/clk/meson/axg.c               | 64 ++++++++++++++++++++++++++++++++-
 drivers/clk/meson/axg.h               |  4 ++-
 drivers/clk/meson/gxbb.c              | 66 +++++++++++++++++++++++++++++++++++
 drivers/clk/meson/gxbb.h              |  5 +--
 include/dt-bindings/clock/axg-clkc.h  |  1 +
 include/dt-bindings/clock/gxbb-clkc.h |  1 +
 6 files changed, 137 insertions(+), 4 deletions(-)

-- 
2.14.4


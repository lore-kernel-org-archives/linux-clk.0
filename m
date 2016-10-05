Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:38059 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752672AbcJEPH5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Oct 2016 11:07:57 -0400
Received: by mail-wm0-f41.google.com with SMTP id p138so279295647wmb.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Oct 2016 08:07:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: sboyd@codeaurora.org
Cc: Neil Armstrong <narmstrong@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-oxnas@lists.tuxfamily.org
Subject: [PATCH 0/6] clk: oxnas: Rework driver to add support for OX820
Date: Wed,  5 Oct 2016 17:07:46 +0200
Message-Id: <20161005150752.22618-1-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

In order to to support the Oxford Semiconductor OX820 Soc clock gates,
rework the original driver with a structure inspired from the Qcom or Meson
drivers and using the new devm_clk_hw_register() call.

The first patches add dt-bindings include file to clarify the clock indices.

In future work, OX820 PLLs should also be handled by this driver.

Neil Armstrong (6):
  clk: oxnas: Add dt-bindings include file for OX810SE
  clk: oxnas: Add dt-bindings include file for OX820
  clk: oxnas: Rename to clk_oxnas_gate
  clk: oxnas: Refactor to make use of devm_clk_hw_register()
  clk: oxnas: Add OX820 Gate clocks
  dt-bindings: clk: oxnas,stdclk: Add OX820 bindings

 .../devicetree/bindings/clock/oxnas,stdclk.txt     |  19 +-
 drivers/clk/clk-oxnas.c                            | 232 ++++++++++++++-------
 include/dt-bindings/clock/oxsemi,ox810se.h         |  30 +++
 include/dt-bindings/clock/oxsemi,ox820.h           |  40 ++++
 4 files changed, 231 insertions(+), 90 deletions(-)
 create mode 100644 include/dt-bindings/clock/oxsemi,ox810se.h
 create mode 100644 include/dt-bindings/clock/oxsemi,ox820.h

-- 
2.7.0


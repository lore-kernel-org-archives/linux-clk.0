Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f169.google.com ([209.85.128.169]:34711 "EHLO
        mail-wr0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751850AbdGFKYf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jul 2017 06:24:35 -0400
Received: by mail-wr0-f169.google.com with SMTP id 77so22662967wrb.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Jul 2017 03:24:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] clk: meson: gxbb-aoclk: Add CEC 32k clock
Date: Thu,  6 Jul 2017 12:24:20 +0200
Message-Id: <1499336663-23875-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

In order to support the standalone CEC Controller on the Amlogic SoCs,
a specific CEC 32K clock must be handled in the AO domain.

The CEC 32K AO Clock is a dual divider with dual counter to provide a more
precise 32768Hz clock for the CEC subsystem from the external xtal.

The AO clocks management registers are spread among the AO register space,
so this patch also adds management of these registers mappings then uses them
for the CEC 32K AO clock management.

This patchset :
 - updates the bindings accordingly
 - adds the CEC 32k clock
 - adds the clock binding entry

The DT Update will be sent in another patchset.

Neil Armstrong (3):
  dt-bindings: clock: gxbb-aoclk: Add CEC 32k clock
  clk: meson: gxbb-aoclk: Add CEC 32k clock
  dt-bindings: clock: amlogic,gxbb-aoclkc: Update bindings

 .../bindings/clock/amlogic,gxbb-aoclkc.txt         |  11 +-
 drivers/clk/meson/Makefile                         |   2 +-
 drivers/clk/meson/gxbb-aoclk-32k.c                 | 188 +++++++++++++++++++++
 drivers/clk/meson/gxbb-aoclk.c                     |  59 ++++++-
 drivers/clk/meson/gxbb-aoclk.h                     |  23 +++
 include/dt-bindings/clock/gxbb-aoclkc.h            |   1 +
 6 files changed, 275 insertions(+), 9 deletions(-)
 create mode 100644 drivers/clk/meson/gxbb-aoclk-32k.c
 create mode 100644 drivers/clk/meson/gxbb-aoclk.h

-- 
1.9.1


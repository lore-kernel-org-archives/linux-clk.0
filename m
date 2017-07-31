Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:38557 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751446AbdGaMml (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2017 08:42:41 -0400
Received: by mail-wm0-f48.google.com with SMTP id m85so168903248wma.1
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2017 05:42:40 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] clk: meson: gxbb-aoclk: Add CEC 32k clock
Date: Mon, 31 Jul 2017 14:42:33 +0200
Message-Id: <1501504957-19476-1-git-send-email-narmstrong@baylibre.com>
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
 - switch driver to new bindings
 - adds the CEC 32k clock
 - adds the clock binding entry

The DT Update will be sent in another patchset.

Changes since v2 at [2] :
 - fix round_rate invalid handling
 - enhance set_rate code thanks to Chris Moore
 - add more explicit comments thanks to Martin

Changes since v1 at [1] :
 - move bindings to parent syscon node and move clkc to subnode
 - switch aoclkc to use regmap only register access
 - introduce aoclk-regmap-gate for this purpose until regmap clocks are generic

[1] https://lkml.kernel.org/r/1499336663-23875-1-git-send-email-narmstrong@baylibre.com
[2] https://lkml.kernel.org/r/1501235589-318-1-git-send-email-narmstrong@baylibre.com

Neil Armstrong (4):
  dt-bindings: clock: amlogic,gxbb-aoclkc: Update bindings
  clk: meson: gxbb-aoclk: Switch to regmap for register access
  dt-bindings: clock: gxbb-aoclk: Add CEC 32k clock
  clk: meson: gxbb-aoclk: Add CEC 32k clock

 .../bindings/clock/amlogic,gxbb-aoclkc.txt         |  22 ++-
 drivers/clk/meson/Makefile                         |   2 +-
 drivers/clk/meson/gxbb-aoclk-32k.c                 | 194 +++++++++++++++++++++
 drivers/clk/meson/gxbb-aoclk-regmap.c              |  46 +++++
 drivers/clk/meson/gxbb-aoclk.c                     |  65 ++++---
 drivers/clk/meson/gxbb-aoclk.h                     |  42 +++++
 include/dt-bindings/clock/gxbb-aoclkc.h            |   1 +
 7 files changed, 342 insertions(+), 30 deletions(-)
 create mode 100644 drivers/clk/meson/gxbb-aoclk-32k.c
 create mode 100644 drivers/clk/meson/gxbb-aoclk-regmap.c
 create mode 100644 drivers/clk/meson/gxbb-aoclk.h

-- 
1.9.1


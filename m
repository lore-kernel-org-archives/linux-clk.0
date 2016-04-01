Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:35714 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751680AbcDAO0q (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 1 Apr 2016 10:26:46 -0400
Received: by mail-wm0-f50.google.com with SMTP id 191so21967443wmq.0
        for <linux-clk@vger.kernel.org>; Fri, 01 Apr 2016 07:26:46 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, sboyd@codeaurora.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] clk: Add Oxford Semiconductor OXNAS Clocks support
Date: Fri,  1 Apr 2016 16:26:29 +0200
Message-Id: <1459520791-13269-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patchset includes support for the standard clocks controller for the
Oxford Semiconductor OXNAS SoC Family.

It was originally posted part of a platform patchset available here :
http://lkml.kernel.org/r/1458838215-23314-1-git-send-email-narmstrong@baylibre.com

Changes this v3 patchset :
- Get rid of PLX Technology, replace by Oxford Semiconductor

Neil Armstrong (2):
  clk: Add Oxford Semiconductor OXNAS Standard Clocks
  dt-bindings: Add Oxford Semiconductor OXNAS Standard Clocks bindings

 .../devicetree/bindings/clock/oxnas,stdclk.txt     |  35 ++++
 drivers/clk/Kconfig                                |   6 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-oxnas.c                            | 202 +++++++++++++++++++++
 4 files changed, 244 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/oxnas,stdclk.txt
 create mode 100644 drivers/clk/clk-oxnas.c

-- 
1.9.1


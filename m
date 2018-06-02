Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:39418 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750927AbeFBA4S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Jun 2018 20:56:18 -0400
Received: by mail-qk0-f195.google.com with SMTP id g14-v6so8972272qkm.6
        for <linux-clk@vger.kernel.org>; Fri, 01 Jun 2018 17:56:18 -0700 (PDT)
From: Ray Jui <ray.jui@broadcom.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Pramod Kumar <pramod.kumar@broadcom.com>,
        Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH v3 0/3] Update Broadcom Stingray clock entries
Date: Fri,  1 Jun 2018 17:56:05 -0700
Message-Id: <1527900968-12017-1-git-send-email-ray.jui@broadcom.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patch series updates Broadcom Stingray clock entries so they match the
latest ASIC datasheet

This patch series is based off v4.17-rc5 and is available on GIHUB:
repo: https://github.com/Broadcom/arm64-linux.git
branch: sr-clk-v3

Changes since v2:
 - Move dt-binding header change to the same patch with the binding doc
update

Changes since v1:
 - Fix patch author to Pramod Kumar on all 3 patches
 - Fix patch subject spelling error on patch 2/3

Pramod Kumar (3):
  dt-bindings: clk: Update Stingray binding doc
  clk: bcm: Update and add Stingray clock entries
  arm64: dts: Update Stingray clock DT nodes

 .../bindings/clock/brcm,iproc-clocks.txt           |  26 ++--
 .../boot/dts/broadcom/stingray/stingray-clock.dtsi |  26 ++--
 drivers/clk/bcm/clk-sr.c                           | 135 ++++++++++++++++++---
 include/dt-bindings/clock/bcm-sr.h                 |  24 ++--
 4 files changed, 170 insertions(+), 41 deletions(-)

-- 
2.1.4


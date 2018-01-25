Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3333 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751188AbeAYOAY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Jan 2018 09:00:24 -0500
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v4 0/4] MBIST work around (WAR) for Tegra210
Date: Thu, 25 Jan 2018 16:00:09 +0200
Message-ID: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patch series introduces the Memory Built-In Self Test (MBIST)
work around (WAR) needed when power ungating certain domains. More
details can be found in 'clk: tegra: MBIST WAR for Tegra210'. I choose to
implement the WAR in the Tegra210 clock driver, because most accesses are
to CAR registers and for the VENC domain, we need to make sure the CSI
clock source is not changed during the WAR execution.

Changes in v4:
* moved locking and clock control to tegra210_clk_handle_mbist_war()
* propagate errors during WAR execution to user
* rework error handling tegra210_mbist_clk_init() slightly

Changes in v3:
* fix compile problem on non-Tegra210 platforms
* fix clock handling bug in tegra210_generic_mbist_war()
* addressed minor comments

Changes in v2:
* Use readl for fence_delay() rather than readl_relaxed
* clarify MBIST and WAR acronyms

Peter De Schrijver (4):
  clk: tegra: Add la clock for Tegra210
  clk: tegra: add fence_delay for clock registers
  clk: tegra: MBIST work around for Tegra210
  soc/tegra: pmc: MBIST work around for Tegra210

 drivers/clk/tegra/clk-tegra210.c         | 357 ++++++++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h                  |   7 +
 drivers/soc/tegra/pmc.c                  |   7 +
 include/dt-bindings/clock/tegra210-car.h |   2 +-
 include/linux/clk/tegra.h                |   6 +
 5 files changed, 376 insertions(+), 3 deletions(-)

-- 
1.9.1


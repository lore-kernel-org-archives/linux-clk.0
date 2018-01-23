Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:15624 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751173AbeAWJXQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Jan 2018 04:23:16 -0500
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v3 0/4] MBIST work around (WAR) for Tegra210
Date: Tue, 23 Jan 2018 11:22:45 +0200
Message-ID: <1516699369-3513-1-git-send-email-pdeschrijver@nvidia.com>
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

Peter De Schrijver (4):
  clk: tegra: Add la clock for Tegra210
  clk: tegra: add fence_delay for clock registers
  clk: tegra: MBIST work around for Tegra210
  soc/tegra: pmc: apply MBIST work around fo Tegra210

 drivers/clk/tegra/clk-tegra210.c         | 409 ++++++++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h                  |   7 +
 drivers/soc/tegra/pmc.c                  |   5 +
 include/dt-bindings/clock/tegra210-car.h |   2 +-
 include/linux/clk/tegra.h                |   5 +
 5 files changed, 425 insertions(+), 3 deletions(-)

-- 
1.9.1


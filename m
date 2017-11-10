Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:12439 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752695AbdKJLh7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Nov 2017 06:37:59 -0500
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 0/4] MBIST WAR for Tegra210
Date: Fri, 10 Nov 2017 13:37:44 +0200
Message-ID: <1510313868-24810-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patch series introduces the MBIST WAR needed when power ungating certain
domains. More details can be found in 'clk: tegra: MBIST WAR for Tegra210'.
I choose to implement the WAR in the Tegra210 clock driver, because most
accesses are to CAR registers and for the VENC domain, we need to make sure
the CSI clock source is not changed during the WAR execution.

Peter De Schrijver (4):
  clk: tegra: Add la clock for Tegra210
  clk: tegra: add fence_delay for clock registers
  clk: tegra: MBIST WAR for Tegra210
  soc/tegra: pmc: apply MBIST WAR for Tegra210

 drivers/clk/tegra/clk-tegra210.c         | 371 ++++++++++++++++++++++++++++++-
 drivers/clk/tegra/clk.h                  |   7 +
 drivers/soc/tegra/pmc.c                  |   5 +
 include/dt-bindings/clock/tegra210-car.h |   2 +-
 include/linux/clk/tegra.h                |   1 +
 5 files changed, 383 insertions(+), 3 deletions(-)

-- 
1.9.1


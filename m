Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:1839 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727584AbeGSPG0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jul 2018 11:06:26 -0400
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <jonathanh@nvidia.com>, <thierry.reding@gmail.com>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v2 0/2] Correct clk_out_mux parents
Date: Thu, 19 Jul 2018 17:22:53 +0300
Message-ID: <1532010175-28364-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This series corrects the parents for the clk_out_mux clocks. Patch 1 does
some cleanup work to keep checkpatch.pl and the compiler happy. Patch 2
does the actual work.

v2:

Fixed const compiler warnings


Peter De Schrijver (2):
  clk: tegra: Fix const for clk_out parents
  clk: tegra: Correct clk_out_mux parents

 drivers/clk/tegra/clk-id.h               |  5 +++++
 drivers/clk/tegra/clk-tegra-fixed.c      | 16 ++++++++++++++
 drivers/clk/tegra/clk-tegra-pmc.c        | 36 ++++++++++++++++++++++++++++----
 drivers/clk/tegra/clk-tegra210.c         | 14 ++++++-------
 include/dt-bindings/clock/tegra210-car.h |  9 ++++++--
 5 files changed, 67 insertions(+), 13 deletions(-)

-- 
1.9.1


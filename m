Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37907 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbeH2T6A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Aug 2018 15:58:00 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 0/2] Prepare Exynos5433 clocks driver for system
 suspend/resume
Date: Wed, 29 Aug 2018 18:00:11 +0200
Message-id: <20180829160013.9447-1-m.szyprowski@samsung.com>
References: <CGME20180829160021eucas1p10f21691116ac17ed9d226afe72b7de0b@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Dear All

This patchset adds remaining bits to Exynos5433 clocks driver needed
to make system suspend/resume working without marking dozen of clocks as
'critical'. It must be applied on top of 'Cleanup suspend/resume code in
Samsung clock drivers' patchset sent a few minutes ago, otherwise
CLK_OF_DECLARE part of the clocks driver will not handle
samsung_cmu_info->suspend_regs entries.

Best regards
Marek Szyprowski


Patch summary:

Marek Szyprowski (2):
  clk: samsung: Use NOIRQ stage for Exynos5433 clocks suspend/resume
  clk: samsung: exynos5433: Add suspend state for TOP, CPIF & PERIC CMUs

 drivers/clk/samsung/clk-exynos5433.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

-- 
2.17.1

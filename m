Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48346 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730272AbeIFUi4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Sep 2018 16:38:56 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 0/2] Prepare Exynos5433 clocks driver for system
 suspend/resume
Date: Thu, 06 Sep 2018 18:02:34 +0200
Message-id: <20180906160236.4326-1-m.szyprowski@samsung.com>
References: <CGME20180906160243eucas1p224c199de3c21ef2d8d3343c91480d953@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Dear All

This patchset adds remaining bits to Exynos5433 clocks driver needed
to make system suspend/resume working without marking dozen of clocks as
'critical'. It must be applied on top of v2 of 'Cleanup suspend/resume code
in Samsung clock drivers' patchset sent a few minutes ago, otherwise
CLK_OF_DECLARE part of the clocks driver will not handle
samsung_cmu_info->suspend_regs entries.

Best regards
Marek Szyprowski


Changelog:

v2:
- rephrased commit message and added more notes from the patch discussion
- added more comments on register magic values
- added ack/review tags


Patch summary:

Marek Szyprowski (2):
  clk: samsung: Use NOIRQ stage for Exynos5433 clocks suspend/resume
  clk: samsung: exynos5433: Add suspend state for TOP, CPIF & PERIC CMUs

 drivers/clk/samsung/clk-exynos5433.c | 31 +++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

-- 
2.17.1

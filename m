Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55833 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729202AbeH2Tsf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Aug 2018 15:48:35 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 00/10] Cleanup suspend/resume code in Samsung clock drivers
Date: Wed, 29 Aug 2018 17:50:36 +0200
Message-id: <20180829155046.29359-1-m.szyprowski@samsung.com>
References: <CGME20180829155058eucas1p1db74951957e2d911ba91ddcc07df52ac@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Dear All

This patchset consolidates common suspend/resume code in almost all
Samsung clock drivers. This cleanup is a side-effect of a preparation
to add suspend/resume support for Exynos5433 SoCs.

Best regards
Marek Szyprowski


Patch summary:

Marek Szyprowski (10):
  clk: samsung: Remove excessive include
  clk: samsung: s3c2410: Use generic helper for handling suspend/resume
  clk: samsung: s3c2412: Use generic helper for handling suspend/resume
  clk: samsung: s3c2443: Use generic helper for handling suspend/resume
  clk: samsung: s3c64xx: Use generic helper for handling suspend/resume
  clk: samsung: s5pv210: Use generic helper for handling suspend/resume
  clk: samsung: exynos5250: Use generic helper for handling
    suspend/resume
  clk: samsung: Add support for setting registers state before suspend
  clk: samsung: exynos4: Use generic helper for handling suspend/resume
  clk: samsung: exynos5420: Use generic helper for handling
    suspend/resume

 drivers/clk/samsung/clk-exynos-audss.c |   1 -
 drivers/clk/samsung/clk-exynos3250.c   |   1 -
 drivers/clk/samsung/clk-exynos4.c      | 147 +++----------------------
 drivers/clk/samsung/clk-exynos5250.c   |  42 +------
 drivers/clk/samsung/clk-exynos5420.c   |  73 ++----------
 drivers/clk/samsung/clk-s3c2410.c      |  43 +-------
 drivers/clk/samsung/clk-s3c2412.c      |  43 +-------
 drivers/clk/samsung/clk-s3c2443.c      |  43 +-------
 drivers/clk/samsung/clk-s3c64xx.c      |  66 +----------
 drivers/clk/samsung/clk-s5pv210.c      |  41 +------
 drivers/clk/samsung/clk.c              |  23 ++--
 drivers/clk/samsung/clk.h              |  18 ++-
 12 files changed, 68 insertions(+), 473 deletions(-)

-- 
2.17.1

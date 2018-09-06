Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59514 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730351AbeIFUcG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Sep 2018 16:32:06 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 00/10] Cleanup suspend/resume code in Samsung clock
 drivers
Date: Thu, 06 Sep 2018 17:55:22 +0200
Message-id: <20180906155532.4085-1-m.szyprowski@samsung.com>
References: <CGME20180906155555eucas1p2cab3dde337bf2f9f7a7d8b4dc17c371d@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Dear All

This patchset consolidates common suspend/resume code in almost all
Samsung clock drivers. This cleanup is a side-effect of a preparation
to add suspend/resume support for Exynos5433 SoCs.

Best regards
Marek Szyprowski


Changelog:

v2:
- added ack/review tags
- replaced samsung_clk_sleep_init2 function by samsung_clk_extended_sleep_init
- fixes build break with CONFIG_PM_SLEEP disabled
- extended some commit messages

v1: https://www.spinics.net/lists/linux-samsung-soc/msg63944.html
- initial version


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
 drivers/clk/samsung/clk-exynos4.c      | 145 +++----------------------
 drivers/clk/samsung/clk-exynos5250.c   |  42 +------
 drivers/clk/samsung/clk-exynos5420.c   |  72 +-----------
 drivers/clk/samsung/clk-s3c2410.c      |  43 +-------
 drivers/clk/samsung/clk-s3c2412.c      |  43 +-------
 drivers/clk/samsung/clk-s3c2443.c      |  43 +-------
 drivers/clk/samsung/clk-s3c64xx.c      |  66 +----------
 drivers/clk/samsung/clk-s5pv210.c      |  41 +------
 drivers/clk/samsung/clk.c              |  23 ++--
 drivers/clk/samsung/clk.h              |  18 ++-
 12 files changed, 65 insertions(+), 473 deletions(-)

-- 
2.17.1

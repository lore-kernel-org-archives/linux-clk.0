Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:41093 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107AbbJTJXQ (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 20 Oct 2015 05:23:16 -0400
From: Andrzej Hajda <a.hajda@samsung.com>
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Hyungwon Hwang <human.hwang@samsung.com>
Subject: [PATCH 00/10] drm/exynos/decon5433: add support to DECON-TV
Date: Tue, 20 Oct 2015 11:22:31 +0200
Message-id: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Inki,

This patchset adds support to DECON-TV in Exynos5433 SoC.
The main patch is prepended with few preparation patches:
- add three clocks required by HDMI pipeline,
- small bindings update,
- driver cleanup.

The patchset is based on the latest exynos-drm-next branch.

Regards
Andrzej


Andrzej Hajda (10):
  clk/samsung: exynos5433: add definitions of HDMI-PHY output clocks
  clk/samsung: exynos5433: add pclk_decon clock
  drm/exynos/decon5433: add PCLK clock
  dt-bindings: video: add PCLK clock entry to exynos5433-decon
  drm/exynos/decon5433: fix timing registers writes
  drm/exynos/decon5433: add function to set particular register bits
  drm/exynos/decon5433: merge different flag fields
  drm/exynos/decon5433: remove duplicated initialization
  dt-bindings: video: exynos5433-decon: add bindings for DECON-TV
  drm/exynos/decon5433: add support for DECON-TV

 .../devicetree/bindings/video/exynos5433-decon.txt |  23 +-
 drivers/clk/samsung/clk-exynos5433.c               |   8 +-
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      | 320 ++++++++++-----------
 include/dt-bindings/clock/exynos5433.h             |   7 +-
 include/video/exynos5433_decon.h                   |  29 ++
 5 files changed, 214 insertions(+), 173 deletions(-)

-- 
1.9.1


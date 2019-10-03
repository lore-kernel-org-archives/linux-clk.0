Return-Path: <SRS0=L6e3=X4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5FEC4CED1
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 20:18:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C61CE20862
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 20:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388503AbfJCUSp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Oct 2019 16:18:45 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:50252 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388499AbfJCUSp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Oct 2019 16:18:45 -0400
Received: from swarren-lx1.nvidia.com (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id DD6FB1C0728;
        Thu,  3 Oct 2019 14:18:43 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at avon.wwwdotorg.org
From:   Stephen Warren <swarren@wwwdotorg.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH V2 1/4] clk: tegra: mark fuse clock as critical
Date:   Thu,  3 Oct 2019 14:18:34 -0600
Message-Id: <20191003201837.86824-1-swarren@wwwdotorg.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

For a little over a year, U-Boot on Tegra124 has configured the flow
controller to perform automatic RAM re-repair on off->on power transitions
of the CPU rail1]. This is mandatory for correct operation of Tegra124.
However, RAM re-repair relies on certain clocks, which the kernel must
enable and leave running. The fuse clock is one of those clocks. Mark this
clock as critical so that LP1 power mode (system suspend) operates
correctly.

[1] 3cc7942a4ae5 ARM: tegra: implement RAM repair

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Cc: stable@vger.kernel.org
Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
v2: Set CRITICAL flag on the clock, rather than enabling it in
tegra124_init_table[].
---
 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 1ed85f120a1b..76dd91eebd13 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -785,7 +785,7 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("ahbdma", "hclk", 33, 0, tegra_clk_ahbdma, 0),
 	GATE("apbdma", "pclk", 34, 0, tegra_clk_apbdma, 0),
 	GATE("kbc", "clk_32k", 36, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_kbc, 0),
-	GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, 0),
+	GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, CLK_IS_CRITICAL),
 	GATE("fuse_burn", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse_burn, 0),
 	GATE("kfuse", "clk_m", 40, TEGRA_PERIPH_ON_APB, tegra_clk_kfuse, 0),
 	GATE("apbif", "clk_m", 107, TEGRA_PERIPH_ON_APB, tegra_clk_apbif, 0),
-- 
2.23.0


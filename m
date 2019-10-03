Return-Path: <SRS0=L6e3=X4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2F6C10F14
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 20:18:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 515D5215EA
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 20:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388533AbfJCUSt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Oct 2019 16:18:49 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:50302 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733146AbfJCUSs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Oct 2019 16:18:48 -0400
Received: from swarren-lx1.nvidia.com (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id 571981C0728;
        Thu,  3 Oct 2019 14:18:47 -0600 (MDT)
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
Subject: [PATCH V2 4/4] ARM: tegra: use clk_m CPU on Tegra124 LP1 resume
Date:   Thu,  3 Oct 2019 14:18:37 -0600
Message-Id: <20191003201837.86824-4-swarren@wwwdotorg.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191003201837.86824-1-swarren@wwwdotorg.org>
References: <20191003201837.86824-1-swarren@wwwdotorg.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

Configure the clock controller to set an alternate clock for the CPU when
it receives an IRQ during LP1 (system suspend). Specifically, use clk_m
(the crystal) rather than clk_s (a 32KHz clock). Such an IRQ will be the
LP1 wake event. This reduces the amount of time taken to resume from LP1.

NVIDIA's downstream kernel executes this code on both Tegra30 and
Tegra124, so it appears OK to make this change unconditionally.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
v2: No change.
---
 arch/arm/mach-tegra/sleep-tegra30.S | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index 6191f9456288..ba5e9c07d1b6 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -670,8 +670,12 @@ tegra30_switch_cpu_to_clk32k:
 	pll_iddq_entry r1, r5, CLK_RESET_PLLX_MISC3, CLK_RESET_PLLX_MISC3_IDDQ
 _no_pll_in_iddq:
 
-	/* switch to CLKS */
-	mov	r0, #0	/* brust policy = 32KHz */
+	/*
+	 * Switch to clk_s (32KHz); bits 28:31=0
+	 * Enable burst on CPU IRQ; bit 24=1
+	 * Set IRQ burst clock source to clk_m; bits 10:8=0
+	 */
+	mov	r0, #(1 << 24)
 	str	r0, [r5, #CLK_RESET_SCLK_BURST]
 
 	ret	lr
-- 
2.23.0


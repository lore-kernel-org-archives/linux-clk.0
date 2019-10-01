Return-Path: <SRS0=E8mG=X2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97848ECE587
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 21:21:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78CED21906
	for <linux-clk@archiver.kernel.org>; Tue,  1 Oct 2019 21:21:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727601AbfJAVVv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Oct 2019 17:21:51 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:40810 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727724AbfJAVVu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 17:21:50 -0400
Received: from swarren-lx1.nvidia.com (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id 4BBCC1C0B2F;
        Tue,  1 Oct 2019 15:14:03 -0600 (MDT)
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
Subject: [PATCH 2/4] ARM: tegra: Enable PLLP bypass during Tegra124 LP1
Date:   Tue,  1 Oct 2019 15:13:44 -0600
Message-Id: <20191001211346.104400-2-swarren@wwwdotorg.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001211346.104400-1-swarren@wwwdotorg.org>
References: <20191001211346.104400-1-swarren@wwwdotorg.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

For a little over a year, U-Boot has configured the flow controller to
perform automatic RAM re-repair on off->on power transitions of the CPU
rail1]. This is mandatory for correct operation of Tegra124. However, RAM
re-repair relies on certain clocks, which the kernel must enable and
leave running. PLLP is one of those clocks. This clock is shut down
during LP1 in order to save power. Enable bypass (which I believe routes
osc_div_clk, essentially the crystal clock, to the PLL output) so that
this clock signal toggles even though the PLL is not active. This is
required so that LP1 power mode (system suspend) operates correctly.

The bypass configuration must then be undone when resuming from LP1, so
that all peripheral clocks run at the expected rate. Without this, many
peripherals won't work correctly; for example, the UART baud rate would
be incorrect.

NVIDIA's downstream kernel code only does this if not compiled for
Tegra30, so the added code is made conditional upon the chip ID. NVIDIA's
downstream code makes this change conditional upon the active CPU
cluster. The upstream kernel currently doesn't support cluster switching,
so this patch doesn't test the active CPU cluster ID.

[1] 3cc7942a4ae5 ARM: tegra: implement RAM repair

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Cc: stable@vger.kernel.org
Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 arch/arm/mach-tegra/sleep-tegra30.S | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index b408fa56eb89..6922dd8d3e2d 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -370,6 +370,14 @@ _pll_m_c_x_done:
 	pll_locked r1, r0, CLK_RESET_PLLC_BASE
 	pll_locked r1, r0, CLK_RESET_PLLX_BASE
 
+	tegra_get_soc_id TEGRA_APB_MISC_BASE, r1
+	cmp	r1, #TEGRA30
+	beq	1f
+	ldr	r1, [r0, #CLK_RESET_PLLP_BASE]
+	bic	r1, r1, #(1<<31)	@ disable PllP bypass
+	str	r1, [r0, #CLK_RESET_PLLP_BASE]
+1:
+
 	mov32	r7, TEGRA_TMRUS_BASE
 	ldr	r1, [r7]
 	add	r1, r1, #LOCK_DELAY
@@ -630,7 +638,10 @@ tegra30_switch_cpu_to_clk32k:
 	str	r0, [r4, #PMC_PLLP_WB0_OVERRIDE]
 
 	/* disable PLLP, PLLA, PLLC and PLLX */
+	tegra_get_soc_id TEGRA_APB_MISC_BASE, r1
+	cmp	r1, #TEGRA30
 	ldr	r0, [r5, #CLK_RESET_PLLP_BASE]
+	orrne	r0, r0, #(1 << 31)	@ enable PllP bypass on fast cluster
 	bic	r0, r0, #(1 << 30)
 	str	r0, [r5, #CLK_RESET_PLLP_BASE]
 	ldr	r0, [r5, #CLK_RESET_PLLA_BASE]
-- 
2.23.0


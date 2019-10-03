Return-Path: <SRS0=L6e3=X4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5062FC32792
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 20:18:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24B5E20862
	for <linux-clk@archiver.kernel.org>; Thu,  3 Oct 2019 20:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388525AbfJCUSr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Oct 2019 16:18:47 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:50284 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733146AbfJCUSr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Oct 2019 16:18:47 -0400
Received: from swarren-lx1.nvidia.com (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id F37A91C0CB9;
        Thu,  3 Oct 2019 14:18:45 -0600 (MDT)
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
Subject: [PATCH V2 3/4] ARM: tegra: modify reshift divider during LP1
Date:   Thu,  3 Oct 2019 14:18:36 -0600
Message-Id: <20191003201837.86824-3-swarren@wwwdotorg.org>
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

The reshift hardware module implements the RAM re-repair process. This
module uses PLLP as an input clock during LP1 resume. The input divider
for this clock is typically set for PLLP's normal rate. During LP1
resume, PLLP is bypassed and so runs at the crystal rate, which is much
slower. Consequently, decrease the divider so that the reshift module
runs at a reasonable rate during LP1 resume.

NVIDIA's downstream kernel code only does this if not compiled for
Tegra30, so the added code is made conditional upon the chip ID.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
v2: No change.
---
 arch/arm/mach-tegra/sleep-tegra30.S | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index 6922dd8d3e2d..6191f9456288 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -59,6 +59,9 @@
 #define CLK_RESET_PLLX_MISC3_IDDQ	3
 #define CLK_RESET_PLLM_MISC_IDDQ	5
 #define CLK_RESET_PLLC_MISC_IDDQ	26
+#define CLK_RESET_PLLP_RESHIFT		0x528
+#define CLK_RESET_PLLP_RESHIFT_DEFAULT	0x3b
+#define CLK_RESET_PLLP_RESHIFT_ENABLE	0x3
 
 #define CLK_RESET_CLK_SOURCE_MSELECT	0x3b4
 
@@ -373,9 +376,13 @@ _pll_m_c_x_done:
 	tegra_get_soc_id TEGRA_APB_MISC_BASE, r1
 	cmp	r1, #TEGRA30
 	beq	1f
+
 	ldr	r1, [r0, #CLK_RESET_PLLP_BASE]
 	bic	r1, r1, #(1<<31)	@ disable PllP bypass
 	str	r1, [r0, #CLK_RESET_PLLP_BASE]
+
+	mov	r1, #CLK_RESET_PLLP_RESHIFT_DEFAULT
+	str	r1, [r0, #CLK_RESET_PLLP_RESHIFT]
 1:
 
 	mov32	r7, TEGRA_TMRUS_BASE
@@ -644,6 +651,10 @@ tegra30_switch_cpu_to_clk32k:
 	orrne	r0, r0, #(1 << 31)	@ enable PllP bypass on fast cluster
 	bic	r0, r0, #(1 << 30)
 	str	r0, [r5, #CLK_RESET_PLLP_BASE]
+	beq	1f
+	mov	r0, #CLK_RESET_PLLP_RESHIFT_ENABLE
+	str	r0, [r5, #CLK_RESET_PLLP_RESHIFT]
+1:
 	ldr	r0, [r5, #CLK_RESET_PLLA_BASE]
 	bic	r0, r0, #(1 << 30)
 	str	r0, [r5, #CLK_RESET_PLLA_BASE]
-- 
2.23.0


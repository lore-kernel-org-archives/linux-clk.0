Return-Path: <SRS0=s02A=5V=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387F8C2BA1B
	for <linux-clk@archiver.kernel.org>; Sun,  5 Apr 2020 02:51:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03D1B2071C
	for <linux-clk@archiver.kernel.org>; Sun,  5 Apr 2020 02:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586055117;
	bh=lO9RYq3PqC9cOBD41BoGaOfudd0EiLiKKw58qopcVfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=f2oJpGrKp+LSfg4A9QzTyG4Ivtg+2lcmkQUkXCp/YcAI0sxKoEOFul28hubor5sYm
	 gvgTpIWM/9S4y+d3gC3X4mOBo8Wi+a4wjnyuCfxdwUdLkbeApkh0Hmn7MBTbf46lyb
	 PEucN/pXItUWwXK0q/ybMGenGJ2C9suDUb0YuxgM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgDECv2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 4 Apr 2020 22:51:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:44788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726397AbgDECv0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 4 Apr 2020 22:51:26 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0B0120735;
        Sun,  5 Apr 2020 02:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586055086;
        bh=lO9RYq3PqC9cOBD41BoGaOfudd0EiLiKKw58qopcVfE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jDMc8DX8gtrLAENy79iHIanGbw8Wf/DBkhxhCQflbPyoSxWbSixsjzXX95/5h5Cev
         CoCDlYWv2/SXG6A3XUXfwWEwbhiKR7cIRxGtNvInisPTnkKYWsfywQVSRjKpWemODT
         BjteqvZSi6oL1XusiwS8VTbZLzoIxA2QQzejgX/E=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Paul Walmsley <paul@pwsan.com>,
        Thierry Reding <treding@nvidia.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/9] arm64: tegra: Remove redundant CLKDEV_LOOKUP selects
Date:   Sat,  4 Apr 2020 19:51:17 -0700
Message-Id: <20200405025123.154688-4-sboyd@kernel.org>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
In-Reply-To: <20200405025123.154688-1-sboyd@kernel.org>
References: <20200405025123.154688-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The arm64 architecture selects COMMON_CLK at the toplevel ARM64 config.
The COMMON_CLK config option already selects CLKDEV_LOOKUP so it's
redundant to have this selected again for the Tegra specific config.

Cc: Paul Walmsley <paul@pwsan.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index b2b504ea6fd6..5d5d91feca44 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -236,7 +236,6 @@ config ARCH_TEGRA
 	bool "NVIDIA Tegra SoC Family"
 	select ARCH_HAS_RESET_CONTROLLER
 	select ARM_GIC_PM
-	select CLKDEV_LOOKUP
 	select CLKSRC_MMIO
 	select TIMER_OF
 	select GENERIC_CLOCKEVENTS
-- 
Sent by a computer, using git, on the internet


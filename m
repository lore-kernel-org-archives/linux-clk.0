Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954F5C48BDF
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 15:33:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EE34613C0
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 15:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237040AbhFIPfI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jun 2021 11:35:08 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:54523 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236999AbhFIPfH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Jun 2021 11:35:07 -0400
X-IronPort-AV: E=Sophos;i="5.83,261,1616425200"; 
   d="scan'208";a="83886975"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Jun 2021 00:33:12 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3D2634009102;
        Thu, 10 Jun 2021 00:33:09 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 05/11] arm64: defconfig: Enable ARCH_R9A07G044
Date:   Wed,  9 Jun 2021 16:32:24 +0100
Message-Id: <20210609153230.6967-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enable the Renesas RZ/G2L SoC variants in the ARM64 defconfig.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c1110fc20cdb..756fb464b107 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1044,6 +1044,7 @@ CONFIG_ARCH_R8A77980=y
 CONFIG_ARCH_R8A77990=y
 CONFIG_ARCH_R8A77995=y
 CONFIG_ARCH_R8A779A0=y
+CONFIG_ARCH_R9A07G044=y
 CONFIG_ROCKCHIP_PM_DOMAINS=y
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
-- 
2.17.1


Return-Path: <SRS0=Rxbn=UL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DDFC31E46
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 15:03:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5246320866
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 15:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408637AbfFLPD6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jun 2019 11:03:58 -0400
Received: from ns.iliad.fr ([212.27.33.1]:40876 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408311AbfFLPD6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Jun 2019 11:03:58 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 15DF8202EC;
        Wed, 12 Jun 2019 17:03:57 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id F2B0720D88;
        Wed, 12 Jun 2019 17:03:56 +0200 (CEST)
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v1] clk: xgene: Don't build COMMON_CLK_XGENE by default
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Feng Kan <fkan@apm.com>
Message-ID: <68c0d022-569c-c529-047a-a0bfae17994d@free.fr>
Date:   Wed, 12 Jun 2019 17:03:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Jun 12 17:03:57 2019 +0200 (CEST)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Building COMMON_CLK_XGENE is pointless, unless we're building for
an XGENE system.

Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
 drivers/clk/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index fc1e0cf44995..b97974662a1f 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -215,7 +215,7 @@ config CLK_QORIQ
 
 config COMMON_CLK_XGENE
 	bool "Clock driver for APM XGene SoC"
-	default y
+	default ARCH_XGENE
 	depends on ARM64 || COMPILE_TEST
 	---help---
 	  Sypport for the APM X-Gene SoC reference, PLL, and device clocks.
-- 
2.17.1

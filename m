Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103DEC11F66
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 06:07:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D99C861D91
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 06:07:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbhF2GKS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 02:10:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:33654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231881AbhF2GKS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 Jun 2021 02:10:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A5F961D92;
        Tue, 29 Jun 2021 06:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624946871;
        bh=589fwBcQYbjjTvCpnXmD9uxEc9ZGVnjsV8M/CbZKR+c=;
        h=From:To:Cc:Subject:Date:From;
        b=N6h8vU1eFkje7GektwyZv0YirseWheE/726xCfQPxxSTxlJEKz9idWVO+7a2zIF7e
         xQ5lSW/zYeH2ANxqTetD3fP35SetvlhJ/YmNWid19FnxxUfQbIfS7OCi+ua1J7zZ05
         u2CSjvweI+d59RlFQRpukhHS8BiUNsl6v+r2gmvujn3RCMZqI7q9cINSWUpI1Pc7v8
         8d8Sse3Aot80Ng4ktPm707lsvl9vlcxeYmNAVzjiGKw3DqsOcqWeELvlGx7ULvHcIP
         GnnwGh078QZCweYlob8DEuY54bJuXe0HcqT1iueZWKQcuKUhaoZgdQpxuTqHpPZXny
         dZt99ozE26TIg==
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Liam Beguin <lvb@xiphos.com>
Subject: [PATCH 1/2] clk: lmk04832: Depend on SPI
Date:   Mon, 28 Jun 2021 23:07:50 -0700
Message-Id: <20210629060751.3119453-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This driver depends on SPI. Otherwise compilation fails

  clk-lmk04832.c:(.text+0x1668): undefined reference to `spi_get_device_id'

Reported-by: kernel test robot <lkp@intel.com>
Cc: Liam Beguin <lvb@xiphos.com>
Fixes: 3bc61cfd6f4a ("clk: add support for the lmk04832")
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index ccf77849bdbd..d49cf3ae52aa 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -57,6 +57,7 @@ config CLK_HSDK
 
 config LMK04832
 	tristate "Ti LMK04832 JESD204B Compliant Clock Jitter Cleaner"
+	depends on SPI
 	select REGMAP_SPI
 	help
 	  Say yes here to build support for Texas Instruments' LMK04832 Ultra
-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git


Return-Path: <SRS0=u/0O=7J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FE8C433DF
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 18:13:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F55F2075A
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 18:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590603192;
	bh=KJeMbAr4LraFsvpHZAw4CVgPW+zmncZn9oQBr3q9xJI=;
	h=From:List-Id:To:Cc:Subject:Date:List-ID:From;
	b=OHvxR2prCbzNs38oGep2nUTGitJ2Cq50M9QtSnPE6650yFgRMy/08xz25L5oVtuzM
	 d/KgeTm/bbbdjovuuTfM5bJrXy5qvXYPeRFZyVjaaMNAJrX3y+T04sQzHjpEmYvDwa
	 msqTpbFWPCTCPUqOSyyLUN25MTYPnaCstmx8Ibk0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391872AbgE0SNM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 May 2020 14:13:12 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40370 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388720AbgE0SNL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 May 2020 14:13:11 -0400
Received: by mail-io1-f68.google.com with SMTP id q8so25708577iow.7
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2020 11:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/EruCW5OyzYkTpIMEcZw9VvP4rIyANLSRqMpkEmMESc=;
        b=NncjQVbE04xuGEGkTXyJ37wVnxIwEErbiG2JbdMjZsClfXdmmNOLkfXsRyInz2eEgZ
         LZhwp5uoR5DPWOa4sFPkCRO6V4fVC8cVz0T+SEWDFBLgwDzR3jTOKIgPYR3LbPz++TtZ
         FqGLOdnR5GPDjFQ03/kKEiz7klP4BYup1nS+yZak5DHgUDkZw/b5TcMPP7xU74zSxpjI
         9phUZkO6P6YcrA/a3nKxixoWGup+0kpK6mqQ1zJkFIQ1OGIG5u9obuLM0m5lC6sYBFyX
         FZPu8Id70Y++BotaJ8DI4JakcZli58pL2qso8vvtwOCshvKDdMd1yXFlGvINKANGXZtg
         Oarg==
X-Gm-Message-State: AOAM530ah3vmKZp3oSsQ5dvbIZ+QTJfCcdxxIoO7i17N2Hql+BVp3Mz9
        UNLBYc9SHxy/bmxf8VKnKw==
X-Google-Smtp-Source: ABdhPJxUSllQ00lt5W6Ku5+TyPaZgvzDvlMqASKxBalVSX3oZwrMtPe4WkxLJ5GjLAWgGk9w552hsQ==
X-Received: by 2002:a6b:ee15:: with SMTP id i21mr22853775ioh.179.1590603189487;
        Wed, 27 May 2020 11:13:09 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
        by smtp.googlemail.com with ESMTPSA id e12sm1562445ioc.37.2020.05.27.11.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 11:13:08 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To:     soc@kernel.org
Cc:     anders.roxell@linaro.org, Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: versatile: Fix kconfig dependency on COMMON_CLK_VERSATILE
Date:   Wed, 27 May 2020 12:13:07 -0600
Message-Id: <20200527181307.2482167-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If COMPILE_TEST is enabled, then COMMON_CLK_VERSATILE can be disabled
when dependent options like ICST are selected resulting in kconfig
warnings:

WARNING: unmet direct dependencies detected for ICST
  Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_VERSATILE [=n]
  Selected by [y]:
  - ARCH_REALVIEW [=y] && (ARCH_MULTI_V5 [=n] || ARCH_MULTI_V6 [=n] || ARCH_MULTI_V7 [=y])
  - ARCH_VEXPRESS [=y] && ARCH_MULTI_V7 [=y]
  - ARCH_ZYNQ [=y] && ARCH_MULTI_V7 [=y]

WARNING: unmet direct dependencies detected for CLK_SP810
  Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_VERSATILE [=n]
  Selected by [y]:
  - ARCH_REALVIEW [=y] && (ARCH_MULTI_V5 [=n] || ARCH_MULTI_V6 [=n] || ARCH_MULTI_V7 [=y])

Fix this by dropping COMMON_CLK_VERSATILE and just using 'menu' instead
of 'menuconfig'.

Fixes: 81134fb541d4 ("clk: versatile: Rework kconfig structure")
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please apply this along with Ander's fixes to the SoC tree. 

Note that this patch[1] is also need to resolve the kconfig issues. 
Michal said he would apply it.

Rob

[1] https://lore.kernel.org/linux-arm-kernel/20200409221829.29421-1-robh@kernel.org/

 drivers/clk/versatile/Kconfig | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
index a0ed412e8396..8c1b0e8e8d32 100644
--- a/drivers/clk/versatile/Kconfig
+++ b/drivers/clk/versatile/Kconfig
@@ -1,11 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-menuconfig COMMON_CLK_VERSATILE
-	bool "Clock driver for ARM Reference designs" if COMPILE_TEST
-	default y if ARCH_INTEGRATOR || ARCH_REALVIEW || \
-		ARCH_VERSATILE || ARCH_VEXPRESS
-
-if COMMON_CLK_VERSATILE
+menu "Clock driver for ARM Reference designs"
+	depends on ARCH_INTEGRATOR || ARCH_REALVIEW || \
+		ARCH_VERSATILE || ARCH_VEXPRESS || COMPILE_TEST
 
 config ICST
 	bool "Clock driver for ARM Reference designs ICST"
@@ -32,4 +29,4 @@ config CLK_VEXPRESS_OSC
 	  Express platforms hidden behind its configuration infrastructure,
 	  commonly known as OSCs.
 
-endif
+endmenu
-- 
2.25.1


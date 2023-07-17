Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98CEEB64DC
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 21:04:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbjGQVEA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 17:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjGQVD7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 17:03:59 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DC0118
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 14:03:58 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-668711086f4so3017955b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 14:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689627838; x=1692219838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o1J3PrW+KELul59iWMsbn0NuwlLctvPQuEIvtb6UgWY=;
        b=Ku8I0funEqrw0TX6rYaGXYYIHrttNyMTFVvrgZZGUya0wgLsLsxRwq4M1BtrN7gi6j
         PCbSF9+xrLXT26UHSIGTbFUp2b1xnr4ITMhmHMJVPsQOblGAQLmEmKV2mdsWTorMTljb
         JmsVEGyxnFlw4/sOEAReNkqylFfUlMcYHnHgi/7e4ELG/3iJrZ2+KTCIVkNy6+f56CkI
         xx603jKovuSBX1guw5etp3sUmolhDDjr/apHn5nHypc+NOj+g2iuKidRWC+hxQdjdG5P
         0EzE2Qih3mmpiiLY3oho1QgNIPLTv4n6B5DKMqNi3hLG/W9LFX2K835TLTMHoTXkMWLk
         oJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689627838; x=1692219838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1J3PrW+KELul59iWMsbn0NuwlLctvPQuEIvtb6UgWY=;
        b=ip3BQjSNWDJfuzGoy8HCKZvvLM7bOFSHN6bjeE9bM1R23ysaObd8+N5rF0czD750ST
         /omcFp+fgATXzflxjRSPAgNxp2estTcPTQWS6YOMjp9OIXs5UiliWnjYQ/cq349PK2Dk
         ax5k3n4Fp5imLJdqqMXy4GcGeGA7FwginRKu2vhGfmWsEgYTImur5b2V9UbvHTocRonK
         +1+GOrf3bjbkcOSXg1YCe03RMSvEOJWlZZBQiCjbQNtnE1hmqRUsYGA4WmSH25IBbbC/
         0NN/RUof8Da/ucsBRnjLvjAka2YyexxPD2li+W+Gt2yfGL0j5aKdjeE4iWLuEGhjg3BG
         paQQ==
X-Gm-Message-State: ABy/qLZ6PmqRyNzla2wI7I1ARlOeLJhSZFxMxuHnta3Gxo5XSf2Iqbm8
        WGBM1mGjLzfvfdoadoNryANW8MzDZt9uzZLZWBG2VA==
X-Google-Smtp-Source: APBJJlGOS37CqLaBewrjCl5Z0maH1pn80HSmDOUF0nWeAle4VJHXL5qIG15IsIleFsgn4g9p6Ja4Vg==
X-Received: by 2002:a05:6a20:8425:b0:12b:40d3:aeb1 with SMTP id c37-20020a056a20842500b0012b40d3aeb1mr16273429pzd.25.1689627837974;
        Mon, 17 Jul 2023 14:03:57 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm191915pfe.213.2023.07.17.14.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 14:03:57 -0700 (PDT)
From:   Samuel Holland <samuel.holland@sifive.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Samuel Holland <samuel.holland@sifive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: analogbits: Allow building the library as a module
Date:   Mon, 17 Jul 2023 14:03:55 -0700
Message-Id: <20230717210356.2794736-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This library is only used by the SiFive PRCI driver. When that driver is
built as a module, it makes sense to build this library as a module too.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/clk/analogbits/Kconfig          | 2 +-
 drivers/clk/analogbits/wrpll-cln28hpc.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/analogbits/Kconfig b/drivers/clk/analogbits/Kconfig
index 1e291b185438..7d73db0fcd49 100644
--- a/drivers/clk/analogbits/Kconfig
+++ b/drivers/clk/analogbits/Kconfig
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config CLK_ANALOGBITS_WRPLL_CLN28HPC
-	bool
+	tristate
diff --git a/drivers/clk/analogbits/wrpll-cln28hpc.c b/drivers/clk/analogbits/wrpll-cln28hpc.c
index 09ca82356399..760b51031795 100644
--- a/drivers/clk/analogbits/wrpll-cln28hpc.c
+++ b/drivers/clk/analogbits/wrpll-cln28hpc.c
@@ -28,6 +28,7 @@
 #include <linux/math64.h>
 #include <linux/math.h>
 #include <linux/minmax.h>
+#include <linux/module.h>
 
 #include <linux/clk/analogbits-wrpll-cln28hpc.h>
 
@@ -312,6 +313,7 @@ int wrpll_configure_for_rate(struct wrpll_cfg *c, u32 target_rate,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(wrpll_configure_for_rate);
 
 /**
  * wrpll_calc_output_rate() - calculate the PLL's target output rate
@@ -349,6 +351,7 @@ unsigned long wrpll_calc_output_rate(const struct wrpll_cfg *c,
 
 	return n;
 }
+EXPORT_SYMBOL_GPL(wrpll_calc_output_rate);
 
 /**
  * wrpll_calc_max_lock_us() - return the time for the PLL to lock
@@ -366,3 +369,6 @@ unsigned int wrpll_calc_max_lock_us(const struct wrpll_cfg *c)
 {
 	return MAX_LOCK_US;
 }
+EXPORT_SYMBOL_GPL(wrpll_calc_max_lock_us);
+
+MODULE_LICENSE("GPL");
-- 
2.40.1


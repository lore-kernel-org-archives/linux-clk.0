Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E19C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 18 Oct 2022 16:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbiJRQED (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Oct 2022 12:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbiJRQEC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Oct 2022 12:04:02 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ADF89C2FD
        for <linux-clk@vger.kernel.org>; Tue, 18 Oct 2022 09:03:57 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id u21so21162951edi.9
        for <linux-clk@vger.kernel.org>; Tue, 18 Oct 2022 09:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8JlbMErcGNycCCtodyD6GpAsyH/iGxyyMdZWiKDQlaU=;
        b=mxSI9U6ANwBzyr2DzsUzEZ5jHidPM/I7Z91CgyqWEgjleLppoOBKuSA3cHaE6L7Vki
         UrFxXOXbRGPO6Fj91mhIQOqLC7PRzKhDFMUX6/7XYewOA17AIyLTwyxRRLEe5rB55XXk
         9WHTSp6t0S0SQRb4u99G6OnjP7E70rJxF+Kns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JlbMErcGNycCCtodyD6GpAsyH/iGxyyMdZWiKDQlaU=;
        b=zGkYqRg07S9TdOytnkBeqnil4HiF4aXRp0rg7mgkYm4492xngdApowBGdj6IOBUitw
         Q2nQmhFdv3VFTDd4jIIFLcPMgkYg+gt7tmPbyxA185PQZjK2C9en/KBAjs26A4xLz/fj
         sVcYB30Tvry4pBGhvYhCO8D7sN+eTIcKmqgygqWQw1MRCol+lYLJ+w4yIfqLXIjAhWmp
         /myPyRm7o3GIzXQ6Xz+pFpSSjZPujcItuIYVt15LkH4N8K4klXh5rOe4q4jIXkftSovj
         J9Xl3PIYwri9jOIdX7Zdg0HBKpudC2XPcrGwnLaJLnOL41DVw48Q4b1n0/AUHoRIDsgt
         HGMw==
X-Gm-Message-State: ACrzQf3zdwkpgKOjdRExFiw3XhS6Kb3fsXKlfcAmJv8vKZxlhuc6krMO
        y/3coHAdVwXp6QpuReTuL6et0w==
X-Google-Smtp-Source: AMsMyM6xjsmr9XJ9txggMYCY5z0x99O51/w/iMiWSELcLeiATsV4UQaetsN4klbWvJZEOp88XURIMQ==
X-Received: by 2002:a05:6402:34cd:b0:45d:a345:764 with SMTP id w13-20020a05640234cd00b0045da3450764mr3286646edc.415.1666109035532;
        Tue, 18 Oct 2022 09:03:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-95-244-101-110.retail.telecomitalia.it. [95.244.101.110])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090623ea00b007919ba4295esm1166014ejg.216.2022.10.18.09.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 09:03:54 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Amarula patchwork <linux-amarula@amarulasolutions.com>,
        michael@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        kernel test robot <lkp@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Miaoqian Lin <linmq006@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v2] clk: ti: dra7-atl: don't allocate `parent_names' variable
Date:   Tue, 18 Oct 2022 18:03:52 +0200
Message-Id: <20221018160352.1591428-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The `parent_names' variable was freed also in case of kzalloc() error.
Instead of modifying the code to perform a proper memory release, I
decided to fix the bug by not allocating memory.
Since only one parent name is referenced, it is not necessary to
allocate this variable at runtime and therefore you can avoid calling
the kzalloc() function. This simplifies the code (even calls to kfree
can be removed) and improves the performance of the routine.

Note: Although no operation is performed by kfree() on a NULL pointer,
it was however suboptimal and semantically wrong doing it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reported-by: kernel test robot <lkp@intel.com>

---

Changes in v2:
- Fix compiling error
- Add kernel test robot's Reported-by tag.

 drivers/clk/ti/clk-dra7-atl.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
index ff4d6a951681..78482d1a4a33 100644
--- a/drivers/clk/ti/clk-dra7-atl.c
+++ b/drivers/clk/ti/clk-dra7-atl.c
@@ -164,7 +164,7 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
 {
 	struct dra7_atl_desc *clk_hw = NULL;
 	struct clk_init_data init = { NULL };
-	const char **parent_names = NULL;
+	const char *parent_names[1];
 	const char *name;
 	struct clk *clk;
 
@@ -188,24 +188,17 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
 		goto cleanup;
 	}
 
-	parent_names = kzalloc(sizeof(char *), GFP_KERNEL);
-
-	if (!parent_names)
-		goto cleanup;
-
 	parent_names[0] = of_clk_get_parent_name(node, 0);
 
 	init.parent_names = parent_names;
 
 	clk = ti_clk_register(NULL, &clk_hw->hw, name);
-
 	if (!IS_ERR(clk)) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
-		kfree(parent_names);
 		return;
 	}
+
 cleanup:
-	kfree(parent_names);
 	kfree(clk_hw);
 }
 CLK_OF_DECLARE(dra7_atl_clock, "ti,dra7-atl-clock", of_dra7_atl_clock_setup);
-- 
2.32.0


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87541C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 17 Oct 2022 16:50:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiJQQug (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Oct 2022 12:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiJQQue (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Oct 2022 12:50:34 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE0D5A825
        for <linux-clk@vger.kernel.org>; Mon, 17 Oct 2022 09:50:33 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id k2so26317234ejr.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Oct 2022 09:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=drbnWG6FnPMKy+1KjZWfuBI6Wm/8lttgnizdA5I4wh0=;
        b=KuVlSmIb+mR5CV6eITXFG6u2+ges8sQgbxnm+3vT1lBOjzQyKbr7eP/m0ySlkX1gPv
         yqRF3Zo8/T7hNqNhLfcWvnEEoYlhY4e6I+bT2Mfh1zGb5qHdQs9PpcpjOrF/mLdw3YtZ
         4R153dfRrrKX3ZgPrqYnNF/NRVzUiyp09gv7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drbnWG6FnPMKy+1KjZWfuBI6Wm/8lttgnizdA5I4wh0=;
        b=gaGS1AP7nhkrtIxMdqpdiXJAy2xTkCNSbYf8fjQhKV9j5Qz1aVqPjkj9xB+GdvZzUI
         V7vQviea91O0KwrpP2NvjqGNBOKU5t+r3H2jRB4Cac2N1uvr87knSxub/Jfmwoe7zPcq
         IC4Dw10cWjqBUZSG/30SZtFmoiNO87TerYgOxNvrvgumDLZaeArPuMS7phoq8/ZsHPHb
         TuZyObBYYbG2vQ/md7T3KpULEme44EV0h8bDxqu7wCJnAEGNzCWejNi3JYO345sJhLSt
         MJZ1vZ8lD1Jimqefl6T+FGImrOsgfjZrEnG6n54hisRRbcaRHpDL4XJjH0UvuEEg8b6Y
         5YTA==
X-Gm-Message-State: ACrzQf0WyatrBn8jgfSXfMe0vtWQidBUDFov2nLdE3wbVQyJTtlVK45Z
        lUD3vwRDYpIzbIq/65/ycf/mHTSTH0nzMw==
X-Google-Smtp-Source: AMsMyM4GZiprC1PluXKiH0yH3vdFd+AeS3g/ZUhBCEiazBbo/4ME6PSXDI3ILqtbg7C+DWfkoNbZRw==
X-Received: by 2002:a17:907:2d1e:b0:78e:2c3b:559f with SMTP id gs30-20020a1709072d1e00b0078e2c3b559fmr9375041ejc.435.1666025431720;
        Mon, 17 Oct 2022 09:50:31 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-95-244-101-110.retail.telecomitalia.it. [95.244.101.110])
        by smtp.gmail.com with ESMTPSA id o7-20020a170906774700b0077086d2db8esm6473027ejn.140.2022.10.17.09.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 09:50:31 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     michael@amarulasolutions.com,
        Amarula patchwork <linux-amarula@amarulasolutions.com>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Allison Randal <allison@lohutok.net>,
        Miaoqian Lin <linmq006@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH] clk: ti: dra7-atl: don't allocate `parent_names' variable
Date:   Mon, 17 Oct 2022 18:50:28 +0200
Message-Id: <20221017165028.4194254-1-dario.binacchi@amarulasolutions.com>
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

---

 drivers/clk/ti/clk-dra7-atl.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
index ff4d6a951681..ec2473069143 100644
--- a/drivers/clk/ti/clk-dra7-atl.c
+++ b/drivers/clk/ti/clk-dra7-atl.c
@@ -164,7 +164,6 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
 {
 	struct dra7_atl_desc *clk_hw = NULL;
 	struct clk_init_data init = { NULL };
-	const char **parent_names = NULL;
 	const char *name;
 	struct clk *clk;
 
@@ -188,24 +187,15 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
 		goto cleanup;
 	}
 
-	parent_names = kzalloc(sizeof(char *), GFP_KERNEL);
-
-	if (!parent_names)
-		goto cleanup;
-
-	parent_names[0] = of_clk_get_parent_name(node, 0);
-
-	init.parent_names = parent_names;
+	init.parent_names = of_clk_get_parent_name(node, 0);
 
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


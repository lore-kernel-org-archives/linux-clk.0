Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45AAC43219
	for <linux-clk@archiver.kernel.org>; Sun,  6 Nov 2022 15:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbiKFPqU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 6 Nov 2022 10:46:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbiKFPqT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 6 Nov 2022 10:46:19 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB4F5D2FA
        for <linux-clk@vger.kernel.org>; Sun,  6 Nov 2022 07:46:18 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id a67so14070384edf.12
        for <linux-clk@vger.kernel.org>; Sun, 06 Nov 2022 07:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ke2ic1RycAYFmZzx9qb25pQPIAwiVR4I1nr3ghBSQyY=;
        b=ho8JqqapmwSd/RDkOkzpd8Jf/NHJqLUPMSZDjD/nKHvZyPLAr5SgVpldkBoqFvTwmz
         vHE6Nh/0pvRNYSredu41wnwnfFcib3U6Ui92jSPD+TD9uAESTgvwUL438Jo2nMAvocaI
         Yw/TUUtfGb3bYpOuMJLLCgHfXLiFyykCXX06s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ke2ic1RycAYFmZzx9qb25pQPIAwiVR4I1nr3ghBSQyY=;
        b=XRJzauMGg40jpizbFDeXgV32DjB1y7V7Qa8WiDnRSwrZAbQIRWC4yuVKaZfxMe3yMG
         lMvCwVmzcaGKNkXbWhn7wGjjAil3XkTwFd8V5KYdRVwWmSIANl9IszHkFXBYZZM3rgdk
         NBDSY7tYBsaPu9B+6B45KsFQNLI5fvNd7OkWo+FjP8/eIZjOWr6wcJ8OdPWdPeQKs55y
         DKKlJB1m+ODCHuMTi5m2KFVUETE2i1D6938l+HjJmR2hXx90xefcnoNeCNxoMbm/L0VD
         /eX/mW5USaMFTOZK3MEf0LrGw3y9Uj+CudISRUk7P7pGcztLsaleRTvwp5Jr1MnLoC7E
         yP5Q==
X-Gm-Message-State: ACrzQf1eNGosC5L3EFFaDOLkcPnN1fLyc5dXXBQLvtA2+Ztv3pZVS/gX
        Hakghw9V84pLJgITrzAGMors7g==
X-Google-Smtp-Source: AMsMyM7Fojj9tQ1Vg6SAV/BahHigNrkLt1mUXfs2cA+8chM+Ve7RAbOW+voDxQ6s9lIcn9lSmPUs9w==
X-Received: by 2002:a05:6402:1382:b0:464:1e50:1a41 with SMTP id b2-20020a056402138200b004641e501a41mr20978094edv.245.1667749577399;
        Sun, 06 Nov 2022 07:46:17 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-95-232-76-31.retail.telecomitalia.it. [95.232.76.31])
        by smtp.gmail.com with ESMTPSA id kz20-20020a17090777d400b00772061034dbsm2204139ejc.182.2022.11.06.07.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 07:46:17 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     michael@amarulasolutions.com,
        Amarula patchwork <linux-amarula@amarulasolutions.com>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        kernel test robot <lkp@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v3 2/2] clk: ti: dra7-atl: don't allocate `parent_names' variable
Date:   Sun,  6 Nov 2022 16:46:12 +0100
Message-Id: <20221106154612.3474940-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221106154612.3474940-1-dario.binacchi@amarulasolutions.com>
References: <20221106154612.3474940-1-dario.binacchi@amarulasolutions.com>
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reported-by: kernel test robot <lkp@intel.com>

---

Changes in v3:
- Add the "clk: ti: add of_ti_clk_register() helper" patch to the series.
- Use a variable of type struct clk_parent_data to furthermore simplify
  the code.
- Update the commit message.

Changes in v2:
- Fix compiling error
- Add kernel test robot's Reported-by tag.

 drivers/clk/ti/clk-dra7-atl.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
index ff4d6a951681..373561626ec4 100644
--- a/drivers/clk/ti/clk-dra7-atl.c
+++ b/drivers/clk/ti/clk-dra7-atl.c
@@ -163,8 +163,8 @@ static const struct clk_ops atl_clk_ops = {
 static void __init of_dra7_atl_clock_setup(struct device_node *node)
 {
 	struct dra7_atl_desc *clk_hw = NULL;
+	struct clk_parent_data pdata = { .index = 0 };
 	struct clk_init_data init = { NULL };
-	const char **parent_names = NULL;
 	const char *name;
 	struct clk *clk;
 
@@ -188,24 +188,15 @@ static void __init of_dra7_atl_clock_setup(struct device_node *node)
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
-
-	clk = ti_clk_register(NULL, &clk_hw->hw, name);
+	init.parent_data = &pdata;
 
+	clk = of_ti_clk_register(node, &clk_hw->hw, name);
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


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3460BC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 14:19:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A5B960EE3
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 14:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbhINOVA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 10:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233300AbhINOU7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Sep 2021 10:20:59 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391B3C061762
        for <linux-clk@vger.kernel.org>; Tue, 14 Sep 2021 07:19:42 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i4so12053701lfv.4
        for <linux-clk@vger.kernel.org>; Tue, 14 Sep 2021 07:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O3O9pavUsvQaLCKu2O/WDZy+zRAT00QZp8f3df/2+6A=;
        b=wtfNHMPFTgr2cSQCGaxAiqSluRILESAr0akFI2FMy2CE5T5/m00/8Tt9QvoGG9jZlG
         GbUOksYsG43MpfPEhF+ONVxgXCjjDsF8LFMgkhAr4orncRFcpYX3/talgQH0NppPFPGi
         NWh1hW6dFU+tMYZnSDN5CA5/E3iZV3CJf6Q5bXqwX3Oi28Hi6Wxri+DiTzck028maU4g
         UTHtiVzb2YyDs68NmeQcJNRPZP5Rj2OH9E9F6lZ5sut7g02tNbQlj3VZW7Fu0OwD4Lwq
         SBf5bL6cCMSlWyZKml66kHd/W+kCI+ROceAodq/pCBuZ/4Xk535IDZf4m5fd/4FA0Iv3
         IXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O3O9pavUsvQaLCKu2O/WDZy+zRAT00QZp8f3df/2+6A=;
        b=nePMS4dL6k4n33t7ClQ/LSWwCCWLv7GH5VLsQecASNmbLcKm20zc1+Wrhc7DBWjN9Q
         DU3eWCE/g0MmTNy/tRfzzV77eJ8IOSpP3npE0KChLcTVxgr4G8JIXAs2CQEI1uH4S6ni
         vFN4cL8v2+/z7pyXQxk2tXmTcpuTvm2X5p1EcHrKeZYPj/LWu1SKJDdDjcIrNBDiHneD
         qELPKBm1el8jnJGi8LYr4HBa2toVKias2gDfi47OA71Aks9AsI7O3lsoHqXAwvq5fYee
         SuRUR4EpYSLgJJM8d7JbPWJEw1DQSjnvQCty3SjNQMWVolwKdCLzW3+0sWkmTQIKB9cW
         8fRw==
X-Gm-Message-State: AOAM531Bcx4I9imR2e+MCftbDz88jIu2B8TMDXIlstjtfDhcDQupo4ms
        U1q7ao9WGnajMYwkKS7tY1DvNA==
X-Google-Smtp-Source: ABdhPJyHiPdnmDcScme8ggB6SkefTDo8MUhZKW5sX1Hp/YsLNMy6sUP5QRMrbmWMSX/bANnfJnU+SA==
X-Received: by 2002:a05:6512:2e8:: with SMTP id m8mr7230911lfq.172.1631629180511;
        Tue, 14 Sep 2021 07:19:40 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id b17sm1345309ljj.35.2021.09.14.07.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 07:19:40 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: Add clk_set_parent debugfs node
Date:   Tue, 14 Sep 2021 17:19:39 +0300
Message-Id: <20210914141939.26410-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Useful for testing mux clocks. One can write the index of the parent to
set into clk_set_parent node, starting from 0. Example

    # cat clk_possible_parrents
      dout_shared0_div4 dout_shared1_div4
    # cat clk_parent
      dout_shared0_div4
    # echo 1 > clk_set_parent
    # cat clk_parent
      dout_shared1_div4

Define CLOCK_ALLOW_WRITE_DEBUGFS in drivers/clk/clk.c in order to use
this feature.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/clk.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 65508eb89ec9..3e5456580db9 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3214,6 +3214,30 @@ static int current_parent_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(current_parent);
 
+#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
+static int clk_set_parent_set(void *data, u64 val)
+{
+	struct clk_core *core = data, *parent;
+	int ret;
+
+	if (val >= core->num_parents)
+		return -EINVAL;
+
+	parent = clk_core_get_parent_by_index(core, val);
+	if (IS_ERR_OR_NULL(parent))
+		return PTR_ERR(parent);
+
+	clk_prepare_lock();
+	ret = clk_core_set_parent_nolock(core, parent);
+	clk_prepare_unlock();
+
+	return ret;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(clk_set_parent_fops, NULL, clk_set_parent_set,
+			 "%llu\n");
+#endif
+
 static int clk_duty_cycle_show(struct seq_file *s, void *data)
 {
 	struct clk_core *core = s->private;
@@ -3285,9 +3309,14 @@ static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 		debugfs_create_file("clk_parent", 0444, root, core,
 				    &current_parent_fops);
 
-	if (core->num_parents > 1)
+	if (core->num_parents > 1) {
 		debugfs_create_file("clk_possible_parents", 0444, root, core,
 				    &possible_parents_fops);
+#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
+		debugfs_create_file("clk_set_parent", 0200, root, core,
+				    &clk_set_parent_fops);
+#endif
+	}
 
 	if (core->ops->debug_init)
 		core->ops->debug_init(core->hw, core->dentry);
-- 
2.30.2


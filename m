Return-Path: <SRS0=h94J=AL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22319C433E0
	for <linux-clk@archiver.kernel.org>; Tue, 30 Jun 2020 00:30:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0FE3206A5
	for <linux-clk@archiver.kernel.org>; Tue, 30 Jun 2020 00:30:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="St9D+ElZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728420AbgF3Aaw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Jun 2020 20:30:52 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:21557 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727842AbgF3Aaw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Jun 2020 20:30:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593477051; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=YGZplpevsAJGqU+ves7XOl3Kq4U+OLQbZO9OWSW49L4=; b=St9D+ElZR6BCHu5jGd8WEPS4VpduJ8Dh6rTDJeOp8xlK7Kg8nH6SNSAPA+PBU0xcDIp7qGRV
 RElwJBZE0QvyVRSU3NgcamUZeEA1mi1y3yxA+pv7Yi/bUy0CJoM7uFreJ/HSY49lAJlTNxy/
 K0Dyyw60VnO4UjZ+6cjiLakrQsE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5efa87baa6e154319f357ad4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Jun 2020 00:30:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A2745C433AD; Tue, 30 Jun 2020 00:30:49 +0000 (UTC)
Received: from mdtipton-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mdtipton)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F111FC433C6;
        Tue, 30 Jun 2020 00:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F111FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mdtipton@codeaurora.org
From:   Mike Tipton <mdtipton@codeaurora.org>
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        tdas@codeaurora.org, Mike Tipton <mdtipton@codeaurora.org>
Subject: [PATCH] clk: Add support for enabling/disabling clocks from debugfs
Date:   Mon, 29 Jun 2020 17:30:24 -0700
Message-Id: <20200630003024.6282-1-mdtipton@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

For test and debug purposes, it's often necessary to enable or disable
clocks from shell. Add a new debugfs file (clk_prepare_enable) that
calls clk_prepare_enable() when writing "1" and clk_disable_unprepare()
when writing "0".

This can have security implications, so only support it when the code
has been modified to #define CLOCK_ALLOW_WRITE_DEBUGS.

Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
---
 drivers/clk/clk.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 236923b25543..3640bbc56870 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3034,13 +3034,14 @@ static int clk_dump_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(clk_dump);
 
-#undef CLOCK_ALLOW_WRITE_DEBUGFS
-#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
 /*
- * This can be dangerous, therefore don't provide any real compile time
- * configuration option for this feature.
+ * These features can be dangerous, therefore don't provide any real compile
+ * time configuration option for them.
  * People who want to use this will need to modify the source code directly.
  */
+#undef CLOCK_ALLOW_WRITE_DEBUGFS
+#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
+
 static int clk_rate_set(void *data, u64 val)
 {
 	struct clk_core *core = data;
@@ -3054,6 +3055,31 @@ static int clk_rate_set(void *data, u64 val)
 }
 
 #define clk_rate_mode	0644
+
+static int clk_prepare_enable_set(void *data, u64 val)
+{
+	struct clk_core *core = data;
+	int ret = 0;
+
+	if (val)
+		ret = clk_prepare_enable(core->hw->clk);
+	else
+		clk_disable_unprepare(core->hw->clk);
+
+	return ret;
+}
+
+static int clk_prepare_enable_get(void *data, u64 *val)
+{
+	struct clk_core *core = data;
+
+	*val = core->enable_count && core->prepare_count;
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(clk_prepare_enable_fops, clk_prepare_enable_get,
+			 clk_prepare_enable_set, "%llu\n");
+
 #else
 #define clk_rate_set	NULL
 #define clk_rate_mode	0444
@@ -3231,6 +3257,10 @@ static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 	debugfs_create_u32("clk_notifier_count", 0444, root, &core->notifier_count);
 	debugfs_create_file("clk_duty_cycle", 0444, root, core,
 			    &clk_duty_cycle_fops);
+#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
+	debugfs_create_file("clk_prepare_enable", 0644, root, core,
+			    &clk_prepare_enable_fops);
+#endif
 
 	if (core->num_parents > 0)
 		debugfs_create_file("clk_parent", 0444, root, core,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


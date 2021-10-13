Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCE3C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 17:20:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A60261040
	for <linux-clk@archiver.kernel.org>; Wed, 13 Oct 2021 17:20:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237477AbhJMRWt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Oct 2021 13:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235412AbhJMRWt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Oct 2021 13:22:49 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D1CC061746
        for <linux-clk@vger.kernel.org>; Wed, 13 Oct 2021 10:20:45 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i24so14431351lfj.13
        for <linux-clk@vger.kernel.org>; Wed, 13 Oct 2021 10:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4zZUExOF0hyjkUuayvESFrp0hpOC5bsezzAMG365TXc=;
        b=jVHe5if0odQ3h3gs6Lq/533GPpFM71VvqJKxpmxEyuRr/I2s4Rvysokvg9L+KV3dn3
         jRKt3VHl/ZpEYDkM/BH/iek34kzKyj4veqxzh8fQGB17xK/+O3hgNFd0wfiFi8GJFL8O
         XGKIWscpPGckGAX2Xs2zotyUIBtmLVnQQZxEHyl7jUZCT2eoumnG9hdqBAbXwcV9VkC7
         YVsKq97QPiDiZSw+I05pO7hVnS5lfOb4LpMGX3WBNKgTvYqcquezqMk82nwjo1T41Nwt
         1fuMFta0MEDU+HsQuN1GGsxD+iaSbNXX+P38mduPvBswEpDmrnRsnBKN0spRJLnFFzf2
         iqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4zZUExOF0hyjkUuayvESFrp0hpOC5bsezzAMG365TXc=;
        b=wNHf+LeQFj5mYy19+dofcs0IBRDmSNEn1SYOGhk0a3FujRgu/W1QIEUDaumt4wkMdU
         fWbVQ/0U2vCa1VWR+F7ghIp4kh108OEEg4gENNVFd/Y9bmuvdNitpxdtgJdBnfV6411u
         YG1N9J/v3AKfIHK//zUzocDhzHaxQUk9yvSNAA6fYtfUqA3shtuZ8ZmlZ3BK46T2ZDU8
         D2XIBVX2aMmnEKBE+9Ln/ajrh63AiusAOYMBsihCj2XOrUezxNl5ZwGbOquhhK1CMKXF
         FND5+q1tGo/TpBIq8us3a5ST9gI0zTQ6HasmbeAebSERgEv0Lp1/57HTfEYH/1Y7NIsO
         URGQ==
X-Gm-Message-State: AOAM532KnmNvaUKUZ9YWpE2UmWoQL3B0OoTCyv54ePKhiqtsJ81qxuuM
        VfOjCV4weAWtQQW+pwBGYpz1xw==
X-Google-Smtp-Source: ABdhPJwG8jkIxBjdv4FCfNEF54htx9eOR1dcNl/kyZV/O8USH10MekCsQswhdunIml07aX7jFJEXlA==
X-Received: by 2002:a05:651c:1693:: with SMTP id bd19mr613631ljb.409.1634145643483;
        Wed, 13 Oct 2021 10:20:43 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id c3sm13525ljh.58.2021.10.13.10.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 10:20:43 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mike Tipton <mdtipton@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6] clk: Add write operation for clk_parent debugfs node
Date:   Wed, 13 Oct 2021 20:20:42 +0300
Message-Id: <20211013172042.10884-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Useful for testing mux clocks. One can write the index of the parent to
be set into clk_parent node, starting from 0. Example

    # cd /sys/kernel/debug/clk/mout_peri_bus
    # cat clk_possible_parents
      dout_shared0_div4 dout_shared1_div4
    # cat clk_parent
      dout_shared0_div4
    # echo 1 > clk_parent
    # cat clk_parent
      dout_shared1_div4

CLOCK_ALLOW_WRITE_DEBUGFS has to be defined in drivers/clk/clk.c in
order to use this feature.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes in v6:
  - Added R-b tag by Geert Uytterhoeven
  - Removed curly braces around 'else' block (now delta is minimal and
    the code looks better)

Changes in v5:
  - Used kstrtou8_from_user() API
  - Got rid of code duplication
  - Fixed typo in commit message
  - Added R-b tag by Andy Shevchenko

Changes in v4:
  - Fixed the commit title

Changes in v3:
  - Removed unwanted changes added by mistake

Changes in v2:
  - Merged write() function into existing 'clk_parent' file
  - Removed 'if (val >= core->num_parents)' check
  - Removed incorrect usage of IS_ERR_OR_NULL()

 drivers/clk/clk.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 65508eb89ec9..bf1eadfeaee0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3214,6 +3214,42 @@ static int current_parent_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(current_parent);
 
+#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
+static ssize_t current_parent_write(struct file *file, const char __user *ubuf,
+				    size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct clk_core *core = s->private;
+	struct clk_core *parent;
+	u8 idx;
+	int err;
+
+	err = kstrtou8_from_user(ubuf, count, 0, &idx);
+	if (err < 0)
+		return err;
+
+	parent = clk_core_get_parent_by_index(core, idx);
+	if (!parent)
+		return -ENOENT;
+
+	clk_prepare_lock();
+	err = clk_core_set_parent_nolock(core, parent);
+	clk_prepare_unlock();
+	if (err)
+		return err;
+
+	return count;
+}
+
+static const struct file_operations current_parent_rw_fops = {
+	.open		= current_parent_open,
+	.write		= current_parent_write,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+#endif
+
 static int clk_duty_cycle_show(struct seq_file *s, void *data)
 {
 	struct clk_core *core = s->private;
@@ -3281,6 +3317,12 @@ static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 			    &clk_prepare_enable_fops);
 #endif
 
+#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
+	if (core->num_parents > 1)
+		debugfs_create_file("clk_parent", 0644, root, core,
+				    &current_parent_rw_fops);
+	else
+#endif
 	if (core->num_parents > 0)
 		debugfs_create_file("clk_parent", 0444, root, core,
 				    &current_parent_fops);
-- 
2.30.2


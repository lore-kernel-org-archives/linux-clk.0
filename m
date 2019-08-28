Return-Path: <SRS0=KEZg=WY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B792C3A5A1
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 10:20:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 705DA208CB
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 10:20:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iXoXKKVp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfH1KUc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Aug 2019 06:20:32 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35270 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbfH1KUc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Aug 2019 06:20:32 -0400
Received: by mail-wr1-f66.google.com with SMTP id g7so710942wrx.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2019 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vhUrL9mznbKbDwWt10f4mJGIdooAUf9Uhe1m9/Iutrw=;
        b=iXoXKKVpfVZQOKjhT3vzMvUGPd8S+FlwLWuYAabc4A2vOH8Fw1YYctz+lcT/aUlsMB
         gDIBhgg2LzhBN5I855AoE/Omjyg64lINze/sqC+hgWZFS3EVlJM3CovV62q5D4f70gSD
         DMgY7MRIr/CWOUEF+yDVODqMIiLyxLrl1x2dC055GN6eH4AXL/JCdpk5Mvwfnwf+0Xni
         79Yk15/UxpkcA/pt7jw6f82IrRZQXdNjKKnhf3DPKIVLlo9cuDS6SrHMouP97AJPryr1
         xMl6TzYzwOxD01fZFpMY5J3IyFov0ChQceU3mjAkikIlhBmV+MfZSBlXB4p0YjWGfUii
         dRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vhUrL9mznbKbDwWt10f4mJGIdooAUf9Uhe1m9/Iutrw=;
        b=TZ5RPUk+ogdfE2BLA0HFAX3tGropnvU3hgIUJrLws+LtNGM0MVYHefAMJlLno+VsvK
         nuX55QyM2rYvMgNwimLMW4ANe/IWBXR4N4hjOW9qoj4sR45MABCY/3ZdtDiugmwu6Ffi
         wtIuY+6+RpFMvXj7/QX3RGJKwAByGwmsUFMuolN18KNizp/Sdiez+k3Sm5MJ44kSYlwm
         8Wc7upyBw1gXxirp6Iid0cGTaGlhdxAa2eAtRjKRJpwB+tyhh/jjSX121g6ala+MJwJg
         kHOTm2G+Hg/37bGZrMY6iwN3MOg4rQbr6DLlEesDDfjdP15Su9abAH49VJ79LPcgmNhX
         JLOg==
X-Gm-Message-State: APjAAAUEuh4sWq7imhynkXZFSOah3BfjaW/olORWj5modS9R5vqUHY65
        8X8OCVMG48UlhASjP9RfgCglCw==
X-Google-Smtp-Source: APXvYqymGpHh/gsheS6NtTZqrLpy7ADw869X1AOQbTcA2ljSHC73cnXbo/RDYN9uF4OrkKEBFRq04g==
X-Received: by 2002:a5d:4b8c:: with SMTP id b12mr3937852wrt.26.1566987629931;
        Wed, 28 Aug 2019 03:20:29 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id k9sm2583522wrq.15.2019.08.28.03.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 03:20:29 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org
Subject: [PATCH RFC 3/5] clk: add terminate callback to clk_ops
Date:   Wed, 28 Aug 2019 12:20:10 +0200
Message-Id: <20190828102012.4493-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190828102012.4493-1-jbrunet@baylibre.com>
References: <20190828102012.4493-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a terminate callback to the clk_ops to release the resources
claimed in .init()

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c            | 7 ++++++-
 include/linux/clk-provider.h | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f1681555abdf..c703aa35ca37 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3828,6 +3828,7 @@ static const struct clk_ops clk_nodrv_ops = {
 void clk_unregister(struct clk *clk)
 {
 	unsigned long flags;
+	const struct clk_ops *ops;
 
 	if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
 		return;
@@ -3836,7 +3837,8 @@ void clk_unregister(struct clk *clk)
 
 	clk_prepare_lock();
 
-	if (clk->core->ops == &clk_nodrv_ops) {
+	ops = clk->core->ops;
+	if (ops == &clk_nodrv_ops) {
 		pr_err("%s: unregistered clock: %s\n", __func__,
 		       clk->core->name);
 		goto unlock;
@@ -3849,6 +3851,9 @@ void clk_unregister(struct clk *clk)
 	clk->core->ops = &clk_nodrv_ops;
 	clk_enable_unlock(flags);
 
+	if (ops->terminate)
+		ops->terminate(clk->core->hw);
+
 	if (!hlist_empty(&clk->core->children)) {
 		struct clk_core *child;
 		struct hlist_node *t;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index b82ec4c4ca95..5a5a64785923 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -197,6 +197,8 @@ struct clk_duty {
  *		such as rate or parents.
  *		Returns 0 on success, -EERROR otherwise.
  *
+ * @terminate:  Free any resource allocated by init.
+ *
  * @debug_init:	Set up type-specific debugfs entries for this clock.  This
  *		is called once, after the debugfs directory entry for this
  *		clock has been created.  The dentry pointer representing that
@@ -248,6 +250,7 @@ struct clk_ops {
 	int		(*set_duty_cycle)(struct clk_hw *hw,
 					  struct clk_duty *duty);
 	int		(*init)(struct clk_hw *hw);
+	void		(*terminate)(struct clk_hw *hw);
 	void		(*debug_init)(struct clk_hw *hw, struct dentry *dentry);
 };
 
-- 
2.21.0


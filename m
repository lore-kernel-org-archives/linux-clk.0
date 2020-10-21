Return-Path: <SRS0=09nf=D4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B073C55179
	for <linux-clk@archiver.kernel.org>; Wed, 21 Oct 2020 16:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9CD321D7B
	for <linux-clk@archiver.kernel.org>; Wed, 21 Oct 2020 16:38:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GEMLmHMc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503037AbgJUQi6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Oct 2020 12:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503029AbgJUQi4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Oct 2020 12:38:56 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9D1C0613CE
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2020 09:38:54 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id dn5so3199734edb.10
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2020 09:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ohk60Lc9axvVM7bujOFXofpFFhnugPw9JS+9Z6gwq/w=;
        b=GEMLmHMccDitjDiVntpcbZF4/ew82oBOAS/eJriDByqKp2mIvoV8csZuJ7ElVfET9c
         PcaD8VqWlzbIRSW7GeMKFmipRdrjfP9P5SkTvHYbvBqJNuLrh/fpgiCp6PuNPthlU6qb
         K+GSVliaw3BAKJrjsM8UPy1GTY3Ja1KGuxWg4+ir3SE6hlUH7Y3OUV7O0Rnyqdws/kU0
         vtjpHpbFYF9HcXDDD2n7+hrmmu3KE3i+LFQYFw3hae/6G7U3Md+xFv+3afEd1aBsC77v
         eL7fL6EIdwgZ6qg/5wHkXPLJhFsaXsxBUWI5rkrZTGJZYGy2N2izaxPvYtDFKUEVeKjs
         gc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ohk60Lc9axvVM7bujOFXofpFFhnugPw9JS+9Z6gwq/w=;
        b=K7ef0yuU2aFJiqhxPyWHeCCta9Wq9fgHHgmEOQCMdVzyyGfZUwuFqEK80HGKsWsrOu
         44G0Ao6w3Mjmqw+yhla+8lRKj6xXf3E8RFMffe90fb2NkHNE2HksiCHf4KOyoRROzqSM
         Zw/FR1OoXtYJLD3d1VugmYHXIHfkVXC6Hg7VUUGwkiQlcNP3hxN/yAOxSbqpzjvFIQP8
         PMKZ2ncm0wDCBV20LyctT1oFZaQ6Zw9mdnWpGvc1REdgxFq0+7I6enLZjWiaxocCwLnx
         H/o8Tb+hX2dOztZE7+bAmGKgEfui+OutNor0fLe1QrAMob3L7II9evEBVBnlNPZ20DbL
         /8mA==
X-Gm-Message-State: AOAM532sARrZC0IEVe1/CrSIr1+nPgpaAtH86mruMt8qUAjRgJFX/Djh
        mhquofS52ZOOjj5lgqndb9Ayu67PJCElQg==
X-Google-Smtp-Source: ABdhPJz/xI5mua9UlK4b08PjCq49mDh1kU1oEbpF6dQ0ewYrgkI8rTu2uFdxP/IyjaR8K1h8hzrHCA==
X-Received: by 2002:a05:6402:22e3:: with SMTP id dn3mr2970696edb.205.1603298333562;
        Wed, 21 Oct 2020 09:38:53 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id f26sm2549747ejx.23.2020.10.21.09.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 09:38:53 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] clk: add devm variant of clk_notifier_register
Date:   Wed, 21 Oct 2020 18:38:46 +0200
Message-Id: <20201021163847.595189-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201021163847.595189-1-jbrunet@baylibre.com>
References: <20201021163847.595189-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a memory managed variant of clk_notifier_register() to make life easier
on clock consumers using notifiers

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c   | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/clk.h | 10 ++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d27153f26fa9..e9fdd1d9b3f5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4395,6 +4395,42 @@ int clk_notifier_unregister(struct clk *clk, struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(clk_notifier_unregister);
 
+struct clk_notifier_devres {
+	struct clk *clk;
+	struct notifier_block *nb;
+};
+
+static void devm_clk_notifier_release(struct device *dev, void *res)
+{
+	struct clk_notifier_devres *devres = res;
+
+	clk_notifier_unregister(devres->clk, devres->nb);
+}
+
+int devm_clk_notifier_register(struct device *dev, struct clk *clk,
+			       struct notifier_block *nb)
+{
+	struct clk_notifier_devres *devres;
+	int ret;
+
+	devres = devres_alloc(devm_clk_notifier_release,
+			      sizeof(*devres), GFP_KERNEL);
+
+	if (!devres)
+		return -ENOMEM;
+
+	ret = clk_notifier_register(clk, nb);
+	if (!ret) {
+		devres->clk = clk;
+		devres->nb = nb;
+	} else {
+		devres_free(devres);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_clk_notifier_register);
+
 #ifdef CONFIG_OF
 static void clk_core_reparent_orphans(void)
 {
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 7fd6a1febcf4..79fb52f93053 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -109,6 +109,16 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb);
  */
 int clk_notifier_unregister(struct clk *clk, struct notifier_block *nb);
 
+/**
+ * devm_clk_notifier_register: register a managed rate-change notifier callback
+ * @dev: device for clock "consumer"
+ * @clk: clock whose rate we are interested in
+ * @nb: notifier block with callback function pointer
+ *
+ * Returns 0 on success, -EERROR otherwise
+ */
+int devm_clk_notifier_register(struct device *dev, struct clk *clk, struct notifier_block *nb);
+
 /**
  * clk_get_accuracy - obtain the clock accuracy in ppb (parts per billion)
  *		      for a clock source.
-- 
2.25.4


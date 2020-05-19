Return-Path: <SRS0=QrZd=7B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F66FC433DF
	for <linux-clk@archiver.kernel.org>; Tue, 19 May 2020 17:10:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C496207D3
	for <linux-clk@archiver.kernel.org>; Tue, 19 May 2020 17:10:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fqL0h3c2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729197AbgESRKH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 May 2020 13:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729132AbgESRKH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 May 2020 13:10:07 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53989C08C5C0
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2020 10:10:07 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id u1so4833wmn.3
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2020 10:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xs2DZn2lRCTad+sBiNc+BctIq4JOr+bWIH96SVwqx0c=;
        b=fqL0h3c2Xp2hoK5XrJG/CvNKsMpLGHx9LRNboyPqdPp9c/5mvU5A/y/Q8stJOThqjp
         keJv+36/P7d+MxJQZ4QYLzAw4eBJAAZg8lsHyPzcKnM9wgIhKZ/CMnK5ef/pC3Xzrp79
         Op1JvCnUuMY/QJIW/Av/ffefwKvq2w4hy1GQYdEadYCDLE7AG4YqBWAzbuEP5KboSWAB
         iIUo+FMMQ3iNkPdpgLHWgwlZHvZE/+cQjkn8YUznKN9v9Zk9uSXUss8rBHFGDD0XP4ER
         pGyxboWn5rpsi/O3glHXHYFEf5jSypil8wxw2WNBVbsf9HfvJ9jqp+4QQXWNOiuTWHGb
         d5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xs2DZn2lRCTad+sBiNc+BctIq4JOr+bWIH96SVwqx0c=;
        b=kmt1seATNfzhg4VM0rivnariLRUfufxJRMbvcwQKg83QgrD3uSQB2/RqArz7JS300l
         nT57WB3HZvgYmlb0Hw2ywSLMauzfgEvENCACYdLY+ag4mOircQ/0wH/wK92HDzru9Phy
         gAf4CZxNCZcwZJ391hXDnTurghbC6erQfsiLM6uUmuyjNjBb48W7ZzbWfkV6b1b47sm3
         /fbL/OFPovo8W9Ns/kNqDAaE0zFY+uNToxYTg1UU/k1DIjYqhf3Am3qV4zibMkjXgCjo
         mUp3hInRVm1Ja9Gt/adM04rYAaQJGcYt3Jb5vuj0hQY2SgoqGGZDMAXKjkdfR18oM0Wq
         TPFw==
X-Gm-Message-State: AOAM531ZpDn+GoMZ8vQ4N0hFG6CJaVe5JPiQUHqOnRlFJM1YcBWV3rwj
        bxSQRKobid+XCDYFYSKaRzg6ukUSG4g=
X-Google-Smtp-Source: ABdhPJxxGkSH456U4yFcE/ijxHPZM9/w0ZbpuYtWJa6tbyJ/6YaYlZNtNUfv2VH19pVYKoaRtWmTRg==
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr406894wmj.48.1589907886459;
        Tue, 19 May 2020 10:04:46 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id b19sm352685wmd.26.2020.05.19.10.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 10:04:45 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: add api to get clk consummer from clk_hw
Date:   Tue, 19 May 2020 19:04:40 +0200
Message-Id: <20200519170440.294601-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_register() is deprecated. Using 'clk' member of struct clk_hw is
discouraged. With this constrainst, it is difficult for driver to
register clocks using the clk_hw API and then use the clock with
the consummer API

This add a simple helper, clk_hw_get_clk(), to get a struct clk from
a struct clk_hw. Like other clk_get() variant, each call to this helper
must be balanced with a call to clk_put().

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c            | 17 +++++++++++++++++
 include/linux/clk-provider.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 6fd23ce3cb03..d9946e192cbc 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3625,6 +3625,23 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
 	return clk;
 }
 
+/**
+ * clk_hw_get_clk: get clk consummer given an clk_hw
+ * @hw: clk_hw associated with the clk being consumed
+ *
+ * Returns: new clk consummer
+ * This is the function to be used by providers which need
+ * to get a consummer clk and act on the clock element
+ * Calls to this function must be balanced with calls clk_put()
+ */
+struct clk *clk_hw_get_clk(struct clk_hw *hw)
+{
+	struct device *dev = hw->core->dev;
+
+	return clk_hw_create_clk(dev, hw, dev_name(dev), NULL);
+}
+EXPORT_SYMBOL(clk_hw_get_clk);
+
 static int clk_cpy_name(const char **dst_p, const char *src, bool must_exist)
 {
 	const char *dst;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index bd1ee9039558..a8f466bdda1a 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1088,6 +1088,7 @@ static inline struct clk_hw *__clk_get_hw(struct clk *clk)
 	return (struct clk_hw *)clk;
 }
 #endif
+struct clk *clk_hw_get_clk(struct clk_hw *hw);
 unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
-- 
2.25.4


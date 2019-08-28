Return-Path: <SRS0=KEZg=WY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEDFC3A5A1
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 10:20:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7132B208CB
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 10:20:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nz9YOFTH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfH1KUe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Aug 2019 06:20:34 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33267 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbfH1KUe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Aug 2019 06:20:34 -0400
Received: by mail-wm1-f67.google.com with SMTP id r17so1405588wme.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2019 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6JeaLNeVGrpuHN5qsBgIMkLYYfes0jmN0ZtXw6fwOes=;
        b=nz9YOFTHuLEuNhg3oUswqY6pvpI9zxc6DcSagdaPjBOq57tbhDBjmoHJGYYBSCYG3I
         EUJ7VnkSE0KxM6IxWH7qPVax8gGw5dwAnKAGBnEhUx8S7LNWQ7N5FBQLS3zESL4D1SKz
         XaNW3tcDOmIK+ecLzUdBeLhIhNSW+ydLNbe4C6Xa/CDppY4ttXX2t7F4tO7UcfBYhvs5
         V2bwsnkLiS2xRBc81lYaug4WlVRBt+Ulu+S92EpiWFrqahRcyItzQ/dZhgDvKaiaajIq
         kpW1eFk9GkiB4fG/AWfnBl4OXcWNKstlciwM7wmLsOplh8ehJ/hXh6M2L/h8hF+CvZni
         eqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6JeaLNeVGrpuHN5qsBgIMkLYYfes0jmN0ZtXw6fwOes=;
        b=HhjWS5nU/9RIy8SeH0jG4lmK7kFKGF1X0C3l3cr/PKu/yUWDV2pVFk/EsWeyiigHMw
         XSjak+MKmxbHX/yIdISTL2tprPOPsJk609bswVKAU5WxalpzDalhMAvD15dK4F64YPKZ
         th7Ut2icxgZzhkgQZ02OWs7IO+56xDdDJL40nixlCF/y+haLlTLneam+yAoig1KRlY3Y
         j9vJtNncsbF3ZS2jyCPLT7R3wmawtFD0Gl/LXif+2oXLys76z5AaWSjafxGepSqThpOI
         zng9f1coNDPX9VEyRUtLilJ/DUHKQlLcbcjCKaSq1qpZZxfmhIV4tB7w4nKS2zOPh5LY
         tJOQ==
X-Gm-Message-State: APjAAAUiS2eEWolza4EtrawlKLs/ihMyiympeawPMbE+ZGJtq6ue7Ce7
        MUONLoLsv/ItLp6SVXR+lcuX0Q==
X-Google-Smtp-Source: APXvYqyXB9rxZ0YLPewHNzxplfYv4wfNKBitr/9KfvTSb/4ASnCP1ua/wRZMBT7b8XPoXtAaGzvNOA==
X-Received: by 2002:a7b:c157:: with SMTP id z23mr3904986wmi.104.1566987630841;
        Wed, 28 Aug 2019 03:20:30 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id k9sm2583522wrq.15.2019.08.28.03.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 03:20:30 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org
Subject: [PATCH RFC 4/5] clk: add placeholder for clock internal data
Date:   Wed, 28 Aug 2019 12:20:11 +0200
Message-Id: <20190828102012.4493-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190828102012.4493-1-jbrunet@baylibre.com>
References: <20190828102012.4493-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add placeholder in clock core to save per clock data.
Such placeholder could use for clock doing memory allocation in .init().
It may also be useful for the save/restore_context() callbacks.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c            | 13 +++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c703aa35ca37..aa77a2a98ea4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -83,6 +83,7 @@ struct clk_core {
 	struct hlist_node	debug_node;
 #endif
 	struct kref		ref;
+	void			*priv;
 };
 
 #define CREATE_TRACE_POINTS
@@ -281,6 +282,18 @@ struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_parent);
 
+void clk_hw_set_data(const struct clk_hw *hw, void *data)
+{
+	hw->core->priv = data;
+}
+EXPORT_SYMBOL_GPL(clk_hw_set_data);
+
+void *clk_hw_get_data(const struct clk_hw *hw)
+{
+	return hw->core->priv;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_data);
+
 static struct clk_core *__clk_lookup_subtree(const char *name,
 					     struct clk_core *core)
 {
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 5a5a64785923..e54c165af021 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -821,6 +821,8 @@ static inline struct clk_hw *__clk_get_hw(struct clk *clk)
 	return (struct clk_hw *)clk;
 }
 #endif
+void clk_hw_set_data(const struct clk_hw *hw, void *data);
+void *clk_hw_get_data(const struct clk_hw *hw);
 unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
-- 
2.21.0


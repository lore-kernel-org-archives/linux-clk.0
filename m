Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698CAC04FDE
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 15:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiLIPa2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 10:30:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbiLIPa1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 10:30:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8FDE8F0BF
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 07:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670599764;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RUr5nGjxc+b90ljVLd9eIXOVWRTwlS2fejPnyUptxZ8=;
        b=HN+K2Hp7kJ2JMy8PaFwxmeFwxqgw6d1AjZDpXAQXCj2N1Y7uhcX/W/tH/v25Y56Wbn2HT4
        V+emfGOyJQUNyTRTGBsyQq9+i3o5Tx+u6TUGM4FloVsTcIDDEdbjjQNiZJVkb0DehTXI/X
        aKrfJumxwarmcE5hUeS+LZWixELviFU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-j0p17YWRP2G0mr7rpQnyOg-1; Fri, 09 Dec 2022 10:29:23 -0500
X-MC-Unique: j0p17YWRP2G0mr7rpQnyOg-1
Received: by mail-yb1-f200.google.com with SMTP id i10-20020a25f20a000000b006ea4f43c0ddso5351396ybe.21
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 07:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUr5nGjxc+b90ljVLd9eIXOVWRTwlS2fejPnyUptxZ8=;
        b=aEfzPJL4RindZAwL9VPPm6TebeheArGHKzmF3sTeqPjZ7VYB6ilYmKsLKsNA4sQTWb
         oQZIYMA/rgGxD9essKXAqiYzK1SZHypfjUfFsoHgtiV1bXi/sKlWo814uXlkcYmuG0cr
         jN5OGy3B/BH5jvKSfzS3akFcO1m3M677DBDxWZFCnbKcnU4UM6I2uuCrGWO8kXw+/daA
         0+F615QGb8TYv68XtF6oSbdgfbFe5RnvSBeePrkHVp7ljztHSsAOE1zzFIP+Hg8fs6Be
         1a7WQ+V/NgSTfEhWKx6RKZ7L+rtDbtSpEKz7TDp8DXrKW2Sd1ZnLR64g/oqzIRYsyc82
         redg==
X-Gm-Message-State: ANoB5pkl0huqSWhgcXVIrpqtbp42020MhY8GeZ3R2jo9BwbybteEqfBP
        ImQzM58tAJundZR/ADUcDCbbPMd1UWg+RamqQLDcpGrMzfprPTqn+kMWXROZ6JkOgbC6ZXhJFF3
        0RkdKGxPMPaCzPeooqCo=
X-Received: by 2002:a25:b943:0:b0:702:61d3:e1c7 with SMTP id s3-20020a25b943000000b0070261d3e1c7mr5582491ybm.16.1670599763166;
        Fri, 09 Dec 2022 07:29:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5MOTzDuvvF0acz3hXFcA35QT0x6Hsu7ZE46UCVYvG+2oKgWd/AIf2yB6AiYrkT7BbIK6k3dQ==
X-Received: by 2002:a25:b943:0:b0:702:61d3:e1c7 with SMTP id s3-20020a25b943000000b0070261d3e1c7mr5582469ybm.16.1670599762887;
        Fri, 09 Dec 2022 07:29:22 -0800 (PST)
Received: from klayman.redhat.com (net-2-34-28-158.cust.vodafonedsl.it. [2.34.28.158])
        by smtp.gmail.com with ESMTPSA id dt26-20020a05620a479a00b006fbf88667bcsm29484qkb.77.2022.12.09.07.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:29:22 -0800 (PST)
From:   Marco Pagani <marpagan@redhat.com>
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marco Pagani <marpagan@redhat.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] clk: socfpga: arria10: use of_clk_add_hw_provider and improve error handling
Date:   Fri,  9 Dec 2022 16:29:09 +0100
Message-Id: <20221209152913.1335068-3-marpagan@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209152913.1335068-1-marpagan@redhat.com>
References: <20221209152913.1335068-1-marpagan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The function of_clk_add_provider() has been deprecated, so use its
suggested replacement of_clk_add_hw_provider() instead.

Since of_clk_add_hw_provider() can fail, like of_clk_add_provider(),
check its return value and do the error handling.

The indentation of the init function parameters has been aligned
to match open parenthesis, as suggested by checkpatch, and the __init
macro moved before the function name, as specified in init.h.

Signed-off-by: Marco Pagani <marpagan@redhat.com>
---
 drivers/clk/socfpga/clk-periph-a10.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/socfpga/clk-periph-a10.c b/drivers/clk/socfpga/clk-periph-a10.c
index b9cdde4b8441..64cc70b970b7 100644
--- a/drivers/clk/socfpga/clk-periph-a10.c
+++ b/drivers/clk/socfpga/clk-periph-a10.c
@@ -57,8 +57,8 @@ static const struct clk_ops periclk_ops = {
 	.get_parent = clk_periclk_get_parent,
 };
 
-static __init void __socfpga_periph_init(struct device_node *node,
-	const struct clk_ops *ops)
+static void __init __socfpga_periph_init(struct device_node *node,
+					 const struct clk_ops *ops)
 {
 	u32 reg;
 	struct clk_hw *hw_clk;
@@ -106,21 +106,25 @@ static __init void __socfpga_periph_init(struct device_node *node,
 
 	hw_clk = &periph_clk->hw.hw;
 
-	if (clk_hw_register(NULL, hw_clk)) {
-		kfree(periph_clk);
-		return;
+	rc = clk_hw_register(NULL, hw_clk);
+	if (rc) {
+		pr_err("Could not register clock:%s\n", clk_name);
+		goto err_clk_hw_register;
 	}
-	rc = of_clk_add_provider(node, of_clk_src_simple_get, hw_clk);
-	if (rc < 0) {
+
+	rc = of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw_clk);
+	if (rc) {
 		pr_err("Could not register clock provider for node:%s\n",
 		       clk_name);
-		goto err_clk;
+		goto err_of_clk_add_hw_provider;
 	}
 
 	return;
 
-err_clk:
+err_of_clk_add_hw_provider:
 	clk_hw_unregister(hw_clk);
+err_clk_hw_register:
+	kfree(periph_clk);
 }
 
 void __init socfpga_a10_periph_init(struct device_node *node)
-- 
2.38.1


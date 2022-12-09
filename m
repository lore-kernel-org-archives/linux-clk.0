Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C1AC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 15:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbiLIPaw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 10:30:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbiLIPaf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 10:30:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260B1CE7
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 07:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670599774;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TnfSWneK8MGkHTJmldzwfHxM+WYStFYZRT9qyOXWyWc=;
        b=bqI9aiVDl+AB2DnpF9i/qEtQyOUTFjeM1cmyHZvw29Xv9kM/dLYaDeQHH8vkRiVvpmOQzj
        lHAJGyjf+fnrol11qRS4u9T5Q+NYvJ5cgHjD0Ya/z2aTdEtVqKr8S6FOS9cTsolP0XRzpG
        B5nR2DflIAkCRRGcxFlhgSosVgGawQY=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-211-uIDUXHkTNwaMDuRlXkE2uw-1; Fri, 09 Dec 2022 10:29:25 -0500
X-MC-Unique: uIDUXHkTNwaMDuRlXkE2uw-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-3b102317668so54199417b3.23
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 07:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnfSWneK8MGkHTJmldzwfHxM+WYStFYZRT9qyOXWyWc=;
        b=VrMINtlxKpiORAgkEdDQfSXl3z9ZcfIp8diJiVTAYAras+7dQ1crEEo5zF70ghAjfT
         MaENMrp4eY+itIbEK6JKUes3AcLyprj6OZE2kwVkxJEf5rHv2WMgW9M/GwfX9GT/IQj+
         bddSqOHfjwufE8QwqIppYl1PbmEsf2r6Mziu4k+e/UGohJj1RReko2S+GW3v+eYjRcSl
         GC2y1KxXV4O/0SrrkRl2P8Qqqvv4O+4eA8NA/L3dAOCfopaLizkeO5Ahz4VHMHjNxoeg
         2YhpYx5i+ZwfK9VWPTQvDRVf2tsms1fGIV7UTCG+UgLaumKzUDoNG92piBkPrK+42DP9
         FmDA==
X-Gm-Message-State: ANoB5pkoSikpQFvViZxo9u3xeWaKIHhIZGTAEGjeO0VE7t55ggdVKl/N
        4rD5sXZsr/JJrd+LE2aCB9bp6Gj2GOOmyXZgmI1m6UKqiAQjLxtN9DVz7xGwpNDM7fqNhlFrd1f
        Atq8MRqkjT+37FbTA6dQ=
X-Received: by 2002:a0d:db14:0:b0:369:942d:a53a with SMTP id d20-20020a0ddb14000000b00369942da53amr8672045ywe.24.1670599764996;
        Fri, 09 Dec 2022 07:29:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5JeaOR0EfyY6wPKPH/FTeHYYzcfDIr3yr/PW7r9pEn+HIxT/Holis14oc7KZyf68d2nCBYpw==
X-Received: by 2002:a0d:db14:0:b0:369:942d:a53a with SMTP id d20-20020a0ddb14000000b00369942da53amr8672022ywe.24.1670599764793;
        Fri, 09 Dec 2022 07:29:24 -0800 (PST)
Received: from klayman.redhat.com (net-2-34-28-158.cust.vodafonedsl.it. [2.34.28.158])
        by smtp.gmail.com with ESMTPSA id dt26-20020a05620a479a00b006fbf88667bcsm29484qkb.77.2022.12.09.07.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:29:24 -0800 (PST)
From:   Marco Pagani <marpagan@redhat.com>
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marco Pagani <marpagan@redhat.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] clk: socfpga: use of_clk_add_hw_provider and improve error handling
Date:   Fri,  9 Dec 2022 16:29:10 +0100
Message-Id: <20221209152913.1335068-4-marpagan@redhat.com>
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

The err variable unnecessarily duplicates the functionality of the
rc variable, so it has been removed.

Signed-off-by: Marco Pagani <marpagan@redhat.com>
---
 drivers/clk/socfpga/clk-gate.c | 35 +++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index 0c18c55edf8c..32ccda960f28 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -126,17 +126,14 @@ void __init socfpga_gate_init(struct device_node *node)
 	struct clk_init_data init;
 	struct clk_ops *ops;
 	int rc;
-	int err;
 
 	socfpga_clk = kzalloc(sizeof(*socfpga_clk), GFP_KERNEL);
 	if (WARN_ON(!socfpga_clk))
 		return;
 
 	ops = kmemdup(&gateclk_ops, sizeof(gateclk_ops), GFP_KERNEL);
-	if (WARN_ON(!ops)) {
-		kfree(socfpga_clk);
-		return;
-	}
+	if (WARN_ON(!ops))
+		goto err_kmemdup;
 
 	rc = of_property_read_u32_array(node, "clk-gate", clk_gate, 2);
 	if (rc)
@@ -182,13 +179,25 @@ void __init socfpga_gate_init(struct device_node *node)
 
 	hw_clk = &socfpga_clk->hw.hw;
 
-	err = clk_hw_register(NULL, hw_clk);
-	if (err) {
-		kfree(ops);
-		kfree(socfpga_clk);
-		return;
+	rc = clk_hw_register(NULL, hw_clk);
+	if (rc) {
+		pr_err("Could not register clock:%s\n", clk_name);
+		goto err_clk_hw_register;
 	}
-	rc = of_clk_add_provider(node, of_clk_src_simple_get, hw_clk);
-	if (WARN_ON(rc))
-		return;
+
+	rc = of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw_clk);
+	if (rc) {
+		pr_err("Could not register clock provider for node:%s\n",
+		       clk_name);
+		goto err_of_clk_add_hw_provider;
+	}
+
+	return;
+
+err_of_clk_add_hw_provider:
+	clk_hw_unregister(hw_clk);
+err_clk_hw_register:
+	kfree(ops);
+err_kmemdup:
+	kfree(socfpga_clk);
 }
-- 
2.38.1


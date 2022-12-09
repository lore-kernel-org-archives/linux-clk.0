Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6515EC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 15:30:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbiLIPab (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 10:30:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiLIPaa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 10:30:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4121F2C9
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 07:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670599763;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kBPZbzsz83JkmUujCQ8aIAfFvAeW6uUPjs+rv+f/Muo=;
        b=WloBNJWLoF1GTTYvEjln8rp/aBcYNX0DpItdY7HbK+REzv0dLFOZekrltDqmLIbEM1FUX/
        Zur/swzIJpx4Zlaq72OKypmIboxMkN31Ha5QAz1P8aoUeEm+4KQaRc71xOBF6/dmvZFyv9
        iGUsKnoIwaj8b7p2bAzZ3fSSDSI6VCM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-451-IpnALOkAPE6suWfstnVgLg-1; Fri, 09 Dec 2022 10:29:22 -0500
X-MC-Unique: IpnALOkAPE6suWfstnVgLg-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-3b4eb124be5so53621427b3.19
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 07:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBPZbzsz83JkmUujCQ8aIAfFvAeW6uUPjs+rv+f/Muo=;
        b=0Q9SPDmEbu8UzWZQPqQKczfLzPGS0495MO/iV5cpNR7dPYlpVFjAhaYM7Ghar5WlKP
         rfYgT2OyVLJiAbONvWol6bnxXxF3duO4rcoL9bwQLOAVf5BrJdbHSuBQ4/+cntpzGLg3
         9Q3rZ19VY5awsGXIGJQGdDim3oGTyQbV4G4tSa/6E4DPGtargiybais2Wr+0IMNFpx0O
         yKUKLST8miPqtyxUFr+HZI2cuANsku3bNEGn/aXumj4lUcCPtFTfI1tNAop/i94j4pZT
         LCjDKp/YK4/JAe5QOrltGjKz/u+wmoN/xIlpxbbt7Ab2hDZ35KjPDRekWqPgTmPNeN4W
         39gg==
X-Gm-Message-State: ANoB5plkRWXbbyTFA1kTnYJjUUMbflUUNWUDTUAkb6m+4xh0hv9HDS05
        dTWjHF+Z99uhG1AfClO9gTDK3BRuwNyOHW2/u8/72zJLSNyyFXfA0bSSjeJbDbyzw3SWrbXPs/o
        1/LvKwHdc5dVx07IS9SQ=
X-Received: by 2002:a25:5686:0:b0:70a:59ae:36ff with SMTP id k128-20020a255686000000b0070a59ae36ffmr8722596ybb.30.1670599761359;
        Fri, 09 Dec 2022 07:29:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6TPwDlYmGMeDa9q2sZerKMd6y8QUbQ8X3Mt0EEoZ1YwxEOk2JIXziIk2hEwywlYGIehhJh0A==
X-Received: by 2002:a25:5686:0:b0:70a:59ae:36ff with SMTP id k128-20020a255686000000b0070a59ae36ffmr8722568ybb.30.1670599761127;
        Fri, 09 Dec 2022 07:29:21 -0800 (PST)
Received: from klayman.redhat.com (net-2-34-28-158.cust.vodafonedsl.it. [2.34.28.158])
        by smtp.gmail.com with ESMTPSA id dt26-20020a05620a479a00b006fbf88667bcsm29484qkb.77.2022.12.09.07.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:29:20 -0800 (PST)
From:   Marco Pagani <marpagan@redhat.com>
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marco Pagani <marpagan@redhat.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] clk: socfpga: use of_clk_add_hw_provider and improve error handling
Date:   Fri,  9 Dec 2022 16:29:08 +0100
Message-Id: <20221209152913.1335068-2-marpagan@redhat.com>
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
 drivers/clk/socfpga/clk-periph.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/socfpga/clk-periph.c b/drivers/clk/socfpga/clk-periph.c
index 43707e2d7248..6a4075147b9c 100644
--- a/drivers/clk/socfpga/clk-periph.c
+++ b/drivers/clk/socfpga/clk-periph.c
@@ -47,8 +47,8 @@ static const struct clk_ops periclk_ops = {
 	.get_parent = clk_periclk_get_parent,
 };
 
-static __init void __socfpga_periph_init(struct device_node *node,
-	const struct clk_ops *ops)
+static void __init __socfpga_periph_init(struct device_node *node,
+					 const struct clk_ops *ops)
 {
 	u32 reg;
 	struct clk_hw *hw_clk;
@@ -96,11 +96,25 @@ static __init void __socfpga_periph_init(struct device_node *node,
 	periph_clk->hw.hw.init = &init;
 	hw_clk = &periph_clk->hw.hw;
 
-	if (clk_hw_register(NULL, hw_clk)) {
-		kfree(periph_clk);
-		return;
+	rc = clk_hw_register(NULL, hw_clk);
+	if (rc) {
+		pr_err("Could not register clock:%s\n", clk_name);
+		goto err_clk_hw_register;
+	}
+
+	rc = of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw_clk);
+	if (rc) {
+		pr_err("Could not register clock provider for node:%s\n",
+		       clk_name);
+		goto err_of_clk_add_hw_provider;
 	}
-	rc = of_clk_add_provider(node, of_clk_src_simple_get, hw_clk);
+
+	return;
+
+err_of_clk_add_hw_provider:
+	clk_hw_unregister(hw_clk);
+err_clk_hw_register:
+	kfree(periph_clk);
 }
 
 void __init socfpga_periph_init(struct device_node *node)
-- 
2.38.1


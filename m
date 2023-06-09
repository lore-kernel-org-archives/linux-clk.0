Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C131C7EE25
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 18:14:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjFISOZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jun 2023 14:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjFISOW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jun 2023 14:14:22 -0400
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BEFD3586;
        Fri,  9 Jun 2023 11:14:20 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-777ac791935so85734839f.2;
        Fri, 09 Jun 2023 11:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686334460; x=1688926460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUoI1otyq64V4OASVoH2qZ32EO4bebljBzF+Ld6+3L8=;
        b=d/1ff/qxrBfChgRlwPEHKtWAbRXGBRI5VudXfeJGwRscwnN/zGO4P6/v/JRAhMfvk6
         95JNXWQUreKajR2JugpIl/XhVYKK2W4Oik3blwh5oh9rRLeJ6U9MfUoHQfxOB+InROzP
         /RvrBFSMhiCyWLbMisJjV9G6uNlWHhiOyQOlXHhWN4piN12yG/Pl+mZ5PBSfnNOC4kmU
         90lMut8A+4alQc0/m0NiN1/E4g7QjHcMDope+ax5ZSHMA/cLat0o9mi6OISM8e/xKHeC
         lZVjBe8gYDuPcp/yloLmS0kW8/6Ff71RxmJt6gJnZVvIIlM6P0nMabUt6LCJfehOUI9D
         x2rg==
X-Gm-Message-State: AC+VfDwYiWluvl0ZUGlPjbC7xLk7DVVb4b2aGIxxhl+4SaOZnwnMn8Zd
        HNX5pXfinTaq85zQCjZMiQ==
X-Google-Smtp-Source: ACHHUZ7avp6M8UuFQ9TiyWiTQa1MXln3O/GpP7V72IkCtX4OMsKNx1Tat1zvWXXVbv5Ss/EtNsYBgQ==
X-Received: by 2002:a5e:df0b:0:b0:777:b4af:32a3 with SMTP id f11-20020a5edf0b000000b00777b4af32a3mr2346005ioq.14.1686334459878;
        Fri, 09 Jun 2023 11:14:19 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id l18-20020a02a892000000b0040f9af9237asm1114745jam.41.2023.06.09.11.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 11:14:19 -0700 (PDT)
Received: (nullmailer pid 1681135 invoked by uid 1000);
        Fri, 09 Jun 2023 18:14:15 -0000
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 09 Jun 2023 12:13:48 -0600
Subject: [PATCH v2 4/4] clk: mvebu: Use of_address_to_resource()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230327-mvebu-clk-fixes-v2-4-8333729ee45d@kernel.org>
References: <20230327-mvebu-clk-fixes-v2-0-8333729ee45d@kernel.org>
In-Reply-To: <20230327-mvebu-clk-fixes-v2-0-8333729ee45d@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
X-Mailer: b4 0.13-dev
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Replace of_get_property() and of_translate_address() calls with a single
call to of_address_to_resource().

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/clk/mvebu/armada_ap_cp_helper.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mvebu/armada_ap_cp_helper.c b/drivers/clk/mvebu/armada_ap_cp_helper.c
index 6a930f697ee5..e7005de66327 100644
--- a/drivers/clk/mvebu/armada_ap_cp_helper.c
+++ b/drivers/clk/mvebu/armada_ap_cp_helper.c
@@ -16,15 +16,13 @@
 char *ap_cp_unique_name(struct device *dev, struct device_node *np,
 			const char *name)
 {
-	const __be32 *reg;
-	u64 addr;
+	struct resource res;
 
 	/* Do not create a name if there is no clock */
 	if (!name)
 		return NULL;
 
-	reg = of_get_property(np, "reg", NULL);
-	addr = of_translate_address(np, reg);
+	of_address_to_resource(np, 0, &res);
 	return devm_kasprintf(dev, GFP_KERNEL, "%llx-%s",
-			      (unsigned long long)addr, name);
+			      (unsigned long long)res.start, name);
 }

-- 
2.39.2


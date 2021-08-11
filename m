Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED10FC4338F
	for <linux-clk@archiver.kernel.org>; Wed, 11 Aug 2021 07:57:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D182760F38
	for <linux-clk@archiver.kernel.org>; Wed, 11 Aug 2021 07:57:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233850AbhHKH5v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Aug 2021 03:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235359AbhHKH5u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Aug 2021 03:57:50 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3D3C061765
        for <linux-clk@vger.kernel.org>; Wed, 11 Aug 2021 00:57:26 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso3766288wmj.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Aug 2021 00:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qSEWeBg2Xdz/FSRxyq98HyVGJIOFHZHR7r9BtUhdcAI=;
        b=0LYm7fHP1Ie1EAxXtJY5bDFk6j3uh+LjSxz44wmFh26wZK0Cfkoq/PfyKD5Wu191SU
         nTLNhtsRLbjsHd/PdBSrhGSHc1chDez/ar80GI8XpO74G7J+vRbje+1nwqM87UwDBw8m
         ekKJ+8ZRkW89bdu5rZZkFYanW3VjOWJgs9xHM4XtN6jO/nO/dr+5oN2c7TTe/la8hpdF
         9psLh/s6SQy/hiPQ6nXeTT2rM/2k0EpmJhXgNPVsGJ6aNo0TR7q/lxpU+lkvs4lKyGH7
         7XtlJyrH1+nvmvyiuzozjBH+Q9ctxItAPQ95wkVAivkl2AvOy4iyaAJ8YaHNnh96iWii
         Mccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qSEWeBg2Xdz/FSRxyq98HyVGJIOFHZHR7r9BtUhdcAI=;
        b=P5l4C4s/V+WvIg2Q28WXTQIITsPzBlVEETDX4jS3z1y9ZX8uDuevq+2TokTAEBBJ2I
         UWs0Oj1hdlTTc4+S5mWIkEG62V8qtXA0VIGwpZkusNH5vs4JpDdcZDRk/TeALyDdvoOP
         APZnB9LpevyIfNMshlaWo8QbY4NFZOSvFjAaUHCVdJfNcST57XGJP535gfVkNPfqhzwD
         0rLRjoWUvVCtDQFUNG6zHxYLiFC/Alq+lNJ1So6KiaSC49coU6+oSzXUnX7V4yQx/cpu
         CQvAWMqbwpSEvZGjtWsbf9hkCLerSVdMeJmcQGiY7UK9kHOIIJQh4nEkq/LGM1JL8yB8
         6dAg==
X-Gm-Message-State: AOAM53017dXN/gbvkGeXpyfFUVa7vf2gmdANRBuCuZBU+7CZpCs3oQh+
        4oVQvrS2H036d2v5rVVV8PN39tMADT19kA==
X-Google-Smtp-Source: ABdhPJxIvJ+cBoY1OEE3rQCbELbrtE5YO+qFjCu91ewyS3xSgeISvzqlVL4T2CzKzB9oJyDZYCD9AQ==
X-Received: by 2002:a7b:c932:: with SMTP id h18mr25928364wml.152.1628668645456;
        Wed, 11 Aug 2021 00:57:25 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
        by smtp.gmail.com with ESMTPSA id h11sm18570644wrq.64.2021.08.11.00.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 00:57:25 -0700 (PDT)
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Russell King <linux@armlinux.org.uk>
Cc:     linux-clk@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH] clk: Fix *bulk_get* return value documentation
Date:   Wed, 11 Aug 2021 09:57:19 +0200
Message-Id: <20210811075719.1716886-1-msp@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some of the bulk_get variants document that the return value is a valid
IS_ERR() condition but it is not. These functions return an errno
directly if an error occures.

This patch fixes that documentation and documents that the return value
is 0 or errno.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 include/linux/clk.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 266e8de3cb51..56a741903963 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -340,7 +340,7 @@ struct clk *clk_get(struct device *dev, const char *id);
  * that were obtained will be freed before returning to the caller.
  *
  * Returns 0 if all clocks specified in clk_bulk_data table are obtained
- * successfully, or valid IS_ERR() condition containing errno.
+ * successfully, or an errno otherwise.
  * The implementation uses @dev and @clk_bulk_data.id to determine the
  * clock consumer, and thereby the clock producer.
  * The clock returned is stored in each @clk_bulk_data.clk field.
@@ -409,8 +409,8 @@ int __must_check devm_clk_bulk_get(struct device *dev, int num_clks,
  * NULL for given clk. It is assumed all clocks in clk_bulk_data are optional.
  *
  * Returns 0 if all clocks specified in clk_bulk_data table are obtained
- * successfully or for any clk there was no clk provider available, otherwise
- * returns valid IS_ERR() condition containing errno.
+ * successfully or for any clk there was no clk provider available, or an errno
+ * otherwise.
  * The implementation uses @dev and @clk_bulk_data.id to determine the
  * clock consumer, and thereby the clock producer.
  * The clock returned is stored in each @clk_bulk_data.clk field.
-- 
2.32.0


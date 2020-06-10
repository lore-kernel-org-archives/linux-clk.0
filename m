Return-Path: <SRS0=eZcb=7X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0D6C433DF
	for <linux-clk@archiver.kernel.org>; Wed, 10 Jun 2020 15:17:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5C42206F4
	for <linux-clk@archiver.kernel.org>; Wed, 10 Jun 2020 15:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akirVr4C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgFJPRt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Jun 2020 11:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgFJPRt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Jun 2020 11:17:49 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C14C03E96B
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2020 08:17:49 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r18so1115769pgk.11
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2020 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=swXtWE1rGKZcWNcCXU+m0O6esn2Wp4Gx6LGfQ6e98KQ=;
        b=akirVr4CsVyaj6wxbla2JjQCjT6fitr6YwxdC+3ibkShpBxnV00INR5meUDnPXp30r
         SUozL25hKNidPr7i24VcX+4YeJeuCBD70UKMfShZknfknu24g5Fx5RT8ECU7M29Lms4d
         P9S3Ly5OyaGagEgdGKn9J8Q30N7GIwzWBSSgYCAyI/2sJzwQIk+uJxSIz2RIKahjj6BX
         pW2vTkS/Y4iQIltyieYIWYP4iVdfDQPi3rANmeBqfW7N1VFYXXWfuZcCfgUdAO8Jf20O
         mU5Fk0EscoqtYISGZDtRIqC0OdJTpcSkxmjU6bLE+XEQN/itU0naMEblaz4d36nvVWpe
         wFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=swXtWE1rGKZcWNcCXU+m0O6esn2Wp4Gx6LGfQ6e98KQ=;
        b=Q6GaJZyHptyVs7aIuTkX5iWZcVKII/j03VS/bV7qpCVBOZMdF6Ifbiq9Jwm2/7RaSX
         de2Ijks83J1lD6ZzvNONnBwLIGuPVq9QGdJIRyPPBVSuaN5X8zOd4PO0kThKaSZpl95A
         D60wlaa7uHTuV7Wb49Cfgox2CoGtUt3ycMw/oJ53EPbBQmHD+B5q2JgeL08tdV1TPrHF
         oQg5lRtunJ35dLYjcFNQQiTQKSeM5LklsyG5DV8TVlDDVDrGoGekz7l8vxj83aqhjGtz
         /UOXwCAufo0Kn+YxpAhyY6/6OVURn+3JF8ekwUpOUskUr9dAd5E4YxLBR5aCS8SsUnfG
         xf4w==
X-Gm-Message-State: AOAM530yDN6l0jp6+/tlEoeI9uBN/hq+raHpylSOzz8lpLLtACyTTDD3
        CL1/r45qZH3ynhCZ1NSHSYw=
X-Google-Smtp-Source: ABdhPJywt9OHRA/1eLBiYXXhakZs7CBVTqQbpS1FgfFY/t5pxtYDzmAm8BRcodGaeA62ZA1B0el+5A==
X-Received: by 2002:a63:3384:: with SMTP id z126mr3034868pgz.7.1591802268256;
        Wed, 10 Jun 2020 08:17:48 -0700 (PDT)
Received: from ola-2jp9dv2.garmin.com ([2605:a601:ac62:2200:56bf:64ff:fe6f:26a])
        by smtp.gmail.com with ESMTPSA id q39sm108255pja.30.2020.06.10.08.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 08:17:47 -0700 (PDT)
From:   Sarang Mairal <sarangmairal@gmail.com>
To:     sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
Cc:     Sarang Mairal <sarangmairal@gmail.com>
Subject: [PATCH] clk: add function documentation for clk_hw_round_rate()
Date:   Wed, 10 Jun 2020 10:17:44 -0500
Message-Id: <20200610151744.35478-1-sarangmairal@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Information about usage and prerequisites for this API.

Signed-off-by: Sarang Mairal <sarangmairal@gmail.com>
---
 drivers/clk/clk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 407f6919604c..9cb9bc67a165 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1400,6 +1400,19 @@ int __clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 }
 EXPORT_SYMBOL_GPL(__clk_determine_rate);
 
+/**
+ * clk_hw_round_rate - round the given rate for a hw clk
+ * @hw: the hw clk for which we are rounding a rate
+ * @rate: the rate which is to be rounded
+ *
+ * Takes in a rate as input and rounds it to a rate that the clk can actually
+ * use which is then returned. If clk doesn't support round_rate operation
+ * then the parent rate is returned.
+ *
+ * Useful for clk providers to call from within clk_ops such as .round_rate,
+ * .determine_rate. Requires prepare_lock to be held before calling this
+ * function.
+ */
 unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 {
 	int ret;
-- 
2.17.1


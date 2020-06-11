Return-Path: <SRS0=Q/ZM=7Y=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CBCC433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Jun 2020 02:20:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 661EA206A4
	for <linux-clk@archiver.kernel.org>; Thu, 11 Jun 2020 02:20:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLPl8r1/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgFKCUD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Jun 2020 22:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgFKCUC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Jun 2020 22:20:02 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A7AC08C5C1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2020 19:20:02 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id p21so1842473pgm.13
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2020 19:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ccn8MoRQr4YHU03ZP/tOiuIeryhPiXQOOyH8wl46X3E=;
        b=SLPl8r1/Cnj9ipJPTsyBuDHxW/Iztf6dRG/A73Z+ohCby/Cw7I8g8gsx8+285hxFTS
         ldYPRCutFQW5kcBf2lExMqwdNwZ5GDlbGiL85lTYCaF/BqCRGYOHwo0mT/iqMPVBnfLf
         kPwvZXl08UXIIIUXpZcR7dk8MRK8FFwJUh3bRlDDhV4LHUKS9nN3/yOs7GJK6nvGitl3
         myMX8d9Zf2tpWZn/Knp/hOk9qOZ53pWOJbRpcVVu8th7jLz1SnHjRdnPybLWr5X3XNVQ
         ONTIIg3x1IJinlg+vZCayn6L/y70oTYDqJUPAU8VeX+yFu79tkG3Zeu6mAzrF3ZrvqXG
         x+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ccn8MoRQr4YHU03ZP/tOiuIeryhPiXQOOyH8wl46X3E=;
        b=equGJmX2AIeOGXHWWJY0CBOjqnWeO2jsw68TE4MdbNTJUgNu6lUYFIQsUYVJN1iFXU
         hJJVjQjKJmso1MaJDN+t5ZH8eQ1HUfmE05BePa7hB3wawfka7/4hjRsAwjlFD91B2xuc
         gtka43+dM+p+l6kWgwJK7zdX9+yX1pe+/qsaIg5c9+0MQhQ+SrXLWXx7HV4qY9dC3ZT7
         3k0ZtQSgoG/qs87mojLC+yzDqq866VrZ78RQJ996i9B9oEoR9gCVxOiBYZTUbKkv1dsl
         fuHvWhpnupWFo1kXcf+VCW0tKq2NoYVvMVmRDimIV0wgWnGWoJAu3+T8UMDYzha2K4++
         fd3w==
X-Gm-Message-State: AOAM5327Fu3ag6H+kpM+w6h4IKeGg7GASXMugcVKGSxUvdMI6S1GMb1G
        FvUPF9R2s+x72Vsat+xA8VU=
X-Google-Smtp-Source: ABdhPJydPMuJrwu/qAjfukilFpQunYwpiGlPKwJLIPHzL1oFe/K5/AbRNwgGDxgwz9xNjjLjKIntKw==
X-Received: by 2002:a63:3609:: with SMTP id d9mr4963055pga.354.1591842002373;
        Wed, 10 Jun 2020 19:20:02 -0700 (PDT)
Received: from ola-2jp9dv2.garmin.com ([2605:a601:ac62:2200:56bf:64ff:fe6f:26a])
        by smtp.gmail.com with ESMTPSA id i19sm947488pjz.4.2020.06.10.19.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 19:20:01 -0700 (PDT)
From:   Sarang Mairal <sarangmairal@gmail.com>
To:     sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
Cc:     Sarang Mairal <sarangmairal@gmail.com>
Subject: [PATCH v2] clk: add function documentation for clk_hw_round_rate()
Date:   Wed, 10 Jun 2020 21:19:41 -0500
Message-Id: <20200611021941.786-2-sarangmairal@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611021941.786-1-sarangmairal@gmail.com>
References: <20200610151744.35478-1-sarangmairal@gmail.com>
 <20200611021941.786-1-sarangmairal@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Information about usage and prerequisites for this API.

Signed-off-by: Sarang Mairal <sarangmairal@gmail.com>
---
 drivers/clk/clk.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 407f6919604c..da3182404934 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1400,6 +1400,21 @@ int __clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 }
 EXPORT_SYMBOL_GPL(__clk_determine_rate);
 
+/**
+ * clk_hw_round_rate() - round the given rate for a hw clk
+ * @hw: the hw clk for which we are rounding a rate
+ * @rate: the rate which is to be rounded
+ *
+ * Takes in a rate as input and rounds it to a rate that the clk can actually
+ * use.
+ *
+ * Context: prepare_lock must be held.
+ *          For clk providers to call from within clk_ops such as .round_rate,
+ *          .determine_rate.
+ *
+ * Return: returns rounded rate of hw clk if clk supports round_rate operation
+ *         else returns the parent rate.
+ */
 unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 {
 	int ret;
-- 
2.17.1


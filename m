Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C53C433E0
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:07:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 157DD2310E
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391999AbhAZNHU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 08:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391983AbhAZMtB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 07:49:01 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D9DC035435
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:46:10 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a9so16317559wrt.5
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hwOEDN9pFoMRn0bPIH5AwWEBMRWoq5VkGdsYNSR9FGE=;
        b=cZz01X+VWuBj+9uDKkkXPXM9//fkRR9GHvUotrvnK/n1yjzEnawXB+dGxsS7z9inSF
         WgG0hLmw8aPkRHv2dpc44VQiBduw1TiWcMJP3SJBGYIs7h3MQ441bXddZcUs0LI6hr+L
         /jOxSZcoUciHMHscXa1VxI9h9IsFwA20YgG3ApzWADK/Ks5WmuiVESxKQrjI52wsgxjz
         /+D/Uk6PjuvauamZ7S6/332je+0L8ICB5iLI8emZUdBKZzxo4fsE1pKTt8BMHnxKtKdt
         Vf9+KwYyK135SHqf8I6fWJkHsF3QmX7LsVpgIIIYzcLiQ0ay4mUcrqpt4n/KLGDWeH/L
         qfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hwOEDN9pFoMRn0bPIH5AwWEBMRWoq5VkGdsYNSR9FGE=;
        b=K1A3IXEafR0YSxKmlbBQoyVCSFtdLDZDGQdwfizILY60K5CoU2yK2W1ff5QLSNv4Re
         bcHKL4ywrlXv5+EhRccJpk7ZG9Zz5nPi+mJ3NzFl9PRK5xmbTDFuVBBuAmOaDeZ6ov88
         n6QOJZiSQvbgdcGxAriUYztcKw7I2ies3Bqdl4r8/d25ygsG3ctsjcbmxImmDTyV2UkN
         s4CBp5h2sGi7SqZbaAGyDuB+9ymXvsrK+16Kbw6he7u/a2wv6s4soKZU3Siw+PjMdP0s
         CvXe/jj0Xxp7YjiAIGjQPVGE62t/7V+CFDTZphWfg0BzDDuOtywME4Sd3zdxeU9Ouso0
         8pyA==
X-Gm-Message-State: AOAM532MTiUO4B2VXCbgGbKBIaATxWCg7Qqiw7EDrbsL15kb/nLiwDxj
        nzZtoaKjXWpCQdagZpFg80c7zQ==
X-Google-Smtp-Source: ABdhPJzSQDfP81pbHTeNqSO7T6XdRtI37YTtqJ1RLv7NXMg826rJtq9xTgY1rh1yu6cBbuWypkDCeg==
X-Received: by 2002:a5d:6347:: with SMTP id b7mr5805047wrw.233.1611665169480;
        Tue, 26 Jan 2021 04:46:09 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:46:08 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 21/21] clk: zynqmp: divider: Add missing description for 'max_div'
Date:   Tue, 26 Jan 2021 12:45:40 +0000
Message-Id: <20210126124540.3320214-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/zynqmp/divider.c:46: warning: Function parameter or member 'max_div' not described in 'zynqmp_clk_divider'

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Rajan Vaja <rajan.vaja@xilinx.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/zynqmp/divider.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index 66da02b83d393..e9bf7958b8218 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -35,6 +35,7 @@
  * @is_frac:	The divider is a fractional divider
  * @clk_id:	Id of clock
  * @div_type:	divisor type (TYPE_DIV1 or TYPE_DIV2)
+ * @max_div:	maximum supported divisor (fetched from firmware)
  */
 struct zynqmp_clk_divider {
 	struct clk_hw hw;
-- 
2.25.1


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D20C43381
	for <linux-clk@archiver.kernel.org>; Mon, 15 Feb 2021 11:58:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2F8864E73
	for <linux-clk@archiver.kernel.org>; Mon, 15 Feb 2021 11:58:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhBOL6Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Feb 2021 06:58:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhBOL6O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Feb 2021 06:58:14 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A908C061756
        for <linux-clk@vger.kernel.org>; Mon, 15 Feb 2021 03:57:28 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id cl8so3606925pjb.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Feb 2021 03:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=getDYJkOREyrDs/0rynDHefIGcA6GT+0fzVf6Cpniv4=;
        b=KrifFaHePzV27JoUDHI9pCTeJ1V7Hmvyxc7tJtWlkgmlEi3WA6ZT8/Db26uL2Ye3jg
         1S7UMCP4bbkLYeAkavaSGSEHrI6g/MW7T/Js3f04Dcj7R1Y2vB869LGWE+K/WaytthD4
         PAB6EI7ET0vd2LRDse8OIMXXBG49OY6XMeWi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=getDYJkOREyrDs/0rynDHefIGcA6GT+0fzVf6Cpniv4=;
        b=UYUjukd8aahnm7nkqGIqiQzJuitYTkgwz2vav8P5AKPVP4Q+j5k8PYFsNi19G6tZcM
         OVcfJTIMXLr6rY857jK91pP6Z3nWIQ+CEJLyknzzAFk8pE2U5xmb4IJCGKNC/mGzyFqP
         t7cPsS+hT6JsIADGR7UjBg9+2EsweTysmickyRBeXubZ4zQf1BsTQY4ByBhZWvdImUpK
         wST90ZVlKEnYnxEQmTm2t6TJvUBALGM/eoqTxUl7quXZ5HjMDJj5+LeArbw7/yt2b1m1
         AQXM+0u5eQ8viq7FhevtzU3YIhDTqj6kTS1gEZATmAZ9d35KLoQWYVoYG5LTI5dxWKO4
         YcFA==
X-Gm-Message-State: AOAM531I2JEimp9VHWwa2PgbCSWscH9Mt0EjgfIhHNPNXwlznSf4k9IR
        13F1Dn+7tNgF5/YHTDYT69boDBwAcTRiaQ==
X-Google-Smtp-Source: ABdhPJwu5oJbkzX3rOPC1H1Om9T6YHyFR1lXTMEXvstdnb98Q0vmBHsvSUvTyFE1cRj8S+TAdd17mQ==
X-Received: by 2002:a17:90a:b28b:: with SMTP id c11mr15657206pjr.62.1613390247984;
        Mon, 15 Feb 2021 03:57:27 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id a5sm17929504pgl.41.2021.02.15.03.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 03:57:27 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org
Cc:     Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 2/2] clk: mstar: msc313-mpll: Fix format specifier
Date:   Mon, 15 Feb 2021 20:57:10 +0900
Message-Id: <20210215115710.3762276-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210215115710.3762276-1-daniel@0x0f.com>
References: <20210215115710.3762276-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The output dividers are unsigned int so the format specifier
should have been %u not %d.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/clk/mstar/clk-msc313-mpll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mstar/clk-msc313-mpll.c b/drivers/clk/mstar/clk-msc313-mpll.c
index 09f578108eef..61beb4e87525 100644
--- a/drivers/clk/mstar/clk-msc313-mpll.c
+++ b/drivers/clk/mstar/clk-msc313-mpll.c
@@ -123,7 +123,7 @@ static int msc313_mpll_probe(struct platform_device *pdev)
 	mpll->clk_data->hws[0] = &mpll->clk_hw;
 
 	for (i = 0; i < ARRAY_SIZE(output_dividers); i++) {
-		outputname = devm_kasprintf(dev, GFP_KERNEL, "%s_div_%d",
+		outputname = devm_kasprintf(dev, GFP_KERNEL, "%s_div_%u",
 				clk_init.name, output_dividers[i]);
 		if (!outputname)
 			return -ENOMEM;
-- 
2.30.0.rc2


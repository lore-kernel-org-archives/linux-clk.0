Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60557C433DB
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 12:49:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3817523109
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 12:49:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391957AbhAZMsq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 07:48:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391916AbhAZMrw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 07:47:52 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474E7C0698D0
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:53 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d16so15643156wro.11
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XuvdeEVGgVGx8Q6bfVHqk100qI9P2WGDJUgmEfT3Z80=;
        b=qVYoj1LV43OERPJkGr6NsVaicAcn1JfbweAsSv4QBHHFtLXYj48oJA1HhFmkUEi2EZ
         EzvZ+5Vig/rfcG7me0rL+pNqn4XYtc6Ku5X5bHO2ATdWdPMwnm8aRhHWbxSPg4pTQRrk
         QaYBpInkNzdJ0ZcAO3KfvGPwRaG5kwDptYkTGAJ/uNRTZJpF2PqwOaBNL68+u/s8YkH2
         PhMQQT1wdU1YhRkAN7b+WZ+lKQYhhYN/HIbn3ImwPDj3BiPOIk5ZY6vUi401NleKyoc1
         AsD1Wew2f+VZdKcplOi7bCvk8gRMMs/TeU1+rgsBqPqT9060O/maLEI4OtshFoKzA8zS
         OF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XuvdeEVGgVGx8Q6bfVHqk100qI9P2WGDJUgmEfT3Z80=;
        b=r35szU/VEeREovrtWLyDOoLTN8fn90q4rDt5PcWU4aPDKNpDBhXMLZkmKnFR4QWrxO
         m9EzTU8Nj5FVl4qyT4AtL7YCI7Zbhp14e9L1IqalwP6GhIBBY+yjWWlWNwaUrpg3k9Wz
         On1jwi5ABtx/Iv6CUBpN9nJkZ1aaOWfHmZ3jQDq5cXym1WUbpQvbsV5izui4n+z8O9lY
         7wEkh7gAFKy5O8gXX3HI82UMpse8iB2oI98tztcpnRMLNolVQvp7HGG9ZmPMQiVr7dRN
         2sbEc55hdlPmyL/57c/fv8li+AgUQGMWG3fLialehrzCNrsK1wF+gna2n+QqmGwV7gIL
         QmdQ==
X-Gm-Message-State: AOAM533v5s5J+Y5nWC9hhxzkkebJfNmmMNeq/uujAgPQVlad38ANqbNS
        YRgGHM5iJpMvMXrLq023XyI6pA==
X-Google-Smtp-Source: ABdhPJyKKCPuEPaelxY+HfAhH8/k3ZMsUja3L7lTXwAZLVcQ/bRenxKcss5It+OKhPJb9XgdisE7UQ==
X-Received: by 2002:a05:6000:1252:: with SMTP id j18mr5772873wrx.232.1611665152035;
        Tue, 26 Jan 2021 04:45:52 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:45:51 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/21] clk: sunxi: clk-usb: Demote obvious kernel-doc abuse
Date:   Tue, 26 Jan 2021 12:45:25 +0000
Message-Id: <20210126124540.3320214-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/sunxi/clk-usb.c:22: warning: cannot understand function prototype: 'struct usb_reset_data '

Cc: "Emilio López" <emilio@elopez.com.ar>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/sunxi/clk-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi/clk-usb.c b/drivers/clk/sunxi/clk-usb.c
index d78a78495bede..5460218f3467a 100644
--- a/drivers/clk/sunxi/clk-usb.c
+++ b/drivers/clk/sunxi/clk-usb.c
@@ -15,7 +15,7 @@
 #include <linux/spinlock.h>
 
 
-/**
+/*
  * sunxi_usb_reset... - reset bits in usb clk registers handling
  */
 
-- 
2.25.1


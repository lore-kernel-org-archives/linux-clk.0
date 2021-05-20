Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991DDC433B4
	for <linux-clk@archiver.kernel.org>; Thu, 20 May 2021 16:17:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ABEC60FE5
	for <linux-clk@archiver.kernel.org>; Thu, 20 May 2021 16:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233646AbhETQSd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 May 2021 12:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233281AbhETQSd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 May 2021 12:18:33 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5224C061574
        for <linux-clk@vger.kernel.org>; Thu, 20 May 2021 09:17:11 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id z130so9542150wmg.2
        for <linux-clk@vger.kernel.org>; Thu, 20 May 2021 09:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DSEIaoO2erY4/GbHdcIXSVMqyjIxSPIRHtmmIHvOzJQ=;
        b=tbFnB+3MOF41wS7CnLWRHfkq70bfUI46jiga1LlvvKZag6xEnebf1vG8T6QthEPEGy
         ne3U7rB6/w5TzqdYQghWXw9FivPZGYh6vOXwQJhy/4ngE+bs3kUKiJZk9nwSEeEq3ZJl
         hoGdGKe+98I31n+mmvwigz7sNDdPOWHceUN8mjHQXhE8hpZVvZCeEpmU0+hVwMlvwAqe
         iM7O37Wya7xBx7zHqZVYJAt86ttevMbEiAi+o3E5b/yUvYp1VCHcUNmsa7TxA+hwO9dH
         V8Px7CZokgxAB5GhsQOyJPtI3ML9u5LcOwq0MiCNC+LzJhR0X0VVMbKyYR4zQl/6QFci
         culw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DSEIaoO2erY4/GbHdcIXSVMqyjIxSPIRHtmmIHvOzJQ=;
        b=iTFUDvIsyT5cwEKCWWj8G79k5lT6mhAgbSsioy1Qw2JyWpzM8EnHjAPSBczoKNBFJi
         v86+KpzYlT7KScTPVpDsrJ0i670EHR0LERQ1bqM3ktZuBNi3/Ej6UeS4RKBCWmxXMgVa
         T8gRJip8DIfRLuqcioNxoN2zrfINMZqQCd4KeJKw/MjmFGkw3Xc4r1rMD0tf7hGJdml1
         61QSV6oLlz4N4OyyeYcSuNrUefyax9xWC4Kd6Yz2duXL/3eWIYyHOBU/4LongpX7SSYs
         5LEXgZQLKt9FMuD+fJiP7fZaq6xJnhnIuAZlinXeFIACvHomCaCMAtwWZY701/OQbsSd
         k4mg==
X-Gm-Message-State: AOAM533Rkg6K7aA4C+g6+XBlrANt3wC9vKxl/EHTYznov0rKFdxp/A9B
        hvAiLmvUYX7rSB0j6ijYDqGYMQ==
X-Google-Smtp-Source: ABdhPJyYblC5KDnM7csM6z7PWzIyBhMBmbPHHL8eT9KaZ+21Ymq3o7CJAGPN/DbTRC/nLLRCxbkHrQ==
X-Received: by 2002:a7b:c849:: with SMTP id c9mr4917981wml.84.1621527430402;
        Thu, 20 May 2021 09:17:10 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v15sm9465137wmj.39.2021.05.20.09.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 09:17:09 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org, linus.walleij@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Peter Collingbourne <pcc@google.com>
Subject: [RESEND 1/1] clk: versatile: remove dependency on ARCH_*
Date:   Thu, 20 May 2021 17:17:02 +0100
Message-Id: <20210520161702.3746174-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Peter Collingbourne <pcc@google.com>

It is now possible to build a modular kernel for vexpress by
not setting CONFIG_ARCH_VEXPRESS=y and instead setting =m on the
drivers that it normally implies. This is with the exception of
CLK_VEXPRESS_OSC which is currently hidden behind a dependency on
one of several ARCH_* variables. Remove that dependency so that
CLK_VEXPRESS_OSC may be enabled without it.

Signed-off-by: Peter Collingbourne <pcc@google.com>
Link: https://linux-review.googlesource.com/id/I435a21e2e5f6187db54f4ef2079b60028ab2ea69
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/versatile/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
index 91f0ff54237d2..792315d893db3 100644
--- a/drivers/clk/versatile/Kconfig
+++ b/drivers/clk/versatile/Kconfig
@@ -1,8 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 menu "Clock driver for ARM Reference designs"
-	depends on ARCH_INTEGRATOR || ARCH_REALVIEW || \
-		ARCH_VERSATILE || ARCH_VEXPRESS || COMPILE_TEST
 
 config ICST
 	bool "Clock driver for ARM Reference designs ICST"
-- 
2.31.1


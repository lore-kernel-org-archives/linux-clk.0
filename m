Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE0FC433E0
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:09:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DBA923109
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392005AbhAZNJZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 08:09:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391954AbhAZMsj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 07:48:39 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E387C0698E4
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:46:02 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 190so2361623wmz.0
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 04:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xV2037MpTqxIYdYf/qlhhyKpbo5/pnSBSbkbi3/w7zA=;
        b=XK+B8cmZJgvGTEGTRyLc3SO5a5c8b6otv/2xECAiu13SXrH30DrwqdXR6kt+X7RnC9
         mogCYkgvzIYiEwqc4jUJkT3zYOG8jFC+BBQrV+7WfPifcQ2CrWIQ3YvZNqTniAufzvoK
         sTT5bXKzKJYLFMD10sEpqkTtp2823oAWVPKnTntVI5Xs7P44i4lckxe5khhY0Gn9Znwx
         gxjA8TLk/p9L0pzr9bO9mcwBB89TliY8bzv5nsArobkn0D8yzUm50cEIfN0BBU+qvoyj
         VXj+oywUaId30W8IvPoE0BycccyrJ/JJlcvP/6bq+xihpWzCHJbmwEtwsIZrlAFMqLV9
         9gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xV2037MpTqxIYdYf/qlhhyKpbo5/pnSBSbkbi3/w7zA=;
        b=TpjcBBnRiFHeDOa59GESu5PcQipe+frDxGuAuQU/sY1Fe5JA92R106dREOdZXEhGg/
         faiOCovD++/3SXgANOhqT989k6LXMzIPzQUnnPUlj3q4NkQYDZnSbNQaVznmlZeLMjTR
         TIqeQJL7/UmUhqs2XjQCkODUleUR33gN7t4bcZAm81hMDBf1zZll9Uy3B56gpCWsO1SO
         eLs95MOZT2sixWfMTzcP/vg+yLGQAtSInoF0dvKUIZZw22XgZtd8UKe+g1BzdQs510aD
         E7XtSJ05d15nJRLa8qOatsrVDew0cCqAmVRgGlWw7jtoEvDlHtqeNku2LO/APA9AAJ+d
         k/TA==
X-Gm-Message-State: AOAM532itvreNIJWpRkMl30T9QwU1H4mdE7QvCIN/oUYhO1C3gCWQUpa
        PAFJqse2If84O28/2f5pARUsOQ==
X-Google-Smtp-Source: ABdhPJwX07IygCoQj1H2udFoApgRu91g3BVErGPZlgNSmDRMkZC8ho3Prm3d11PVxLh1npT9oweq3g==
X-Received: by 2002:a05:600c:24f:: with SMTP id 15mr4559872wmj.78.1611665161131;
        Tue, 26 Jan 2021 04:46:01 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:46:00 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Jan Kotas <jank@cadence.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 14/21] clk: clk-fixed-mmio: Demote obvious kernel-doc abuse
Date:   Tue, 26 Jan 2021 12:45:33 +0000
Message-Id: <20210126124540.3320214-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/clk-fixed-mmio.c:62: warning: Function parameter or member 'pdev' not described in 'of_fixed_mmio_clk_probe'

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Jan Kotas <jank@cadence.com>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/clk-fixed-mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-fixed-mmio.c b/drivers/clk/clk-fixed-mmio.c
index 51f26619b6a23..5225d17d6b3f3 100644
--- a/drivers/clk/clk-fixed-mmio.c
+++ b/drivers/clk/clk-fixed-mmio.c
@@ -55,7 +55,7 @@ static void __init of_fixed_mmio_clk_setup(struct device_node *node)
 }
 CLK_OF_DECLARE(fixed_mmio_clk, "fixed-mmio-clock", of_fixed_mmio_clk_setup);
 
-/**
+/*
  * This is not executed when of_fixed_mmio_clk_setup succeeded.
  */
 static int of_fixed_mmio_clk_probe(struct platform_device *pdev)
-- 
2.25.1


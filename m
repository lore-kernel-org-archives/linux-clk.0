Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD84CC282DA
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 12:59:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E3DC218AF
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 12:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ssacKsO3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729543AbfBAM6u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 07:58:50 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35437 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfBAM6u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 07:58:50 -0500
Received: by mail-wm1-f68.google.com with SMTP id t200so6179625wmt.0
        for <linux-clk@vger.kernel.org>; Fri, 01 Feb 2019 04:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hmkxltlF7dcc/tNm5bkNIJRJUm+2VowEALm8V9t6Ca8=;
        b=ssacKsO3q9tzcUuoUi9VaWrdAZwzbfexbKYr81JP0GpitsTmAQwb1nPNDzZjv1NS3w
         63WGqfMWtkEWtiCO41gORVfFUKDYt/+KJyi/dpJ9h5nMdiUL1cTXR1wziIn6ZxB4DLkh
         kdzbwxXhObsLnRbJ5CcxbjgiKeJQ88hi4vSpbZTIGmP9IycFLB45rA5ChDvnQ5SZhDko
         iBcHr7yxHG16BitnViaLtvOTuicMKWrh3hCxtS/DGBcsA0QNgw1B8DkQOKK7//MgvYJS
         w7RU8gX5pR6/mL7CziTa8WD2oNUQTSPtzDCijziMTqIs3/LQ6ZwAO/dWENhB2qvLOmBQ
         MIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hmkxltlF7dcc/tNm5bkNIJRJUm+2VowEALm8V9t6Ca8=;
        b=dbCz7Ir35yj/+CsMla3CWORR6wvU0lu4RFdJARtgVG4eQKIMSICF1rbVU0CblcJxiZ
         nw+IlZPdKfuISZAYg00+L0YsXxfTgRJdPo9q34CM6I7/zZ1mIJAxfj0UGzp7N9y7ubhY
         BV+Gx21njuF8eZ9Aai5V8ya6AoEp0ubQz+MJwQpW26xA/wTcOwUh9BGzAKpk2riBab2X
         HKNNeJaLEt3PCp0Vr8t7OSKL5HTDXMzJY20bGkzvbqeO7xGNRSYMH3Q100DLVXYzMON3
         EW0ay7IVrQ9laHA9HM2Ft9tbfOCYUYwqUrobBz9POVECOIWwX5YSbBqFzZEM/rEofNZP
         izTA==
X-Gm-Message-State: AHQUAuYIALuymmh0Q15iIDG9PYtbETFVPjbmhjc1UvHkdX4eUOWqDdY5
        t7FCd2gKfbvGyAYL9mR0CEHa+g==
X-Google-Smtp-Source: AHgI3Ib9FUGyo+Wb/YTZo6Pq2xG4N3LjYpjPce5rb6H1DhGWsmtem+5r1MCyDSRHTTHq0NhVIrD+OQ==
X-Received: by 2002:a1c:2804:: with SMTP id o4mr2469106wmo.150.1549025928566;
        Fri, 01 Feb 2019 04:58:48 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id w16sm8709750wrp.1.2019.02.01.04.58.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Feb 2019 04:58:47 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] clk: export some clk_hw function symbols for module drivers
Date:   Fri,  1 Feb 2019 13:58:38 +0100
Message-Id: <20190201125841.26785-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190201125841.26785-1-jbrunet@baylibre.com>
References: <20190201125841.26785-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk-provider.h provides clk_hw_is_prepared(), clk_hw_is_enabled() and
clk_hw_is_prepared() but these symbols are not exported for the
modules which prevents a clock driver using them to be compiled as
a module. Export them to fix the problem.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 6ccdbedb02f3..6d86dbb72602 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -394,16 +394,19 @@ bool clk_hw_is_prepared(const struct clk_hw *hw)
 {
 	return clk_core_is_prepared(hw->core);
 }
+EXPORT_SYMBOL_GPL(clk_hw_is_prepared);
 
 bool clk_hw_rate_is_protected(const struct clk_hw *hw)
 {
 	return clk_core_rate_is_protected(hw->core);
 }
+EXPORT_SYMBOL_GPL(clk_hw_rate_is_protected);
 
 bool clk_hw_is_enabled(const struct clk_hw *hw)
 {
 	return clk_core_is_enabled(hw->core);
 }
+EXPORT_SYMBOL_GPL(clk_hw_is_enabled);
 
 bool __clk_is_enabled(struct clk *clk)
 {
-- 
2.20.1


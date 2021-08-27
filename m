Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210EFC432BE
	for <linux-clk@archiver.kernel.org>; Fri, 27 Aug 2021 11:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E895260FDA
	for <linux-clk@archiver.kernel.org>; Fri, 27 Aug 2021 11:41:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245019AbhH0Lmc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Aug 2021 07:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233376AbhH0Lmb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Aug 2021 07:42:31 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B389BC0613CF
        for <linux-clk@vger.kernel.org>; Fri, 27 Aug 2021 04:41:42 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so1747059pjc.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Aug 2021 04:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=mGpH5mvYecvwlCQ8u2SHdQPH4lb1tr2RmaIwutOOIpo=;
        b=yAeswcrBqfgkHPkxXbxBYRCTM1ss+RtFy8k2TIQe7lO/YP7yO0he7KCaivhVA2wjdQ
         wq2hG8o6/3CIAW/GIh5lk2Qm6dTtl1XSxPai0k8p4tmb5i/dUakXBLwOdaYZ7jgsUS8C
         cb7qfzc1afzkoG3ekB/85O2+1996VAqpxBIKho5PskjWBSCo5AxgySSQHiJCiLqqXY2U
         kaZJ0Bm13g6iRsUeOFuVH/YNQyrj2Nq6ubC8Ul9YivP7RCCYY9HBNWYsaxF4cxZlJtzI
         r1scPaqPfP2DSRk+RKy1kZlRcTWq51iQbORnVM/6H03mk+OkXi+R7rsklk07oSDTcPiT
         g+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mGpH5mvYecvwlCQ8u2SHdQPH4lb1tr2RmaIwutOOIpo=;
        b=E+LzZkm5XFfhPpjWnRw4MnGAq+pAq1T+1ngq4mc6vmD1W13OT5VIFPdTu4dNNa4KRI
         l1rRam7o/WrJShtKfq8P/aTilfsAkY6L/cxNMqLj4g+7ept9G6OtGq2qx9MoZXPObTEG
         Je4i7gnkJwJHCBWkfWEpULDy10HLtQZfgwZ3AOjHZKQZ2+qD6COHQUyfYozdMyQ4rptk
         d2hZEJcDQpRlNzsiTQTWnp7GH/uUNnH1rot0OVhZEzDoAzIWxw2X5pinKKXRZQZU6KuK
         Q+Jyt80cqWlYPYCMMN9HtFUkVmHEKDZMRIDxn49mN1ulI4/1FxC9MsyS8S3+I64uw9/M
         AkNA==
X-Gm-Message-State: AOAM533+nZQzmDXM4fq2RJ2u5CWrbCVsjdocAjNCJbd/rHDtHhOTltjg
        VttrAkchj9rgzNRGZUDf0tLi
X-Google-Smtp-Source: ABdhPJyEBx8IHEJhRdJ/KkDw4FOc5Vq3z8Q5+PGGvfxtplxN/JfH8vBByqeOI8eJ/9EdufbTYektgA==
X-Received: by 2002:a17:90b:1d0c:: with SMTP id on12mr23008283pjb.12.1630064502206;
        Fri, 27 Aug 2021 04:41:42 -0700 (PDT)
Received: from localhost.localdomain ([123.231.122.209])
        by smtp.gmail.com with ESMTPSA id i11sm5977457pfd.37.2021.08.27.04.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 04:41:41 -0700 (PDT)
From:   "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: fix passing zero to warning in clk_hw_create_clk()
Date:   Fri, 27 Aug 2021 17:11:15 +0530
Message-Id: <20210827114115.15255-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Smatch has reported passing to zero warning in ERR_CAST.
"drivers/clk/clk.c:3673 clk_hw_create_clk() warn: passing zero to 'ERR_CAST'"

This patch resolves it by using IS_ERR instead of IS_ERR_OR_NULL.

Signed-off-by: F.A. SULAIMAN <asha.16@itfac.mrt.ac.lk>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 65508eb89ec9..cf47526789af 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3669,7 +3669,7 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
 	struct clk_core *core;
 
 	/* This is to allow this function to be chained to others */
-	if (IS_ERR_OR_NULL(hw))
+	if (IS_ERR(hw))
 		return ERR_CAST(hw);
 
 	core = hw->core;
-- 
2.17.1


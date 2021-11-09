Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC56C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 02:26:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D14861279
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 02:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234400AbhKIC25 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Nov 2021 21:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239194AbhKIC2z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Nov 2021 21:28:55 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12B5C061570
        for <linux-clk@vger.kernel.org>; Mon,  8 Nov 2021 18:26:10 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id p18so18083920plf.13
        for <linux-clk@vger.kernel.org>; Mon, 08 Nov 2021 18:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cUtIpl24Lggy8E41RG8ia5NQqrtzC4GKJnnWF5Zf7Y4=;
        b=TNXVDLeLMVW1i6+8idnFThikZi7Oh98OM81dZHFgy+VjBg1cSD4CDiq3iV6QkNCjmY
         jNgDp0atM+zyOYF5rsq/1Ki2S3llSRuJaPcG7DSmBob6P2ks51YEv4WaWYcKvJYu1CcQ
         wE8Ciw9HByqSlMYj0GCpsDkPZRRtCGrRsy9Y+UjA0Ygse/dEGlJ0ikQY0wFPx//zPjoS
         t1gMef0gLeQ7zf74cQr++qCJys/G3Nguxt6Er9DKFM6XoHmeb4lx8ASCoKT/71VP7QEQ
         v7rEDHOVk17n/nEorN5CsKPeNtQjK4Mh+B2nLzi0TGVcVS3c9XeI7TflMOCO4bV15StW
         JwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cUtIpl24Lggy8E41RG8ia5NQqrtzC4GKJnnWF5Zf7Y4=;
        b=EZka6nEqSEKfZcG0WkevDWQibTNbzJyK6wa8n/XNNJ+74do2if/kURU+xYPZfwCygA
         9kl8RKefCssoQl+b936Im+LLrDpkoEBqy9p6mP4f+DQgrMilzit5j91YM2UkhtVuksbQ
         Xx+S0HuYpGovzyiZvSLAeg3k5f2JVNevlFhEr0Fbh2uQVYUqPnffPPePDjn8DMZuoOWH
         9z+m6JnIMLpH7A1F+Mt1go5SS7ozgQpN39cgVADs9T5/efTqylBvAyMCgMNyhQPqvcLX
         wIv5Mgi1J2pSU7CQI9WLg5zORLkuy4Y6iBtdZk67WDgJtvmQ8MD4ffesu0JkSCTBaxoi
         /kxg==
X-Gm-Message-State: AOAM530Tm1ZFAKerrTS3vHP9Bvtzza5Rct0YV6fMdk12sSi5pi3ac6cD
        xd48frwiuX9XTFERlrgioWU0BA==
X-Google-Smtp-Source: ABdhPJxjhrI3oT1OfkcTVxJUt3MlvPPxmulARdcSjQfwA6tXq2YHh770n8M8q+kR2JHIf/NrNLoJTg==
X-Received: by 2002:a17:90b:105:: with SMTP id p5mr3357519pjz.60.1636424770274;
        Mon, 08 Nov 2021 18:26:10 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id om8sm589619pjb.12.2021.11.08.18.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 18:26:10 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/3] clk: qcom: smd-rpm: Mark clock enabled in clk_smd_rpm_handoff()
Date:   Tue,  9 Nov 2021 10:25:56 +0800
Message-Id: <20211109022558.14529-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211109022558.14529-1-shawn.guo@linaro.org>
References: <20211109022558.14529-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The result of clock handoff is that the clock is voted by APSS and
enabled by RPM.  So it should be marked as enabled.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 26c70c2fbd26..6695a43a3d73 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -178,6 +178,8 @@ static int clk_smd_rpm_handoff(struct clk_smd_rpm *r)
 	if (ret)
 		return ret;
 
+	r->enabled = true;
+
 	return 0;
 }
 
-- 
2.17.1


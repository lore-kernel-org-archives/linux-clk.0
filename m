Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6A4C41518
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FDB52333C
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 10:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732270AbhATKcg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 05:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731386AbhATJb5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2021 04:31:57 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA30C061798
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:51 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id v15so18719072wrx.4
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 01:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6/9ceGuP2+USnecXvRgfX3tvKaOryov7Wtt62UymmUI=;
        b=zsUrflxnAFc3IYIoSFc8k7W7CGDz3d03oEmgRPfbTwW3ESR2Dd1HAIRTyGM1OLiVfI
         p6Y1uTIvaMxcPEMqPh/evVtCuoHbIvzxPeqSXptIr5Uo0WtScNxE0Z0ZdUGqOFpBGGhZ
         wTEXcO0uGLIFXtnwB4uVdwmzd7P36XWmOSE6JIfEZ4Bc9pE73igQ9hrjpMG0FJ9lIS2Q
         iMiLtWwNDQMYvpJDyDcGYWR7BtFEacGsBhnedZBrcm30nNzCCvl+4v6IXQ02v5ia8t+C
         4YEMjg5866/ByZseWyjDneNiGU6Qc/TBPm8wlm3Qf1xdt0vr0dM81wLvPl6sAejuOB+F
         /CMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6/9ceGuP2+USnecXvRgfX3tvKaOryov7Wtt62UymmUI=;
        b=Bu7MJw9897SSCO5EnPM3Vvu9Tu4fbeUOAftmkuZnv25XYc6hyuZIz6V5LXX1fan0D+
         OkZCXcrCQU8U9x+QYwI9xSP0hT6qcqGQLM/iyQ6QNHB2kcFjDDSzBE+k+fAPhLf4ijPc
         mh2TdyG8q+fUUNtn4ScMSsz1SuDn/gJZ9onOdImXYQ5NLTQZ/jFPVWwfl9Hw+GZP7lOR
         kLF8piammT7hTVvdLS1lOT0+O7WuNMyMrFU2qb8vwS9R611BwyxKNCBBFCJnPLWeFkYT
         aew2w3FyoxpB8Rerdtaxh12t6agho1I1R1yxvBfLKknDcVUHCukNhxqQoTBvTj3VJBLn
         IXHw==
X-Gm-Message-State: AOAM5329A4tJvAgVV2LXGcy8qeu0Apow/Ped3kT9OM77cxTH8hwUPxUk
        JlXa81XiRr2xSL2a2dCtP4+VEA==
X-Google-Smtp-Source: ABdhPJxWJSx1DGb1ljzPDImV+Hf4w4rCdj0LPOUIBwdeWFk2edG0+I7aroI98jI1pCvoDF6IEzLT1g==
X-Received: by 2002:adf:ded0:: with SMTP id i16mr2314632wrn.264.1611135049958;
        Wed, 20 Jan 2021 01:30:49 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:30:49 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/20] clk: bcm: clk-iproc-pll: Demote kernel-doc abuse
Date:   Wed, 20 Jan 2021 09:30:25 +0000
Message-Id: <20210120093040.1719407-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/bcm/clk-iproc-pll.c:712: warning: Function parameter or member 'pll' not described in 'iproc_pll_sw_cfg'

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/bcm/clk-iproc-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-iproc-pll.c b/drivers/clk/bcm/clk-iproc-pll.c
index 274441e2ddb28..33da30f99c79b 100644
--- a/drivers/clk/bcm/clk-iproc-pll.c
+++ b/drivers/clk/bcm/clk-iproc-pll.c
@@ -704,7 +704,7 @@ static const struct clk_ops iproc_clk_ops = {
 	.set_rate = iproc_clk_set_rate,
 };
 
-/**
+/*
  * Some PLLs require the PLL SW override bit to be set before changes can be
  * applied to the PLL
  */
-- 
2.25.1


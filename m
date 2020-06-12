Return-Path: <SRS0=pBkr=7Z=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2F6C433DF
	for <linux-clk@archiver.kernel.org>; Fri, 12 Jun 2020 22:52:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8162C2078A
	for <linux-clk@archiver.kernel.org>; Fri, 12 Jun 2020 22:52:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MwdW3bCR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgFLWwb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Jun 2020 18:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLWwa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Jun 2020 18:52:30 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331B9C03E96F
        for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2020 15:52:30 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id p20so11596094ejd.13
        for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2020 15:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=D7ORPB0O89tNgrN/9KBjll99io72ZKSooj4kx4IJCSE=;
        b=MwdW3bCR8Nn+pk+s1Vi4ICKQC9dSGSV7uklsiaqbyA4sLPSP98M06Sxk0YnRlmPcaZ
         sA7BYFEl8mLWqFwZ6wfjbYseyHtR8VYf9R5sU5mUCoCPrOHvU3Bmm0NqwEiMLZ/1QGLO
         xDid7EfTuEq18gwFvbjfAc7FvGZ8gdm7Zbzio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=D7ORPB0O89tNgrN/9KBjll99io72ZKSooj4kx4IJCSE=;
        b=bhSLpq5LxHOPL2fw6K4A8vJDKA1RqbOAEMnAGOgwg4HVCz5DEGOSYLfp4tOMfpen3d
         dq22hEDoN2F9hsoPQt7QIWz3y+iQvtmsJ4BIbbI33YmXJ7ySyzxb7r9GUX971AnF34wJ
         Ig0owYB2NNE1MTEtFBnHPf3EZYNayEWdF0YKIusO4FJhkYLEOK/yJa3Za+ASbVud2p3Y
         AEb/VPJILot4aKywIvwBbKoeAfRcGXNsAHlxg2q6HBuhuVu0rUmUbFvn51FX2Zb1ZjH2
         2nCEys9eVYMZolVP5Qf2DQL+a3qToREOdktKj4j/jaIwpbrobdnn9Di+z0Xr42kTXGHT
         3H5A==
X-Gm-Message-State: AOAM5321PgmZ15fSlcxL2YW0rA01xaQuU8ZJrVu2g2S5dlfDWCwWeIfV
        UkSM3VcIe/JGSoQCh/s6u2F/Bw==
X-Google-Smtp-Source: ABdhPJxSGVAxKxCFLMfetzl0IrrTxR2FBwpvNDo6LG/SnBb8uMHJ8SUDonYdOSLdrekVRGIKMJE5Vw==
X-Received: by 2002:a17:906:799:: with SMTP id l25mr15073991ejc.234.1592002348562;
        Fri, 12 Jun 2020 15:52:28 -0700 (PDT)
Received: from rj-aorus.ric.broadcom.com ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id di14sm3781434edb.77.2020.06.12.15.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 15:52:27 -0700 (PDT)
From:   Ray Jui <ray.jui@broadcom.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Lori Hikichi <lhikichi@broadcom.com>,
        Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH] clk: iproc: round clock rate to the closest
Date:   Fri, 12 Jun 2020 15:52:12 -0700
Message-Id: <20200612225212.124301-1-ray.jui@broadcom.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Lori Hikichi <lhikichi@broadcom.com>

Change from 'DIV_ROUND_UP' to 'DIV_ROUND_CLOSEST' when calculating the
clock divisor in the iProc ASIU clock driver to allow to get to the
closest clock rate.

Fixes: 5fe225c105fd ("clk: iproc: add initial common clock support")
Signed-off-by: Lori Hikichi <lhikichi@broadcom.com>
Signed-off-by: Ray Jui <ray.jui@broadcom.com>
---
 drivers/clk/bcm/clk-iproc-asiu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-iproc-asiu.c b/drivers/clk/bcm/clk-iproc-asiu.c
index 6fb8af506777..e062dd4992ea 100644
--- a/drivers/clk/bcm/clk-iproc-asiu.c
+++ b/drivers/clk/bcm/clk-iproc-asiu.c
@@ -119,7 +119,7 @@ static long iproc_asiu_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (rate == *parent_rate)
 		return *parent_rate;
 
-	div = DIV_ROUND_UP(*parent_rate, rate);
+	div = DIV_ROUND_CLOSEST(*parent_rate, rate);
 	if (div < 2)
 		return *parent_rate;
 
@@ -145,7 +145,7 @@ static int iproc_asiu_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 		return 0;
 	}
 
-	div = DIV_ROUND_UP(parent_rate, rate);
+	div = DIV_ROUND_CLOSEST(parent_rate, rate);
 	if (div < 2)
 		return -EINVAL;
 
-- 
2.17.1


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04C4C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 30 Nov 2021 09:17:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240036AbhK3JVO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Nov 2021 04:21:14 -0500
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:47456 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240079AbhK3JVO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 04:21:14 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3GpR1YPDz9vBr0
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 09:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AAYxdlXeXucO for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 03:17:51 -0600 (CST)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3GpQ6Zq5z9vBqq
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 03:17:50 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3GpQ6Zq5z9vBqq
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3GpQ6Zq5z9vBqq
Received: by mail-pf1-f200.google.com with SMTP id u4-20020a056a00098400b004946fc3e863so12501697pfg.8
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 01:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NIZ6/hw1XbXKmzO5MEDGHAzLrrUD6afmSXwxKYg8s/I=;
        b=D9KCbyPE8cbAAhjSIS3q2zIbB/si0IkVOWglgG0AtZmAnW1IKHFfoy2WJdoDi2jGX+
         QznQAlGRyDJG5WSjdQY5vMjgU0LqT8EQh+Kx3Gq1cyfNCNvg1XdAmr0U4omKWQQqBEOE
         UUUmF+LPHpvh2bwgooNOx1oLjvqBZaFdvFtEyAZ2so+LqJj1VOJQKYx6QhfJuqeQAE2h
         7pcSGCVua1F9BGvchX36yapYJvOVEQjMHCYYM6gnVM0eAGDtw+gFqIz1HBvyxHjCCecN
         q0ZHRBLsVU8E1Hs34Dq73AOxo8ql1lGT0GlFpeAr+1kjs3uR9K+X+PE2dgFGr3efJh7r
         CQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NIZ6/hw1XbXKmzO5MEDGHAzLrrUD6afmSXwxKYg8s/I=;
        b=Le3IDGwsPtaHr+AfYX6kk40nCHroRxJD7SjHwlQKqUoSCHNe0Sq0+/9IxjcuQBa19y
         0GbkTUOdtyvmgTRY0ZGolkCtF+GqnSS/7ESWwrU5IwV1Uuzwhp331G8nauRmaxlc5BzK
         XtS0XHKT58Pc2GpmFXDjJCQLvWE+8z38kuD5dVstmA1a2LSYim9XfDDCYP8ZyDyeSvuX
         LQTjlgg7/xQCGCEbXBJEjtvHhOpVky+6fLJ1OYVfiqzU9EMHBY5wyGWimwycQRWXCaH2
         TQzAO5C6aDidMGKbQ9NWgndoTolk3U4nsBuz4hlBiOVIrD47fo5Ki1v0omsmgUsqsvMt
         iLRA==
X-Gm-Message-State: AOAM531PnnM0DXzd69As/T8B9jfbiJR2nF3I5n1302nawDBp1+q1HbsQ
        BFXjafMk+Pn/KRc5yWZTpzyu9kO5DDPM/SX77MTITSUF4rsM6v0j+LNB7q9xbyYbJvU76hKLxj9
        gBPcbvTT3rfmF2OyK9eFcvX9/
X-Received: by 2002:a63:9b12:: with SMTP id r18mr36848725pgd.367.1638263870231;
        Tue, 30 Nov 2021 01:17:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwE9GjxEfwgileQZRn/vK5o6v6tvFGZ9TQmfO803I9D8llMPNWOFqVq3X0eX5DM9fIdE/TGtA==
X-Received: by 2002:a63:9b12:: with SMTP id r18mr36848718pgd.367.1638263870052;
        Tue, 30 Nov 2021 01:17:50 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id h21sm14275844pgk.74.2021.11.30.01.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 01:17:49 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mars Cheng <mars.cheng@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        Owen Chen <owen.chen@mediatek.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt6765: Fix a NULL pointer dereference in clk_mt6765_apmixed_probe()
Date:   Tue, 30 Nov 2021 17:17:19 +0800
Message-Id: <20211130091720.80514-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In clk_mt6765_apmixed_probe(), the return value of
mtk_alloc_clk_data() is assigned to clk_data and used in
mtk_clk_register_plls(). There is a dereference of clk_data in
mtk_clk_register_plls(), which could lead to a NULL pointer
dereference on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
mtk_clk_register_plls(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT6765=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt6765.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6765.c b/drivers/clk/mediatek/clk-mt6765.c
index d77ea5aff292..5f723906675b 100644
--- a/drivers/clk/mediatek/clk-mt6765.c
+++ b/drivers/clk/mediatek/clk-mt6765.c
@@ -785,6 +785,8 @@ static int clk_mt6765_apmixed_probe(struct platform_device *pdev)
 	}
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 
-- 
2.25.1


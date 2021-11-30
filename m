Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8C2C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 30 Nov 2021 18:15:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239416AbhK3SSj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Nov 2021 13:18:39 -0500
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:33074 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239400AbhK3SSi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 13:18:38 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3VkY2YQsz9vvMp
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 18:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id d54eEKQzFG8f for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 12:15:17 -0600 (CST)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3VkY0MsPz9vvMx
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 12:15:17 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3VkY0MsPz9vvMx
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3VkY0MsPz9vvMx
Received: by mail-pg1-f199.google.com with SMTP id v3-20020a63b643000000b003255b6cb43aso5405004pgt.6
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 10:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8aLbqDVidZ+7wdd4GicAjvyHH7eASjXq9vZdA7OEF94=;
        b=h/zqG5CfkaTPj/bhN4usylXAlQ5g3qbkk70kfXHrteu7ovjt/eVh76QH8Bi0XLCdey
         Lf+TKwTx+LZRn+z5ZdGRTqc8PDJOux825xOZBFTdsbOGAKEYBhkKT7GULROrT2rOQ4NX
         Bo0SzKsQ2P+RpvQZNxmig4beiRzO8jxiMDmnUVPlgM6pobobo16jj9RTxOd8x/k8Bx6l
         v/L4zJiGIKdaWmgOhrQZt4v5rnT8nGpTShtgfrSAdtNG9UhWjwagJr2Kjo2p36ViCVY6
         hYBJH7k5zlfIq8v/iTS2MND/PLDf+4AlUkWy6MC7snl8knter3gEJV+sl52xlobTbYGR
         uP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8aLbqDVidZ+7wdd4GicAjvyHH7eASjXq9vZdA7OEF94=;
        b=Lyk1H8VnY5Z2ACgG10r9kWdoQvPcCKiiT/qjf9B8zp0VU02SaOWotZNQD4Y7E29E/+
         wS1tspWqIgzD8h7y2dsNn49C/arLn76TLNOmG9kdxv1p+iwa27ClCopmhFsW2anIMxH3
         lk34ESPS1EgqF30hM0NkSHolVCRxnhoo20ry0Bybobkf1nBtKjwR+o5A/ih47SNCaC4S
         YxBnW7GqlcD2LMLC6JHvYEyUpuvCl9+DVuKvyoIBXMlSEbuyCGpNXb5yqKCQe1a4phTU
         8xo1WsUx325LDRdYMXScuLmNSV7GMexUZfRJbSb5bEWU5R9D5FRuLWb0dSelXdTePVLU
         7I7Q==
X-Gm-Message-State: AOAM530kI5cO0yVGyC81CHNT0p316tz0lgo23gxXmZVUrqSz/gk3fIet
        sppNIn1LbPN17l425QksfHs+lZAu2SALeV/O7YaUV/Kioima8zgGXANaSqD6aokcxdiCYDkWekf
        y/Ipvcqh1Cvz+E1uB3w03o9j3
X-Received: by 2002:a17:902:e749:b0:141:edaa:fde1 with SMTP id p9-20020a170902e74900b00141edaafde1mr1041437plf.72.1638296116224;
        Tue, 30 Nov 2021 10:15:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFonit7jQbQqW7wbtpwt79Yj99amZxiuzPUHMEFm11chH74+RimyI/4fW4yprB8GZxNrvZFQ==
X-Received: by 2002:a17:902:e749:b0:141:edaa:fde1 with SMTP id p9-20020a170902e74900b00141edaafde1mr1041407plf.72.1638296115986;
        Tue, 30 Nov 2021 10:15:15 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id y8sm22530397pfi.56.2021.11.30.10.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 10:15:15 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Wenzhen Yu <wenzhen.yu@mediatek.com>,
        Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt7629: Fix a NULL pointer dereference in mtk_topckgen_init()
Date:   Wed,  1 Dec 2021 02:15:07 +0800
Message-Id: <20211130181509.222496-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In mtk_topckgen_init(), mtk_alloc_clk_data() is assigned to clk_data
and used in clk_prepare_enable(). There is dereference of clk_data
in clk_prepare_enable(), which could lead to a NULL pointer dereference
on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
clk_prepare_enable(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT7629=y show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt7629.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index 856929f94ebd..f791e53b812a 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -580,6 +580,8 @@ static int mtk_topckgen_init(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
 
 	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
 				    clk_data);
-- 
2.25.1


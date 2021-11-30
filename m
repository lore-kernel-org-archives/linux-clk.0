Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F814C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 30 Nov 2021 09:58:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235788AbhK3KBS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Nov 2021 05:01:18 -0500
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:59602 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235636AbhK3KBS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 05:01:18 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3Hhl08Yqz9vBt2
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 09:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7k4d2_EO9rjn for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 03:57:58 -0600 (CST)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3Hhk58gFz9vBtK
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 03:57:58 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3Hhk58gFz9vBtK
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3Hhk58gFz9vBtK
Received: by mail-pf1-f198.google.com with SMTP id c6-20020aa781c6000000b004a4fcdf1d6dso12571780pfn.4
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 01:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MrDmOmqy53ncuiVE/GEYR1H1+QCkQb8baxwPMZ1tiko=;
        b=bzUs68d9T5urMxTKmIOyZFIVWQNM0enC8qVpTkeU6GGTbxGaHO2Y1eA5KwwMlg1hIY
         ONUFYNTTmKTp9uHx5zb99/5WZ95Yzw5z7wu2l5XyLEN/VRZdqobUvl/dpns5/+6LQZZf
         M2xUwQqyQTo3lhQBYvnss4YCuOvNsXDCU+JQQOtATxaJFClmqt8/M+wSddCu8UwRTLln
         N2DtnIEEPPQXjU6lLHh4mFhZLs+oD4pgmwCrSpmkethS51Xatkm/lh8Y+wnZCamQ5TCz
         xGTEE01kGoxa4T0ArRKugyOAnek/W1htiYzUpSM4cum6LW1W3wyLFYHxtVuihnsBMmid
         0scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MrDmOmqy53ncuiVE/GEYR1H1+QCkQb8baxwPMZ1tiko=;
        b=j4Q90L09eVkAasx+dWMNRiHZjUGXS0Z5GwRF4+g4Dy6jCgultQdWmy33ogMlSyrXHc
         RSJqLPsXFcdrpVl/eWmWancRywu5TrtJ+PS23z3E9FXe2nfj1LGctazxIYeF/TqCr+zm
         Y7xtYkgvxyNsVyXLeB3sUtZIy4xpKVlQZc78vNUGBGp8hJt6xR4Z49wEi6kTaUXIra09
         Zthpt1XhQPR5jbRifkxTcpJUb3nVz3jvNZKg6kZLA8Llfwek/saEYdw+xt8+rUa5mrcZ
         WSvEaivjqXQQ1gvQVuuxPzvb9neJ4TblCbajXevCP6V0LRrLlCw5f74+p1fs2fFmQPzc
         tNYw==
X-Gm-Message-State: AOAM5321ExmMBXjZR4Vya1WDTSe3LodW6/LXq0In+TjBTJkiZifpc1h2
        VwxpFitlgpgsvI0IjgjXAw4BYdG78NJ2MPJ7qjJgbwC1Bmv01x2Fxcz+zg5+ArDMjH+L7XFbGzK
        6tnkNk5TdhmSJ1WNxxK5uAL9b
X-Received: by 2002:aa7:864f:0:b0:4a2:ea0a:a16d with SMTP id a15-20020aa7864f000000b004a2ea0aa16dmr45599383pfo.11.1638266277978;
        Tue, 30 Nov 2021 01:57:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyz0S5KZw1PVwUuiwDkP9/RaONTERv32EcCQUY7AvGGsmbqzODVGFX2Awn3Qo0pkVauxwXzKQ==
X-Received: by 2002:aa7:864f:0:b0:4a2:ea0a:a16d with SMTP id a15-20020aa7864f000000b004a2ea0aa16dmr45599362pfo.11.1638266277757;
        Tue, 30 Nov 2021 01:57:57 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id v3sm7229121pga.78.2021.11.30.01.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 01:57:57 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8167: Fix a NULL pointer dereference in mtk_apmixedsys_init()
Date:   Tue, 30 Nov 2021 17:57:50 +0800
Message-Id: <20211130095752.98821-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In mtk_apmixedsys_init(), the return value of mtk_alloc_clk_data() is
assigned to clk_data and used in mtk_clk_register_plls(). There is a
dereference of clk_data in mtk_clk_register_plls(), which could lead
to a NULL pointer dereference on failure of mtk_alloc_clk_data().

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

Builds with CONFIG_COMMON_CLK_MT8167=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: a68224832118 ("clk: mediatek: Add MT8167 clock support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt8167.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index e5ea10e31799..7b18b751487f 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -1047,6 +1047,11 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 	}
 
 	clk_data = mtk_alloc_clk_data(MT8167_CLK_APMIXED_NR_CLK);
+	if (!clk_data) {
+		pr_err("%s(): could not register clock provider: %d\n",
+			__func__, -ENOMEM);
+		return;
+	}
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 	mtk_clk_register_dividers(apmixed_adj_divs, ARRAY_SIZE(apmixed_adj_divs),
-- 
2.25.1


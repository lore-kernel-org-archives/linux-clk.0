Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D701C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 30 Nov 2021 09:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235868AbhK3J6R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Nov 2021 04:58:17 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:37220 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235759AbhK3J6Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 04:58:16 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3Hd93ctcz9vBr6
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 09:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1TBnFDT5BAMg for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 03:54:53 -0600 (CST)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3Hd91TJTz9vBqx
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 03:54:53 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3Hd91TJTz9vBqx
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3Hd91TJTz9vBqx
Received: by mail-pj1-f70.google.com with SMTP id gf15-20020a17090ac7cf00b001a9a31687d0so6648941pjb.1
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 01:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8j2IMMmZh3mhChTW+5ogwreaS6weI3fhZ/Z5pd7AGBg=;
        b=FMhc1rlTm/IViESaAtBZ+npF0jJTpxJuTw7HU8LxFn9REZlDSCmqb+hvzeR0mxjL0G
         7+SfrvvS7eEee3J66f0CyIl14d4u15dSFqRcUDUJ05n5EQQl1Fx5XUhbsH5Ep2LPv+yH
         yHkDmV138czSFtjMnPcZgiozuAIskHN5Ht+UH1mG55785eqtYbrhT/mtkUEWagePtEzS
         ZU0o5nF8SXaHItSL1bBcqZH3Iot6FHBfcKqael2maPR/HXcJ58RxLNVstlI1QI+hapxr
         7sUXow5z01JfeVCFLinwrrl+leW1+Y1KbBUu2izTp0jUyjvGnyef6mgJxRI6Vv6wD0rd
         eaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8j2IMMmZh3mhChTW+5ogwreaS6weI3fhZ/Z5pd7AGBg=;
        b=18/1LTCAxKiewGgJYQKBk31+aLLVzoU4JOAXZCTBnlXJ3lsh1DXWRLOpF9+1r3aEpK
         7MzVWBPoSxTzvI1gYEMIjR4slfbGsGllB8dzXfChEQyjZEqiwYCcYj2Vwn76Rxhbhpkr
         EgkmvCmQNSbvrXXc7eV6R+4gtvGvQ2W3yNzndGdtun53xiEpzb7QKfpwLO/1j/x9X39x
         sdYHRgZGQ832jDB8xLHp1ygQUw+Km5C0aGpL/gouwCc1pff8+aiurzDsv1aP8qb27dCx
         fwj0pX5jwuY8uIqPcD6XMTY1A1cO9F6BVDdKl15/wOIAEGmi4IeQE+roWXTyntCtQXbD
         B9Aw==
X-Gm-Message-State: AOAM5304c9GVh4HY9tDUt1MgBAuNRf4hzRYi2tNH/FqHRUHCwnIAe2/h
        EyP0Z5mYySm9RbzcEjHf6WOjSgsROEdHOKnjZNvBLG3OQADHv/ZuFCT2ygYIQQfnD/0Pqpsapxb
        FaCcjk1lECFx/QZbaKqQzpZA9
X-Received: by 2002:a17:90a:df96:: with SMTP id p22mr4731671pjv.129.1638266092394;
        Tue, 30 Nov 2021 01:54:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzD2Ed1coxhmeojB7a08fyyA3nzo3B45XUiYIE5WseZnbq6NvpuCZVBmmjco4vlGCpgh83KdA==
X-Received: by 2002:a17:90a:df96:: with SMTP id p22mr4731651pjv.129.1638266092206;
        Tue, 30 Nov 2021 01:54:52 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id d19sm20459573pfv.199.2021.11.30.01.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 01:54:51 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        James Liao <jamesjj.liao@mediatek.com>,
        Henry Chen <henryc.chen@mediatek.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8135: Fix a NULL pointer dereference in mtk_infrasys_init()
Date:   Tue, 30 Nov 2021 17:54:44 +0800
Message-Id: <20211130095446.97423-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In mtk_infrasys_init(), the return value of mtk_alloc_clk_data() is
assigned to clk_data, and there is a dereference of it in the parameter
of clk_prepare_enable(), which could lead to a NULL pointer dereference
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

Builds with CONFIG_COMMON_CLK_MT8135=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: a8aede794843 ("clk: mediatek: Add basic clocks for Mediatek MT8135.")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt8135.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
index 9b4b645aea99..b4e20bd7680e 100644
--- a/drivers/clk/mediatek/clk-mt8135.c
+++ b/drivers/clk/mediatek/clk-mt8135.c
@@ -547,7 +547,11 @@ static void __init mtk_infrasys_init(struct device_node *node)
 	int r;
 
 	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-
+	if (!clk_data) {
+		pr_err("%s(): could not register clock provider: %d\n",
+			__func__, -ENOMEM);
+		return;
+	}
 	mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
 						clk_data);
 
-- 
2.25.1


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B32C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 30 Nov 2021 17:32:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238842AbhK3Rfm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Nov 2021 12:35:42 -0500
Received: from mta-p6.oit.umn.edu ([134.84.196.206]:57644 "EHLO
        mta-p6.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234421AbhK3Rfl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 12:35:41 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3Tn13prFz9wNLj
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 17:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xaJ6qbEHpI74 for <linux-clk@vger.kernel.org>;
        Tue, 30 Nov 2021 11:32:21 -0600 (CST)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3Tn11kX0z9wNLn
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 11:32:21 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3Tn11kX0z9wNLn
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3Tn11kX0z9wNLn
Received: by mail-pg1-f199.google.com with SMTP id n22-20020a6563d6000000b0029261ffde9bso10653806pgv.22
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Up/NfjS7VaEB7cP0OIMaR/6NGfFlxGpUC060f7VlH8=;
        b=LgbIzllkX7OSlmNsxiG9OyhKA9X8UUrr90oDFyxdQ+6FldFgZ8OhhiTr6jrVGJVYxX
         ak2A0Ye/ZBh6tUuTMvOqcMrw7VPz11kYIhLhpXz12X5ydvHHg+rOvXSIWq24u0dqifXb
         XtObr0aB/0rORTIujfzrno9fV2Y58GG7QwMmpbc/eWvHV7SiJzuzFcyEelXQ2jqXwfpr
         BnuBDW/e480tQO66CQRRyD0HGN9LQ056YdZqJgWekP++dGT26QNhjsH1DsSujWu3oeml
         WbKzePa+fT/5g8RC2OXMpb/ae0UE+BvMvjkPF9963Z9e1Zb1rAWZStGyj6+n7JXb31p5
         0QEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Up/NfjS7VaEB7cP0OIMaR/6NGfFlxGpUC060f7VlH8=;
        b=0deSB4obw/7bgBZ78DI80tS3UuFoCJHJoRb9uJfcnEBeJjOJQ7h88wO9ox+Xn/D2vz
         vZjgyVotFZ6IjF0iSwQmkNb4/mGV3O1hJxSkOXZmbi8nEKkBmsOuApmkwMmmAJFpGTIS
         TVGJHO/xJWUB5AKE34sJUgsy4Gu2+qs4KeNvckhJdtjFvaXMvuyWtH5uNRmnb7CE1asa
         5DRP1wHhJbjKh+9ntMHT2gXjgQs3rx+t+EamGfD8CXluc4FKW0r3u64kvjy//yQDgmCs
         ruJXDf/UsmY+y/GODHogwIja4zMkC2nyeFjTI1ngmmpKFUn1rBZe6kTar2AFsfUZuYLn
         QwlA==
X-Gm-Message-State: AOAM532IYHsWvLSPynQIOm0GS6N+tm0oU5I473E36eB93oYqtPS1jKDV
        Kxm6fZiFWzurr+jjl/dutzpGWIiClzMXkfvvEJg80rFELLLa00b6gPhfE0kRPZZGVwWMM5aPwYK
        cRC0frp673B5zlOhCSLC9gI+g
X-Received: by 2002:a17:903:4053:b0:143:6d84:984c with SMTP id n19-20020a170903405300b001436d84984cmr722903pla.37.1638293540395;
        Tue, 30 Nov 2021 09:32:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmkvtdqC18D6/hPwj4l6CmxtmSs28zk1H/DR8W4JVcY3gJp4sR6QDyUJeABZtby3y19rakqQ==
X-Received: by 2002:a17:903:4053:b0:143:6d84:984c with SMTP id n19-20020a170903405300b001436d84984cmr722863pla.37.1638293540151;
        Tue, 30 Nov 2021 09:32:20 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id l9sm1342900pfu.55.2021.11.30.09.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 09:32:19 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "weiyi.lu@mediatek.com" <weiyi.lu@mediatek.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt2712: Fix a NULL pointer dereference in clk_mt2712_top_init_early()
Date:   Wed,  1 Dec 2021 01:32:13 +0800
Message-Id: <20211130173215.209258-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In clk_mt2712_top_init_early(), mtk_alloc_clk_data() is assigned to
top_clk_data and there is a dereference of it in
clk_mt2712_top_init_early() which could lead to a NULL pointer
dereference on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of top_clk_data.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT2712=y show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: e2f744a82d72 ("clk: mediatek: Add MT2712 clock support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt2712.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index 08ef56f68c7a..9050927d2d5d 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -1286,6 +1286,11 @@ static void clk_mt2712_top_init_early(struct device_node *node)
 
 	if (!top_clk_data) {
 		top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+		if (!top_clk_data) {
+			pr_err("%s(): could not register clock provider: %d\n",
+				__func__, -ENOMEM);
+			return;
+		}
 
 		for (i = 0; i < CLK_TOP_NR_CLK; i++)
 			top_clk_data->clks[i] = ERR_PTR(-EPROBE_DEFER);
-- 
2.25.1


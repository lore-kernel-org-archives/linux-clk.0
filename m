Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA280C43334
	for <linux-clk@archiver.kernel.org>; Thu,  7 Jul 2022 10:03:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234941AbiGGKDo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Jul 2022 06:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234925AbiGGKDo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Jul 2022 06:03:44 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986182657C
        for <linux-clk@vger.kernel.org>; Thu,  7 Jul 2022 03:03:41 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id v67-20020a1cac46000000b003a1888b9d36so10732206wme.0
        for <linux-clk@vger.kernel.org>; Thu, 07 Jul 2022 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+l1iL0NEuXMTD9v+9+cJIdeSZBJgkzTvXEeRZPmJDmc=;
        b=ILohkxWDl/nTQzvdTCs8NkfmN8dgIhtrnAZn0crydzEMid/17eesAXMw1lryR8vUNg
         dHI1vhLtMVAOnjEYS66sw8Gup4ggYg+CUi5ki4AFxTQ6PiYwpCAAsVzUbXDLHUYIUELv
         MjNC3X6CyG8utflI11bDVMLJEKs7VPYAX3qji72TYPzL/dVnMe2nGVE+csd/enpKur7I
         ANBa3Zt68bafqepLiOEsDK1FDotparNMJWyMg4jd3SwvnhdZhdMu1z49pR+JqBtso11p
         JNndb2Cy1VMsZqu4m4q3+ojhf/3eu/CHbfeTw+Zw4c2NpERB0s5ihjz0LO0HlBmufvY0
         jqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+l1iL0NEuXMTD9v+9+cJIdeSZBJgkzTvXEeRZPmJDmc=;
        b=BewpltLvyLusydNalhwznnBWUbjheX3FsXB5CvBhrjZ/oBgNOKrbSICQwJmzz2Fdl6
         DV8GekPjY/eWQcarEOyEyLB4UPf9UwwfenZ2Pj97jJr1S5OPkzgZBvdRtjrlcwoyHUX8
         NNyAOL93emKJTx6JOvWHy3/bFLwQJy0zjZCKsPQpz6JS/1aSvDYtB6EDogmo3bwdBsNB
         //Z5eDeKjSl1SWi3VEgzl4zzMSSMlARg5Nd9t5qFqzJmMGEa5l6L3CmzfOXZf6QsjpOS
         BRWJ1oJ8J+aiitFrSS/D6pT+TkwrNrEiF0q5lkXQCTHJ5AsmTKE2lU62ot7c86m4rNH5
         lS4g==
X-Gm-Message-State: AJIora/Hh8XhOWJ+ZtvAgbappjyuHqgqj2dkuzDvabVgh1yYjAHFsJTE
        cZqCfk9kVS55GjOOkXxmCiUqJg==
X-Google-Smtp-Source: AGRyM1vwP+rjkJ16/oi7CdPdPHtzE/ugfCPc/WqLwUxB+Yb4OogyiysKjo2MWcBXiuhJp86oGRPH5Q==
X-Received: by 2002:a05:600c:40d7:b0:3a2:d438:4e33 with SMTP id m23-20020a05600c40d700b003a2d4384e33mr113235wmh.33.1657188220194;
        Thu, 07 Jul 2022 03:03:40 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id h14-20020a5d548e000000b0021d7ad6b9fdsm4612034wrv.57.2022.07.07.03.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 03:03:39 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: [RFC PATCH 1/4] clk: Use clk_core_unlink_consumer on __clk_put
Date:   Thu,  7 Jul 2022 13:03:06 +0300
Message-Id: <20220707100309.1357663-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

For consistency, use clk_core_unlink_consumer rather then hlist_del
directly, on __clk_put. Prepare lock is already acquired at that point.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7fc191c15507..e1d8245866b1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4347,7 +4347,7 @@ void __clk_put(struct clk *clk)
 		clk->exclusive_count = 0;
 	}
 
-	hlist_del(&clk->clks_node);
+	clk_core_unlink_consumer(clk);
 	if (clk->min_rate > clk->core->req_rate ||
 	    clk->max_rate < clk->core->req_rate)
 		clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
-- 
2.34.3


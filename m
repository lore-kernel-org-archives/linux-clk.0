Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298DDC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 18 May 2022 17:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241119AbiERR24 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 May 2022 13:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241117AbiERR2x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2022 13:28:53 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343EC19FF43
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 10:28:51 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id 3so2004556ily.2
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 10:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AOx1LypXvhJE14nWPZ5PxL9FhVAWWtg9pDE4J4YMhoQ=;
        b=K0M9wXlEDBj1y6Wt13RE7Zj8BL4HiOajXSxtTGoZiTdjQiNeq4CluQVhZImvkSQbJ1
         i0uzSmq/gTkqqRm3em78DU8AYTuiF4zTPdIiiVw2gEFS/sy0xaV73lj9YD8wlNPZ/imK
         HzECX5Kc62AKFg57kdsUOv6Wduc2vFrCCMpNMmjoZ5MdFv/aH42veIxCRgeu35GtHygw
         gKsSsUoq/NTYe2onrvoeJ7tLskhs4CuFThgAwnWqao7Z/g5apgXNmL1GksJCFD6u9jH4
         Mgivs683kzl3+dllBbHBhIYwB/tos96yvxTsq+ysCFM21YX4fAvnbNzqg7OSYCy4ibs/
         CZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AOx1LypXvhJE14nWPZ5PxL9FhVAWWtg9pDE4J4YMhoQ=;
        b=efA4VjvhSGU6CEv9zlGTsmfwgnUyYJ7f8uzvARqUfTRwuTaM8ZxrAuIrJ5mBDtuY5a
         kAWrE82KRcAdJ12AvcN0qtNaloAE6qcR65qqkofAXaBCOu+xCdyJ54z0L8HzCEsGUk5C
         v39ZBqCW96plYd/RHkWoRObhZB0oXF2tyRIxzkwQ1Qcc17KIIizEsm+b/CNOTtCyL57e
         j99i6iajHYcdzqlvE5r+zIMf6e9gRx2oanMPXqyqPlhJ+1UzScpH0+qRyWPCgXrzyiAH
         TrK6treFkIw1RuChCYmx03fPn0KrTWWgW8jk/KHLFV0yFW8J+sCNe36zsZxxw7xp0xv6
         06eA==
X-Gm-Message-State: AOAM531f3ZZmEQCJmWFOxStRDiUIyATukQmoB8lY7CU0M/MRFcDlp4tv
        QSNYBtw7WTWlDqEvVH+Fu8Nu8g==
X-Google-Smtp-Source: ABdhPJwUNHQWAYmQo+uc5LNqpMPNDRgZ/USR+VN+WwJn/IJjd0Pn21Yg8dlJhCl4V1z/EpCtb67DUw==
X-Received: by 2002:a05:6e02:1485:b0:2cd:fa3d:72b9 with SMTP id n5-20020a056e02148500b002cdfa3d72b9mr423352ilk.247.1652894930650;
        Wed, 18 May 2022 10:28:50 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id v11-20020a05663812cb00b0032ba5cbae2esm12858jas.144.2022.05.18.10.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 10:28:50 -0700 (PDT)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org
Cc:     phil.edworthy@renesas.com,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Subject: [PATCH 2/3] clk: renesas: r9a06g032: drop some unused fields
Date:   Wed, 18 May 2022 13:27:16 -0400
Message-Id: <20220518172808.1691450-2-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
References: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Minor cleanup, remove unused fields from struct r9a06g032_clkdesc.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 0baa6a06ada8..9dbcf9620fa0 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -47,11 +47,9 @@ struct r9a06g032_clkdesc {
 		struct {
 			u16 div, mul;
 		};
-		unsigned int factor;
-		unsigned int frequency;
 		/* for dual gate */
 		struct {
-			uint16_t group : 1, index: 3;
+			uint16_t group : 1;
 			u16 sel, g1, r1, g2, r2;
 		} dual;
 	};
@@ -84,7 +82,7 @@ struct r9a06g032_clkdesc {
 #define D_UGATE(_idx, _n, _src, _g, _gi, _g1, _r1, _g2, _r2) \
 	{ .type = K_DUALGATE, .index = R9A06G032_##_idx, \
 		.source = 1 + R9A06G032_##_src, .name = _n, \
-		.dual = { .group = _g, .index = _gi, \
+		.dual = { .group = _g, \
 			.g1 = _g1, .r1 = _r1, .g2 = _g2, .r2 = _r2 }, }
 
 enum { K_GATE = 0, K_FFC, K_DIV, K_BITSEL, K_DUALGATE };
-- 
2.25.1


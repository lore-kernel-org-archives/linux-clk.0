Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8403EE020D
	for <linux-clk@archiver.kernel.org>; Wed, 13 Sep 2023 20:38:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232600AbjIMUir (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Sep 2023 16:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjIMUiq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Sep 2023 16:38:46 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCED1BC8
        for <linux-clk@vger.kernel.org>; Wed, 13 Sep 2023 13:38:42 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-41206fd9717so1039751cf.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Sep 2023 13:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694637521; x=1695242321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zwVOfYwHpMwktmYsXHkpEkdKer4I1SfhoGgmDQcwfcA=;
        b=DkUODoeoutX+fnNWGpq84ZK2tTioQ3MzRtj6VbRrtDrZ6nAUubNJDEIDlYCQ6CxABj
         vhQuHi/1smrA9X238eSKybfeJIU/DDRZx/RgXY4r0HNyXwV1C8jZQZmYwnzixbFHh9qb
         H61Ysf81rbKAMBMkr3Yasn1tQzpsnHjXrCQqtsUwP/28+BDtnfSbOzrOSW0JEjNQqaRQ
         D53ZEE9lmKVh4ER4jM0ymn0VNkTy8KnejIcdDb07NyksWAbBhYIASxsjoaxdjanRpry0
         1igu8lGpSM6g4xVkKmkODy2fm+OHnmpCMzK8uCFnAuwe3qCQoSXS3gzES1wKlGY1C6o/
         bq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694637521; x=1695242321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwVOfYwHpMwktmYsXHkpEkdKer4I1SfhoGgmDQcwfcA=;
        b=sWS4Q+HLJ+DSQpPx3qhOr1Zk2EpexX9/f5zsdj70M5BQnMCEyhDEg4OSOPQf+/xopV
         RhmKNTGCYtycQLxezpoPjsM50REznLXCVq7AQz/ZwTOmbZO2cwHRPiOk+jMrWsnWj0s3
         zt3wSk2ncA0YUycuWuBohFaRXd1EeQ/Tpuh9u2S5HxrUMslueLgkJ9jg04ezmz7acdBk
         vOVKIJjI7toZ6jdT+6HKixeG3QgC3kT9B5Nk22sBov5fmvosU6T78m8KcgeaI0O9ht+C
         D+4IpuySsWNsl5ZHEqC2yDfpqmrUQR+l4vECuVseMF+AbremkLlGCTIc9+FZq/te60uX
         4Ipg==
X-Gm-Message-State: AOJu0YyJYRxprd+hj0fA5GdQmHitl9oP0OKTBBvfLpGbNKYvv5/szvx8
        IAuQXbJd9yvTUWHwj4bHZ0FuNw==
X-Google-Smtp-Source: AGHT+IH1ZDZfWwx8ZsEmLQw8AjRhhAy9QDYEdCvB0mO045R5lZFLCXc9qs+DfLxBtLvaL0Kn+ok1hA==
X-Received: by 2002:ac8:75c8:0:b0:416:6663:3812 with SMTP id z8-20020ac875c8000000b0041666633812mr1808568qtq.35.1694637521530;
        Wed, 13 Sep 2023 13:38:41 -0700 (PDT)
Received: from maple.home ([174.94.49.189])
        by smtp.gmail.com with ESMTPSA id j6-20020ac85506000000b0040f200feb4fsm24203qtq.80.2023.09.13.13.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 13:38:41 -0700 (PDT)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2 1/2] clk: renesas: r9a06g032: fix kerneldoc warning
Date:   Wed, 13 Sep 2023 16:38:04 -0400
Message-Id: <20230913203805.465780-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Mention the 'dual' structure in the kdoc. This fixes the following
W=1 warning during build:

> drivers/clk/renesas/r9a06g032-clocks.c:119: warning: Function parameter or member 'dual' not described in 'r9a06g032_clkdesc'

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309101314.kTRoxND5-lkp@intel.com/
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
Changes in v2:
- split the warning fix into separate commit
---
 drivers/clk/renesas/r9a06g032-clocks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 55db63c7041a..aa00543fe865 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -109,6 +109,7 @@ enum gate_type {
  *             must be in ascending order, zero for unused
  * @div:       divisor for fixed-factor clock
  * @mul:       multiplier for fixed-factor clock
+ * @dual:      substructure for dual clock gates
  * @group:     UART group, 0=UART0/1/2, 1=UART3/4/5/6/7
  * @sel:       select either g1/r1 or g2/r2 as clock source
  * @g1:        1st source gate (clock enable/disable)
-- 
2.25.1


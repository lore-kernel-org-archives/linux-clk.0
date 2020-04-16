Return-Path: <SRS0=ULxT=6A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594C2C2BB85
	for <linux-clk@archiver.kernel.org>; Thu, 16 Apr 2020 08:16:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AD0920787
	for <linux-clk@archiver.kernel.org>; Thu, 16 Apr 2020 08:16:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zlEm/wHi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439980AbgDPIQb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Apr 2020 04:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441252AbgDPIQP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Apr 2020 04:16:15 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2106FC061A0C
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2020 01:16:00 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z26so6760679ljz.11
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2020 01:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PbBj/6CAPFcoz5U/u034FtN2xNNp4RmuXD+n6O4qGMQ=;
        b=zlEm/wHiJ9zzxulOaU9gI8Y/6ULXqoDmMiSwP1UU6rGWgW2QdVUjXPFzDr1U9VOBcB
         9eq/tYFwHfKElvvudtpq+9aQdscqEJf2POXox4FmTVbVqQZf73/8UVHcriZjZn/18paS
         m4ZuvYdNkwhOn+3f7dvO9F5/GbSmWE29XVjqTwN9wCMf7FbNqk45Et/l29WEOfFdmfMO
         c5VcGtaVcOdLPEmFjfaqQ3HbqJseJCY4HdK2AJ5hVZa3S57v48cnE+FCsa40Tbhpq82n
         j5t9GB6BPlcDDrHXFWjJf+Vmd0y6L2QBqfgLHXwKo9S3TFtqgwA8ISjhrgXdLIOIoChV
         m9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PbBj/6CAPFcoz5U/u034FtN2xNNp4RmuXD+n6O4qGMQ=;
        b=o+AjvrZXnw4qNnjZNgGWdT9ZUM8ngNDGSgD4n90mYlAi5b5imM7BPD91xHEIGYWW9D
         aHn+U5uWdAWVK7rqhgPlJlhMvA/JHq3y2oQiW1xY7wCeVT6C5Orx5199/Bn3XA8+rQEH
         8kpt4xT1LXC3cmOIgGWxyBUQjbx8GqhVpMLr72sH3laaDCF/vGsZIyv9YdWESOJiMoFa
         1PtC8u1w80yfIJC42KRYpFqptN3q0w9L5jua5qAZ6QlIQamodEO2R6wbYnKYBaKDBuGC
         gzV4cvt/H9G3IGpRk59MeF55Kso21AT/OS7LGNiRPlftAksr5ZySM0TPpwE3B85+AVH+
         C3+Q==
X-Gm-Message-State: AGi0PuZXkUpdvaUYXJrpJCdlob/5hglAHRvNvWIdEawFVVwUcY2QU8sl
        tYoXWcug7TLj38OGQLKfv+iERA==
X-Google-Smtp-Source: APiQypIm9yBbUMllKk3Sn/qPq+i0hPbt3wtu3E9t1Iw36WPJPj+UU61utHTv2SDmGo83om6obhXcjA==
X-Received: by 2002:a2e:3507:: with SMTP id z7mr5961621ljz.111.1587024958625;
        Thu, 16 Apr 2020 01:15:58 -0700 (PDT)
Received: from localhost.localdomain (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id r23sm14567548lfi.33.2020.04.16.01.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 01:15:58 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] clk: impd1: Look up clock-output-names
Date:   Thu, 16 Apr 2020 10:13:48 +0200
Message-Id: <20200416081348.326833-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The IM-PD1 still need to pass the clock output names.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/clk/versatile/clk-impd1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/versatile/clk-impd1.c b/drivers/clk/versatile/clk-impd1.c
index b05da8516d4c..f9f4babe3ca6 100644
--- a/drivers/clk/versatile/clk-impd1.c
+++ b/drivers/clk/versatile/clk-impd1.c
@@ -206,6 +206,7 @@ static int integrator_impd1_clk_spawn(struct device *dev,
 		return -ENODEV;
 	}
 
+	of_property_read_string(np, "clock-output-names", &name);
 	parent_name = of_clk_get_parent_name(np, 0);
 	clk = icst_clk_setup(NULL, desc, name, parent_name, map,
 			     ICST_INTEGRATOR_IM_PD1);
-- 
2.25.2


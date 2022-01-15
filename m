Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B97C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 15 Jan 2022 18:31:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbiAOSbJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Jan 2022 13:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbiAOSbJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Jan 2022 13:31:09 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503D1C061574
        for <linux-clk@vger.kernel.org>; Sat, 15 Jan 2022 10:31:08 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id f141-20020a1c1f93000000b003497aec3f86so12228386wmf.3
        for <linux-clk@vger.kernel.org>; Sat, 15 Jan 2022 10:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=3Ga+bvSFAomvoRynyex5GBlufyTikSaHms/03QkbXyE=;
        b=IPd2NeMQvBtX0MvYaYP6V1jTV4IaNk3cnCyrY2PuHYoWz+/0YFglhFm9Yc4ZdxvX1k
         nBi4cWpl5GOPEQSV9mcPK2NzF703e5UbPftfc+Rsqop6jU7Y2yCK3Ya+JfizqgWTuiTF
         rMW8Hn75thmmLmttFROgu9DbQzD9DZwPDuZHnQh6Pm72+RBbhC6nmBD6DOxLQS903gAZ
         LVkpG24tcCn22SXoVJIwSRbE3qWjh4kAuM5LnHl66Uz3VqliipXCCZTIyFlgz+k1aO52
         kRzhHQiIRyM6RIh0pc8jxxhX9UOwKSDN7GD9OnZ8TVXMF33u/Q4fc8ZNzDHXjB2aEntK
         DDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=3Ga+bvSFAomvoRynyex5GBlufyTikSaHms/03QkbXyE=;
        b=7qHaL0yaU3AJleAQmEhVnLIrIUltbkrPEzwYX+tVUctvDMftwJFjxOzP5gzCEiWCEB
         vwlkbDG8FAfIMaVLFmAwBgR5jla7owcsfwyRdHHtjTd440KRSoO97dLWDPy+hHLUa4RK
         9w9t+yPiYPOf51NL7PjieJSPuIKO0OiOqderJTXHxATC1v8ewK1h6AhArVIMC6GjLwjK
         T98C+XeC1310uSJLW9eMTbHxn5HpnGj2LePIONfgGQFt7APQcxubj4IcHZDFXvwIukzN
         yfoLWISflba843H38dYAw3NPlvQQ9bEHisY535qenOXnch33iBgusngljWme4CMGZthD
         Eoqg==
X-Gm-Message-State: AOAM532pUZiDp0g5lJ6ltjlDecYhz3imoe4NTDQKWVuMp+O5+7K1F1Va
        aBA+YDeMRTUhZsAHlUDHrF3xrc8dg4o=
X-Google-Smtp-Source: ABdhPJwXwRM4KA0rrvCjhj6RY0Dto2lrdxPkVIOkU5XCWru4tK5c6XY+qhQpNV+NRU2jPZ1NxRKCmg==
X-Received: by 2002:a1c:540f:: with SMTP id i15mr20154154wmb.181.1642271466586;
        Sat, 15 Jan 2022 10:31:06 -0800 (PST)
Received: from elementary ([94.73.33.246])
        by smtp.gmail.com with ESMTPSA id e17sm8570704wrr.34.2022.01.15.10.31.04
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 10:31:06 -0800 (PST)
Date:   Sat, 15 Jan 2022 19:30:59 +0100
From:   =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To:     linux-clk@vger.kernel.org
Subject: [PATCH v2] clk: mediatek: Fix memory leaks on probe
Message-ID: <20220115183059.GA10809@elementary>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

----- Forwarded message from José Expósito <jose.exposito89@gmail.com> -----

Date: Wed, 15 Dec 2021 08:29:15 +0100
From: José Expósito <jose.exposito89@gmail.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, ikjn@chromium.org, chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	José Expósito <jose.exposito89@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2] clk: mediatek: Fix memory leaks on probe
X-Mailer: git-send-email 2.25.1

Handle the error branches to free memory where required.

Addresses-Coverity-ID: 1491825 ("Resource leak")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

---

v2: Add Reviewed-by tag

Sorry, I forgot to add linux-clk@vger.kernel.org

---
 drivers/clk/mediatek/clk-mt8192.c | 36 +++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index cbc7c6dbe0f4..79ddb3cc0b98 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1236,9 +1236,17 @@ static int clk_mt8192_infra_probe(struct platform_device *pdev)
 
 	r = mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks), clk_data);
 	if (r)
-		return r;
+		goto free_clk_data;
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		goto free_clk_data;
+
+	return r;
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+free_clk_data:
+	mtk_free_clk_data(clk_data);
+	return r;
 }
 
 static int clk_mt8192_peri_probe(struct platform_device *pdev)
@@ -1253,9 +1261,17 @@ static int clk_mt8192_peri_probe(struct platform_device *pdev)
 
 	r = mtk_clk_register_gates(node, peri_clks, ARRAY_SIZE(peri_clks), clk_data);
 	if (r)
-		return r;
+		goto free_clk_data;
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		goto free_clk_data;
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	return r;
+
+free_clk_data:
+	mtk_free_clk_data(clk_data);
+	return r;
 }
 
 static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
@@ -1271,9 +1287,17 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
 	if (r)
-		return r;
+		goto free_clk_data;
 
-	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		goto free_clk_data;
+
+	return r;
+
+free_clk_data:
+	mtk_free_clk_data(clk_data);
+	return r;
 }
 
 static const struct of_device_id of_match_clk_mt8192[] = {
-- 
2.25.1


----- End forwarded message -----

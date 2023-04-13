Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39026C77B61
	for <linux-clk@archiver.kernel.org>; Thu, 13 Apr 2023 21:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjDMVjd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Apr 2023 17:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjDMVjc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2023 17:39:32 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184934489
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 14:39:31 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id q5so9335346wmo.4
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 14:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681421969; x=1684013969;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zz78mqpdfFC3Sk8OAfqHSfILvBJAp1baciGW5F5+h8k=;
        b=IDnGEJor8dFMRpJYOLeWa34GKvzYJF5UvcYzSXW0ZIX7NgNwXZ+YDXdHFuUp+TBIDz
         ybQWt4inebsZk4uk6GQoRr3kO/J8Cuum32ICtc6GnxMN0dM1sXX3s3L1tv1w4WRgf2oM
         hYJlv5OAhsUIu0/LSvluDccvCZ6XcAivd1o5g9vPLpefWVZKeDOBFJSabOIQ+pZvR1Jy
         jTdhvnmBFFrr1GGUw0/1zL3A1qZlVbzR93mWdKxMCG43o+vfH88Fl6kFQUUjupy5mA/g
         8CujNVyQb6uifL6AqrkfFlfzpl6N1y1Q+/jZqDqzxm/jFkCdjekhtkCEDIBRWagJtkbf
         1KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681421969; x=1684013969;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zz78mqpdfFC3Sk8OAfqHSfILvBJAp1baciGW5F5+h8k=;
        b=kU2V2cS75EnvocKG2eTDfODC0NFHDxQAIOoZBRM497UEfNW54L0P9wOw8j28FFUG8A
         TMNotyfvoDLih5vyWq3B6DNB51dCRnfqC3NcMJZXnc3uGUne6qKMDJZiY20Vy5TGay/h
         N0nYcADRH1xCaii7yd8cSNdv6r8Uq2MyJtr95bu/PwN1yA7fWYvD8otQobVWuy2q20//
         y6gP5PRQ4owRmxFR8jb/U/Cqc8fru5Y/04QcLatRB7X60Up1/iax/fZ4/XjIPLh91Xx9
         s4efu5f8jXS2JUUQ8Xh/EoW0pz1l1FABFeiSuXmzLVy7VLWa/MAKvT3IXnrYMTFZNC/D
         A5cA==
X-Gm-Message-State: AAQBX9eJ4LDGQj+D+pXi1jXxPXNQIPs8ROpxQS8N7psevxCMawLhJxS/
        vZzgnhM9isszZMgHYOb69YQ=
X-Google-Smtp-Source: AKy350Y9OGQ9uq78btrzeRKxw7uEtYohEgTHzD6TzAkcgvyYvGUQrSLRt3fNTO8ShhE6pY/R714vrw==
X-Received: by 2002:a05:600c:ac6:b0:3f0:ad48:6ef with SMTP id c6-20020a05600c0ac600b003f0ad4806efmr1972979wmr.15.1681421969398;
        Thu, 13 Apr 2023 14:39:29 -0700 (PDT)
Received: from ?IPV6:2a01:c22:738e:4400:f580:be04:1a64:fc5e? (dynamic-2a01-0c22-738e-4400-f580-be04-1a64-fc5e.c22.pool.telefonica.de. [2a01:c22:738e:4400:f580:be04:1a64:fc5e])
        by smtp.googlemail.com with ESMTPSA id k15-20020a05600c1c8f00b003ede2c59a54sm6501346wms.37.2023.04.13.14.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 14:39:29 -0700 (PDT)
Message-ID: <4eb4755b-7a06-6cd9-7c9d-6d088d05ab19@gmail.com>
Date:   Thu, 13 Apr 2023 23:39:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] clk: change clk_hw_create_clk() to avoid being unable to
 remove module
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

With clk_hw_create_clk() we have the problem that module unloading
is impossible if consumer and provider module owner are the same and
refcount is incremented. See also following comment in __clk_register().

/*
 * Don't call clk_hw_create_clk() here because that would pin the
 * provider module to itself and prevent it from ever being removed.
 */

I think this also affects any usage of clk_hw_get_clk(). To deal with
this let's increment the refcount only if owners are different.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/clk/clk.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 27c30a533..e9bf961d4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -103,6 +103,7 @@ struct clk {
 	unsigned long max_rate;
 	unsigned int exclusive_count;
 	struct hlist_node clks_node;
+	bool put_core_owner;
 };
 
 /***           runtime pm          ***/
@@ -3969,6 +3970,7 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
 {
 	struct clk *clk;
 	struct clk_core *core;
+	struct module *owner;
 
 	/* This is to allow this function to be chained to others */
 	if (IS_ERR_OR_NULL(hw))
@@ -3980,9 +3982,18 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
 		return clk;
 	clk->dev = dev;
 
-	if (!try_module_get(core->owner)) {
-		free_clk(clk);
-		return ERR_PTR(-ENOENT);
+	owner = (dev && dev->driver) ? dev->driver->owner : NULL;
+	/*
+	 * Avoid being unable to remove module if consumer and
+	 * provider have the same owner.
+	 */
+	if (owner != core->owner) {
+		if (try_module_get(core->owner)) {
+			clk->put_core_owner = true;
+		} else {
+			free_clk(clk);
+			return ERR_PTR(-ENOENT);
+		}
 	}
 
 	kref_get(&core->ref);
@@ -4560,7 +4571,8 @@ void __clk_put(struct clk *clk)
 
 	clk_prepare_unlock();
 
-	module_put(owner);
+	if (clk->put_core_owner)
+		module_put(owner);
 
 	free_clk(clk);
 }
-- 
2.40.0


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F84EB64DD
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbjG0Fh1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbjG0FhE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:37:04 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095133C35
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:36:15 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b8c81e36c0so3587085ad.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436124; x=1691040924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiPKeEp/OnJVAeiXOlEa57rkvX7TbeABjU0rqvFwffg=;
        b=Gv96cxC9tN5YDqs7yjb8N7ef2X97pLKH1U6k0a/M+7tHu8ixpB52+7qb1oORhVB0D9
         QkghtXksO+DJ6mH9Ou167j/oqRrieRoLajl4KNITe73qT9k0D8MdIjABMwEyBCEnKcm6
         5pKAoy2HnAHJeBxmcMndj6w+lRwA7MQgCfWd+dKLXwByYc3pk/Avu9Mq/RWtIptpTATY
         MhAfL+v0oAo3OUyfTBIk9DZhrtBBPowoCsTF0Pb35LvC4Ay7OqTgUOgPg6Mvob8Fo6UU
         1GwTxynTvs7fGBrhezkxYimDWOz9A+a7XXUqAz7hes8x014htOJF3wjy3WLVQmvEJ61w
         vycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436124; x=1691040924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiPKeEp/OnJVAeiXOlEa57rkvX7TbeABjU0rqvFwffg=;
        b=FnUrOFu7wWxj65Z0hJ6CRIhrW9pPySmlOoCThH4ikuhHKadbXDfaoS3R96fWjHCxOn
         OkIMeebUXPRSjmlZUj8N+tRVBrSWYDhWNxvhkiWej64Mj+A5d/U+n9Lo93cOvFTy7v3y
         B+Ebm0dvpo7cq6iNOQ8SoYMrpoVJOPaZLqx2ZWt5dwk5UzzFRw8uNjbs90/ezh3if53N
         ScC5ExABd35xVC9AG1rHsWZcY+nMk/9sZhXV0gV+0V9OXzkLj7zQEyMOeRuwKyjdI6wr
         Ex9MOrRdys/KFGNkOrFAgKfEtYejFfqBuC4UKU5E+PUhZSNFE5G/GiloJAF/73oqiMib
         xlSw==
X-Gm-Message-State: ABy/qLYl9ycFzAe++4fX1tcPXW4XOAoADQavC+5HYGrlzIZ6KYhLIruw
        +NrxMkRPI/52pt9nlKUrMy5dFg==
X-Google-Smtp-Source: APBJJlFINJit9i5ARlN+Vsj+y55YmXolkqEqxQH3HTSxW35zdaX+DZVXitsrxj1AE1PQfpnc9plraw==
X-Received: by 2002:a17:902:c1d4:b0:1bb:98e8:5db2 with SMTP id c20-20020a170902c1d400b001bb98e85db2mr3420427plc.26.1690436123881;
        Wed, 26 Jul 2023 22:35:23 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:35:23 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 24/42] clk: at91: at91sam9n12: remove checkpatch.pl checks
Date:   Thu, 27 Jul 2023 08:31:38 +0300
Message-Id: <20230727053156.13587-25-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove the following checkpatch.pl checks:
drivers/clk/at91/at91sam9n12.c:135: CHECK: Alignment should match open parenthesis
drivers/clk/at91/at91sam9n12.c:264: CHECK: Please use a blank line after function/struct/union/enum declarations

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/at91sam9n12.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/at91sam9n12.c b/drivers/clk/at91/at91sam9n12.c
index d8dcff9ffaaa..01d943ebb680 100644
--- a/drivers/clk/at91/at91sam9n12.c
+++ b/drivers/clk/at91/at91sam9n12.c
@@ -141,7 +141,7 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 		return;
 
 	at91sam9n12_pmc = pmc_data_allocate(PMC_PLLBCK + 1,
-					   nck(at91sam9n12_systemck), 31, 0, 2);
+					    nck(at91sam9n12_systemck), 31, 0, 2);
 	if (!at91sam9n12_pmc)
 		return;
 
@@ -271,6 +271,7 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 err_free:
 	kfree(at91sam9n12_pmc);
 }
+
 /*
  * The TCB is used as the clocksource so its clock is needed early. This means
  * this can't be a platform driver.
-- 
2.39.2


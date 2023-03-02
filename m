Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57652C678D4
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 20:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjCBUun (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Mar 2023 15:50:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjCBUun (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Mar 2023 15:50:43 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869CDC4
        for <linux-clk@vger.kernel.org>; Thu,  2 Mar 2023 12:50:41 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id bg11so227193oib.5
        for <linux-clk@vger.kernel.org>; Thu, 02 Mar 2023 12:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1677790241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pOc++n2L0f0xB181spyzmZCpRYCJrprxU4ITd13vOYU=;
        b=WhUXHGR/ArIIxPrVZMgKWLucuSEyc5cbQ6Xktv1nsIyGKvwemcWMA31LhCp8e6pnPb
         NpYk+IF1izdZCIkGaciKcreFzhWjMSUXKZfadv+4CzRRJmk54zd+TD7NkN5qf2DPnsYE
         VCxDgcHrDBHVrK+4K6jn5yH4QaE+hAwI3ZCSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677790241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOc++n2L0f0xB181spyzmZCpRYCJrprxU4ITd13vOYU=;
        b=ZZK9NpLyjeJrV9E4k+FwIyBnrETmaRq7KoTWLOJGRdkzWPB3EnsFyD/v0EWNRAO2Hv
         aIDRjHQg3QyDqKHXbmC3ZD35rUbAuV/nTjHaWSeRrz+tclQQj4UPNLtk6YY3FQQZ6yuJ
         fHB/nb5HlqTD+yrBNfC8kWNPs+BnIPcyhcqPCgZ2xDMh/8e260PyKuPGoTAxgYQRaKpi
         HW4/yOduG5sL8jh7dj29HW78Ns+7jVmpi9/giqb+AqHTsIzIDN8vnLn41h58y0Oa6aGS
         0Oet/FMijbGZsH7WZQfqJPS7WUUrtFlvCiGNx9W9b90Kc2gvLkM4tj0OtkK/4kfN6nR0
         fQNw==
X-Gm-Message-State: AO0yUKVmaxK/+ZefqjwQqTtvrteW+PacLA+lPSTqOy+Fkm7zSORTAlJX
        dwdQwhDjXitMAe6mP8GobRbSC2i2FYPkWGAmtWk=
X-Google-Smtp-Source: AK7set+i0tziWtCp1HSzqwlVl2wNo+KJ3lOgxv82aNICcUu83MKsIIf/K014eWcx/WuvPjj2dD9hHQ==
X-Received: by 2002:aca:f0a:0:b0:35e:b863:1cfc with SMTP id 10-20020aca0f0a000000b0035eb8631cfcmr1816520oip.26.1677790240870;
        Thu, 02 Mar 2023 12:50:40 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch (host-87-2-94-251.retail.telecomitalia.it. [87.2.94.251])
        by smtp.gmail.com with ESMTPSA id k124-20020aca3d82000000b00383e12e20c5sm104729oia.24.2023.03.02.12.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 12:50:40 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-amarula@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [RESEND PATCH] clk: visconti: remove unused visconti_pll_provider::regmap
Date:   Thu,  2 Mar 2023 21:50:28 +0100
Message-Id: <20230302205028.2539197-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Field regmap of struct visconti_pll_provider is never used. Remove it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/clk/visconti/pll.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/visconti/pll.h b/drivers/clk/visconti/pll.h
index 16dae35ab370..01d07f1bf01b 100644
--- a/drivers/clk/visconti/pll.h
+++ b/drivers/clk/visconti/pll.h
@@ -15,7 +15,6 @@
 
 struct visconti_pll_provider {
 	void __iomem *reg_base;
-	struct regmap *regmap;
 	struct clk_hw_onecell_data clk_data;
 	struct device_node *node;
 };
-- 
2.32.0


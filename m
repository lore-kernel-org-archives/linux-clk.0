Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD4CC433F5
	for <linux-clk@archiver.kernel.org>; Wed,  2 Feb 2022 13:50:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344594AbiBBNuI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Feb 2022 08:50:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344537AbiBBNuG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:50:06 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC928C061714
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:50:06 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id c194so6319766pfb.12
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o96FYGbHJ72XBS1HhlvbpoWVDn8elKqn4OTG7Iw+mEs=;
        b=RhLz21DXPJQfKR+n26oncQXVj4xqQ04C52QcLlmftxu0nWOcTJ6Y5dYYkD9/QSgXhw
         JfOiFZAQSUL3eQTzvcQQBKph1gciE1wZgXFlj/zYQljKWURs7XFvrEXNGtNx/nQ34RV3
         bt0VE1z5lCh5z8dM+b/Jin29QyTIS4H7MUYv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o96FYGbHJ72XBS1HhlvbpoWVDn8elKqn4OTG7Iw+mEs=;
        b=ylB4fJb2pX8Di1uahstuVQZQkFISz3uWyqhwOim1YrXeYUpAJWD39KjG3TdesBDKJk
         EqzJmTa7UzruDJb9b8Sd8ePk40Esi0pAeWOUaG3FTNIMYC/jUij/eAIxzTIBSmLhYa7L
         IXCTc0wAUdo31lhaxli1PHF51YFamjgZUdUx7vd/HeCcJ1+pl/uYBH45SV3BRRhZByDb
         C0iaKtIZgLpp0Q8zZv7UV04JqAVeiAfz/LfzncfldpJOBh1WbeGmOfR1tPAQiKacCPEv
         WGevThwNXj+vtboRENH80KFtMc/jVVP82A0IZFolpNKBi3OSURLoL+9hkXosKbyz7kJX
         XBlQ==
X-Gm-Message-State: AOAM533np4kC14Ft9d6jjv1ST3Mw/o3EX5G5VKQlKYOEHyR74shKNfzG
        wsew4GN5nzuUn95MF27EVnOfSw==
X-Google-Smtp-Source: ABdhPJwGk4mMv+6QTWbFNcM4eaBrE2MyeosyxrmnAMXK3NCjCSxZCRqIb3HJDTR1SsrBYzKnGI0BBw==
X-Received: by 2002:a63:d943:: with SMTP id e3mr24468905pgj.427.1643809806414;
        Wed, 02 Feb 2022 05:50:06 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:50:06 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/31] clk: mediatek: pll: Clean up included headers
Date:   Wed,  2 Feb 2022 21:48:17 +0800
Message-Id: <20220202134834.690675-15-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some included headers aren't actually used anywhere, while other headers
with the declaration of functions and structures aren't directly
included.

Get rid of the unused ones, and add the ones that should be included
directly.

Also, copy the MHZ macro from clk-mtk.h, and drop clk-mtk.h from the
included headers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-pll.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index b54e33b75d4e..8439d37e354d 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -4,17 +4,19 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/slab.h>
-#include <linux/clkdev.h>
-#include <linux/delay.h>
 
-#include "clk-mtk.h"
 #include "clk-pll.h"
 
+#define MHZ			(1000 * 1000)
+
 #define REG_CON0		0
 #define REG_CON1		4
 
-- 
2.35.0.rc2.247.g8bbb082509-goog


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E492C4332F
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jan 2022 09:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbiAVJST (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Jan 2022 04:18:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234104AbiAVJSK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:18:10 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A423C06174E
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:09 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id z10-20020a17090acb0a00b001b520826011so7072825pjt.5
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vNUxjw49tFByvcP8t/7//e7iEPYHFps9QVk8zZRKtaU=;
        b=FphTI/EUT+pYQ6+s8N+x8etvO1gp8ydoS32Ye8uTFtcA0dTunlpW4uIwQ8xsAMAxcJ
         59qGp9DBrlbRSSwNDb82LSehk5xTkcD/mHbvAFeT676O/lkQPLP6mUPFmHnuvbvCzsH0
         CmhrQYDiTI3PF6wwTPqVw2KJy6h1l7YA5ZCvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vNUxjw49tFByvcP8t/7//e7iEPYHFps9QVk8zZRKtaU=;
        b=4+F9yLhT4WmpGgd00LJVuvp3tnF1+kJxTRkYZws2k54zJWNn0+S3vVRN2max9MamHM
         4rDCvx/G5tW4IDVzAquJuraJdE1nxBDzn1TCrh2dkbjkCij7Pr1AG6aoxeMUXK+/dRFd
         nDZL6QGJQsrnQ+kQVFjlc0iqumTjOmhQ/tiqc1art7pApMLmGeeJh/OASePygE2YDlyJ
         soxIKKkwWxc3dYd7aUFVZM6ybsNM+DS38h4j3+3VjyEiGOkJ4ojDzIhF80vZmuUXt43M
         83p0wQXxtBp/5dEn49w9OPFuVmTyemvcHXNOGONLVzwgemQsgHfrEixzh2CiiZLEWdgM
         vRGw==
X-Gm-Message-State: AOAM533yaO5O7CyOEM41GQZCwOZSaaTt2kvJMaqDfn8Rc6VO6BTQ7/4I
        s1OUQlFdy7MvRi0otRiEEqA7lQ==
X-Google-Smtp-Source: ABdhPJzt50XykWx+0tWjlGukGzZMOR/XsM+FWIFaNqeZRK3fs6wk/ktZqv15RMlzys50RaboRzuhyQ==
X-Received: by 2002:a17:90a:5e05:: with SMTP id w5mr4443843pjf.57.1642843089091;
        Sat, 22 Jan 2022 01:18:09 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:18:08 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/31] clk: mediatek: mux: Clean up included headers
Date:   Sat, 22 Jan 2022 17:17:11 +0800
Message-Id: <20220122091731.283592-12-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
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

On the header side, replace headers that are included purely for data
structure definitions with forward declarations. This decreases the
amount of preprocessing and compilation effort required for each
inclusion.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mux.c | 11 +++++++----
 drivers/clk/mediatek/clk-mux.h |  8 +++++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 2d4d8dc0120a..01af6a52711a 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -4,13 +4,16 @@
  * Author: Owen Chen <owen.chen@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/slab.h>
+#include <linux/clk-provider.h>
+#include <linux/compiler_types.h>
+#include <linux/container_of.h>
+#include <linux/err.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
 
-#include "clk-mtk.h"
 #include "clk-mux.h"
 
 struct mtk_clk_mux {
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 38a2b6014b08..903a3c937959 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -7,7 +7,13 @@
 #ifndef __DRV_CLK_MTK_MUX_H
 #define __DRV_CLK_MTK_MUX_H
 
-#include <linux/clk-provider.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+struct clk;
+struct clk_onecell_data;
+struct clk_ops;
+struct device_node;
 
 struct mtk_mux {
 	int id;
-- 
2.35.0.rc0.227.g00780c9af4-goog


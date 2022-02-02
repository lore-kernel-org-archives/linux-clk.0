Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BFCC433EF
	for <linux-clk@archiver.kernel.org>; Wed,  2 Feb 2022 13:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238980AbiBBNuS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Feb 2022 08:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344556AbiBBNuB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:50:01 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08B6C06175A
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:50:00 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id h23so18329630pgk.11
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=atVL6xJF/54HJ2aWxtM+9tGv7OBG0H7yvFIiBDi452k=;
        b=KokZ29ZgNuAl3t+XgjfUEk3Bpr7iTEs+HxAkSQTAjFt8MtVd92B7EM//xJfeoxHFcG
         CURs15ExfQ68RVYPKdkpcVHsJ21gFZHbfjRcl6tSu5KwHMu7ghFUrJxeLlmkYGyzqhJY
         eJSDBxTcm6jX8Ys5/RBbe5fsYH5hpW/v1bP7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=atVL6xJF/54HJ2aWxtM+9tGv7OBG0H7yvFIiBDi452k=;
        b=wanmUdMZEG6dw0rc4hu3hnHWcf0iU6oot22Nn/9ObrNEBV/foub+wc/A1JcWLoSkTP
         bOpl8JudWJ8sfA6pixBrr0m/nOqU8DDUtHnV35Kp8q/qN2YBpSbJzaEDKfL8rtXnwebS
         KfFMztcU7PW3NOsatOZzNHxQr9cygS925EahFpfjmQboR9Sv3KJs897kNYTi6b7C8Sa3
         u9PL9ksnO6PBMUz+qi5yK6sCrHrwq0OTZ5zwXNdGYIJ1CyJpxY55iDxIdI7Gh5E6/pBX
         tESn1H/PtnCMwTFGfTV6Lmw3TGPUIlYbetekEOJ9yMdl0V9CWvxaPRbD0G4dQVdVUjE+
         tOvA==
X-Gm-Message-State: AOAM533b8tO9Vl/iF3D6E0r6u0qER3uoJM2/471i8VWuB7SEcKv5Y0Gr
        U4PkSVJUI89/tgdflJi3AtIP3g==
X-Google-Smtp-Source: ABdhPJwJNNtXsmuuzMgKjlUyJSyJMix5Mr8FLafmoEYLOBjBKCisUB5Vl/24ORK+SOxnDNq5ZWil8A==
X-Received: by 2002:a05:6a00:15d5:: with SMTP id o21mr3872002pfu.9.1643809800457;
        Wed, 02 Feb 2022 05:50:00 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:50:00 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/31] clk: mediatek: mux: Clean up included headers
Date:   Wed,  2 Feb 2022 21:48:14 +0800
Message-Id: <20220202134834.690675-12-wenst@chromium.org>
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

On the header side, replace headers that are included purely for data
structure definitions with forward declarations. This decreases the
amount of preprocessing and compilation effort required for each
inclusion.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
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
2.35.0.rc2.247.g8bbb082509-goog


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C73C77B7A
	for <linux-clk@archiver.kernel.org>; Wed,  7 Jun 2023 10:58:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240187AbjFGK6o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Jun 2023 06:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240183AbjFGK5k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2023 06:57:40 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14961192
        for <linux-clk@vger.kernel.org>; Wed,  7 Jun 2023 03:57:03 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f6dfc4e01fso72083475e9.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Jun 2023 03:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135396; x=1688727396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnMTB1gQyvEeZp7nZTAM6BVyhIRBWpY4lFqsFPGfZMM=;
        b=yGS9r2A1xgdQzVP4dihVaE8lusnrMU9qumXIEZ+USwaQXiI/Y3/pw0wHKjtSKuOh/p
         IIzwkTH1fhQ1R9gSAEl6xGUAAETAsr5aPVlflmcVeulAuNvYhDsZF940O/kmwThj9kTI
         auSVKiOjFTuBT2g8zix67oQik+EJV+Rvmb3ACEeL/c5Xssa+5JQBIPfp7mHqrcedF3k/
         CPbqF23LwDtOl8062CZsrn/0TTimpMTUNFJKn+TAeLum/Z5eBWfhBiKu95/F4UWOap5J
         /WritJ9fe1hUrNATwQayvnFrsVxIOT/zhwiNzPspvk+Ujie26qhlnEySwHu9DdEDRcXx
         Ehvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135396; x=1688727396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xnMTB1gQyvEeZp7nZTAM6BVyhIRBWpY4lFqsFPGfZMM=;
        b=ZQhcBfyzFHqJ/3IqIhic1EThU+80qVYDV/5KXX3rkduPuKGY6MmcXqciBEZXDMICnS
         bBYpXPNtAX1yDD6ebPZK1q01vVn6vW9qqfWntcofmEaX5H852jVyy23+24EfMs2YMp0w
         jgpgM8MPz5wq8UohMlkL38h8krCBUoCgrf8LqJxGyiA/qTlXeLBmPVg9hZA3tc6QgY+3
         NOoaXMOd3Y/qDdkjsYRLraekKMfWPPebH8Hcv8/RT8brvkbVlJhISSEPheQptnuaPOA6
         eCHTky6KZ5h/xp2S5u7//I786P9yPRyHZYucTfwx73Lvn/mjvWbT0BUgNAZrpaPsTxLe
         kcgg==
X-Gm-Message-State: AC+VfDxGm6dSU1fwlbqHtjv8wI+fV+F9B5KYCB7fVQtKCYPhn6RFcexw
        U+UQ3cCQ22N1kCQ2QLOEVJyhYA==
X-Google-Smtp-Source: ACHHUZ58EvoPYuC5nZs66WOAPONtdHAb797/8fHYHvmBuwVELAHZs9tvGj3wF0mebUj5GAurl5ARmg==
X-Received: by 2002:a1c:7215:0:b0:3f7:dfdf:36ce with SMTP id n21-20020a1c7215000000b003f7dfdf36cemr6877223wmc.9.1686135396566;
        Wed, 07 Jun 2023 03:56:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c290a00b003f60faa4612sm1761879wmd.22.2023.06.07.03.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:56:36 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 07 Jun 2023 12:56:25 +0200
Subject: [PATCH 14/18] clk: meson: aoclk: move bindings include to main
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-14-9676afa6b22c@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4058;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FAGqTS28vY4TA8ryV7GfqsaTq2wyyajQNS171oDhvXo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgGJT+mKi8cd1UlKPoKTBHBSQhYVzjPlpEaF7dsBc
 atUX7ZmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIBiUwAKCRB33NvayMhJ0S+YEA
 Ck1hq8jC1gcmtNViGR6dPVN0ot4jPzoiBmbWPOkJgGCzgXNbmuAhra566hDE+YEFexOU60REdOTyI1
 UkP/WerO+WdJTCK47r/kS7iouqLxYltUmujw5wlSNwuRgjG6NGC3fcS0MUjbfsONZhFexZjr1NM+uS
 H1+lVf+91M4wWUl8enMgPxsYEqqS7Hq3Al6/ALJUkjVN/Y4oaSH+vHZ55h46b+7jJZvNUTBUmclED9
 Tq3oJ6BY+uVCNDeCkdBR5dVZZwgIes2Acm2MUHpHUmrHsR4mhkm4EYef0PTYMqljjn8QevUw0cn87V
 DySnXu20dOFsiUqhfwXJnNPKuW7dnNOWTpi7NOnFVoUt5094la/m4ihv9zJZ/LW7pD06n1bJDZvHmA
 Rgy5xSbute20oPer2lBsx1R4j519ZmZ4uhHB9jgJAvcI9jF8u/eXkFdIFp0vhgALBSbp64j8jfDu8H
 29g5a387liydAp1qmmM2gmn+Hl1M5dFP2Yw9eciMqbatZVw5tlzVnIFUznW4KT+19Y7TUGa0J+v054
 jJsmav68gNlK1kelh8j2wYozuW15TiNJh5BO8jI1GWQqgajCAYX60uUDX+Z4g5u3GVLiSCYlsDTgii
 ew7XaAlaSEVEeHSZCTxxeNn7YsIThHmjYu16If/Hco2qzh6vpv31TYzFCtIw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now the clock ids are no more defined in private headers,
cleanup and include the dt-bindings headers from the main
driver file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/axg-aoclk.c  |  4 +++-
 drivers/clk/meson/axg-aoclk.h  | 16 ----------------
 drivers/clk/meson/g12a-aoclk.c |  4 +++-
 drivers/clk/meson/g12a-aoclk.h | 13 -------------
 drivers/clk/meson/gxbb-aoclk.c |  4 +++-
 drivers/clk/meson/gxbb-aoclk.h | 13 -------------
 6 files changed, 9 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index db5b53146bcc..fb470459aaf8 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -14,11 +14,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include "meson-aoclk.h"
-#include "axg-aoclk.h"
 
 #include "clk-regmap.h"
 #include "clk-dualdiv.h"
 
+#include <dt-bindings/clock/axg-aoclkc.h>
+#include <dt-bindings/reset/axg-aoclkc.h>
+
 /*
  * AO Configuration Clock registers offsets
  * Register offsets from the data sheet must be multiplied by 4.
diff --git a/drivers/clk/meson/axg-aoclk.h b/drivers/clk/meson/axg-aoclk.h
deleted file mode 100644
index fe23dc53aa73..000000000000
--- a/drivers/clk/meson/axg-aoclk.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (c) 2017 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- *
- * Copyright (c) 2018 Amlogic, inc.
- * Author: Qiufang Dai <qiufang.dai@amlogic.com>
- */
-
-#ifndef __AXG_AOCLKC_H
-#define __AXG_AOCLKC_H
-
-#include <dt-bindings/clock/axg-aoclkc.h>
-#include <dt-bindings/reset/axg-aoclkc.h>
-
-#endif /* __AXG_AOCLKC_H */
diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
index 52501ec709f7..392e1805f1c8 100644
--- a/drivers/clk/meson/g12a-aoclk.c
+++ b/drivers/clk/meson/g12a-aoclk.c
@@ -14,11 +14,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include "meson-aoclk.h"
-#include "g12a-aoclk.h"
 
 #include "clk-regmap.h"
 #include "clk-dualdiv.h"
 
+#include <dt-bindings/clock/g12a-aoclkc.h>
+#include <dt-bindings/reset/g12a-aoclkc.h>
+
 /*
  * AO Configuration Clock registers offsets
  * Register offsets from the data sheet must be multiplied by 4.
diff --git a/drivers/clk/meson/g12a-aoclk.h b/drivers/clk/meson/g12a-aoclk.h
deleted file mode 100644
index 9d6eeb24ae0c..000000000000
--- a/drivers/clk/meson/g12a-aoclk.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
-/*
- * Copyright (c) 2019 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef __G12A_AOCLKC_H
-#define __G12A_AOCLKC_H
-
-#include <dt-bindings/clock/g12a-aoclkc.h>
-#include <dt-bindings/reset/g12a-aoclkc.h>
-
-#endif /* __G12A_AOCLKC_H */
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index b08f60f5a73d..f3723c0d6a01 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -7,11 +7,13 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include "meson-aoclk.h"
-#include "gxbb-aoclk.h"
 
 #include "clk-regmap.h"
 #include "clk-dualdiv.h"
 
+#include <dt-bindings/clock/gxbb-aoclkc.h>
+#include <dt-bindings/reset/gxbb-aoclkc.h>
+
 /* AO Configuration Clock registers offsets */
 #define AO_RTI_PWR_CNTL_REG1	0x0c
 #define AO_RTI_PWR_CNTL_REG0	0x10
diff --git a/drivers/clk/meson/gxbb-aoclk.h b/drivers/clk/meson/gxbb-aoclk.h
deleted file mode 100644
index 94197b957512..000000000000
--- a/drivers/clk/meson/gxbb-aoclk.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Copyright (c) 2017 BayLibre, SAS
- * Author: Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef __GXBB_AOCLKC_H
-#define __GXBB_AOCLKC_H
-
-#include <dt-bindings/clock/gxbb-aoclkc.h>
-#include <dt-bindings/reset/gxbb-aoclkc.h>
-
-#endif /* __GXBB_AOCLKC_H */

-- 
2.34.1


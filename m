Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15FAC7EE2E
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 10:19:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233148AbjFLKTt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 06:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232740AbjFLKTK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 06:19:10 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB11CC8C
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:59:26 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f620583bc2so4686111e87.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563872; x=1689155872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cygOskfWXusdpGUAH4VtoxUGPB85ArQ0tIqjq+ZLZMY=;
        b=wiUoGsdWU47N/zsJmYKgM11VRIQxfUHl/wDow3WU+7YUHWCiFAb2fLY8mjy6ooRqsK
         puMI5rU80RYYcFz7iHpQuOmaj4n8BUO/vrn45OyZBYuIcE27lVOE+ivRdkACIEbmCBSr
         TSqQb9lNAbm6l2qAw6yhFwYY3x/EvoYgqlhvuMflxvk93w33Jtgz2Q9QBxxOehslrHeF
         NVpvKOnQR1DIzxa0IDYexOD4+bpScGr8s/t5eudKoUptjCz+2RZ+UWD0mQQpOi/9rIxO
         74lz6EJcKnXQnwFPXAyX8JPxicHkGqW6+CZDhW7HD3zu4MX/sJVG8ZI5agjBlEkxV+V9
         dx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563872; x=1689155872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cygOskfWXusdpGUAH4VtoxUGPB85ArQ0tIqjq+ZLZMY=;
        b=l9HJNCA5ekbInG6UZWrvYXK+ezFNVrKWNrGhs6ubIXoj/bHo99ivbOqSlnpSb3o+dF
         lzE1D8sNow9WBmgCb1aFFLwwqjaPJwYyfpYGOYGUY1DOrFFd8BYVZ+Q5njqsuM5lYNvt
         xvym3gP86FYBTX2JyliJblShY3HmFbOFb7SsaNQR4DeDWnUco6ciuAnkM9Yz5+jYrmSz
         rSzgH225Z/qllWcQC3qgaclifNdHbCsxyRkgU/BrCtQmzXmWbeYYUTEU1K0nC54MVrVl
         yFB+ZFoGO/O4gKXuLGRUn9Mfm31om6ikq4NQcPvae8pLhJ/GgT+Z1M6T+92HRUsY9Vtp
         BN4g==
X-Gm-Message-State: AC+VfDw13YE1rFAlYhV4NfmJmQ0gzhwZLNdiAuy+DXQa++Ai3WyP1EnU
        hSiKlIlx4QghSNJ+QZdhq/KLCg==
X-Google-Smtp-Source: ACHHUZ7YJy6tu64K5FLHKVS3lhMDWbGs93kRlOXDyiti2Ma8AlEo3Y2ZfLIxRyzYFy9oFz6bPMdE0A==
X-Received: by 2002:ac2:464d:0:b0:4f4:c972:981f with SMTP id s13-20020ac2464d000000b004f4c972981fmr4263806lfo.54.1686563872398;
        Mon, 12 Jun 2023 02:57:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bcd19000000b003f7ff520a14sm10829525wmj.22.2023.06.12.02.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:52 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 12 Jun 2023 11:57:35 +0200
Subject: [PATCH v2 18/19] clk: meson: meson8b: move bindings include to
 main driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-18-38172d17c27a@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=F+2Srg/4sQPMMfVWsDuv7F9eteW1x3up035F2/YQpfY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhuwMMKtWPmeip81lFra9k4LHq4SHD3LGAt3P6j/j
 jdneYnqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIbsDAAKCRB33NvayMhJ0RZEEA
 CcMf271vDPYofqAE6DHXz9RcQGziswp5v8xT6Mn99BRK/QQMOupQGM83aLXYCVC6ytBxzru/RlmkXc
 TOJO/H0UvdEcR8Scu/lq5WnMKwnZm2K0hem9noz1xeaVbz/JKhAr3wTYaV29FskgXXAJFH64gSPC95
 sEip7dRQmFM8ZKQVPqyaJfuIeeJzWozkkBc4XaQj9W50/V6vi1IpsoVlDqxW3qArXCQmUSynyjUWoA
 po8xRZfUB93zbWFNg/sRuaY8Bf66jVt3GH58AAmtco/i/T1Rj07N9E8u3ofq+jq5vtRRvE7cy9yJgq
 aWPWjV/F3Faa3GSuWOEmoc4A/6NdhZyPJNhrBR6cZGPTYdv/DZW4VOp/xdbBcMBuC1V2OBA2qpurnc
 EwMH9fv15V4iJnvBXHPrFJ5mzOVNLgCp4CGpK1EK1bODBQs1igv7A0QxPLEj2MtvTvGY7prfPY90mh
 SRogtVHXhoW188QV/Z2AXsE3QVorpULU+cbvONLbYRMoIeZDBJHyJ+O+5fuKnhNo5IGKhCTKOPSmWs
 bHtKh/KnTr3cBettR6+ekGP1uuxiJLHfFHMJldc50Zt0IxjRi3ouAu8BVezlqjZ6frFsR/OPgj2PLG
 QIGCV2jW63nnMUXK1c3CSoTRZDWBQfh4ZUoe/yK+kt2MB/yonwZtet5G5sWg==
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
 drivers/clk/meson/meson8b.c | 3 +++
 drivers/clk/meson/meson8b.h | 7 -------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index cea246daea39..b7417ac262d3 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -22,6 +22,9 @@
 #include "clk-pll.h"
 #include "clk-mpll.h"
 
+#include <dt-bindings/clock/meson8b-clkc.h>
+#include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
+
 static DEFINE_SPINLOCK(meson_clk_lock);
 
 struct meson8b_clk_reset {
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 2a9c4fe29ca2..a5b6e67eeefb 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -77,11 +77,4 @@
 #define HHI_MPLL_CNTL9			0x2A0 /* 0xa8 offset in data sheet */
 #define HHI_MPLL_CNTL10			0x2A4 /* 0xa9 offset in data sheet */
 
-/*
- * include the CLKID and RESETID that have
- * been made part of the stable DT binding
- */
-#include <dt-bindings/clock/meson8b-clkc.h>
-#include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
-
 #endif /* __MESON8B_H */

-- 
2.34.1


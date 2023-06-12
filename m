Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EBFC7EE23
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 10:19:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234640AbjFLKTr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 06:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234182AbjFLKSz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 06:18:55 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D618B4C2D
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:59:24 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f81b449357so8046635e9.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563867; x=1689155867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHrltOhPwHWK2bpR0DxoLOvFiRn2yagBk1jYIwgsaRc=;
        b=tizzqRcgqnQYo+vgXGfCnsf6C1pKJL1H8uO7YhkPj1fHRBJ5t38+sUTKZkDmuYpwaD
         hBN6iM2ibkN+ZVHUPsVNY3cX6Tl60AjXtJpOtzOLKMP+pPY6HtRFOIUH4ZrbYsdaEHIx
         oOyb4pB2QVbkthpuilWds5kbyqNHxJz8zUr5mfzLwXaoiIkVJSRTFOQZEdoe4e+gtcUv
         2pkXPZv/GM2hubzH+VX6XVTt5b+rKvik5qjMCREr+T1ZxTkCxIBjOO4JKW2AS1JmObye
         EAPCNlYfoGkdgtk5ioHrtg8EYz8UiUW1gDaxC4iGYT0Viuq8QwYmTT5O2ChTWHq/nSEp
         QZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563867; x=1689155867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHrltOhPwHWK2bpR0DxoLOvFiRn2yagBk1jYIwgsaRc=;
        b=fULm7QsHV8dz1wZ0n6CJb6pSe5dBOLaIJCG62FaRtLGCkY0YhaO8GSkvkubDhxzmgm
         ejaTtUSRV/dgf3c0bLhswPTPyKlJsBvg0zYWq/vrdCap2pr227qgY0jptG74BK5L0gjh
         wBE81zIm7bI/aqSE4g8uqeEDt5hFa3dX5SKairqsKONf7JDvAf4jZbhoTfZOx8FSzY0E
         fAD3b2+q4Sb7h7Z9ty8mEDg7sE817tUpwuAVuZwda/ncXsN6cRcWOnchVsdYxyQ2GTWt
         OwGQzSDJJEp32rjPDapU/pxZf4p3dIsyHVMDPgGJ6eu7yWMwiXQMc7eMXa6xHSRTREr7
         OQgw==
X-Gm-Message-State: AC+VfDyM9Ojx41HE+LAg7Y1nltg9GzWPP2cGOsGUGzpav2AHBeaAg9qy
        vlwX2nN+ib6lqNC1dL6i7Tm7hw==
X-Google-Smtp-Source: ACHHUZ7kjssbuuRQE6AsdkofCzBOcOoUw8S9J6qf3RvSPEniHYZVNl5WkdGRORjIf7TygcLYcywmVg==
X-Received: by 2002:a7b:c419:0:b0:3f8:575:4a9b with SMTP id k25-20020a7bc419000000b003f805754a9bmr7056547wmi.30.1686563867322;
        Mon, 12 Jun 2023 02:57:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bcd19000000b003f7ff520a14sm10829525wmj.22.2023.06.12.02.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:46 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 12 Jun 2023 11:57:30 +0200
Subject: [PATCH v2 13/19] dt-bindings: clk: amlogic,a1-pll-clkc: expose all
 clock ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-13-38172d17c27a@linaro.org>
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2543;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8+Beuenscy4bmR1N+SURUZHfM2VbWNc/8zWOD3YMkRw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhuwKhsxp88Je1fPTOzxc52XMDugQD6BBUFlf3GRj
 zj1XbDyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIbsCgAKCRB33NvayMhJ0eFRD/
 96dVXxJaJYuPFrGVAz/js6Gu2juJbYY8htUTF0i5rAk3s6qxIdxGYTUq0z5vOVjvXp6PzlVHW9gLKX
 uhf2B9uJb7iu+yErma8dEKfNHj+7IEkgUDG8my1nVuUOXJVJIpkw8+1d1zuwIItOla169hQ5Z1UCVS
 f4zMfs7KwXy12JJgU4N6SkxkJ9N8CB4tGDIyCH7XfUQVWfviwGddrvGfT28fu0dO7PTmn7uwlAYtbG
 lA3Jlx/U//ACyf0yfgrX8N0DoPT/7jMTz5XIVT/zbLP+tQSxSxd3M2NzfjVokD0q2JsijJwxEy3tfm
 TZnlNkV/8stkPlZNmzqHvJYnLS/Qwm5mUYOcZEXCuRgPScNDTxmYzCXzJ9FazMvCgxIS36jaAzADPI
 tH1pr2s632awKXSGSvQqlMpd6YJdkToVsHDkFl03zv5oS4R40hZ8cDVAssXWQldEqw0JGmh79Ubh9Z
 PFk61Fc6PKLGRxGBmQCW7MRepaaH/DK5dsx/akMMmDpcZd33RP9VIXEMbsit1NZQVjjEnsrJOU4Vp0
 UGYteO5ooeWV0v3LGn7t6m7qw5YNcfCK9XjNNhWcsuA87psfg5mTZkp4wxgck79fpkWfc6aSSRsDRV
 fr0N4hu084xbPckK6+P3CoS0Dn7AZMUrgssLxKYpb5MJf7z+y1oWstkbgEQQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Due to a policy change in clock ID bindings handling, expose
all the "private" clock IDs to the public clock dt-bindings
to move out of the previous maintenance scheme.

This refers to a discussion at [1] & [2] with Krzysztof about
the issue with the current maintenance.

It was decided to move every A1 pll ID to the public clock
dt-bindings headers to be merged in a single tree so we
can safely add new clocks without having merge issues.

[1] https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
[2] https://lore.kernel.org/all/2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com/

Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/a1-pll.h                      | 15 ---------------
 include/dt-bindings/clock/amlogic,a1-pll-clkc.h |  5 +++++
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/meson/a1-pll.h b/drivers/clk/meson/a1-pll.h
index 82570759e6a2..0add1c7ea9f5 100644
--- a/drivers/clk/meson/a1-pll.h
+++ b/drivers/clk/meson/a1-pll.h
@@ -28,19 +28,4 @@
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
 
-/*
- * CLKID index values for internal clocks
- *
- * These indices are entirely contrived and do not map onto the hardware.
- * It has now been decided to expose everything by default in the DT header:
- * include/dt-bindings/clock/a1-pll-clkc.h. Only the clocks ids we don't want
- * to expose, such as the internal muxes and dividers of composite clocks,
- * will remain defined here.
- */
-#define CLKID_FIXED_PLL_DCO	0
-#define CLKID_FCLK_DIV2_DIV	2
-#define CLKID_FCLK_DIV3_DIV	3
-#define CLKID_FCLK_DIV5_DIV	4
-#define CLKID_FCLK_DIV7_DIV	5
-
 #endif /* __A1_PLL_H */
diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
index 01fb8164ac29..2b660c0f2c9f 100644
--- a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
@@ -10,7 +10,12 @@
 #ifndef __A1_PLL_CLKC_H
 #define __A1_PLL_CLKC_H
 
+#define CLKID_FIXED_PLL_DCO	0
 #define CLKID_FIXED_PLL		1
+#define CLKID_FCLK_DIV2_DIV	2
+#define CLKID_FCLK_DIV3_DIV	3
+#define CLKID_FCLK_DIV5_DIV	4
+#define CLKID_FCLK_DIV7_DIV	5
 #define CLKID_FCLK_DIV2		6
 #define CLKID_FCLK_DIV3		7
 #define CLKID_FCLK_DIV5		8

-- 
2.34.1


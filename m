Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C623DC43219
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 16:09:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244489AbhLOQJ3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 11:09:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244407AbhLOQJR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 11:09:17 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56522C06175E
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:09:16 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id z4-20020a1c7e04000000b0032fb900951eso1801311wmc.4
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XyUPK5oGUcP/HrMf/GM7b7nDYwN4yorA9vguK3F3yGE=;
        b=veKA+/Yiqp9+4bkat66Iy8BK4lpAZbakowoIgHdXjQOmiOUFga4nrBzpJK7hwJ3oal
         I69YKE5QGJTlbESciVuXrRk93QbN2flSBdZ51RZCGYfw7zUwAlhjeogeDTC5Q3UwGQwc
         vnrc7lZSVbwfpBseM4tDm/A7Aj5gOwjyA1C3XK9uf+droavbD9AJ1GBREJzyT24sYlkr
         uF4lULL9ouu3t1nlFLcezHCi5w8JeRTkmfFnsKFbMjLsEanxnW1eRRE38N0kMUsvTfSN
         fvVnvZg+UuZDxU2KO5+8etXssdUFlJHbtXU+45yPFw3VSn5+OLLLCmXk06A98ue4eDxH
         8tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XyUPK5oGUcP/HrMf/GM7b7nDYwN4yorA9vguK3F3yGE=;
        b=vPs7UMm467oiBoFN9b0SKwjxTcarYrnFx2+2ee3J0bpeJLvA8oStTIB6i450xWS7AH
         vJW4zpTOlWoEoPs6gpjynfAuNP4TdLSLSHUVaYFx/47iMGoJtD25zBfDhT9Yh2ksI1s+
         NrVR7M5wmx/AuWKSekmOZOxfxfOeUtmICuHZhRohcDlzbr3Oq0B3cMhkC2sdqtXVi5Se
         zQzWaQGd3vscz/tTMtpwFC4yJtUMWGAKEF3pCE0dFLxafnilS6Q9uYvIL+N3wTA7OuL+
         WnNZgTXhbtwtgI9u/SR09QIHYHmWHBvDuRA+955+hQzeYomH9l/eLe5pYECpNFro3pPb
         8RLA==
X-Gm-Message-State: AOAM531/tJmU4NnuamrZI61BPcx2SxZmfSPgSploCXI0NLB9/Cfmr66L
        Ul5toIMZkmQ3+HvSHDCaEwDKPg==
X-Google-Smtp-Source: ABdhPJx5uy/42LpyPG2TBIVJjk/xEkq7+9Y3BItPABNV1xkLczWxvRcOp7vIjtbb8EE9hQXCzMGdpw==
X-Received: by 2002:a05:600c:2295:: with SMTP id 21mr496406wmf.187.1639584554980;
        Wed, 15 Dec 2021 08:09:14 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id 8sm2762633wrb.49.2021.12.15.08.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:09:14 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850
Date:   Wed, 15 Dec 2021 18:09:04 +0200
Message-Id: <20211215160906.17451-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211215160906.17451-1-semen.protsenko@linaro.org>
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

All Exynos850 GPIO blocks can use EXYNOS5420_PIN_DRV* definitions,
except GPIO_HSI block. Add pin drive strength definitions for GPIO_HSI
block correspondingly.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 include/dt-bindings/pinctrl/samsung.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
index b1832506b923..950970634dfe 100644
--- a/include/dt-bindings/pinctrl/samsung.h
+++ b/include/dt-bindings/pinctrl/samsung.h
@@ -36,7 +36,10 @@
 #define EXYNOS5260_PIN_DRV_LV4		2
 #define EXYNOS5260_PIN_DRV_LV6		3
 
-/* Drive strengths for Exynos5410, Exynos542x and Exynos5800 */
+/*
+ * Drive strengths for Exynos5410, Exynos542x, Exynos5800 and Exynos850 (except
+ * GPIO_HSI block)
+ */
 #define EXYNOS5420_PIN_DRV_LV1		0
 #define EXYNOS5420_PIN_DRV_LV2		1
 #define EXYNOS5420_PIN_DRV_LV3		2
@@ -56,6 +59,14 @@
 #define EXYNOS5433_PIN_DRV_SLOW_SR5	0xc
 #define EXYNOS5433_PIN_DRV_SLOW_SR6	0xf
 
+/* Drive strengths for Exynos850 GPIO_HSI block */
+#define EXYNOS850_HSI_PIN_DRV_LV1	0	/* 1x   */
+#define EXYNOS850_HSI_PIN_DRV_LV1_5	1	/* 1.5x */
+#define EXYNOS850_HSI_PIN_DRV_LV2	2	/* 2x   */
+#define EXYNOS850_HSI_PIN_DRV_LV2_5	3	/* 2.5x */
+#define EXYNOS850_HSI_PIN_DRV_LV3	4	/* 3x   */
+#define EXYNOS850_HSI_PIN_DRV_LV4	5	/* 4x   */
+
 #define EXYNOS_PIN_FUNC_INPUT		0
 #define EXYNOS_PIN_FUNC_OUTPUT		1
 #define EXYNOS_PIN_FUNC_2		2
-- 
2.30.2


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D08CC001B0
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 19:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbjHHTsV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 15:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234788AbjHHTsG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 15:48:06 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26854D237
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:52:28 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5234dee9a44so323511a12.2
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691513547; x=1692118347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMzXqqe28IQY+hzgVA8sdRyW99nsQbJZiTRlRSVrT6A=;
        b=IQYMxi1BYUxixew0iUsdoGG5lQ2W/Yc/x9Izq8S6rO8hLrdntnb/RDGm/b5ptGGtGi
         O+EWckxsSSkDNuERpcXAswa8OPwe/gLVoLJwByLdd5Yg8Zywp0k4Z+U9ww0JQTR3nLu+
         BOzHA4gK6YqlSWdgk7D7tmhm+yEORWc1U3VOu29lyZEyi5VhyeKI7SHdGJlCeBp6mOqk
         gnR203ZuPEN09bsPRM0j2vqJ8cH06Lp8+6a2jLkIJ8NxqGYD84Vj96D6e3XT5URhxhdV
         huKB/aDP1P0b4GXFi0gNHg3swZd+rYF5UMkXZMgMBtGOy9eVrICKn9ji4dm73XgSeXp9
         1k5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513547; x=1692118347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMzXqqe28IQY+hzgVA8sdRyW99nsQbJZiTRlRSVrT6A=;
        b=aWb3oZGO86CmmEgiIS+iFdQj+9CEEyGz+k0GKdqFEwJq99KQU2aLj5Po8G3gQNftuh
         xYWe1yBh/Rges1oXk+AG3csdnDrnzxYBDxx203HKE1mHYn1cfSw+tqnDiupmIUU8IOTz
         1DdJ+vOrc1GZhzEYdoNKmq/wx5YL4uJbwYka5BahLQ0XCs2nkqPOI97kUEv02gCleS9w
         EScWvV6O4+1pnNVLaE3fzOoq3q0P8sOvg/3jbaY08zzwFPNel6QtWk9kgp0eWJRNVEzf
         aJBiUsZLem1pmkd4359IGkaFmxwduNSx+JXHkAjxxdGc0utAyVMCxS7Mj8G+8DITmQyX
         Z5OQ==
X-Gm-Message-State: AOJu0YzuO5rekfnjhX6xx+9qMsJnWag0+vUgG/CAfONvC9DEJc2Ibosx
        uba0jTbjyccwv23oYhrJnmXog079oAwCT/GHs1k=
X-Google-Smtp-Source: AGHT+IE8JZGO5AJlHB0gVlpfgqATSBJHgAWyKC6QKwkPaljKOyd6RoW2fJ5F/H5/4XrPqd1hvBYD1Q==
X-Received: by 2002:a5d:5257:0:b0:314:4a15:e557 with SMTP id k23-20020a5d5257000000b003144a15e557mr8567311wrc.5.1691483272362;
        Tue, 08 Aug 2023 01:27:52 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s18-20020adfeb12000000b0031779a6b451sm12861246wrn.83.2023.08.08.01.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:27:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 05/11] clk: samsung: exynos5410: do not define number of clocks in bindings
Date:   Tue,  8 Aug 2023 10:27:32 +0200
Message-Id: <20230808082738.122804-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
References: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Number of clocks supported by Linux drivers might vary - sometimes we
add new clocks, not exposed previously.  Therefore this number of clocks
should not be in the bindings, because otherwise we should not change
it.

Define number of clocks per each clock controller inside the driver
directly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos5410.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
index d67d67a519a4..2654077211e7 100644
--- a/drivers/clk/samsung/clk-exynos5410.c
+++ b/drivers/clk/samsung/clk-exynos5410.c
@@ -56,6 +56,9 @@
 #define SRC_KFC			0x28200
 #define DIV_KFC0		0x28500
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR			512
+
 /* list of PLLs */
 enum exynos5410_plls {
 	apll, cpll, epll, mpll,
@@ -260,7 +263,7 @@ static const struct samsung_cmu_info cmu __initconst = {
 	.nr_div_clks	= ARRAY_SIZE(exynos5410_div_clks),
 	.gate_clks	= exynos5410_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(exynos5410_gate_clks),
-	.nr_clk_ids	= CLK_NR_CLKS,
+	.nr_clk_ids	= CLKS_NR,
 };
 
 /* register exynos5410 clocks */
-- 
2.34.1


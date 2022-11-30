Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DC7C47088
	for <linux-clk@archiver.kernel.org>; Wed, 30 Nov 2022 11:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234705AbiK3L3Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Nov 2022 06:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234650AbiK3L3V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Nov 2022 06:29:21 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2345FA1
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 03:29:20 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id e27so40566225ejc.12
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 03:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsddZjuiwpi1hxeQr5oczCe9bOg87MCuu+iWR7ARxxg=;
        b=rBQ+HyzyCSGvEl6xTCGbLmibKHPwSei+RSdPq21JQsAe3XJrMk+9ilplTyuSnqaZmQ
         wJu/XUcHb8xEOOLuz7vnmapHpSWCn90gFnpqLp7z0KYJLpjZlqIFhOENylCxtz23Aczs
         0FLj0pdTJM7UwEK6ZD9/635Q9g4a42u2BmVzNBwsKLK9vbt4/YGdkHZ8o9ND5/+frIIU
         wym+8Zsna8maYBR2GiHqHcba3nrejV9qNX7vc6LhTU6ee02IcexSCd+EFr/2W92ueeRY
         /HkwrDuaJx2b0GSgD3gcwI4MMGHuicsp3nmRfhrQbBgLyYldKXMigRS4rjcZGB154yg6
         W2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsddZjuiwpi1hxeQr5oczCe9bOg87MCuu+iWR7ARxxg=;
        b=Ej6Dy08HRckvc100nywZUQpScDH0febyvxqvZzLGSTaF56QC4JOgP6MUudREwRGiH0
         xJw2b49F4eOte8H0BeeZ3RxqmL/O8/5J3fhv0lRXImaZ9jFVSm8RXE62Gv9PukC0sdug
         Wn9SW9loao0nLffhUDQn7gLPP7ZBNv//Eu2+rB9HwxaWTOE2m3N/vdP52PTt7Z+MIxSq
         hkc/S4celJUjo9si5C9Ytv7iy2+pH7LBdCXSt48rDImvWJi94YzJZ1jSClFm5pHbe82a
         wR9KjHgOV7aqxrA5R6FI0vytTKTiDBfzoX6BgQoMldujfhjyuEwUufEef9IgdjvGnAs9
         pUqQ==
X-Gm-Message-State: ANoB5pnnIlgwV03ii4/F8CbwutQD6qx/YtS3tyjYnbtVRZDsEi6lNrnX
        Ib9vPAPXxSSJ7bu0EWaFLSEkKQ==
X-Google-Smtp-Source: AA0mqf4ItKock4qVNORxWKgDIle6+W3fLS/PJW8LzTulaFBDxYi9za6Suolp65zlgpuz8AbD/hfb9A==
X-Received: by 2002:a17:906:3109:b0:7a0:b505:cae5 with SMTP id 9-20020a170906310900b007a0b505cae5mr52521283ejx.648.1669807759070;
        Wed, 30 Nov 2022 03:29:19 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709060a4a00b007c073be0127sm521593ejf.202.2022.11.30.03.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 03:29:18 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v4 3/9] clk: qcom: gdsc: Increase status poll timeout
Date:   Wed, 30 Nov 2022 13:28:46 +0200
Message-Id: <20221130112852.2977816-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130112852.2977816-1-abel.vesa@linaro.org>
References: <20221130112852.2977816-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SM8550 GCC GDSCs need a higher timeout value when polling for status,
so increase it to 1500us, while leaving the delay between disable-enable
sequence for votable gdscs to stay the same.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 0f21a8a767ac..9e4d6ce891aa 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -46,6 +46,7 @@
 #define RETAIN_MEM		BIT(14)
 #define RETAIN_PERIPH		BIT(13)
 
+#define STATUS_POLL_TIMEOUT_US	1500
 #define TIMEOUT_US		500
 
 #define domain_to_gdsc(domain) container_of(domain, struct gdsc, pd)
@@ -107,7 +108,7 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
 	do {
 		if (gdsc_check_status(sc, status))
 			return 0;
-	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
+	} while (ktime_us_delta(ktime_get(), start) < STATUS_POLL_TIMEOUT_US);
 
 	if (gdsc_check_status(sc, status))
 		return 0;
-- 
2.34.1


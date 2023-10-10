Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BEDCD98D0
	for <linux-clk@archiver.kernel.org>; Tue, 10 Oct 2023 22:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234711AbjJJWuO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Oct 2023 18:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234728AbjJJWuE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Oct 2023 18:50:04 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16582102
        for <linux-clk@vger.kernel.org>; Tue, 10 Oct 2023 15:49:58 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-32799639a2aso5989837f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Oct 2023 15:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978197; x=1697582997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5N6uqi00UvIi9OwQaXTzg3QTlqfUdmw6j0gCgPzNTCQ=;
        b=akISxRLBQkxEDVL2V6xY76L2MFD4fdNBHB4+SwCIxBAHAUEkycBrsteHgDYH91ukBK
         IsYlLM35b3QNodVSFVHjpBTvVEvcWpLjk1crVHhLk/zm0JjmvwGw/o4QICF3xgfg6zwj
         CGgwuRv8y2bjYJlcJ4Zq8RuuMd/9Ie9xP30w55meNnuoEgKUQy1YoRMnIZ22TcbHZ3dF
         D0VBdVSAXGdK9P1rHYT3EtRbkTgfWLYLD9Ff65VIUkB9gyOU7DoHY6KIJjFb98N8y7M2
         6aSjeLt+zOWjvmW6UmORGb+xACvGF5Trq8rpbw3LEOIFLmfqMDa0Eor7lVeKLUfLP0wu
         d6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978197; x=1697582997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5N6uqi00UvIi9OwQaXTzg3QTlqfUdmw6j0gCgPzNTCQ=;
        b=Z+fiWjvK6sXeG3RoEY29p1ONQ4D+/e31KFQSZSrz6GUt+e29k3Bl5MlhsBQgD2q43x
         8qeZwI1mtXCdAVzKU6G5/VBXRcAt3n5vcfroPyxeoRICMDZ/y2ebvy+dnIHoNZp4fmV4
         YamynqKOSBebCdV1pecDDX394M+R14yx0ayDAycgnFxf9NzhmuyMotkCfFAoo31VSRVd
         yXT8oZYRFJ3k80KzoEanhM6UMrSw9Ha2r5xrDHe3yoa1XkubyK8ZUdiGd2h1H7mzV7gL
         vOs+JDItv1vgLyMYLyXsF682OSxi8b6z9GODNBYPokAjdsQhO4ePd2GegZcrYe7UMU/I
         gEKw==
X-Gm-Message-State: AOJu0YyeKEghqdEgQeWLglAs2ywjkYYD6qJ+QE/lKlKHA0XIRhdCl1ad
        6E9dQWy23tC3Dlc17iS25Xl5KQ==
X-Google-Smtp-Source: AGHT+IE7hch8Cm0CH6klFQ3QwAy2VSjuJtf78sVmRF1c85lzowQfudVhpSBVhmAyAGdnZWZlPmCBQg==
X-Received: by 2002:adf:f74c:0:b0:31f:651f:f84f with SMTP id z12-20020adff74c000000b0031f651ff84fmr17109139wrp.27.1696978197446;
        Tue, 10 Oct 2023 15:49:57 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:56 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v2 08/20] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date:   Tue, 10 Oct 2023 23:49:16 +0100
Message-ID: <20231010224928.2296997-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add dedicated google-gs101-uart compatible to the dt-schema for
representing uart of the Google Tensor gs101 SoC.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 8bd88d5cbb11..72471ebe5734 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -19,11 +19,13 @@ properties:
   compatible:
     oneOf:
       - items:
+          - const: google,gs101-uart
           - const: samsung,exynosautov9-uart
           - const: samsung,exynos850-uart
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
+          - google,gs101-uart
           - samsung,s3c2410-uart
           - samsung,s3c2412-uart
           - samsung,s3c2440-uart
-- 
2.42.0.609.gbb76f46606-goog


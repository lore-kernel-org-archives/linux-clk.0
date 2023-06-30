Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E48EB64DA
	for <linux-clk@archiver.kernel.org>; Fri, 30 Jun 2023 16:29:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbjF3Q3Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Jun 2023 12:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232642AbjF3Q3X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jun 2023 12:29:23 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CECF33C21
        for <linux-clk@vger.kernel.org>; Fri, 30 Jun 2023 09:29:21 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc244d3a8so15733775e9.2
        for <linux-clk@vger.kernel.org>; Fri, 30 Jun 2023 09:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688142560; x=1690734560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+ge4K54TEOm7/rx5aIH7nXv5noKUxUQbqIp51XysbU=;
        b=J1Ks+nmhLmK/yIjXRjKXrVSyZu+qt4jmmi/bLA1IYs3KR9uimZVAJ1HEuSo5W+Z7H/
         JWKyfCb9ctBjOMB7uqlKuOuSFpl77/Sj1jZTRxnB0Z7fKUvUd+UIgFfZYd3u5PjzcASw
         3lzTO9XjR3dnOSfpDYavATmJoFCSNDJ1aHk0V3O6xZNd99biNOtWn+KKUbIzVVMo77Do
         pK7e81U7FFfrCLzISieqln+zleDgQu3BfE4lVa4lvvxq3jPdBomQ/lr6N9gBwVz7rgYg
         WjnrgtZxK2xvjdgnmGVdJG3WEOMLzyqP/sp3R41U0gOKS3UFUM+9YRsjUQpUJpQXpeQV
         42WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688142560; x=1690734560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+ge4K54TEOm7/rx5aIH7nXv5noKUxUQbqIp51XysbU=;
        b=XCf4P3Zz4wk45O7oimHr5gpTOViWX+4BKH/PtMjB0011khqlJ6ZtR2A/NehhjFDNlJ
         LoCRa+fWZduShYZZA7F/52Z37nMKFcoFvMlZS7usaPH3YZfIPLqYp0/9UHZZhIiw4MvW
         OTmhly7ptr5gTSf1VprIXVKZwMNBGfC6YgKRuLXTLmYHApAIZq+k7IqIQ44o/wvDBhR/
         DtMPkZi+1G0Y3YCqEgeXdfEkAOK6GIY8rsUqLPNsZWd0IuWhOq3l1K5qodjoVrEAa/ca
         2zxCHP+u0MpJH5AdBmEaEPi3C9aMo99UPA4MCeHAMfxj07JMT+fU0CzJJKpZqrbmUkBv
         LQ3w==
X-Gm-Message-State: AC+VfDz0e2r9JCiMCglAYICdrl0C82pNZdJAu4KfTLGj2O6C8aqgMczT
        X7Hn2M6ekcWIMgTxqoK5ILoI8r7GcvyA6BLqFRpc1w==
X-Google-Smtp-Source: ACHHUZ7+BKIoV4xg598c9FcGgrVTApX6k0SblZg1KAXK2Su2xV1DQfef4QNQLs2dAHCtVhgm3/ucSA==
X-Received: by 2002:a7b:ca48:0:b0:3f7:948f:5f17 with SMTP id m8-20020a7bca48000000b003f7948f5f17mr2495585wml.7.1688142560218;
        Fri, 30 Jun 2023 09:29:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:29:19 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 30 Jun 2023 18:29:08 +0200
Subject: [PATCH v6 1/9] dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-1-fd2ac9845472@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Nicolas Belin <nbelin@baylibre.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=708;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2BBkVc8TRDNmHWa33LPRxnRmu9hb0Ks3oe1kaJIh+rY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLau1zel3znaoFXRHvm8v9nGwRc+jS3jn2r5/YP
 4uXeT2yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C2gAKCRB33NvayMhJ0T5bD/
 4imT9yiAOF5zIvuIj9aCuaNMuqR8MW8jMUm6XGMwTiP0uoljcoGWPDwMKyIG1/+/xY42La8gfRHk4/
 3ZtfR0P6o1PAT7b23wDPosJG5xJbLO+RPDSv/z6QLiA9S46BDbYCT4tEcc5OkmC2phi2XJTZN5VgJ/
 +YD6VFQwnwcXNvK5niHTfFY1sOSYJ2kTdVkk128ETB1ihBwTS5k2RpsdpuX08RNUysHizODZk3PeiJ
 GLnKpaVWCVbKJiHsj+09dRgZy5Jk5YzuCQYL5r1lZHpx8fZA7BiLo5UqePwpM1Jjp9B8Y8AhkAxBIO
 7d68VX7wNOJSt0AlbwrelecftuqGoTIUPafuMUAZs5of4hABKdkWm0A1vqx4MuUpR0Rung0dr+ITEb
 Bqbcb0MX6p4G0orZYph0YqliRgFacr9YRSSkmNqpcd2QUBD0dyI2RJAw333tFlcZ5iNDjzuzkyk98d
 cSjJM80zQz74HUL3XyPCuLyAx9SaEL/8G+FGoA9Dx50rPFTA5zcUnBDZQJ86PkfSFBi17y+Js8jUQo
 /qr4cfRdi6sLtneh1CVkNPv1K4fcWOOj+TcTsSNGYwm+PWmrB44ajPm4vuSrZl2Ci6uU5/8PRYjP/L
 hQZYKF+r3whHKpljUXJERnJm9oQTuD9JMJQ/lKKvBR9rJp7ez+rxiwS2om9Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add new CLK ids for the CTS_ENCL and CTS_ENCL_SEL clocks
on G12A compatible SoCs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 387767f4e298..636d713f95ff 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -279,5 +279,7 @@
 #define CLKID_MIPI_DSI_PXCLK_DIV		268
 #define CLKID_MIPI_DSI_PXCLK_SEL		269
 #define CLKID_MIPI_DSI_PXCLK			270
+#define CLKID_CTS_ENCL				271
+#define CLKID_CTS_ENCL_SEL			272
 
 #endif /* __G12A_CLKC_H */

-- 
2.34.1


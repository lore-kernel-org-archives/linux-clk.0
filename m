Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB42C001B3
	for <linux-clk@archiver.kernel.org>; Fri, 30 Jun 2023 16:29:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbjF3Q3m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Jun 2023 12:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232809AbjF3Q3h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jun 2023 12:29:37 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B853C2F
        for <linux-clk@vger.kernel.org>; Fri, 30 Jun 2023 09:29:26 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso23400065e9.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Jun 2023 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688142565; x=1690734565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLQomoWqlEuvut1iVqbbj5exi8ubZWITHtJI3sKzn+8=;
        b=cmgqLpfuvG+if0xbg3zKjJmHd0RdVwXPeIhGpqg1MY4MUogkWDggmX3vNdUceKIQ5e
         J4OQRqLWYhUrTFtpVRdOqJFoNtQURpTCsF9Tua/BR6KVH1Z5uwzkti3gQkxVZQNu9lRG
         0UvJt7czJeoYcSJ5N35jxfpqhWtKcFRfOosQSBu2m8MgCzhs/kJf+QIMSu7DQDxLglis
         VHTPmRYqqhZvvwdiGkLc8dcZE7EKNa4nksg57/BOwLD/22L91EVszEl8D9AkIUQxybIL
         gqvCFsZ2zb/8p+mdWlkttwzh5I94B7T5p4POfgvwOsRQtcTyvJHPy7rfVsMzeI3JC4fb
         V2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688142565; x=1690734565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLQomoWqlEuvut1iVqbbj5exi8ubZWITHtJI3sKzn+8=;
        b=eF+mNcH85WnWdvA5o0FLzG8I+RnWZAo03PX+q1yFf5veBUi8uZt6wuDkR7lHZb2uGx
         VNDVAnGp07RuVSn84f6SKnisiMSdhM4IUoMSdC/ZBPlgLtwzdEGHkMVwLt6SIPBz4bzR
         FwppiuwrqNmfu8mbpL6xL0ccgoN57x33kG+avWzdU5tRV+Dpn78mc43vrEuEHvDAStl4
         1ml2ZFKIowxpDQ+NRV2LsCoAIdW4OUMRir+3B0VMCRVc1PutTmiHVWgyyfttIBrI5iu0
         fh2IYLvd4h9K/OVTAswu8bnxfmPN1Tk1gYHEu73VGatKX+2yRpd0y5M1I05vRO1yVeoA
         9skw==
X-Gm-Message-State: ABy/qLbfgiPbEKlj93JvWsa0YR2GBdHr2g5xn+JC0oQV+ce6DyrJFXSF
        7JccAbVImlpJSu0PvpXFnddQuHPqs12sxpxFg/gmcA==
X-Google-Smtp-Source: APBJJlFauMJrbtEhAPnBe75TN+jmd6XzbnZMpUxj/sIL52hxut6neaSf+FGnEne95dLchbEIkdRBZg==
X-Received: by 2002:adf:cc86:0:b0:314:1244:7fe5 with SMTP id p6-20020adfcc86000000b0031412447fe5mr2455634wrj.55.1688142565225;
        Fri, 30 Jun 2023 09:29:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:29:24 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 30 Jun 2023 18:29:12 +0200
Subject: [PATCH v6 5/9] drm/meson: gate px_clk when setting rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-5-fd2ac9845472@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+pwHqu7ZxC7Ri6gVdtmlOTLk1wyBSRQ1FGdiXUQUWjE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLbtNANq+/HzXMwO/oD3Ticr4j3+8MstaXiDrlk
 AGLwCXWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C2wAKCRB33NvayMhJ0Zt2D/
 9ruyKKElwSqnsoH9WgUG+bQVpc7hi+zAfq714A1xl/IfX6w66J92C407oo1AmST/B7W8nthq2Icl64
 fRZYduun8JHmQE4z82jK3SzdIIXIOe7MJbgZTQbewAwmgbWlWR6uDh8j3KWL5moO/Qn+HAceY6AMBW
 Xz89TrKd6lZYNbksxR3ZdREBUFa3kEbzpKPvuCib1FrsHu3FY/kBVjcZxRBvFXFeyNQwyLVTI9Ww3a
 7iuy5hJlISdeqkRwCOqHDSezEKlfVlCO6vbGEeR5elF2Q0gxfuT+Po/bLLroDP7UuQmtxTna04hF5T
 nuRILRb4+2cb5eOV4392RcLaquxbFdYT+UmaBX3L+7xhDUU9gNciuwNmeR2aIaBEjhqzIHVCbMwyuQ
 vqVhlJM6+M4LPZhy0qXpZuQsuvyinYOY8EcWTWP9taudTNuOD3KD95VMkEpj9ZLoaZojc2ULEZ01oO
 /jwv3hk0TeDgVP72XKk85vJbYGC1xMLkll8XGFDhFOvKHO3B4DEWLkrkyzh2bBS8+VJjh7W42QNzpw
 OuqBk4nmoVKOS0rgHsbN3u0I2sGwFzntG1CU0IDTyfEaI+5kCL/SjIMz6M13N0O4R0zZB6Ak33fDwo
 HUMEub2+IlcdqBVY5vf0vzpRJPzCKd7VO91ARFOBj8+1GAiTwBAlDqcemXpw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Disable the px_clk when setting the rate to recover a fully
configured and correctly reset VCLK clock tree after the rate
is set.

Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index 57447abf1a29..dc63d2d813a9 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -94,6 +94,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	clk_disable_unprepare(mipi_dsi->px_clk);
 	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
 
 	if (ret) {
@@ -102,6 +103,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	clk_prepare_enable(mipi_dsi->px_clk);
+	if (ret) {
+		dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock (ret %d)\n", ret);
+		return ret;
+	}
+
 	switch (mipi_dsi->dsi_device->format) {
 	case MIPI_DSI_FMT_RGB888:
 		dpi_data_format = DPI_COLOR_24BIT;

-- 
2.34.1


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6E7C04FE0
	for <linux-clk@archiver.kernel.org>; Thu,  3 Aug 2023 12:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235778AbjHCMEY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Aug 2023 08:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235759AbjHCMEU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Aug 2023 08:04:20 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B512D6A
        for <linux-clk@vger.kernel.org>; Thu,  3 Aug 2023 05:04:12 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fe426b8583so1910515e9.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Aug 2023 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691064251; x=1691669051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bukD+vfaNL+YfVNownfoGvUgcZVXXiewi9+b8aK/k4=;
        b=rKVR04jHNEb7m+j6Ju64R257mEzNwZRX5LuegQGvKf0rNZ7fhXOlFYjLNKmMJ7noi6
         /XGMx9vTnwa+3fg1AE2+SS3rI7Vwsf+Mk2nWMWKyr+e/N9+FaSefCejwG/qjvKF3pYtG
         meyudLJ2Z221yZYDTym70bhFNgsxJNRdazgE/jjpN2+Mm3hh1qJj9g26O6tt69Adw7uK
         9wVweOqcNH5BpUH1P+/S7/2wnBUOQtNYH2QNCTp9SqSlYq7v31ZSgax7qnjSZriKSLGQ
         Fpp+bIChnubD7Di5NhcSNVGBfm2imTHidHvo2DjrkZ8B8lGNoHwP0BsupAO4mBj56fHX
         xSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064251; x=1691669051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bukD+vfaNL+YfVNownfoGvUgcZVXXiewi9+b8aK/k4=;
        b=KPt4IMKapHdjecr/fuWJZXEnzOnMEbYN04O1JlPxjPLDW9foBc3rOJ97uBAIaMhAwX
         TFk0qB8S/uQ4IQHkvWzcrIRDQtM4O2U1jPjNLGju85+sFKZPi1TaEDIOJnv34rxuEKrf
         Sl+ejb4NN7Bml2UvKBBenwZQMp7YeoXLbD6LbO76S14SeG6WoOc4p3kFHesSXO2DcXtO
         UGuMA502SwE11sc1Lh37rqhaKZmsUuQlGb5dVkhlsQi/tHd+LgWDU4z/B/t4KerBDcHn
         wjn3U9Qsxs2abUfXHiaL9FaDC9EX+LNUYb/6GZuOoOhrizeuKdGGXskAVBtc7j3pNXz7
         CceA==
X-Gm-Message-State: ABy/qLb+/l+dCxLc2D1xoa8I/EeEVfW8hIp7MvBV5gZwu1ZH48rorIws
        LQqrmfIFlIBSXuveyfj6K81YvA==
X-Google-Smtp-Source: APBJJlHXpGd5pZk+1N8bXnGOUabFnlet8QBlyUSI1XL85KAZJS+tJhzwU8IM32+1+MOOvWklRVBZVA==
X-Received: by 2002:adf:d4cc:0:b0:317:6513:da7c with SMTP id w12-20020adfd4cc000000b003176513da7cmr6671829wrk.18.1691064250959;
        Thu, 03 Aug 2023 05:04:10 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id d10-20020a056000114a00b00317046f21f9sm21487465wrx.114.2023.08.03.05.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 05:04:10 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 03 Aug 2023 14:03:59 +0200
Subject: [PATCH v7 5/9] drm/meson: gate px_clk when setting rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-5-762219fc5b28@linaro.org>
References: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
In-Reply-To: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
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
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sigp60iIIGfuykxjcusrCxMI/sxAJ7rWQVYR2AmiPHc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBky5exoK/KXVhmZzz1nG81gxiV+GDC/k/Jey8JHEbZ
 pPbNv+WJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMuXsQAKCRB33NvayMhJ0V4JEA
 CarVWej/1biHKhJe2arNN/UXkePVSvEbiNjoxth1wIKX4FnbszjZE09kIw8/GvChepMJ+hKw0QBiiO
 0C3bS0QBq+5BbHXlGjwG/r9GC4czHI3Na6fdV347zzSOtsBKz5WiNiL6WQEN8MzuDRwjYzT++PGy6n
 bkQiSBQNJALzDTwGztahoq11/u8vf9jWbkwc8CiO1O0gUAaLRmnQckBgjGlJXRDCv9+ETEZA2ObOx7
 7GTqemDacJj+2pQqQ9R9fN+i7b22i1U++C5C3TCGdh6SO82LwiFQGBPUaVy5/lqLe20mcepQI07z1F
 lmZWDJAZm5utoMNurBbdP+zR2ByjACyj69Je1JvjaE3yxsSxEMpeCRRJTwsx4M/wRD8xGmjQwEv6Zt
 rFapHz+3IjAUv8VDOv4yCf6WDhDenS8hro5VyyUvBnqRSvSzjLwtyFMdlEn7L7xAiHezC1ejGlFzAJ
 KZVnIvardIOHidBSUvpUGkeIoXmr+RdxH9meZUcWgVIQQ0xxxh+8Cb0UXE16QHZK8MYOtBciK0fhBq
 7uHOmn7XPhZPbLijHFCBLyhMlftJNcuzXfi5IxtcfxaZcBueZ8zore+BR2aOB3I72JnFUYVMU4BH+u
 F84n6BCygKhXAX395uJuOm3LPD/+B4s+r99NacAaNFYnPhaU4Gkp/8ojacRA==
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
index 57447abf1a29..e995dff8c976 100644
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
 
+	ret = clk_prepare_enable(mipi_dsi->px_clk);
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


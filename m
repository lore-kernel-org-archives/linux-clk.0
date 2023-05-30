Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235B9C7EE2E
	for <linux-clk@archiver.kernel.org>; Tue, 30 May 2023 07:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbjE3Hj0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 May 2023 03:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbjE3HjD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 03:39:03 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D2B192
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 00:38:30 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30addbb1b14so2175069f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 00:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432309; x=1688024309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYg3fc69ScJ7fp+A0MjAsWU7xUehEqfWXj7B6hyn3hM=;
        b=JQ04iDdLMSAvRnw33ada0AcNyYSL1kQOGfFyhn38LnU4wNpARK7erpm/jOrY7x1tLF
         059fkGG17a/oJfyafxgI01ct+6kb2OlEEkol2pmtSb6Z+/NcyZcOyNLhLKUOE7zfrK3U
         N92qonlieUJZjdqOZgsvOaZywmmOS9PjRcQbMGhJWnsH5rV6U2ffzJJZqWjNzFdFuYZr
         q+bb3z1lUADWFL3myXY5/fcSXTzNp6ubNdqAQiyLBaQcECl1y0XCFiRMuiyw9Ry6Mzpe
         cPu9fmNoa/wPIE2sj4ZyJWxHfh3GwKO0z8H3dP81ZaumKnEy75iIWyefh2QvFGSFEURu
         mqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432309; x=1688024309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYg3fc69ScJ7fp+A0MjAsWU7xUehEqfWXj7B6hyn3hM=;
        b=FAGIj2AfvoqnEWx5ZqiuwqgcxoU7QXswKravvkRDcER6eI5cXYgs81Dk0VF6TkzbuV
         q55EJydjGW+Hqf+FPzQECNYKViWhDxJyTIoUV/skJIa69p9bkaY5rRVexiLLMB34yDua
         4Jo0QX4fx9X8J5HDFZ8IUNetA9hKMvTmQi2cNkwr5m1xObMbP37r0h1oe0H977wSXM60
         iET88fyHxCGe41z3FI+SAJPHE06N/rEOcrp5uR2MwMgyHMFenedb+cBS1p66WehHvB9x
         TIA6qZarrWQJ8ORI/75+TP3eXRZoTv4T5cgEAFVbW/UXzmFFCJTL9wFOvxkfqP/BUcn1
         Wb1Q==
X-Gm-Message-State: AC+VfDyWF6dYkjcvXsOcLwDSNKUf+1gXpirr/NW2Djbf2k1SVjOXaJ+g
        DG/jMxYij+y6lHMl43Bkb7JbgQ==
X-Google-Smtp-Source: ACHHUZ6R3/5jCvzC/EfbuZ2wl9ps+H31Dyo4EwKtZB12YzdkTlX839WIivh9XGpn75rT6sT0OWR+Zg==
X-Received: by 2002:a5d:5544:0:b0:30a:e86d:17a3 with SMTP id g4-20020a5d5544000000b0030ae86d17a3mr831595wrw.46.1685432308830;
        Tue, 30 May 2023 00:38:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:38:28 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 30 May 2023 09:38:14 +0200
Subject: [PATCH v5 13/17] drm/panel: khadas-ts050: update timings to
 achieve 60Hz refresh rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-13-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     "Lukas F. Hartmann" <lukas@mntre.com>,
        Nicolas Belin <nbelin@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mst4lZ0rnXCLGGf7dowtnVBMlyjZYveMg1KB2R/Nmno=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafiK1ejjQEfL6v/BkAEbC5WdiwOP7ROMvZsKoYw
 Bm0o05iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn4gAKCRB33NvayMhJ0TDqEA
 CLl6EorbfHvfwJvkIKiFIEFczCFvIK7+cAt6kXd+MZQMXkMsqn5qPI3QRmk1ZBh7lN3LDRxeDrMoVh
 aFNCHjmTsOZDWCdughiNifGjmHO72l6LnfjHZC34b6H+87IZJboWXpjoYqFoLYf0YjiPJh/Zbcfg1P
 UAS97hEdsPuCrQ7fR/PBtK2gtocZFFBhrASg4BvAo5janiHp/zBFZdiGtahO1mn9/NmbYwysvI0hkX
 /v+ZB9ya+Tp1HwvDvPv3nQbrr6dwbny/i+c2I5MORDsyEKxiNMx5IT8YlHDclQND99GPPeUUWRAmur
 afkVVauiVFDjNvftRtHg+5c8pSRPApTa8jJ+sRidFqfHuxfkEZ/L76QHULozYOseDrx776EgU2s1V7
 hJrlpIxerxu8LLI0coEGyEdqkYxwiSlJJ9qgUCJrVu2ifLbFyk7+v9nTw3Y95dzeJvtbeSZG/b2lqx
 Cwx7FOIZ5xE9N5jmECgXAjFBJvU9TdVQU7NgSt9/y6MWVUBY2sP1JP+PfG2u/9SLBEBFelwpZsletR
 tefrmAF/JJdCOus8SXEBBcaUexGMqhxqQqyJV0jonRCk/IMnxaPyBGdy6aJ145a2NF1AwzGLeyuda9
 N5w7eDepG4GrvedwFQN0epbFI86B/7lVlpf09pz2Q2vM1OdV30aAYfxpK4AA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This updates the panel timings to achieve a clean 60Hz refresh rate.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-khadas-ts050.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index 1ab1ebe30882..b942a0162274 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -568,7 +568,7 @@ static const struct khadas_ts050_panel_cmd init_code[] = {
 	{0xfb, 0x01},
 	/* Select CMD1 */
 	{0xff, 0x00},
-	{0xd3, 0x05}, /* RGBMIPICTRL: VSYNC back porch = 5 */
+	{0xd3, 0x22}, /* RGBMIPICTRL: VSYNC back porch = 34 */
 	{0xd4, 0x04}, /* RGBMIPICTRL: VSYNC front porch = 4 */
 };
 
@@ -717,15 +717,15 @@ static int khadas_ts050_panel_disable(struct drm_panel *panel)
 }
 
 static const struct drm_display_mode default_mode = {
-	.clock = 120000,
-	.hdisplay = 1088,
-	.hsync_start = 1088 + 104,
-	.hsync_end = 1088 + 104 + 4,
-	.htotal = 1088 + 104 + 4 + 127,
+	.clock = 160000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 117,
+	.hsync_end = 1080 + 117 + 5,
+	.htotal = 1080 + 117 + 5 + 160,
 	.vdisplay = 1920,
 	.vsync_start = 1920 + 4,
-	.vsync_end = 1920 + 4 + 2,
-	.vtotal = 1920 + 4 + 2 + 3,
+	.vsync_end = 1920 + 4 + 3,
+	.vtotal = 1920 + 4 + 3 + 31,
 	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
 };
 

-- 
2.34.1


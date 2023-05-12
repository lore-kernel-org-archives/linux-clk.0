Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBD4C7EE2A
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 13:13:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241231AbjELNND (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 09:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241103AbjELNMp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 09:12:45 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E95D14341
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 06:12:07 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f435658d23so38493685e9.3
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 06:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683897125; x=1686489125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLBWgiMNwkyCqNWdGx1K4+ygLk3VG9D6DZvu6fKUhDY=;
        b=kYz0ju11D6jUTa4HLXMUI85kDspC8Jjx1paZ1AgUvlNEARse9VXMp67EppR0eALwn+
         rON/U5JQf1qFpk72jiCjxTvJ+mMPKvQLO84oXFvSd+f8Uf3sHhp8Aj0FT0EaiCJ2G9Ug
         8u9OhYquKpxtVOHwm4MOEmS65MpzV7bRgKTlYHC7l0ss5eYzgP71CRacXDtsys6US5e3
         ckFtgA8JfPVM06HtNNLE9cE41REzpGjbgtBDRzGubaWC7Dfu9UEx3Sb6dqXVXT7YzhDQ
         wyh5BrdOZuANfwrWAvJY7RdWfXkNTeHZ2+kcDhoZxfGIapZv3iAmKzCAObbGks2C4asp
         seKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683897125; x=1686489125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLBWgiMNwkyCqNWdGx1K4+ygLk3VG9D6DZvu6fKUhDY=;
        b=iS3Wcckn9CmcbGD3nBw8TgjnyACSZqveqhn2CHQLeMTnZEkw0/HkNBOMCLGOaS+/2A
         HMNL/e4lYzNYFT/brgpO9tb2NDA35OLalPaM+63lVeAxxE9xw9lc14WWGqvZVT6rdMLs
         GX1Pv0er2slVBCWV7PWEv2tl8qvcECqHPgujr3sUc20JH8vgsBFuXbPWWVzT3WReqAgp
         l4lKstj0VlKv9kglsOGtInc0M16KcbPK/heMO+cveMG8MM2a2ryNTW0NlPgwh7dkweC+
         J0Q9K8AhsMzQ49tKYqIPV7Z+NHxIBbigBNz/dgNiDhgA+oMQ3hzv20WU/j5p2x3q6UIB
         T9yA==
X-Gm-Message-State: AC+VfDzGgC8iStHqz9qcH0iR20V4jooGovHtGHOP3ro5WKhMYQohqoVi
        l1yZYajHWB7cj1f0+wMnGpmEHg==
X-Google-Smtp-Source: ACHHUZ5uobz/omWHn5suWrUkzrTkBzpmD/f63IcO56rfuCbjWofaJT0wtqRIazvDS1RzoQKBzvVilA==
X-Received: by 2002:a05:600c:214f:b0:3f4:23cd:6dcf with SMTP id v15-20020a05600c214f00b003f423cd6dcfmr14235255wml.15.1683897125511;
        Fri, 12 May 2023 06:12:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 06:12:05 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 12 May 2023 15:11:42 +0200
Subject: [PATCH v4 11/13] drm/panel: khadas-ts050: update timings to
 achieve 60Hz refresh rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-11-2592c29ea263@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
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
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Nicolas Belin <nbelin@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=PM1rVoTLiKdVLACMoQ2eP/3H3+GG4xHNSxcdM1deMu0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsWCqwAYpj12TIzbwlkf9rcKbazvmpNPhFYFGGi
 4wO5G1CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47FgAKCRB33NvayMhJ0VpWD/
 9DOHdC5AgFrJ1Q9ndeQRh8i4b4H6g8HoCtu/gw1crViqRJUFlOcGhexl5J2mfmiB6r7lsT9+dO/n5b
 rjMPRX/2S8rSw3L15zq+0Ru0idzsr3SCRWs9U0b6xd2EAu0/XKtJdnavjO/nSqVUXbnW0VDZGTW3Pd
 vqcYT0xocfyBd+3kFjqsTRTq7zW9/0+0i7rYYJGfXedE6QIZc5P2NzcfecyBxtltL/o9IMVcDriJqV
 Ox5v4fHagv2aC5O2OrqeqbUdl7i3MnB5W3eshagZwHdXPsWSFeiw8I7WqZ+r2zHe0uD0Ms/oQzgWC9
 nzqUOwazrnR4UBkpkmAOinQDVXpOoviv7qB9TrvIUB37UMJbgmo/wGgPnvbX7aF1RgUQ9ywHDEwmmv
 pvr7YIuF+sMUbDfQGeYfTnjVNYjXWaDRQbbqkZRuLrUaKhKhXOOxmzTfaaRVue4aMXMgNKB3pgwT/3
 IJMg+o4O7TrsSIArWSik5wlsf+pFcT6oDxrKsVqoGzoK3EwAWZZgDcCwskZv/S/Bn8g/86Jh1NX0U0
 uY33smO/L190yI4FYLJd917+c6M7PFebcRd7Lm3+zVYFuFcx9FHYNkhsMqU6d3ZoV4mXrQe0EkDUMs
 F25zx1aZ+UIoKSCg/Ji5H8mByAcYHjH6hn5ziy2VenKxjpoZvIKultpyvFiw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This updates the panel timings to achieve a clean 60Hz refresh rate.

Link: https://lore.kernel.org/r/20221025-ts050-timings-v1-1-5c824bbb24d9@linaro.org
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


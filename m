Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHITyeVY"
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA3E10DB;
	Thu, 30 Nov 2023 07:56:37 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6ce322b62aeso629594a34.3;
        Thu, 30 Nov 2023 07:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701359796; x=1701964596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rgTeL5s3ofedwZl2YbFthmW9shcLKv1EiL+fVf829g=;
        b=CHITyeVYCbKVIzgRDWmUMPhJI5Hqc9FOclKRgWXLqroZ9s5Kgv7zC+H5XFzLmc6+sq
         SeVSBeLCkYp1pTd2OB4Rjhl3lMS0CFwtQueSA8muWJhJwy6T2wY/oVU7nx7cb8lavpkh
         VPrYEHISCX7o3C9dw5EapIQsOPn+9KKaaWY/z9kdQXFQnhK6VpJXm7/aZom/2Fwq8Lnp
         /qMYhN8m+Ig7HutGdd9ht0CtI/IMPInrNk5ilpQ7MxP/nAIU8tcAeA0DO5UrkttpYhFQ
         ZIQSckB0i9YATdxyOdHPqvhMSJqRpNO4TMo/Mv8+3KRbqdS4BzuJVvfU+MUcGheooqK6
         TSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701359796; x=1701964596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rgTeL5s3ofedwZl2YbFthmW9shcLKv1EiL+fVf829g=;
        b=FxjwpVgZG6//YDsYqZ9J99HfQ5A+cYSjbIklZv4mNvmWVz8MVKGFfy68YvDUR39Ka1
         kla5qnkrOcf9efUnGQSnFauxHXsdu/6NJgAoODBhdwVLIasnIu6ZlNQtPMT2Z6YmBrSz
         Ml7B2YrxBMmRuEnQA/s984SQHO93BT2aRP/EjGEoT67ZVeGFlZpNJ2xU09QB7c3dwSQ1
         ttm2/yF5QkxOlzx552NAE9Gi74ncIAuwdFaMc+S5U3MaUGRq6Hh3PrzCLjF5WDJO6x0D
         8r5DdA4M2/IskBh2zzo6evCS0WJtQUP8u5XfwETr9tcyvZVMj3TiB/cdG3cKGtqVMc7Y
         hTXw==
X-Gm-Message-State: AOJu0Yxthqhzi8zqWRMDNqvUqMm41jFR34C2XMVk5vEy1jz1mbwb6xFe
	fYBI1ysGgvH/3NdBpMLqpnc=
X-Google-Smtp-Source: AGHT+IGIpq0HDFW1aPCXeHwe/OsY5YBOo1MLLv/ekDphC3bLN7juAg1D5RuJGsNdYUMwqF8OYWLbzA==
X-Received: by 2002:a9d:7743:0:b0:6d8:328e:faa2 with SMTP id t3-20020a9d7743000000b006d8328efaa2mr12216049otl.26.1701359796668;
        Thu, 30 Nov 2023 07:56:36 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:56:36 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	quic_jesszhan@quicinc.com,
	neil.armstrong@linaro.org,
	javierm@redhat.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/9] drm/panel: himax-hx8394: Drop prepare/unprepare tracking
Date: Thu, 30 Nov 2023 09:56:16 -0600
Message-Id: <20231130155624.405575-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130155624.405575-1-macroalpha82@gmail.com>
References: <20231130155624.405575-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Drop the panel specific prepare/unprepare logic. This is now tracked
by the DRM stack [1].

[1] commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled in
drm_panel")

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index c73243d85de7..3823ff388b96 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -68,7 +68,6 @@ struct hx8394 {
 	struct gpio_desc *reset_gpio;
 	struct regulator *vcc;
 	struct regulator *iovcc;
-	bool prepared;
 
 	const struct hx8394_panel_desc *desc;
 };
@@ -262,16 +261,11 @@ static int hx8394_unprepare(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 
-	if (!ctx->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vcc);
 
-	ctx->prepared = false;
-
 	return 0;
 }
 
@@ -280,9 +274,6 @@ static int hx8394_prepare(struct drm_panel *panel)
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 
 	ret = regulator_enable(ctx->vcc);
@@ -301,8 +292,6 @@ static int hx8394_prepare(struct drm_panel *panel)
 
 	msleep(180);
 
-	ctx->prepared = true;
-
 	return 0;
 
 disable_vcc:
-- 
2.34.1


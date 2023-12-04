Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wo+GJ4D7"
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51181731;
	Mon,  4 Dec 2023 10:57:26 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-58de42d0ff7so2881593eaf.0;
        Mon, 04 Dec 2023 10:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701716246; x=1702321046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rgTeL5s3ofedwZl2YbFthmW9shcLKv1EiL+fVf829g=;
        b=Wo+GJ4D7qK3nsVxwhNBTU6EtG6S73rcoN03FYb+kem1oWfQiSrFO+se7PFP74tLMX7
         cWZjeMgtppbtiRm2bmtt8sMyuwCHhPtmBJaZ086Rrv2n8SDCd93O57WHEOsl5y81SwHZ
         zT2qJ+XfqGW77T849YNNt88DAb7NDt8Kf+GxoiES4L1kWoYSBFoeGjHC4mj0+DL57Dag
         HIzvYSwSWpyd1zBYdE7U682kMAPAzROMCgPTcICRKAslbmIDzHIAK0auzJd+ljYDQ3At
         smH1pqLaIIPR7trzZ1zLsoa6RslSz94cTXYpG5qryvl0OsTzSg2KqqOBMYJX4tI7jKdQ
         d9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701716246; x=1702321046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rgTeL5s3ofedwZl2YbFthmW9shcLKv1EiL+fVf829g=;
        b=AQuhJPlWPuhXnrjZvoCyJiOBPesMtHuGEwZS8R3/RkipTsXwqQb3eCSt86y9LG+502
         PMTWc1UFp2YGILsDzREglz525Ua5xG9eY2qZbCtK5Y0WlOz1txgyZic/RaeYsCynE7nt
         WzblxDWNyVV/KvqOgp4wJfZK9TGFAE0J7662efSoD4xM+a/UdZLf5rFr1rJPpP4quHo2
         MMly7UnbW1kPu279pz+8cLS7ixE/BLs5QbS9wvISBqqeB9IsEROraKuH3/MMcvcfHuAR
         FYM4bBYa3TqmvGT4TgKWQe4Yuca7zOf8dOXx2IXrGFu9/GOg3hVHN3SAPscmuxHr7iNz
         huRw==
X-Gm-Message-State: AOJu0YwUPzv4V6RveCNvgezsldzGHL7aGEJkcXCGCoxqRDzQglu+4ca1
	q5OtyXN1QVNcCIb8UU5w2RHZ6C+ezG8=
X-Google-Smtp-Source: AGHT+IHtinyT3UvNVVgfaiVR9PDPfm0VQnP/g1hm2ope27H09s6RXeCMhC4TJSpO0tvX0PHiAXIDwA==
X-Received: by 2002:a4a:2452:0:b0:590:2df8:1bf7 with SMTP id v18-20020a4a2452000000b005902df81bf7mr724118oov.4.1701716245953;
        Mon, 04 Dec 2023 10:57:25 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:57:25 -0800 (PST)
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
Subject: [PATCH V2 01/10] drm/panel: himax-hx8394: Drop prepare/unprepare tracking
Date: Mon,  4 Dec 2023 12:57:10 -0600
Message-Id: <20231204185719.569021-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
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


Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNKm02Up"
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146A510E6;
	Thu, 30 Nov 2023 07:56:38 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6d8481094f9so653080a34.3;
        Thu, 30 Nov 2023 07:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701359797; x=1701964597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRNLoGhO2BMO9ciLNfM1W1rhqOoDcDjvlbAJTebh+yo=;
        b=TNKm02UpoFMomKPkFTL0yX11bc43tOg8/cghXqs+p8cAhm6VRGcgPrJCEG9J13xed1
         5NSWQMbjj9E93FPvLlwv4vxCU9aTYDqSKh+ZW7z83MgO8J3lhbfuafvOTdV8gNkH/W9X
         /rqqOCsXQY9uapcr1B8shC0Tcax2rOWfNrta5DhSOby2sfKDzs7GvrRP2F3IgG0hbmhQ
         iDkonXpn4y0rUxqQXsxR0mhpZ9yNxHoDQOBpucUYhfMPwId9xAp6cYNu0Z1VCp6KB8sb
         +wbgUMimwxOC3D9MH88ck1LEoVe5nW9t+CKslaJfAIOhC6+ckzx9wSFzzLranvTpIbrV
         9e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701359797; x=1701964597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRNLoGhO2BMO9ciLNfM1W1rhqOoDcDjvlbAJTebh+yo=;
        b=w1jH9/UwHVkDvj7ET07/kc2xSmYuG4c2ZZm2TWGNa4n5JdkGaSW/hKN749uHDIY965
         UcjFtq3cI6NPcnrY40nh2qUpo6qLmkm43d1k3dwCOselCPFTlkYHCdpL1g5otz4KOg13
         bOx7z6nErLlG9ScFrVd+FjItMX1WOicwrFEuITY2ChUTfa6WqiCj1o99+/1oqT+NZEEd
         /DnK7wBiqVClHG7T2j4hBsz3/z9n///ijheT5FJ79uQ5Fli5R9fSjPq9qx8+5dOqRkW+
         jG13XZYxl+spOn2VK6b3A7QY5ighUSjUwguY5RDNAzzVYyuU7qzE6+dzdataoBSvqdv9
         RPaQ==
X-Gm-Message-State: AOJu0YwuUt4vSCgjiVbIrUAGRdqtyzuGz/GcnbmpleEZGzy7AQ6t4Yem
	/FJ5tCx9OTai90c3ixQCpqo=
X-Google-Smtp-Source: AGHT+IFDN2KO5mhmb9kkTeoiK/iTdFDlSusXFHxnNmaSKuAZ/ISuF82jXLCkerZAI+gGVdXWyroc9A==
X-Received: by 2002:a05:6830:2047:b0:6d8:4a96:e4db with SMTP id f7-20020a056830204700b006d84a96e4dbmr7537200otp.31.1701359797425;
        Thu, 30 Nov 2023 07:56:37 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:56:37 -0800 (PST)
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
Subject: [PATCH 2/9] drm/panel: himax-hx8394: Drop shutdown logic
Date: Thu, 30 Nov 2023 09:56:17 -0600
Message-Id: <20231130155624.405575-3-macroalpha82@gmail.com>
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

The driver shutdown is duplicate as it calls drm_unprepare and
drm_disable which are called anyway when associated drivers are
shutdown/removed.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index 3823ff388b96..d8e590d5e1da 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -390,27 +390,11 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
-static void hx8394_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct hx8394 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
-
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
-}
-
 static void hx8394_remove(struct mipi_dsi_device *dsi)
 {
 	struct hx8394 *ctx = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	hx8394_shutdown(dsi);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
@@ -427,7 +411,6 @@ MODULE_DEVICE_TABLE(of, hx8394_of_match);
 static struct mipi_dsi_driver hx8394_driver = {
 	.probe	= hx8394_probe,
 	.remove = hx8394_remove,
-	.shutdown = hx8394_shutdown,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = hx8394_of_match,
-- 
2.34.1


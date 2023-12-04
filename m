Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7bxETBn"
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD9C41739;
	Mon,  4 Dec 2023 10:57:27 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6d87501d6e6so2089326a34.1;
        Mon, 04 Dec 2023 10:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701716247; x=1702321047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRNLoGhO2BMO9ciLNfM1W1rhqOoDcDjvlbAJTebh+yo=;
        b=L7bxETBnbV/YX90KNRNzS/DA443aJKUhxqcYcFVPZlXxwnpdJ3tNmh27C6zW6bL65J
         A21X1yxOoBH0bhQ9N+mXSJpXdm9ldC6J+rFZabsCjJZoUKCwm+sxjKYMRI5KogRV+hZ/
         B40X/iPoTIiDDrf9eVuiIYrrfaiU0fb0ZJKnFBX+sgE4arbof/WqvZCWCLiyTLvFG6HD
         e03VkqBajbgyvkP5f8BwN5+tOC9YgWoaU6378VwCDK7sYT2T6YFvHH7pnW5FI92L3MYh
         moJan/GfejGUBkBHfMwucznv+QQADbwglZ8iKQpxvNG+zl2+G6Uw96WBD1wroCRoJG7G
         iIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701716247; x=1702321047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRNLoGhO2BMO9ciLNfM1W1rhqOoDcDjvlbAJTebh+yo=;
        b=bedeDKnpzr5fRrDHL98md+SdoV4/JXtwqXvnDRLVFw0dmXQ3t3vXhaor6i8mLKhwxQ
         0CWAWaacvJf5wUaI6Xag2PGoB+Nq2psFB7PXuKEGJvfvXWK6TOzcb5f/+rDyo/5TVSgr
         Qlm12FqhlgD9ZonN/IJWWOPJ33d02LXpBwXlqNgBnpdn7L5ovIlKfmSvWRSe366Uhg2I
         PsGBlUP64T1/XQEs8fz07+9rGAPIQfjyJCFWHgkzP7vuSOzpXxsCq5fbyPNIjbkgZfmi
         CBKdTwT9nWBzojJxs96w86VdrfUG1QNxTFzcxj1sPP2eAgp5ZCkTvROqOHmUWt63OhA+
         fclQ==
X-Gm-Message-State: AOJu0YzwxatjPMk5sCXYnyuNUPhT9xLeNw2rEYaW2XOnef3oQJVf/lBX
	MR6+YG6Mwn549+6DCxWA974bxUY6lMU=
X-Google-Smtp-Source: AGHT+IHcWm1h1Em1kIkk/o+9cIGFYSuJffLp9RQVhcgIZgRMRwVf1HJ4lBuXR12rytbhyYdoJFAN0w==
X-Received: by 2002:a05:6830:1283:b0:6d8:7eb4:ca7d with SMTP id z3-20020a056830128300b006d87eb4ca7dmr2963949otp.54.1701716247207;
        Mon, 04 Dec 2023 10:57:27 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:57:27 -0800 (PST)
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
Subject: [PATCH V2 02/10] drm/panel: himax-hx8394: Drop shutdown logic
Date: Mon,  4 Dec 2023 12:57:11 -0600
Message-Id: <20231204185719.569021-3-macroalpha82@gmail.com>
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


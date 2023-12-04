Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSSrInKL"
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87B11A4;
	Mon,  4 Dec 2023 10:57:29 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6d99bc65219so1115093a34.3;
        Mon, 04 Dec 2023 10:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701716249; x=1702321049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqG2snvAFFOieKorYhuNC1Brzfr2ap7NECEbi10aNlw=;
        b=GSSrInKLM/w4oDRq4tdpL7664I+7hs3tyzZmDUG4ylVUlePGEtG5xUH6cxRQzyVs7i
         n89txjd4Hy2Bz/8XKfrCyAb/51y6T4pRQWk12co4GseyMFVi3vDsqYLTTyE4ogmHZldR
         KEAN0AnUQJayasMxqhKKsFEJ5saiMtUiVXa9GEXNjmZ1z+MM98HMLyJeztpFKswHw2kM
         kN3M1bhbYeQ48q7KFXHJltRst3YFVd2g3J2FM9plfdS3YXR+oQakqW/0GcC/l2joX6/e
         gHdgyZKmCoe5nreHiybTaDOzY8DaFSsbyYl0p7eCaQpWcjkhJxiR+hqBP7zYpiuV9x0w
         93Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701716249; x=1702321049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqG2snvAFFOieKorYhuNC1Brzfr2ap7NECEbi10aNlw=;
        b=Lc0xkJOE4T5qmELyG7PbBaeP4gTf6UnBdQXxgNEulooT+eiExjuDLb6RxzgnJWAAqM
         MVY52KHGdIkxdXhO20yiXzEoFyI3ksQBYju1qhXn/8IZoo+RVrHoWsz/iUm/tagHmkqm
         xELm7DZgRThIcrK4nptQOPCMDXGRH1MfLpRolbW6NAHGpTS8RnvM6IBkQPQL4wB9ubAe
         L3Mmt+A2pVF+S/NmHAas9X7RDBqGS+FY6Pu6VYDHNP2/cf8M9YVmc/EckRaJqbVc1KA3
         KSBtcaAwmrQaLf8FcUkNI5Z6rxtW2m2tq8GVk8Klw8essLJZoxeasNtaC+huODPJVwQ4
         lxcw==
X-Gm-Message-State: AOJu0YxbaDNxtOVyQafo4cgjpmkM3nrw3UnZnCxw8bPSCocTLyT6Rs1O
	OoyZWtpLpPEqh7K/aXpDgaw=
X-Google-Smtp-Source: AGHT+IFzW6+z7C8Ml2LbohiIxnhnkOFSqVt0Hu8XhACQOMYCMXYHj43Tp5sgAxVYwW+HAwtsrHue1g==
X-Received: by 2002:a05:6830:3b84:b0:6d8:8077:8017 with SMTP id dm4-20020a0568303b8400b006d880778017mr4050327otb.4.1701716249072;
        Mon, 04 Dec 2023 10:57:29 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:57:28 -0800 (PST)
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
Subject: [PATCH V2 04/10] drm/panel: himax-hx8394: Add Panel Rotation Support
Date: Mon,  4 Dec 2023 12:57:13 -0600
Message-Id: <20231204185719.569021-5-macroalpha82@gmail.com>
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

Add support for setting the rotation property for the Himax HX8394
panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index d8e590d5e1da..b68ea09f4725 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -68,6 +68,7 @@ struct hx8394 {
 	struct gpio_desc *reset_gpio;
 	struct regulator *vcc;
 	struct regulator *iovcc;
+	enum drm_panel_orientation orientation;
 
 	const struct hx8394_panel_desc *desc;
 };
@@ -324,12 +325,20 @@ static int hx8394_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation hx8394_get_orientation(struct drm_panel *panel)
+{
+	struct hx8394 *ctx = panel_to_hx8394(panel);
+
+	return ctx->orientation;
+}
+
 static const struct drm_panel_funcs hx8394_drm_funcs = {
 	.disable   = hx8394_disable,
 	.unprepare = hx8394_unprepare,
 	.prepare   = hx8394_prepare,
 	.enable	   = hx8394_enable,
 	.get_modes = hx8394_get_modes,
+	.get_orientation = hx8394_get_orientation,
 };
 
 static int hx8394_probe(struct mipi_dsi_device *dsi)
@@ -347,6 +356,12 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
 				     "Failed to get reset gpio\n");
 
+	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
+	if (ret < 0) {
+		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
+		return ret;
+	}
+
 	mipi_dsi_set_drvdata(dsi, ctx);
 
 	ctx->dev = dev;
-- 
2.34.1


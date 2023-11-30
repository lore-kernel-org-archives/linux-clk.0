Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3ybkX/4"
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 831E010D0;
	Thu, 30 Nov 2023 07:56:39 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6ce353df504so636272a34.3;
        Thu, 30 Nov 2023 07:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701359799; x=1701964599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqG2snvAFFOieKorYhuNC1Brzfr2ap7NECEbi10aNlw=;
        b=C3ybkX/4PecxytaC1JL2S+dMqHSDDVXjebTljZrTg8/b/dGfeEhhqvHz1cjT9DApce
         bkbL1+BjYgGlBR4faWxL2j7sv7ZjMtlXTLPiiuG8YpBS1LsnAhtzBMI30WJNX2Dgo1BJ
         LFLR3CLBi4LfoeEj/jXm33khj6O+MRocQ4UtDSxK/Zr6kiJV1fkEdwwElHEyiQ15X5rJ
         YINPKOPBhMd/wY4KIFg7LhOcHkBHeNgmy6yWagF9E2K2rlmgYt8sWBoBulJBoWXCYBax
         VXFcWwC66qAehmR2Bc9IvXRsdDZxIlOjS62ybkIBmNI4OSMDawwPFDPrXTT3TVbxOetn
         DcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701359799; x=1701964599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqG2snvAFFOieKorYhuNC1Brzfr2ap7NECEbi10aNlw=;
        b=e72bn2cjSzUB2iqor5posZfLRWnVKNrej2JqjswUMRwzMAJhwHKtLJzKEWZiIjYa22
         WJWv0SKoCogmXesLqSYqvm5C3LX8wGe+bCeIG4z0OU82DnoGAQhXqgwDu49MVGKnwrMh
         j0JFjMz63DMdqoZZtF0pRYWelxKxV40LgwP3cr6AnXnLGccHxwXY7BC2EnOYetjugZru
         +YUB0Ee1yPlv2FZIbuVrZjPWAI7KFgJuOfiSHpn5tNJ16NvB1Ke5XUm6WFL3aOGoMsd/
         Sheh2ZhcG7jChUerZxhWxK0L8GWR7KNTJoODnU9f3H48N7QciCCZLgx4YcImFn7k3wwv
         soDg==
X-Gm-Message-State: AOJu0Yym+f7tO2cZNqO6xMSWDdZXhvxWWMcF6BTj/qKswRV6JqbhVTjW
	1aArdxVDmUw96oGJaDDPqCM=
X-Google-Smtp-Source: AGHT+IF5jM0pqDMvI16N6bFujnbVlKLkC7G5DaqBhEmXPRDkOyCV7zG2glIlQbuFemOOUGzoI3p2mQ==
X-Received: by 2002:a9d:6b18:0:b0:6d8:2883:cb5a with SMTP id g24-20020a9d6b18000000b006d82883cb5amr14210032otp.24.1701359798769;
        Thu, 30 Nov 2023 07:56:38 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:56:38 -0800 (PST)
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
Subject: [PATCH 4/9] drm/panel: himax-hx8394: Add Panel Rotation Support
Date: Thu, 30 Nov 2023 09:56:19 -0600
Message-Id: <20231130155624.405575-5-macroalpha82@gmail.com>
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


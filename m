Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9742FB093
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 15:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813449; cv=none; b=WNXmc0M+cLXqjRhiJCxDMq7hP+AYLcLDeJAZz/feVbFFwrzQGshmWgJlDG1Smods3/OF1nSi8Pird8Gl9WKpQsqR/y55/UVcPwBo1ltJ5VJ0j0l8PhRUvEz36w+aEMpXcQMNdZ+Q9WPkrfsi5U2UFi20vhsrXJWwyV0EG6KEu90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813449; c=relaxed/simple;
	bh=EkGBXhItwLWxgQ/aIBX1I+SuRG7//x8trI9XTwjIFpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=guSWBzwIzOBrkiQJkDwfyc6gEIJZzJO1iXzDZpIsOWg6BxpJRalCaINgLGGZxODP1S3e4fpXYHwGQ1kucvMDOCUqftoaR1YjUGNyfRwHTuoaHX6aFV0uQvyDxTBDcyXCBeyG0ypmZ1WgdNXYiBKyp9WCqV7n4r/DxkS+K90ruMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ee1+Pmd5; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ee1+Pmd5"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so1167865e87.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813446; x=1759418246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=Ee1+Pmd5vceJDQtXZ7rwfNWCU7h6i302CDtsRcFCxjbwrVE/eHzdV/Ex0qlmKZUHpd
         r89HPbSiuXkj/o0JJvrjUD1fRpFbX8/+Y7+hbcXEUtI20cYvp8WXGhKRdsCmg4/t/bvw
         rXtG+t8hDb4ZKIJnWM1bvf1ug7Bk9TTA2ZCAYrjO6oj2DR5JV5dsriSHVPPzWCrWmuqO
         yKZCTJRbZR13tKLtYj+fgsJ5wbUUaTPHthsIVaqX4Agbc9R5FNx3oIIJ+mzqz7Qkgeix
         llGT42EuzeioYw7dJbwDF/eNbenlZZc5eJS4aS2wyWIcrmtjAhqmmOkFR38ryJ/Xqvlh
         YwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813446; x=1759418246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
        b=llcIeQn78UNCZlcoY49wB28dtR4gM7sKq7UyYDIbT3dUDh8ABmKxlN/kUVgM3TxktU
         mt+SBiX0tlzTL8CF35Cl0O9eWd+BtxRsxQkBJV+AEdYXUCtxM3DwAcQS/vo12qhIh/ZV
         oU4BJbwK9rWXVDsFD+S2GC2nxWR+Ec4dFMd+rmCUqbljzw8Y0F4lFjNEbs6FEcjoxwsE
         IvP33OFA4asUmylSe6Ency9xDV2BM3KnKtlo3FABbhp8zXww9ppdsYWprVUhf9CY9p24
         VD3MJHi3+MgiafEexi6SlR6s8WUd2OyribYQrRgu7+3Kxcg3RXDMxh/Ez/9Hwzh5fxIq
         RzOw==
X-Forwarded-Encrypted: i=1; AJvYcCVAjXlICxLSJqOzE1drSO4I8butcc0IYq01BDBKDExqy/0h4y5RM2N2vYPolc1xWB+ODiTgUZRdVbo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxitt3nKZFClqO4dUAftPP7JfSmHd+eyHPzsa/TWq3kxLwbTYLb
	2HzZNq3wlp9ihR+XMxNdFWguDGNwa2UPkUi2gq+nNnokJraZ/Y1++P3S
X-Gm-Gg: ASbGncsfWXRpR2cf/fUuoZ9Km2ug+q1Dm0U9jwUtkQonC/WdcVIpBLup0bGCbqO1AdK
	QmYZrhP3VeYesZzO4idIBymkp/bRdScxDpJ1PHWoFvkOqjUNbLX7Ez3SFv0LBz7WV9ECeJH5J4k
	lgFXvs68qeinZ+AigFY/jIJpGxB6srSA2+zm13BUH60YtzOwjf2D9T/cRntdayNEN9IA9m8ZBDl
	bgJs70L2lI1ds5kjGWevtQZpNGWX/HVQ/5wb8t6XA/JIquNtODPZPLOZ/C4xGnYloe16e6YyuXT
	VUN5pRmMf92buSNhuS/bE35ahS0a+KQbOR28vLwOi//JqEA1geb/FcGwG4GCfxE57Mb/Qi3Wlhz
	5ViC5qwxS8pzbaA==
X-Google-Smtp-Source: AGHT+IE9s8LEs7isC/WkOOjmZSczeI87yN4+QY99sZheQ8v0ntKzIh9SCdVR9v8GQcLfMhBuoMmtIg==
X-Received: by 2002:a05:6512:39d1:b0:55b:842d:5828 with SMTP id 2adb3069b0e04-582d2f2796emr1520385e87.36.1758813445428;
        Thu, 25 Sep 2025 08:17:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 08/22] staging: media: tegra-video: csi: move CSI helpers to header
Date: Thu, 25 Sep 2025 18:16:34 +0300
Message-ID: <20250925151648.79510-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..74c92db1032f 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..3ed2dbc73ce9 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -151,6 +151,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.48.1


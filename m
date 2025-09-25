Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED033303A38
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813448; cv=none; b=ieroxULtCdVUyqScSTu2PR60a1fiLMaI7ytCAhun0HlB4PwdSopD2KZAG/zE1pwdhRzXweLxh+w2JSsaygiWqPLuG4r4AN6+qFR0+LbNBRpgqEQeGGmhfiEBfi0F7P+Ozqw4dBMuPv7HTOoLLNdBbcDrX41TQGmVR/JFy/HZSbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813448; c=relaxed/simple;
	bh=unhDWU3j7HXm8tKnMiJwHfKNJbf2ZhuKuePm6ASfLQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qql7iYWUvUH1Wm0NfbaTbn2vwa3xICKOu1YUWxFSmJOs3x1Pkio66x9B7MBE/7Rk8KHMdjJWydmQYSiD3UTCI4Y7zfjIv9Nu56vKOKa0qpPMxw5oHHZR/sfMWQTKhKppVgFtMVZTYAZ0q+4bY3mEkQAqyLRhDqbq4y2BU7jhB+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiTJ/jLG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiTJ/jLG"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57a292a3a4bso1254237e87.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813444; x=1759418244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
        b=HiTJ/jLGiTglZ13RT2F/aEa2SHIvfFiQtpSMa7WWgdSnWEHfVGSegysVVJ25pl4rdX
         DTgWFAzO5ZdhK5ZluiPlzG1Emwr7eSBN1/CJq/WpIvTNXG9LuTGnFN6gtM8GTrFelvgX
         x0x/NOG2V0acDlCdrawcFEd/rtJAGX+xsSLeFtkDHuDFhyaIehY5dVmQ9MZQCuw3OyvM
         tbD41lmAN+0l/PNFl8Midbp5pf+1zz7zHadVoMz+BXF/0bAB4HvDMXZ8aeD7kW2Nwe6+
         Pt7Q0hVw6fMKFQzx59eFIUCbfx2jj3r0smNgxhjrNkfBh7Wu45LI+xKo2k88JFBe2cm+
         2VGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813444; x=1759418244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
        b=a9GxWok/JK0MoBlS7b8L6I+EksNlseKT6jv5TZRWshuZv83hAPkRAZ7ryBs8vg0zOp
         DhNzqh/9lpyehpknqdqZZc/j3L1pp/hWIX4Jc/Wj5VHtsqgfMjQGE0GXEESAcjh0dwRD
         390YjnofqQCrmSilLMZqYYhyVOaMjGaKe1oz5X1jWEEiyNdfMnLkfnqgwZtK/4jC5I5P
         ZIUhmZlMJK7b4IwurAePQdxj/blfVVZwFj/XjSx6uI/KhA9xAuSiLNcPnWB3V3XNNJeM
         EaNbYenxXdg27kXPvabJ/lYSmQ8XTvT6hjbF9DykiZ2kKmKIiKrBOzTKkl/GJ1YzfoH5
         rc1A==
X-Forwarded-Encrypted: i=1; AJvYcCUjU+BhOSSoJzNlvwy0NJCD4+yZVw0xVAVvUtMATO9jnnNRrI3DhKMiq9H5JtHFwf+SakxBxR8QVCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPSQ4gsgM/VuWdisZM6NRUPMV4uKbT3Qa++lTW9HM89k8ra1mN
	HQ8xVNgbOWC/115JvXwueMDo8356l0FAurzaxuolCh4ENU0rhZDL+N1f
X-Gm-Gg: ASbGncssqbXmG9wSx2q0xLmGs3aUW5V/fKo1IVUmA6wgHA5mkT0UyB9QQDNvRM18Nwl
	lO/YGixFXK54IlhM94inWVs97g3bdgYF2vpWtbrvvSlgI5h7Zsn4UtnABg0FyZiphmL0aje0Io5
	PzfWC3MaJqoCKDgytSiewRMZ/4++XGc/hLsPHbaECfsHaTeI4PUa33FyZNEKylyosi1Jicm//nO
	iCcHAzqH7BRaFaBoZttBN3dG0DrgQXac9uHmypO31bSL0fVzGs52VLXyzePpq6yh2jz7SbuL7gz
	Kg4GsxEhcPIP0hi9GgLDt4rSU0fKorxNydKbA0nLHIbXnEV31ZssLn2ry5BFcPCwuICAKkHSgkk
	ATRZaqk23liqfhw==
X-Google-Smtp-Source: AGHT+IGmndnr7Gh0aHTSxGSLl1Clt2mwmPdyke+G1kRc2c45XCUN1RqNAuzwlMAkSvKsRinuBceSbQ==
X-Received: by 2002:a05:6512:684:b0:578:f613:ed9c with SMTP id 2adb3069b0e04-582d39b6b06mr1182270e87.43.1758813443698;
        Thu, 25 Sep 2025 08:17:23 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:23 -0700 (PDT)
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
Subject: [PATCH v3 07/22] staging: media: tegra-video: vi: add flip controls only if no source controls are provided
Date: Thu, 25 Sep 2025 18:16:33 +0300
Message-ID: <20250925151648.79510-8-clamor95@gmail.com>
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

Because the current Tegra video driver is video-centric, it exposes all
controls via /dev/video. If both the camera sensor and the VI provide
hflip and vflip, the driver will fail because only one control is allowed.
To address this, hflip and vflip should be added from the SoC only if the
camera sensor doesn't provide those controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 856b7c18b551..90473729b546 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.48.1


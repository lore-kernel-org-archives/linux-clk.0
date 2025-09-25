Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF3A30FC2D
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813465; cv=none; b=c2P31ktrt7pMZ/nk/K9tgeIb6Pe+mRGw9EiQm6gC1It5cO7RN+HJLVeu5M5+MuXv5tNHr82P4+8vojyPVKEAWVMje/EAkZaHjv23bA5nCsjqH6lbj3zkM4Dg92qhK0R1sMzVtO8++i99p5gZ7Mob7S+Lv6GZyQiWGKKFl5OF8l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813465; c=relaxed/simple;
	bh=faNEH5cqnjXg/gz+BC2wvXan6ZNvtxWC+YqN8DJQyXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fP9oH7ApNUpgaTIqB/Lrr1KSgll0IZJGR08nco8GuZXiv0jEjRk6TOnmD6ZLFOIYO5cx2MbIowMMaz3Yd8dphmQbVYDNItIkPkRtk1ojDSBqqLpewOyBNi33LXgzpf5pIC+XhLaG8M0eFFb+VMjMHrZq7lOaEnTr7uKkcGGnN3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTXpN3D6; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTXpN3D6"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso1245804e87.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 08:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813460; x=1759418260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fx8+4vdRQ/UAxNBt+6HBXITvbdfxM4xzJ6LhrqnP1X8=;
        b=NTXpN3D6RjC7x+DI4IhKqzSUMIS6fhlXc2MlM2TOGlDxPk5q479CIUsDhqRRHPhMTr
         Oaz8rOJ0Og8goPYi2sfzzodiwIZC5MV0eUzF90HpxrVNBhbjzR0+dxoVFCVJaD65N8jO
         b4lYEOmyXlX3OHFZyhvrLMsuvSC//CqVIPRk26o3v21RZzhImtEgR1a73VApm/FLMPh0
         OFIWTxD1F9RllNdw4cCu7G4m0iTblNrNAQi0dP+7RAk+GHIQuimiRTw3CKVFk4U5kC4q
         9TjgrHFmrOq+w5qq/lQE+AHTvr5cIY+dpQtyIkKAcM8g1E14dnO6BC1VqvNpaOvxJOSq
         glmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813460; x=1759418260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fx8+4vdRQ/UAxNBt+6HBXITvbdfxM4xzJ6LhrqnP1X8=;
        b=Y9NLQZV3Rs0K9a3DpApukbAs8VzCwOdtAHZONfi8DUVPrrploz4veYl8q7JG7FpdtJ
         sMKZV93PDiN/x+M6mQWbO2uQPC+/UPtk0rRLZtlDFYLeCfVd4TpbbfzGSqvISKMesalr
         vqKA6PWzt3uLnTpZoaDq02hy3LMnmz0YcRnupb1tCR0SkqZZeZ8CnyTiuEo+jj8D6gS3
         DC51NLzOvDbnCODBnyu/QWbfEwqpTQZfhHyisbwSwvSOfNEp/kMdqu8nkZRSTzupNqFO
         tmwxGsyyP1q9Ey4cJx+En7/1XHFfONcHaYqhOVB//hmVwQrAO/ao8UEtvQQzShy06sKi
         PZAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7IBymyRDDePmn3nTd+zJ7qQ1s5L+m9SSx6iad7SohGQgvarw/b6/PbS1x2fjt3OzSV66cQYYBCXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY5fK9MFgMLLik4IqMsglUYNY07efMLyFzkNuOMWfP+JxTWjrS
	rkZwePo3T/WTqh6EXq6/t9p56ln4vdCmwE5kowdvjenpXsIQbBbw35rj
X-Gm-Gg: ASbGncstIxBBty9QFjYhVnD6QUDj6RFPC4Mf7sE0Hd7fRMkc97uUh9yIrSjaF54hAuz
	gl7iZ1jbcDEQF7Tz9JOQmbu/Z6hX0j0gkB6t7AqiEGHBCrAAPsGFvJvjCO3WsO7Z9PXjRXUJRiG
	I4wnhEKS1mt6BuTleVLrKrbB0eOmnbBMBEMpATraC/rWxHOkoyZHtnqYf/pNN08yiDvQxR5tEjy
	RBZ6hYu5XkEcoAmwHwCugK2oDevnStLNMjavBnH5wm2j1+kGpuRvXixCBiA0eqTZSbV9JgmLLcZ
	uax0a8KYn0z3pVG4YaiUi2kCFDp994KmFdrlUiNoJm7aFuCz+r/1EyCR1FfH40ifnYG727i1qsU
	kiEr5Z2il8HCbfiaR5EmomCGw
X-Google-Smtp-Source: AGHT+IEtsXlkJh4zDVIxsS8Hs/r9wYDKZCtJ2sfjXml1D1zv5EDl/W0Gpd3rSyCqcwLuY7gdFAOzVw==
X-Received: by 2002:a05:6512:ea3:b0:57d:a69c:7083 with SMTP id 2adb3069b0e04-582d0c2a408mr1257970e87.24.1758813459477;
        Thu, 25 Sep 2025 08:17:39 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:39 -0700 (PDT)
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
Subject: [PATCH v3 16/22] staging: media: tegra-video: tegra20: set VI HW revision
Date: Thu, 25 Sep 2025 18:16:42 +0300
Message-ID: <20250925151648.79510-17-clamor95@gmail.com>
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

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index b7a39723dfc2..4b69b556387c 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -589,6 +589,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1


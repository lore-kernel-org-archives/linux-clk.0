Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9545E2F3C1F
	for <linux-clk@vger.kernel.org>; Wed,  8 Oct 2025 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908687; cv=none; b=CuaPVb1oQ/dukybhIFTHMULy6kO8SaYvS5GqHDK7I5TENfmSx0D+NonxzgxuAkRbwoFKJu0oavLU4wBvNVMniS7sl7tuzVV6tVgFc13qSilfc2ChPfUneBcpwwTkmJSxtf9T+3ul10ENbslmBAWv4Rr2RuWLHouYJPUxzFrN6OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908687; c=relaxed/simple;
	bh=sgN5V56YM4qhVdHy0m6Dz/yGVt5884z/MxNndOF+8Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qLXLuB8uewJbFi7zssZFqX6iA0S44zFvV/0FdUJ8YijypS3Xmyni/pN83Vz/6isVWkKn1AqTQaB9XDKl6ji4riqPuXoFtaX5X5X9a1GcZNp3JmxDADSaOi5l4NqDB45NdcvkEQJDxKB6L2RXeBHNAz5AwDeDB4n+6ZDSMr/8yys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrrAeZ4i; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrrAeZ4i"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso8781626e87.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Oct 2025 00:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908684; x=1760513484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDpFX1J+/TUvWrJNHxxt+1RfUZNV6gVxsd2JBSzQm/w=;
        b=CrrAeZ4iW1dDa2BngLDRhwtv77B2k+j8uzVrqvg3jNtlmvYgnxFYaLB0icpuhqZLFK
         dINpCJ6IjQed/kV8GEGAC0DRPmuWzBEoUP1x+My2+lkqO0f1kkTODtgMWJYZTgZeqWIv
         j/SM5v6TrkDLL7LizDX5lVsILYN6nvMuzvDXYOruekdvUJYCA27GqFJxn3Fr/yKwqbrV
         d5do01A/NRU4hIYaIITue7nx6Xz89xTpJM91AdEHjjj2tN9Gne9WLOqtIr8YmEJAGxx+
         SC2OkxSDdshm1E9S9xsU1oUuRWSyLiSSPsB5Qxgwl1sxL3pRccAvApyRYbBwDsJW7YY7
         KVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908684; x=1760513484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDpFX1J+/TUvWrJNHxxt+1RfUZNV6gVxsd2JBSzQm/w=;
        b=hWpI2VXiuupb4Jgl7DVs8YewJbhAIP20K+hSasC9/2+AL+v8NLtNk7Vf/vO0vJwFmo
         CApEEJUGqhID8el9C1rIa8jbrd0dI2pE1avNrWvk/HWuTTt1la1/f9tvzb2HpV+WAuX6
         HLWzgm8lZlLtrQNoqMM0HTyupsMqThB2Iid5MUF9QSjHKglT1XoxmPLsFxW5yxn8H9rc
         S5we1PWNyB4EpzYGAORcuabfO0RZGeiVhFWbWSMUFltqQrbOLwV+O5CK2voPi2opJm7k
         fBpaVQW+WcO61S0GtPUOychAWecW5ki6ZnvX6a8Z37vB8lGa4cKt06qzVpRag9hIKbf0
         m+Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWd786MRqhJbTSgh4AX3R5Nn812uiEjrt0+2mZWszAGgo6SvSnJ8Nk4+4jBvgAkvPowcFPUYw9oSLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnGS+x+np7/ST5KDQ62oJTe0YI3Uh+dNGVsYT1BGJWCaV6bIHN
	9wMJisBX+ztF5kf4njt7HSGxncAYYQz71nElarmSf3h0cpR0W8htTEJl
X-Gm-Gg: ASbGncsFfFsFX+KOcm7p5m09BdGLN93jy7zKxb5o2VXSBCpDSuFlhkArhK7t+PSYVks
	i7/+CpPWnMQF3NObZxEMWiNEGaXP8Bay7wmUFwbX+t6zF4egb9Z3z80Kzb6EqQ7p4arIV9GXFXL
	sMdJR+ZkYVcwsA1n8Y5qDr2KcB7ybRzvg9aNHzrVkZ4ib3wMM4CQd3Qqa9KWR4MFM/nU2Mz/8w3
	NMTwhVT+3f6J4DRYp4IVCivmh7GvRU+ccQeIMufQh8xFGhdc5S3LT2v0hEfUXHIIDCw+bbCga0H
	7hFV3Q+yRb2wXLlhved9Sv1k8JgTz4FBEJ6IFEJB/CVbOPr+bfP/kogEWc4UPqktnIO8S06dY6g
	97rQxfR2OgIuu+89PYRjIpXgIqnTrhDYU6pLRcQ==
X-Google-Smtp-Source: AGHT+IEDn+mOKOkExskkEHmiVmmAHBRTPG08XJfXi47qrRyipXy27ogpWUhWkyGqIQp8qUggurZtlw==
X-Received: by 2002:a05:6512:10d0:b0:585:1ca7:1b69 with SMTP id 2adb3069b0e04-5906d88b1d3mr616741e87.13.1759908683479;
        Wed, 08 Oct 2025 00:31:23 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v4 06/24] staging: media: tegra-video: expand VI and VIP support to Tegra30
Date: Wed,  8 Oct 2025 10:30:28 +0300
Message-ID: <20251008073046.23231-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing VI and VIP implementation for Tegra20 is fully compatible with
Tegra30.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # Tegra20 VIP
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/Makefile | 1 +
 drivers/staging/media/tegra-video/vi.c     | 2 +-
 drivers/staging/media/tegra-video/vi.h     | 2 +-
 drivers/staging/media/tegra-video/video.c  | 2 +-
 drivers/staging/media/tegra-video/vip.c    | 4 ++--
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/staging/media/tegra-video/Makefile
index 6c7552e05109..96380b5dbd8b 100644
--- a/drivers/staging/media/tegra-video/Makefile
+++ b/drivers/staging/media/tegra-video/Makefile
@@ -6,5 +6,6 @@ tegra-video-objs := \
 		csi.o
 
 tegra-video-$(CONFIG_ARCH_TEGRA_2x_SOC)  += tegra20.o
+tegra-video-$(CONFIG_ARCH_TEGRA_3x_SOC)  += tegra20.o
 tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 obj-$(CONFIG_VIDEO_TEGRA) += tegra-video.o
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index c9276ff76157..7c44a3448588 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1956,7 +1956,7 @@ static void tegra_vi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vi_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 1e6a5caa7082..cac0c0d0e225 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -296,7 +296,7 @@ struct tegra_video_format {
 	u32 fourcc;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vi_soc tegra20_vi_soc;
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index 074ad0dc56ca..6fe8d5301b9c 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -123,7 +123,7 @@ static int host1x_video_remove(struct host1x_device *dev)
 }
 
 static const struct of_device_id host1x_video_subdevs[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", },
 	{ .compatible = "nvidia,tegra20-vi", },
 #endif
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 5ec717f3afd5..34397b73bb61 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -263,12 +263,12 @@ static void tegra_vip_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 extern const struct tegra_vip_soc tegra20_vip_soc;
 #endif
 
 static const struct of_device_id tegra_vip_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
 #endif
 	{ }
-- 
2.48.1


Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBBB31283D
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 15:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813469; cv=none; b=Xae2bAX02YyGs3wyNbUTpJ5u1s/zSSlccno/iy5/kJcmQkWYKOR9WvhyacpUw/5DpIOMqzTpA5Dczkq8d9b0jrCAF2dYMDBF7ZlrKc6upS2V23ubDfl+FFQ1kCtq1UDIoMA38wpNB8Pr9DmmRy4YCPEiteTbT4Up3Q38djLUFCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813469; c=relaxed/simple;
	bh=Wwzw9xMv2o/Ts1NeW/7xbttNmsv5LpsRAHX++eZT1Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/QZe5ilopH5TMpWmDdNt0Lxe4QT8WigNJb7uRzMDHLh7elhDAhimjHW88EWClHyIcsXZhJFYp0ukREGDDbQ1XkN9UthXwq004ESpi+ZMmUS8P+XGs3vOzeGEWhYZYJOFbu9wujzr0UoS9qXZahlQ+oEPDedk1UQo4H3BG54QBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuQquLGT; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuQquLGT"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57f1b88354eso1123767e87.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 08:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813465; x=1759418265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYprJOOZGbDqCKik+QwJZFKS+miOCWjcfIzmeC4Md1A=;
        b=LuQquLGT4rQCWzZwf831aiyYkP6GmLDPio1Rf6vAKS9wMEs5SLpq1Y3FdLk6ks8l7A
         fEZ7zeL3O1gNehi0sH7duewtDtXA5WLJ65TiuM5ls/L1+pYQQNksqov1oL2M59PWmTcT
         JNvi7XhD+dOnixXWmVduV6fNqDctJpSloRdiXqAm90CCTtYB9HenkPmRwrkDMPf1w3CQ
         BoSNL61XRbEVdqLaTcr9bpQI8a21b00lhBcE7/46kLR6DR7H4tw0po/Rp1ll0Evadx2K
         1IvlGJRTE62w3lQ/8A+FGRhANyw/V9oqNucZgfRWYZuOT/3vMCbKmjGhV1KPUnuFCqUp
         aI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813465; x=1759418265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYprJOOZGbDqCKik+QwJZFKS+miOCWjcfIzmeC4Md1A=;
        b=gtKDs5my0/XKPHBX3VPIH9ngqAJZCLByShY+GixriyxCFsjBmeR2JE0S63I50vlq3+
         +A7JVjHCy2JQXy55iEdaW7I/Vl39a1/3K4D+dLDPGbeqdbZTZj0AVNSf0rH7ka08Os5j
         b+KAHoM5cQvDfGNwwOrEaRfCiNcJ+zBQf+tFcz7yjgBkbKeSpEgMQBDahwTofA1vu5BN
         qEUPZVKLaXGi5QBf+jq8hg8FTpiUkTvgvq4CoDdoWOQBiLMx46zodA03YhXORmI9qvf3
         wHsUEMeRTQTsT+LgKkubl+duyWu8hg8M1iAwVXgBSmczbhwlxRLcjOacIrdHQnZBTULF
         Hqug==
X-Forwarded-Encrypted: i=1; AJvYcCXpZwJkpKING8h55f7EbXYmof6zhtUJDuE1FFNeMf629hKpI5L2Igv6lffyu4WKDqL6sIsoQ9jrE4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh6SBcM41kpZT3va+etBQvRKIRLSwidc9bFRJhceSb8WCIJV0G
	TtyrG7NakwPnRNCBfFSh4KwfgcVpRlDJEt2BRDf743MEkNIsL5qJ22dI
X-Gm-Gg: ASbGncvGqmspNIfwqbj5XDTbWF6PJaT/GVK3g5Z4ShkNBHvoA346a/B7OGpt/BruN2m
	cIHQK4lvNam1PRAanaGBigIzghI+sn682omQX2j6z+IsAeF2xo6V8SEi9ir/mGKyayrU2ww2bga
	M4/sM1OgbIRpFIehgVKC+WfmGp+REgg0kjpRFZJUY3pgUvmtpt65Hfil+2sV8FV4MLPs8sVq1t7
	gTEWDj96ba/h8N543f/HTmM5A2IO+NyHJ728fayItqtmlisRwU1j7R7SGNmaUoes6FzJ7MBLVr/
	zcFcLTym1/LHi8d8lZA9HsYPsnKfmgf6m37N8dppkHJXidETURVGae+Rbqy2ogGLvV0rB+1H9UU
	geFlcKxgoygOSIw==
X-Google-Smtp-Source: AGHT+IEeprLHz/3/8zyQFjT14w4jQMsLq/gaJLv/R+aBxEGgOU1QbgcmMLTTspONZDVL3CUfJjhHWA==
X-Received: by 2002:a05:6512:3b20:b0:57a:8738:4d80 with SMTP id 2adb3069b0e04-582d0c2a62fmr1003402e87.21.1758813464668;
        Thu, 25 Sep 2025 08:17:44 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:44 -0700 (PDT)
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
Subject: [PATCH v3 19/22] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Thu, 25 Sep 2025 18:16:45 +0300
Message-ID: <20250925151648.79510-20-clamor95@gmail.com>
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

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index fba90cafb9be..8c9655ffa886 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -498,7 +498,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.48.1


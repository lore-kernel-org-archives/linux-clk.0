Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437FB30CB4F
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813460; cv=none; b=fweTpF2sJZcZnsujEKP4il6YWdzxmnueAMRgT6+je5x+QXV6iZ4rDfcJ+Bop2vUKlf1UTLMYXuPBMO3g6ePaNPeXjNqYUOK9k75DKlTh1BvZI3cVnmdTY7+Egsen8BLxwi4aduzWd9k/IwYQWFhrHKDKr5Ly4ODVbHZc+DbChRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813460; c=relaxed/simple;
	bh=RyMqVUMoRxnLE2+LH/uDoKbsjsXYMu268PiHdfObUHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WOQ0A5iIuW/RXdBDxtoya9UfMCSX5BeHA/xhTM7voGoOqjI3agjD4RzPI+t286ulLuAvLEq7Pb5QSupclZ8Ik5jD4Zb6eyheNRpJAIWj4t4+nkaKmZhweFjjCtyXI0N9MKfPbDxycmrlcY3xDKIYthxbP6OV5AuSeKl86q59KVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LV5T8NIk; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LV5T8NIk"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso1245692e87.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 08:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813454; x=1759418254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=LV5T8NIkVevZs5a5PGuIdIdvYnfOFYkiZ4h/AN0UhOoCmDcpbiquC6ADTbljAnYxyD
         xp53rDpV9d4SdI22mL7UIV8kN3k3KOljaMFnRbecfSPipwLbX0IQ9yiHeTg5/z+rHYKU
         R0RejQEO0SHmzpkXgg4tu/VLxVaZvqBEW+yYjTUQUgSROw4AkoSO7jWVU0V/LCW3utT4
         MjxrIVVEHiL3YJAmEBkmYfI8Nh2pOS14i/tClsAcIHeHAAItABagqteZOIEb/dN1+t0C
         yaiDOQHonJ5upSXl5vLq2qe7cC4BR/4SQRS9hJ+GZ0KkApF9UhtPiYs6s9WHdokzZQU4
         fWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813454; x=1759418254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hswO6VHAbXRS9t5lyAgR5F2WC+ilzEfgsXiR8FyXf7w=;
        b=m2rxiIRylaD8g3US6ysSJzFfVpY2jiHhYRdgtZcVcaHa3JsKR5Q+qIjCy3mP2rGDRH
         vW1ZG3N3VY/qXNzl2g7KiwWgjE9CPw4UaRY1Q7CjumFVan9qSUmk7v3C36xEZvaOLy2t
         r7t2zLLV0KbL4k4RbRbJFcXTJqT1/fdqx6uj6A/VgIKFw0sAVnewTUDZTN60BMNsvl5H
         X97wgLcKCc5QEbaEyR7D4ShstK7SnUZkmDM9VQAydMUiILZavW6maIlyiWTz9iOj+pOY
         eJi7xs2tbadGXGnbQ59ef3SrKRcEltkaIJ2lZpYDNspDcO3rpFSc5dxE05VwON/Yo2wA
         OT/w==
X-Forwarded-Encrypted: i=1; AJvYcCXnIhg6u8U8huX0TYjkAKut/xux9yRxiPXB/KP6NDGZUK2coUDH1xIym/kKJJcmoyN2GVZYickabNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YybQwM7x75lSADjxW6siUzhunwBxE/oLIWPfJX4FtWA0LSF6CT3
	3adKeiSSsa5slgsGjK4M39M6iOYof1ql2FrGce8AuQV1byW8nFePD9iB
X-Gm-Gg: ASbGncvfnIFC29SR+djuZ7hjNaBoP+Z3VEzf3PnnvBqx3+dKm/gil46dcb6Acrvm7uh
	s2eryKqVrxcCpBC8IB5MGby/rsIrIU0CXYnHVrvdTl0RoqYkYtAnSU+/ehlmhGp3aD8QM7cYNH4
	qN3cTTyeZ+Fjjp/JP5+j+iwIXe6vVbiHojyHW6gthytDCcG3fcQRR7Ghs0o9NNgrOz0JdwMMimC
	2ZAlwATk5Q4iT0Xk4OskrN8dOx5lzlWijGeYKh2tohgZw20b4EN557HaUCPMn9RkI7XkUfkOUlm
	1hGmANpBHbvloDhOYJZt15GZAznWECve+3EA8FTbGJvH9H+/fTu9bITjxJVWk5wd0OLDHZJ7Mml
	GjtASwtv9+pn43Q==
X-Google-Smtp-Source: AGHT+IG7KKCjilkRoVVQO6eRQmwua4ImxUfDI3+PmQybBw/b1Fvta80npFLTel5v2tEHntPHpbmfnw==
X-Received: by 2002:a05:6512:1392:b0:573:68fd:7ad2 with SMTP id 2adb3069b0e04-582d25840c9mr1251932e87.35.1758813454230;
        Thu, 25 Sep 2025 08:17:34 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:33 -0700 (PDT)
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
Subject: [PATCH v3 13/22] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Thu, 25 Sep 2025 18:16:39 +0300
Message-ID: <20250925151648.79510-14-clamor95@gmail.com>
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

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..3e2d746638b6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.48.1


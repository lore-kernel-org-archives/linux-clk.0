Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4382D34F27A
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142923; cv=none; b=pUeRUGAtR/QLs3PcsEYMhf9WEjDSA+vNfwvAyVLmfVVg8EjPb1uQ5VAfPahq2x0cnLAoITY+Jl9jXz3QOv/pkn4VIBm3jMzpCHxRSviKNwT2K70vk6/i0p0pMnPig3Lsi0rcEVO8+KQWszpslx6Qv0qtJC9C71McDzC/FT4YxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142923; c=relaxed/simple;
	bh=LMNj3RJtvSAolKc/cNyymmQWeXKMjtcs4eYn8DUf4jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvkE0JAbthGopqrnfofZDGqoHTf8CcJgkfJYohZGDrtOiSYOSmkR4NSUXqIm57g2VYZPpSYu5CSKsWuyBDgxWhDQxI94MA5D5t1249ftcb4EtnPessdcAfU5Qf7j/+3Ix7Kkc9LE6dT8tvWyevCzGn4YkJsN99p3FLJezrPwnMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POWMSZJD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POWMSZJD"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee12807d97so6410869f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142915; x=1761747715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
        b=POWMSZJDp7lpsCky1EgRlQLwH1w0TX/qXwWgEcXcEJUONjXLwGvTyMQw0U2PtwwaUR
         dDMCX4sTtRfHgL0W9UkSwGe6eybkaEJ7qWlgMe720o55F8uZUUF3JAXFzU6IyEAyytj6
         4WjEX+huRmlGu9NzEh8moCPBJ26OMDBNekWekIC43RP+ZUS9ODog9d4uxeVNoxfF0O1t
         eue7s3PqjdubmPWcRNi93cq+9MYgwn9hvlNbxQjQxkzb38cyWhuzi5cTEngosZudg9DT
         83r3THfeh3s+CinBLeFPEWi0KpQcHmy4wBeOnybQFnPv/N9cGRKyFrbDEDpYylBoJzv+
         Uvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142915; x=1761747715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
        b=pfuI7u84eVGTZBfCPtmRsPTyuPSpftWArV7i3GDnoRaBGC1NmBK9DUlNLVuMJkSy3o
         I6gK+OX0wnI22RZHWjPgY5apdWXXulAvoyX6emk9wm4tnZ8jvpQxKdTSkfwAJeejHcsJ
         h00v2tmcEe9po515QdkyYSFrMmI7GzDXsLKpiMo5EBUHuOHLjGSDys5MbMAR0SDpmgzW
         LE2Q5YDnPYI7awNGPLV30HIiljnEZlevDfEBfVANSNFfKmLvs6QWjfBU/pjMerqZx/e+
         pijb83brSle30Iz/0joFHtic2TmybRQj6XvIvrvm72qAgFXckO0S+oUa7LF+YtwJaW+6
         KpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE3vVcUHaL9obuQk1WASu8IgCcO05nSMOzJAdKDXfTQ6CJwBAszWtKSXPs13l9Gs6yB/OyW0lNayA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoqWtqUvHyIJBhX7OJdK1Zn9mPXa0IbSBu6VyfYAG69zR4cZTl
	g81NvpDhgxBfcXEoUqxbYv8A9oDdgxcYwQj+QyiBO+4xB1WaZz0u+vy1
X-Gm-Gg: ASbGncsJlpsuxi4dRyKeUQMe6zXhyP6Njd1fiATbS7dHmI7ZxicT5rhHvvAGAWZXl1V
	hRla688edFg/7MgxnpCacXS3obCgJj+KNXfrTldmxzePApjo4ksaT8U24X2owgBXrShRMD+qyMF
	BEJ0PkgurueoSfaxcDPNLYg+M+5agJrdW30uXs8mC2M8ZvM2tb9+6LLTXbAcZgAqHu+SacqTu35
	MSzIs8AWmY+goB97Oh0D0vH19X6w9QaktSCPN5u2s5STRALwfaFj1JaA/J1qWiMqyfIAHTNBOXG
	Pf55eFcv9You2SWWQJ2nJhQopOIbCAZUXc4cEjS3qV8vfM5MJUhGH2okw98GrEnGu5d9kmVoZyt
	3vn4Yuv9gsv20xFiiZRwcqAKIzY7apivz+lPyJvJW5+Jf/C8tWqugWS11N+QTQ4oLh1A=
X-Google-Smtp-Source: AGHT+IFX0XnrlT4GW6rKQFEmK1orh25Up0PxK9L9DQEcm8KVBweiXSL9uA4QjEkF/hiMIpTbvZ0SpQ==
X-Received: by 2002:a5d:64c4:0:b0:426:d51c:4d71 with SMTP id ffacd0b85a97d-42704d44253mr11937579f8f.8.1761142915306;
        Wed, 22 Oct 2025 07:21:55 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:54 -0700 (PDT)
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
	linux-staging@lists.linux.dev
Subject: [PATCH v5 18/23] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Wed, 22 Oct 2025 17:20:46 +0300
Message-ID: <20251022142051.70400-19-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 93105ed57ca7..149386a15176 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -598,7 +598,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1


Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6F9303A3F
	for <linux-clk@vger.kernel.org>; Thu,  4 Dec 2025 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829037; cv=none; b=seP0Ro7x2x95vP2PsU8tTacfKvm7MNttUxA1YWkLdj/M/CL48yqvG6bcXv8R7L3Ufp0JJVPbTZotcEbQhgXKHs3eeavZGd90x+yHPhTje3/2sxEAg511xxm90N0WcD7bVSeGPalAcE7auMExaGHY0sgPvjck3RIwXgUjAivtQ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829037; c=relaxed/simple;
	bh=YvGQg0thiYAJim0fiKMQbCpji4LJk7ivjKm2DBhO1ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGDNJl852AzljgUY+AysVGFIrRIEGJYc2/GuL5bbrP2OxnyLA5XWpxBiq+2Nvp4c+qAVu/fzblkforGzmAtHVmq6iAhxwJO0NaZGO45cFu2uHRqulgmbWTi+UQcTGOj9MtCZAYyzIj1StUEYTvpxqx0H2cFMYjpuzhugCvBZvi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GybVkWue; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GybVkWue"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b736d883ac4so90635266b.2
        for <linux-clk@vger.kernel.org>; Wed, 03 Dec 2025 22:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764829034; x=1765433834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cwcex3lGNThFvVtHDavDxMhxsou2FIVI5X6A3gfDqZg=;
        b=GybVkWueXXpjZSJADApAbtdwVaiuS9CNIBrVgAwpkJ32cMxRgcIvygdiYjkrLGQInU
         cFgL95YDsFQMAz+PF0gq1Ozk3vWjVvaAgTptjyNRKV0nMLiXssdOr9hsH65QnLugEVMp
         fSG18VXCFRTN1Fk8ADXnajt8CTe+UYm1Y1nv9tOhX2dyJDgfpkjdxQVluTsT8XHSiqMg
         XhM1UwRRo7OBjyEbpxpH2n0y5wKm+fLxxmKHqgPGVFcm2FoS86TBBRi2KZVHUubTrnKQ
         j1pQz/sODLzy5qX1sCElskn413ySYKhDNLxEQu0o/UNJcSNnsMur2AYTYLR+WcSzfEF7
         dxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764829034; x=1765433834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cwcex3lGNThFvVtHDavDxMhxsou2FIVI5X6A3gfDqZg=;
        b=CY/olX9WBhuXLcvmx1RExikMlgONFyHDa09LpKHJ1C3CKBVlOyVXmOzVaKOT0TOTm+
         1wxBUAaC+M/ZOSvw7vdXlFQP1VEf0XExTkLt/DD9Vf9u58YsCa3NCJia82aKlh6hN0Yu
         smt3ADCq6D8HTGYZgCZyD7G2CH+ZyaqiJy3vP/uBdu6T5lDX/a7sh0ZlH55xyTTDcLh8
         qC2N1+UbvEdVBXjybgGXyEy8557VOM0b7Rv03SZNoPjF+qW/5U+nR+9VeztkNrCX0vje
         hyd2Kxrt2SHsI5tcVMHVAwQb4zKp8qMduaRRdWppinL+FnQPAqvZGbb8cGCScKXHDBUy
         RV/w==
X-Forwarded-Encrypted: i=1; AJvYcCXLg0WpV1PTSJVuymXvGkI/FtM1kYBB0JpBjV33oRVpbr9lTXGTQoaSot5wAuo/F5uqzv4ljPzMgYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQsWPJppg3800/Lq2XgG5Ap5XvZyYeKziIoEpXYVvvq5Oi1WF+
	qfZgxVYYFtEswNnQRFVVrMuC8nTeZkQEt1bvhnT5NtSHajhz4nj6mCOB
X-Gm-Gg: ASbGncuGoaOq5fSIsz1oKtGmH9mhnRR3kMM8MMaxRwx8MojnlPITopk5awLV6FXRSYd
	jd0zFoQEccVxuK+7iQpO+JV9PBwO/SuN1Xj2llMXyYPTW9KY5MBPe5BiXs82R/mc/gsOPo9xuJJ
	f85gi3NZ+C8DgFS0DaxVZP+RFEAwalaqv0QW/WHJXn81TdKUFyehL+Qh7FEa+F4j8m8B/aGRtyv
	4jy4c2PtWNHUMK2xEERtZSacSJTRQ1khFiMprsRscmvipjxxdC/P1V3IAPzo+my6vPrv4YVIxp0
	HLJRo9CAhva3EYPEFwd7uImpQUAezsxprgQjCljpQladJUVa2Dbawtmb9MbjxNqRL1cPBClKumY
	eXwT20IW4fqvH8CIOTGcOyhQdabMiaCMGvCSmzGdu5g8AHAdJB6GxiZdZVwBGJ+yt7I8H5bcrSo
	o=
X-Google-Smtp-Source: AGHT+IG7eLUO/lnnllbPhbV5xWFj7aQXNW+5SwKDRXXpuxxlU1Kc0BYcXWXlKX7dj/KXGoOhGhU6rw==
X-Received: by 2002:a17:907:1b05:b0:b72:d9f1:75e5 with SMTP id a640c23a62f3a-b79dbe8d527mr523744066b.20.1764829033747;
        Wed, 03 Dec 2025 22:17:13 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec2d8csm490159a12.5.2025.12.03.22.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:17:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4 RESEND] gpu/drm: tegra: dsi: move prepare function to the top of encoder enable
Date: Thu,  4 Dec 2025 08:17:01 +0200
Message-ID: <20251204061703.5579-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204061703.5579-1-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tegra_dsi_prepare function performs hardware setup and should be
called before any register readings or there will be a risk of device
hangup on register access. To avoid this situation, tegra_dsi_prepare must
be called at the beginning of tegra_dsi_encoder_enable.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 278bf2c85524..8e80c7efe8b4 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -914,6 +914,12 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 	u32 value;
 	int err;
 
+	err = tegra_dsi_prepare(dsi);
+	if (err < 0) {
+		dev_err(dsi->dev, "failed to prepare: %d\n", err);
+		return;
+	}
+
 	/* If the bootloader enabled DSI it needs to be disabled
 	 * in order for the panel initialization commands to be
 	 * properly sent.
@@ -923,12 +929,6 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 	if (value & DSI_POWER_CONTROL_ENABLE)
 		tegra_dsi_disable(dsi);
 
-	err = tegra_dsi_prepare(dsi);
-	if (err < 0) {
-		dev_err(dsi->dev, "failed to prepare: %d\n", err);
-		return;
-	}
-
 	state = tegra_dsi_get_state(dsi);
 
 	tegra_dsi_set_timeout(dsi, state->bclk, state->vrefresh);
-- 
2.48.1


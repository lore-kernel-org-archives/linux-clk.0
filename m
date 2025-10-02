Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8C1257AC2
	for <linux-clk@vger.kernel.org>; Thu,  2 Oct 2025 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759421870; cv=none; b=gXwZ06u2ZbbCPHZ7Lwy83N6Li2mL4jKiGwxKox7Ye3CLkuRmHLcHnQRJ5qTqg1eeC3wdaJIa1eC25AniUEMsfyske3qeyS4ikyz851JMAc2iaGxPbSD3CWMRoaoLaLLSuXFoUS22U1aVu74NgnQBZLp/pMTgwVqqLf2aaJkpO0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759421870; c=relaxed/simple;
	bh=Xk3vGDY+dbgDXhwjpZ5Y9vmLpKQHiUY58WcqSeQB640=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJAI1gFu5olSiS9mjnJTB9mjIysySzWz/wSvfgVgEtQnGwcaUUcpVOewhhduZk5eSk6ar1D9o4rEPVr5IWmbp3xnF+Mockfdjl/QRyI4qyd1A7jXp4IyeQMyEIQXlM/xWhOk3cU+GvqUhDluzol908YQBIP2HxcC6gfyiq0wknI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVapzWaK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVapzWaK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso10256265e9.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Oct 2025 09:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759421867; x=1760026667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mku9ehBZVYr9qxRYLkJ4uKrLVeypEMB5DxHQCDkGT7E=;
        b=TVapzWaKfCskRhd8QswMXOKEiYdf6dIJdXWW9m4ndoDHGGkGsIAdHWd3qpxxLCUNDu
         yi2ZK9LnmOMWyfqPh3A5EeWGtk0sr94OlrRKV22j5QcSMpHxQqMHFv3rieMRHWcGu8OM
         xkhU4EoYuw+DL41VXy9ntW87cdNxFBGRhCA34BsWAkrQIzU7IFH4ZnAeXv9vV0EGwsOK
         76nAtAC3k5QWieI7ocO+Q1DgOY84r+i+Z7jBZs2eIu8stZefIhUg0ZwO63BE6I1ltwLj
         Wl1YmhxDIVwAbGTghND5gK4cwF3WQaBdlUK0mdnR6TMtFvi9z4NGPERJWrjG9yXUu9Pg
         SCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759421867; x=1760026667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mku9ehBZVYr9qxRYLkJ4uKrLVeypEMB5DxHQCDkGT7E=;
        b=gyI+NwdbdHvESTZMKI8fgk1DvyKcgX4u56KjWqxGfurEsVS8T86ec/ZSt52ySrPeyp
         W8saCUl3D4UCmO2b8Fq+B0pkGlCpDDTbZIkkaNnPGCaMaqEu33fgWwPVsG42Go9Hgbak
         Wb6se0smKNxSuwyuKhfUgOchhdRNC9aHE4zsLnQMpxS4VmUifv7Tc2WgOcCC1dR3UpZh
         2MPtNd4xY+kFvmUGDmI64t7JWdww264FX1wmUO/L/x+iTSldDK6t1Ll9nZNpBCt8GG2J
         sEGVSAo/ounr1JlYvGx67pHTvSw7u6UKebhv/HgbOLkNSCNQEs9ejmqDFaMivX15OZkB
         g1pQ==
X-Forwarded-Encrypted: i=1; AJvYcCU18MMkGzzd+ZwQ8MBdZhA5JT5YopFuTn82LIBg93fsIufa9e0aVcvZcxVbp+Wsy8GZGYfwgi0eBaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzYbnRC/pmEZmpDb/Jcy6nmv1c9pWyglWe2dHsNV2pfozBGvSE
	Xb8JxVTL5ZnYsPLas9qa/6YMJXngzwi3oUtqyKO8Hb4MKcJ0nwEfoYyL
X-Gm-Gg: ASbGncut/GgAEUdmP6w3VF95QYiLr+7r19IMD8OeU4rhKhoZ9o+PPRrK5AcF7OJp7NW
	qZqVbb8n83BQBA0Qkwsd7aPGHpNJqLYIRqJIMjxo4h0DWv1bg7ohqy9pp0gQ11qZYUkBJRQR23t
	gcBt7YCuwu0vl0iSKbabRrQla+pwRLEUf4NTX3DikPEKvcSVVs9RbGMoDeOmGbIlymv+R6mHXXI
	7wfT81ExG8Wg/JokT9fsQu6cReW+n17dqLqBYaWQmamcTWwytmuyZuYjvQQIUCbgcRkzl0Zj6QN
	i00Dq44rfxC7iodPqR2y7KXHugmgN3Ji6VLsqdAz4e5gFzTpChouMXAvUL+Lj+g06r9nVt6LHvS
	SUs+jkoLDTjCPwbJfz8iEKAUVm3MdeIufkuprPcB3vxNaV2tunqsbd2tMbkEfzcqfk8SrxSLJhd
	A/hxRu
X-Google-Smtp-Source: AGHT+IGeLiSiOTWvku0XOb7pjsu8OYgt/p6DzNcZOdgcfnQ7jJbiYwMNujXhPwp7rKsbuxI9FkchAg==
X-Received: by 2002:a05:600c:a08e:b0:46d:cfc9:1d20 with SMTP id 5b1f17b1804b1-46e612bab6cmr53404705e9.22.1759421866515;
        Thu, 02 Oct 2025 09:17:46 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:607d:d8e6:591c:c858])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b5e4922sm58605515e9.1.2025.10.02.09.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 09:17:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 5/6] drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
Date: Thu,  2 Oct 2025 17:17:27 +0100
Message-ID: <20251002161728.186024-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add LPCLK clock handling to the RZ/G2L MIPI DSI driver to support proper
DSI timing parameter configuration on RZ/V2H SoCs. While lpclk is present
on both RZ/G2L and RZ/V2H SoCs, the RZ/V2H SoC specifically uses the lpclk
rate to configure the DSI timing parameter ULPSEXIT.

Introduce a new lpclk field in the rzg2l_mipi_dsi structure and acquire
the "lpclk" clock during probe to enable lpclk rate-based timing
calculations on RZ/V2H while maintaining compatibility with RZ/G2L.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
v8->v9:
- Added reviewed-by tag from Tomi

v7->v8:
- Updated commit message
- Switched to use devm_clk_get() instead of devm_clk_get_optional()
  as lpclk clock is available on all SoCs.

v6->v7:
- New patch
Note, this patch was previously part of series [0].
[0] https://lore.kernel.org/all/20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 3b52dfc0ea1e..bb03b49b1e85 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -68,6 +68,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -979,6 +980,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
+	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
+	if (IS_ERR(dsi->lpclk))
+		return PTR_ERR(dsi->lpclk);
+
 	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
-- 
2.51.0


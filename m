Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C68A280CC1;
	Sat, 11 Oct 2025 17:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202244; cv=none; b=ldaeCK1dYJwsPSlMjG86lffLpC9Qg7AGV3vJjC0oHnJfQlX+v0yI2zaWcIA+Yng/IsAy2uLnZr+oQ5mP028IHwsVgls6G1K5OxbdLS7kO66mAuWW0jtL3bHLr6GnoeiWV/wcZWzFl9+s1AeND2UiNaO2N6WuYm2EXeC4MxvA8ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202244; c=relaxed/simple;
	bh=uCVRt+2n5YIui9VKizZ/ITz96jKWGnX1dXtwWq6kBaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iEVt+69wMR+W3Gh6rprfVBzEHWH2k2QXxN/j/TzN84wSK6vQCH0CtqkZC9JBcw92S6B3qcVxrnm+qwWsEYN4th/FCXTyRyKr8XM84ZYGBPd6ngss6VGuiCz1vh5DlTgoCg/Y7ofaI4KPbztRzhLu+oVv4ZKCxtAdSpgf9zBPJoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ll3qNdrT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=s1Oi/TGE; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ll3qNdrT";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="s1Oi/TGE"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ckVM44Q8Lz9smD;
	Sat, 11 Oct 2025 19:04:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVx3mwwnJIO6SzjRhUyxbZWuKMLQde5Y09nmaR8DbhU=;
	b=Ll3qNdrTFDoP8y9rSyFqbdl2jPaH7/aDEvnxbh+B3TEjYh/hCwBLqJw2JlSbI2Md/c12BB
	VdovUtp78/NvSqomgbmLaNjOhwUirG6Ro9szvc5hG5xFZMqqUyUwyYRmWTke8TP6FAc1f0
	22cc+9Pm1ZvtkjBbwvZqxbq9O4H/ANyIUMNbTcUMG7gDxGU6ujoqzpSPs/2yKg4xhUoF2l
	ADX62w3rDWramWL9QK1n+C7ACSuVuPEvw9mEW6Qm4ibJbrjaUpsLegc5/ro9cbeaaikqmN
	Z0RryjqiMGZBn0SoZfRrJuQrowJK01DEvEiTUtYzSsWhhlXeh3929R/0FvLkmA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVx3mwwnJIO6SzjRhUyxbZWuKMLQde5Y09nmaR8DbhU=;
	b=s1Oi/TGEiweSi/qVqGZssj0i4u6NZh5grYW/2eW5wwcgdmn2ODVwDt1dHsU19Spxrszrh4
	WiPXKz7i6d/7LyNxWL3dHzpyQ0xv0C+pUrXTiiwFCOKYhL1LQ4ZSRQZ2tlH6XR5yB/Sc4R
	7rCEq60PFJv6LDLpkAfG2D148bM/xAMyAtCjgWtEh+476CiRUbMQqnKrl36QpJYXqp6baa
	i/Xx3FEUjqTTw5t0QmMte8Zeryc8HURR/Cfgsxn1JWyjhhbhGF94xPStzR/Ts+yRi3fEEX
	q9tyYL5B2mrvZr77do6EppNvPJrFzJD1OK1ObZbHZioaVSIpdTiZA0GNBmDhBg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 24/39] drm/imx: Add more RGB swizzling options
Date: Sat, 11 Oct 2025 18:51:39 +0200
Message-ID: <20251011170213.128907-25-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9bba8d061e45bcd3bf3
X-MBO-RS-META: cb1sr4stpa5mrzc5s1w6pqip7jsx6q47

Add additional buffer format swizzling options beyond XR24, the
hardware is capable of sampling other formats, fill them in.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-fu.c    | 40 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c |  8 +++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index cc8b0d05891fd..dd4a3d20fdbf4 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -65,6 +65,46 @@ static const struct dc_fu_pixel_format pixel_formats[] = {
 		DRM_FORMAT_XRGB8888,
 		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
 		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_ARGB8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(24),
+	}, {
+		DRM_FORMAT_ABGR8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(24),
+	}, {
+		DRM_FORMAT_XBGR8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGBA8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGBX8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_BGRA8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_BGRX8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGB888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_BGR888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGB565,
+		R_BITS(5)   | G_BITS(6)   | B_BITS(5)   | A_BITS(0),
+		R_SHIFT(11) | G_SHIFT(5)  | B_SHIFT(0)  | A_SHIFT(0),
 	},
 };
 
diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index 18010c2b0bd78..182dff15af679 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -34,6 +34,14 @@ do {									\
 
 static const uint32_t dc_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,
 };
 
 static const struct drm_plane_funcs dc_plane_funcs = {
-- 
2.51.0


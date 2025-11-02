Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCEB2673BA;
	Sun,  2 Nov 2025 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762100652; cv=none; b=tOV6UosHrzN6wMY3pg4lAgWh/usQMGSJFX3L4vG3YhWw4gV6NadDxsHiGpvY3iRUA2EoAb906JLu3dwJl+F7b+IKniHW2/HTT1Mb5OUgq//C6QyWrJhNx8f3c4z3bj9jUihKLYayhYos/4KqJwporzzrOsDxQbRCuKwmRSI9O54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762100652; c=relaxed/simple;
	bh=mGmYapIzbZQrxhsTq6KP7Hn6ec7HXaroEZyEdQBtMyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P+veF2ItXYSd2/CGlTeOBb+xyCRQ6hwj1e4rjijmEa0samh/2S5RzzIQfaRmv2URI94RCLdF38M7rCAwhVWgE4XGqlk/iWQKwPkqZzh+8hq3lMb1ParlXaXktRv5uQSE81btwCJUBDtbvyFjRmxjV1lxyNnzyaOIxI3eTDBQm4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Xa9Ul6+T; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TmZAXsEg; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Xa9Ul6+T";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TmZAXsEg"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d00Qv3Xpyz9tKH;
	Sun,  2 Nov 2025 17:24:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762100647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PtV0EHNf/bgETwb9Y5Wbm3a2baMq2ICCpIudlf4ZcoA=;
	b=Xa9Ul6+TIPiPSgkEFYOzN98Iev3vxi70wR63uOnVxRJs7koYkbLQRL56J4EgLpbJrUvIhc
	rWDAGWO2hSdalURNPfLWwEpQl2SZi6bqdkL4qsx0gkPehTSaGrAvdMLVQobEfpL+puSycW
	r0Gj0PsEsLWoTETq7cYAyYrmZDdmQKk755dWjDDuXmbA+boHwx2jwMmEbXADchSwWResWn
	ZuveQoAwV1nbyJ/Rpe4l+dBC5CMfZCkkEsmX360SV0BtyHrbIen2pL7AWShlZuhZMtMkLm
	EjnB9aqfJhlP1GU87joZnRZT6I971tcvw9ZO4pEQMgvns8bO6V6mg9u+h+ztug==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762100645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PtV0EHNf/bgETwb9Y5Wbm3a2baMq2ICCpIudlf4ZcoA=;
	b=TmZAXsEgScdvfvZ6jcY39fxhG2Tej1tbAc+p3enP122evrensmuHB+fKR8fgU0hWIVyLg1
	D+aD/w83gVNXUIzO6l+AU3q84bRZmAv0tixjTq3/Btn4cglBxV18e/R1euGQ9uZua1B7sd
	3pdgQ/f6ET8ng3AxknLK14LrE5b5XhDEFvdXjefQht/pO9YWdbxtomZhsXs3GCWnfxawkG
	a6oK1HFaj9822CQ2F6A/OQcDjKwp1Fg2u+YXaZ97a66QoDviUcaoV8VMy+U8/Nw0/voRlt
	O2KQe+hiCXiSOg8foPMNPaNbefvYX1GD8mWXPwudQpqxTbOgLJ6R3Or+tXoMRQ==
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
Subject: [PATCH v2] drm/imx: dc-plane: Add more RGB swizzling options
Date: Sun,  2 Nov 2025 17:23:35 +0100
Message-ID: <20251102162359.49263-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: afzkpsu1auh545uzmwggapoykz6abq1y
X-MBO-RS-ID: 3d859c5a7696e309fbc

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
V2: - Adjust commit subject
    - Drop the alpha formats for now, add RGB888/BGR888 to dc_plane_formats[]
---
 drivers/gpu/drm/imx/dc/dc-fu.c    | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c |  6 ++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index 1d8f74babef8a..b4a3f8c58cbb0 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -65,6 +65,30 @@ static const struct dc_fu_pixel_format pixel_formats[] = {
 		DRM_FORMAT_XRGB8888,
 		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
 		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_XBGR8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGBX8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
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
index e40d5d66c5c1f..4fd58afef16bb 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -33,6 +33,12 @@ do {									\
 
 static const uint32_t dc_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
 };
 
 static const struct drm_plane_funcs dc_plane_funcs = {
-- 
2.51.0


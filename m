Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1361187545;
	Wed,  3 Jul 2024 10:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004186; cv=none; b=QOhNgs92VKunVS1pUzN7t8c3AzaLnaIMYh6hJSJ/69twmwalY4DxmhrP3SqAepXFADy2bCs1xTeYtmtbH2oAVp4HU9aNDYNC2DPQr6kncKoTpQchJjaTqX/rzjZx4tYb286T3No9l8UZo96q9bM9yI8zDFNhqthTpWLcbTBLoUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004186; c=relaxed/simple;
	bh=RQCaPws+FCDZv7A0geogOE0/pG4zn9g2h17NvarV8GU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZpWtmXq1I/nKhTk22nPMduEtEen0ScHpzZuCq4LnaN10EFaVTt5988UgDazuiTx1a9W5GkfFRFfSYzNujH5NedF++oAxkrCN8kd/q79WVbxFQqfrP3NubA79wNbz2gV4eXJAg80C7YXHpbJj/hbJJzf99AHPCVZXTA4Wjff8+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=UK6kcdDx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oXiUPHUP; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="UK6kcdDx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oXiUPHUP"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 1C6061380623;
	Wed,  3 Jul 2024 06:56:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 03 Jul 2024 06:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1720004184; x=
	1720090584; bh=DOYg+Z7RL/XC0/oVJ+OSKhXGs6ez2FfGgNXDKawiyks=; b=U
	K6kcdDxkvrlV+Zx6+eoZAumo9/YJMhAIV4IPB+aJ3bhIXgqgHTMvtXZNBnaMt072
	zwJBuxrs1Ik8+dMVDA8UxekZNTQJwWE+4N+qd5zxHOa5uSDndqyWm5AyxM/pGkWX
	+FGGcripBJhomZSHtAV7b15HUGeS5kon5jn3885xLLB0iUr4CWgvMym1EgdPL8lB
	QOVTK2UD+UFu93d8TpMQFtfEJDMBg/fB8IoqdrLn3UYTKD2v1eUy9ndlof1ZUUi2
	mG3iMV5pICVccO98VD8+SCftnQYaCkMSSMxBURJbWTfpFHmy8RJq3BfWn9YRmXTR
	f5FH0VCONwyKlJXRBLYgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004184; x=
	1720090584; bh=DOYg+Z7RL/XC0/oVJ+OSKhXGs6ez2FfGgNXDKawiyks=; b=o
	XiUPHUPmmibQK91pO3E61a3+AN3PDdkKHNtSHNLI71IQ2gBBf+Uou3ja8Ko6DF+b
	2xTybS2uk9nHh6nDT+N/t5Vsln/Ud27401in0M+J0ISmFvJHoOuqWrXW3/2f9sLP
	7rR0zBs/xDMrFTHVNBAcjiQTSoPxinprsnp44TlDHvFJ5c2mZruliQ7yCXxb8jnA
	l01zx6RGrEjZonMHA/LREaFWOf2j/NUWwU8s3iVJJYMy2QYo1y8P1yYlqj8A2+Va
	+E9vX3QhqamabaqG3aIBA+W/xmye5l/zXtkwQRB6ZiGWgmZc4qYkEpNOjKRSpaOs
	XCCg2LfQ5QsKHa7bVj9VA==
X-ME-Sender: <xms:Vy6FZnr5Om2hEwOAhwjbq2BeMDLyJOMTd_lvxHeB_5b7KlyUnQhrEQ>
    <xme:Vy6FZhrxrY7UOTwc3GOE3NOElGxjCgsNOqphOhyOHK2UDSZDkDpBrOxInLw2VU6S5
    Xhlyy7bKmb2kgbbMA>
X-ME-Received: <xmr:Vy6FZkNcBc4eL5zuOvxAmF0YSeKisMwFiYVDEouI_AY_Q8h6sPehC6l4DyimZhQrPVSdft140eMtxxIKbV9Iysiphl3WJulve-6G4IVwCYUvJXcD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
    hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
    htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
    heetnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomheprh
    ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:WC6FZq7m0_Vq1_8Y0SXTkcrngU4uiyZMq9-DQw7AywaEhXv1DOqU1Q>
    <xmx:WC6FZm5QJdVHOmE80scXqfCeGEsFCjEZZb8rqfEFbSNVFG0SE3FBYQ>
    <xmx:WC6FZiivdFFVusSLf7JRyLOfbZ6B5tVZTOid-SP5mEuD9Fq5ugyECQ>
    <xmx:WC6FZo4Vih-ks_Vj3N7_4wCsCmPiMtgUcaN-87yTjANcRwVEM8El6Q>
    <xmx:WC6FZrpYHGwyEILMq8jqgdszginUXe3jqGQeL1h-13OA23pG-doawPOT>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:56:18 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	John Watts <contact@jookia.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 11/23] drm: sun4i: de3: add YUV support to the TCON
Date: Wed,  3 Jul 2024 22:51:01 +1200
Message-ID: <20240703105454.41254-12-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703105454.41254-1-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Account for U/V channel subsampling by reducing the dot clock and
resolution with a divider in the DE3 timing controller if a YUV format
is selected.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index a1a2c845ade0c..e39926e9f0b5d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -598,14 +598,26 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 				 const struct drm_display_mode *mode)
 {
-	unsigned int bp, hsync, vsync, vtotal;
+	unsigned int bp, hsync, vsync, vtotal, div;
+	struct sun4i_crtc *scrtc = tcon->crtc;
+	struct sunxi_engine *engine = scrtc->engine;
 	u8 clk_delay;
 	u32 val;
 
 	WARN_ON(!tcon->quirks->has_channel_1);
 
+	switch (engine->format) {
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+		div = 2;
+		break;
+	default:
+		div = 1;
+		break;
+	}
+
 	/* Configure the dot clock */
-	clk_set_rate(tcon->sclk1, mode->crtc_clock * 1000);
+	clk_set_rate(tcon->sclk1, mode->crtc_clock * 1000 / div);
 
 	/* Adjust clock delay */
 	clk_delay = sun4i_tcon_get_clk_delay(mode, 1);
@@ -624,17 +636,17 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 
 	/* Set the input resolution */
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC0_REG,
-		     SUN4I_TCON1_BASIC0_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON1_BASIC0_X(mode->crtc_hdisplay / div) |
 		     SUN4I_TCON1_BASIC0_Y(mode->crtc_vdisplay));
 
 	/* Set the upscaling resolution */
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC1_REG,
-		     SUN4I_TCON1_BASIC1_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON1_BASIC1_X(mode->crtc_hdisplay / div) |
 		     SUN4I_TCON1_BASIC1_Y(mode->crtc_vdisplay));
 
 	/* Set the output resolution */
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC2_REG,
-		     SUN4I_TCON1_BASIC2_X(mode->crtc_hdisplay) |
+		     SUN4I_TCON1_BASIC2_X(mode->crtc_hdisplay / div) |
 		     SUN4I_TCON1_BASIC2_Y(mode->crtc_vdisplay));
 
 	/* Set horizontal display timings */
@@ -642,8 +654,8 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 	DRM_DEBUG_DRIVER("Setting horizontal total %d, backporch %d\n",
 			 mode->htotal, bp);
 	regmap_write(tcon->regs, SUN4I_TCON1_BASIC3_REG,
-		     SUN4I_TCON1_BASIC3_H_TOTAL(mode->crtc_htotal) |
-		     SUN4I_TCON1_BASIC3_H_BACKPORCH(bp));
+		     SUN4I_TCON1_BASIC3_H_TOTAL(mode->crtc_htotal / div) |
+		     SUN4I_TCON1_BASIC3_H_BACKPORCH(bp / div));
 
 	bp = mode->crtc_vtotal - mode->crtc_vsync_start;
 	DRM_DEBUG_DRIVER("Setting vertical total %d, backporch %d\n",
-- 
2.45.2


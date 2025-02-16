Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797891624F7;
	Sun, 16 Feb 2025 08:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739696234; cv=none; b=K+MGFwuUs4VTgOo5qEU/phHfSrxKezhuW2zB5aHyjXIzXiQ1ThjKOX57wb+7/oYrNnoub+06zzT8July2Hz4C0CcIyOWrqEdl3mz5LiaT0yVuwNslBIci7aC+SlnnW/xLg5/cy8hmEvt7JNovScySr8FCpEYxKkZf/WCJelLCR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739696234; c=relaxed/simple;
	bh=m/HQEOs3sIqQx5pHpxexvu6bxOLHwr9LC471uzTV+Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgjRm7fgGTo6rJg9rWcDTICO9qEeOvN3V9eODxCExylGNpkyROqeKmALIhL18h6r0iFwhuo0UYaaVMVB3w63nqHxnTYoDkZ+5kle5zsmrJ5Lp86k+qqsaLvVG1qzlV+gmXV6A+Bi1ncr82cLTElX/YNAC5Dal0fx/uvQUzfAUy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Dmox648l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wT6T8Vwb; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Dmox648l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wT6T8Vwb"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id F2DFD1140115;
	Sun, 16 Feb 2025 03:57:10 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 16 Feb 2025 03:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696230; x=
	1739782630; bh=pNN4RBGoTZlMx5uVmdpRTe10uEZ7WZE2J9+a1pOThlU=; b=D
	mox648ljHJDAW9ch+aahuxNujXkNk5hFGEDG20Elnn5o5dFLoEKfYDe6suXRWoz3
	Zn4ZclfUoJwtWM2kekRtX2MN7+TVHsBPXRjeaueokrpsJrJ1gKgD5n6tgLptseDB
	YewTBXHQz5sVOSy5+HF0Np4ntQxDgB3gJhSaX9c6c3I2OoKhMGmfh8HfwrTDNvWe
	mGbiL3FQieeCZQ/W0h7MhqZaKCxEHYyDlLjxotZv/flO9u9jIyw1VbwrN9zGjp1+
	8yLXTjI5KwJAWViPg1PwUwwLMdj7SdWlkkk/XFBz9pg8dh3jXDA7cWHnzFoB1QtV
	dofZmXrWBtPuzs/51rTIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696230; x=1739782630; bh=p
	NN4RBGoTZlMx5uVmdpRTe10uEZ7WZE2J9+a1pOThlU=; b=wT6T8VwbGoZOaHsmL
	1IsQfv763ZAsvlX1YfNZ4R1AwVFwoCNe/8RnNrN6rKe7fCG/dCuxAP6PvKXAGM6c
	Y3LMXI0DJO+1L61GiezmB/6slQ0GPfYgj9PdeORFGAfdIUG0ymcBpsUrPvE2NoQt
	pPRHLS3zc4qjQIgLUUhBqwnHo3nKZpvwYO3DEQRBN7N3XFYL5a/cg2zYGg+4u13C
	CEHR/SPvmikBwkbOiUT3NwBJi9O210YQleKKW4jRRzRQfs/jW5P4DlT+EytYj1jS
	B8Di/lqBGtZBLcxffRtdYF5rm/T0zpKf0nvTE1rs+um2hDmtUV9qrB7I4qQWTdhB
	2/ukg==
X-ME-Sender: <xms:ZqixZxVs2b-0fqK9Mfi6b5eQQRqdS816JyVvQz1UnU-jI3C4pbDZmw>
    <xme:ZqixZxn__ycx_Y_wPX_W1ghJLMY2CbLK-s8WjzwOFwWRkRcJR-epF4eT9YSJruHQ8
    XrVvDANsivtyvAPtQ>
X-ME-Received: <xmr:ZqixZ9ZrnNevqaWjayGtljJe7zrYUNPrv7RF49-3cpkBjZqBkXsVLbGR0IY_KchuusMTRQQRK4SrR00xkLiVzNU4KzSKRaWcmGz56NdJeHkX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ZqixZ0Wap5gvd0kklJrH8YbWKKBwlypw8aq87hGIU35ZK2JCmU_1qA>
    <xmx:ZqixZ7lx1t3WkXDmAZhjXJ_udfD-fYGUMynhvMK2e1LO742VHG8uXg>
    <xmx:ZqixZxc-7eOkdYivHuMYmhDu7IaDBXrd8c0uxIXzjNn_Aj-Dmsmhcg>
    <xmx:ZqixZ1GrndMDCSePKp9cZGt9gSYTLApbGOFSjo492sF7CxR0fb1b-A>
    <xmx:ZqixZ_3wQ9cKsCXNIdYn4wjefIeGrOPuiH2Td9MRxuL46QCcTp8sebMs>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:57:04 -0500 (EST)
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
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v6 12/27] drm: sun4i: de3: add YUV support to the TCON
Date: Sun, 16 Feb 2025 21:50:43 +1300
Message-ID: <20250216085432.6373-14-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
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

--
Changelog v5..v6:
- Update to obtain color format from mixer if required.
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c8291da..4cd3a07daf6e4 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -37,6 +37,7 @@
 #include "sun4i_tcon.h"
 #include "sun6i_mipi_dsi.h"
 #include "sun4i_tcon_dclk.h"
+#include "sun8i_mixer.h"
 #include "sun8i_tcon_top.h"
 #include "sunxi_engine.h"
 
@@ -598,14 +599,27 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 				 const struct drm_display_mode *mode)
 {
-	unsigned int bp, hsync, vsync, vtotal;
+	unsigned int bp, hsync, vsync, vtotal, div;
+	struct sun4i_crtc *scrtc = tcon->crtc;
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(scrtc->engine);
+
 	u8 clk_delay;
 	u32 val;
 
 	WARN_ON(!tcon->quirks->has_channel_1);
 
+	switch (mixer->color_model.format) {
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
@@ -624,17 +638,17 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
 
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
@@ -642,8 +656,8 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
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
2.48.1


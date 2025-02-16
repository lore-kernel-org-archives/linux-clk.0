Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41896155757;
	Sun, 16 Feb 2025 08:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739696163; cv=none; b=B8r02rX3/gb4l9o1oFfGmCcV5ox70ZBXuh9kUh0+HUQmeXWV1ijhtjqfuWeUDs2nHaOMGTIE0P9g8k2oCMIFl9wOGiyynr1tV5FXC0SwSAFSO/yOD3tPBbU8cFUgEms/V7/60XV6whqUqkCtXkZY+Mb63HL4mALIlHZZVqFwZko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739696163; c=relaxed/simple;
	bh=hUwygZnC9A8r9r/TTvs8ZuAjeZ3XO7HxLrkm5w8mu8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SevqLCqTU+8nA85HvNyIPHEb1T03LQvZ5x0x2pqSFEy6pZA9u0lApWwvG7kttYzjSidBNGZehwIa6h7h3JbO6W9T3z0nggYZTwLMPH4QLLFhgf5MXhh/slqz/TFMeIh6fZirfPpGG8WNe4j3fNLbJKu7vhy6ndXKDSC0NNPtkUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=QFM5ceL3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c9kgRjLQ; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="QFM5ceL3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c9kgRjLQ"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 18A8C1140102;
	Sun, 16 Feb 2025 03:56:01 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 16 Feb 2025 03:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696160; x=
	1739782560; bh=FL9di+CvqAZswVCEURGPLsHq/4BTefiQImdfVOi0kBA=; b=Q
	FM5ceL3cF6NWuRT0SrjD3knIjgyfpLQVkYvdoqDCdIElL27phD+nJw3P548sx4V2
	xbdho9GbmdZho0ITm09rL8+il8WwPJRmahol8T632pEp8fld7eb++p6Cm6t5ClWd
	l/WWq2drSTKh129q4zBvE+BRGpJS901R8AAr7EauqxoW35pRIrDnqLVfcrBqh+Am
	6PvVyF3U/plCkms+IzPbhE/S53/fo4TMXmjzTnKwxq2DjGUucXFGYLTUQE3sXJSO
	t7mo4u9sWsSFKAQFyOFcJjUPYJDP9oK4cGvfRZ49WCdH4RAsaflrcH1bIX97uMhY
	C3DSBH+64cnvMMJ4xSyNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696160; x=1739782560; bh=F
	L9di+CvqAZswVCEURGPLsHq/4BTefiQImdfVOi0kBA=; b=c9kgRjLQEQygFnLlT
	9dmL/4DKsltE9/M1CPGtLjZLhg9LBH8md5L0uOCKGuhVJmLT3CCWPS0Q9j7cKIBU
	rklTcsy02CkKl412lyoQoki+OSRCvd3w4GwIP278ZR8dtQSJphUdexbpDRO6h1sd
	YwxTfExpKhPlwpDZPizL5OtWS8SB+7FQzIlMeV4nE0yLW8v8k8JGMsFQ5bu4CXXN
	0fwAMEAFO+ZovJ9LHX8Qbj688D99yB3EyknH77qwySW5/brKJ3GijQuMbYlqsD3p
	ExbyCs7mEjipbauszl1a+GEjWMgilwRkEITPelwH1bIddGyxQzRaXtm1Dq4CQej1
	lRHSw==
X-ME-Sender: <xms:IKixZ_WGH4BkYOW63tEHpbG0cMjJzr2WQUq4rPNyCbqT5wsG2tXF8w>
    <xme:IKixZ3mwfggAdSxksKHyL6pEjLEwWypGQZkU-EZDXcbipimj5uazq897BfK7O4Qnb
    WywHRVmVwI6d2BYSQ>
X-ME-Received: <xmr:IKixZ7YxagXd_NxqZyp3z5ZbyEf5drgXdHtCoP8QC4jBN0DardoiVqCn94y19gQf_eH4AF003fCAH8tfKZ8QwioUIBuchfxs9gJa_-0_OaY1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IKixZ6UajKP3uDbMGrEYGrXnRCg7hOjJ6Z4VxLHAwmGdkT0JQAHTDA>
    <xmx:IKixZ5la92T0ZrcViT3Uiu_bTkGL5Bne416BGU_bgr7a_ZWVIHSwFg>
    <xmx:IKixZ3elqey_VbskOBF5jRR4Om5tBnPrCCUEYcbfu1iTUHb-3zwghQ>
    <xmx:IKixZzHvNV1yE4D3jNKwhVXLbDSj7uyTrg3PmPJBHAReUIhT06_msw>
    <xmx:IKixZ90myu9qeJgN44woA6nsH0wOor2wDTn6lOtehFJ8XziFn1v9aPOC>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:55:54 -0500 (EST)
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
Subject: [PATCH v6 03/27] drm: sun4i: de2/de3: call csc setup also for UI layer
Date: Sun, 16 Feb 2025 21:50:34 +1300
Message-ID: <20250216085432.6373-5-ryan@testtoast.com>
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

Currently, only VI layer calls CSC setup function. This comes from DE2
limitation, which doesn't have CSC unit for UI layers. However, DE3 has
separate CSC units for each layer. This allows display pipeline to make
output signal in different color spaces. To support both use cases, add
a call to CSC setup function also in UI layer code. For DE2, this will
be a no-op, but it will allow DE3 to output signal in multiple formats.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 8 +++++---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 6 ++++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 5606912f92de5..558f7a4c1354e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -209,8 +209,10 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 		return;
 	}
 
-	base = ccsc_base[mixer->cfg->ccsc][layer];
+	if (layer < mixer->cfg->vi_num) {
+		base = ccsc_base[mixer->cfg->ccsc][layer];
 
-	sun8i_csc_setup(mixer->engine.regs, base,
-			fmt_type, encoding, range);
+		sun8i_csc_setup(mixer->engine.regs, base,
+				fmt_type, encoding, range);
+	}
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index b90e5edef4e88..aa987bca1dbb9 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -20,6 +20,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_ui_scaler.h"
@@ -135,6 +136,11 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, val);
 
+	/* Note: encoding and range arguments are ignored for RGB */
+	sun8i_csc_set_ccsc(mixer, channel, FORMAT_TYPE_RGB,
+			   DRM_COLOR_YCBCR_BT601,
+			   DRM_COLOR_YCBCR_FULL_RANGE);
+
 	return 0;
 }
 
-- 
2.48.1


Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7F4155C8D;
	Sat, 21 Sep 2024 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726912364; cv=none; b=RSg8D6rF8DDd6Lo33bMFYMyOV8yDGXxukpid+UoYvUI/7BP39AM3scaie1eUyuLFbZa+b3UsaVn87eOLOvvyPinVYdSqdab/QRZ7VcOjbPwnasGNst9IVnrTqs1ySpJZrizMKsRBcqZ9QRXaMsLA2VLmcDmQrdWmeHtS1xG/u6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726912364; c=relaxed/simple;
	bh=tPJ9Tui6obnlmYZAQz+oFV/G191xzjhDWCaH9JGS6I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j84DA83ZF4K3j3TH/Na69APAN32xjzmE1HXvIxFobXy9d9S7AMv6Y//LahTo7KGpv/i0OspGNTUolO+sfCg3lM0dTuTR/KGp9iCd5wTMUPs5jiLLmRWIaE+w2DoSyKfRMjArHRjpsvbih+xo7W0dms0bj4K8swv1UIr+VBqqyUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=0mCRCEL+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LudYP/BP; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="0mCRCEL+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LudYP/BP"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 834BA114024F;
	Sat, 21 Sep 2024 05:52:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 21 Sep 2024 05:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1726912362; x=
	1726998762; bh=j39o6gjNS9OmLnvkrdvnX7rGkSbKds69G+QiPuGs8E4=; b=0
	mCRCEL+800+je9tBPukjrCxgq2IO/JEAXlAqEAcPYNJakx8gPXX/1/CAO+Cp4FrT
	3yMIM92K0rsSe3X/cie6X58sp4fIX2neRDb09BJ0CbUbO+ALGN031gPMXEnmZxxy
	tPNFDh9awI9QHadAVSI++yVjGAHNpQBhKcFp28V61g9+miikXzxISWu05PPWJcUv
	BAQ4Ya7Ottw+/M4iH5cz57GQCntfzR7lj9eWi1GgcSt0Bppz7lAdrOei0Np5PFDU
	q3N7IuT3xsT5DqK+WaUb2zR51vdM1xPN5mCGY/ws9vIL87BXCbP/yrS3bhQM2IO+
	6YcuELOqpXEIMav6LrqQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1726912362; x=
	1726998762; bh=j39o6gjNS9OmLnvkrdvnX7rGkSbKds69G+QiPuGs8E4=; b=L
	udYP/BP8Az6z6q7xQXdJLAL5eeaHeU+MGnVzFEX+fXVM7Y5rsriZq+n+gvI3BSVf
	juDAIC307Xky9Zk6dP+tDEhSyrnVZuQnp1R+yDrrg1IpBwM/N1wuZc9U5Ke79mZM
	3EiJWCgArSJwROJm/gSsq551xc+0r5NL0cS2qRZVJqRsNm21aJomDfyHCvn/CHd4
	w4va7sVFnalXlpLGruM2AZYW3V/p5dtIPDImg07eM8AfN/HbDIYeZk6cpCVJuZe/
	AKWiivBdxotx9jTr9mqHsotrS8rmb43K3KpNObmfzQfJf1DCoN0gWJNuRq/PyqHQ
	6g6jtX5HdDiX6YThQKwLg==
X-ME-Sender: <xms:apfuZj0pCXfA8QUTSVHnLprh_FujRH8Mp9DbMXmPeXTnI7ts8mZSwQ>
    <xme:apfuZiF5JRwZ8yj2AB3CqeWhMZf9F2iuSLZdj5zVOyvlPDMybfLT1xcnjt375vitz
    8eqMQtA7EZvEu9uyw>
X-ME-Received: <xmr:apfuZj6RlOa6Tg2I3sDXQlWty6BdUh6jfBu-AxEC_yhzaZ0tkExFN10srZDNZXivAtT68nXW4AjDecHwWZloRPldY0OOdTaWSe3keqYLtdrHnmBc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelhedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrd
    gtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeev
    ueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghp
    thhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghp
    thhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthht
    oheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhesfh
    hffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtph
    htthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:apfuZo33ypXtRACPsaIEiSeKCOl0CRgcEt0VEccxtVqnJrYQYDmFcA>
    <xmx:apfuZmHZE9oMCkyEvKWeZQ19VazyhNplpsH-RMpkS9pqpn9z_PG-Fg>
    <xmx:apfuZp9QE7QQxvW1WbnG-WshVEpKmSlKLtT7Fzz6Z4hmcrr0sm8-1w>
    <xmx:apfuZjm_2a3aBwo13ga2gIsWrWDiRD_JyrqhSyF3y14-8AKCn7WpVQ>
    <xmx:apfuZv2lRI65njnCysqEU-FzqN-cF-a5sU68uJiMyL-MPYpvKEXzpz4Y>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Sep 2024 05:52:36 -0400 (EDT)
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
Subject: [PATCH v4 03/26] drm: sun4i: de2/de3: call csc setup also for UI layer
Date: Sat, 21 Sep 2024 21:45:52 +1200
Message-ID: <20240921095153.213568-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240921095153.213568-1-ryan@testtoast.com>
References: <20240921095153.213568-1-ryan@testtoast.com>
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
index 0dcbc0866ae82..68d955c63b05b 100644
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
2.46.1


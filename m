Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F8B181CE4;
	Wed,  3 Jul 2024 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004136; cv=none; b=TBTsH0ge0RVBpA8/jKtYsNtcpFVzcVv0MKiqgGyQ/aF6TeWW3e5H+pH+yvNkij139gMNEhW+iwEtz5mdFVyhOODsrtCZY158eWj5Lq+p8VcqtW2o6ldbSIQAooeu6FbqTK905CEiiUWa4Bmkn8868xZzjqyIzCwwwqQEuqvz9co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004136; c=relaxed/simple;
	bh=HMODOo3A6QjA9V2GBeag+gD9yEIkvn2EhoX47FYjChU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4PiWG6XikYsFc8BBcf2FjlJPzFBh8Y7cKPhg/bjoyxpdoQZOO1z6w3/V8B+BkiworqDawOXnTqMluJa7ZGGci1o7VrEKeSAJwmG3Drl7LGG+3UPOrmUlrliQdYxYkklJNKoc963mWPpPQ7bFFAOGj4J49ydVhXTLhSVs91vrHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=BlPGfyy4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=k6LstXKU; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="BlPGfyy4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="k6LstXKU"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id CD8C61380623;
	Wed,  3 Jul 2024 06:55:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 03 Jul 2024 06:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1720004133; x=
	1720090533; bh=o3qVQfKQ/XHL+ZVO+DX1YbTnMylMpiQelndBdWLa+sI=; b=B
	lPGfyy4ZoX8GowuXA5dD0Lk5ksLAIRgtfwWxR0wSOcnloBJ8oNfuPwF7Wmzh3iBr
	T1UdEt1yR1Hlvq5I+JzXB3B8f87xdqgqEmGuTxKcSNgKzSJbmdbAjnPYu1ztv2HX
	Hj7e91bZ55Z8H2RlBeTfi16xOMsE4AeRcjgmwxDYuw+gjyPfx+L91Zj5KjsMuas6
	JwfAu3xOBpHrwGIxhH/JJ0xXUcbx9jb5k+fGJ7GreDXVrHXW6EOehY55M3LZs76+
	mDBpTTRYiTS80DIyTxjDcm5FBEEmgz8w9N8b0vFchhQs3A1BuXNa+zIwhDYq7ts6
	yAFVUZPLZ8d11DvLXWNyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004133; x=
	1720090533; bh=o3qVQfKQ/XHL+ZVO+DX1YbTnMylMpiQelndBdWLa+sI=; b=k
	6LstXKU4Uyn5ehXICrxT85I656gdgUrubHwuZqOp4WP/TCkZXlewHZQOWGxaIf69
	cmkQXuJQfcqtVlwoz5DZXX0Sf+z37uTiP31dhU40KkaILIKerQGyGXoPDzyM7Arx
	W7F8t8uELjOi9UJypSJ76AH6O3NufmrsWwd7gAdgZBz+Ov+bI6iP7kcLV/4qJaRw
	PCHkFIlt4rRPvaCMNFgWVIh/ZNZ3wb7fwIDjPANy4ei9yQWZYJixhmsDV/dAdbEt
	k/Urr2OIy6+JKqZ+jvt9tlR7wus5EsI5e5AonwVfPKe+PZBwslPHfrr3eUvZkJCD
	48CKSs1xeRdW1cd2L+GMA==
X-ME-Sender: <xms:JS6FZkzzx4kGiMiD3b4zZPQ4ByXJoERhyNN8m1J52nAMK6uW2YBEOA>
    <xme:JS6FZoT7vsi8AyF5M-MPNLjq1QIKnWQrgEpgM80CFM_t0CbAWI2MpIJIFL2FwyKoU
    Ny1zClglM0jiOKaxQ>
X-ME-Received: <xmr:JS6FZmUHWlyuR27IgkGv8mRGfjTMjaHtyPBMX0YagA2ou6kj2ICTm-hhoqJh6Z8mzSESA4CJQ-WtQUmhe6g49A033GBgtZyX1Lxc6QhH3Sdxrvd1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdeffecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
    hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
    htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
    heetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprh
    ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:JS6FZihQ-eAHvDSK2hYQrF3GFEavWjgQ8SZu58km5OT22wAsxsiMLg>
    <xmx:JS6FZmDVTplDlnSZz7DG8Ds3SeiA2lnS3IIYULGw0OhPtnDzZvRtdQ>
    <xmx:JS6FZjK2q4_7vbSW0qKad792WqOVz_HOeez7jGUuSXBesuaJBxygsA>
    <xmx:JS6FZtAQgzYjakcLn7ajq4ddfotgjL3u95N6cq8_lRklF3_ziarwBg>
    <xmx:JS6FZoyjFM53X13NHynRX1V941zF4Z0IniiqZXFFkRO9d3P14CsN7ZIJ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:55:27 -0400 (EDT)
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
Subject: [PATCH v2 03/23] drm: sun4i: de2/de3: call csc setup also for UI layer
Date: Wed,  3 Jul 2024 22:50:53 +1200
Message-ID: <20240703105454.41254-4-ryan@testtoast.com>
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
index ca75ca0835a63..884abe3cf773a 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -20,6 +20,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_ui_scaler.h"
@@ -184,6 +185,11 @@ static int sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, int channel,
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
2.45.2


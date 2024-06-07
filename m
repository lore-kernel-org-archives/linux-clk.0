Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E45D1862AC;
	Fri,  7 Jun 2024 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717758215; cv=none; b=mDcwz+O0nKEG+CE/oXpecQ71CO6TWcui8pgpHTwKpF0K40/6xDFbk17Ug2namQT+h4K4BIIM9VojXbo5ZNCgXWEyilWHxKJG6Kx0sb22xX8pBzYiUPn/sPtC17kvCoMUiSSbEN26D+0znAEI0ezdySMROJksP/XaTmiLDnDBEoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717758215; c=relaxed/simple;
	bh=3dLMN8DJ3kc3NFlKy7xgJT+kxdJcQlqlnjwh8OYHNQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxeNHTYkRW0ybqbnhJSNDA+RhVQE1UPyjaBitXTLkPLIMNaOnjRzT4PWpfZK6G9TdSniYDLbkSMCup0Gqu1AX9m4E018qqlz3njtUq1NrLs6M5mmnJ8Te39kMBCNHr56frjfZIkiSOI/Kxo9whuodLGmaZ6JtiurO6bNw4pUFZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=vOIovY1/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CD/AibnJ; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="vOIovY1/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CD/AibnJ"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 18E07180014B;
	Fri,  7 Jun 2024 07:03:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 07 Jun 2024 07:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1717758211; x=
	1717844611; bh=gjHFAumnKJcTZvrMARevkTtJN9PJo4wyCg8SOfOhIB0=; b=v
	OIovY1/ditJFJcJMhwnz7Cn8Ha5FdZWDBNjFyMJgLbjPJj8/RUK8lG/9MlwmCp2y
	Eq50L7FHBgkeCoEB6vcJlJyQOJ0zXw4BqO0D/od3R7mmgCCAMSxxR3W53PgRnkHi
	9uD4d6Una6qaqtLRlJrtA3NLFYqT6V+exl55Bq59nyfkCBrEyGNqDBOhNIOGJtjq
	1UC34qKAd3o9QDzgyd34SlcPWcECRnLWCn3IVNUz7xd4JQhvmyqH22YkMrNbLmgH
	pOkPcm2+cHBap7mHFg/LHrP8HW6iVhz1QV9tCB7iNLbBLkYtQWVZCVtDzkP0yHlQ
	MTn5fHCl8m0Q7rZ9XPPWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717758211; x=
	1717844611; bh=gjHFAumnKJcTZvrMARevkTtJN9PJo4wyCg8SOfOhIB0=; b=C
	D/AibnJ5Hzw93UQnt2nMWXQP2gGHsN4ZbcQ5Si4wUgazfCF9QmvCUaJHPi+oUDbq
	eNbbj83cJFk5CI6KQyriOEp97ZZXoMTYGd3BYSTugySXzNZnRDwJ5jQkp7DsMTZz
	oxLv4Mgq/9vZ+Qh+jzNOCJkHW3ugmsffNzc4le/0qyNhUPLRS3+PexkLVI/qftBr
	eX1GGYATSOA8UE2wgl0ViDNelnfkrbrlntJKUZniEm8ga/xq0YALAc496akJ0C6H
	7eIp5FJVXV86nMUcI14t0x2MmvqSTxmqJjP0aXrwe3TNSZKVqOi8fpuChTjcLXqW
	2XrqoP2pVAjCRHvzz70pg==
X-ME-Sender: <xms:A-liZmu3jhvqvKv0ILsZowDD7PJHCJ2wZEQ9qz8m-2ohTrizICuzDg>
    <xme:A-liZrdWKB3wSx2XOe2ywws_fb0U9aDwfRyfkrQ740xwzJFReF2kBUONZz2D2d3rD
    DlWbAePSHdM2z3TvA>
X-ME-Received: <xmr:A-liZhyuKUL1y2X4-7A-OZUgATVGPiybb4u6iWsKKDxZ9DAGPoxRd8GoSvsEseBZ6ZgrKf5jDsY9Jr_bldqpI37uDNZOoJ9owCzTQOn7Ef0hXOIE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtuddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:A-liZhO236x-wkt8grRabTgD9bwpDMmqrXtVB-4zZ1h-X9iq0GGAZQ>
    <xmx:A-liZm9cnSjQk7B8MGlarX_GLVwkr-HhMpRTh9cQaRC4vip-EIxxWw>
    <xmx:A-liZpWxRqVF2FbsB5YcoBJGGlCjVQHPM3biMwRf0HnCLEOws9KHPQ>
    <xmx:A-liZvcLn0D1jgVoQ5ZuaMbbO234M0ApoeVSIUtL1ciaPCjkW0A5Dw>
    <xmx:A-liZi_uSYobdehXFmGgPJHRquesJJSHdPDGBY9TOlvVrqDJfQvR7c75>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jun 2024 07:03:24 -0400 (EDT)
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
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH RFC 4/8] drm/sun4i: de2/de3: call csc setup also for UI layer
Date: Fri,  7 Jun 2024 23:00:00 +1200
Message-ID: <20240607110227.49848-5-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240607110227.49848-1-ryan@testtoast.com>
References: <20240607110227.49848-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@siol.net>

Currently, only VI layer calls CSC setup function. This comes from DE2
limitation, which doesn't have CSC unit for UI layers. However, DE3 has
separate CSC units for each layer. This allows display pipeline to make
output signal in different color spaces. To support both use cases, add
a call to CSC setup function also in UI layer code. For DE2, this will
be a no-op, but it will allow DE3 to output signal in multiple formats.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Co-developed-by: Ryan Walklin <ryan@testtoast.com>
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


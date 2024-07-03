Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C2B19D097;
	Wed,  3 Jul 2024 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004142; cv=none; b=dNbZbu7driBMldHO32Jqj+O5lj+6hAD/UpW7A+s8KoItAqHuW+M2c05eFm6Q1B7jJ2ffswWSFhjRcmVLIpNbT7DaOu2zhbbnxDbPunh8LGM5SMzcWAemMid1p6AoH4AyXoB7DgcE2lVw+dQDggyTy6sV2x8agp/gow5L8LYT+So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004142; c=relaxed/simple;
	bh=8YVfwSNlzB/6d5RaR+RT5eC2BqDILP0+FvJzvg4U7/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WA0Pbd9rJPVPxyqfVdgOq4pMuYGs+u+1NoSKOlVCChKrm3JYDs6m9Foey6zkJE8Fy4btuRy/RAmQuRdG3W7AaCdpRZFl+NCeoWaoQDGeOAz6iOdUFrGiwQxNlTShg6N2VKJUQgg7a5jDOhW9IsRJCHtqHFC8WzKLKH+jTAGBU/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=SNNuVyHI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ieGewEPE; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="SNNuVyHI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ieGewEPE"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id F2CCF1380622;
	Wed,  3 Jul 2024 06:55:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 03 Jul 2024 06:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1720004139; x=
	1720090539; bh=nWXLocCMt7EGKg67iVS/7BHF4d4/LJP7o3vbPwq3pQs=; b=S
	NNuVyHIkwJlztuHp25YkoO7kCIZwGVpIsT16IajHSb79tv8Xs8HCkFbwgIcFyXIQ
	mbf2Fmyh3+d1TN+j/4YF6JV6yYY6JV03XXLp0VpESKf/l+FJJzzsVpTazr+cu7J4
	TTQ+Yr/VNh97IqhJuZGQlJcUqCT1MnKNPQLXMJFEr3C/tLmBH+kMZZ/ZP23OzaiF
	eILocTJ1UTYJ17dUAi7em8/VOFLyqgltYnxpT/pfRwi0XZyEQPjwFvBJR3UulmNw
	PTIvs41JPKgwNgHak1rfyZb9uH8gKkWfLY3+mj78FWHDiP4fQhKTwezId9/jIcYT
	sfMhFvvfZ9/uXE4jgG5Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004139; x=
	1720090539; bh=nWXLocCMt7EGKg67iVS/7BHF4d4/LJP7o3vbPwq3pQs=; b=i
	eGewEPEL2F7EqFXAMmKQvRZp8KcpFppaYixLCJ0YUfNike1Ztc+38IXJUzkZ1NGl
	76PVRVxNo60AwbU9ewMJItaHR5UTwdWLb2jAxOReMjozpeNnRuSpRIivs8wnCHxj
	ZzMKCGC0wX7T/QSQop8Dwfed4SZnC5A8Sgj24IrFjAw4AVOwt/NGvD/oWTrHTAeF
	0Y8B5N2eyq121p4h+sRHHxae6g5w2RxfDaGumiNgq5/bePLnHhfBa+yQIMQAAieU
	Ouimgo4Us4fZNhNq9VK6gxh0kM7utWYcl0x+amqVLNWAucpVxKX7gk/yIQn+f1gm
	sLnQvqKcyjGK7DLPw3RRQ==
X-ME-Sender: <xms:Ky6FZpIFU8WtAKzP9fW9PrZy09RwhyMulZIhsGnW_Uap7wy9PUdbjQ>
    <xme:Ky6FZlKn6KEfXDCylZBGDsb1EownPLe7kW_qYt3jXCuZ5W3SHVLrvWE2nsSVeeSAM
    w30jItdRVEYI3mQhg>
X-ME-Received: <xmr:Ky6FZhtCW0lfJQDLwgRfra-Pvt8naVkvVXb2d6glajiJrUt-QtGt4wu-0hYQYlsb_S-RWv5vuXb_Fcu1jPexB0XX93NuU8LdfUdk3mHVnsEGD4bD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
    hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
    htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
    heetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprh
    ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:Ky6FZqbTBtmdjkL5j5khZeTqq_YB4Pgrsrfd3DdCEt0Kwq7FbBwuog>
    <xmx:Ky6FZgYGW9dsK_RbuYo3p9ducCzg1jZ0udiiYaN5bNef6KNJpUBJ7A>
    <xmx:Ky6FZuCQmbuJnc6Ae7wTjqsVVtpUHoGCsEt9xiR1Mq_DDBV05jE-UQ>
    <xmx:Ky6FZuaAqRlikY_Li5vKtMyp-Jhu-44vNazo2pNJLg-F54alzcZQLg>
    <xmx:Ky6FZtJQZNOsOwUNBlc9gIdvJox0rznctzXRGsVPcVlCjawDKlVrNnEk>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:55:34 -0400 (EDT)
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
Subject: [PATCH v2 04/23] drm: sun4i: de2: Initialize layer fields earlier
Date: Wed,  3 Jul 2024 22:50:54 +1200
Message-ID: <20240703105454.41254-5-ryan@testtoast.com>
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

drm_universal_plane_init() can already call some callbacks, like
format_mod_supported, during initialization. Because of that, fields
should be initialized beforehand.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Co-developed-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 7 ++++---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 884abe3cf773a..91781b5bbbbce 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -365,6 +365,10 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->channel = channel;
+	layer->overlay = 0;
+
 	if (index == 0)
 		type = DRM_PLANE_TYPE_PRIMARY;
 
@@ -395,9 +399,6 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_ui_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->channel = channel;
-	layer->overlay = 0;
 
 	return layer;
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 6ee3790a2a812..329e8bf8cd20d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -549,6 +549,10 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->mixer = mixer;
+	layer->channel = index;
+	layer->overlay = 0;
+
 	if (mixer->cfg->is_de3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
@@ -607,9 +611,6 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(&layer->plane, &sun8i_vi_layer_helper_funcs);
-	layer->mixer = mixer;
-	layer->channel = index;
-	layer->overlay = 0;
 
 	return layer;
 }
-- 
2.45.2


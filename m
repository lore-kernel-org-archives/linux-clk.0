Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6800111187;
	Sat, 17 Aug 2024 23:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723935962; cv=none; b=ehcxO7axIYTUbkd8dVHdE0/ELrLG21CS/c5tGNMz2TvYBNBKlKkaqTVkNfmbqpvAuiYtPXJs4+IfScYBoQt35PlofmQZWUmxy0sFgbUxqnqPDdwrFWmpKdhB/Ac3U2PZHONmK0LQacPUjtDa14FSclAKQz0ss+1KwDAlwfc+SN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723935962; c=relaxed/simple;
	bh=4Zkcxo6I86SKq+sDO2Pr/Rr9RrocXiOduFoDWR2kOMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cq1WxbuKRCZ5+jhSxJCsI1FNz2CVRIw/CSyuAMziTD9UnFo23/T+IGCj0r00rk6LGWYSAPZMUK5pNOqHnKL0B1QE4e4jskKs+1Qau9FbOiTpyguOFdzCs6CTbdmGPQmpm60m4SdsF7/8AWK3045AMXtHmWAmrdHpCYLLyH0geTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=Xmrx5lwj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GGcDXo7C; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="Xmrx5lwj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GGcDXo7C"
Received: from phl-compute-07.internal (phl-compute-07.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id BF6A7114E9C6;
	Sat, 17 Aug 2024 19:05:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sat, 17 Aug 2024 19:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1723935959; x=
	1724022359; bh=gQbG8XsyPYN9R3vIpt7laC+h4pquRJs9ISkyxjxS1Xk=; b=X
	mrx5lwjPfNpcwS6rJJZX+VFmFGZeu0LvCzAhSdyjt9CJWYjPUwgGg3OOUzepW+nA
	iSwop5nO8J7QVOkaLxmJISxariLk4kbEJRca1/GC2YTabOQZOQ7lJvFxXgkMSDDa
	7twuGUAWrzImHAb/pxlCstTKyFVEuH3JmQZCUSxwhvuuKQNGA2V7uMtttbfBKCXL
	OiTMHl8KxWddp3Z+asZ8EO2ANkm56ufH8i7OT9+1bK1bfUVzXwRsHXR0QlllMCyO
	P8u73vmlw23nGl5ybAGZAF5EpuewS4MyVkNr6HaWs+5rcMzAmh2kaCJj46CS0rza
	5x89dImx2P7E8fgI4nTEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723935959; x=
	1724022359; bh=gQbG8XsyPYN9R3vIpt7laC+h4pquRJs9ISkyxjxS1Xk=; b=G
	GcDXo7CBJOYgIjU8zvBX9xp91OWrL/ZIgSui9s9gS5xvmqGM4Mo0IpMPf+/TKPFn
	KAGkepQk00exed9tvx2lTctn7Pis7mHgr8Z7zxm2oTCZKhx6GzVlg/3zjnKJannW
	QzohlgZs6ScUYD/jw0oa+oRVY9zzSu73SEinsoT4Eww5/sI/iekOYbiaYoevvMzP
	uL5ozvQJp2z8uv2Qb57j/H4Q5+5yDEzNn/ldH9oZOidoX0mun6O0UTgMOhMy1WoR
	zmr2mUYmfqR9vJql+sm0pjV7Np8zmcz0hbHqsPMCggw3oU7CmZquY7OhYR9rIfwS
	URz86zhK+8/t7pIAVYsNw==
X-ME-Sender: <xms:1yzBZmkmwcrBZiWjN0LMLZtr1dG3Oejqp5sppgpy56S2PZEjs_TJsw>
    <xme:1yzBZt3MgZs2DQ23slEF9EKJXI5IuQrRJlP63_TtKouIIEPf4r9oT_wofaveB92VU
    poqwuXGtHQkXSsOAQ>
X-ME-Received: <xmr:1yzBZkogb00POhRAYRubo7ZNxTWHPV9zxjFgliom5EjoxYy6m8Tzd6QBK0X-dWxAQSGK06ISHd_bQAWj3zKu-PCsQUgXRhzFOeDHoR__QUgYyAXf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudduuddgudekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:1yzBZqmnbgTNSQhU3GFON8o3LJYIHJHAjJ6ayiI4tG0_pF-JY3fQmw>
    <xmx:1yzBZk39zqdgdTGmZjUKvNy8yZH18nNiIhf8FxH97ZJ-kDWi6smlgg>
    <xmx:1yzBZhuklzTlcL9-woIeMmXLWj2PdCDQwSaDYzUb6rROKdeCiD0rCw>
    <xmx:1yzBZgWzgscfRKob2S8lvgsjSwOS6HvJKcLrrCijFx39hfzxuYyCCA>
    <xmx:1yzBZimpfjfX7BW0ZChFErskb4S1VN8BP9eiFarRaKtiKBYm99wPZiLZ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Aug 2024 19:05:52 -0400 (EDT)
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
Subject: [PATCH v3 03/26] drm: sun4i: de2/de3: call csc setup also for UI layer
Date: Sun, 18 Aug 2024 10:45:50 +1200
Message-ID: <20240817230503.158889-4-ryan@testtoast.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817230503.158889-1-ryan@testtoast.com>
References: <20240817230503.158889-1-ryan@testtoast.com>
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
2.46.0


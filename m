Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700E3194083;
	Wed,  3 Jul 2024 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004261; cv=none; b=fpTmNNCqAMYI5s2g471jMTF/WVNpPhgU9ZzFpSRTPvq3lYNMGAVoUkggHQBEis/fgGUXBlhVVRShBsq5EQxZrZY4O9vBsK7u97I8JFn2SVqiT/QETitRGs3sDjpOiaVK1HjwxDp/dCD0tdkhym8vQoC8VSe01RQZMy4rFBYHrdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004261; c=relaxed/simple;
	bh=6YFtYoYSnHJuAOHlWCH6SB6++OxwuIqRQRXJu2woyvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAOnTHEX+8LPF3nNN6/Pb1ZJS2NT+aDxCp991Y4Hy1OIqwtDBXS8pqInkoM6GS7p6665xUyqF/BYiV7f8JEr1J7ev2OWsExecEdi1nM+/6+4GSuthl0FWJu8zCUeYeh8iqWZELS5c/rMai9XDD3cv/D7REgT64lKgqlUQh/oNUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=brIQeKnv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uQrks9X7; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="brIQeKnv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uQrks9X7"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id C5C4813805FA;
	Wed,  3 Jul 2024 06:57:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 03 Jul 2024 06:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1720004258; x=
	1720090658; bh=dh4jgHU7dqTQKxlK6pguYFC4g/IfdITeRgccK+k+z4w=; b=b
	rIQeKnvni8DerlYTxW4jyui+epUYXIcJPPed2TjDJiwTjc9kgyI9AatnCAyXPRsd
	kJAtxQkzvfJFVmoASuwDSTVdM0Tok/qCSoVFAsfny0ShnFRdQHTd1VqUyXMbAUK9
	6Er9M9A+59RXVhXGoZGKNJ2JPWzUUNVh7IPPg/AP0LF0vqoUziMt5o/8aMAW91La
	b6E9RxtTC2G+Y2fWB3wbpANnautngPqa5t2DPZE46lvS17v6A3zMScCN6A5ZLYRr
	eeRD0DlOVP2LuMHeXzs6DUeyeoNHnOJF4Eszuph7988ZnkhzidS4MSWyaMTtVXL0
	OHojyHDOgf82BII25hbVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004258; x=
	1720090658; bh=dh4jgHU7dqTQKxlK6pguYFC4g/IfdITeRgccK+k+z4w=; b=u
	Qrks9X7M6WVJ+sZn//jqJ/H4GFPThEt539pb4//yTiMBL1MyZCiRrf9QbmjGHcdc
	l7PIh/CKr74hPRh4dBx3FHhxWqlEljdADJNn+9Jtc810K+0otx/HnMmcsgyGiH1z
	lecihxSFmxXc48OEHFj6Ag0pNW0P7krt63jqURlGHl9mvu65j8kgdm6rCPA7cNaX
	AeLrV+8iHf/HkJpfJH1diCNvdTWhcH8maFIXYpL+A7xtVNelwqosNngtv9Rx8Fl7
	D5Suo8lSh6MUX/bcoEJP+qeXMLPAlingyvKWRPda2SQshn/buXd1np0FVQqn8w1w
	nSuR5GhABuBg5AwQagMZA==
X-ME-Sender: <xms:oi6FZt7Af9472MQDofuUxHyPjTR2L7_C8cW0JzHg8PEW3QbyPGrplQ>
    <xme:oi6FZq6uShyBaqUjVPk33u78g-pgZnAzB8Ll9y8i_mbvqdP_TV_yGQ0Wxj0bU_kgO
    Hh3pb9v8Y_GLW0CtA>
X-ME-Received: <xmr:oi6FZkcMhQgrWKdaM6LxVZPVUYDThD3b7VjYWX5suOBYqUj4rDWBAGFpiDB_4MegzKPUoTAoKqAPplB3DdMfPVuInmwPjIOG3Xd_XCAJJEvW-w6H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
    hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
    htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
    heetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprh
    ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:oi6FZmJwBVICf6pp00IglTauZ2BOAnUTBsKBPTy-Xm9NP8Vl-r-FXQ>
    <xmx:oi6FZhKq5KHUEC3NlEM_5V5dqq4LBVIUZ_p_u7s84VoLw8v5i1-Ifg>
    <xmx:oi6FZvwxp0ROgKnEAk6g1pf8Hi3-p5yF4GLNkx04Vrcd3FoVhHjCAg>
    <xmx:oi6FZtJBBoGd_lE0mlIDxpD9axZs1yrtE09fmicl_fBmcHoipFbA8g>
    <xmx:oi6FZh6i7F42k3NlrXT-wgOWnUIzRYLdzZPZCdzWMQYAjSX7dBrlZBT->
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:57:32 -0400 (EDT)
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
Subject: [PATCH v2 23/23] drm: sun4i: de33: csc: add Display Engine 3.3 (DE33) support
Date: Wed,  3 Jul 2024 22:51:13 +1200
Message-ID: <20240703105454.41254-24-ryan@testtoast.com>
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

Like earlier DE versions, the DE33 has a CSC (Color Space Correction)
module. which provides color space conversion between BT2020/BT709, and
dynamic range conversion between SDR/ST2084/HLG.

Add support for the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 96 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h |  3 +
 2 files changed, 99 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 2d5a2cf7cba24..45bd1ca06400e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -238,6 +238,14 @@ static const u32 yuv2yuv_de3[2][3][3][12] = {
 	},
 };
 
+static u32 sun8i_csc_base(struct sun8i_mixer *mixer, int layer)
+{
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return sun8i_channel_base(mixer, layer) - 0x800;
+	else
+		return ccsc_base[mixer->cfg->ccsc][layer];
+}
+
 static void sun8i_csc_setup(struct regmap *map, u32 base,
 			    enum format_type fmt_type,
 			    enum drm_color_encoding encoding,
@@ -358,6 +366,90 @@ static void sun8i_de3_ccsc_setup(struct sunxi_engine *engine, int layer,
 			   mask, val);
 }
 
+/* extract constant from high word and invert sign if necessary */
+static u32 sun8i_de33_ccsc_get_constant(u32 value)
+{
+	value >>= 16;
+
+	if (value & BIT(15))
+		return 0x400 - (value & 0x3ff);
+
+	return value;
+}
+
+static void sun8i_de33_convert_table(const u32 *src, u32 *dst)
+{
+	dst[0] = sun8i_de33_ccsc_get_constant(src[3]);
+	dst[1] = sun8i_de33_ccsc_get_constant(src[7]);
+	dst[2] = sun8i_de33_ccsc_get_constant(src[11]);
+	memcpy(&dst[3], src, sizeof(u32) * 12);
+	dst[6] &= 0xffff;
+	dst[10] &= 0xffff;
+	dst[14] &= 0xffff;
+}
+
+static void sun8i_de33_ccsc_setup(struct sun8i_mixer *mixer, int layer,
+				  enum format_type fmt_type,
+				  enum drm_color_encoding encoding,
+				  enum drm_color_range range)
+{
+	u32 addr, val = 0, base, csc[15];
+	struct sunxi_engine *engine;
+	struct regmap *map;
+	const u32 *table;
+	int i;
+
+	table = yuv2rgb_de3[range][encoding];
+	base = sun8i_csc_base(mixer, layer);
+	engine = &mixer->engine;
+	map = engine->regs;
+
+	switch (fmt_type) {
+	case FORMAT_TYPE_RGB:
+		if (engine->format == MEDIA_BUS_FMT_RGB888_1X24)
+			break;
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(rgb2yuv_de3[engine->encoding], csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case FORMAT_TYPE_YUV:
+		table = sun8i_csc_get_de3_yuv_table(encoding, range,
+						    engine->format,
+						    engine->encoding);
+		if (!table)
+			break;
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case FORMAT_TYPE_YVU:
+		table = sun8i_csc_get_de3_yuv_table(encoding, range,
+						    engine->format,
+						    engine->encoding);
+		if (!table)
+			table = yuv2yuv_de3[range][encoding][encoding];
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		for (i = 0; i < 15; i++) {
+			addr = SUN50I_CSC_COEFF(base, i);
+			if (i > 3) {
+				if (((i - 3) & 3) == 1)
+					addr = SUN50I_CSC_COEFF(base, i + 1);
+				else if (((i - 3) & 3) == 2)
+					addr = SUN50I_CSC_COEFF(base, i - 1);
+			}
+			regmap_write(map, addr, csc[i]);
+		}
+		break;
+	default:
+		val = 0;
+		DRM_WARN("Wrong CSC mode specified.\n");
+		return;
+	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
+}
+
 void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 			enum format_type fmt_type,
 			enum drm_color_encoding encoding,
@@ -369,6 +461,10 @@ void sun8i_csc_set_ccsc(struct sun8i_mixer *mixer, int layer,
 		sun8i_de3_ccsc_setup(&mixer->engine, layer,
 				     fmt_type, encoding, range);
 		return;
+	} else if (mixer->cfg->de_type == sun8i_mixer_de33) {
+		sun8i_de33_ccsc_setup(mixer, layer, fmt_type,
+				      encoding, range);
+		return;
 	}
 
 	if (layer < mixer->cfg->vi_num) {
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index b7546e06e315c..2b762cb79f02c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -20,6 +20,9 @@ struct sun8i_mixer;
 #define SUN8I_CSC_CTRL(base)		((base) + 0x0)
 #define SUN8I_CSC_COEFF(base, i)	((base) + 0x10 + 4 * (i))
 
+#define SUN50I_CSC_COEFF(base, i)	((base) + 0x04 + 4 * (i))
+#define SUN50I_CSC_ALPHA(base)		((base) + 0x40)
+
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
 enum format_type {
-- 
2.45.2


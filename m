Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723087;
	b=MYkrDUA7BIof5BkU4xz/s2+SMepZpHaABOlOdRKkCKMNSnYEJRXD/HUby4oS+bzPzbOq
	 E4/XMgWfAi5MzZrn3CpWylP4bp1VG8mDONZ5USF1PDcNokfInFIJZmKel91m6fl2AyjaI
	 QyFcZ5xpfRzD1b0qfI41amuK0VZ9h72iFjRleQTM6eKOAgsQbFBGJOlrGuuD5VBvRUhza
	 zzG7zxRdZGlO4SvPJU9Cfha45QrE+DiyR/MbyZfHq3nZXQyUQngPm3C15wCjaedd9mkmA
	 lFRPGejdfErUO/WBdVA71nV/WNLEJVMUJP6a7IGNhaaWa80mOqztBIPed69v9ndAe2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TCHhOy28B+0gI7cRQUKEe32H0lL50i1G3WDk1ReHlIc=;
	b=Fo6FgKj7t4uugyUfT/Z4EmkZjJvwg6M1IJsr9I+3iigx9uXFhu5/5bhY24WdWaGfaxDq
	 NSnHRrF/NRe3EuTNpfE7ANmj7vdFxDZ9WfseFN/NL43v0Gwx3u3sRDiAJqumydP02ydhw
	 Pzw8UYYjD+T1gdP5xt7czilc6XVhlLOcmKSJYmNvBjoMQACmHbMSpLyWxnD5T7fbMLwXw
	 ZpeOpEAwadSl5JVHBq84qrRSLFDEeI9zlaprAsamw1xyCssjzx0nNvriOEO839Yj6o63v
	 w3VjgchqzyhfRaoU3DvJqU7Skjzxn31WZBeu3G0R7qp9VoAQfne/OwUiRkVI8PvfLMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppKaYaec;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF1D606A8A5
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 06:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF1D606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppKaYaec
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so14558055e9.2
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 22:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723085; x=1795327885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TCHhOy28B+0gI7cRQUKEe32H0lL50i1G3WDk1ReHlIc=;
        b=ppKaYaecUnUwNfedyST7zZsf86RJaPMvRVSELxnTMyR/I1MLubReMWsGZV0dUyKBXp
         kCo6CvtAr/ZYIlvGUTLv/9O2tDE7dc8LUEOE6UxOZ7hDKwBEyOJYRKd/9VQPVmbDgUDg
         cfVtckQBo5p9nsk/mQfbbx+3SsAqQmfARoTS9U047vJFuC8w18uFgjqw0tvmtFL65SYw
         HdeNy4cVbP3ol1AUIMkAGA8B5m29xKuleqLfNBQKbA6WGICAAeVYMqL8Ta6JFPSxe5jK
         eScBMCV3knABDT7mHr9MUAwLz+S8iqAG00xzGpjVixp/v8OdYJntV68IWDKaBSMnAbFW
         GjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723085; x=1795327885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TCHhOy28B+0gI7cRQUKEe32H0lL50i1G3WDk1ReHlIc=;
        b=xuB5D0Z7f5x8XaBx3Coy+chOshVJgDgZcsfrgaGTa9wafP9IDzDVxsg0Fit88XKpSa
         n3D238d+Zmdt91RHm2p50oSdKqD2bJF4K+aGx3F0ffWIW6etyfVa2+6NRrlslaJfBDFF
         HS1lg0Oi3Zkg2qzBrlMpevYHb2l5rX5VEiAkZ7rPFf65jzYsniScMSSTO7NjfTL6dmYB
         35EgSkzcXhYLIIPuXVY1GDzU+GhBZFWu8O5mvEgZEK7MOAPri5IhMRJ5KTPnPaOG9Zct
         nOAv4FnthLDe8gFED4dWQmB9ddYWFh0w06SMCxGYpMD2mJD8vq+aOnmFB64lKySkODbD
         kntQ==
X-Forwarded-Encrypted: i=1; AL+hErFhPV99heBBx+jLo/9RhRyAtjLxXUHj6d1KXtYjbsaomFxBYKVMfxkEFjN4AvBnsRuDIDV9mxDJce8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PnuLOo5Z2IXzmpsST/1CYu1Guc2LUD8uo0FUeCr7vHXSyCl7M
	lJzL9kkK0uvFqoO2ZWD86YV5J3/DRb1qQnBSEgqL9IQINeHW7cNZWSiP
X-Gm-Gg: AYBFou2yLAzYToaAl2+C+dReSRoQXUyp6c1Q5jzXNQLckYviqcL7hl4CRxeo/sTqdTu
	Oa5Pno8zCLOno6C0suZw/mdE4Em7DABh97P9XFBhd2JxHfvkCGXmN0fIsyTDoYxUg2azRDB1Y6r
	Rfv3QiycIrUMynGN0gbYYVBF1cgAwyjnTSmgTYNSoO1WP4UYiUMoUbL1VxJDu5DR9rziX0dXzVg
	4kiA12Ct2zRGa8PuT61BqJKdDcgHL2z23Xfur61XepnSGFvAdFk3DWEUXaYLMPUDyEPg5o9YaJo
	RemQlnkohMZopz38Rc/eZtrgQ5Jd7ZQAq4e1GzZObx1Sf6eaTxe3AlDLyxOK1bifICNFRAwNnjS
	Yatm1Ca9vNMOERAH7ktbpCkksWr0pJcYCwufuZC0WEItw2fKUl12pwrphOHyXqDjLhOiocZ7a+j
	Cs9nOhX31duM28mdNh4kSBpe6CrHLis2qzWYPF1WSAT7T9xJNaFJYVNjIgot36DoRcBcNeQLN+Z
	a71o1xdn5Cc/GPsw7J70H8PP9ogrM8+4tXXmm1HDji9VbpHvzqY20suG3E3p/p5gkY8vM5rDsl2
	ksCkoBTFyzTENfAsnyKE6IzPCfPZllp4cRX3qJcpBnHDeCDBjtkV6lVCZhH4ULaZcH/FmlZXofG
	6gGVPHGM8ux05e80wVixWSGNAQXuWegRkew3UAP1awqUuyyf4emDpBaqNnZYYu+SgMy0pmAteLM
	bgpUpx8kbQHMAhQHLa9E5e7ivphDjaK5qpVV6+wK5QL60JuH6wJ2tOs1xFPxK2PN4srMEW5y3mt
	D6b9DyHGmVB3A==
X-Received: by 2002:a05:600c:3b98:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb55a8c128mr151718065e9.25.1794723084885;
        Sat, 14 Nov 2026 22:11:24 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:24 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 3/8] drm/sun4i: Add support for DE33 CSC
Date: Sun, 15 Nov 2026 07:10:57 +0100
Message-ID: <20261115061102.229680-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DE33 has channel CSC units (for each plane separately) so pipeline can
be configured to output in desired colorspace.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 71 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h |  5 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index ce81c12f511d..70fc9b017d17 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -205,6 +205,72 @@ static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
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
+static void sun8i_de33_ccsc_setup(struct regmap *map, int layer,
+				  enum sun8i_csc_mode mode,
+				  enum drm_color_encoding encoding,
+				  enum drm_color_range range)
+{
+	u32 addr, val, base, csc[15];
+	const u32 *table;
+	int i;
+
+	table = yuv2rgb_de3[range][encoding];
+	base = DE33_CCSC_BASE + layer * DE33_CH_SIZE;
+
+	switch (mode) {
+	case SUN8I_CSC_MODE_OFF:
+		val = 0;
+		break;
+	case SUN8I_CSC_MODE_YUV2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case SUN8I_CSC_MODE_YVU2RGB:
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
 static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
 {
 	const struct drm_format_info *format;
@@ -238,6 +304,11 @@ void sun8i_csc_config(struct sun8i_layer *layer,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
+	} else if (layer->cfg->de_type == SUN8I_MIXER_DE33) {
+		sun8i_de33_ccsc_setup(layer->regs, layer->channel,
+				      mode, state->color_encoding,
+				      state->color_range);
+		return;
 	}
 
 	base = ccsc_base[layer->cfg->ccsc][layer->channel];
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 2a4b79599610..d2ba5f8611aa 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -18,9 +18,14 @@ struct sun8i_layer;
 #define CCSC10_OFFSET 0xA0000
 #define CCSC11_OFFSET 0xF0000
 
+#define DE33_CCSC_BASE 0x800
+
 #define SUN8I_CSC_CTRL(base)		((base) + 0x0)
 #define SUN8I_CSC_COEFF(base, i)	((base) + 0x10 + 4 * (i))
 
+#define SUN50I_CSC_COEFF(base, i)	((base) + 0x04 + 4 * (i))
+#define SUN50I_CSC_ALPHA(base)		((base) + 0x40)
+
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
 void sun8i_csc_config(struct sun8i_layer *layer,
-- 
2.43.0


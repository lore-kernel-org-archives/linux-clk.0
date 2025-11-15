Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31362FD1B7
	for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763216057; cv=none; b=NvxZQ8u3tMaWVRnwMVm1JNbi8buujqKG02PTDk5sZUbKEuwqbTIn8JO4MZ0sC0mxC2WI8wBBgCU4W8ttYaC23RlqUOlr5cBgLKzpZBpe2CI0fx8SMsV5MnAT+DbCmstxdQAUQZ37zmhouRp0W31+8Hvd6Mr01sjGbv/KYb5fwkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763216057; c=relaxed/simple;
	bh=aG0vNN2zVi7p1GToVdpDOjQmhx7Tshg7Tk0b4TzISHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/Y3+fFVugAg5RtbquW13Jb1VtwKqWVdgdhx6krg7urCNF6lEuwrPud9nQpTBnWYW71x6QhQKnHUwB1Fb4FRiX+LPwTvMYLlMARYrp0YpbKmtW6r+sFXdDMS+PdKh//6cTBBwahuc2w8m15EwM9NVV4lnrE4qhi3LRAhxnSCBuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4vg6YTo; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4vg6YTo"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64149f78c0dso4543521a12.3
        for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 06:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216054; x=1763820854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MocqCxWcaLZfsHWYqTZWM/wBzmMvMPkWJzIzBgPappQ=;
        b=Y4vg6YTob9b24D9POBdIUlohajimMBtbCB3j77g9JPri2BPFxE/jPxPc0NSk4Eq/VK
         /hit9RBAEeiC1mZX/2rFdLG95rt4p2e8VFG68Y46x25R1Q6p1M4oEeHh3/YfH/n0mqa8
         vgZw0EDb9VSIkdyl4cRcH6tAi5NAPuEfug00LdgmeT5ZJqWn7bSG606oo7qp/6xWxU1s
         8NpreEIkVMG7H3y3xcpKXYjYK0m1pWh1SUNDiU3oNry5rOItsaIvHmbN2EhJ4cMNOZrn
         c1nU8Bix7zxJKjqeh1k6ag4KqzksqtLmWMza7Z6GdHazHN3SnKhTG7bE+1rJHxDXZb47
         H5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216054; x=1763820854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MocqCxWcaLZfsHWYqTZWM/wBzmMvMPkWJzIzBgPappQ=;
        b=D3WoMr/+yr1bO8YIG5r1n0Dn3NPZreQ2LnYt4/hl13yIedkgkX9og83ZNhEUk4kwZO
         3NQyvwH5urjl+tHQFPwT7+p1mSLIYS8750GZhcJye7CvqhYD0h7RlDLg08x5WYdUWHFw
         Clmh4zs8zD+dP2FnADsUhlncU8DuHxNOSNPtI0i6gkUBjQA3lIHhFXughnORPyUnMala
         4YZU1m49dmwXX2PAZB/x8WRCYpgCZz2sgTqjNC2gw6QapHnesgM34j5wekWTiCmwoSuy
         bTe4kSVCaww648tcNqBgLW+jysL4RpdmdiycYp/citM+eHUPwbJ/eR7U0EjXus4Z4U0r
         4HGA==
X-Forwarded-Encrypted: i=1; AJvYcCVLV+kkg87991il7uqGBV3i918Vh1FIMWEGHj3hUSDLd0WX+dxkQJ+YP1DbvzdQjUmVjgw3pFNKvDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEJU6PdWT/TVtoDTHK2IATbHPgCRWOIowuCugr+b214qYUJPi+
	NTVgCjzpgTCeqDr//TvDhegw5vrudiNDRH6SGo2qHp3EoH0u5DVzVDxk
X-Gm-Gg: ASbGncvzGTGMaaq4LN1SIhUI3ZLtE/4yGE6sg6m1RjAUah52yesOj58U90wiPlPKI0E
	HrBk6OIIrHnstMm7KHAOyYj31DpPnb2ddGok/3XEMG2pYvJPCChFDH/8xg05Znm6Bry56yICJ8p
	PtfSugx7AASStgbYq+bNwK5RHI8PuGObvwn2znpqFbBoyuqC8dZVXEhse/9AOXcLbmFOMtujOOV
	7NYNg5Bx2UH5vK+u4p07M/W4Z797atYshugZGeKNb8ZoWb2p3dyUQ1x9SeftBBcY4C/lPHTZXgx
	8TST5cW+BgF4LfGWN1QTV5dP00Q4RtPDoqmXbtjuH0ocBQ1XmHcCC1C5IkFbTk5o+DPfwK6ufCQ
	38APWNI1925GmRq2yyvu6xuUnNXjhMcr34PPMrSZgWpW1+yh1gRbAssTHX8cf1vPQpTL3BvvOpe
	r4kXtInh/yFe6j7YFbFkKu1TbGnlIpJDN78deV6WAXaifxgV4zgsJtxp6r
X-Google-Smtp-Source: AGHT+IFSj1aDwiro/wwK4L9h7pp1M9ctQw+POyBArF5AsNHZz7cGsgDc33Ii1wskS73N5JZnJxCpEQ==
X-Received: by 2002:a17:906:f145:b0:b73:6d56:f3ff with SMTP id a640c23a62f3a-b736d573ee7mr440406566b.20.1763216054020;
        Sat, 15 Nov 2025 06:14:14 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:13 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/7] drm/sun4i: Add support for DE33 CSC
Date: Sat, 15 Nov 2025 15:13:41 +0100
Message-ID: <20251115141347.13087-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DE33 has channel CSC units (for each plane separately) so pipeline can
be configured to output in desired colorspace.

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
2.51.2


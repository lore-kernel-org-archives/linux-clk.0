Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EF91AB904;
	Thu, 20 Jun 2024 11:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883188; cv=none; b=EOVuqDh/ZTZbR4KuSu3SjTjZMGKQv3UU+j969madzMQ+JYQVPrq/jwdw23aoIU1NlIdibotv3QZLlmpnNkIu+iXWKfiZ0Jupmr+m91QpXp3T19I6YdN6otJD9c/IHU1QoDqOa0SKQb33cAhdiggSR5v1kI6Pv/0F+wQSnFSe+0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883188; c=relaxed/simple;
	bh=TxMm5wJbAIuKNUugbruBAu9l4JIartkd1h2aGVR92KE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXQ+v+IFeAABdrWKZOfeJT8qpxsJxjUyvGhNqJRwRTlOhxpz6SyMMw4DTMgmAUfYTKx1WcurUXzeYmdub77eCuJRlM8J1gnJ56ecAZbGTO5vdW/9fGgIAE7FbxA9o7PFwOpmeP/p1lV8gl02R78O0YXKhaK94DQHjbVeMZwM44A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=VQXocc7j; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EGiGKW69; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="VQXocc7j";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EGiGKW69"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 9491D1380508;
	Thu, 20 Jun 2024 07:33:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 20 Jun 2024 07:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1718883185; x=
	1718969585; bh=HmURlZD4rHA7PEqp/DD3Lx9ItqvKVLBI2pdlF2h6TRk=; b=V
	QXocc7j85DpjIrmI1Tp0O6ZpHgfeTAv38gofts6Oda6Up0Aav4y6Hj5/gkZ3CuR/
	rQ4yZ9dxNCQaHnbybndz/AlzV9K5UsZP+Sd4rgj85utv3lPRICYlXDAjb/7B3w75
	xk/J0023B7ern3BerWqWrVpSSnY8+0fnRUFphFsmZKy21XWG1qpbFk/BvCE/ia+Z
	T2gzd9xgqSKcj9hi/zzP8qehuzg5ySVAViWNOY0CAaBsbMH5d7vr13oEFPS6j4KQ
	8sCEBYolG4Dq56SMRkZo81N0XC8vSa3dXf3sObMjGjEzOf1lQ+Gajlz9ZODmZIRf
	l+vA4eepBwMofRFluKOjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718883185; x=
	1718969585; bh=HmURlZD4rHA7PEqp/DD3Lx9ItqvKVLBI2pdlF2h6TRk=; b=E
	GiGKW69rRDkbW1noJVnJjzn/x14b1cuiSY2D1yr0yJdSxJOK1y7T6VSVHqG5tngv
	IdpwP4mt4WoHVVc4lEGM/6WOLoB1GurCEI3R27ZWWpVmzqaahqIIEoskZvD3ujqY
	zUfHo8JNbVwe/OssMzs2YyGXycoqNZ76hT5W8wLTYWcnMnIyqQz1mPntk9mrcFCi
	CxCjU4RBg05UDw/AODCXQpnR9A5+g5gcJeM2o8pHNQ1CYRfNvf3HwAVUcjdVW5oi
	XcOyaq25oVQNcAufw7Ry8ngk8ab427xRk2oRvIk+y1oCfJmJp69RnnEKcB1h+xDx
	D6Bjza9/kA8c1/xxTe1tw==
X-ME-Sender: <xms:cRN0ZtEA97lWuhyPdNDOJQ6zlWbly9gANR1uNuGoBlCaRovEOxi2Iw>
    <xme:cRN0ZiU7iV9yZ_3kJxsr78on-5M6a80ATq-d0Y1iJJ2osTnU3hYcHbRifeldpj8ar
    IZFVbZadKZvPnUWNA>
X-ME-Received: <xmr:cRN0ZvLEDYxtS4puKt1dsbOJi0jvsTCqQz5WzIW0zsUfI0mv4CIg44wZP3oejMIbs4PMWjnmJRmUFK2rGgwTDbD5q7FcDnkVabMskmuLUeqkBRwh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfihrghn
    ucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieelkeevueetffetteduffevgeei
    ieehteenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hrhigrnhesthgvshhtthhorghsthdrtghomh
X-ME-Proxy: <xmx:cRN0ZjGzybBBzDNk1K7oLAFv7V0cd-xuBfMpSNRDugLLy8lMPag0SA>
    <xmx:cRN0ZjUWT2gb2d6vPRLAZ1QherFd5nOPv94NzkiXngotUBVM62GJvg>
    <xmx:cRN0ZuOuYmfXjZXSpJ1OEaPqvmxmEcvtzcoGe7qZkkqTZsGBPLXCgQ>
    <xmx:cRN0Zi36BTTF52Kwgquq98KGfLq1Fu7AMOkexnTYOxCH7O32yhlreg>
    <xmx:cRN0ZpHX-Tg4tl_447ckKuNq6cbz3edILdUiyUNTHtLQW50KhKl7q-21>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jun 2024 07:33:00 -0400 (EDT)
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
Subject: [PATCH 10/23] drm: sun4i: de3: add YUV support to the color space correction module
Date: Thu, 20 Jun 2024 23:29:48 +1200
Message-ID: <20240620113150.83466-11-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620113150.83466-1-ryan@testtoast.com>
References: <20240620113150.83466-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Add coefficients and support for YUV formats to the display engine
colorspace and dynamic range correction submodule.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 164 +++++++++++++++++++++++++++++-
 1 file changed, 162 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 8a336ccb27d33..e12a81fa91083 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -5,6 +5,8 @@
 
 #include <drm/drm_print.h>
 
+#include <uapi/linux/media-bus-format.h>
+
 #include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 
@@ -107,6 +109,135 @@ static const u32 yuv2rgb_de3[2][3][12] = {
 	},
 };
 
+/* always convert to limited mode */
+static const u32 rgb2yuv_de3[3][12] = {
+	[DRM_COLOR_YCBCR_BT601] = {
+		0x0000837A, 0x0001021D, 0x00003221, 0x00000040,
+		0xFFFFB41C, 0xFFFF6B03, 0x0000E0E1, 0x00000200,
+		0x0000E0E1, 0xFFFF43B1, 0xFFFFDB6E, 0x00000200,
+	},
+	[DRM_COLOR_YCBCR_BT709] = {
+		0x00005D7C, 0x00013A7C, 0x00001FBF, 0x00000040,
+		0xFFFFCC78, 0xFFFF52A7, 0x0000E0E1, 0x00000200,
+		0x0000E0E1, 0xFFFF33BE, 0xFFFFEB61, 0x00000200,
+	},
+	[DRM_COLOR_YCBCR_BT2020] = {
+		0x00007384, 0x00012A21, 0x00001A13, 0x00000040,
+		0xFFFFC133, 0xFFFF5DEC, 0x0000E0E1, 0x00000200,
+		0x0000E0E1, 0xFFFF3135, 0xFFFFEDEA, 0x00000200,
+	},
+};
+
+/* always convert to limited mode */
+static const u32 yuv2yuv_de3[2][3][3][12] = {
+	[DRM_COLOR_YCBCR_LIMITED_RANGE] = {
+		[DRM_COLOR_YCBCR_BT601] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x00020000, 0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x00020000, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00020000, 0x00000000,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x00020000, 0xFFFFC4D7, 0xFFFF9589, 0xFFC00040,
+				0x00000000, 0x0002098B, 0x00003AAF, 0xFE000200,
+				0x00000000, 0x0000266D, 0x00020CF8, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x00020000, 0xFFFFBFCE, 0xFFFFC5FF, 0xFFC00040,
+				0x00000000, 0x00020521, 0x00001F89, 0xFE000200,
+				0x00000000, 0x00002C87, 0x00020F07, 0xFE000200,
+			},
+		},
+		[DRM_COLOR_YCBCR_BT709] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x00020000, 0x000032D9, 0x00006226, 0xFFC00040,
+				0x00000000, 0x0001FACE, 0xFFFFC759, 0xFE000200,
+				0x00000000, 0xFFFFDAE7, 0x0001F780, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x00020000, 0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x00020000, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00020000, 0x00000000,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x00020000, 0xFFFFF782, 0x00003036, 0xFFC00040,
+				0x00000000, 0x0001FD99, 0xFFFFE5CA, 0xFE000200,
+				0x00000000, 0x000005E4, 0x0002015A, 0xFE000200,
+			},
+		},
+		[DRM_COLOR_YCBCR_BT2020] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x00020000, 0x00003B03, 0x000034D2, 0xFFC00040,
+				0x00000000, 0x0001FD8C, 0xFFFFE183, 0xFE000200,
+				0x00000000, 0xFFFFD4F3, 0x0001F3FA, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x00020000, 0x00000916, 0xFFFFD061, 0xFFC00040,
+				0x00000000, 0x0002021C, 0x00001A40, 0xFE000200,
+				0x00000000, 0xFFFFFA19, 0x0001FE5A, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x00020000, 0x00000000, 0x00000000, 0x00000000,
+				0x00000000, 0x00020000, 0x00000000, 0x00000000,
+				0x00000000, 0x00000000, 0x00020000, 0x00000000,
+			},
+		},
+	},
+	[DRM_COLOR_YCBCR_FULL_RANGE] = {
+		[DRM_COLOR_YCBCR_BT601] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x0001B7B8, 0x00000000, 0x00000000, 0x00000040,
+				0x00000000, 0x0001C1C2, 0x00000000, 0xFE000200,
+				0x00000000, 0x00000000, 0x0001C1C2, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x0001B7B8, 0xFFFFCC08, 0xFFFFA27B, 0x00000040,
+				0x00000000, 0x0001CA24, 0x0000338D, 0xFE000200,
+				0x00000000, 0x000021C1, 0x0001CD26, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x0001B7B8, 0xFFFFC79C, 0xFFFFCD0C, 0x00000040,
+				0x00000000, 0x0001C643, 0x00001BB4, 0xFE000200,
+				0x00000000, 0x0000271D, 0x0001CEF5, 0xFE000200,
+			},
+		},
+		[DRM_COLOR_YCBCR_BT709] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x0001B7B8, 0x00002CAB, 0x00005638, 0x00000040,
+				0x00000000, 0x0001BD32, 0xFFFFCE3C, 0xFE000200,
+				0x00000000, 0xFFFFDF6A, 0x0001BA4A, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x0001B7B8, 0x00000000, 0x00000000, 0x00000040,
+				0x00000000, 0x0001C1C2, 0x00000000, 0xFE000200,
+				0x00000000, 0x00000000, 0x0001C1C2, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x0001B7B8, 0xFFFFF88A, 0x00002A5A, 0x00000040,
+				0x00000000, 0x0001BFA5, 0xFFFFE8FA, 0xFE000200,
+				0x00000000, 0x0000052D, 0x0001C2F1, 0xFE000200,
+			},
+		},
+		[DRM_COLOR_YCBCR_BT2020] = {
+			[DRM_COLOR_YCBCR_BT601] = {
+				0x0001B7B8, 0x000033D6, 0x00002E66, 0x00000040,
+				0x00000000, 0x0001BF9A, 0xFFFFE538, 0xFE000200,
+				0x00000000, 0xFFFFDA2F, 0x0001B732, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT709] = {
+				0x0001B7B8, 0x000007FB, 0xFFFFD62B, 0x00000040,
+				0x00000000, 0x0001C39D, 0x0000170F, 0xFE000200,
+				0x00000000, 0xFFFFFAD1, 0x0001C04F, 0xFE000200,
+			},
+			[DRM_COLOR_YCBCR_BT2020] = {
+				0x0001B7B8, 0x00000000, 0x00000000, 0x00000040,
+				0x00000000, 0x0001C1C2, 0x00000000, 0xFE000200,
+				0x00000000, 0x00000000, 0x0001C1C2, 0xFE000200,
+			},
+		},
+	},
+};
+
 static void sun8i_csc_setup(struct regmap *map, u32 base,
 			    enum format_type fmt_type,
 			    enum drm_color_encoding encoding,
@@ -148,12 +279,27 @@ static void sun8i_csc_setup(struct regmap *map, u32 base,
 	regmap_write(map, SUN8I_CSC_CTRL(base), val);
 }
 
+static const u32 *sun8i_csc_get_de3_yuv_table(enum drm_color_encoding in_enc,
+					      enum drm_color_range in_range,
+					      u32 out_format,
+					      enum drm_color_encoding out_enc)
+{
+	if (out_format == MEDIA_BUS_FMT_RGB888_1X24)
+		return yuv2rgb_de3[in_range][in_enc];
+
+	/* check for identity transformation */
+	if (in_range == DRM_COLOR_YCBCR_LIMITED_RANGE && out_enc == in_enc)
+		return NULL;
+
+	return yuv2yuv_de3[in_range][in_enc][out_enc];
+}
+
 static void sun8i_de3_ccsc_setup(struct sunxi_engine *engine, int layer,
 				 enum format_type fmt_type,
 				 enum drm_color_encoding encoding,
 				 enum drm_color_range range)
 {
-	u32 addr, val, mask;
+	u32 addr, val = 0, mask;
 	struct regmap *map;
 	const u32 *table;
 	int i;
@@ -164,14 +310,28 @@ static void sun8i_de3_ccsc_setup(struct sunxi_engine *engine, int layer,
 
 	switch (fmt_type) {
 	case FORMAT_TYPE_RGB:
-		val = 0;
+		if (engine->format == MEDIA_BUS_FMT_RGB888_1X24)
+			break;
+		val = mask;
+		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
+		regmap_bulk_write(map, addr, rgb2yuv_de3[engine->encoding], 12);
 		break;
 	case FORMAT_TYPE_YUV:
+		table = sun8i_csc_get_de3_yuv_table(encoding, range,
+						    engine->format,
+						    engine->encoding);
+		if (!table)
+			break;
 		val = mask;
 		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
 		regmap_bulk_write(map, addr, table, 12);
 		break;
 	case FORMAT_TYPE_YVU:
+		table = sun8i_csc_get_de3_yuv_table(encoding, range,
+						    engine->format,
+						    engine->encoding);
+		if (!table)
+			table = yuv2yuv_de3[range][encoding][encoding];
 		val = mask;
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
-- 
2.45.2


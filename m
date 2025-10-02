Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5E72522A7
	for <linux-clk@vger.kernel.org>; Thu,  2 Oct 2025 16:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759421865; cv=none; b=k+zZq78hiiALgqjz7ClczbVlJsIC+qXblMJqrfTvWuPBfhFNuLzh8SpbTeDMPYcVPDtHX9BIZFeFcQRKSBUvEy2HQCyZfzSyAlTHgDQqvHnyYh/rfnb7i0T+Kf7KbKNi4igMBKgCcv3MwhGxayt/zV45x47dGtYVTn+PwnE4DVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759421865; c=relaxed/simple;
	bh=AyS3u95uyqH/xDcmCFbZlmlbD4K3Ky/RpGp89Hwicg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXZ1QovN3Qy1PaW7ksJpBXj4FJGLceOJnpcXBnk7sTNeWb91wQ37KLSN4dxI0yQ7cgbKi50YlerBfUmf0hbK0gwGouilFk4NZNDai93KVkItsV/9oVOPxDsJzCS7oyoxTPEMG70+1/yBrX9ais5VqH38AQwzAxpgg7mlr4u+XWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4wLHIgO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4wLHIgO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e430494ccso7057205e9.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Oct 2025 09:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759421861; x=1760026661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDy+bcBz5SReUL1/hrWcatTUHafCDQsXpig3EVAl2cQ=;
        b=A4wLHIgOk17gfgMioo5/nuoJjbA48ZMS9gw9ZdImDSAXkNlNXsHxagAhaQ3BuctgJm
         FvHeVRFjTv4BCRCSgPg4GiPCUQzqdQi9UZS3D1nV8ljn08lIPKEuR4f0VdlXO8Ba8xB3
         UkDhGAkuxt0jeLjO5IPlodYENM+ZG9eBj55WpqJ/7Gx7XBpWxjgjoXtok6mlOOF5zMFM
         KCCMepK+ivm5ecRzcRKGShchWZGcRQUvMewXwq9cAXSYbbOcyJZm6wGlEQKbSKscNFb+
         atcrexBi1HVIEZur7kjYh5+IQhN0EQlsQn68QnhwnBDAoovk3/xkjVJG2+Ej4xFTDPkb
         Za3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759421861; x=1760026661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDy+bcBz5SReUL1/hrWcatTUHafCDQsXpig3EVAl2cQ=;
        b=rGKwJXYHnx3GI73aVHG2TSxM1u6Bp2OKECycp/drqKaiglcrhtudjaR1cJkMMahNhh
         exyMJy+jSbixPCksNFyBbqpgBclt1a1gWmKEuCov/3WSCCuH3+LZ1ot36psRVHMYwwXI
         2QEnEHGIhT1D+AsnbHOj5m/EU7+FIKy6dCMzc/Nh8RPBXnajpNhPI1izyrlyhzCWUl5A
         SPMOo+qdXeqXPvhQZtS9aw0+jjrlSFDfmyb04slYRtMNYyGm+EHw37qmrCEn81Nfx8NP
         mj3dZCmosdGsEf3CGQsxHJdZbIuyAlJ9oIQrX01CdveC0+Qyw/Fdys6xq3bGwozDAjyr
         esHg==
X-Forwarded-Encrypted: i=1; AJvYcCXbyNP3KWQ3O3j9vdF/lZ2N15P2DNbDwh37t6CVJjKh6CXeDH2uFUjeGN2e0eAQjqyTdjv6tZ/1uyw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk5eaIFE3EUah6LSeur9n8J2nXdgFc7L4sDMXU3eDQyGEVqiWV
	8RLjHhnNoplUl31C4m6eTFjFjCmMH1VQPo4Yv/kb88BV/5N2W47Vm5w3
X-Gm-Gg: ASbGncs6xlwxS4AjjIdwfCpQb2JjCJ9DXu/3uigjEF1nxTaUz7LvJ2Il+nPbv3nLbze
	Kdgxz3QZong0zYKMVGpHWakyXfegpQi4snBxUz8jxueIx6tZqojYiy3RmKAjAjOu4vsIFJS6iTc
	NQbv41K3bHcxjCj5WESKpZ75sIQhr9KXv6Ht79hU+51G6Td/ta4vfbkC6fyAR8dU+F2sraQPrDY
	kpeWGmemJZlQ8XbL1avvM1L48LJwE0ZnffJ4VNwiupbk7xpk6F7bivnuVIyjFhtHSYF2bjdcuI4
	w8cPyE5b0ZDgK1iNF5YEiUlJcLQVHwxhxFB5x5pVy3uhKdVPZXQlvl1obCpPJvDOeWYkVE6El1k
	QCQDvzZBhEk722xTvVA9bW7yCrz1rMji1vuKu+jI1lWXgZQncfBSD4UJUNds7p3F4fLJXch2yuV
	RX6+Ow
X-Google-Smtp-Source: AGHT+IHrq2Ok4208eIeZKRmn8dvl8f5AQ6yStLCnXfA+SOQTweqJ+ph9ADJMK5C1VCoebsbnYj9+Yw==
X-Received: by 2002:a05:600c:3149:b0:46e:3b81:c3f9 with SMTP id 5b1f17b1804b1-46e61269212mr68911085e9.17.1759421860723;
        Thu, 02 Oct 2025 09:17:40 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:607d:d8e6:591c:c858])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b5e4922sm58605515e9.1.2025.10.02.09.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 09:17:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 1/6] clk: renesas: rzv2h-cpg: Add instance field to struct pll
Date: Thu,  2 Oct 2025 17:17:23 +0100
Message-ID: <20251002161728.186024-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a two-bit "instance" member to struct pll and extend the PLL_PACK()
macro to accept an instance parameter.  Initialize all existing PLL
definitions with instance 0 to preserve legacy behavior. This change
enables support for SoCs with multiple PLL instances (for example,
RZ/G3E we have two PLL DSIs).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v8->v9:
- No changes.

v7->v8:
- Added reviewed-by tags from Geert and Biju

v6->v7:
- New patch
---
 drivers/clk/renesas/rzv2h-cpg.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 840eed25aeda..e2053049c299 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -16,20 +16,23 @@
  *
  * @offset: STBY register offset
  * @has_clkn: Flag to indicate if CLK1/2 are accessible or not
+ * @instance: PLL instance number
  */
 struct pll {
 	unsigned int offset:9;
 	unsigned int has_clkn:1;
+	unsigned int instance:2;
 };
 
-#define PLL_PACK(_offset, _has_clkn) \
+#define PLL_PACK(_offset, _has_clkn, _instance) \
 	((struct pll){ \
 		.offset = _offset, \
-		.has_clkn = _has_clkn \
+		.has_clkn = _has_clkn, \
+		.instance = _instance \
 	})
 
-#define PLLCA55		PLL_PACK(0x60, 1)
-#define PLLGPU		PLL_PACK(0x120, 1)
+#define PLLCA55		PLL_PACK(0x60, 1, 0)
+#define PLLGPU		PLL_PACK(0x120, 1, 0)
 
 /**
  * struct ddiv - Structure for dynamic switching divider
-- 
2.51.0


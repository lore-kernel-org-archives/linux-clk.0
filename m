Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBCC30F53F
	for <linux-clk@vger.kernel.org>; Wed, 15 Oct 2025 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556397; cv=none; b=Si68e+TPwHSyCPw6Fz3T8wdmQhnPlTiI5kXM2O1KL7d1MqBR/eiJoUiotQ/cSsNC9u3a8o/nWddbDXAK4rIcj3NxlRyL+RzRMO3T0A7wDeRlPAOSGJ2twGlvRWdcOWNrDnQz7C58Kk3d7b0BDZaE8olqA1Ksy8fIxrXWETXKECY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556397; c=relaxed/simple;
	bh=BdsJ2sEqN6rODDSWveW3Do2KQsZ9ykXTS6FV9Hcz5/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOky+XfYx1zizkrVMx0Zi646MfaI9KbSWJj7hhPuc9soIyL5fp5NHY/NIAagzvNzAiz5jp9x1fnRc2Z+LKV8o6S5v6g+hTEGFNn+z4TIjWh0zqmQwzrAhNowy3sFDhzr/tKqKosnGjJW5noAKE493aVR85T9TldFqxmNaifbpAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7b9BiaC; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7b9BiaC"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b551350adfaso5703013a12.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Oct 2025 12:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556395; x=1761161195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzeiqeSx2hP+uCSg6LMRTweWgMxjeUkFjtP3zeTP43k=;
        b=R7b9BiaCRAXucLHJvD8ePybVAtvtYJLNXS+XRzmBe6aGxnkdHATgjNq1KyecQ0OGvn
         3mGKXSpS5cMt12MSVBywXMwatbUXubKXWIBfPUY4VI7LPW7r3hscu4Nhkofq6SJ4scSi
         5tsewx/KiCxUS93W/6T8mUeeNQfK0eMKsXITU7tA+j/aYv6i5EwFbB13SwdJgrFMgRTp
         BgLdCy72Yz426AbXl7X/CvhwSsbV5m0GiPQl/qAaV8ybn7NBnZs9+0P7XuoneanW+Zmp
         6cNOYc2AYg7/W9pHu1KQ0MEmG9yHnXlMMoAnYVWIuR8+xDaI/AyoErmm4saTPRuj4VZi
         jfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556395; x=1761161195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzeiqeSx2hP+uCSg6LMRTweWgMxjeUkFjtP3zeTP43k=;
        b=CoLPxaIHmwbTUb3EqUxvVmmdpWTD+sy0KLKdGMtX571h/EWC/Og/6Vzs41xnI5J826
         e/p+MZ7pAH8oa74QpalNe7ZZtYBsQTnGkuP+SUgc6XiLasIv4Wz5gy+AMvre3qzo14to
         VWHYHkt0EZ6QpMpcmQXgU9f074dguxUBcP/M9W3GFd43fLROfgoU5HLMIYT6iXbbtWAG
         n1egjVnCe+BSZ0qCjksLKedfUufd820pw6Lv4O/qFgLrzQBk7cccHI+T3XYmP4I+EgdW
         njjW6dUBvuT6ZT+wmWV2KA+OBqJHuqCeGL2Y39+zwchL0XBQsI+yfdg6rOfQxLomFHIL
         yc4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTc5Bi0FnK9JsCcNWkF8H+lhLbAKeZ+oKFN440/TzxjG4W0V9Gg6p3Yt+m83moMR2it/05kUGKnko=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym3aBGevLvaUYgppi9S3uHTp651xi6cku6DfZ/ooDmTHI8dl4a
	qDHAqgmcUmzgRnHrWC5Vp/Lc0w4shfS8KmMw8VW7NIDpePPyBM57kYIO
X-Gm-Gg: ASbGnctucLRycElSTndOeie2SPsuWVc+Q1nFGP4H9iUV82NsUQuEL2UIKpsI8v0d+eo
	Wc0BGPS4qtdEcCPok/3oJeVmrBg5oIE6JnvAKmPlWJesFmjAcNoPX6D8iC0/5OU0yrDuCml/04E
	twRR/E1FtXX4UPVHbSgwZGfrbEEGpYGiut1CTqJhRsVWKy9EoUP7DVCpTGRGOFwHOrTl3jGUjvS
	vhUYWLKk81znk9J3WR8Hq2oG+vQ0grYFclpr1vSHemb4Z3daprCeHkkQ9RsX91cSQ8SDTysZ3Dx
	/KF8B3/f/qzO6ziWoLtwI3HA7n35ibf1XmwEl622B2vLL1oWvn5sNVPjUStamc3NHDiE5k88B+b
	ne4oZGjwmOx20waBTaP8F/KKmKukgX/js54R/es4BgMdstvGLNF0MzNwJNJeklrwBQYmsYz6FYd
	Fki7BO7g4imf7AEvvfbqnbzw==
X-Google-Smtp-Source: AGHT+IF40uLj5O1VNn/1ilvror5cZrwViGxizn9s293CQe+Duobh8kb93icrEIO0yMNIwwVc30gkmg==
X-Received: by 2002:a17:903:3c6e:b0:26b:3aab:f6b8 with SMTP id d9443c01a7336-2902741ce06mr353175745ad.58.1760556395165;
        Wed, 15 Oct 2025 12:26:35 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:f449:63fb:7005:808e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-290993102c9sm4427005ad.24.2025.10.15.12.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:26:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 1/7] clk: renesas: rzv2h-cpg: Add instance field to struct pll
Date: Wed, 15 Oct 2025 20:26:05 +0100
Message-ID: <20251015192611.241920-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v10->v11:
- No changes.

v9->v10:
- No changes.

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
index e020d9624dfd..fe6ab8e3cc6e 100644
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
2.43.0


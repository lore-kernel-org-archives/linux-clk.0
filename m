Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA35334AAE7
	for <linux-clk@vger.kernel.org>; Tue, 28 Oct 2025 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670334; cv=none; b=nTS62o+ZxKjqX+Hh2FfEBnVSbW0hjTA2OrihZNI6nT1zJgIX8XIBKNVswSP0c9OtnGFWdHGcQC5BH86qirGPNhSWPLmB6u48tXPHnwcIAYzpSVRd4zkejmPHz4SGWc9gNQMLMLCQwH+5WAwCPmxrsIm2tHIpXF1fy1cQcGNahpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670334; c=relaxed/simple;
	bh=gzhh/UeAH1T9kvsMnrnAYMspbqlc2xJ5quWu/5dmr9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hFJBy+hvEOfF0MKUPMu5n4kmJvFk1+uWx7TcNCVaddt9cHslcNihJbQhLB8H2PMhRRFxloPuzSYzu1P8RWgrVLJgZ7K6z/ymf2ESXXBMX9VcYviX9DLAMlNHhFK8PfxBXyxdZgBT+2+bXTG7IHxyuQAi9TWRBgc7mgFFr1KYe54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hA3f8ekH; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA3f8ekH"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-781997d195aso4470783b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 28 Oct 2025 09:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761670331; x=1762275131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojXgjHdopbMba8HLrtZWP804VXrMf9315iM7O/XSMpM=;
        b=hA3f8ekHYdCKEGNxdx4zGuze9R/vqrgSmjopBVbM4lAb42Co4L22zOifVlU9K0TbXC
         NNDiy5p6pFDEdTuHlT5Zm/CgW54YA3/KMIj0SOJtZlDe99UxSaDojov2g+1nfp5ejHBV
         c6qLzeK6CmmTFmj+VJwyKitDVhOgiuBQDQ8l5b1izzcEunpZCtvondu/nTFNlumXDceb
         57cbuoTMxxV4wFTjted+QH1SBuLy63lkMitgqSijn1sxg/w/STOwlTtDKOBUqBxr+FLU
         cFam/qKyibFbW2aPaLd8UZf/BuvIPzY7GKwi3gOdzbuaQyPzpLPIi6xBxtFlimLnkLuy
         9o8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670331; x=1762275131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojXgjHdopbMba8HLrtZWP804VXrMf9315iM7O/XSMpM=;
        b=Zu8vx/Ghc571xYnjMs9V+MtsAnoZCG5OCrr8mfpR3n0cV7XvBx0ai9/C37oGRhw2Lr
         +CFgOEg1fYv3MyFRYKqLPNcMWKzbX4Sv2/ONZkGL4gQDcXTZr/XCxekG/H5HpTq4Yx2B
         kU251nP3R0qcmMRcOLA2tfE9et2X9MpmmS1cn1xtmsALti3HR1brmmROyYLivkvw2yao
         aNQqHes/okevd9fbir1BNae8qcdZAbhztVw144TGcmw9XfAeCw28ujSsbDm7Cr9A9mLG
         DcHucRACTb6dyJ8s9+sudAnzuP30svMHv5qlO8eTX6Kp+y5MbJBgWBxwPyVlHNds4R3R
         9KQA==
X-Forwarded-Encrypted: i=1; AJvYcCVfAWlG2F5VkMqRtf3/Z3/14d4LpdeGCRINfH7CSLvh6meyyOGh2zzEsL5HyE8kx6Ucmv6FeBBZTjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxMCgebhPt+5Wn2KAIp8dlFVuI7fGYrCthvT/UhAWsOFOEnYt
	zPM1waWs4u75N6QIs7tteqxVLE26qMiOseR1ZFVOb27w23GjB2P7O7R9
X-Gm-Gg: ASbGncuJ1zEeoXkh+G8qSMeEasOccog4rcKBrO5V513hacDOKw+riXjC1INwASl6UAp
	utVAzrIHZDS7VuVGWIPjNbc389qu+xlnhmAr0FUYMNB0z9RPbv4rbAeE6/B0wF1P/sxYoyEnNyF
	mVKJlkerBOLrYRQrWqUlv0WMS6inezyMFTti1580f2gSBiYkVfgfCF+b4PC/pFOlAeGKDzHBrA6
	7QRJnffp/Oqtx3dSVXTPsee4mLfdaLilEabCRgHV/n7RjFnN/KNeM2IqBZ4+NTQRmA15RXG7ZNh
	l+zoCkOAnGxX2hbKIvvTixKl4WOhGa5/Jqrr9UizfsMd6VEbn+bHYOUNtLUHxL3gPusLswQrZFp
	6gUBRjMll52/PKfFMSpzuKTFTWIcwy4bBV7xsYsNnvaR6XW2A13VE9TF3EgesOkCOEYf2vvtZ6K
	pOV6iFSAb7j5W0tgj1gAatmA==
X-Google-Smtp-Source: AGHT+IEvbcR/Suumy9Jm69zfLX73WbjC1gaV/SLo7s80s4EswBuoqKMd9xQyKmFR209kVMWXKteMEA==
X-Received: by 2002:a17:902:f682:b0:27e:eb98:9a13 with SMTP id d9443c01a7336-294cb3d7202mr46784325ad.22.1761670330905;
        Tue, 28 Oct 2025 09:52:10 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:77f0:168f:479e:bf92:ce93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm122123665ad.96.2025.10.28.09.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 09:52:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 4/5] dt-bindings: clock: renesas,r9a09g077/87: Add XSPI0/1 IDs
Date: Tue, 28 Oct 2025 16:51:26 +0000
Message-ID: <20251028165127.991351-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock definitions for XSPI0/1 to both R9A09G077 and R9A09G087 SoCs.
These definitions are required for describing XSPI devices in DT

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1-v2:
- Added Acked-by and Reviewed-by tags
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 2 ++
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index 2a805e06487b..9eaedca6a616 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -31,5 +31,7 @@
 #define R9A09G077_ETCLKC		19
 #define R9A09G077_ETCLKD		20
 #define R9A09G077_ETCLKE		21
+#define R9A09G077_XSPI_CLK0		22
+#define R9A09G077_XSPI_CLK1		23
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 09da0ad33be6..606468ac49a4 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -31,5 +31,7 @@
 #define R9A09G087_ETCLKC		19
 #define R9A09G087_ETCLKD		20
 #define R9A09G087_ETCLKE		21
+#define R9A09G087_XSPI_CLK0		22
+#define R9A09G087_XSPI_CLK1		23
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.43.0


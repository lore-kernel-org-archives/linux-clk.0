Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED29930E82E
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 03:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949474; cv=none; b=TX5mqYPUXNiDswxFEL0W/+M37VsaB3L/t8Rrn/bqvxQmdn2xXaBF74YPyFY+t9KAOrGE8a2F4yl/NYrWmIZBVWnHHIyogiIDttOu1UXGQJUtn5T2Njc2KbRLkzd1mwJ51gYpwH1alM8SG8g7CNRlotNpr34rfJnFzgmsvWTAigg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949474; c=relaxed/simple;
	bh=To2Wz4JMP1yzDvV2UFHvJJLkK8aaYjCf2yPZVKorUr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j4W8ODxVkULhZ5t+f4c4jjNgV+T1x78fOHti14sXMJqGG8E/lppkocvXgRkjA+WyeRLYmmP9TuOkAkGDtI4S2vBZPaM0AY4xq2cZ+0m0/8sfb3DqE9knTNjaKnSIZbyZEmzh13p81SirzNwIwimmjLwt3OsOl9Wv2xsKhhPFAyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUjZbs3h; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUjZbs3h"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cab1b0bb489so1045777a12.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 20:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949464; x=1785554264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+s3XIzGgmCw98QusnVJUh5PtZQnQQOXqs7KUawjh9Mc=;
        b=JUjZbs3h8x3aPwsV1Dh1UVFpzTIuAKgk/a6yZegHPCcWkEeyr/hLLy9ZuacwnjblmT
         dN8hS3VPLeYzB6pTxHCQqFfeCgVV2Ix17rdQeRe7u5V2Pe0IDvm47RVng2o1GfcrVNvm
         L3wTmPsQtuMTYJPXlkEFQkyz8WQL4ssqYVk40R3TQiL+L0W9bpFjdB3X4n5HiloW0pUf
         wOTVeKBpOZJRrzvHX4qjwGOAI3N5aHmfL1XiOYkaZo6D23nC7JNcL5Ha/SLrhwd7JZH6
         x0EqYutFgWBB20KP1y/oH1Ow77sELeRE95R+1VnhHXjZMLW5wSBYfvhWI3FxgJoEtVjb
         rYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949464; x=1785554264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+s3XIzGgmCw98QusnVJUh5PtZQnQQOXqs7KUawjh9Mc=;
        b=RsTqRnEcSgg4XlGDBoJhjSy0TRNVqWYFh+g2OvVi2G4YdMdZbtY2taCyGGL7+FHIjG
         P07CDh13tE/G7cQGJuGMntXybAJoA3hPFCGi+wJwtI71hm21y5CqTD/8nNV73e9eC2Lb
         Rf9P1c1pU+kwLOKL2AiWqLBxWrrJpBDvTSRaaB5Kd/KzBOjBqxN7w8uL5CZqmtTPxrmv
         FU2KsQbg68/KOjoQj5OzgQtCOeVovIekS1jPM32dvp/OXX1EPtZTyr6auAqMggJUnp4N
         JVtv+5344P33SVa9ob7vP3WKhn/Ln3gM4Q5jq4JPca97JKqb9c32zfkXJig2PRdkJD6g
         AHmg==
X-Forwarded-Encrypted: i=1; AHgh+Rqr0Ix0QTFG6pz9Uxu6MVEbVbX4g+PsJBIOSJnfHV7ArjvyaMaFgThNfFVYyFHRQn9eA1XqUIJjbUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YynHWcY0DCAfYAhesRhuyYve5XImss2oug95L1yhbypIh002FZR
	fQrl+kkM6VMkI1aCpnzrwMEjJql1y7kp266IsxYpdnSp2JU+AYyoGfo0
X-Gm-Gg: AR+sD12L/ImpMY56easOx7TJv6jsEjQw1NCk9jGgPsYthurtnA7eg4Pfxdjia/06vEG
	36IfeT3Dp3wGrJ7l78NrIgBz8N6oOmTjRoCk9XccNnD5bTJFhlPnV7vovabT6UAMxSrJFFjIchu
	wEYX2u/s5A+F7hNgfW+lvCkLbUHL2/+nicnLI/u6qPXJk4DOtBhnuaxsfCc2wfHv3bR/GIjTZpy
	kBq1p7ln4c+lFOpPVBifhUMBWY+AZw6V7zLzY8AAX93SiSmhv7QFs2zXV4HlICyI2onsk1mAW4r
	ODuqSrN+81l9kTqlzMdugdIGrnTQEgTvWZ0ymTt0ezg6YxB3x2i5/LWmjbtnaJUMucqsmRvCCXz
	ReHFyi9pjMKXUc5E++QSrToIBMdmqYk6qwDBxX9l+fw1l3K6eHDGQCbo=
X-Received: by 2002:a05:6a00:9288:b0:848:2f77:e2da with SMTP id d2e1a72fcca58-84e595d33e9mr653832b3a.67.1784949464300;
        Fri, 24 Jul 2026 20:17:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:43 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:36 -0400
Subject: [PATCH 04/17] dt-bindings: soc: spacemit: allow eDP/DP PHY PLL
 pixel clocks on K3 APMU
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-4-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

The APMU's eDP pixel-clock muxes select the DP PHY PLLs as parents, so the
K3 syscon takes two clock inputs the other variants do not have.

Gate them behind the K3 compatible instead of widening the shared clock
list, so a non-K3 syscon cannot silently accept clocks it has no mux for.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
index d3a7c93c3c54..b8fc6632a392 100644
--- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
@@ -31,14 +31,18 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: osc
       - const: vctcxo_1m
       - const: vctcxo_3m
       - const: vctcxo_24m
+      - const: edp0_pll_pxclk
+      - const: edp1_pll_pxclk
 
   "#clock-cells":
     const: 1
@@ -95,6 +99,30 @@ allOf:
         - clocks
         - clock-names
         - "#clock-cells"
+  # Only the K3 APMU exposes the two eDP/DP PHY PLL pixel clocks as extra
+  # inputs (parents of its eDP pixel-clock muxes); every other variant has
+  # the four base oscillator inputs only.
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k3-syscon-apmu
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 6
+        clock-names:
+          minItems: 4
+          maxItems: 6
+    else:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          minItems: 4
+          maxItems: 4
 
 additionalProperties: false
 

-- 
2.43.0


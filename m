Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88C33C9EF4
	for <linux-clk@vger.kernel.org>; Sat,  9 May 2026 19:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353234; cv=none; b=aMEsn2dcVLYi/iHjofkM+xCMHOXw7bBPh7QF+J4140f3nuwCsOlXChE2fmpi8iiz9ETA9ZlkC4alTavypkV/vEjTRDsj3l5J+lp9FPbUI+YHhRWLJCXZbDsBiRa9JJ2udCGORriMTVTle+w7NM0nF1aSqD9nkQnfW1aowkpB8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353234; c=relaxed/simple;
	bh=IOxmh5MhxMGcoJj1bYSLoRwfOsdl2l4K10+pW425y+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpguH91i2f6zdIDx6s0vpt7JwZd65iue7HXVQnNb8TTu2rdxU2NLQ3tpyhEvWArnjMZHEC7jTYbdf2VZ3ZREKdA1Vb+pPAUnq6tt+iuAZeNGjZXc9nWY1OQYMNr04/nCscZbDRhY1gyejIohk9kn1LZSlhtukkfUUdwNr4w35+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPG5F7LE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPG5F7LE"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44e1860558fso1971020f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 09 May 2026 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353230; x=1778958030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPkvMBVXyvicDPmrKpPPSuducOnxVL8vyxeJt4rQ8ag=;
        b=UPG5F7LEbJ8V3oJp0yCFtKSDYymeHs2TzGhx596rLKEdKNFdOOOyI5km6OrZk5sRPh
         A7ZKyjU3Z9+63/AqI9Kfnl8mVbVwpN/oC1KGOII3Kl95cgkKZNeBa19CiDMpHp2jEVMB
         YIFKjlOT84VpVwhmiqOTlIXAa8dQbVSgyTjd1JGYMdNYTO2Gb6R50FKOBtB7JnP8+Atu
         5tA3glJyFiLQr5gUisT1eYFKjguQM+TQ72coMJiR6MvTndHHxjYBqwdSqyfYMcyF1f3o
         T4+6MvTWLCcjhtOe1CaijpWdurvudA1OKr6YnU21dcEOTpCfp2Q0Qz628aPwMaSVq8sl
         OFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353230; x=1778958030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VPkvMBVXyvicDPmrKpPPSuducOnxVL8vyxeJt4rQ8ag=;
        b=qeLPoRjbdp5fwX8eTcW4c34s/pALn18Fh1qSaibiIs2DwVwDesY3TMZsjFgPuGa1Ns
         j993PdcFsVDvQ/Ym4NklnSof+lJeOWYdfqBZgrnIKeORT3cp41xI9uf2fkjNU/U90VHF
         mbq2AxamzsbOghbynuromyAd4Cowl/t4Y4RhE7fXeutC7Bk0iLm+TvOWTfRXFEHDLPaD
         aDtk3C+vA/xtZtZZERqUIlW9MVRMlusiRmCXedb1oPCeggiKJoyniOsk4M5h6jyQo7MT
         C8aVOT9yQr/MHk3UC+4w9vge8iSj0Zw+ksU40lxpZSwKQnvb19fwK89Fr3pQdTwB5BCJ
         ypsw==
X-Forwarded-Encrypted: i=1; AFNElJ/ExBShoCx2sNL8LH2IgF+RlFv4fCe0dYvCdV6URAhj3GbLPIl7DH76vSNclT3EifDflA9levRXAuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkTz9tsHApZTgB1C978FwRK1vKnyedQctkygbuxnzqJ68jzJvq
	rN/BseQWK/CB861lsTubeBmWhntD2DYgNmlLmh1ppN2jCSj7Y94J3GJK
X-Gm-Gg: Acq92OHUKXF9PtJaUa+1+HE0v8OaLeMPavBuKxqVkAgYgFh1YYnhTyMzd/WFNR2hcwi
	yeiA1qvYMfIlem0eeif8lCol9ZWdXtfpwOOckW0/wsKFEDrXKJi/kTbZ8QHrARU8pFF8ZOnlrPP
	LpGitwg2kvZmVl+6IAh285mWgS46ryx9T9AMJLAb/zjMyileFh7QOK3gC6fdLBBmCSZSirrRI7f
	aQd6yEDQA9fE3Qh+qmSa+lV8nsWJplry5Lx0lWjzmGR7xRghkaMJHRIHkPmEOuTTVmA7doXRxhu
	x+mXgvfkEQbVEPTX3T9x81zLwBAwbVTjklEafW0+GUVKdeL+XhdJLpfdCJhbDYzpIOpJA9QDH7c
	1jTJEh4egcQEnNpaKQwPvQQyAA706G3XhTP1d1fQImqlX4XV9EfKa+0WCn6somxBW/xwtChu2pZ
	jteWHDqPn+8JOEhNAmo5mKwCVYad/hRzNlGTmTW208GOCekuk8+oAtfdFbb1pqmnZ/ASY=
X-Received: by 2002:a05:600d:8:b0:48a:58ae:993b with SMTP id 5b1f17b1804b1-48e676a4e03mr117153245e9.16.1778353230046;
        Sat, 09 May 2026 12:00:30 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:29 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
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
	jernej.skrabec@gmail.com
Subject: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33 layer reg space
Date: Sat,  9 May 2026 21:00:14 +0200
Message-ID: <20260509190015.79086-8-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

As it turns out, current H616 DE33 binding was written based on
incomplete understanding of DE33 design. Namely, planes are shared
resource and not tied to specific mixer, which was the case for previous
generations of Display Engine (DE3 and earlier).

This means that current DE33 binding doesn't properly reflect HW and
using it would mean that second mixer (used for second display output)
can't be supported.

Remove layer register space, which will be represented with additional
node, and replace it with phandle, which will point to that new, shared
node. That way, all mixers can share same layers.

There is no user of this binding yet, so changes can be made safely,
without breaking any backward compatibility.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v1:
- update commit subject
- reword commit message

 .../display/allwinner,sun8i-a83t-de2-mixer.yaml  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index cbd18fd83e52..064e4ca7e419 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -46,6 +46,10 @@ properties:
   resets:
     maxItems: 1
 
+  allwinner,planes:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of Display Engine 3.3 planes node
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -74,22 +78,22 @@ allOf:
       properties:
         reg:
           description: |
-            Registers for controlling individual layers of the display
-            engine (layers), global control (top), and display blending
-            control (display). Names are from Allwinner BSP kernel.
-          maxItems: 3
+            Registers for display blending control (display) and global
+            control (top). Names are from Allwinner BSP kernel.
+          maxItems: 2
         reg-names:
           items:
-            - const: layers
-            - const: top
             - const: display
+            - const: top
       required:
         - reg-names
+        - allwinner,planes
 
     else:
       properties:
         reg:
           maxItems: 1
+        allwinner,planes: false
 
 required:
   - compatible
-- 
2.54.0


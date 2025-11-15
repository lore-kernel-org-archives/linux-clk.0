Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B323301499
	for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763216065; cv=none; b=GKlV0BJ7YoxMHnGtCN8vwsvnwGlOW5U4dWKO31mE5hAdpXbEFyTDw2orQHQJlCSnm3DKW9tIhE9stBN07nhn2GQxTYdOKhYHtiDnYr4p2hH1hLjd024ah0b/qViiYngYEdgDyPe16/8mRFihuYn0EXEbgm0DyLiI3ZSDKARLt0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763216065; c=relaxed/simple;
	bh=/HxRScD2cq+UVkPX3OMV/vSVclwgfb2Shsd0VzOJaW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAU6cDB45vfv88SRRhpt2zbJTVCUVBYBEMbnera5U8Ce1FRMAlP7xzDmWR3viNxaddTfDVE9wVPn+aTk4Fm3aR82DnY/NQ1wjWbhiKBgKzFelyB88x5BFvUE6eHoh1d50CotafzedPC9MoqBfbADYWi0JuZZzInb7JYD8YrLrr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmg877+x; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmg877+x"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso4934295a12.2
        for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 06:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216062; x=1763820862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LChDHbx4y116grQ6jx2/dXjEvBwJOxeh6WSv85ZRlvk=;
        b=hmg877+xRIyp2uBdsxoXhMnj+JbSiO3Q4DlNEQc7jDiFylhKCZsR/d1kdwFpZfq6Ua
         DboQcOATBTAIwTPwj6QCUgZlMQzTF1/g433plzX7K4XksbrjryUDD2LFjITfyS+l+2EH
         1KgdnjcgFTTDm7LdVoleugOt2DVXtjkPlFdhCPNg9W0rEdiS3sjkwD8IgKqxScObfj2R
         VBFW7JoAe8jeV7haUz6UXNKU+P3IJmf7tgFDcH40jNet6sVTs7OVbOT7RnfuDb0W661p
         j9Ho7PQTcgEsRDhCzHf/QGGALjkH6Jftu8dDybR4cIxn9736/Nrd95+u5GImeMaqZX/w
         CpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216062; x=1763820862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LChDHbx4y116grQ6jx2/dXjEvBwJOxeh6WSv85ZRlvk=;
        b=kA0AGSGuvWEcl1hYxZXLywKSrEtmKnxLW25qC8MsgfXA4PjiK6mEKbOAeb22nWwJI7
         eCESpw9wE3IokSap/mBaIADudtQx42AUnLaCL3ub+nBGX8IjIoRMhv+GY09qDGwGqFyM
         wDjiQbr0bDgYVXBUVG4oS56kINX/C64eY4OsR7hZxvVpTQV5B/sPlFqrQWrIg82UascA
         Y4P+ZkhA6bxXCpbOWVQ2R7tmthOt9bjCbUw8BjIVIpkxITYEirpbJu5O/OK43/ofKUud
         BXguk+9XymoAwpiJCAb3ulcEuIwWMtQkLjRa7+CKD46BYZUyBotqbmtoEVpZKqe6goV1
         +iww==
X-Forwarded-Encrypted: i=1; AJvYcCUOJF7vNafk6CsGohFRRQU9OyCok1DZGXr7ZVouXb7d/pizvLKUg9pRIJ5+3Vz6HCZKBt2pt3GmSIM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw24juJH458GtQAPo26j8k/1sca/UuvAFkbk7ZArvOt8bZr/tKn
	zHrWdj0PsidF5m+DECkFNY41KmJOz/W5TvU2qCGm0XTmoXL63HTa9X3u
X-Gm-Gg: ASbGncugsCCNAsWlKrfIXOfO4dsr9SNu1CGu+BV4t/9NiovWgabo8Z33cish/0FBb4m
	aTLHeSfXxPU7cs1gc5XjoUtRVdOMjqM4odyPKsg9g1QVqWSF29Ga9MsyEB7BXgThabJsXd0DU7Y
	HFDW2oLLpSocK4bDvr9HzcXYpZQ1ORQXHgT4yTvU2idkT2RiCoAWoCgQz4iIXikpjxwbJ8Z6mKn
	Rs0w+u0DGGXKrbbkMcDKDRN+pAFvZ3Um7OSJFSj4DuVpdlfr4sMrmGJIX/LTO17K9+MZFbcI3nj
	IDEZbBgNQly2WowPxSM+EUcTXSa2bIVwQoAu4KoAwrV6pgbYdO3Z9smxrAoued0EfRP1at+G/wO
	Tsl6qOox5PhXWYvkPpRrcHk4/x0Z11fTB+Q+dzfhga4iyC8rSUXFF5Ea5LMQDPXaJvGhSsa8b3O
	Ww7tI0/20JmNNvy2AYoiu8D0SMxfooqR23vrc6Jpor5jHTKxoXVMH3f74BJls34yKepiA=
X-Google-Smtp-Source: AGHT+IGK96g9RzM8eg44aCNe4s7zkdHo6HIsmO/rv+pQP0RPewfWCNhEzO33viKn6j62oVKNtGFutQ==
X-Received: by 2002:a17:906:fe07:b0:b73:870f:fa2b with SMTP id a640c23a62f3a-b73870ffaf8mr113667666b.27.1763216061567;
        Sat, 15 Nov 2025 06:14:21 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:21 -0800 (PST)
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
Subject: [PATCH 6/7] dt-bindings: display: allwinner: Update H616 DE33 binding
Date: Sat, 15 Nov 2025 15:13:46 +0100
Message-ID: <20251115141347.13087-7-jernej.skrabec@gmail.com>
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

As it turns out, current H616 DE33 binding was written based on
incomplete understanding of DE33 design. Namely, planes are shared
resource and not tied to specific mixer, which was the case for previous
generations of Display Engine (DE3 and earlier).

This means that current DE33 binding doesn't properly reflect HW and
using it would mean that second mixer (used for second display output)
can't be supported.

Update DE33 mixer binding so instead of referencing planes register
space, it contains phandle to newly introduced DE33 planes node.

There is no user of this binding yet, so changes can be made safely,
without breaking any backward compatibility.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
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
2.51.2


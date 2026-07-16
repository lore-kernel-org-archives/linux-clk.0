Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE7E41F34F
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205292; cv=none; b=sSjKOBv+po7eJ3AENJgomAEbHJWr+i475q+deOMdYn7aoYltlGexfMYJwyDvMlDDADHHBKI4ez3giCjIbFVZCqKKhfS7sDbQxh0sNOYcOEUxYSzjbvbbu5ld1y2MUHGdd+Ob5xFU499EkAb/cDPvFjhtO5Xq+6BzUtiGu4kXa/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205292; c=relaxed/simple;
	bh=ZeoHOrcCtYoooj9iNeyIvUVAJBLQSZ8butMUSbwnfGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e99LSyESncLTBW8U7Pyx4nG6vqF6kLF3p1ZYPnB/rLf4l57c+i3iN3BUJ7VMWJgb/fsxwDEfy0Ig44ljUNWrdQukxrvMeK2NVCilX9WTjFjRrYL6KFAlox2+3FcVfudDtCW0gzwFXJ55ob8uvhkJcx+PkymQF65sioCjQ37OJTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bV1oetyw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bV1oetyw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4953ddae026so11742335e9.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784205286; x=1784810086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45HS0HXfnOqn/cim05cwGxtOaeZqHee/zE0v0a9vY94=;
        b=bV1oetyw6DCZqPlLTxyC7KQwAYdwEQZBPUwy0DeiE24WWhV6xTU7ae+fPo5C3DYz26
         0D4EgMFmgvDFqaZ3VfNg9Tth/lQVL7HKh+Z2ddvclPvJYQVYXna7uvgGbiMZu4mKOyH1
         1FLn3ITWGx+xS5tr8xAeJBINo4/mMMBWpk7d6fqy1QbVfxigigPheyGnalQcXqBmrxkc
         lZsAjOhrIY94r5xUgnVzY5154BWAPePTKu68N0ZasZEX40o44TXmZCS7MAkLUKws3rz8
         NjL3f4CbCefWRoIsS10TD7mccR2w63Lzh22h4gXLFkm3uUT69zKoI3pvgLIyO5jINLjS
         171A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205286; x=1784810086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=45HS0HXfnOqn/cim05cwGxtOaeZqHee/zE0v0a9vY94=;
        b=hi8WI/KBRHBKCdoNQk7Cm0/f4f3eY6apQKx1kWJ4Ngs2bKIyMkBSYASsHgmQVRgZ/a
         /3xIfGEyXzJNwN4a1vEzz1zi+NjcRwmZ0V5FaD56bmjvU/tXU4DS2ymjWreJNTUV1hDV
         vVz3C11AAMiF1ee65DZjZE5l5wIJOwo87A0vF3w4apzEj1JVFEE3y6hFNVKjGzZLJVSM
         HIcrbMDQ9TUL1xoWprsEIMChx7y1/AwDnvxgo3ISlMMzFvAYC6feqV3r00qyhpSonOOb
         HvUUFjAXeIczNBjj9YyUP0j3VEfUX4KR7uRyQxrinAgWvhyrZtLotPrDQvTnb277K/7q
         2G+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoxzR96m+6LvDniNesYQYqNBB3ySWNtf+KzSNDjn0MXJP6i86yx71hRq3kjgTwbsth2veO7XAKEWzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAub6J2eCcPhQ1Xgn7pm4UQKNDDHiUtecVM+KVHnMesiVZarFQ
	qY3eSFxHRAsUYTZGsGrMgPzTh+oXqkiu83NFnV3JbOroA1MR5bszB9D4
X-Gm-Gg: AfdE7clLXbsZUffsTVufCVPpyOV9p+x/R8FwN0dGlmTO2kDcIsOwJoDJOaWozjDRCm8
	7km/kI57XyqkMIEneA7QXQT8Hp3/4qjebEGOtmXzPRSwRIqptk8rFPetvvAHvzQ9QM/EwfUdLU3
	y8vZ/eXgj7sBunv/RAUjsrBhOc26eu6mQ8+THCpelAw9H/cvkqmKBwWEkkHHPzfyGJpwh9X0f3k
	eoDkRviDmVtyQ60WjHAsUiiffq+v5FszGVB9jmoWhtr9zAL8ghkIkVom7vbuntQd3NIO6g4DmEh
	IGY6WpF9gOn+tZAVrT3+DkTdhiutUcgN3Ch0BucENYqP+GKZ2GowDx+RM0HgrEGbcVLDqDwv288
	v/meYdWdH9ejnIGTwC10KMHQd2+P3WK1+Ra1XGG4W/4+nFEttNPo8mZ2E5aEgy+K8OIAVSF3Aic
	myrUBUR2ed6A79uoA98etJYOQlpho+DJODoTcNNoBrTTMWHxoQ71P9WKJUnh/d1LYJmGhk7ZmAj
	R5etB/FyVttdcoI
X-Received: by 2002:a05:600d:8444:10b0:493:e46a:ab with SMTP id 5b1f17b1804b1-493f8837638mr181771255e9.34.1784205285938;
        Thu, 16 Jul 2026 05:34:45 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4150:a2d7:2b6b:840e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83d05sm48582645e9.6.2026.07.16.05.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:34:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 5/8] dt-bindings: watchdog: renesas,r9a09g057-wdt: Add CPG/MSSR syscon support
Date: Thu, 16 Jul 2026 13:34:31 +0100
Message-ID: <20260716123434.2576253-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
resides within the CPG/MSSR block rather than the WDT address space
itself.

Previously, this was handled by including a second register range in the
"reg" property. However, this is architecturally incorrect as the CPG/MSSR
block consists of two distinct regions (0x80280000 and 0x81280000) that
contain registers for multiple peripheral blocks.

Since the CPG/MSSR block is a multi-function block, introduce the
"renesas,sysc" phandle-array property to allow the WDT driver to access
its control register via this shared regmap.

Mark the use of a second "reg" entry as deprecated in favor of the
new phandle-array approach for SoCs that require WDTDCR access.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Updated property name to "renesas,sysc"
- Updated description about deprecation and use of the new
  phandle-array property.
- Updated commit message

v1->v2:
- No change.
---
 .../watchdog/renesas,r9a09g057-wdt.yaml       | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
index 975c5aa4d747..322b6921c147 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
@@ -48,6 +48,17 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,sysc:
+    description:
+      System controller registers control the start/stop of the WDT, and halt debug.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to system controller
+          - description: watchdog IP instance index
+            minimum: 0
+            maximum: 5
+
   timeout-sec: true
 
 required:
@@ -73,15 +84,29 @@ allOf:
           minItems: 2
         clock-names:
           minItems: 2
+        renesas,sysc: false
     else:
       properties:
         clocks:
           maxItems: 1
         clock-names:
           maxItems: 1
-        reg:
-          minItems: 2
         resets: false
+      allOf:
+        - if:
+            required:
+              - renesas,sysc
+          then:
+            properties:
+              reg:
+                maxItems: 1
+          else:
+            properties:
+              reg:
+                description: Deprecated. Use the renesas,sysc property along with
+                             the watchdog IP instance index instead.
+                minItems: 2
+                deprecated: true
 
 additionalProperties: false
 
-- 
2.54.0


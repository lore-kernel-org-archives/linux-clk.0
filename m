Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CFD48035B
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995496; cv=none; b=Qre2BFwwRFqX+eAVZaYX2sKy6bk2TqZ1kdb5Q1XB0lCQzeVP84X9Ghq5pSHfdpcvl54e6NThpUut528B2CTuqDmbpkPGoXrLjHWZB7Dv4FV8qBSSyvQFMXO4kUxCvyLOVRRB5YyD/9fVBi2JoYaRfdTnf2WAA5tcWKzZX37DEsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995496; c=relaxed/simple;
	bh=PmDTNVsDWfiEJmr+uQTPVzkjhlVGry8IKEMbCyAPdqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBy5FGp6G6Le9F7B/gLlTiZekJ91Xi3sy7la+x4TkT+RAeGLBudxMO/IDBwsjZ3oVYHIyeyzX+dDcw0tTl3DjjxgYzYXY0C0MPxTR7uA7/2FRVVVxf7L37LSsXDaiv+vOLxdFYNEe6mAMqCWOOfBMYK61dyn4vVM9Pry/5+3tLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZzALekb; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZzALekb"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-472055b0efaso1215170f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 05:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995490; x=1783600290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmlYZPisAM18uLrOj3e2exC6+6sOiuaqyI++DJghzLo=;
        b=VZzALekb0XmwoZaCpiyeJdtNC5cwschWOh6lykEDg8+uEYyLdgPY+Oo5TPoe/wgaUD
         1PxXaH/LDBFgWqZXBZp3ZDfMfndbEbnxIVKWzq7KuCRo4aMuwg/qoWuayoOHqsC+Xuxq
         szI6iZi0WPJSe5bBKRjqgnDxE3jsrZHD2Cn33R4qy+kSSDTFYYKime9TNZgalBxabiF7
         txkKOOeqHXpYzAcmLx2NaW/6NOgrv4+VJth2TCFWRfF8aU+uQnc81YHDZzLkFLJvuxtY
         WZ1R1ywdoVJel/zCt77aLVWOHcZmmeIePChXfua9hYZHAeCvWaIrWOLqAe9prGK0h82S
         8Y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995490; x=1783600290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HmlYZPisAM18uLrOj3e2exC6+6sOiuaqyI++DJghzLo=;
        b=tTP48eliGw26yn1uiRktQLEKrxkm/y+pu8l6hhfwoB4IWSn0VpEO2b+TUfBl5DYyV4
         pSIWdVjmgLm4UVxjZVjlztMfLwTTmHZVeqEFRqfOJL3MOsMY5ItU4J5R9wLUeAUgUbPU
         8tnOn/FNEqHrzdsgEKdoWcbRjWn1HErkD985RrbcQyxh/VItAwUX7zbJP9veMOppxX4g
         K+nMk9B4IU1o7uOS+0Valto74vilA0hQ2H6q+SP5kqJ/T5Gd0dpKtKYxlxFFMfsApoJj
         yOFfaXgc4Hptyv4tucxEcQDdqYIUJz6y/gFRnUiNoDwys9k9ZLWsC9qVveK7Ya4jruwL
         2Bng==
X-Forwarded-Encrypted: i=1; AHgh+RpcXi1QHqVoQNAXDA/KCrbPI3GFvpDarzHlDp1gsAZaK7LKr0DzziLg2Ho3pyPA0kyodvogSi0yGWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpBucKh0v9MgWey2mPVHjMI0lI70q8Rd7S+G6fMXKgx8kpYkmc
	hC+J8L7LyH7Bt4Ged6TWQi4SoADParsxs1l1vxkKKaSoWUsWIVX7EnN0
X-Gm-Gg: AfdE7cn2IeTYNCIbJZSDvxDmF0X2QfCmc/nLQ/7F3FG8Yc9poNYKAFI78ysPKsMsxxE
	A8dCPkQ+BieDwzcwy0ibDfn7v4LsieiK/8D+E/NQrkNdC+fQM1AJ7EN2PbqIYKyljnctSHrCp9s
	RvDdzu2tg6ogvpsraZnVRASYC35dIhLjOXWZXHd14PB3HE0QcNXhL362CWXQdlmXN0DmrFxylWq
	v9qd7rtluB4ctlfIU56bI7vlAV5I9ouXTIELohlQiEUzS0E91Vq07diiqbnPSDBmna9pPTquPnM
	RbTienfwrTECG2M97IuIThrOca+Ssd+engsyIJN9BaFjyZcDhmeTEJ9/yM+2i6LUqo4sno3mRaF
	RK4DwlrVfjFTVX3dQmMKOpsru/M+t5dJ/9D+/KvdxB+8cjwQkAuST59ehZMel9TjETZGYTV8JvC
	m3+C7gF9Lk1kdh7sLMvnv/sYZ7fpzGdGMd6Z84et6jg0MSsL1X7V8jjbQRLREP/SPvbBe4ipDQ+
	AcIGAr41vqYkFVZoaREKWodlTk=
X-Received: by 2002:a05:6000:200d:b0:475:5454:49f2 with SMTP id ffacd0b85a97d-47757e57dc4mr8804566f8f.24.1782995489181;
        Thu, 02 Jul 2026 05:31:29 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:28 -0700 (PDT)
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
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 5/9] dt-bindings: watchdog: renesas,r9a09g057-wdt: Add SYS syscon support
Date: Thu,  2 Jul 2026 13:31:08 +0100
Message-ID: <20260702123112.161160-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
resides within the System Controller (SYS) block rather than the WDT
address space itself.

Previously, this was handled by including a second register range in the
"reg" property. However, this is architecturally incorrect as the SYS
block consists of two distinct regions (0x80290000 and 0x81290000) that
contain registers for multiple peripheral blocks.

Now that the SYS driver provides a unified syscon regmap, introduce the
"renesas,sys" phandle-array property to allow the WDT driver to
access its control register via the system controller.

Mark the use of a second "reg" entry as deprecated in favor of the
new phandle-array approach for SoCs that require WDTDCR access.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 .../watchdog/renesas,r9a09g057-wdt.yaml       | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
index 975c5aa4d747..3fa3044cde6a 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
@@ -48,6 +48,17 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,sys:
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
+        renesas,sys: false
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
+              - renesas,sys
+          then:
+            properties:
+              reg:
+                maxItems: 1
+          else:
+            properties:
+              reg:
+                description: Deprecated. Use renesas,sys to pass the offset
+                             of WDTDCR register instead.
+                minItems: 2
+                deprecated: true
 
 additionalProperties: false
 
-- 
2.54.0


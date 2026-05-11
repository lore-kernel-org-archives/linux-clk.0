Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E04C9571
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 18:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525473; cv=none; b=gMWnJO9iHxwYpsF/sYu1qlX4gwd4d0s9gxY6K8pVNJer6H3gtrT2mQY9m3pcn4eLvggrk9LxfefFKqGbT/YvidSZIJzD7XWPB5n9CpLGWdCd7SatowjDSOymkcz2N+W+TgPeSf2TOOE46mbu/4phn7+g4ZaIGCheLgXMOf5KGqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525473; c=relaxed/simple;
	bh=ScuSn2Eo3m8qfkPkxLxCk22qONfBuFmTXHK4TsFSyPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkT+hDMH4H0jC6AWD8G/m9sFiNH2Krn/lDWhh5SIE738YNUH4N6HyehA27JHT0SVgAwnm3EZo4dByZxGBKJ/bI5Klt3u6aCe6qWEYuEoNn4TvNSRYsk/jPLv5NVk/mivoMNiNi4F7xDrN3JAchCBvJXu5EBKIuoXsqff9MLCqVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wnt+S7ZL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wnt+S7ZL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48896199cbaso42852255e9.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525470; x=1779130270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxgQ/0UOwKXQVRrJFbE40xkB8Pb4iPrDGhrh4gosHyY=;
        b=Wnt+S7ZL9X+xAvlHP4H+8MAKgLKz0gbfGWFbhblcaB/V/wPgIjD5dyWDlrt+udAPXl
         5mSiBNhu0IGG/hn1dl3KaPlIkfHgGqIYKNK/C3dq4Ko4vedapcpSc3z0Frj4aUELQaSU
         rwyi2GE9qjvfdzscIvURQCBXB+4xiRVyUNW7CuSyYrVgijg0Bj8rQ106OXL7555R2BSs
         +Q6JXiceye9oZvmmEOGdHEPQnRJN2SjyaOO5AEUOFTpJhciggJdO2E36qxRI8yuY/8AZ
         wMCKqE8XjSS4x7j3oQuSRd1FmpFoVCP7a4Qm4iDdBbzDuc1zg8iffnXTi+E1hsKz5WXW
         HAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525470; x=1779130270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UxgQ/0UOwKXQVRrJFbE40xkB8Pb4iPrDGhrh4gosHyY=;
        b=cs4CXAddYDU9E8gTEUjIa7ImDd0bylpMWOT0PxIPV8ed94Ptpl1CKXt87DJxZv9hsb
         3CRBrlPvUJ3qJbGLyCUObn+/VeejaVDZmAczhiF2VE4Ey4RqVVII/8awHZjXvTo9n1Nt
         D5pqVaa/DEy4C3NYZ5pmE5qy/HPph+Tpd2BBskF3GXBKha89b9sRAvEJAMz+L2iM8fFu
         LLwiNKeTOeJ9oTKokIiDLwI6tSpwocBmVFJeRZGYr8XtvXNxKnz3L5Fl56ZjM5fKHO2S
         TxJ/KibrvFf4bzxfmqgk/10K/vXN1qwR5Bb/h/s8/vypU00OsDBimG4rY8/fqFbZiVXZ
         6Tvw==
X-Forwarded-Encrypted: i=1; AFNElJ+AaKJXDZjuH74Lst9Lu9si6S5Np73DzYrj6+hZg7uukdDRlOOc+iGzUHlvyIQnYKAxnj1VbVTXyfw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5swbNXJsXYVXoWhed4xwBNhZieWh4ep7fOqg6Y1uAgRLepc3o
	xLHcQUcRUhUqxBVMifskWcIAzBwc6mWXx1s/dLqxW3iSJMvXFkoUTT9L
X-Gm-Gg: Acq92OGh3w0yOZ7ChvWAm75/D335UGfIun+EZNVAYLsZrxfXwplTLTQ4kB7qzvtEj1Z
	z/UfieAtUo7CiTKJXaUBgf1SzkKliYFyZLJbIRpj7D2f0rqLpyWiQxXW9zqDCqb0yLyzH5393ik
	7ybPPRZAO9Nyc5/JZAUH2CsBIf9ffr+MGnVltsUaHZ2reVQjgllTiv7BXVNc3k+o/RsE/sTHfqs
	/ViKJcRfD15L1UY2LciT3PGVWxeiF41FLYhaHCnBF8tE8BAy2mpzMv+Xvt19BC9NrtbLYJoOj6N
	TeJ+f+R72EpIWY600Mjz9sDoA+/95XF/RFIBq0NIw+/SQN0pYC77kN9q+bKgMO/PF6CcBCkVgw7
	GMWD61zwO92D4gmN0P3MWqYsvNuhFWrV+2VnhmgRDywZ2L6+qSysMEqBLbB7ZBJnIxELuh1BnhL
	2C5pOdTuYLZVk6VHPbQ5X34GaEnBWlZkc+gMI7xi5yY1t+GDarRZ7VpMU7PHRY5X3GvK40Oj5CN
	O/JKVRn6BUj3Oo8rREOgre36OyE/kdb9H7zmA==
X-Received: by 2002:a05:600c:4449:b0:48a:89d9:a419 with SMTP id 5b1f17b1804b1-48e51f2e67fmr395335165e9.11.1778525469670;
        Mon, 11 May 2026 11:51:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:09 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 5/9] dt-bindings: watchdog: renesas,r9a09g057-wdt: Add SYS syscon support
Date: Mon, 11 May 2026 19:50:54 +0100
Message-ID: <20260511185058.1926869-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 .../watchdog/renesas,r9a09g057-wdt.yaml       | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
index 099200c4f136..2f32c7401def 100644
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


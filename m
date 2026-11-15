Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723093;
	b=Kl5VKRUZqZAETzgiBFbvqNaUfRzDANvWTzBBi4sAREYnRfKr3GCuI1qchlK8tGaNJvXk
	 Q/945GnXjguMi8m6sm7cvIxojSshbO3RBMbrrCY7sWzp38TexPvsvG0w46J1CfEXY/jaP
	 qom470U1sH0lmWO2aNO0QhWd7vzhJZK178vusfl5beKW+ybjaIuOKl0/KfpWYmkZm/Sla
	 JI1t9xZtbY7fG+2l9K6yGkxpZJBvPj9oOh6qPbcfJQZ7y9ttR7mDsAOzhgfcq6H/0C9mZ
	 Zg5EOl1/T9ShLpKtzhaR8uoRYNzchHC1u3hGCAeKbP5w9Uq43iEc5D4+j/NgkPJCSQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=;
	b=z2Xg7aEJpI38bMyp7Vd/mTVoJRfxN5W3oJQ1J+VDbuaGLCDXTkK9LHZkC2trUh2MXSbq
	 gt0qIMuXRepd5gYRKzAknRIe9gnkbO9m++haqbYLAL1Mp9V9EHYDrLl/Pt1dmYFl+qUXR
	 nRVW1gsSCAxjOjXoKZvhxs3NHaP6PNQA00mkTLLecr6fEK0HZyFY7pOrPAHv8Dx7Jc24j
	 6fRlulI37ls2eGDtFu2PzMIn0YFOkZ08pVfyZeK27qyGynD0nNyYvZckwyqrSokJsRjNs
	 /H3otchqjX3ilM7EsGORnsq+dmXZWStc/Sl5YVSvwq4MQ3Q0Xxd/N7F71x9XqSGINpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7iYHYzs;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DEC606A8B4
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 06:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33DEC606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7iYHYzs
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso9534875e9.3
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 22:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723091; x=1795327891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=;
        b=T7iYHYzs0SdTLxO9JARbT2EQUlNflol4Z/wBrht2nrkpgxOq7clOnt5yLxVsu3Owtp
         4/k7u8k5Xl5rGNEq3TDWzV1gb4QGtxhtBOW5umALj+0wOxIQBaheYQY6BXtQbnmu2wty
         c9yOApQrD1mZDjAMoFPHMoIjvYf6bNfcHu2hPIRhDG4hCS7jnjiZCM8F7YvK4DgBR1e0
         Dm6MxKM9D6zKfRuyojALC0IRZqjKkh0t9TWuCYbCC2nuQBDGBCO2r15JdrUR48afQ5pF
         HLBNqgsIS4//U8Cl9qf+SHTCG5Z/7J9fcoJRWNdiu4GSyEUTcNsAFDhMxTC8dmA0lQHh
         Z5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723091; x=1795327891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=;
        b=LjjzApdwhqoVqWsxK5s6LyoLGA9MWiWxaIRHLnmOJcg/jTvLHEIUqUI6GZ6yo9ggeC
         DOJrJ2A/exr2M2LFpDvpsURi0F9OazbZcinSdQlvowHoMHMf1f5YtOL23yjai0TU3AsZ
         9oqH01e/ZbBnzsjHtvlegNq2g7N4LdfRe9g0GOXAo779JEC6LF/tHQUjfXcsaFEZT1th
         D88k4xl1VFYhjJ7VD6gQ55TBQ2PqZLGDwcs/OXnRqWEn9uVBXvRCzGE9XogiBFnHD9cS
         s7LP9l7Ehg0LDY6EiO2+b6kz9EBjrukWuvqEZGMpPdY//wE9ScCSsWglVFQc4yJ92AHS
         5p+Q==
X-Forwarded-Encrypted: i=1; AL+hErFnLWRq+sMJHeY5Yhuk4Bc0Pf6ELZd6JcmGNQhImjpcl11MGA9Y8OhH4IWfeManuXRrToRV/jZCf0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mqm1m9bZDgmUscwbPn2n7OvvHADnHHnrrp4yT8opjDVaXqHWt
	Zr0oCRJo6BQUOVf4IARKfHEGrN3rjXKv0FNVS3kYirMJ2+ZCHjFvIlZN
X-Gm-Gg: AYBFou1FUXwKJc7/jgBOk1ytN4sPSX8OKYabgOgTdFK4Mk1ww6BdTreVhZXwMcOBqnU
	jjKAYYdrnyg3t/Hmpm0gZ8meBE+HdZ2+lPyfzVy4GMyLJFumyaRFqVMlM9Hiyb/1ffx9n1RdV35
	LJmuX0UBlwrVjWsSX6awmc6Lj/pXfbltqC5tke/KlCZlJkE7jyHreJvNK0bZyszBP+WrnrIkhWk
	yu91XdHTgXB3X86s5wBDqpUwC2IyykwJ0sv/9F7GjniflMpJU9F7bTU2uhhCapahPA69fdCpYuq
	V92pjtpAt9mMBd+yjVBcgHz6rgAFVbqPx3rCctJ/UBO/bdcdpOeEH4qVUkHcH4hyv5ctwZizz6m
	/98whkWK8ddopbbGxh6k6kW/nasqLq0agDQuPVr1D3Tus/c8JesLDEe1uPbFBY7Y/gbKGWrUO8L
	retam0KXN7b+Yk/XUuYYFvxIRjrQzDukbHWRx5wnt19UhgK6mBBUhEdMzzyzUK5meLtDh8cI94A
	c26+PASPacyh0lptPCKhgup+x4K7vfiECjtcjGAlhunMXRjZOatOeETKZnf9LH8YkvH8R7dWPMb
	sqwAYyYBCYhWnHnOO6CWatO9SroksvIgOVC8ehQif2JpmVjcONzwzyzo/VWoQKtqIfJLld4TiOl
	PSrCd5vMA0Sp8hxngonH5iDaL5i3kEs8uAwYsUY1q0xgyzzGQ44u24e2kN0tlIPa8kEcca4k7p3
	M4DuLsrw2N2zrWgmYM7IkMkMb0+PBkC0JQmmlDUlU3P21Km/7WbsYnK6sIJ1vVjUM82xxk8BCHj
	N20goZ6nL+05A==
X-Received: by 2002:a05:600c:3112:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4bb55a4ebfbmr158351435e9.13.1794723091535;
        Sat, 14 Nov 2026 22:11:31 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:31 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 7/8] dt-bindings: display: allwinner: Split H616 DE33 layer reg space
Date: Sun, 15 Nov 2026 07:11:01 +0100
Message-ID: <20261115061102.229680-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

This change is intentionally not backward compatible and the old binding
will not be supported by the driver, for the following reasons:

- It can't describe the hardware. Plane register space is shared
  between all mixers, but the old binding puts it in the mixer node, so
  only one mixer can ever claim it. The second mixer can't be supported
  with the old binding at all. It also has no way to reference plane to
  mixer mapping registers, which live in display clocks register space.

- Supporting it would mean keeping a second, mixer-local plane
  management path in the driver, with hardcoded plane mapping, which
  doesn't match the hardware and which can't be tested, since nothing
  uses it.

- It was never used. Upstream H616 DT has no Display Engine nodes and
  the rest of H616 display pipeline (TCON, HDMI, PHY) is not supported
  upstream yet, so the old binding never produced a working display.
  Vendor BSP kernels use a completely different DT structure and no
  other known DT consumer (U-Boot, *BSD, Zephyr, TF-A, ...) implements
  H616 display support. Only out of tree WIP patches used it and those
  are updated together with the kernel.

The driver will print an error, asking to update the device tree, when
the old binding is detected.

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
2.43.0


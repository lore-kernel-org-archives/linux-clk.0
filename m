Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723089;
	b=lazQUWUspJu/P0zp6FF4RXUd72Gy+GV6AS+hXiQ7XlKHvUV7DL8xrKXE4B8FWrY8P0Ar
	 5M4U6NI8L0zteeD03eCC19KZiBps3KZQ8x0QDfAb9ILg6+kaG0omXvz29u4VqJDxdenJq
	 iOOz5kNBHKCHpclp7D7TE8AwBv7LKBuJygPFioT0BjHSqhOzd3jwSYB2B2oQxf2pjlrGz
	 jtYTIuK8gX+fLqH3CHTNaMJG6LMS6wu+4HVIyzjzxzOHJu2PMWcWAKUmM5ncbIr58d9VE
	 A34ReuC0Q6YwOIqOerAQ+XXfw80OhWY9vcc94HhiwIGMvhiyPelU7bkCJopVsGBE0Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
	b=0Uxe9UORSXIv72cOYi53jnseAjfnB2nD/DDDLxo0WROJdu+YKGNfyPb0Cyrydzk3RwPU
	 Iril/LmD8DZi/JUpYuod0DlstLndL93bs/06sDYejhhmeYKDRvR/3bZYn+POzOhJmrQMx
	 dNK0xuUAnmd7UI9PNjN9Bx0cJS5CtcU20qiDGrjGnkDf9fYH/GWyQT50SMsnNFM8oP5xx
	 /ObnjMLRfcbU3x0AWz4HR307xwfnTQQmTv4+LHGvQ/PR6BQgv9gGJfDtBe76DDT1TZiEy
	 r/iYZ2sfUJDOtX8n9peWCplRMtQNpoDvyWoCl+TNk8lqFdSH+Oe/ep0yYuSbFNMjcBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+gyXwI8;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F92360A260E
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 06:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F92360A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+gyXwI8
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so11995745e9.1
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 22:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723088; x=1795327888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=Q+gyXwI8LIx7puLPN65lju54JGjmdSj9JiMh/HocFFarinZH4LA1OHXXAQEUVDkCmZ
         RDS8ZdDg00H0s9mcDoeYA/+f+x6lmRW6XxL52XpRXJrcq4cTaEFYT5s9uNDFmuSiF2m0
         UPn/OQs0MwB2BrJfpQ04fCK2Q87z6/N4RPTOmQ80ZoKpxKpios4af4eHOG69lVSXy0as
         VLo1+HMYqJADHUd8Hroxrhf5TmgDAn+Nb7DONC6xq7bMAtPkbfn5i6ykyu0FsvSS6hXg
         4ZAmST2jIYGXN2ROt77w82kJPbly6gEWRGMUQjv5oUKq2tuWlEvOtHs/l/m2JRY8RNr2
         8JQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723088; x=1795327888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=rDwpaZaHpNMJpqX53MTL2YR7nEjs9+CKAoNjTA4ZjmVWEoeBPyF7sbe0jTpgUChxVr
         8k9KrJi2HGokf5i1d89QlVe2DLSacZU8lcsqQPSMdNOYxVWFqTlzB83llBjH5wb6eSwt
         aMUbnykfd/I6ckQbpBNNoF/hDPpZv5xylpZFgSYWvkHjQ8w6nSRMuYVLeNGqyvaJpk1a
         2V2OuUrL9A6xjJjy2rQtrnb4ecOvv6i+j6p95gxGPQl1NvP/x7nPFae/Pn8H+nZZjJc6
         x07SZ6lxsQjNeU/RmCRM/NKoLBXPhWWyE49+ODM+Tt9H53Y3arysqqd+YCOl5U8hlJ72
         kN0A==
X-Forwarded-Encrypted: i=1; AL+hErGA0JISmh8VoF7wCF+rThkMuBpoBiCJA1XG76Tr6NvTwLE0rbvR8mvwsqecergjfx/q9RrENTrhcYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7T24YvcwxXFDMs03jkCBZ8r3trIqImmjOgsCnigFEEZ1NgOSz
	a5DMqGdfcdftiinNex0S0Oljuuw60lDbjTiQAPi0uqAy3JHxAqUqpSP5
X-Gm-Gg: AYBFou0/aZLrWmIAWRCMQ2+vS6PKFaaM73zMDydZX/lO12bUwYjwsq42mp2thWKCSHr
	5DKz+VUTUVHhPWJSD5zYiuVjU+mX7uV5aAJ/0VyBkJ6JImX2KvCXVOxkS23DBQuMZv4qDvuZYco
	pAK7KnT/VSLeYwXtmUxd4v5I6aHlBY/pLw4SipkUIeOMqqn+k5DW9zf1VdLN00HVjuqksX+PSvO
	TwM/0O6FTNgT92g8BYPzGlOm2cVptuAxtxzqwVYdmrg98bMaJa1Y0TJhEjo3CD41uDc6jHGZCrs
	jL5ExjoNy/vs5o10LyGKbJ0M7/AcaMU/osQN+0h2pMSOhnD5NGv0TD6RHxi4JcSbGjQKTULCkhb
	Ls+WROr5x/p6PnwJQhc2N0DultwDpfCL2RqcUCPZwoVpfoEeBExnPUNEkfGLNk1ZPjSEz7jXgEI
	mC4hd1mrFLHxjv0jSkuLIgJA5eodwfywoIOk1nOHahPCBgqwLJyuReR0UCqIrInOvvc42X7YYMS
	R4BJuSsdXXlO2Ab0ggyuygMJAqCr4jDETRLmsE9VDUNkiYNA0ZzYMwIekpgQK3CybMJIYqhwp08
	ray/k2ThmX27dKIJ36u8w5q1Dj4I8wv0k3ebR2tVpa3TLObkeIFdqpOiC6EKTjjhniWALBSPWPv
	z4gS1PpngrSYfzLT4VIBKUUXqELN4iOMDqHgOLXCTO2VnFkzzFcs8IAEWHKDZt5RxUGslbK08vt
	7L3YpJvg6i5d6PXf4xcWDcF6fhOdFm6E5CKX9J90KvTZDT1RNHIg2B9LyAT/TIIXM4cOJLPh+aO
	8n9aeYjh3kWuQ==
X-Received: by 2002:a05:600c:34d6:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4bb559f609cmr135894335e9.3.1794723087765;
        Sat, 14 Nov 2026 22:11:27 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:27 -0800 (PST)
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
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 5/8] dt-bindings: display: allwinner: Add DE33 planes
Date: Sun, 15 Nov 2026 07:10:59 +0100
Message-ID: <20261115061102.229680-6-jernej.skrabec@gmail.com>
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

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../allwinner,sun50i-h616-de33-planes.yaml    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
new file mode 100644
index 000000000000..0a07cb8a5f79
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H616 Display Engine 3.3 planes
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description:
+  Display Engine 3.3 planes are independent of mixers, contrary to
+  previous generations of Display Engine. Planes can be assigned to
+  mixers independently and even dynamically during runtime.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun50i-h616-de33-planes
+
+  reg:
+    maxItems: 1
+
+  allwinner,plane-mapping:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle of the device responsible for assigning (mapping) planes
+      between mixers.
+
+required:
+  - compatible
+  - reg
+  - allwinner,plane-mapping
+
+additionalProperties: false
+
+examples:
+  - |
+    planes: planes@100000 {
+        compatible = "allwinner,sun50i-h616-de33-planes";
+        reg = <0x100000 0x180000>;
+        allwinner,plane-mapping = <&display_clocks>;
+    };
+
+...
-- 
2.43.0


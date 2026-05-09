Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0B23C9EF4
	for <linux-clk@vger.kernel.org>; Sat,  9 May 2026 19:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353231; cv=none; b=LpXubxWvUyQAqZY4mAtbmNfPaN7Bkp/o682Rl3UxdDCQOnZcGK0hG+BMKPRfo+tIYspd6DMiT/nykMAPYwYzaGn1N0sJDLcIOA9jisheVnX1kddlGVz61+ADHyHV+ArOn5tIWoU2CKp5WO5ma8GNNYl4050To6G4XZgnhkXjuEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353231; c=relaxed/simple;
	bh=qJI1RKZ4tm1AtCPX5qv4vqS8PMeax9pf5Xalvtfc+kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOlQuzR/3z+OdGz3VwrK5EoyE4ZrHq/JOxjphVVWDKxeE0Yt5s6orEckcXIE68KRzc/6+l1MchVifDiWewD5EuNoCIO5wMH6GrpuhObooyRrqMqr9h6xlM14Oq6hE5evVx5oAhbB39tmXzuQBEMmjvBkiaoLphFFVvUUX5MQFEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p62lJF0l; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p62lJF0l"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44c350a5b87so1841935f8f.3
        for <linux-clk@vger.kernel.org>; Sat, 09 May 2026 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353227; x=1778958027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfXcef4xsSF9aS7bEgNrFEzEGtCwPTxISiBE2oLRk0A=;
        b=p62lJF0lL7y+rQErKPx7zvIF6c3yF+rcmWQUK1thqj+q2NH74QCHJHDEm5AMCEQnEx
         j785sxjQWaxBhWENcASScHuY+PqfDgvcldoLa6wMyGsOuRWlh8kxI5PCM6AUiNUdzlSZ
         mFsr94jBLOFhmMJEaFIA+7lRsm3k19RgANMh7burq6psnS0hiV3robl284S6Af8Vi44K
         GC13HkmZlJSTV2UdIpzW4Om6DJbCm0sd58CoOi+K4Wn1OQJJEb0YkKx1hnPptdm3aGAs
         Y38Xx43+bPdYbeKxSMW5mUkzVcXQSTVC6dkhS7fxVUCNvhXHnRRKRf1j9V8CqI8UAtHj
         1PNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353227; x=1778958027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zfXcef4xsSF9aS7bEgNrFEzEGtCwPTxISiBE2oLRk0A=;
        b=SBL1kXzLPFxQNSZMDQ6Em0LHoPeKdtZwaF2F5d9M+rUHQlyh24jlEK4GDSg+bKGM2s
         ksLxwUYUW1lo/H4Q5t3S56CCaiRLx16eUQXFPgJV7vT1lZf0hGLaY4mX+YkbjuRe9kUJ
         ONXZZ7UosRzCEzuzqp1dG40mv/9VdsOlzdlDTnrLkjoOduSvda/JcsMJHzV36aDoM+kj
         IwkBScvuTsIw47y0YaNsoyeQf5lq0kmVnvxVOGwdK4rV9wqegISUFkZwiNVwCmZUgouk
         FUa37Z1P5aw9Di8M9aEiFvnu82/SFqxbPESsJOIUm/DB1NHkCop8AcYWuOkfMTBILeny
         X2vw==
X-Forwarded-Encrypted: i=1; AFNElJ8jb1QvkQpsue5NxV8sY6uzRmk0PUEgsktUzpjlWcGzzqm/SBNbQbqZvKM5sb3VLj8VorqItmCLtCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU6rH10qN2NzWKgYtZc5QHk+86q+sbMusFEgC+qLujtaFv38rK
	hHLaBlYdTtibvZZklQK9+7mz+Ofb/1RaT2Ty2Bg3HFr2I+2qt+D6f3iN
X-Gm-Gg: Acq92OH/p3XF1XVwFPohSmrmGdLD+OCk6ukLHEf3zPxVO5v1I1MKiBXCgSQjuDZTafe
	Xuzi4ndjiHfyyogFnfA41f8EG828eGy3hXbP8rPwV4jLQP/e+C1RLv9CrVMg48mBJDz4eBQG1U/
	13Ecg6vX9yaDet3lXcEtrQRVIrLFAoFUTc/rC1jVVg7N9GNtSXWeIU2RRXPVCpwbaXbSYs73oxz
	hjGtiwUwq6DxZQts1Ry0bB0A9qGOVsS+BydMvenAACeC4OzorxV6JteHOB4a+ItdTX5kN2D5sa3
	JF1knrl5reKFHMcLfDgeAV2oAn7cL+nkQ/d3PaLm/9KlW+MmxZkfKQP0iFc9jSkrwA8vqsPkBBJ
	krwjuIWQRdEt5Zc2hY+aVksaW8UzDzMUBtt8VYU/jSFOh/dS2MrxgeM5h+bg4lXb9Apdn0jIwxU
	vURAutlTCsvnC2Ukj82N+elYMFEO2cY0ThhG/RvtSdYGE75PPxJul1rROQ8TYn5STDwctDHxiMc
	df6YQ==
X-Received: by 2002:a05:6000:2dc6:b0:439:c661:3245 with SMTP id ffacd0b85a97d-4515cc31e43mr28677269f8f.34.1778353227339;
        Sat, 09 May 2026 12:00:27 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:27 -0700 (PDT)
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
Subject: [PATCH v2 5/8] dt-bindings: display: allwinner: Add DE33 planes
Date: Sat,  9 May 2026 21:00:12 +0200
Message-ID: <20260509190015.79086-6-jernej.skrabec@siol.net>
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

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- dropped | for description
- better description for allwinner,plane-mapping

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
2.54.0


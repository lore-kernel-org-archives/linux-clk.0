Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819353002A7
	for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763216062; cv=none; b=KjQ4ajDSXxfJ1NLodYyV8VSC5RxgiJTmt2SBm55SlrJX6pAMrAN+y3ZDgX9W8O49kgu/1QwwiDmh2XjdjTZZwAoQ28TWfQ8fojHA7LAQd7apykED+Pq04vRkyuFDk4n1xeODGL2Lpt8kYX+XueuKD2viXlXL+G/tTvnVFF+Vw9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763216062; c=relaxed/simple;
	bh=7MNfMigmcUs3aZfsMvXzfgbfkCinah3cgeYsqRMUe1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bVbP/VwR2vYvxK1iraetrevXhOz1B+GTq8z6czI60aSO1F9YY8nxw7ow2PWSw8b/mxFidc5VTVb0QzpehvYUL7ONrnbklYZKeNdNsGB69c3qHmu4CwCuLgEELgsbl9NKWWLKuv0ktfBu9I9g87FyX6+3jk5immH/YA/hfx0k9zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hi7NiGvz; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hi7NiGvz"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b73875aa527so32897766b.3
        for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 06:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216059; x=1763820859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JphR/yfHrqeoxGCFuZ74qbjmgj/bPrWp2+gxF4BO3oE=;
        b=Hi7NiGvzdjeiDhugfarIPnHjD5eifjUWgEaFTh12RB8lT7BCZ7DF+E3wVnMrK+45Mt
         hnAB1KUARFHzI+39TASRs/jeBR6xo8G4KC2nqQPYnO9WPKqrdLuvpqILYnfUaNZxbz7K
         asy5iMY4N6pQKrGWSiyVSeXBJSQx9s5y94kxJUIE87DPbJm8vEwiB+OUHTj5q0Si8qfH
         xjnG3juO3jGs8/4fDaM3dYRfOXgkbqlQ+vYZpWEbMVyKKXepNb8Poyj2T7TZJGdfJaZg
         8TbHYOAHtmcwygzaL6F3gCy11cpdibqvLDns1PGo7/r8hs29U1nKSxj6pByrf5G1N6Hl
         LE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216059; x=1763820859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JphR/yfHrqeoxGCFuZ74qbjmgj/bPrWp2+gxF4BO3oE=;
        b=SX8n25YFGSzg1xoNLOvm+XeMhKXD+FuXCKqoDZDneQ3VU4AgtdSnLg3LZdwj5rgRAz
         q3DDV0Qu9IbdrCqvy23yREQb4SkVEoKaTFQqXz1W88hY9tpcWcjXAsTD1jGPtevzl/5P
         TWJtFKexs1RIR6bFWch4qgkj9A9wMC4uLa5SoGQJIXBV7n9f3w5yMXevc3wk/VcsrrAI
         O9OFiyf1WuulwYNmtKLOxOMR5f/lfb5umVLjczp/FKcawmE2Ks79BLjqjkPZql00lmS/
         enSImze/HGdhvsINPOQdbZtRTMucerY2ERSVpfhK4UKyo7izQi+afmVt5RR/2qt6dN6g
         hmpg==
X-Forwarded-Encrypted: i=1; AJvYcCX7xeQ6WgpDAw2NEAJ75rNGUUevy4Z6oTlnY6KOvyGNu3b1ZuLv0kECldtZFcR6hDOOpilUOptgHD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuIDtQzY+3CkbAOvoq5iIiEQBrU7vzSjL1d6B1mPDGTwqxljHG
	IPxVyoB9GPpJqWsYGOPr1XP+Pebm+KWOhVVho93wrnHMUBoaTyTjQ3aq
X-Gm-Gg: ASbGncvECglWsChvw8EbcbeW05LvabOcWG7yiOKQliCYzaCMiWqHiLQUArSItF7yqcX
	1e+IMrIMQQZ6JqtienVriizwZV9clcksq1+ehY2aLSf0nJGdpBPeHfAdWX1Fk1VtSBgefZAfdpb
	abumn0wrupo7nHp/fD2Ydnuy6KJ1uIzguouN+XvAYgFx8hDXQvXS/nSi5k/zvTZ21pSKu2Gm/6R
	nVYeWvwmrF4JDGEvVTS0M2deDAjxzqI2dQORaeQkaUlwAXIBy2SN7Ph+13m8Saf0rVVJXC8LyWQ
	FO73LJoZe6NLzuK6t+tsXUKR922InSWkn5go489D7OiMKHQXRhud4uZKSxCgQg0DZ1B8RXZYaIt
	JgX9Oj01HWInCuCWf+mMD3iU5erbdsNzF5cASeS79RnuQpjhfrhgwqqH4yN1I5Y9SdiLkljvkL2
	H03Oj/bykQ+XR/t/eJi1TOtfhq2TtryiD1IgTJsBnECF3E8g==
X-Google-Smtp-Source: AGHT+IF/NKVfiJ7TrqEh+PcUiDYYnExZ1hICJ4keAyez444tuP7vZ12VBd4zl4CNGFC7PXxBkD/1Pw==
X-Received: by 2002:a17:906:7304:b0:b72:a899:168d with SMTP id a640c23a62f3a-b73677edba0mr706079866b.13.1763216058665;
        Sat, 15 Nov 2025 06:14:18 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:18 -0800 (PST)
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
Subject: [PATCH 4/7] dt-bindings: display: allwinner: Add DE33 planes
Date: Sat, 15 Nov 2025 15:13:44 +0100
Message-ID: <20251115141347.13087-5-jernej.skrabec@gmail.com>
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

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
new file mode 100644
index 000000000000..801e5068a6b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
@@ -0,0 +1,44 @@
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
+description: |
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
+    description: Phandle of Display Engine clock node
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
2.51.2


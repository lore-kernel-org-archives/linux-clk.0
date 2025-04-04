Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155C4B67A
	for <linux-clk@vger.kernel.org>; Fri,  4 Apr 2025 01:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743731121; cv=none; b=E9q22RonKT9/C1jcmu8bK027gX1yLto8lkuq2dv/2whFJwefYCrrGoyGyW1+HVeGp8mO5VQgBetnv9vEZka6/pzx8B1TpWlyoAhBYRc9f3iXa+NW+oCj2xJ04At2fyuHpYABmOxxOw6JOcEyLLkMghtlzXaTidZD1e3ogZu8r/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743731121; c=relaxed/simple;
	bh=VtZFzV4SFM7hxS9whoKifK0cWBFHUo7gxrtPQ7C+MbU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f9Wcmv6feYGbfVG8+6432RYp7oY2gtXIiWdcgm/aE8LSXgTGLJRsG6feom9qa0YrZlhDWjROERwPRI69y341y8DjNIMtqHvVhhV5EMmBVXSnDh//g0mqUYNXRcCZkcC7NME2CLtnTHK/0h6nYa5CHVIwIp0WK+pUNJiYM+jfO0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UERdeM19; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UERdeM19"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22548a28d0cso20330015ad.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 18:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743731118; x=1744335918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vd/Kv7YAIdyn43HTlxRPFm7Eme+lU7QzjnIMeLAoJAo=;
        b=UERdeM19yodduWAJiQG1W4Jo1XGOmLCwiDuKNTJovixwfx0tCzuQmKTPb9peNYO8Uj
         8UDGUUcHYQvrqVce2DrxUveRZh1NJRjY4IOQ8l/zEckW9cq3UUnHFfZ1W5GNSD7mmfeY
         gDmOPnanViXwXHmve4ZG7mnQg6uCXdm73SL4ylpFp+6Vzm0W56uQ+IOEO5Of1UogwKo1
         aiN/CIfZjTJ4Yp5Fps+MltjVnDh3DY+mngrP8V5cAZ+lDGLmq7rIG4yj40N6Y3cAQemo
         62tcwzHt6VkNCG67DIBwjIJHf6Cjo3KssXu6Io5t+mrZ6FfQrlCaJDfJOzoi0k7npDH2
         a7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743731118; x=1744335918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vd/Kv7YAIdyn43HTlxRPFm7Eme+lU7QzjnIMeLAoJAo=;
        b=R3Fr1TlfAOQQIR9w+QIXV5EXPSutOkptvgFPpPu1Byd3qqR+GgYzUBrukc8Ch/A7Qc
         cz+WFB9ZEM0TIxrNxjuZD/Q2woinzReNYwE4jhJiGU98JFoqAxswjRoK4n5ZeT6kremE
         qXLEQgdljn4G98JsLfvyWB7EgxqUBE7nX08UhMtIfW4OCnCnTZefIzreZ4G8Tg1ltkaY
         I3pyuYenpsE6qMK8hSU9L6nE9hFT3aMjdCm3KolemyNVbXSWKXG8uh/fkNBqEQbpFCxF
         xNpEm9sUoRoG5M0//K8CI+CBUvFJ2JXtMm0Coa/EjcUGAzzaAPOdu6cl7xP3PX+94io5
         pnOw==
X-Forwarded-Encrypted: i=1; AJvYcCWk/Z1K0GmI+vWq3heQDhzJKZxSgflc884YZI1cJIxjy4mqX8dD60pMHkrCnrb8aMf6carXetIb8ek=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcAov9HtppbRn8bGXr6QC5a7uD+KX+CacbyGUnbrs2EdB7Psth
	yMbkifg1IedKblaxYoaxjNJ0ncd1cxB9cODGsRFQ1+HdAmVP7Oxm9XNjLiiAZ/U=
X-Gm-Gg: ASbGnct85MFwAwyYl4SlOu49Q6R6dnP+Din1J50mqKDsP6ToDCVmwUlIE4hhRFO1v/U
	sqcEzMgn+TFeJUAqPDRgqR2CPfpeVCd16Y32G9zCyrKwCuiU3SZ1V5yxmo5u0mb5mAXoGLPN4ca
	ZxzOd+Uxv6GjbyOrCZ6vvZeWyF0WpnLU6/UAdn7Vgq6Dcb/AjvVzCbD12gv0nVWvNU3WhRf8qGS
	qn0bCVrLTB/+nFKwwro3Z3o+flZHLCZG927/FjSnXtZ7+94vXYycrVh5xzjbi+uCGbEp037GrLc
	Te5ZZ4d5mVJr83Bc9Bm0CviNDfeZYFWoFYFgmkjC8wI9+QwR6vsBe3lQc5CgD4GEahTycRgZn7o
	w4u5G9Is=
X-Google-Smtp-Source: AGHT+IGHo9ZuBB0qJ1rexiUBkU1zGy+UOTRILsGjezQ/KXhzycsHA6LVyLjVtGW5XbFbwRWLRWJOzw==
X-Received: by 2002:a17:902:d2c1:b0:21f:6bda:e492 with SMTP id d9443c01a7336-22a8a8b82f1mr16901115ad.35.1743731118385;
        Thu, 03 Apr 2025 18:45:18 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e3184sm2195304b3a.160.2025.04.03.18.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 18:45:17 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: clock: ti: Convert to yaml
Date: Thu,  3 Apr 2025 18:44:58 -0700
Message-Id: <20250404014500.2789830-3-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404014500.2789830-1-sbellary@baylibre.com>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This binding doesn't define a new clock binding type,
it is used to group the existing clock nodes under the hardware hierarchy.

As this is not a provider clock, remove #clock-cells and
clock-output-names properties.
Though few clockdomain nodes in the dts use these properties,
we are not fixing dts here.
Clean up the example to meet the current standards.

Add the creator of the original binding as a maintainer.

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 .../bindings/clock/ti/clockdomain.txt         | 25 ------------
 .../bindings/clock/ti/ti,clockdomain.yaml     | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/clockdomain.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti/clockdomain.txt b/Documentation/devicetree/bindings/clock/ti/clockdomain.txt
deleted file mode 100644
index edf0b5d42768..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/clockdomain.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Binding for Texas Instruments clockdomain.
-
-This binding uses the common clock binding[1] in consumer role.
-Every clock on TI SoC belongs to one clockdomain, but software
-only needs this information for specific clocks which require
-their parent clockdomain to be controlled when the clock is
-enabled/disabled. This binding doesn't define a new clock
-binding type, it is used to group existing clock nodes under
-hardware hierarchy.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "ti,clockdomain"
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : link phandles of clocks within this domain
-
-Optional properties:
-- clock-output-names : from common clock binding.
-
-Examples:
-	dss_clkdm: dss_clkdm {
-		compatible = "ti,clockdomain";
-		clocks = <&dss1_alwon_fck_3430es2>, <&dss_ick_3430es2>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml b/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
new file mode 100644
index 000000000000..2bae2a0f6318
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,clockdomain.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI clock domain
+
+maintainers:
+  - Tero Kristo <kristo@kernel.org>
+  - Sukrut Bellary <sbellary@baylibre.com>
+
+description: |
+  Every clock on TI SoC belongs to one clockdomain. For specific clocks, the
+  parent clockdomain has to be controlled when the clock is enabled/disabled.
+  This binding doesn't define a new clock binding type, it is used to group
+  the existing clock nodes under hardware hierarchy.
+
+properties:
+  compatible:
+    const: ti,clockdomain
+
+  clocks:
+    description:
+      Clocks within this domain
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    l3init_clkdm: l3init_clkdm {
+        compatible = "ti,clockdomain";
+        clocks = <&dpll_usb_ck>;
+    };
-- 
2.34.1


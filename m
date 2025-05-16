Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF11122CBE8
	for <linux-clk@vger.kernel.org>; Fri, 16 May 2025 08:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383385; cv=none; b=at9VZ2X17WrJeI5Vwb1z4rwaUZ0siznx7IMr7cvvSp10vqSTPYoSk4Dy6WByXz4KlGvvexcjZGlQqjp0WITtOJOwQy4jhq2ME0bwVXiAPOhtN3Mf/hYYg8QwCSw2GCNFcj47/jDkkQRKnoGbS2J5sJvjQzaMHdTM1fZiqLCzEnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383385; c=relaxed/simple;
	bh=cpUqKYUQ6k913kXB8ZWWjaMDA8Rng+YG4RjU2UCgLVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YD4ZvXARoBj0CUzIWF1YPnMZv+3Ud21kXW1yT2f2+xA8y8n7jk26hFg1qR2nBh/4Qqk0Ovvba5mzYdmfvtd02ZI+xNDi/YFOZBfV/iy0aq0msLkt7MSo6zbYVBuakN2OnByt6D7KyWq5Q5qwB2+9RPcY9UlRGdH5kP/EfouR9IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uCM2ThJ0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uCM2ThJ0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22fb7659866so22023745ad.1
        for <linux-clk@vger.kernel.org>; Fri, 16 May 2025 01:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747383382; x=1747988182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40VPVaeJSfBfM6eAyXRAlXX6whDz/F63k+f+Fs0Phuc=;
        b=uCM2ThJ0MvtPcdYNxaeLSlTNBGSd5lwncoHXrXDG1ApxrDIHsQMGqbctksXJ5FwEU1
         bEDbxngvVdjBzhsYDyZfvsb1SgFPh0P+asrmeNaFS8zB/09nYifQFeCMW17vtDxqq9vg
         cCd+OYjFTnXZBeyQAoAGHKpEYQRe/dAUaZbNYT1xCBXkQwwEuUdzSaYqFALYPWgQ0ZeR
         b6dsdfhgY2efRgVMWGHJQ58+/EXHKPmkJiCPdI78RX9F9wYgIsvwIKCfVLA327NCSS4b
         +Ze+UtIb8THezI6iV9YhNlXxEVD6i4UfHQn8QsUopULOsIhazmkwIWAIcNVTyW5k606U
         GDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383382; x=1747988182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40VPVaeJSfBfM6eAyXRAlXX6whDz/F63k+f+Fs0Phuc=;
        b=M/2Gjzn6+zNhM34hv3aown5QBOOqhWa/lpv3FFUBdHWsCCZdth627CWjM/VaaDTcnw
         TAH1NYCD+srQ9pjHwgVMZWb1s990jh4mnjE1WjoG7mQdmFird2cmcGraazI+8PYPpO11
         BNP9qFmqGsihqZTkGxjO8zcgiGaYHoN4484E/dBxWxPI0FJqKkApKms96H1jQRyJD603
         lN4rOODbcO/2N7YItfah30+Ha18oqzjeAaw3zNjYkLYQZD3FRYNZxeWTKA+sw7kprs82
         JdwwqHOXijgEhAE3Xj8oVJjVBvNITRwi3AnxffotDOOOE+4b+Hrjb4uOiK+jxEcUU6L+
         AN4A==
X-Forwarded-Encrypted: i=1; AJvYcCV31tmqYaEGmpf5/r5TuMF3KwEigijTSywK5kQ9xaH0Qfk6dyhbrzlrAiuHBl+/gmfsxMH/QWelQnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzANKwaL0u5CRdqVa1QjvnisZBgVriF2TYUP7HVGBZtljuq7A+s
	mhwbblGtY+6IyUvfBwpYVI6yv8I9s8EpC/FPcS7Xi2aXKLsUWpMv3MXFgcLOGpcLPsk=
X-Gm-Gg: ASbGnct2FuDWn1LYQtuzHU6N+DQ2UWDVPJnF8jcqcpa1TRarlDriPM1sD3XDhEEy56K
	fDBzBiT9XUndA9xpINz+QauDNNbXMgnP3lCa3VOO9O9XCuaAwQxGX3ZbTJI0VvOMojDdWcfNw/F
	Nwrmj0qXCRPY8tLZMZcujCyj6brQVtDyXoZQvsqTPHvquwtLpO5MYLdVNg4LeKN91gfKgh/aXQn
	Krc5VJD+nkfWa9foQOdtJvMOISdLIo3xnOojnLXBwGu4p6muyiZZEI7QSut4qmICNyAr3xevDmA
	rfVDNOQtsKd9zQwne+df3aBv4Z5pPSDeSMBIJvXo6PrOtIbJqbgt1VkDK1UQqq44PEheYxO7gT1
	C/ehgHMjPqujZZGrDQYXUmCWj
X-Google-Smtp-Source: AGHT+IHrsc4RqgKORV3i9Dji1Vp8VQnQDZZQ+DfYtbmsiyBWdOG6WlpWNC21iMRbNCbHQrv4bmsVwg==
X-Received: by 2002:a17:903:320d:b0:224:1781:a947 with SMTP id d9443c01a7336-231de36ba3cmr19379655ad.21.1747383382121;
        Fri, 16 May 2025 01:16:22 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97801sm9397695ad.133.2025.05.16.01.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:16:21 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: clock: ti: Convert autoidle binding to yaml
Date: Fri, 16 May 2025 01:16:10 -0700
Message-Id: <20250516081612.767559-2-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516081612.767559-1-sbellary@baylibre.com>
References: <20250516081612.767559-1-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Autoidle clock is not an individual clock; it is always a derivate of some
basic clock like a gate, divider, or fixed-factor. This binding will be
referred in ti,divider-clock.yaml, and ti,fixed-factor-clock.yaml.

As all clocks don't support the autoidle feature e.g.,
in DRA77xx/AM57xx[1], dpll_abe_x2* and dpll_per_x2 don't have
autoidle, remove required properties from the binding.

Add the creator of the original binding as a maintainer.

[1] https://www.ti.com/lit/ug/spruhz6l/spruhz6l.pdf

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 .../devicetree/bindings/clock/ti/autoidle.txt | 37 -------------------
 .../bindings/clock/ti/ti,autoidle.yaml        | 34 +++++++++++++++++
 2 files changed, 34 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/autoidle.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti/autoidle.txt b/Documentation/devicetree/bindings/clock/ti/autoidle.txt
deleted file mode 100644
index 05645a10a9e3..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/autoidle.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Binding for Texas Instruments autoidle clock.
-
-This binding uses the common clock binding[1]. It assumes a register mapped
-clock which can be put to idle automatically by hardware based on the usage
-and a configuration bit setting. Autoidle clock is never an individual
-clock, it is always a derivative of some basic clock like a gate, divider,
-or fixed-factor.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- reg : offset for the register controlling the autoidle
-- ti,autoidle-shift : bit shift of the autoidle enable bit
-- ti,invert-autoidle-bit : autoidle is enabled by setting the bit to 0
-
-Examples:
-	dpll_core_m4_ck: dpll_core_m4_ck {
-		#clock-cells = <0>;
-		compatible = "ti,divider-clock";
-		clocks = <&dpll_core_x2_ck>;
-		ti,max-div = <31>;
-		ti,autoidle-shift = <8>;
-		reg = <0x2d38>;
-		ti,index-starts-at-one;
-		ti,invert-autoidle-bit;
-	};
-
-	dpll_usb_clkdcoldo_ck: dpll_usb_clkdcoldo_ck {
-		#clock-cells = <0>;
-		compatible = "ti,fixed-factor-clock";
-		clocks = <&dpll_usb_ck>;
-		ti,clock-div = <1>;
-		ti,autoidle-shift = <8>;
-		reg = <0x01b4>;
-		ti,clock-mult = <1>;
-		ti,invert-autoidle-bit;
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml b/Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml
new file mode 100644
index 000000000000..ed1bf182b64d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,autoidle.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI autoidle clock
+
+maintainers:
+  - Tero Kristo <kristo@kernel.org>
+  - Sukrut Bellary <sbellary@baylibre.com>
+
+description:
+  Some clocks in TI SoC support the autoidle feature. These properties are
+  applicable only if the clock supports autoidle feature. It assumes a register
+  mapped clock which can be put to idle automatically by hardware based on
+  usage and configuration bit setting. Autoidle clock is never an individual
+  clock, it is always a derivative of some basic clock like a gate, divider, or
+  fixed-factor.
+
+properties:
+  ti,autoidle-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      bit shift of the autoidle enable bit for the clock
+    maximum: 31
+    default: 0
+
+  ti,invert-autoidle-bit:
+    type: boolean
+    description:
+      autoidle is enabled by setting the bit to 0
+
+additionalProperties: true
-- 
2.34.1


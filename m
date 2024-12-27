Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8B81FA82B
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 16:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318681; cv=none; b=TfKLvAxWqNvne2djJ+nP33h6mpYJx8sPnw5XkiT7Lqc4Dt0rCDVQu+EebVluWYqylPifHsjvsb7fWhR6fDQGSiMdyuBlk2rl9Wc0qF8f35OxN24n4Q3jB2YTTInCXYytwy+pEBm9v0/wvrrA12G6JsIYmONEukIwTuJDxSqnlWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318681; c=relaxed/simple;
	bh=bPw6sBKo42nWd35aKTqsGLLoGTjQzArJVhFrICMWSWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAf18EmZTodFoH2jl+d5DTl1i8H9XJ48i0TkK/yb+sNNtRLq8UQeJfWuHnPKxCABTaVkxvCwIVA0AlNVlb1I3JbtI/Fv/unFuBimi9IMTKvoysvrnOzIbrN4RRh3T965bKTdbP8HkDvzwy+IkYDFo638OmeZNLMCsv8b1+27QQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GU/zjL0L; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GU/zjL0L"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3e829ff44so15360680a12.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 08:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318677; x=1735923477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqUbS4QFbQjY9acz5KfEUvUnduu2cjIu1TltoLZFYZg=;
        b=GU/zjL0LvuP5aIzubNe/y+WEZeClLzFlfNQPAwIRuuqsBH4szEE0zanQqoPLSW24SF
         WSeXCfY0Oba2DHTK0D761iNAKDndzWFof7dE5/wFzc7gtZ85ixDtl9PcZKoj3SE27ej+
         Ody5Ew8ImtwP1wQ1HQQSkZIomKU1dhPT+iF44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318677; x=1735923477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqUbS4QFbQjY9acz5KfEUvUnduu2cjIu1TltoLZFYZg=;
        b=RikH1HIkgUcbLEBxu+6zmSteUqIF7cBjWI6A3BtyJdRac9BuJTYVtVgsy46rYEUWxk
         duLIuD5uy9/Ba7ZU7kcxt6D9AcnmB2Y/NqhGEEoPyfdfMfUzT1Jyyp1YOHUE80CCuF46
         82PAmZVk0eYTelv6XaHRwiYGS/ldQOEmkLf5hjK3N2juZsBAL5tqTtqkkO0jbZSMHbaw
         cPLNo+suPwHMPUltri484DjE+t7o8FuVYT7oUZYZ48B2HXCmlpRSpRNCs8Wyl1y29byd
         oQjM+b7WJAeKTYzJumvY3FDp06RWopBMk1LCBvVNhaZvwKhBB4jiHt9WK65JvN04zOEw
         F7Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVxmu5jR9kzQ/4ZIvZ9vJxLchK1N/KOcmkiD3sxNA/tB7AvRapacXCXQ8sJ7LDHjbJS6yvH0g8LLRg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc2+aVUwHcMLFEfUm2LvcQLBGFRfs0mVfzjwukmF0okdS6Toc6
	vH0NruNoiq27DLhz5ki7xfhG1UFtgNftMCUtOILhtYSx3myU8b5+HQFjv9fecqM=
X-Gm-Gg: ASbGncu+uHSXpA0G3P46VcapM8EkXgz1omKf1W9WG5XJSBZfY0QlpqftQZxc+z8S8lD
	iXyYEyxEkrUbEcsHcQVJXp8P0cceYDWnzYTE/fXmyQ0p9thvjb08tPJJwH+ACLCqDs2XuwQNAVc
	UfQeO9QbBiZTpjtkR6xCwSUq6b0Nmdb4Qy49M34D+zH/ipFuXV6kCFwzXGddXhQZsVvs1KGIULf
	O4yM0AeGFzshY9yOvYsdENEWJzmugQ9MlfcdX5gbRQlZc1p7KI56pDS4ezRs5NO1h8rGWHcEfLq
	IcqIvLQR0G88Y1bYrPWQQA==
X-Google-Smtp-Source: AGHT+IHElfZi3i1uNBnK2xJqGFXo7qQDmANxsj6O+9wLFu70VpPDFGks7oNgpbJku7AT+TTCB0jLHA==
X-Received: by 2002:a05:6402:2346:b0:5d8:17da:dcf0 with SMTP id 4fb4d7f45d1cf-5d81e523027mr20469463a12.4.1735318677486;
        Fri, 27 Dec 2024 08:57:57 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v7 21/23] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Fri, 27 Dec 2024 17:56:24 +0100
Message-ID: <20241227165719.3902388-22-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The addition of DT bindings for enabling and tuning spread spectrum
clocking generation can be applied specifically to the PLLs.

The "" value for the fsl,ssc-method property is specifically intended to
specify a "no SSC" case, as in the example, when you don't want to
configure spread spectrum for one of the PLLs, thus avoiding the use of
a method that would only make sense if SSC were being set.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v7:
- List the PLLs to strictly define the setup order for each of the
  added properties
- Drop maxItems from "fsl,ssc-modfreq-hz" and "fsl,ssc-modrate-percent"
  properties
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v6:
- Improve the commit message
- change minItems from 7 to 1 for all the ssc properties added
- change maxItems from 10 to 4 for alle the ssc properties added
- update the DTS example

Changes in v4:
- Drop "fsl,ssc-clocks" property. The other added properties now refer
  to the clock list.
- Updated minItems and maxItems of
  - clocks
  - clock-names
  - fsl,ssc-modfreq-hz
  - fsl,ssc-modrate-percent
  - fsl,ssc-modmethod
- Updated the dts examples

Changes in v3:
- Added in v3
- The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
  imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
  indeed more or less a syscon, so it represents a memory area
  accessible by ccm (imx8m-clock.yaml) to setup the PLLs.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

 .../bindings/clock/imx8m-clock.yaml           | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index eb2e6e702de9..76040ee9cd5c 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -50,6 +50,46 @@ properties:
       along with the oscillators, are used to generate the clocks for
       the on-chip peripherals.
 
+  fsl,ssc-modfreq-hz:
+    description:
+      The values of modulation frequency (Hz unit) for each clock
+      supporting spread spectrum.
+    minItems: 1
+    items:
+      - description: audio_pll1
+      - description: audio_pll2
+      - description: dram_pll
+      - description: video_pll
+
+  fsl,ssc-modrate-percent:
+    description:
+      The percentage values of modulation rate for each clock
+      supporting spread spectrum.
+    minItems: 1
+    items:
+      - description: audio_pll1
+      - description: audio_pll2
+      - description: dram_pll
+      - description: video_pll
+
+  fsl,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      The modulation techniques for each clock supporting spread
+      spectrum in this order::
+      - audio_pll1
+      - audio_pll2
+      - dram_pll
+      - video_pll
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - ""
+        - down-spread
+        - up-spread
+        - center-spread
+
 required:
   - compatible
   - reg
@@ -84,6 +124,10 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+        fsl,ssc-modfreq-hz: false
+        fsl,ssc-modrate-percent: false
+        fsl,ssc-modmethod: false
+
     else:
       properties:
         clocks:
@@ -133,6 +177,9 @@ examples:
                       "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
                       "dram_pll", "video_pll";
         fsl,anatop = <&anatop>;
+        fsl,ssc-modfreq-hz = <6818>, <0>, <0>, <2419>;
+        fsl,ssc-modrate-percent = <3>, <0>, <0>, <7>;
+        fsl,ssc-modmethod = "down-spread", "", "", "center-spread";
     };
 
   - |
-- 
2.43.0


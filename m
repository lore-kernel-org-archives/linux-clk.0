Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5D1DDA3A
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 09:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883973; cv=none; b=P86+oCICsixWburRAbFMh37hgQ7zg0QspSAZsqkEWoHYxSM/IBsTtBieLEhh66d+hRqU8VDJCpmZ+MXLd2PkNmyb8hYX+obOzleZjDtY7Y/oacZvBUTU5FFHoJXFP2jnhsYgP3lKGnUtIaoPXjPBihf4VGJEDN4kDvpDRfLemC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883973; c=relaxed/simple;
	bh=zSVT1VPPzMwphatbGwv5SHnw+nnYzwL4oiYG0Aw/df8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PiReJBQLpnvm7iCsy/z2AtsD1d9hcpB8JExYyQgj3jcspi4+cHPKxVS8zew43k1CFMPOCeKUzokJaxpslVEzGt7n8sp7ck72DHMpZ9KtKvvfZtXX24xEnQRsp1E5uXVRhBgl+HdEj7k5fzEHw+zcrob+ZWEnrzHbmw+WTSu4Ei8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=C7KL3aUV; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="C7KL3aUV"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9eaaab29bcso425216566b.2
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 01:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730883970; x=1731488770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrNsJPPKHO5Lk6rFyymH1MtDjL//mpL7mQleFPtlyis=;
        b=C7KL3aUVanbJnZ6jZMV/2blywshqT8OscQIzN5c4yCiDVTP4FULpMU6mHXJLf9q+t6
         CV+07NXh7NUViKoiEZ5eh06YiYr+mPKEHoZVKo7VwvjuukK2g3FWbbAjROpEhlyxV6pF
         4BokP7Pkztjtey7BQoDKJUyy7ZuuQF91eLmyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883970; x=1731488770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrNsJPPKHO5Lk6rFyymH1MtDjL//mpL7mQleFPtlyis=;
        b=C16f34NgbGg8t7wry8q1YVU5tWBGp0DpVMqZ5sLWR/Wayu6KRKpXbvK9dkM2PDhKwI
         p0QyvYOJycgSHQMLfZAuVQ96WlzRDZCzM1Xapj3vXWw6dVjRswbvvs4QoDRpsFSeJMXu
         Xdys4ICd6Xftwdnskj0xa5OMG4KTvR8XJc8rl/qmShRUnx/IUlwF1Ql6X2TgSI/dfZk0
         8r+hORA2W94HuhVIz+OxQ6w4LILE4aAl/CstxrdlK82FWtSnbfYBQryIwaQDQTGClvCQ
         Yinfx3G0Bvcae+QNP/C2D3oJVdf56I9Lyn5qsRaYD+sZmo/MqFSlZWl8b+pRv7rpd6eY
         zr/A==
X-Forwarded-Encrypted: i=1; AJvYcCWgxLIXWD/Zdn1uEI7WcJuNEG2OKaBCC7R8YqCztFh6FkbtODN5MoIfG2G1BvXfeOLMuk8ijmb2VB8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Lssm3TIMSGvPs+vyvAbRjVR7+ed7n5LWw+YF3cVh14lFmL+Y
	DgycJK1bErXh5x+LGGCUtM/Hqm1K/2j+Ka4ZmuVEOenVo1+Wmko3joJyvxanj30=
X-Google-Smtp-Source: AGHT+IEsxqy1QIMoDY4Ou1LJy4yOq+pq9/YaekGJg8fDbyA6VV3xENMscgOLE+Qbj+VEcc4PHGIAOQ==
X-Received: by 2002:a17:907:3f9f:b0:a9a:2afc:e4d7 with SMTP id a640c23a62f3a-a9e50b948d0mr2311624866b.44.1730883969647;
        Wed, 06 Nov 2024 01:06:09 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:afb5:f524:6416:8e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f9422sm247781366b.139.2024.11.06.01.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:06:09 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
Subject: [PATCH v3 1/8] dt-bindings: clock: imx8m-clock: support spread spectrum clocking
Date: Wed,  6 Nov 2024 09:57:57 +0100
Message-ID: <20241106090549.3684963-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
References: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch adds the DT bindings for enabling and tuning spread spectrum
clocking generation.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Added in v3
- The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
  imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
  indeed more or less a syscon, so it represents a memory area
  accessible by ccm (imx8m-clock.yaml) to setup the PLLs.

 .../bindings/clock/imx8m-clock.yaml           | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a81478..7920393e518e 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -43,6 +43,40 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
+  fsl,ssc-clocks:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Phandles of the PLL with spread spectrum generation hardware capability.
+    minItems: 1
+    maxItems: 4
+
+  fsl,ssc-modfreq-hz:
+    description:
+      The values of modulation frequency (Hz unit) of spread spectrum
+      clocking for each PLL.
+    minItems: 1
+    maxItems: 4
+
+  fsl,ssc-modrate-percent:
+    description:
+      The percentage values of modulation rate of spread spectrum
+      clocking for each PLL.
+    minItems: 1
+    maxItems: 4
+
+  fsl,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      The modulation techniques of spread spectrum clocking for
+      each PLL.
+    minItems: 1
+    maxItems: 4
+    items:
+      enum:
+        - down-spread
+        - up-spread
+        - center-spread
+
 required:
   - compatible
   - reg
@@ -76,6 +110,11 @@ allOf:
             - const: clk_ext2
             - const: clk_ext3
             - const: clk_ext4
+        fsl,ssc-clocks: false
+        fsl,ssc-modfreq-hz: false
+        fsl,ssc-modrate-percent: false
+        fsl,ssc-modmethod: false
+
     else:
       properties:
         clocks:
@@ -101,6 +140,8 @@ additionalProperties: false
 examples:
   # Clock Control Module node:
   - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
     clock-controller@30380000 {
         compatible = "fsl,imx8mm-ccm";
         reg = <0x30380000 0x10000>;
@@ -109,6 +150,11 @@ examples:
                  <&clk_ext3>, <&clk_ext4>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
                       "clk_ext3", "clk_ext4";
+        fsl,ssc-clocks = <&clk IMX8MM_AUDIO_PLL1>,
+                         <&clk IMX8MM_VIDEO_PLL1>;
+        fsl,ssc-modfreq-hz = <6818>, <2419>;
+        fsl,ssc-modrate-percent = <3>, <7>;
+        fsl,ssc-modmethod = "down-spread", "center-spread";
     };
 
   - |
-- 
2.43.0


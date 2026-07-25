Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289A7332EAE
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 04:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784955352; cv=none; b=MsgzrGs3jJELc3i+0jB0YXBYy65xUb55AazVVjSL5j9gyd+cgxXTc6q/kLLzWga4mCwGLaX/V3m6Hq80+yRggYPofm1CG966mu9XdCE+bAyWxePIy49EfrpFUjixSePIm9Q0DBH4vrKU6LUjYBMZwQBMs/PKfYNQIcZtZstlzpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784955352; c=relaxed/simple;
	bh=xr0oQcfFPCJzaAeEJhH42CRWzbYWKnP3e2i7y0AjEKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MebaFbyJt1SagbTs6KEqk+rmr6Jp1PAJlkdJBOpsLmD8gfe5t2IdxCi9LcTj2uI2J/bzG22GBad8ZPdbXMaJlsbtR+qLVqnjudllO+pXKCaJLfoalX02cf74uEVPNSPlpxCeBVRz/01wTbORGsGbEs7HPYcUtT6WGx/AG7TWFpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvJZWafQ; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvJZWafQ"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-380f4166f80so953437a91.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 21:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784955350; x=1785560150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fhok3rvowf2V2ZvTr/zIVWuKYiTyiporNQXpy3ArInQ=;
        b=FvJZWafQwahHEpy4CoQQtpKgC2dmeeNMaED7CmyIAZ9nUPdjC0SAcLNQ9gIGfJWLWp
         2wo2bvNT9+F7OR4OJjm8YONALO1Lv2sBFBUWJHxCFemPVAm+WWIcCfkLoXAA83P9e7Wd
         HXY+KQCa6qN2InIm6CUbbD7C2eZ1yiNUvgEVW/TdMt99sk5piItlXUyreoq3bbTePpLO
         g1a3cA/hcWwAAWt/rhv/iGS0q9W0mKq8Bze32paEGW9UP52C18Oak6TMDJjiHfto9HDE
         ZbTODOhhGxSTqqLL5+aRim9pB+s4uoxPMd9yd/ZNXdg9WeBT/sPPaHflMuYKS7UX7by0
         TqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784955350; x=1785560150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fhok3rvowf2V2ZvTr/zIVWuKYiTyiporNQXpy3ArInQ=;
        b=eez3T9AUrdM1681U7E5euX0uCEVqRXNcJCN4Q3jsFb8v6ODXXO+lxDuHZZkp5sG2Hg
         BKj81teWWsF2cGH6Cw1W3swEPG6XIez7g8JbOd+LaIcD0VlPEE0xLxtORlvLe0N05Pz3
         F/PqyDANRmExhq4nOSvWDDIuX0s0pkru4jp1G2XPDNsuVC4oOTjOtZ1Vi2jZq7ktMuEi
         pZj+d/O5+GNSFg5ZL0hK2TTA7FNywxAVo2VSq37TvyBNu/rADQs1QYlqPDXTRKoy6hUY
         LfiZgLfrEzZXpS9yJk+EjWmTAHN8aTMSu9L5K3s0lZY5r9XyN4PWHQ8X9ABA/n7khuqa
         AiEw==
X-Forwarded-Encrypted: i=1; AHgh+RovDnqS+j9lXsVJzn84t1OgQ8FS+eannNSv2iJj5szU8TjmLCOn/EM7okr1Rnne65ouKK8tZ6SUYH4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhl7tvJ54D9LiJV4kpuvvQIh/4ykHE2d9j+BPZcsJbNq8v2YPR
	SvSaxTJoTg4AaLQfr5SgxBBKXzy5eLnj5pFffg/Q2SDW0C5hJmtpShje50YKIxe15M4Phg==
X-Gm-Gg: AR+sD10y/81EO+1+n4BsD+IeAvNe1y3c/mXq6I199kRK1SkV5jaSHyki8bY299mk49o
	iWIAGQ4CfY5Bv+dnumGn1kXo3pz19XrWGxDNmuP23rbS4VuaZ5GuCMo6K+y/YQ8Z4+4pCHDdJvN
	NSlqb+qu5etCPI2ACgkdtYRUEfptWJETo6+pAW74ZhGmQ8y9YKzmqzWvOp1yOxi67esg4BPe+T6
	Fube13XGIs/ki5Qt4qh2UclduEUr6NJbW9sXWkl95JT6Z45JVKJlmsZFpekaZwWCLU4l1Xys3iH
	8x2vc9GIMJIZG0GG4lLtRjURALu+jFH60GstEW7xAeVE1LCZ8sGBQhykJaCbmtdPA6tDup5S7iD
	pH5xXYUTEj/KrzyXOAWNops0nWbvuopzldbTqkezIotXLOQGcnHjbigM=
X-Received: by 2002:aa7:8885:0:b0:84e:2bb:2d3e with SMTP id d2e1a72fcca58-84e594330edmr623584b3a.9.1784949446508;
        Fri, 24 Jul 2026 20:17:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:26 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:34 -0400
Subject: [PATCH 02/17] dt-bindings: phy: add SpacemiT K3 Innosilicon DP PHY
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-2-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

The SpacemiT K3 DisplayPort controller drives its four transmit lanes
through an integrated Innosilicon DP PHY, one PHY per controller. Add a
binding so the controller can reference its transmit PHY and the pixel
clock the PHY's PLL sources.

The PHY's registers are interleaved with its parent controller's inside
one MMIO window, so it owns neither a reg nor a reset and is modelled as
a child of the controller.

It exposes its PLL-generated pixel clock through #clock-cells, so the
APMU pixel-clock mux can select it as a parent through the clock
framework.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../bindings/phy/spacemit,k3-inno-dp-phy.yaml      | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
new file mode 100644
index 000000000000..f8f1ef372951
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k3-inno-dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 Innosilicon DisplayPort PHY
+
+maintainers:
+  - Cody Kang <codykang.hk@gmail.com>
+
+description:
+  Innosilicon four-lane DisplayPort transmit PHY integrated in the SpacemiT
+  K3 SoC, one per DisplayPort controller. Its registers are interleaved with
+  the controller's own inside a single register window, so it is described as
+  a child of the controller and owns neither a reg nor a reset.
+
+  The PHY provides the pixel clock its PLL generates, which the APMU
+  pixel-clock mux takes as one of its inputs.
+
+properties:
+  compatible:
+    const: spacemit,k3-inno-dp-phy
+
+  "#phy-cells":
+    const: 0
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#phy-cells"
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy {
+        compatible = "spacemit,k3-inno-dp-phy";
+        #phy-cells = <0>;
+        #clock-cells = <0>;
+        clock-output-names = "edp0_pll_pxclk";
+    };

-- 
2.43.0


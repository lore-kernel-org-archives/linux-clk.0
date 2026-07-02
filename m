Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E5D495514
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985107; cv=none; b=GNuJPiEjM+LflY/sWCplrqxqGR/U63CRivRkVbtWHjM+PoWbFlqZ1jWhT0osh5GWk8X8D4dbb4bAwdPLlGeBEMoSads1cd9GvfA7jMOCrGZxOmWIoKpK6BmnCCZQX72/eKzkfYEuEomAFDiIBw2mtNQ+PjUowLq17uqFm5TSeRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985107; c=relaxed/simple;
	bh=FD8IvK1gXQx5wLqh2EUIHl/A6W3peoBLFvUS6imjxoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eT0dtLnA0f47YpeHRssCbR0uAV2lM/0HyZ9K5BjQOEvP4G0PdOBZlAKbaH+7HYUp+JU9xiH9nJHnkO+tW7lpYLH8/HWElgrRl7ZBFAyD3nYOWPbokKCZc527YYnkrUH9y8UpIWzknJVj2pm2Co35MS6Wsl7jHOfG++ur5Cl3rAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOe6n2N0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOe6n2N0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so13960575e9.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 02:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985104; x=1783589904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atavLJO9ib3dVO9oXs0ZfRhlR41n5og9pxT0XRvm9dc=;
        b=bOe6n2N0VywAes0f0Ss5Lf4cywCCtOXcru0OmIGCqh3CNhUp6Yzkyxf0C7ECRqnGKh
         Z7TJlFVDfWwizFCv9NeaZEWBHNEFjJ3N5vD0IrSVcnObCiYsxJhRE94D7htBH4mrkpH0
         VsSfOE/yJLpnQM8GdtsEbbT8IkO38dgwRvcQVHGRCW+qSRtgWq+HC3QN8sMKLWytmwzc
         kmziRp0iEychwBcRceWjwGrsovYJPjfOqrgXYNI93sPQUC4PXvmMFbC4Ervr/k1OD0Fh
         ZssSVlFNnPSyOHFKLc2tOPYiHcViYqLiXuII906NGJ+d/BxF9Q7FzDJUo0ccpuOFuxDR
         mEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985104; x=1783589904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=atavLJO9ib3dVO9oXs0ZfRhlR41n5og9pxT0XRvm9dc=;
        b=Vto+z5wOj/6cHqZrntVzAlJDxVtlqBdcTlUJKox74uFRDD5QE804/8OTwzULKHGD7W
         scHWMXt0pQ5P9knHDknHkCHWBqYaVxjyl8Ur4oUiBjO9GOGWshb1881iuwwOgHHw6WXa
         DjEK1UiEH9MGeiPUvbhqPc86fvax0gkNkZjBxvNSPuYyV/OIRDrB+apCFFTiV8RTiaG+
         ScI0DAdSOGhFrObCEznspkDIHR/SXJ8sBjv7Z6ct9nKNfEjvg0dVsqUjl+p8oBm49UeA
         nKZedKVwni9Znwbu9bVjV4I3b4zEv+4PRNzzdDONIjaQXPd74mMMRaB2960hToXZ8kgU
         E0zA==
X-Forwarded-Encrypted: i=1; AFNElJ+o/lFsZnTv48lxMHNOrB7e1kOSKMadYJ5lxnYtaRJc6Hz/nP0kCXGrXdpNstGZ/qrz3lPyt4hG27M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+4+CuF5chUJMOQMoOeUVwJz9MvVX1UxQG5Zb2pyWZeINGqwhF
	BQuZpaSuy0Ymf8avyU7Iw+q9wDIgI/iMDGZJlbwLw3UwsaDPlgyulyYg
X-Gm-Gg: AfdE7ckCspaY7Ur4EqrgPRuuICD7usmYxAdsje+0pySEfvdL7VFaFOZF1CflnEas9q9
	/P5/OWH81urIPZ0XMXKGPGe8CtqWKMBa44lvP5LuN5Q1bHgJUbVVyIaH5GpV90Z2ElQ7fY0ZBTI
	wiKR1P64L0mG/4s37u3IVPzsbsOZOgKVp7hhZtoJQ2iHaYcb+aL0gWMPWIwUBzWQUKOvYR8Z1bV
	9FjgFonfXmT+cqGFoDpx0Jqx1iX/df80+suPYYTC33XMv+8gGsb2IYXQNwF8GRBBQmEG1bSlyps
	VI2uG7KBjDN+hUgpOOo4Afac/lLJhwCYBuxlMxMQE9uvziN6aGaS3tp4XOrwX0zm8binm1GSNoy
	woU/TsTYABCw6xU8BaQXMAbRRz5q+bBzUPNSSRdkOOS2ChPzcGkQaxJq9rAKrTL+gmlJNea65Zg
	iiekbMADlEqcpWNESLbgjduVwHv6ZnmpzZfLEYeSKcNhWyj3wMu+Y4YAukh0W/BP5xX5o2qHChH
	lR+6A==
X-Received: by 2002:a05:600c:828d:b0:493:bf86:85c5 with SMTP id 5b1f17b1804b1-493c3df3495mr61803955e9.36.1782985104016;
        Thu, 02 Jul 2026 02:38:24 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-52-250-217.retail.telecomitalia.it. [79.52.250.217])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493c636c8b9sm35502285e9.10.2026.07.02.02.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:38:23 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/5] dt-bindings: clock: airoha: Add PHY binding for Serdes port
Date: Thu,  2 Jul 2026 11:38:06 +0200
Message-ID: <20260702093812.15918-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702093812.15918-1-ansuelsmth@gmail.com>
References: <20260702093812.15918-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PHY cell property for Serdes port selection. Currently supported only
for Airoha AN7581 SoC, that support up to 4 Serdes port.

The Serdes port can support both PCIe, USB3 or Ethernet mode.

- PCIe1 Serdes can support PCIe or Ethernet mode.
- PCIe2 Serdes can support PCIe or Ethernet mode.
- USB1 Serdes can support USB3 or HSGMII mode.
- USB2 Serdes can support USB3 or PCIe mode.

Add bindings to permit correct reference of the Serdes ports in DT.
Values are just symbolic and enumerates the Serdes port with a specific
number for precise reference.

The available Serdes port can be selected following the dt-binding header
in [2].

[2] <include/dt-bindings/soc/airoha,scu-ssr.h>

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/airoha,en7523-scu.yaml  |  9 +++++++++
 include/dt-bindings/soc/airoha,scu-ssr.h              | 11 +++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..913ddc16182b 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -23,6 +23,7 @@ description: |
 
   All these identifiers can be found in:
   [1]: <include/dt-bindings/clock/en7523-clk.h>.
+  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
 
   The clocks are provided inside a system controller node.
 
@@ -50,6 +51,12 @@ properties:
     description: ID of the controller reset line
     const: 1
 
+  '#phy-cells':
+    description:
+      The first cell indicates the serdes phy number, see [2] for the
+      available serdes port.
+    const: 1
+
 required:
   - compatible
   - reg
@@ -65,6 +72,8 @@ allOf:
         reg:
           minItems: 2
 
+        '#phy-cells': false
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
new file mode 100644
index 000000000000..33c64844ada3
--- /dev/null
+++ b/include/dt-bindings/soc/airoha,scu-ssr.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
+#define __DT_BINDINGS_AIROHA_SCU_SSR_H
+
+#define AIROHA_SCU_SERDES_PCIE1		0
+#define AIROHA_SCU_SERDES_PCIE2		1
+#define AIROHA_SCU_SERDES_USB1		2
+#define AIROHA_SCU_SERDES_USB2		3
+
+#endif /* __DT_BINDINGS_AIROHA_SCU_SSR_H */
-- 
2.53.0


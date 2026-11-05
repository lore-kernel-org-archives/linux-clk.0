Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793876827;
	b=l62AY0qneP1ZxHrIySV0nmRjZmHzeirzfDlF7WDt0VAziUVmqOq03rfHMvHvY/59FDOH
	 EjBjjomQ1bXZpd4Nj/j5mWdEpz0GqzzCZUKVd3YQ4Is9BuWGt9EL7MPdbou3VZ6gKoXhV
	 8Ire88plf/ri+BRFXEZjFR2TPt6+4wz62Dil38p4Vk+vbx6NhzUJw7tykF63rE+YYZY7H
	 eYDEOXEU5tXFy2KnqMTiS3dPnxjCwJK4pWPWen/3T6firypzxEW0zN2/A3/KdWCEBodXK
	 434x0J84BXb2dMWYjRlqkqzrVIyutj82cn5UFQFEtZCwyNCE5Rh///JI23WVaoh0u1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876827;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0yDZOAIm8/Q3QD8+C6s41Grxf2KSvFAj+qQW3BIcQGs=;
	b=R6w5iZWPKmY4eqrz1PXjMpj+w8tQzmk9mdw0Hmv+Iuf/tQxqULpdxtxf7bL3ok21F741
	 LlBwuO52qqK4xK1a6YUYx7Pe38kiWiwXLzHPP7TIRU9+wzR1arG8IZu4UrQWFXvlohKJK
	 DsERD1hPUarLAVUBk/iXOY3+ooyc78DYvuXIK4O4E8Q6n4GY3PlPPuZiMzYtmmpS/D9bC
	 n3YsDPQsOe7Ag6luCZhFg0h7/zqNJfHwFOHXhD179XaezW70ekcWyHJHSncwIqHM7gIBd
	 CVD5EiOeGa4LxuMJgAAnwuCl5+1FfH8H8ScaFFd/Ozs2+NH88fAiPEEXOlJ4SysTNnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mV6ZPGix;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FD9606A337;
	Thu,  5 Nov 2026 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mV6ZPGix
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793876827;
	b=tcqO3YfYoayXwIo6ELyRYhbmm9TOs/BL9fzbIIaK3L/9IoAW4WXSWUyyrbMthbl+fy+p
	 ebIuaLwlqtt5T5s7yVPHyOkgLHFRrLbkLGhgd3r0EOKxWoasHTNp9GhoV6P+Qj2457eVD
	 olD/46w3MlxocC834Zow3SzKFU/vxULmGkIAdtBLFui62P30HJst5i0T2u7uxRMpedwnC
	 M+s+qBDg01CI5AJJKkfCzkpyxWkrGvDYrr9TJXJZ0PrxI5m71VGsYL/Yoh6RVLXluQjK9
	 GA1bMJL27kT73UfSRu4kYy+5+dgcTjie7XgQcXnN5g/3cwKSMwQdFPZ5i96Y1SzJN+w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793876827;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0yDZOAIm8/Q3QD8+C6s41Grxf2KSvFAj+qQW3BIcQGs=;
	b=N4276M/4jHcI9XV/T3ddlCEmZIIK+wOozmTX7Ddvgzgp/oGqlwPLRHva2PD0kuqauhn7
	 LAnGaGX5hKNzTcUSELXRMGwUe9AkF1tC9vj9fRgigAjiBnbAiVXahZbb9+mEhGt0OpuWD
	 ABg+ZxpKF+lTViVsup6bx+KYffplWZxKN/F6THcd7CJB+JefHa29ChultyJcQqbJ/y/tx
	 RwYcqGxicaZicHI8DRxvpBRrkJ5nvMscMqhMQfdw40QyBEo9wnZ5uE9QMFVo4FxXyyHYM
	 dHl4paLPiUbNc2wXfoNLqnojllXTTzGVEFKanqV94ZcVIgaN4fN47wgzcjXBXnNSnPA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D819A1F00919;
	Thu,  5 Nov 2026 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793876827;
	bh=0yDZOAIm8/Q3QD8+C6s41Grxf2KSvFAj+qQW3BIcQGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mV6ZPGixGuOtpRjWeYo5fWKi2ocAeknBmH27XpTJMLGH/zkvwv6muwj0jj+wvRfb5
	 XqAKcV27w957WIH8qcXRXJ7/xwhBSP88fOaHrVkHBkHkHvt0y4SI5NUi4ZG9zr+wLs
	 zQghBilU1lUe8+gD2T25FVezcyULNb13gYiBuqK949xRPlL7u5TMMw2hgvki+C5XBq
	 qNy9NJEMJnUAwHXUyYwY5DeULE82YOVQySdJo7CN/91GiqKYPlg4U9u9CN16um+jeu
	 2LdDv63rKBUKF6HQ5NeJIS0xP91AI2VoyYEr+qlgP9x87BdabTb87WKtOS4NFohBVi
	 /gTHwRayOc2hg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 55C2F47200;
	Thu,  5 Nov 2026 11:07:05 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 05 Nov 2026 19:06:36 +0800
Subject: [PATCH v11 2/5] dt-bindings: clock: add Ambarella CV75 RCT
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-cv75-soc-v11-2-aa6ee0b2380d@ambarella.com>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
In-Reply-To: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793876823; l=2969;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=gEKr05f9YAOrNVHJfKB47io9QNiMkJyDyO/ZJBUGYg0=;
 b=PIApFwZ1qo2pQy8GM9iYauoJzATX0qn4dK7Xim5kywC2r2ExtBGpCMxyPU+3ArIflBoG+IeK8
 MCbL8rBmq6zBcF3aG+VEfFAX7LDXk99UIgsA1EDs2rj8iJS96YbxBLB
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Document the CV75 RCT clock controller and the clock ID header used by
DT consumers.

Document #reset-cells for the RCT reset-provider role. Soft-reset line
IDs and the reset provider driver are deferred; this series has no
resets= consumers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../bindings/clock/ambarella,cv75-rct.yaml         | 64 ++++++++++++++++++++++
 include/dt-bindings/clock/ambarella,cv75-rct.h     | 14 +++++
 2 files changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
new file mode 100644
index 000000000000..be89bd75f9e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ambarella,cv75-rct.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella CV75 RCT Clock Controller
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+description: |
+  The RCT (Reset and Clock Tree) block on the Ambarella CV75 SoC provides
+  PLLs, clock muxes, dividers and soft-reset controls for on-chip
+  peripherals.
+
+  The same register region is also exposed as a syscon for other SoC
+  blocks (e.g. pin drive-strength), hence the "syscon" compatible.
+
+  Clock indices are defined in include/dt-bindings/clock/ambarella,cv75-rct.h.
+
+properties:
+
+  compatible:
+    items:
+      - const: ambarella,cv75-rct
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: Reference crystal oscillator (typically 24 MHz)
+    maxItems: 1
+
+  clock-names:
+    const: osc
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@ed080000 {
+        compatible = "ambarella,cv75-rct", "syscon";
+        reg = <0xed080000 0x1000>;
+        clocks = <&osc>;
+        clock-names = "osc";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/ambarella,cv75-rct.h b/include/dt-bindings/clock/ambarella,cv75-rct.h
new file mode 100644
index 000000000000..b3e965b4ff2e
--- /dev/null
+++ b/include/dt-bindings/clock/ambarella,cv75-rct.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2026 Ambarella, Inc.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMBARELLA_CV75_RCT_H
+#define _DT_BINDINGS_CLOCK_AMBARELLA_CV75_RCT_H
+
+#define CV75_GCLK_UART0		0
+#define CV75_GCLK_CORE		1
+#define CV75_GCLK_AHB		2
+#define CV75_GCLK_APB		3
+
+#endif

-- 
2.34.1



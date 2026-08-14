Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEA43E8C56
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 21:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786742504; cv=none; b=nBddZ1xmy7sVEOUwfzVCPj5iF+4FWk9gtTc6P9rgwSqPo84eAjXyRsGh57Vi+knZNffcdySAg/BwImPa/eJwioxNk1UrOryxglN553A8n8+9yJKq3s6n2lJjX/q7YorClKEhpOR98d7GPQXXnKHdIoBxUFC140E3EYwKzv0BFyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786742504; c=relaxed/simple;
	bh=u6r8H0pSqbZuRl447oiZjO+lUFL/LjDSOxn4d+FN7EQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvUihpabP6YnOPubK25ZxR0XLSvwaMgm8NLmPRMuSmQEIAyXMcrvKO7gig9MJ7GLiojkC+ZJekvw6QnK1YybFuVJgqGiE6h3IfPJh/Zs8jvxNslFyzzVHDcZHPniJcq8P4BQnyr5/5P92TAZFE6jCleFIp8BuR8Z9NgzPceBKr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmI4/gmS; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmI4/gmS"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-384c94c9423so143559a91.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 14:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786742498; x=1787347298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lip8n6xP9eOpioWoISckMOq1UctyXUT+/l6I9kdKKU=;
        b=NmI4/gmSTiLXYjP1qim4JIIR3WJhSUyOkVY9I9qKlHx/0W0TF5riNMIgSPHqYk06OR
         hAbthlhvse3OBVwfWwCWZKGeQflwxron7mFCYhiuEfeanjSeGMqpWvp/Bmuk5a5N7bW9
         VAN1L37eHWXmPWN/SNXkmzfg7F3XKbquK3n0HwJXZ7pKnSTKKXsBT8ksV3ID5fR1wvfK
         S8nlTVJIACwqaq8F4xf5Ndypr3TF/p516MlSmnMT7ajeyykUPsKj9MnQMX5RDgRkgrJg
         eHQgz82VDJrrwd+WLYqi2JAcmzso71uNKNQsFUDTJlESgHxp3Zoe8xvk4vmjSTKqM9xb
         ebfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786742498; x=1787347298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lip8n6xP9eOpioWoISckMOq1UctyXUT+/l6I9kdKKU=;
        b=gUGUiWzk6oNSkCDCpzYmRyiweGc/Fq2RN6g/NxlxmRJPMxKKpONGD2QYWo6V9zYvU3
         5Dt9OeIlr1nWjB2mazVNCMjjeFLI4+nvjvvvMOuAhK+Ta9lz+WfXEJAbFgUCFtfi+u0V
         Y/VL8ZmyfL2fI1f06qyjy6FO9oX09fzsup1aEUEClkcYAnbm3AF6MJmVO3Z5PWUZZUYQ
         E+xguvJMRBCVi143794ZQbdEI4OjeVacsnu1r6BICEhYUBJu4sW3oIyG7CWzfEQe28FR
         Ac4iZaWNe49LagEDqGFN52IEW7mWpnT92oA83dAYh+DgVrBZ9xdV8KeGBsTQtqiRzaqq
         2Geg==
X-Gm-Message-State: AOJu0YwyIYZghW06qKdmC/mkcswRs94Dn857EYUglh4BJe5mlxnIoPZM
	FLlAfT91PdkK9RvmD6X2uXv9RMK3id/XUFe6/JtGNuBRr/culRNetojlzXUTIA==
X-Gm-Gg: AR+sD10mSf+ac+uziCCxg99poHJM7ZxDi0ZqbV+2Xsdzer5M0VxDoQa/Kx7QD/VgfGf
	+fDPUWZ8IvB/8AqA9FC6Sak9/2exeCTapoCtiGN0BMAz30Q5PhGW2SO+05iYjp8FEwh0O6XH9Ym
	CptCwxAvjtpSHBJoL93P7RUaFXyFIWkLAUdax3pgONlOLKHqwgc7CMvIN5G3X0dIHTNsIgE5guA
	w0PF3dnZdQC+AOzcv0fgCKbxaPrifizjCj9CnMP2a4rSyjMgOCxFH7BvQMGMvRKbpn92QUHC+nx
	CcHyYQ7/yE+IEb/3Kkv1O57P4fKb8S2Ez+e2aUvqm/CeOAgk+dtLZTMny5ERAMmqQTmUxMHdC3X
	gpqg4o7PU/P9DndbXusuWLBQlKProYkl2veXKnR/RJRF1zttuTffjeRYfMOqiLouIzoxRgXUPNT
	OgK+6HvvjutKP2uiWq1iwHpPnII/Du8HKUslWfyDDle4/4ZbTHBSJSR+wjzzhEIdsxMmTKjlvdc
	g==
X-Received: by 2002:a17:90b:4c47:b0:381:28e0:6248 with SMTP id 98e67ed59e1d1-3933b6fa584mr7435398a91.1.1786742498536;
        Fri, 14 Aug 2026 14:21:38 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:504f:ca49:504a:79dd:fd2b:ca2d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387c6f95sm16678893c88.6.2026.08.14.14.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 14:21:37 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 15 Aug 2026 02:50:56 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: ti,dra7-atl-clock: convert to
 DT schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260815-ti-dra7-atl-v2-1-db64c147c2e2@gmail.com>
References: <20260815-ti-dra7-atl-v2-0-db64c147c2e2@gmail.com>
In-Reply-To: <20260815-ti-dra7-atl-v2-0-db64c147c2e2@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786742472; l=3650;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=u6r8H0pSqbZuRl447oiZjO+lUFL/LjDSOxn4d+FN7EQ=;
 b=NxRGxjBC6lb3qhT51jyu5o5aj/7tuEIEWGRLSdfZMZtkOpncHoZvRHUUH1XfQNHXASuhnw3e1
 b5++ip9N8jAB2G6TgmpLLhoZavWozwfFfJtlwxLXDeRmqTWIvQbzaK1
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the clock output portion of the DRA7 ATL (Audio Tracking Logic)
binding from text to DT schema. property clock-output-names is added
that is used by existing dts/dtsi.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/clock/ti/dra7-atl.txt      | 38 ----------------------
 .../bindings/clock/ti/ti,dra7-atl-clock.yaml       | 38 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt b/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
index 68504079f99f..e3c05844ae86 100644
--- a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
@@ -9,20 +9,6 @@ signals - can compensate the drift between the two ws signal.
 In order to provide the support for ATL and its output clocks (which can be used
 internally within the SoC or external components) two sets of bindings is needed:
 
-Clock tree binding:
-This binding uses the common clock binding[1].
-To be able to integrate the ATL clocks with DT clock tree.
-Provides ccf level representation of the ATL clocks to be used by drivers.
-Since the clock instances are part of a single IP this binding is used as a node
-for the DT clock tree, the IP driver is needed to handle the actual configuration
-of the IP.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "ti,dra7-atl-clock"
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : link phandles to functional clock of ATL
 
 Binding for the IP driver:
 This binding is used to configure the IP driver which is going to handle the
@@ -47,30 +33,6 @@ For valid word select signals, see the dt-bindings/clock/ti-dra7-atl.h include
 file.
 
 Examples:
-/* clock bindings for atl provided clocks */
-atl_clkin0_ck: atl_clkin0_ck {
-	#clock-cells = <0>;
-	compatible = "ti,dra7-atl-clock";
-	clocks = <&atl_gfclk_mux>;
-};
-
-atl_clkin1_ck: atl_clkin1_ck {
-	#clock-cells = <0>;
-	compatible = "ti,dra7-atl-clock";
-	clocks = <&atl_gfclk_mux>;
-};
-
-atl_clkin2_ck: atl_clkin2_ck {
-	#clock-cells = <0>;
-	compatible = "ti,dra7-atl-clock";
-	clocks = <&atl_gfclk_mux>;
-};
-
-atl_clkin3_ck: atl_clkin3_ck {
-	#clock-cells = <0>;
-	compatible = "ti,dra7-atl-clock";
-	clocks = <&atl_gfclk_mux>;
-};
 
 /* binding for the IP */
 atl: atl@4843c000 {
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl-clock.yaml
new file mode 100644
index 000000000000..c0795f4abcfa
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,dra7-atl-clock.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,dra7-atl-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DRA7 ATL (Audio Tracking Logic) clock output
+
+maintainers:
+  - Peter Ujfalusi <peter.ujfalusi@ti.com>
+
+properties:
+  compatible:
+    const: ti,dra7-atl-clock
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    atl_clkin0_ck {
+        compatible = "ti,dra7-atl-clock";
+        #clock-cells = <0>;
+        clocks = <&atl_gfclk_mux>;
+    };

-- 
2.55.0


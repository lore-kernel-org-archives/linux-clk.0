Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9907A30567F
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 21:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788644001; cv=none; b=SnuSTAVGGs7gebBM+ou3FimqOqi7QuMpzXwmWa6hrs5PHys+I8iaDnlQBJpo7ZphNXvLjz9vrkzey8jO4bC2DDXqmuQJFhiwDBxUqY8y1wNfOWqibtoQ6U/T+IPS+7MdEd0NLH5k9JjFtX588k+FO7ZV0300/kbBm5nBaIJlCJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788644001; c=relaxed/simple;
	bh=u6r8H0pSqbZuRl447oiZjO+lUFL/LjDSOxn4d+FN7EQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQuvtbBRdzXMiXkUxz7DW1wUuNKyUKPd0mPu2SIGECycTJAWDZx/Ia48GAkR/GCAZdJraAt3ka2c0o6Dqc5uTliqSKFBjxXhTJckVqzBJPYMVzXdKJ+HlB3DWEXqwDQgbMSDTYz5Nh+OmDzI/EmTuPQnqsPjv+fBP3nw+bJS7fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8I4F3uL; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8I4F3uL"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2f2c4dso1570935ad.0
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 14:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788643999; x=1789248799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lip8n6xP9eOpioWoISckMOq1UctyXUT+/l6I9kdKKU=;
        b=k8I4F3uLBGPAXocPXk7JSGmq24FNxNDftf5YXD4nDQ9hkmrF8gQPPsNTiGIa38IvOy
         hqN12AzIKk5MI2aG+pVUUK7FrOdc3cPzhIw3c7FucOgaVhaKN6yM1+1vRSjy3IHzwfKF
         kKJ6CbQky2OM/NZI+AiqB8yXBaCkjco+Od4wwJN4+tkgNyZQxESXNk3BpwHajwG/QbuD
         x2XsmZAqU49SlChSGdqQXLvzqTxMabD/8bKrZMJg+9dqSEEJYeoQIiOW5D0EEItlZSv/
         zgCwBhL9jNaxm+tH6rF1e8b11d4vfub3UtyUvkRytOKm8fjx73nKLJGz00sdRdXzL4aX
         I2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788643999; x=1789248799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lip8n6xP9eOpioWoISckMOq1UctyXUT+/l6I9kdKKU=;
        b=PDyiWzqwX/eetPmzReQev8LfVnfcx3x8hrloeprSDVFN/nkc8v3Xn712vH7OtIviLh
         OVYYc43e+l3MucVyFHQ8CpJGyuVqT9/1yL6uPq1/VeXic27NFDjjBQqKcd1bc4cGEkHn
         kz7ghm/BA2C7wvoWciLCvpivvqlQHX6jfjcXnGDZg9BT2We7OP6tCssSBu4jGKRM9Z9/
         W1THTBA2bG0Cqft/uZulp93CHxkJxSqvutlIBA8xol71YEn9AJ6Lqh1X3pWzf4JnWATl
         DOVPBIA87pA906j46qYOuEq+wK3ZFQHXVWpzLysMp1K6sGIc3fvYqTFi4G8CXvho0pxL
         T0yg==
X-Gm-Message-State: AFuF++nyU6V2QAGZDtbsCCKzx5YAZEFBRO/8iIfwZZDjzjkImeD6F5/0
	mB+5akQ6R/iRRn5+cazgwRN5cC+BM6YrU5t4D3cNIB8fgZNHK6AFcyx3
X-Gm-Gg: AYBFou3sQzeZSOTpHLnM1qBdrWMiGDc25GEGrZwLDWvpfjRAoyiWipmRMbjFGidGtca
	EJM2oFj1XwVE4Ld0k6u4aCnmjPr+/hVkmTgb2G/wZJdP6OXXkPNZZ/KDGaHsD5v/rHZuESs6XRQ
	J3ZXuN7CumzcvZvqK4tXq6jDh2kGklcCc47mln6fpZTGpb+W55rVV4b8ot9jDMyPsyLoskxMGMM
	ykWiOKb/Pp02z4+0JbIokGadcrNM/xfXmYzd/LVzc3l5ijYu0l37yq3jUUYVpQRHML3Be+E9olZ
	hXylZMmkB7//Y/Y3RJ93tQoCTCP/hE02f+S43yR0M8X3rfdxK03VhhqNAfAOMaNq0spE5L294Kn
	aaIeoadmPvVgQTL/ztCduEdrkjxos3o92Ioar1Wcg/IJqH9D6HH7JS8INFcKLHGu7otSkWetbJ+
	0oxGifnus11fC2N7BkIm3JyXahW29WrvJ+Et2iCggCWbRmgSxkMUkgtMTlIUN74EfPgyQeiQ12
X-Received: by 2002:a17:90b:4b0d:b0:38e:c140:2a0b with SMTP id 98e67ed59e1d1-39b3d78fb3bmr7308210a91.3.1788643999088;
        Sat, 05 Sep 2026 14:33:19 -0700 (PDT)
Received: from [10.63.138.252] ([2409:40c2:5007:4aea:63cc:914c:1243:e03c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm21538010a91.14.2026.09.05.14.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:33:18 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 06 Sep 2026 03:02:39 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: ti,dra7-atl-clock: convert to
 DT schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ti-dra7-atl-v3-1-5962d8f608ed@gmail.com>
References: <20260906-ti-dra7-atl-v3-0-5962d8f608ed@gmail.com>
In-Reply-To: <20260906-ti-dra7-atl-v3-0-5962d8f608ed@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788643973; l=3650;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=u6r8H0pSqbZuRl447oiZjO+lUFL/LjDSOxn4d+FN7EQ=;
 b=M3fNS4yIIp7jbtVbfKEcIZDcNxe0nnEQnYIdXD+VhjyJvQQ64wRwj7mpabAE91nqRhYlrOkMq
 Uw8iZMeGyNMCu/kBFG9s/CUApyfKGHsL1gw3DXNDq0Mys8R64AHzAo4
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


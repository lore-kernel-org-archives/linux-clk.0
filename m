Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B960A3515C6
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 20:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785009906; cv=none; b=MX8xhwvybST1N4Q6NBHGJFJvQEYf4V6SCBmC9nx8x0OeNv6fHao/sa78sPgnjCZg6Sy8VFNbd3eIm6z4YHAtNpV290XnPEx0fIpaY0TQK8nAdEnwTsvD0AdiDX/A2nlN+5hc5eEhrccg97+xs2xFDmFHrZteguD9vsFkAus8pQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785009906; c=relaxed/simple;
	bh=nIlnJRPNwvzsEQ9oqxaZZWX8opcLYnBostsYhgueMJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RsQlZ5+BrgfLzZ17iBsGwM12Nl+NkBH8lPPMYYBxA5I6wA3KvuKQFoUfgwWQJQ9UgMQW/iCCkTxFJOHifRREHYBAJON2z5mkeclvPeNpa6DJ6Xn2dk4v0PbYkY5eoHMEh3C9PyjVnsW19wJh253UsncuMDAF0YHD0WCHabf1tzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEoKA0T2; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEoKA0T2"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c8612812170so170961a12.2
        for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 13:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785009904; x=1785614704; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I7YnUNHQ+9mCV7Z3kMgXnU2VDcDD/IXSwFksJNwhhcY=;
        b=KEoKA0T2mEkyJvTNPM5Vm/Xvyp9hwRzZlnqM16eRfXhdZf9OzsMXH4xKHwsYMihsgl
         +CEkEZrkc7BWEl0rFWev1ZHfXhTadwHc8TDPcPOXfOulOtkK8lftpWZgPp3bBL2wxyaM
         EV8YsQ+RnT7g3beOC+Ip5S4ouExrx0EH0XrZwTRMKlydNm8OdQyv7o/52ib17sXK4875
         iRHrRi+ZIAzzZhGVhPsgmR16r66pqpRQvlzzeOug/VTSXjnvNVWptfVtm2QOQqtHvhMm
         iHql2kwTLRPwibP38CgFUQtYF4rNR9j9QzolLsjDqYcs5LrvmGJpR6FNen4TF1bis1kH
         fFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785009904; x=1785614704;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=I7YnUNHQ+9mCV7Z3kMgXnU2VDcDD/IXSwFksJNwhhcY=;
        b=dFFMQVNUaNdMahTu9oP77zJq4dHNh3CgHUKcgS3tqr7Ath4F8ml5YBGSX41EHv+wzF
         oWRhu8aNdRTVhsz7nwKZhxMh+dKeluGuSIbIHcHBxLrEoIr+by8i4HQ/QJGCPQXnUt+5
         CvL7qyBdyWZ2pCLWgYVfG6k+kWJWKw2vA5oYDmA5JGh+9xUMYCBHyvCUtxYgixOIX4jm
         0GVdS/EzRW6bFvKeJC1Rsn3Iwan7P2VNqg6zsHEDAH6W7yr04Z58ONU+/Qucv6QFhr9h
         csIiJtTHFDumgtWBiCs4tV+3X6oARwys1vwCfsYJjH8G/D0Ra/OPSdq7iVqTgxoIXx06
         lwgg==
X-Gm-Message-State: AOJu0Yy2oDfXe+whq+aVNB2yq8Zev3Ai0itMl4AaIl587lo+9Ro3AUOL
	rXECnmL4j54Dj/ugyCOGxc1unevEbel0gteRZdbYgg1Rc4i7kDYCWitO6GEUmw==
X-Gm-Gg: AR+sD10F51TnulJfrpYl9/mTss+sQe4a0Hqr+fnAtiBkxda1sVvU1W6eOt9yvV8X/S0
	5045fQK2EdkfKTazCfVZLloKyY/eQRzHs35g9fu+c7QAKBsn1tA4CHqnpg5vRtnK0nfmrJ4cADH
	oixHzzg4OZTcdBL7vgLNC1tRRxkd1uSyft/NgAo2ka6XCExtRkCrEJVnxDeN2cHkanSax3bRODk
	WfQSZXAQnDAks3J6OyKxHjs76yaflPyTZmMvG5mKdrjB8AKp9MCPQXcbrXPP2cHaKsT8W67XBdR
	mvZI0s3XuDzmAyd5pFgeXZP9Z+1ceZXdZIZ66THCfwDjoZgkq28787/to2HzjG7LJD4xRusjBcp
	albFnPLJ0+sBTi9/2v9MmBjIiTvLSW5B2JOdKL4QD0++QtSSNRCsFVZXZR3cx+YGeDj4LK0Wthn
	vCg+NPshrPWKZlZO0=
X-Received: by 2002:a17:902:d485:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2cfde882c08mr26162755ad.4.1785009904026;
        Sat, 25 Jul 2026 13:05:04 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5424:789e:7bf2:671d:d7ae:b910])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548e29sm13487817eec.15.2026.07.25.13.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 13:05:03 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 26 Jul 2026 01:34:08 +0530
Subject: [PATCH] dt-bindings: clock: ti,keystone-gate: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-ti-keystone-gate-clk-v1-1-5b2449bc31ee@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSwqAMBDFriKzdqBWqJ+riIuiTx2UKm0RRby7x
 WUgyUMBXhCozR7yOCXI7hIUeUbDYt0MljExaaWNqrThKLziDnF34NlG8LCtXE41StWYpFSU0sN
 jkuvfdv37filDG2BmAAAA
X-Change-ID: 20260726-ti-keystone-gate-clk-3f8e30966077
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Murali Karicheri <m-karicheri2@ti.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785009889; l=4399;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=nIlnJRPNwvzsEQ9oqxaZZWX8opcLYnBostsYhgueMJg=;
 b=tD0xE+8Vd2J6xBsPdrE5/hOSJEeWwG8G8stlnOTdRmfvqtVdO53Vho6dZ2rPDvV+knjEL6iUJ
 bPQ6WZZhneaADjLF+fTE1J4fS/IhkSeWm+0n6P1IYvLMad/RkBc+I3J
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments keystone PSC clock binding to DT schema.

The vendor-specific 'domain-id' property is intentionally kept without a
"ti," prefix to preserve existing ABI since driver and existing board
file use property without "ti," prefix.

Also update the reference to this binding in ti,keystone-rproc.txt to
point at the new filename.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/clock/keystone-gate.txt    | 27 ----------
 .../bindings/clock/ti,keystone,psc-clock.yaml      | 60 ++++++++++++++++++++++
 .../bindings/remoteproc/ti,keystone-rproc.txt      |  2 +-
 3 files changed, 61 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/keystone-gate.txt b/Documentation/devicetree/bindings/clock/keystone-gate.txt
deleted file mode 100644
index 43f6fb6c9392..000000000000
--- a/Documentation/devicetree/bindings/clock/keystone-gate.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Binding for Keystone gate control driver which uses PSC controller IP.
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "ti,keystone,psc-clock".
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : parent clock phandle
-- reg :	psc control and domain address address space
-- reg-names : psc control and domain registers
-- domain-id : psc domain id needed to check the transition state register
-
-Optional properties:
-- clock-output-names : From common clock binding to override the
-			default output clock name
-Example:
-	clkusb: clkusb {
-		#clock-cells = <0>;
-		compatible = "ti,keystone,psc-clock";
-		clocks = <&chipclk16>;
-		clock-output-names = "usb";
-		reg = <0x02350008 0xb00>, <0x02350000 0x400>;
-		reg-names = "control", "domain";
-		domain-id = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti,keystone,psc-clock.yaml b/Documentation/devicetree/bindings/clock/ti,keystone,psc-clock.yaml
new file mode 100644
index 000000000000..ed42adb27832
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,keystone,psc-clock.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti,keystone,psc-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI Keystone PSC clock
+
+maintainers:
+  - Santosh Shilimkar <santosh.shilimkar@ti.com>
+  - Murali Karicheri <m-karicheri2@ti.com>
+
+properties:
+  compatible:
+    const: ti,keystone,psc-clock
+
+  reg:
+    items:
+      - description: PSC control
+      - description: Domain
+
+  reg-names:
+    items:
+      - const: control
+      - const: domain
+
+  domain-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: PSC domain id needed to check the transition state register
+
+  clocks:
+    maxItems: 1
+
+  clock-output-names:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - domain-id
+  - clocks
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clkusb@2350008 {
+        compatible = "ti,keystone,psc-clock";
+        reg = <0x02350008 0xb00>, <0x02350000 0x400>;
+        reg-names = "control", "domain";
+        domain-id = <0>;
+        clocks = <&chipclk16>;
+        clock-output-names = "usb";
+        #clock-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
index 91f0a3b0c0b2..847552133633 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
+++ b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
@@ -75,7 +75,7 @@ SoCs only:
 
 - clocks: 		Should contain the device's input clock, and should be
 			defined as per the bindings in,
-			Documentation/devicetree/bindings/clock/keystone-gate.txt
+			Documentation/devicetree/bindings/clock/ti,keystone,psc-clock.yaml
 
 The following are mandatory properties for Keystone 2 66AK2G SoCs only:
 

---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260726-ti-keystone-gate-clk-3f8e30966077

Best regards,
-- 
Bhargav


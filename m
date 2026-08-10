Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44EB3E0241;
	Mon, 10 Aug 2026 12:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364163; cv=none; b=beOUdfJCp27jBLLRs9TLdPNOlmCWb8tXn+tkMP/ZnZt1hYYfJmUWB9LzU396sZrJ3ZXlnuvKCXORcE4IHOa66b+ZZ0bqa2e9tWUupy3plD1xvNzQ99Uo2/iKQytotXtbM02ShhYlw+jzkW+NItU58COYULYsNSObAqUqGkMs3LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364163; c=relaxed/simple;
	bh=bYGrXRj8Po9cz3ohfc2Ovi9o70pqezxvdpfAPljBFgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PvKzoY22NO3gFG41bR6eOJ7jTCHaAp7+t+y+mjE5L873pzbdL8zA3A+6C1RMWCrRsW9YI100QSJ8U5oxT4HQU2Uyw596yGcSWC+kitUg8gr/5L2FHz0TBKn8LxTpTG9oaktYEJ1nclDwgJ5UrejYYd93mS8eR7jYXyS5NMwzoKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=nxvNEE11; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="nxvNEE11"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74A56BFAEB;
	Mon, 10 Aug 2026 15:15:57 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364159; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=j1MZTVd373in/IMAt/QC2whUgnWuRGxEI5v6pl6Py28=;
	b=nxvNEE11H9zqz15OnmCrMYQYJVUrhuPfJ5WkRponEciyDxEGANuP/9yOFyEFfIWBkA5H+Y
	rhyiOhKu9RCPNXrgS+nlqgxfPzuRwmquKr0w7KjBpVK+osankuAWfKo5PuQUmOa+P4nK0m
	w9apiw8iaV4D+HMO9JwYh2L5bwDoEOaO0NaKsSOiygJdqzdeI70fuaTWFuwLcyfkPZTf0w
	8y3KLG8li42QO64gtlqg0m6k9LWGaxibGnllWZA4a2v2u5rin77joC4pgN7pUz64Np+jjO
	US+kLFL4fZ8GKVC/842mXTb2z5Liz5pCxe4uDh5PADrikeImrigtcXAGCQs0eg==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH 09/25] dt-bindings: usb: rockchip,dwc3: add RV1106 SoC support
Date: Mon, 10 Aug 2026 15:11:00 +0300
Message-ID: <20260810121121.210040-10-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document the DWC3 USB controller found on the Rockchip RV1106 SoC.

The RV1106 has a USB2-only (high-speed) OTG controller. Unlike the
other supported SoCs it has no dedicated suspend clock: it only needs
the 24 MHz reference clock, the AXI bus clock and the UTMI clock.

Since the top-level clock-names list enforces a fixed order with
"suspend_clk" as the second entry, relax the second and third entries
to enums so that the RV1106 clock set (ref_clk, bus_clk, utmi) can be
expressed, and add a per-SoC clause constraining RV1106 to exactly
these three clocks. The relaxation is required rather than cosmetic:
every other compatible's own clause already agrees with the shared
tuple position-by-position, but RV1106 genuinely reorders it (bus_clk
before utmi, no suspend_clk), and allOf branches are ANDed, so without
loosening the shared entries the two clauses would be unsatisfiable
together.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 .../bindings/usb/rockchip,dwc3.yaml           | 35 ++++++++++++++++---
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
index 0554dbc4b854..86e00f251bdb 100644
--- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
@@ -31,6 +31,7 @@ select:
           - rockchip,rk3568-dwc3
           - rockchip,rk3576-dwc3
           - rockchip,rk3588-dwc3
+          - rockchip,rv1106-dwc3
   required:
     - compatible
 
@@ -44,6 +45,7 @@ properties:
           - rockchip,rk3568-dwc3
           - rockchip,rk3576-dwc3
           - rockchip,rk3588-dwc3
+          - rockchip,rv1106-dwc3
       - const: snps,dwc3
 
   reg:
@@ -58,10 +60,11 @@ properties:
       - description:
           Controller reference clock, must to be 24 MHz
       - description:
-          Controller suspend clock, must to be 24 MHz or 32 KHz
+          Controller suspend clock (must to be 24 MHz or 32 KHz) or
+          Master/Core clock
       - description:
           Master/Core clock, must to be >= 62.5 MHz for SS
-          operation and >= 30MHz for HS operation
+          operation and >= 30MHz for HS operation, or UTMI clock
       - description:
           Controller grf clock OR UTMI clock
       - description:
@@ -71,8 +74,12 @@ properties:
     minItems: 3
     items:
       - const: ref_clk
-      - const: suspend_clk
-      - const: bus_clk
+      - enum:
+          - suspend_clk
+          - bus_clk
+      - enum:
+          - bus_clk
+          - utmi
       - enum:
           - grf_clk
           - utmi
@@ -145,7 +152,10 @@ allOf:
         clocks:
           maxItems: 3
         clock-names:
-          maxItems: 3
+          items:
+            - const: ref_clk
+            - const: suspend_clk
+            - const: bus_clk
   - if:
       properties:
         compatible:
@@ -161,6 +171,21 @@ allOf:
             - const: bus_clk
             - const: utmi
             - const: pipe
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rv1106-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: ref_clk
+            - const: bus_clk
+            - const: utmi
 
 examples:
   - |
-- 
2.47.3


Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B021314B8F
	for <linux-clk@vger.kernel.org>; Sat, 14 Feb 2026 18:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771092632; cv=none; b=t1MK1LyA0xMRdyFUsg4ZoBmeL1H9q4CBc+yro+HqTp28oVbiu73ieEJWE5zUNT2RtPZIj4QUUX+wfZ3wtibLCa7Tt53DNDUjCnUbB0PGdLJdsLCQBymHCgvYJi9LV+dyJaVCZ6prc3f6wFDr+R2MNmwj5KXKEaG2JaEH05F+8/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771092632; c=relaxed/simple;
	bh=AJlHYfxIvBl5RZQ9zTgwhN3YoknQjxSKJx/4Ql9uZFA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IpB9i0sXpPcZF/dAT23NEzXurKQ0+dWoi00mtZXyb+NZ9Q3BnWIJKX67/oIlmZpZLl9L5XbFa5hYwMB2l3kOclRruikQSxC+9y+c2ANv55TW5ygp0+uZKH8XkEOO7AJovEt88UBu3d/gSrxyRKoZBLvLYAdw2YuQz6kk+PHJWKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Tj6+zAEZ; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Tj6+zAEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1771092624; x=1771351824;
	bh=rwsnzH8jOGlUyiBNnOHeUfIy3Fa0IVng/RKkWIkfN6c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Tj6+zAEZlGr5eJXYuhw8QYFrTTTtk+TizrUM0X1sSioH79T+zvkIYr39lm73vLh8p
	 F8IiLRU1SFgqXIzJzQf0G3diKLzB226f72p2POG66gqQ5i+XwubFZNHGnSCYT7eV+M
	 Ltx+FFg/7P0wFD3zsvoXVO1yMIeR0yMEYofoqtPohespQDc4FxiB3FbQYLOLcIRWam
	 6MaLgqO3ROhIVSCYkKJbvkpMb5Wmjpt6clNfAfXIAL1r4dmJl2k7ING/SgJig2PAnW
	 8zXbv0V0cTP+0LEVilcY9NFW3jhCPNE31nrRyOmHsrzmVQqGT9oA78kqoTLPAK+91n
	 lUVR/ugjDWbpw==
Date: Sat, 14 Feb 2026 18:10:16 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH v4 1/2] dt-bindings: clock: xilinx: add description of user monitor interrupt
Message-ID: <20260214180933.42143-2-hpausten@protonmail.com>
In-Reply-To: <20260214180933.42143-1-hpausten@protonmail.com>
References: <20260214180933.42143-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 7e6743f472392713e83bb028a7961a7e4545dc21
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This Xilinx clocking wizard IP core outputs this interrupt signal to
indicate when one of the four optional user clock inputs is either
stopped, overruns, underruns or glitches.

This functionality was only added from version 6.0 onwards, so restrict
it to particular compatible strings.

Signed-off-by: Harry Austen <hpausten@protonmail.com>
---
v3 -> v4: Slight rework and rebase, removing Krzysztof's R-b tag
v2 -> v3: Add Krzysztof's R-b tag
v1 -> v2: Fix binding errors by moving interrupts up front, restrict later

 .../bindings/clock/xlnx,clocking-wizard.yaml  | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.y=
aml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index b497c28e8094f..7688601f1f31b 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -38,6 +38,14 @@ properties:
       - const: clk_in1
       - const: s_axi_aclk
=20
+  interrupts:
+    items:
+      - description: user clock monitor interrupt
+
+  interrupt-names:
+    items:
+      - const: monitor
+
   xlnx,static-config:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
@@ -66,12 +74,24 @@ required:
   - xlnx,speed-grade
   - xlnx,nr-outputs
=20
+if:
+  properties:
+    compatible:
+      enum:
+        - xlnx,clocking-wizard
+        - xlnx,clocking-wizard-v5.2
+then:
+  properties:
+    interrupts: false
+    interrupt-names: false
+
 additionalProperties: false
=20
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
     clock-controller@b0000000  {
-        compatible =3D "xlnx,clocking-wizard";
+        compatible =3D "xlnx,clocking-wizard-v6.0";
         reg =3D <0xb0000000 0x10000>;
         #clock-cells =3D <1>;
         xlnx,static-config;
@@ -79,5 +99,7 @@ examples:
         xlnx,nr-outputs =3D <6>;
         clock-names =3D "clk_in1", "s_axi_aclk";
         clocks =3D <&clkc 15>, <&clkc 15>;
+        interrupts-extended =3D <&intc 52 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names =3D "monitor";
     };
 ...
--=20
2.53.0



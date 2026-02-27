Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839AA36E46D;
	Fri, 27 Feb 2026 18:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772216162; cv=none; b=ZSvbtGyqXhvK2/Xt6Mu7gmf2WCMZMFyISkffaqbshpMg9/btE9jyW3sVwR2zm9s+iGGjfCRddpOKV9I2Zh7IsjhaqpTxZ845/PSKmLGPLvNQqgclTYgnD7kpJfp/UGbRplkYJypf+pzB23sGnsZFJGKM5/H0nXMjsxNyrB4v/Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772216162; c=relaxed/simple;
	bh=0+Fi1shsqkA5k9Wt5WwcpWWFptWOgmCFGdHIEqxrYE8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bexU7KYUcDveydff5XjRFgVR9+MAH8tCzVdGPAChveD3tfN0z7iomk+XBJseKefJdXdagmEh+8Oxs4AIj45RSGvZdTvIViotUJyN3+k8qLpAwuULUsHxrRYNH6yX6UhqkXjZ1N9AdS4wLAN66rGYlKcTwT2wxH2AdLVf9JxSClA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=iRCns1pQ; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="iRCns1pQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1772216153; x=1772475353;
	bh=GYNWoyNeM61dMX+Jlp03IYq35smbPMrmiwnNODDRNgM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iRCns1pQxEIUw84b42Lohz//YaJ7C7QUqmTO7tGYWh/R5j5jRnFY3yzJdrB1eDl04
	 Zyuan9c7BCA1gIT4O4YZHQwONNiG8ImT5F+Opay0qTjgqrfFZvanelEkjQrdpKAXZP
	 m6XcslYnv28U7bDHX3eCtci53PF8B3siLdNBvqCBXLT0CtpSWzSIkJbQ1GWQ8lrSQC
	 zRT5V2YRBrtnKPLIR2z5p7WYyFCZDGXjXUI2RE5ntoJ0326oqGnp57gMxsz62nqFkD
	 bN9ymR5kZHgmF9BIZPPrRH5EIsCo1NUgkTM/RHWpAcSU4NAjsjoNr0kyllPRxXEdlk
	 Me3YW6YQblRXw==
Date: Fri, 27 Feb 2026 18:15:49 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: clock: xilinx: add description of user monitor interrupt
Message-ID: <20260227181507.19890-2-hpausten@protonmail.com>
In-Reply-To: <20260227181507.19890-1-hpausten@protonmail.com>
References: <20260227181507.19890-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 4b6ac4651e9d8cd4d080f05b8b64032d3422bbe5
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v4 -> v5: Add Krzysztof's R-b tag
v3 -> v4: Remove allOf and rebase, removing Krzysztof's R-b tag
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



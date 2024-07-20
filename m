Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167B7145B26;
	Sat, 20 Jul 2024 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721476936; cv=none; b=ZWN5bhGmLs4awCnmpWnpRBQjzvUPba+Puaurpm48NaMeeWMaSBa8AEsZT02QD+byDBJXuUCabd+z5Nm/edOtOqaj3wsrHB53Xp1rvBLW7bQm8rx12vmQY3LMSbZXXQ7xaFNYGHSlK/1RzHItWfZMrWKDB0zuj8iFylUriA0vm2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721476936; c=relaxed/simple;
	bh=FFI82Xg9C+mJWQFwrDNs+VNClbSmNxB8OQn/7KycysA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FynYnff7gDg6vL/w99S9tO0ASaq+hzbmuBfOtFQ2lrGAnB0HVLNL4VxL2MiEjeo8l8/oJtvolo92YW+bohc+YvDr6B7mw97gsgYEpkSk817eCeCXaPYHXOZCa/f//ZXrnSvXhPAdYCGJgiHDvkVeA78/ECTSS8Br8urwve6fOas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=LX42+DEy; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="LX42+DEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1721476933; x=1721736133;
	bh=WJZ7g+kXXfL0wg2Zcx+pw02ts1r4ONFA7atCWwb1Qyc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LX42+DEyb0EgPt2nWmCNzgPg+PvCN5PlWxIb50EBjSK2RJl4ipxvbLgkD6GAqwKgL
	 nneAdlOYq6lBD0/iauaVs6x8bNjj/D/n0R/PATNpvw8kwrT706F1ZDKndwhUD/WI0L
	 LwFDjs3UA5T+vMXS7BhVNsGZe4fqRWFDpv6khvkmYGJUGxoslgbWZGd7ibfNhAT8Vd
	 bB1t4JHvl7X+2sq0kGOo77U3w/4Wg0teYk0wi0jHkzCa8Poo8hutvn7yvLSmQDUGtH
	 To5V6cpbzuc6ZDOButUx6J4YnnbRNoP9p7YUia7nghdxz2pPAL8Kjsi5Pc4tQPD6uS
	 +t2mRJ8JzzvJQ==
Date: Sat, 20 Jul 2024 12:01:58 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH 6/7] dt-bindings: clock: xilinx: describe whether dynamic reconfig is enabled
Message-ID: <20240720120048.36758-7-hpausten@protonmail.com>
In-Reply-To: <20240720120048.36758-1-hpausten@protonmail.com>
References: <20240720120048.36758-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: db28f5ae1595ffc1bce3f290237154e5a921318d
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Xilinx clocking wizard IP core's dynamic reconfiguration support is
optionally enabled at build time. Add a devicetree boolean property to
describe whether the hardware supports this feature or not.

Signed-off-by: Harry Austen <hpausten@protonmail.com>
---
 .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.y=
aml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index 4609bb56b06b5..890aeebf6f375 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -40,6 +40,12 @@ properties:
       - const: s_axi_aclk
=20
=20
+  xlnx,dynamic-reconfig:
+    type: boolean
+    description:
+      Indicate whether the core has been configured with support for dynam=
ic
+      runtime reconfguration of the clocking primitive MMCM/PLL.
+
   xlnx,speed-grade:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [1, 2, 3]
@@ -88,6 +94,7 @@ examples:
         compatible =3D "xlnx,clocking-wizard-v6.0";
         reg =3D <0xb0000000 0x10000>;
         #clock-cells =3D <1>;
+        xlnx,dynamic-reconfig;
         xlnx,speed-grade =3D <1>;
         xlnx,nr-outputs =3D <6>;
         clock-names =3D "clk_in1", "s_axi_aclk";
--=20
2.45.2



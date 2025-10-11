Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E3527AC2F;
	Sat, 11 Oct 2025 17:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202184; cv=none; b=UolTdFW4gAI4OsWe4rp128/2E47TObMmlEu6J1y3i57kKLCkNSWVJaWhqepKDU/qo8CivBES9pko0gorDM7EOfwKi+6ETHnEtcx4fB0Mcnk5NSsRGNbJd7dEHtk/f+qhd/bkXX11rJSXa6zYm9/EXKoRjC2uT7kfEQJlZRJOV+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202184; c=relaxed/simple;
	bh=RIiKrgIvMU/IjFcqOPDAzbGkKomi1CihhO9jPnIYg88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSF+vXgy3+U2XaGJx1F7LEdCWPGew3gXLfzcWoES6M5utcfJ2a4cZ+C71UhiupdVhioItNTE16P9q+GF4AWOx/fvm7AjY1amSdKfcmf1Z6F/K8ot7NCExLPlD4FIxONeSbxIqif1b7d6BaJ875EkY+Esk1Dw8viB8McMRd0anpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=e7edRgvr; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vEZiE5kR; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="e7edRgvr";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vEZiE5kR"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckVKq29N6z9svm;
	Sat, 11 Oct 2025 19:02:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5LIwADdeTrYwbX6llVTzDuJpx8CtqSl8BhfaECop4A=;
	b=e7edRgvr7JCvLHkAnG2gKhAYgQgN1BDydmcfE24RmzO9bTGEPJoeeueGSxojF6dvwz3vNQ
	TzUJHpnC05SshopU/YEyWiUlSZy5JhrMU8iqs6OoJywYRR7nPXzN+lDFeHDuWVZ9iwScpE
	+t5R1w0MjEs3xnjR0tODpKwGH+53kcbzWwx4je6amDuh6RmJ8MM/b1PDYi7Fr5uaJEhVwX
	Zf82lRtf2TQFKQjIjjFcC5/XZ29Snq0KAStl3g14Ai4zwaMGPVWq8aga0u4mFtmUppaFuK
	t4YNw1cTVjo8aSCXTSGddvVtdquvqbpOyexZ7hieCJ0cSGuZ8hpGtd3sTr0qQw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5LIwADdeTrYwbX6llVTzDuJpx8CtqSl8BhfaECop4A=;
	b=vEZiE5kRykGhGEjoOqVbJP0v71GbvnBv3DNUXoBdCQweCz3kGCpE1TzRUPSDE68yKWXh84
	XKQ3nvmO7zTC1rLi2ERpioTilckplNCIaqRjQ5BSIG9QbCww57kzLBMOvi4OePMczmc6oG
	Hu0Fyk92lCY/f/4/gbtDY/l/eQ4ztCD0/x4fkZ3fcVUYS9/gh53GVpoYwyIDKInj9ZShJK
	lmycnmUlqFM5wOHDOybzS/lrsQwBpgFpYWaaDlAqKKnkm8DC5iJYFa39HoPjQnsFjWj2KF
	msBk3CzVpBnpmGLqZ+talo7CMxhgofzd4DpnlzhKX8jfy3FUyVfSwyW7bS9hmw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display Controller DomainBlend
Date: Sat, 11 Oct 2025 18:51:16 +0200
Message-ID: <20251011170213.128907-2-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gqxarmiuu1o1k3jtio5duniphc4sjzo3
X-MBO-RS-ID: 54db7b2b31df76cf6e5

i.MX95 Display Controller display engine consists of all processing
units that operate in a display clock domain. Document DomainBlend
block which is specific to i.MX95 and required to get any display
output on that SoC.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 .../display/imx/fsl,imx95-dc-domainblend.yaml | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
new file mode 100644
index 0000000000000..703f98e3321e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx95-dc-domainblend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX95 Display Controller Domain Blend Unit
+
+description: Combines two input frames to a single output frame.
+
+maintainers:
+  - Marek Vasut <marek.vasut@mailbox.org>
+
+properties:
+  compatible:
+    const: fsl,imx95-dc-domainblend
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    domainblend@4b6a0000 {
+        compatible = "fsl,imx95-dc-domainblend";
+        reg = <0x4b6a0000 0x10>;
+    };
-- 
2.51.0


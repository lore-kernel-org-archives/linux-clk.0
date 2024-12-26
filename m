Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB2728F5;
	Thu, 26 Dec 2024 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735227136; cv=none; b=u2mkozMAxf1LC1uBBP3LGnIc1++EZxh8DyZOzWD94VJc+4Iv6PPO0xB+FVBHLHbW0xvtcfwtD8vtxTRiwcDnzlIh4JJ/eiIRIlhlPGMX2hGsn7QoS152Dv7p5yZ2oO88JxDpmoHGZmf8UY/Ta2y8MEgOUavv6sn5Zl6BI+c7m/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735227136; c=relaxed/simple;
	bh=XG5wfEFnvgv4JHy0e1TZWinPeEPRdFLWq7DR1JbJ2Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqY7pjcPDulUte4fI0h/eumFPwetGnc56KCcImPQcijyRsjVIQeG/UlfSDie9h3p7QmSX1nDJpplm6+9f1YTlrrh5/EQMXQXfeECSzsx8jM7U3oh1+AQ7UJ/1t/4YI0neE/q0rT/SQDGi3PDnfvdsprEFZXux0qdFocSqo86Kds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=JT8HIk9t; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="JT8HIk9t"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12CC71040DBCA;
	Thu, 26 Dec 2024 16:32:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735227131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mlPjGe+YvDRKwEhbsCQj6RcWcvFNND+nWTvb971d0UQ=;
	b=JT8HIk9t/KSNNx/ovdOK5IohmQ5NEH6wbrWS7VvSsasgc+L0DVsiN7g2R7PKRjuCilq/Iw
	qePgHueGsgh92ox3XFv+8lWkh/DS8+/m/KODgKdh1I2NM+LiEGQ+2hmmdsz2C1EoNFs3Jh
	vsEx2frhzrIh4fvGYnEJoZWAiFWeBMFqlh9+7CbTtLGAQ/PDrTDiRKarCHTcuSWHBQzJev
	GVr1wJjPLX5bwMWQ3QqcV+P+1y2fTiNbEbOBRaoov6igEx90UgUUEYPNFy+lGn4SxH+wVg
	DThzCdpeSUXz6qcBIuXvYIZfsK3gX7fmZJyftdgCPEOFldQgFQq0maneZKM7+g==
From: Marek Vasut <marex@denx.de>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: clock: fsl-sai: Document i.MX8M support
Date: Thu, 26 Dec 2024 16:30:27 +0100
Message-ID: <20241226153155.36351-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The i.MX8M/Mini/Nano/Plus variant of the SAI IP has control registers
shifted by +8 bytes and requires additional bus clock. Document support
for the i.MX8M variant of the IP with this register shift and additional
clock. Update the description slightly.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-sound@vger.kernel.org
---
 .../bindings/clock/fsl,sai-clock.yaml         | 32 ++++++++++++++++---
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml b/Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml
index 3bca9d11c148f..e62543deeb7da 100644
--- a/Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/fsl,sai-clock.yaml
@@ -10,10 +10,10 @@ maintainers:
   - Michael Walle <michael@walle.cc>
 
 description: |
-  It is possible to use the BCLK pin of a SAI module as a generic clock
-  output. Some SoC are very constrained in their pin multiplexer
-  configuration. Eg. pins can only be changed groups. For example, on the
-  LS1028A SoC you can only enable SAIs in pairs. If you use only one SAI,
+  It is possible to use the BCLK pin of a SAI module as a generic
+  clock output. Some SoC are very constrained in their pin multiplexer
+  configuration. E.g. pins can only be changed in groups. For example, on
+  the LS1028A SoC you can only enable SAIs in pairs. If you use only one SAI,
   the second pins are wasted. Using this binding it is possible to use the
   clock of the second SAI as a MCLK clock for an audio codec, for example.
 
@@ -21,7 +21,17 @@ description: |
 
 properties:
   compatible:
-    const: fsl,vf610-sai-clock
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx8mm-sai-clock
+              - fsl,imx8mn-sai-clock
+              - fsl,imx8mp-sai-clock
+          - const: fsl,imx8mq-sai-clock
+      - items:
+          - enum:
+              - fsl,imx8mq-sai-clock
+              - fsl,vf610-sai-clock
 
   reg:
     maxItems: 1
@@ -32,6 +42,18 @@ properties:
   '#clock-cells':
     const: 0
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: fsl,imx8mq-sai-clock
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
 required:
   - compatible
   - reg
-- 
2.45.2


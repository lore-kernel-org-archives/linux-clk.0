Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36AD23312E
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736775792; cv=none; b=sW2cEU0kqvn0W+XUeNVmttkf7/A+Wb1+lo5KYg2V+vnA1dm/dZg8I7F6a3x2Z63DOS+WrigTGMF0u/C7R+hOG56OwnBdKrvE4W1wgf6ofcrdHBNRiR1ZiddlwjH35bkiHnIPelLtYLnL10QyntFe3jpsF3LiZlJYuZ6bd1CH7W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736775792; c=relaxed/simple;
	bh=Hm1YnTDxuiBgY40XOLmZ5t0EOlED59z7/rK9qLKJK/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VFRN1MT35IafRf4GVrn3fXDATaq5NhdKxuSLUWFTpxbmnI/5ZR6o3F21GOCPcQYEP7RaDy4ang2eGtV1JnX8Gtgtw80J6QCRvpqBGDOSlq6jrU5nkRQoX34ZvnRcvzXqkhRGBbxWeR3CO19Tb0F/td7vT2zKzi6hB/0PUA09Wac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKib-0002p0-Dk; Mon, 13 Jan 2025 14:43:01 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKia-000Ghv-1Q;
	Mon, 13 Jan 2025 14:43:00 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKib-00GZFh-1q;
	Mon, 13 Jan 2025 14:43:00 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 14:42:51 +0100
Subject: [PATCH v3 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-imx8m-clk-v3-1-0d6e9bdeaa4e@pengutronix.de>
References: <20250113-imx8m-clk-v3-0-0d6e9bdeaa4e@pengutronix.de>
In-Reply-To: <20250113-imx8m-clk-v3-0-0d6e9bdeaa4e@pengutronix.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>, 
 Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

The imx8m-clock.yaml binding covers the clock controller inside all
of the i.MX8M Q/M/N/P SoCs. All of them have in common that they
support two operating modes: nominal and overdrive mode.

While the overdrive mode allows for higher frequencies for many IPs,
the nominal mode needs a lower SoC voltage, thereby reducing
heat generation and power usage.

As increasing clock rates beyond the maximum permitted by the supplied
SoC voltage can lead to difficult to debug issues, device tree consumers
would benefit from knowing what mode is active to enforce the clock rate
limits that come with it.

To facilitate this, extend the clock controller bindings with an
optional fsl,operating-mode property. This intentionally allows the
absence of the property, because there is no default suitable for all
boards:

For i.MX8M Mini and Nano, the kernel SoC DTSIs has assigned-clock-rates
that are all achievable in nominal mode. For i.MX8MP, there are some
rates only validated for overdrive mode.

But even for the i.MX8M Mini/Nano boards, we don't know what rates they
may configure at runtime, so it has not been possible so far to infer from
just the device tree what the mode is.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 Documentation/devicetree/bindings/clock/imx8m-clock.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index c643d4a814786a1fc7e559140fe58911990f71bb..b03672255cae9462013a8a4e7a2adaff440f1420 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -43,6 +43,16 @@ properties:
       ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
       for the full list of i.MX8M clock IDs.
 
+  fsl,operating-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The operating mode of the SoC. This affects the maximum clock rates that
+      can safely be configured by the clock controller.
+    oneOf:
+      - enum:
+          - nominal
+          - overdrive
+
 required:
   - compatible
   - reg
@@ -109,6 +119,7 @@ examples:
                  <&clk_ext3>, <&clk_ext4>;
         clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
                       "clk_ext3", "clk_ext4";
+        fsl,operating-mode = "nominal";
     };
 
   - |

-- 
2.39.5


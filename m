Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ACC3AFAEF;
	Mon,  7 Sep 2026 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773431; cv=none; b=s1IJ8/KsFj0lfcE9lW26b6JW/cksfQ3wa4guuWQoFxVgIPtxCPyfL/eZcuCF+declhCiUDh/PxPNxVi51qEDQg/d7d75uOx9+4ziLIgRm1OZxUWC/cLp3Eq1SxBjbo8DEemNgzDmbaKIoCYLtcqpzn59Nek1OF/yg5Zv+psqIdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773431; c=relaxed/simple;
	bh=pxt6eLN0eft6ujBqYKiE27aLEY7RCOUA55X+4FReXsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/q1EOFSztJq6QQXAji2Z98qxhIx9g6yrgbJVfrhRxFbnE96dxRjck+ZCayaY4GcTzOUnyahu6xh9fYG0VnUQpqe070NUZb8Fq0mUmwCkz73YeUN4ReBnbBl2rR7nXnGhbpU7O/mSBJ9F82sc75vxm7QT5MlxFDyONv8sWrXpOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E+mj+AQe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E+mj+AQe"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7151104C;
	Mon,  7 Sep 2026 11:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788773330;
	bh=pxt6eLN0eft6ujBqYKiE27aLEY7RCOUA55X+4FReXsw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E+mj+AQeNmAO6MedZblc41P0rFwkuq8uXttCkG74zDSXgvZ3e620k6v1anPQep7rN
	 dBuw9xfHCBWLZB3I0AV19VmEkFwA5CbDcZnWSfkRxk5JX4Pr6/kUAHNm+lTJttC7+g
	 gXemInFNk0wtV859zB0nSHTx1yuOZfquSRcDvFGw=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 07 Sep 2026 12:29:43 +0300
Subject: [PATCH v6 4/6] arm64: dts: renesas: r8a779g0: Add DSC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-rcar-du-dsc-v6-4-f8ef711a7494@ideasonboard.com>
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com>
In-Reply-To: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=uA3GD2PeSxEVbg+9Z716Dn4M8i3mnhsr+127qY8OFRk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqnoQnKy+o24MBKUSlPg7XgSi2et1hAFY605DMM
 Ptb5r/65K+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap6EJwAKCRD6PaqMvJYe
 9VUSD/9lLv6/1YPxcZaZpXOep07WtfY45JmaBDexy+IjfNWerhwX2XaZT+LX0fpy7dR0Fv5t/W9
 i0Xs3OSkV95tNbawQb36DwmLqCdzY75Jc1zJ+bOl1Jz4nmIvTPT7r3pZ5GXAGP2zOR81XJf9mXS
 bQH5QQYcWBS3zQx95PBg8vciGVg0OIRbmTq6H+2R06Llqg0V62aAMGuAxFLehp45mNjb9Wn22zn
 TqUInGs2RaU3QO6v3D2KuOVnoaItgNM+FIMUwq4cJ4DZ4wcSC2fJiG8EOUhw1ouG/Iy0GkbMqv9
 9dbIEdxBCteAznBKsasqHrt0zLCdQ/N3pbzO3ytzezF5/7LKXVq/6eFWMJ/wuU07Nsi70nzkNOr
 vgY1CM9RuX9k6yCIdxkCXYjbVPDGo7DqEu7wPuhfF4asDRPKjW6kRxIAMBy2a+lIKkCstPXBgIg
 C0m8Sff8bPaknU/9rjFM6p9y1JkSeRrhxtEFKcEHmtdSS5KzlDaHJypRlJfO6HtjBuxZamBaGfs
 t7DKuyACLN+lSb+nPqFk5kpbrtVGoAQS7R3AaU/q5Ggcf9yCGaWXPB0W/pFlFXmXshfGWyoIrZy
 fKaIeSmKIdVn7DBPZX/EtEIhMsRS30s1M50f/YhSp+OIfUf/Olxr9uUCCRkMrdU4erjn3JLm1Ee
 TULlwJs8a4HeuPA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Marek Vasut <marek.vasut+renesas@mailbox.org>

The Renesas DSC Display Stream Compression is a bridge embedded in the
Renesas R-Car V4H SoC. The bridge is placed between DU and DSI1 units.

The current dtsi file does not represent the DSC at all, and thus the
pipeline for DSI1 has not been functional.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
[tomi.valkeinen: separated the sparrowhawk changes]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 8a291447b904..285dd88e060c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2315,6 +2315,35 @@ du_out_dsi0: endpoint {
 				port@1 {
 					reg = <1>;
 					du_out_dsi1: endpoint {
+						remote-endpoint = <&dsc_in_dsi1>;
+					};
+				};
+			};
+		};
+
+		dsc: bridge@feb8d000 {
+			compatible = "renesas,r8a779g0-dsc";
+			reg = <0 0xfeb8d000 0 0x400>;
+			interrupts = <GIC_SPI 559 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 2819>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 2819>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsc_in_dsi1: endpoint {
+						remote-endpoint = <&du_out_dsi1>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsc_out_dsi1: endpoint {
 						remote-endpoint = <&dsi1_in>;
 					};
 				};
@@ -2551,7 +2580,7 @@ ports {
 				port@0 {
 					reg = <0>;
 					dsi1_in: endpoint {
-						remote-endpoint = <&du_out_dsi1>;
+						remote-endpoint = <&dsc_out_dsi1>;
 					};
 				};
 

-- 
2.43.0


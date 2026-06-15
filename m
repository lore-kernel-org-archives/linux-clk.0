Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2863B1034;
	Mon, 15 Jun 2026 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504945; cv=none; b=GXnhkwyyV0iw65oqyFLNdOquIPm2L6RYEhf1Syjt6MzIUIgb97NoonYDYAJH1+oGviYwM1fMkbfDnLKXPyvpe0JpWYjsxo380G6yDOA6A6ZVqGBp2esnvbusAbr/z5+vBKJYx+QNQ/ZfctlY5hA0cgOIS85YVPv0ktNjoYPPKZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504945; c=relaxed/simple;
	bh=E9L4d1Twb0VcpA6d9eHkgw0DEu1eDcYin1/Vpy9+V14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dRPBlgV01IXD/mhyt/4Z8Ugg5ktgd50SMjKmZxX/bMGHga3REo+/+OuAHM/6dv1LY0P4RxplZpdMvlSMFOe67DDD9uuQCea8lkuaKfbkMha+eiAfZXfVoKsxWp1JovbCXnrAx+/BzCeqT8kJmMB35brOmm6H5CYctTssGqJnbWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HhGLvqYx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HhGLvqYx"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F0801D41;
	Mon, 15 Jun 2026 08:28:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781504902;
	bh=E9L4d1Twb0VcpA6d9eHkgw0DEu1eDcYin1/Vpy9+V14=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HhGLvqYxQO6sFfx1ucqRSa4D5Y9gE2SRMDxwD4rT4BVONWebdntdGkTgry/jlFcU3
	 ZPjDBa5hBX54MMV70A8onA8o3swhHa4869GDaLQTcfAf/NqwrCKI/q5fQCv7GBNLHE
	 s2zLWghW+ukVUBOLO3grarJgX4tN10XBbK8BVBLo=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 15 Jun 2026 09:28:10 +0300
Subject: [PATCH v4 5/7] arm64: dts: renesas: r8a779g0: Add DSC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-rcar-du-dsc-v4-5-93096a1b56a3@ideasonboard.com>
References: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1946;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=bKF8NNBaB5el+uy0eYGad5GITf4SmcNemNPcZh/i4WY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqL5ucclj0nn/lzBt0QADVP2kRoU+7rxeyRk2I/
 hCphSTCwbGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCai+bnAAKCRD6PaqMvJYe
 9b4QD/9jbBOidGhsELn5NusK5gO7CwvC/MSE214ZZUOa0jAbXx2u4OP7/UH3qTJ245q565JV2ji
 irn9XmkK0gaz6zOpWVfB0ZS+DRE4FL0mSVEZ10FbjqkG9qd3uEV9VHlBQBwmeV9qtW2l1BXIdHp
 5U6E84vwad/h4u9qFFKLYTxCMwr9SDPrtcmMKleadp2CFr/Sr0iHE6xFvPjNxECM9Ut02pWmWa4
 ddhtktQgsBX3PsnA0+2f9+rts6fwxNcXJlERuEfOTVvq1FuKAo9T2J/Wuqd35tfuFX8IeDpyt4f
 Wga+s72UPNIxWWQzpZ8Qex5ynNfiZ5QCwdfRyMQgNzznADwvogmDAtvLZzwPnXq4XxqS3TkJOVo
 jFbGclB58mpxVQ2lOksR5Z/Q3BxW/aNO9wjsnubailH5jkOI7zwbWgyWIbLfT9R9sTQXkHvL4ds
 h0CCokjAM/UlM0VeG7cjS+zrkqx6z1kdVJNHCVjMJEGJhsRrFjK+4qMwEt/54Hdpjc330RFDAdV
 8K6Q9TdSGRjbk68PM7J7PqZixfO1bi+R1rfs6fgA6qIU/OqszBeTUJLi//A3CgQxFMUhFV+L4R7
 Us+mNyIkqEtYOg+T4o6z9NpfKoemeR+1qNRM7Y89INsAiAns8tiAJU8ak4gF1Dsg8RwXI/+9Rk3
 i/IPLdcIU9FzoSA==
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
index 82a7278836e5..123baaea8db4 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2298,6 +2298,35 @@ du_out_dsi0: endpoint {
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
+			compatible = "renesas,r8a779g0-dsc", "renesas,rcar-dsc";
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
@@ -2534,7 +2563,7 @@ ports {
 				port@0 {
 					reg = <0>;
 					dsi1_in: endpoint {
-						remote-endpoint = <&du_out_dsi1>;
+						remote-endpoint = <&dsc_out_dsi1>;
 					};
 				};
 

-- 
2.43.0


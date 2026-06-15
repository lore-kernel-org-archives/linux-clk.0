Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02733F661D;
	Mon, 15 Jun 2026 13:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529165; cv=none; b=LKv9oF2earzcHzVS2YS6x9q3iXxoP9E7DD7249CmRngzJV1+Iy7RtVUAdwv3WE7gXg3tLuIqaKdNERG2Z7y0HM5WDeWgWXrLYIWMkmHgksO10OYL7Gs2mZPkCxXWfx5cDYRlH5YdiwZqSeZCaOvim+rDRHtd1YjAZxX2b8zjyOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529165; c=relaxed/simple;
	bh=r5QjrFAZtSkTFwOWAs/qFvVvo8FOH/iWvMtmoLDe4uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVY+zpBCByFMjfZkYSIeCweejZSoPLFIilpMQmbwd6/D0M/6UT7i3HO7FzZvniZwn14q/hGdC7KRnJ7ZeyJWtcpmSzJh4MRnM1pfCdHS0nI0YcqEGKMDIvtauTG0jf57ywtEiklTVxJP5WhgZ9BVh3VkElqaUCbPZsYVb4NeEV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GzLDy6Zz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GzLDy6Zz"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4460120FD;
	Mon, 15 Jun 2026 15:12:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781529125;
	bh=r5QjrFAZtSkTFwOWAs/qFvVvo8FOH/iWvMtmoLDe4uU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GzLDy6ZzISFKKaks6yAIxJ8f9VXTGQcDB/ho+7jhVS3aDT6K0KdxcfoIRFW+xTIaE
	 zlOJ4dKVJFfUs8HHtSwjiaHwRBOuCZGsjX0hAe2CYfJe08JGEGTcBIGScNkTWKLTw1
	 66G6ty1mZIO71CLpHWwvSIOn0giRHPjFPGvuHtew=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 15 Jun 2026 16:12:00 +0300
Subject: [PATCH v5 7/7] arm64: dts: renesas: white-hawk: Add second mini-DP
 output support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-rcar-du-dsc-v5-7-aed1a28610e4@ideasonboard.com>
References: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com>
In-Reply-To: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2815;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=wbg5CCdU/74bk2tdhUnSaOwNMuA62RxSenB5kl7Y1u8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqL/o4hO8Dv0u/g5eAegc3ZL8aE0Fox9FM2aYv8
 Mjjtgwkyg6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCai/6OAAKCRD6PaqMvJYe
 9WUcD/9xr/HoWPyOJ1I7azh4/3qaRz/zftC5etteWeracQJZPcEk0IjT+iIioo4RdWPoncM3T54
 OaTr6jNI3KE8ioIHRx7rzYr1tSulAHOofCGOvqthGrVZ2XMejEkVb2JnKqE8GosTyrKiW8UKaYJ
 E09le1VY4fwC03w+62rMrR2bUuWMRcevpQtvZgry17/jloF8O10oeUju2T12g8TZbs/equxyl/I
 x3lNRKmlE5BbSFWrcyzrdWPsgFxsMIH5EZaJOJ8ycvKEWDJCjwLZW89GTIg6mp40edi3n6HJuW1
 /pIAHg7+ebB5FmT94UjylZuNF9+6HRa2GuxeGco/2H9IrdEvRsUPCZrV01WWEgHjbaOxHd+ac38
 0XuDww4UmLnabdfGCNynWEYPH/JgG5JGdQWiuOe4XvV2/MQq6G4YtmS3LWyoWQmFuBgzhqNjicw
 b/5jTw0rXF5nD1WgrmmT9466pJVHyWdAgtSnXVM0moiTMC7+H4Wdf3pCu3RCg2YwgyYWKCNWgYI
 1JYfnwnubejuiGBv380btPvQb8FrEBMgREtwGx+THiwbrCDfmd1T/qZ1k/zHdhMByMlCqqa0ztC
 JSYHt/KsixFoq2sK4BwAUBOp+ZzurkLkgY2ZmPLJyJko4KyzeWsSXLqc8w40Ugjc7nTSh90PoWH
 x9oU4qGk1jsnyiw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add support for the mini-DisplayPort connector on the White Hawk
BreakOut board. This connector is driven by a TI SN65DSI86 DSI to eDP
bridge, which in turn gets the pixel data from the second DSI channel on
the R-Car V4H SoC. Note that this port is not present on the White Hawk
Single development board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[tomi.valkeinen: added status=okay for dsc]
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../arm64/boot/dts/renesas/r8a779g0-white-hawk.dts | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
index 784d4e8b204c..89d60b83ac4f 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
@@ -12,4 +12,98 @@
 / {
 	model = "Renesas White Hawk CPU and Breakout boards based on r8a779g0";
 	compatible = "renesas,white-hawk-breakout", "renesas,white-hawk-cpu", "renesas,r8a779g0";
+
+	sn65dsi86_refclk2: clk-x16 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <38400000>;
+	};
+
+	mini-dp-con2 {
+		compatible = "dp-connector";
+		label = "CN15";
+		type = "mini";
+
+		port {
+			mini_dp_con_in2: endpoint {
+				remote-endpoint = <&sn65dsi86_out2>;
+			};
+		};
+	};
+};
+
+&dsc {
+	status = "okay";
+};
+
+&dsi1 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			dsi1_out: endpoint {
+				remote-endpoint = <&sn65dsi86_in2>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&i2c4 {
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	bridge@2c {
+		pinctrl-0 = <&irq1_pins>;
+		pinctrl-names = "default";
+
+		compatible = "ti,sn65dsi86";
+		reg = <0x2c>;
+
+		clocks = <&sn65dsi86_refclk2>;
+		clock-names = "refclk";
+
+		interrupts-extended = <&intc_ex 1 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&gpio1 27 GPIO_ACTIVE_HIGH>;
+
+		vccio-supply = <&reg_1p8v>;
+		vpll-supply = <&reg_1p8v>;
+		vcca-supply = <&reg_1p2v>;
+		vcc-supply = <&reg_1p2v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi86_in2: endpoint {
+					remote-endpoint = <&dsi1_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				sn65dsi86_out2: endpoint {
+					remote-endpoint = <&mini_dp_con_in2>;
+				};
+			};
+		};
+	};
+};
+
+&pfc {
+	i2c4_pins: i2c4 {
+		groups = "i2c4";
+		function = "i2c4";
+	};
+
+	irq1_pins: irq1 {
+		groups = "intc_ex_irq1_a";
+		function = "intc_ex";
+	};
 };

-- 
2.43.0


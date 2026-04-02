Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8205836DA0C;
	Thu,  2 Apr 2026 09:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121029; cv=none; b=cx9oz7thRa6GFFPwKvyRvWUMFGgS6N1P1F3TxV7uPPRcbhCGV1d2yQKQr6Z0ibagLiMO4+N52Rtab99c3Rd4K/oP9eF3/7a2sNZX6UntOmLpCfYNS73H/j8OC19HDihDQjLNd9X8FibKmF2xZHlGJWOOYny26iB7qcI+uPbb+Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121029; c=relaxed/simple;
	bh=k3jfmWj3A5YHeVcd+1l/lBTq88edPwoOjjeHwmcGj2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fz1qVxYIGQYkvh35N/c/5YCGx2kerYjXQFr+LMxh2xEExQfwGifi0nVDsFyG473bRl3/V3yFP/hFAVdHdCpi9hk+tdJRX9nS+TRoCl4meup1VQFpLl0WTHUs3g1hswJrzO1K+FX7+GAEXbByvWKTOPbUAqZOljVxQ6p2BVKOnyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: VId0plT2TQKK08zsBjpPsQ==
X-CSE-MsgGUID: tvnjzpCeRbaekkkCboZoYw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Apr 2026 18:10:26 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.136])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AFB1B40E1DDD;
	Thu,  2 Apr 2026 18:10:17 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	John Madieu <john.madieu@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-sound@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v2 22/24] arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support
Date: Thu,  2 Apr 2026 11:05:21 +0200
Message-ID: <20260402090524.9137-23-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402090524.9137-1-john.madieu.xa@bp.renesas.com>
References: <20260402090524.9137-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add and enable I2C1 controller support with pin configuration.
The I2C1 bus is routed to the carrier board and used for peripherals
such as the audio codec.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v2: No changes

 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 89428c804efb..493f6783d583 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -32,6 +32,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
+		i2c1 = &i2c1;
 		i2c2 = &i2c2;
 		mmc0 = &sdhi0;
 		mmc2 = &sdhi2;
@@ -118,6 +119,12 @@ &gpu {
 	mali-supply = <&reg_vdd0p8v_others>;
 };
 
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -255,6 +262,11 @@ ctrl {
 		};
 	};
 
+	i2c1_pins: i2c1 {
+		pinmux = <RZG3E_PORT_PINMUX(3, 2, 1)>, /* SCL1 */
+			 <RZG3E_PORT_PINMUX(3, 3, 1)>; /* SDA1 */
+	};
+
 	i2c2_pins: i2c {
 		pinmux = <RZG3E_PORT_PINMUX(3, 4, 1)>, /* SCL2 */
 			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
-- 
2.25.1


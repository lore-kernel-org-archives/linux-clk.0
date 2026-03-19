Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3633F1640;
	Thu, 19 Mar 2026 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935886; cv=none; b=XNDkvZaSVxuvby4c0cUZTrr1t8HDlP+xkssoib0evxi/TV6fnVty/tfkPfJ+2T8vHnXQkMnubNPCNRRJvyN+yvke+voIfM12urffS/P0ryFrzYJkHJje9hRXGsuFmhnLR7F2w6x30wIFTFZChpSCVX1c5y6RAPTFHJCYgEXlUmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935886; c=relaxed/simple;
	bh=Ah49vEhMl7rAN9N1QGV+BlvsQ9aXxNRotog7gzbnPmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZeR2/eIiq7zD5oN1x+h2OzkuIx30gY/yedC7623wcA+8mP/L2AbIvLRkklgAzX9bGCg8UlDzSIqXYFtZNOqyu8s6kqNCwQreLxLlEtFpmZqkoSBLczwdpYzgd1IWATt97h/egVIqA+MlddFgexFwdNsCxOaXdcaTnrxp5YGYRt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Dc3v/KmrQpKgNvwItauG0Q==
X-CSE-MsgGUID: 0E+jKJjITYKu4nAY9hjBQw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 20 Mar 2026 00:58:04 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.35])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6C04F401BC51;
	Fri, 20 Mar 2026 00:57:54 +0900 (JST)
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
Subject: [PATCH 21/22] arm64: dts: renesas: rzg3e-smarc-som: add audio pinmux definitions
Date: Thu, 19 Mar 2026 16:53:33 +0100
Message-ID: <20260319155334.51278-22-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com>
References: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pinmux definitions for SSI3/SSI4 audio interface on RZ/G3E SMARC SoM:

- sound_clk_pins: AUDIO_CLKB and AUDIO_CLKC clock outputs
- sound_pins: SSI3_SCK, SSI3_WS, SSI3_SDATA (playback) and
  SSI4_SDATA (capture)

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 6fc6d5283eae..d740e993a7d3 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -344,6 +344,18 @@ sd2-pwen {
 		};
 	};
 
+	sound_clk_pins: sound_clk {
+		pinmux = <RZG3E_PORT_PINMUX(4, 2, 8)>, /* AUDIO_CLKB */
+			 <RZG3E_PORT_PINMUX(4, 3, 8)>; /* AUDIO_CLKC */
+	};
+
+	sound_pins: sound {
+		pinmux = <RZG3E_PORT_PINMUX(0, 3, 9)>, /* SSI3_SCK */
+			 <RZG3E_PORT_PINMUX(0, 4, 9)>, /* SSI3_WS */
+			 <RZG3E_PORT_PINMUX(0, 2, 9)>, /* SSI3_SDATA */
+			 <RZG3E_PORT_PINMUX(0, 5, 9)>; /* SSI4_SDATA */
+	};
+
 	xspi_pins: xspi0 {
 		pinmux = <RZG3E_PORT_PINMUX(M, 0, 0)>, /* XSPI0_IO0 */
 			 <RZG3E_PORT_PINMUX(M, 1, 0)>, /* XSPI0_IO1 */
-- 
2.25.1


Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66243F1655;
	Thu,  2 Apr 2026 16:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147578; cv=none; b=eWulBhr8U2J/llYj5PaQrqW+kGfscSRXH5Ii2dYhEBVX8tRm5fR3Ym4tsAkA4HaGUPWWXp3fBpSZ0nhbu6YEIriofkK6X8MJLL2PDjb9EL1sJush/5HD0/s7y+e7PB/wa+x13deI4k6FeGg4VGFmCHCWm6/0H4eBuC4XbQjkiSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147578; c=relaxed/simple;
	bh=WySqVcb1xer4Chrgql0IIGzxhWVynuDHYr/DPlw6Gvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kxy1+7wInPgL8EvJVZeZBz1C42naipQ0H7hSbFyRDIJT1ZirD1POPnACOlnucqWLBQLs7TpTlcF19mhzgs84ZfqEZ/1qD6OoZ6F6M5FxYHS7skuON8tHwAVk9vzVNg+EsEulMpwJbfvNt5bOE0Hvy9xy7vli91ykgqMSev2uxhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: yL0ruxdFQaGfTAASSkmgcw==
X-CSE-MsgGUID: q2e9Cr1iQ9ysU0uoDMiDSQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Apr 2026 01:32:56 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6B3E940083E2;
	Fri,  3 Apr 2026 01:32:52 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCh v3 7/8] arm64: dts: renesas: rzg3e-smarc-som: add audio pinmux definitions
Date: Thu,  2 Apr 2026 18:31:25 +0200
Message-ID: <20260402163126.12135-8-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402163126.12135-1-john.madieu.xa@bp.renesas.com>
References: <20260402163126.12135-1-john.madieu.xa@bp.renesas.com>
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

Changes:

v3: No changes
v2: No changes

 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 493f6783d583..f4532a06cc31 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -353,6 +353,18 @@ sd2-pwen {
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


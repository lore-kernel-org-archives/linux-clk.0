Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C973F210D;
	Thu,  2 Apr 2026 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147569; cv=none; b=r3iJDINT70a7GepfwXm52ym4+VlVya6zaWV/Ach6tPShoaJrrMYuevqUpnZSle3mdOV9yVf1u7Xir/nMxF4uYTmfILfTdYVhKuv02BOYVVR95Fkzy09NC5+fgCQqUwvjeaLV64NBxaicivwNIKbyV8c2Ahs3oky8vLeQ9a9f8qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147569; c=relaxed/simple;
	bh=ufQMTqHmHKAyAaEq0yNSPDr1z4Qa3trGoEdPMrHKtfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kScK5BOfUpDyevxUFaOibdi+L9jPj7OmR3EmaNGemXuCLyhKtvd1A3waxjJ9+lnuxjIkT6eZNCsWCJzzZ+ZD1RcAE3OW3ssSP2biJeLR2MJyLDWBTYr54QSLRFL8s41GQbIsYi3xPtq1hXAPcODdWzsxVoiDtQO9Ld4f2iMKidA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: sE2rvK1dQyqvJPFX2YOkNQ==
X-CSE-MsgGUID: ZyNl5g2YSMaBt9vkVWJT6w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Apr 2026 01:32:47 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 08B2A40083E2;
	Fri,  3 Apr 2026 01:32:42 +0900 (JST)
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
Subject: [PATCh v3 5/8] arm64: dts: renesas: rzg3e-smarc-som: Add Versa3 clock generator
Date: Thu,  2 Apr 2026 18:31:23 +0200
Message-ID: <20260402163126.12135-6-john.madieu.xa@bp.renesas.com>
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

Add the Renesas 5P35023 (Versa3) programmable clock generator on the
I2C2 bus along with its 24MHz input clock (x2 oscillator) to feed the
audio subsystem.

The Versa3 provides the following audio-related clock outputs:
- Output 0: 24MHz (reference)
- Output 1: 12.288MHz (audio, 48kHz family)
- Output 2: 11.2896MHz (audio, 44.1kHz family)
- Output 3: 12.288MHz (audio)

These clocks are required for the audio codec found on the RZ/G3E SMARC
EVK.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3: No changes
v2: No changes

 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index d978619155d2..89428c804efb 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -77,6 +77,12 @@ reg_vdd0p8v_others: regulator-vdd0p8v-others {
 		regulator-always-on;
 	};
 
+	x2: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
 	/* 32.768kHz crystal */
 	x3: x3-clock {
 		compatible = "fixed-clock";
@@ -130,6 +136,20 @@ raa215300: pmic@12 {
 
 		interrupts-extended = <&pinctrl RZG3E_GPIO(S, 1) IRQ_TYPE_EDGE_FALLING>;
 	};
+
+	versa3: clock-generator@68 {
+		compatible = "renesas,5p35023";
+		reg = <0x68>;
+		#clock-cells = <1>;
+		clocks = <&x2>;
+
+		assigned-clocks = <&versa3 0>, <&versa3 1>,
+				  <&versa3 2>, <&versa3 3>,
+				  <&versa3 4>, <&versa3 5>;
+		assigned-clock-rates = <24000000>, <12288000>,
+				       <11289600>, <12288000>,
+				       <25000000>, <25000000>;
+	};
 };
 
 &i3c {
-- 
2.25.1


Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990DE3F23D8;
	Thu,  2 Apr 2026 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147560; cv=none; b=KwQ+HiYiZqrTo+lQaGInpzZfEnEUOf1H0yQ+Ty3e7kaKMzlphHiKJqZvcCxzw6bhe3W0jN4t8sKNB097d8RZpjRyUaIYq6AAvFV/pqwjl3+OatFy8EHrXvpaQusCNdT18IKx3qUd44US9rOhc7bT88m5nGmJvIKqL8SiKiJRpqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147560; c=relaxed/simple;
	bh=qpq9eRfzGc3vbfyT7/O9iTVMvJ0GWbz/40xTWAK8Qrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHDqufFvofTzE0ZTwemv0KX1c/fXFyzxonkE4Mczn/dc6PLA20CGyzpv199jCJJsOvkWn/9vpxY9Ec9PapkFSaExvnxN/g4JYH67YtOI8d8heYAmqFL/0p/408W8iRHjIapvqEPthjv0LotX21mklLTBBiZjPNthwQUxCi4R8oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 35GrQuCsQDeF3i1l+cRztw==
X-CSE-MsgGUID: FJnIy14eSa+XNGhA9KjrOQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Apr 2026 01:32:37 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9477A40083E2;
	Fri,  3 Apr 2026 01:32:33 +0900 (JST)
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
Subject: [PATCh v3 3/8] arm64: dts: renesas: rzv2h: Add audio clock inputs
Date: Thu,  2 Apr 2026 18:31:21 +0200
Message-ID: <20260402163126.12135-4-john.madieu.xa@bp.renesas.com>
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

Model external audio clock inputs as CPG input clocks for RZ/V2H family
SoCs (RZ/V2H, RZ/V2N, RZ/G3E), allowing the Audio Clock Generator (ADG)
to derive internal audio clocks from these external sources.

The clock frequencies are board-specific and must be overridden in the
board DTS files.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3: No changes
v2: No changes

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 27 ++++++++++++++++++++--
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 27 ++++++++++++++++++++--
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 27 ++++++++++++++++++++--
 3 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 95a4e30a064d..1ff48c8f98e1 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -14,6 +14,27 @@ / {
 	#size-cells = <2>;
 	interrupt-parent = <&gic>;
 
+	audio_clka: audio-clka {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	audio_clkb: audio-clkb {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	audio_clkc: audio-clkc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
 	audio_extal_clk: audio-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -270,8 +291,10 @@ pinctrl: pinctrl@10410000 {
 		cpg: clock-controller@10420000 {
 			compatible = "renesas,r9a09g047-cpg";
 			reg = <0 0x10420000 0 0x10000>;
-			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
-			clock-names = "audio_extal", "rtxin", "qextal";
+			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>,
+				 <&audio_clka>, <&audio_clkb>, <&audio_clkc>;
+			clock-names = "audio_extal", "rtxin", "qextal",
+				      "audio_clka", "audio_clkb", "audio_clkc";
 			#clock-cells = <2>;
 			#reset-cells = <1>;
 			#power-domain-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 40525470194e..d2ac78006f15 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -32,6 +32,27 @@ / {
 	#size-cells = <2>;
 	interrupt-parent = <&gic>;
 
+	audio_clka: audio-clka {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	audio_clkb: audio-clkb {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	audio_clkc: audio-clkc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
 	audio_extal_clk: audio-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -293,8 +314,10 @@ pinctrl: pinctrl@10410000 {
 		cpg: clock-controller@10420000 {
 			compatible = "renesas,r9a09g056-cpg";
 			reg = <0 0x10420000 0 0x10000>;
-			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
-			clock-names = "audio_extal", "rtxin", "qextal";
+			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>,
+				 <&audio_clka>, <&audio_clkb>, <&audio_clkc>;
+			clock-names = "audio_extal", "rtxin", "qextal",
+				      "audio_clka", "audio_clkb", "audio_clkc";
 			#clock-cells = <2>;
 			#reset-cells = <1>;
 			#power-domain-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 9581af58024e..e15b47dc93d4 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -14,6 +14,27 @@ / {
 	#size-cells = <2>;
 	interrupt-parent = <&gic>;
 
+	audio_clka: audio-clka {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	audio_clkb: audio-clkb {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	audio_clkc: audio-clkc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
 	audio_extal_clk: audio-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -275,8 +296,10 @@ pinctrl: pinctrl@10410000 {
 		cpg: clock-controller@10420000 {
 			compatible = "renesas,r9a09g057-cpg";
 			reg = <0 0x10420000 0 0x10000>;
-			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
-			clock-names = "audio_extal", "rtxin", "qextal";
+			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>,
+				 <&audio_clka>, <&audio_clkb>, <&audio_clkc>;
+			clock-names = "audio_extal", "rtxin", "qextal",
+				      "audio_clka", "audio_clkb", "audio_clkc";
 			#clock-cells = <2>;
 			#reset-cells = <1>;
 			#power-domain-cells = <0>;
-- 
2.25.1


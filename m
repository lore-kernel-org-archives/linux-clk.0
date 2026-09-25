Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEF836B915;
	Fri, 25 Sep 2026 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326428; cv=none; b=LwX+MxaL5Ka3WT3Fj+ZxJjY8P6ijrpXVZ7Zgs7lmX5sY10DeulYZmrnpYh28P3UFo7rFQ7+HWJA/nEQY7VeuzWQD+II+Q3ZpvD+9dl8CiPRygZYRRz5ugnBh8F3l3+gDww1Kxlqt5d8P+SQUARoqAPHodQAf5FNKf4FE7++cBbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326428; c=relaxed/simple;
	bh=3JA2AcXtvCo9mRvRvJ0uJv4Xssg70F4KtS0kS3YkXj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHq3aKTc7CIIW5EXPrDvMpGcJ+/Xk7YCG2OaTuz1AJnGJ/VVOreNoZkrPPFz7IH4V8cDZJLJPoeL951cjZJq+F5rtf/OJHBefANJ6WfMNooqV7uRmzOCzZ7xEh5F+efVOcVwj3BZp4G9ZQ6kxjir09bO47h4Jf2y+Iszcr9Z8E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6E61F00893;
	Fri, 25 Sep 2026 08:53:43 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a78000: Add MSIOF nodes
Date: Fri, 25 Sep 2026 10:53:30 +0200
Message-ID: <10e85f27b8ea4342f6f19a7c9e68fd641e58b54a.1790325809.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790325809.git.geert+renesas@glider.be>
References: <cover.1790325809.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device nodes for the Clock-Synchronized Serial Interfaces with FIFO
(MSIOF) on the Renesas R-Car X5H (R8A78000) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 104 ++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 9a07753b221541ed..d75a9e43f772f871 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -1000,6 +1000,110 @@ mdlc_aon: system-controller@c1338000 {
 			bootph-all;
 		};
 
+		msiof0: spi@c1700000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc1700000 0 0x100>;
+			interrupts = <GIC_ESPI 744 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSO_SCP_MAIN>;
+			power-domains = <&mdlc_scp R8A78000_MDLC_PD_SCP 0x50>;
+			resets = <&mdlc_scp 0x50>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof1: spi@c1710000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc1710000 0 0x100>;
+			interrupts = <GIC_ESPI 745 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSO_SCP_MAIN>;
+			power-domains = <&mdlc_scp R8A78000_MDLC_PD_SCP 0x51>;
+			resets = <&mdlc_scp 0x51>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof2: spi@c1720000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc1720000 0 0x100>;
+			interrupts = <GIC_ESPI 746 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSO_SCP_MAIN>;
+			power-domains = <&mdlc_scp R8A78000_MDLC_PD_SCP 0x52>;
+			resets = <&mdlc_scp 0x52>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof3: spi@c1730000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc1730000 0 0x100>;
+			interrupts = <GIC_ESPI 747 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSO_SCP_MAIN>;
+			power-domains = <&mdlc_scp R8A78000_MDLC_PD_SCP 0x53>;
+			resets = <&mdlc_scp 0x53>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof4: spi@c0600000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc0600000 0 0x100>;
+			interrupts = <GIC_ESPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSOCK_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x4f>;
+			resets = <&mdlc_perw 0x4f>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof5: spi@c0608000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc0608000 0 0x100>;
+			interrupts = <GIC_ESPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSOCK_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x50>;
+			resets = <&mdlc_perw 0x50>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof6: spi@c0610000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc0610000 0 0x100>;
+			interrupts = <GIC_ESPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSOCK_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x51>;
+			resets = <&mdlc_perw 0x51>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof7: spi@c0618000 {
+			compatible = "renesas,msiof-r8a78000",
+				     "renesas,rcar-gen5-msiof";
+			reg = <0 0xc0618000 0 0x100>;
+			interrupts = <GIC_ESPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg R8A78000_CPG_MSOCK_PERW_BUS>;
+			power-domains = <&mdlc_perw R8A78000_MDLC_PD_APL 0x52>;
+			resets = <&mdlc_perw 0x52>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		mdlc_cmnn: system-controller@ca410000 {
 			compatible = "renesas,r8a78000-mdlc";
 			reg = <0 0xca410000 0 0x1000>;
-- 
2.43.0


Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB303FB04C;
	Mon,  2 Mar 2026 16:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772470524; cv=none; b=ufmLW5xqEB4BCqXVwU5qm48q8ZsGS0puvteHb+z2/pw1VsSxCusVQ3u07ubk8Nv6ANG2KR7YTQcxcHHeYfzKFoTPcEpHJgRA1Xl0ZqSHkJf6O6s4ie7/iGcoWJEetXtsJ8XDqRuqWbpMW+osSwGimsq4orOw3MwXSnhmU/sdfPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772470524; c=relaxed/simple;
	bh=FNPaUzfNQ3yzmYkC/FbzFR2OaL4mvHfqik6T1YGXCK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwAs2Bx0FGOJuz7/rJGPyj+9QitfJlbwaf/QnpZElH0XlrNe20bwpn7cxCMg2eDFh7igTgnrIrqRQuG5uNHtF8dixeC3FroymzZNI+d7SZCUAiwO/atxNfnEMz3zy2XjvdR+5QxF4h5pDkFXNISLFkVlkpWWT8vpcmdeJo+Ygy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: rLm4xqQ6T3Sqbnzda+/TIg==
X-CSE-MsgGUID: J3BdZAlZRfKPEdSeRDLetA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Mar 2026 01:55:20 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.15])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 42508401A65F;
	Tue,  3 Mar 2026 01:55:15 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	biju.das.jz@bp.renesas.com,
	fabrizio.castro.jz@renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 7/7] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock generator node
Date: Mon,  2 Mar 2026 16:54:41 +0000
Message-ID: <20260302165441.4457-8-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302165441.4457-1-ovidiu.panait.rb@renesas.com>
References: <20260302165441.4457-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add versa3 clock generator node. It provides clocks for the RTC, PCIe
and audio devices.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v4 changes: None.

v3 changes:
- Added comments to document rtxin_clk and qextal_clk routing.

 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index dc4577ebf2e9..4d6197301af4 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -108,6 +108,12 @@ vqmmc_sdhi1: regulator-vccq-sdhi1 {
 		states = <3300000 0>, <1800000 1>;
 	};
 
+	x1: x1-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
 	/* 32.768kHz crystal */
 	x6: x6-clock {
 		compatible = "fixed-clock";
@@ -277,6 +283,25 @@ raa215300: pmic@12 {
 		clocks = <&x6>;
 		clock-names = "xin";
 	};
+
+	versa3: clock-generator@69 {
+		compatible = "renesas,5l35023";
+		reg = <0x69>;
+		clocks = <&x1>;
+		#clock-cells = <1>;
+		assigned-clocks = <&versa3 0>,  /* qextal_clk */
+				  <&versa3 1>,
+				  <&versa3 2>,  /* rtxin_clk */
+				  <&versa3 3>,
+				  <&versa3 4>,
+				  <&versa3 5>;
+		assigned-clock-rates = <24000000>,
+				       <24576000>,
+				       <32768>,
+				       <22579200>,
+				       <100000000>,
+				       <100000000>;
+	};
 };
 
 &mdio0 {
-- 
2.51.0


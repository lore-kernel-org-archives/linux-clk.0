Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F95466B50;
	Tue, 20 Jan 2026 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921594; cv=none; b=QPE5jYVGXohA5lVod4wcoyaYcMTz2mH4KLrnwcK6abD7TNp1jj6v0wDWc0JYXeRDyfjwre31OXdrujEypoBWTM3ONSrpuu/4zyqbib6dY7DAuqKvJJpZJlf/4oV1X8qyziq52mjtuiyTLNg1fKpZeUWQI0ZSmDHS3Nvt28YjAxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921594; c=relaxed/simple;
	bh=vgIXuJTGjYgFHqOU/AjAXxtKNjUamkHUF8We3gLEPZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/ZEYKLD9t/ZWklu3SO7+ZkTNGVKasfX9UQEUw8HvCBIg7nbvj7BbjoVNjXKHLV7ujrezSPbw8X5/TwZtYAgAfJIpIH5SnE7AuoHPDIve3bIUnmaSygcnfOr/SaAmCdwPwg+LYhAQ6DmrqotpD1UGH2YDf0RjsYnwsQpp3WQ7xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: O3X+MApoTZKD71CsGiiHpA==
X-CSE-MsgGUID: Fk0qRjr3RRe3wIeUmI+QQw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jan 2026 00:06:30 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D8173402261F;
	Wed, 21 Jan 2026 00:06:26 +0900 (JST)
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
Subject: [PATCH v2 4/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock generator node
Date: Tue, 20 Jan 2026 15:06:05 +0000
Message-ID: <20260120150606.7356-5-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
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
v2 changes: None.

 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index dc4577ebf2e9..4a70e0707b38 100644
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
+		assigned-clocks = <&versa3 0>,
+				  <&versa3 1>,
+				  <&versa3 2>,
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


Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A60533123E;
	Thu, 20 Nov 2025 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644638; cv=none; b=ldRBqJLXvR3ursyQXqLWohBhxGnlUqZtDb6wy3P/711Ax8mPjeInxChhym0o4Hzoxi6RRX1j4W5s31RC0GkFy/Mt2teEF9f/DNS9KICLMQa/ua27XX+Z6yO+JE3hGBSxa23kBWpb+98TeoEcXX23IeBv03TT5UDLW9JxNJI+AJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644638; c=relaxed/simple;
	bh=rzsceNVsLgNTO+X00rj3Tf+eMe4kMyO3UMkIeEbat4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bS59lB9l96gZYdhjD+PkTfMAfadqnrlrpEi94jtnQGbnZ+OO4bknq/tZaoTdw7Vrzt3BzmNPsg1f3X7XkR2Pn9bS4T589zb0xZQAUHnYpGoS6bO7Amq+u8nAmi4T3X1NecR7GPudCtu/scDL5jPZA6f6kpkD+himD7U0W4bEBlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=hvu/z7cM; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="hvu/z7cM"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0C6962617B;
	Thu, 20 Nov 2025 14:17:15 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPVi9DDBgPin; Thu, 20 Nov 2025 14:17:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644634; bh=rzsceNVsLgNTO+X00rj3Tf+eMe4kMyO3UMkIeEbat4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hvu/z7cMM9B466fCNUlVTJJ+1uxXSmsnHKCwjPlaWNy3Q67leBSvyfLkAnO46Crrm
	 4WyXMBl9RniFGROU0WXmQQ0jjpDIoI8BrAr7SKyd5lTZSVY8ACxuo3FXFJ8OK+9elt
	 75F+5pGPX+Gyj8PAC+Equ6yaGDEJrXRBciCMP6IqGkvcnkXj+HrsXhqNPUn4ohLPpU
	 VhbXeoqQq5qvn/BYvS/ya3foz9SJNa+Ge5bBlmSWmBYUOg63t8MemJBao8NIbdYIl/
	 +TC1O1C26J79C0OkR+iKa2/y7KKz7/x5pGPgxmDfPkaUqDX31TJZbkZZzhxAVCtWYS
	 8YHyWOdnZZnHw==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 7/7] [Not For Upstream] riscv: dts: thead: Add CPU clock and OPP table for TH1520
Date: Thu, 20 Nov 2025 13:14:16 +0000
Message-ID: <20251120131416.26236-8-ziyao@disroot.org>
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>
References: <20251120131416.26236-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add operating point table for CPU cores, and wire up clocks for CPU
nodes.

This patch isn't intended for upstreaming but only for testing purpose,
since the PMIC driver for scaling CPU voltage isn't ready yet. Only
operating points whose voltage is satisified by Lichee Module 4A's PMIC
default, i.e. <= 1.5GHz, are enabled.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index bd5d33840884..6020d568ad7c 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -38,6 +38,8 @@ c910_0: cpu@0 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache>;
 			mmu-type = "riscv,sv39";
+			operating-points-v2 = <&cpu_opp>;
+			clocks = <&clk CLK_C910>;
 
 			cpu0_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -65,6 +67,8 @@ c910_1: cpu@1 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache>;
 			mmu-type = "riscv,sv39";
+			operating-points-v2 = <&cpu_opp>;
+			clocks = <&clk CLK_C910>;
 
 			cpu1_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -92,6 +96,8 @@ c910_2: cpu@2 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache>;
 			mmu-type = "riscv,sv39";
+			operating-points-v2 = <&cpu_opp>;
+			clocks = <&clk CLK_C910>;
 
 			cpu2_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -119,6 +125,8 @@ c910_3: cpu@3 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache>;
 			mmu-type = "riscv,sv39";
+			operating-points-v2 = <&cpu_opp>;
+			clocks = <&clk CLK_C910>;
 
 			cpu3_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -137,6 +145,33 @@ l2_cache: l2-cache {
 		};
 	};
 
+	cpu_opp: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <600000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <700000>;
+		};
+
+		opp-1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <800000>;
+		};
+
+/*
+		opp-1848000000 {
+			opp-hz = /bits/ 64 <1848000000>;
+			opp-microvolt = <1000000>;
+		};
+ */
+	};
+
 	pmu {
 		compatible = "riscv,pmu";
 		riscv,event-to-mhpmcounters =
-- 
2.51.2


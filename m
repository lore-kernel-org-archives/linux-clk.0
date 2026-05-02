Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77832BEFEE;
	Sat,  2 May 2026 18:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777748185; cv=none; b=HoSkjApIpByuVqVlBVyh//BSU30qLvS84HVmxDpk4qFUnh8KmELYaxAjFCWeAOIuRHMT8rF5HNAWilCf5bpco3w+Ppu+opAttNWnTa9Youu4fdF2UIAJmcaz022MgF5lY+NCnIpqQvolRHE1bmcf+R0CpLDhtiDTvIe8WfJrlH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777748185; c=relaxed/simple;
	bh=jVFRCuZO+yNG8H6cyWaT3LdbduYGPhzSKBbD9iHrsgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5pwRi+dTJYt9YKI7kQdINH6uNMkH7+GbN+YPobOC1ZOiKQfkxRZspIMxdHnyrzJP2r5ISqc0UOooeU7vhvnboDHxD94R566KZ57A9BTfVg6AERRaCp0IWl+Xo0Uati01QFfMQqpKV7m1/JdaJmZnd4cwGJyTqqdw3bGsAQaPTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VcUoxl/6; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ILxESlRZ; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VcUoxl/6";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ILxESlRZ"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g7HF20Lx4z9ttQ;
	Sat,  2 May 2026 20:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7KAzkLlbASG4LW7V5LypyNoWScFuOeCwZgBmWCYq3qI=;
	b=VcUoxl/6896CDJJC28XPPz2ZRiL2AvAchZ8B0F3lcH+dxMqfBig2Ue501L5axPMtMt2kEW
	HCwhdNU4LBwvXuz3tQXYRfiEtUkltrPLbMHhwRFUeiDtafBVUWAesm/PMfSSQtvJAYXOBu
	XZfd+/Sm8Cj9YxOQLl+TtieDeMXNBgsN1fsg5CQK2RQea3/u80s1led5wytLxvQMSPieqm
	xLcV59TLhVi2omJk0O/i5jDKx7+7qchSFnNSGHxvWNyRG5nkmvZxwi4dDtlz6wAVIogYr+
	cTRLE3mZR6HkHcrtv7cWksuQ2kGGMzOei7Uz96BBx5tVIASv7nYMEDsLxVcluQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ILxESlRZ;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7KAzkLlbASG4LW7V5LypyNoWScFuOeCwZgBmWCYq3qI=;
	b=ILxESlRZUZQPs9XRIr+S/PmVgZ5fvh4JX5MUTytXcWpb+Llu21133twCdz4YRgWySwXKLF
	Hq/aJqRIv38IP7uYgJQJiiat4KMFsJCqXr8bxkfLKmBz3dWIw2osjoYwimfhAtFtQETHRV
	4GlCwIUhS4jb7tzT6o+R5aSug1sjr5h/w8Xw8zjW7ydpJc2XsFilqZbcMt3nzDuD7fQHza
	dA/fEY957Ns58ZrEzfpHxJ8SZcd6OLSQmV8zOoTBNs2cm/s1zoX8WwDPH4x/RvMfR0BGRE
	+yV7jGrh8e//+DR8yQXFG4tq+YKgL2uOW8Rj1r9bie52sUh9DGcWLzouv0UP5w==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6
Date: Sat,  2 May 2026 20:55:45 +0200
Message-ID: <20260502185557.93061-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 939a1c036ea3e18311a
X-MBO-RS-META: at5tgu1ibk9swst1773rnnhh8qwqp8px
X-Rspamd-Queue-Id: 4g7HF20Lx4z9ttQ

Describe coresight topology on R-Mobile APE6. Extend the current PTM node
with connection funnel, TPIU, ETB and replicator. The coresight on this
hardware is clocked from the ZT/ZTR trace clock.

Note that only core 0 part of the topology is described, because the
other cores are still not present in the DT.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a73a4.dtsi | 112 ++++++++++++++++++++++++-
 1 file changed, 110 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a73a4.dtsi b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
index a70a0dc402a5f..c3427dc7cf7dd 100644
--- a/arch/arm/boot/dts/renesas/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
@@ -47,9 +47,117 @@ L2_CA7: cache-controller-1 {
 		};
 	};
 
-	ptm {
-		compatible = "arm,coresight-etm3x";
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+		clocks = <&cpg_clocks R8A73A4_CLK_ZTR>;
+		clock-names = "atclk";
 		power-domains = <&pd_d4>;
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* replicator output ports */
+			port@0 {
+				reg = <0>;
+
+				replicator_out_port0: endpoint {
+					remote-endpoint = <&tpiu_in_port>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+
+				replicator_out_port1: endpoint {
+					remote-endpoint = <&etb_in_port>;
+				};
+			};
+		};
+
+		in-ports {
+			/* replicator input port */
+			port {
+				replicator_in_port0: endpoint {
+					remote-endpoint = <&funnel_out_port>;
+				};
+			};
+		};
+	};
+
+	etb@e6f81000 {
+		compatible = "arm,coresight-etb10", "arm,primecell";
+		reg = <0 0xe6f81000 0 0x1000>;
+		clocks = <&cpg_clocks R8A73A4_CLK_ZT>, <&cpg_clocks R8A73A4_CLK_ZTR>;
+		clock-names = "apb_pclk", "atclk";
+		power-domains = <&pd_d4>;
+
+		in-ports {
+			port {
+				etb_in_port: endpoint {
+					remote-endpoint = <&replicator_out_port1>;
+				};
+			};
+		};
+	};
+
+	tpiu@e6f83000 {
+		compatible = "arm,coresight-tpiu", "arm,primecell";
+		reg = <0 0xe6f83000 0 0x1000>;
+		clocks = <&cpg_clocks R8A73A4_CLK_ZT>, <&cpg_clocks R8A73A4_CLK_ZTR>;
+		clock-names = "apb_pclk", "atclk";
+		power-domains = <&pd_d4>;
+
+		in-ports {
+			port {
+				tpiu_in_port: endpoint {
+					remote-endpoint = <&replicator_out_port0>;
+				};
+			};
+		};
+	};
+
+	funnel {
+		compatible = "arm,coresight-static-funnel";
+
+		/* funnel output ports */
+		out-ports {
+			port {
+				funnel_out_port: endpoint {
+					remote-endpoint =
+						<&replicator_in_port0>;
+				};
+			};
+		};
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* funnel input ports */
+			port@0 {
+				reg = <0>;
+				funnel0_in_port0: endpoint {
+					remote-endpoint = <&ptm0_out_port>;
+				};
+			};
+		};
+	};
+
+	ptm@e6fbc000 {
+		compatible = "arm,coresight-etm3x", "arm,primecell";
+		reg = <0 0xe6fbc000 0 0x1000>;
+		clocks = <&cpg_clocks R8A73A4_CLK_ZT>, <&cpg_clocks R8A73A4_CLK_ZTR>;
+		clock-names = "apb_pclk", "atclk";
+		cpu = <&cpu0>;
+		power-domains = <&pd_d4>;
+
+		out-ports {
+			port {
+				ptm0_out_port: endpoint {
+					remote-endpoint = <&funnel0_in_port0>;
+				};
+			};
+		};
 	};
 
 	timer {
-- 
2.53.0


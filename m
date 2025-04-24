Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311758BE8;
	Thu, 24 Apr 2025 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482453; cv=none; b=KSC7HW72F8rG+Jc46ub8lAjpujlbN0v1tMXA6e1qi2xbpY9x+2Qz6y/1GhJqKc7qt3+n7w+HjBR5egurOwiNBhm65M9qb4ciZlsQ5SR104Xq38ZiF9THSil1Jf6fr+slNBoRmlFJEPfpC0DJnbbeYFJujF9ARC0zg4AVYWyWBCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482453; c=relaxed/simple;
	bh=UMJDFPjm4b6wjBJ/hsRbKXKTVpDXywdiGpW53yYwsfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aG5LerSZpC2WEByS0aiWOXA4dg/wYT8ShR5Rm3Eu0OEji2INy4zNcOZ2bgor6RHtpTt4cWLURu1vfjibGEfiUZqMjj8jTZKW1XUebstXC4MrQk5C2zmxzNXMk0SgogAIkrtxiR0iahjosO5HHQivqJFcISM3maXj1ZqQp2WWwN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: hB8iq1vKTFKgeXJbw+xFJw==
X-CSE-MsgGUID: ySEMcMB7TfiJM69FuKfPSQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Apr 2025 17:14:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.69])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A4F2741BF1F3;
	Thu, 24 Apr 2025 17:14:06 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: clock: renesas,r9a09g047-cpg: Add XSPI and GBETH PTP core clocks
Date: Thu, 24 Apr 2025 09:13:54 +0100
Message-ID: <20250424081400.135028-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424081400.135028-1-biju.das.jz@bp.renesas.com>
References: <20250424081400.135028-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add definitions for XSPI core clock and Gigabit Ethernet PTP reference
core clocks in the R9A09G047 CPG DT bindings header file.

The clk_spi is modelled as a fixed divider clock with parent clk_spix2 and
factor two as both parent and child share same gating bit.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch
---
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g047-cpg.h b/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
index 1d031bf6bf03..a27132f9a6c8 100644
--- a/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
@@ -17,5 +17,8 @@
 #define R9A09G047_CM33_CLK0			6
 #define R9A09G047_CST_0_SWCLKTCK		7
 #define R9A09G047_IOTOP_0_SHCLK			8
+#define R9A09G047_SPI_CLK_SPI			9
+#define R9A09G047_GBETH_0_CLK_PTP_REF_I		10
+#define R9A09G047_GBETH_1_CLK_PTP_REF_I		11
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G047_CPG_H__ */
-- 
2.43.0


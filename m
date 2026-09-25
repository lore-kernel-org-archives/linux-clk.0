Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4650A2EC0B0;
	Fri, 25 Sep 2026 08:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326424; cv=none; b=bkib4V7Uyfx+D7YNzA9HvQx2OvUIQ3T6byKpVMGYLMGAEd+536TuWjbpBt3G1tLVeexSO6O3/cwZ8DdrV9n9aMa0ptTXvnSlyf1XT6ah/xCY88XM3CQQq//S4aT3cc4Wlgfuxj9GVaVtcyokWAncU0+2OptDF/Zz0bmCMNZqUek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326424; c=relaxed/simple;
	bh=22fPoRy60SXa0E0MGhME8/bF5YAajwjJ561wxFDO5Ow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6tKKcIkrV9w2CrXF6hIbLtMEmInzUco3bliGXQoyndAvATV9wHt31odnThHO4xrTT4mA1mtqxuBDQ9qxDzUYuh8hDBT3lnLCabDYzc/TVVlPITggCuHbr1kEf3Y5M+ZdoryGoTDxLhgaCaACk9OIUCj7dasFWdYpNmC7J9wMvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7F21F000FF;
	Fri, 25 Sep 2026 08:53:39 +0000 (UTC)
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
Subject: [PATCH 1/2] dt-bindings: clock: renesas,r8a78000-cpg: Add MSIOF clocks
Date: Fri, 25 Sep 2026 10:53:29 +0200
Message-ID: <9a5f4e324e3b67d367f850264cbaf7e830cec182.1790325809.git.geert+renesas@glider.be>
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

Add definitions for the functional clock parents of the
Clock-Synchronized Serial Interfaces with FIFO (MSIOF) on the Renesas
R-Car X5H (R8A78000) SoC:
  - MSO_SCP_MAIN is the functional clock parent for MSIOF[0-3],
  - MSOCK_PERW_BUS is the functional clock parent for MSIOF[4-7].

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/dt-bindings/clock/renesas,r8a78000-cpg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r8a78000-cpg.h b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
index 7fd09a3fb353d952..14b3885f2d9933a3 100644
--- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
+++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
@@ -10,5 +10,7 @@
 #define R8A78000_CPG_SGASYNCD4_PERW_BUS		0
 #define R8A78000_CPG_SGASYNCD8_PERW_BUS		1
 #define R8A78000_CPG_SGASYNCD16_PERW_BUS	2
+#define R8A78000_CPG_MSO_SCP_MAIN		3
+#define R8A78000_CPG_MSOCK_PERW_BUS		4
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R8A78000_CPG_H__ */
-- 
2.43.0


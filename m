Received: from courrier.aliel.fr (pouet.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1142FF15B;
	Wed, 18 Feb 2026 10:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771412181; cv=none; b=gxw9lIdh7VnkydKhSF92cPoCkJFl4/AYogMgRSgt6T6BR4Wn2HW0PIj2ANEw4DTwXABBCMczW9kIK1rHfDhcA9qttPtfa9U04cr2F9wK0toHlySCVdlQPR1651Me0qzMB0XvfYMAlrKbIIM4ot45yms0QPumRZul4QlmRhISyEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771412181; c=relaxed/simple;
	bh=g017/p6TXq1k+XnrThcxW95JuzKUQXGejJt//Dsgzwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OU37UXVtyv9l7JPlmVweyC4jzKqcp4Z9KyGDHugOdu13HVw1k8wOHFflgblLVTzDk71spYiDC+dg0MEroYlWVDHv28ki+5iOMJUB35ZMDdfZyZSkKLkzrPXIp9xIObyMVMXEzVZS4bRkUG9/Qimy0FHKAwaa4duSQGTNe0dvWwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=mZZDxeui; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="mZZDxeui"
Received: from localhost.localdomain (2a02-842b-8136-0001-b865-661d-5641-E7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id B9E1940244;
	Wed, 18 Feb 2026 10:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771412177;
	bh=g017/p6TXq1k+XnrThcxW95JuzKUQXGejJt//Dsgzwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mZZDxeuiXfOzCUPfsKZJ+r6uAVKVLE90sPVOzWTTkzwiSdZduIbcPSaf08LIrtjgH
	 f/JjKDqmYuYVb8EqwKeuoyQS7ZZav0z0EbXGoAAizhl6k750O3hqN1vI5EgPYwi4Dx
	 Pd5az69nd87kMb10d9rxBZOHg34EwdA+xl4zdIZ0=
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
To: linux-amlogic@lists.infradead.org
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll support
Date: Wed, 18 Feb 2026 11:56:09 +0100
Message-ID: <20260218105611.36216-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PLL for the clock controller of the Amlogic T7 SoC family.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 include/dt-bindings/clock/amlogic,t7-pll-clkc.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
index e2481f2f1163..690421009eab 100644
--- a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
@@ -53,4 +53,20 @@
 #define CLKID_MCLK_1_PRE	9
 #define CLKID_MCLK_1		10
 
+/* ANALOG */
+#define CLKID_FPLL_DCO		0
+#define CLKID_FPLL			1
+#define CLKID_FDIV2_DIV		2
+#define CLKID_FDIV2			3
+#define CLKID_FDIV2P5_DIV	4
+#define CLKID_FDIV2P5		5
+#define CLKID_FDIV3_DIV		6
+#define CLKID_FDIV3			7
+#define CLKID_FDIV4_DIV		8
+#define CLKID_FDIV4			9
+#define CLKID_FDIV5_DIV		10
+#define CLKID_FDIV5			11
+#define CLKID_FDIV7_DIV		12
+#define CLKID_FDIV7			13
+
 #endif /* __T7_PLL_CLKC_H */
-- 
2.49.0


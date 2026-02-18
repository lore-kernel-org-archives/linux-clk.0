Received: from courrier.aliel.fr (pouet.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526A62797B5;
	Wed, 18 Feb 2026 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771410045; cv=none; b=RhDDjdBkYLynULi09U+C5Uw1h8RcYQEI3LpYjHVT8ng62lgL7xJCRNN6YkMHUhvE/yfsrakFmi9Fqv5nDMxhG0JcxQSh4HeQ9L89YYAbsKOMBCXigM8pYE9JcfXDP183qXVD3DJb7UGnCKz6mzLSGTjGpSQPcm39SGWp8aRErjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771410045; c=relaxed/simple;
	bh=Bf1BGfpVaFE+vAbk5iBAFQe8t1I69MBvOFnXlOZ888c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CuDGBAPoKkmVlxsOiP+KzeT1xxfCQEuuO7QK8BIpxPThdk3TO1J5v78xhLDS7fqoMBMn1KVshTJrsY8bQqA0Rj3DrcbCZmCdg+qgVgCGNGZWs3sgzjNSA20RSG1d6GbkLy98b40dtoKhR7GEBWjaNwuJxyl/chTniKQ8DOH6zoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=uknmluUG; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="uknmluUG"
Received: from localhost.localdomain (2A02-842b-8136-0001-B865-661d-5641-E7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id E9B9A4CB4C;
	Wed, 18 Feb 2026 10:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771410042;
	bh=Bf1BGfpVaFE+vAbk5iBAFQe8t1I69MBvOFnXlOZ888c=;
	h=From:To:Cc:Subject:Date;
	b=uknmluUGFLxqkNsYXpaLbBYo6U3WTYr6EQW0Wu+IQ7zMxCUgGdpPIZwBOxtg+amVH
	 XZ9SsfrrHcUKjCn0MHmfP5Hl4SgQNk1AZb8IzMo+Ss0Qh/gCNQwr8Mq05zbbr2NMrL
	 r2zWcPvSDb4f6Se2v/05AruylKLlYpG09BeHowJc=
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
Subject: [PATCH 5/7] dt-bindings: clk: meson: Add Amlogic T7 sys pll support
Date: Wed, 18 Feb 2026 11:20:23 +0100
Message-ID: <20260218102025.35604-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SYS PLL for the clock controller of the Amlogic T7 SoC family.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
index 32c4b62037de..0cda8edfa7cd 100644
--- a/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
+++ b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
@@ -224,5 +224,12 @@
 #define CLKID_SYS_PWM_AO_CD		215
 #define CLKID_SYS_PWM_AO_EF		216
 #define CLKID_SYS_PWM_AO_GH		217
+#define CLKID_SYS_A_SEL			218
+#define CLKID_SYS_A_DIV			219
+#define CLKID_SYS_A			220
+#define CLKID_SYS_B_SEL			221
+#define CLKID_SYS_B_DIV			222
+#define CLKID_SYS_B			223
+#define CLKID_SYS			224
 
 #endif /* __T7_PERIPHERALS_CLKC_H */
-- 
2.49.0


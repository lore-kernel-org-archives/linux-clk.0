Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F305934104C;
	Thu, 20 Nov 2025 13:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644488; cv=none; b=o6NzmtELPpR6o6CjBy3We9T05miDACV6O3HgrsFYPPUvwRPpNL5h/ca0P7uh7NN7a83IgFakljfXLti0FFEeweMOxUBXLlInV9nIY84nODinJ7blvaNsxHLScS7YFxSrsfiv9bkEp6OpUz/Q3hlnB3JcGV4JNJ3kOqhQC01iIXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644488; c=relaxed/simple;
	bh=lPgY6dsHs0ftyRYcHno/kV3MSLoEVVnLwK0wJnu14+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f2km3pQuwjeO7DyRW2HDHdMcdjBX7SJ+WjWZyZVUZq53HguYpyzOxvIpAViCq6XcPvxNPSNJGqDKYASZ06REy4uqqYP70v7ozUcMQlP6tA/qKqwcdtqHoooI6J1SbDeVf8XoMqTyqzJYjRSZoJbcudu8VWqSFpZ2LWH/QDZMlMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Joj8OKyW; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Joj8OKyW"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 92595261B4;
	Thu, 20 Nov 2025 14:14:44 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6_Ke8QVFuIi; Thu, 20 Nov 2025 14:14:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644483; bh=lPgY6dsHs0ftyRYcHno/kV3MSLoEVVnLwK0wJnu14+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Joj8OKyWxN0/1QgaBGPpAu0q2QfuCtgo4VPqdvmTYVffn3wsn6Lk4kMfX3LjSOUkN
	 RxR+WZqZSrA8tYK6qXsVLQSLVY7dy8VYOVIwHsNmo/ES7vv/qi6hXgLl+IBXDz5Lot
	 MGz5qUBHsaDOdILbGd5gmd7cde0xjbJ5CFseSzRxLnwb23iw7T+yrdmK2J0TwWwbU3
	 HQp5PrM65mKQj2wO5HvGG+mULsDFDbnV0dpy6ViNedywMSjU4IrVWMTt8NHwUrrpRh
	 HfaUChRuhaHQfzePF2QQ7pIDtys0jTZVemjkrs8ezyl3tQB2wiH3XVi2k8908YuzHO
	 8HbUKJVrBSKdw==
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
Subject: [PATCH 1/7] dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
Date: Thu, 20 Nov 2025 13:14:10 +0000
Message-ID: <20251120131416.26236-2-ziyao@disroot.org>
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>
References: <20251120131416.26236-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding ID for C910 bus clock, which takes CLK_C910 as parent and is
essential for C910 cluster's operation.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 include/dt-bindings/clock/thead,th1520-clk-ap.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/thead,th1520-clk-ap.h b/include/dt-bindings/clock/thead,th1520-clk-ap.h
index 09a9aa7b3ab1..68b35cc61204 100644
--- a/include/dt-bindings/clock/thead,th1520-clk-ap.h
+++ b/include/dt-bindings/clock/thead,th1520-clk-ap.h
@@ -93,6 +93,7 @@
 #define CLK_SRAM3		83
 #define CLK_PLL_GMAC_100M	84
 #define CLK_UART_SCLK		85
+#define CLK_C910_BUS		86
 
 /* VO clocks */
 #define CLK_AXI4_VO_ACLK		0
-- 
2.51.2


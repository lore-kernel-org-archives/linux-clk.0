Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BC833B6CB;
	Thu, 20 Nov 2025 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644569; cv=none; b=OBSVMgRvU5XtATcxFIObiCt/1mTv6jhgFCqZtvQ8U1q2By3hLuaEI7bH1rW2hdoZyVShq5BR+KFBYK875TySgbLYhiB+fY7E3NOBP5Evl3PGn4iEKmhTvaO6ndSJo1IDpkSwpOxAVr8XqeWDt0MtU+cbCxYxCD/LTp0MCxDZUp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644569; c=relaxed/simple;
	bh=K+u3wqp+9anVmEDTeLD4NstpSo/avmelycIC6VjG2V4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VoTaACb9eZC68bCG/25jGtwWeo7NVZ1EHIaR6wSz2R9vHZoXs+nIyREFKRUYH7vYwwWw5Z83H6C2bVg0Va5HE9xtwQPRTZyRouklPkWCDAdzz42G/X2u7DmhJJixpXPuByRQIFhcrJHrC9wavbMj9F3RScz2ODVA6O2r2GOqu40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=DXCzUbRx; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="DXCzUbRx"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 93CFB20B50;
	Thu, 20 Nov 2025 14:16:06 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YS_O_oScmD3k; Thu, 20 Nov 2025 14:16:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644566; bh=K+u3wqp+9anVmEDTeLD4NstpSo/avmelycIC6VjG2V4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DXCzUbRxsucs7j/08kFZ02NPaYb5vj43V/IJ5XiH/SmhhZFsLSHAR42SBVsOTsU6h
	 BvAOep9lch7VTEiuw9EsB6ceARucg5vSQFzmW3oHNmUC28h7f+1b74VCfOcZIVkH9p
	 JHORoZQgsTp9Pu/9CJACbSUSRLSDpTTXjcorF6j7t8sVVPezZS8EERZ1ECCUSQuJW2
	 RJi5Z64FlrqTP450pIdOLTKJkxP3UWJ0iCxI7yzm4pGkm3cH5OprBWzATcCoV7Msuc
	 KSOff/Z063NpXIWE6HdRCTqxO+dvtd5EUIULALVeqvWP1EgA01sE9ZfVIjCA+m5IS9
	 p5+d3fIBq+QRQ==
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
Subject: [PATCH 5/7] clk: thead: th1520-ap: Add macro to define multiplexers with flags
Date: Thu, 20 Nov 2025 13:14:14 +0000
Message-ID: <20251120131416.26236-6-ziyao@disroot.org>
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>
References: <20251120131416.26236-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new macro, TH_CCU_MUX_FLAGS, extends TH_CCU_MUX macro by adding two
parameters to specify clock flags and multiplexer flags.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/thead/clk-th1520-ap.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index bf8e80c39a9e..79f001a047b2 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -101,17 +101,22 @@ struct ccu_pll {
 		.flags	= _flags,					\
 	}
 
-#define TH_CCU_MUX(_name, _parents, _shift, _width)			\
+#define TH_CCU_MUX_FLAGS(_name, _parents, _shift, _width, _flags,	\
+			 _mux_flags)					\
 	{								\
 		.mask		= GENMASK(_width - 1, 0),		\
 		.shift		= _shift,				\
+		.flags		= _mux_flags,				\
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA(		\
 					_name,				\
 					_parents,			\
 					&clk_mux_ops,			\
-					0),				\
+					_flags),			\
 	}
 
+#define TH_CCU_MUX(_name, _parents, _shift, _width)			\
+	TH_CCU_MUX_FLAGS(_name, _parents, _shift, _width, 0, 0)
+
 #define CCU_GATE(_clkid, _struct, _name, _parent, _reg, _bit, _flags)	\
 	struct ccu_gate _struct = {					\
 		.clkid	= _clkid,					\
-- 
2.51.2

